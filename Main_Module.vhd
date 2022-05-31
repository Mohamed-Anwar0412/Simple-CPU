----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:09 01/12/2022 
-- Design Name: 
-- Module Name:    Main_Module - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;
use work.PACK.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_Module is
    Port ( clk : in  STD_LOGIC;
			  Start : in STD_LOGIC;
			  PCout : out STD_LOGIC_VECTOR (5 downto 0);
			  ARout : out STD_LOGIC_VECTOR (5 downto 0);
			  DRout : out STD_LOGIC_VECTOR (7 downto 0);
			  ACout : out STD_LOGIC_VECTOR (7 downto 0);
			  IRout : out STD_LOGIC_VECTOR (7 downto 0)
			);
end Main_Module;

architecture Behavioral of Main_Module is

signal  mem_read : STD_LOGIC;
signal  mem_write : STD_LOGIC;
signal  mem_data : STD_LOGIC_VECTOR (7 downto 0);
signal  Bus_out : STD_LOGIC_VECTOR (7 downto 0);
signal  SBus_out : STD_LOGIC_VECTOR (5 downto 0);

signal  ALU_OP : STD_LOGIC_VECTOR (2 downto 0);
signal  Bus_Enc : STD_LOGIC_VECTOR (2 downto 0);
signal  Load : STD_LOGIC_VECTOR (4 downto 0); --PC,AR,DR,AC,IR
signal  CLR : STD_LOGIC_VECTOR (5 downto 0); --PC,AR,DR,AC,IR,SC
signal  INC : STD_LOGIC_VECTOR (5 downto 0); --PC,AR,DR,AC,IR,SC

signal  Scounter : STD_LOGIC_VECTOR (2 downto 0);
signal  timing : STD_LOGIC_VECTOR (7 downto 0);			  
type Mem_type is array ( 0 to 2 ** 6 - 1 ) of STD_LOGIC_VECTOR ( 7 downto 0 );

signal PCin : STD_LOGIC_VECTOR (5 downto 0):=(others => '0');
signal ARin : STD_LOGIC_VECTOR (5 downto 0):=(others => '0');
signal DRin : STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
signal ACin : STD_LOGIC_VECTOR (7 downto 0):=(others => '0');
signal IRin : STD_LOGIC_VECTOR (7 downto 0):=(others => '0');

begin

Mem_process: process(mem_read,mem_write) is
variable memory : Mem_type := (others => (others => 'U'));
begin

memory(0) := "00000001";
memory(1) := "01000100";
memory(2) := "10000001";
memory(3) := "11000001";
memory(4) := "11000010";
--memory(5) <= "00000001";
--memory(6) <= "00000001";
--memory(7) <= "00000001";
if mem_read = '1' and mem_write = '0' then
	mem_data <= memory(conv_integer(ARin));
elsif mem_read = '0' and mem_write = '1' then
	memory(conv_integer(ARin)) := mem_data;
end if;

end process;

Counter : SC port map (clk, CLR(5), INC(5), Scounter);

Dec: Dec_3_8 port map (Scounter,Timing);

ArithU : ALU port map (DRin,ACin,ALU_OP,ACin);

Control : Control_Unit port map (IRin,Timing,ARin,Start,ALU_OP,Bus_Enc,Load,CLR,INC,mem_read,mem_write);

CoBUS : C_Bus port map (ARin,PCin,DRin,ACin,IRin,mem_data,Bus_out,Bus_Enc);

SBus_out <= Bus_out (5 downto 0);

PC : reg Generic map (6) port map (SBus_out,clk,Load(0),INC(0),CLR(0),PCin);
AR : reg Generic map (6) port map (SBus_out,clk,Load(1),INC(1),CLR(1),ARin);
DR : reg Generic map (8) port map (Bus_out,clk,Load(2),INC(2),CLR(2),DRin);
AC : reg Generic map (8) port map (Bus_out,clk,Load(3),INC(3),CLR(3),ACin);
IR : reg Generic map (8) port map (Bus_out,clk,Load(4),INC(4),CLR(4),IRin);

PCout <= PCin;
ARout <= ARin;
DRout <= DRin;
ACout <= ACin;
IRout <= IRin;

end Behavioral;

