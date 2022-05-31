----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:20:10 01/12/2022 
-- Design Name: 
-- Module Name:    SC - Behavioral 
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

entity SC is
    Port ( clk : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           INC : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end SC;

architecture Behavioral of SC is

signal Counter : STD_LOGIC_VECTOR (2 downto 0):="000";

begin

	process(clk,CLR,INC)
	begin
		if CLR = '1' then
			Counter <= (others => '0');
		elsif rising_edge(clk) then
			if INC = '1' then
				Counter <= Counter + 1;
			end if;
		end if;
	end process;
	Output <= Counter;
end Behavioral;

