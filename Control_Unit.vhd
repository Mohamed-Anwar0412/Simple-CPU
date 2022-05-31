----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:27 01/12/2022 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_Unit is
    Port ( IR : in  STD_LOGIC_VECTOR (7 downto 0);
           T : in  STD_LOGIC_VECTOR (7 downto 0);
			  Addr : in STD_LOGIC_VECTOR (5 downto 0);
			  Start : in STD_LOGIC;
			  ALU_OP : out STD_LOGIC_VECTOR (2 downto 0);
			  Bus_Enc : out STD_LOGIC_VECTOR (2 downto 0);
			  Load : out STD_LOGIC_VECTOR (4 downto 0); --PC,AR,DR,AC,IR
			  CLR : out STD_LOGIC_VECTOR (5 downto 0); --PC,AR,DR,AC,IR,SC
			  INC : out STD_LOGIC_VECTOR (5 downto 0); --PC,AR,DR,AC,IR,SC
			  mem_read : out STD_LOGIC;
			  mem_write : out STD_LOGIC );
end Control_Unit;

architecture Behavioral of Control_Unit is
signal D : STD_LOGIC_VECTOR (3 downto 0);
signal SC : STD_LOGIC:= '0';
begin
	
	
	reset_process: process(Start,SC) is
	begin
		if Start = '0' or SC = '1' then
			CLR(5) <= '1';
		else
			CLR(5) <= '0';
		end if;
		if Start = '0' then
			CLR(0) <= '1';
		else
			CLR(0) <= '0';
		end if;
	end process;
	
	Control_process: process(D,T) is
	begin
		if T(0) = '1' then
			SC <= '0';
			CLR <= (others => '0');
			Load <= (others => '0');
			INC <= (others => '0');
			INC(5) <= '1';
			Bus_Enc <= "010";
			Load(1) <= '1';
		elsif T(1) = '1' then
			CLR <= (others => '0');
			Load <= (others => '0');
			INC <= (others => '0');
			INC(5) <= '1';
			mem_read <= '1';
			Bus_Enc <= "111";
			Load(4) <= '1';
			INC(0) <= '1';
		elsif T(2) = '1' then
			CLR <= (others => '0');
			Load <= (others => '0');
			INC <= (others => '0');
			INC(5) <= '1';
			 if IR(7 downto 6) = "00" then
					D <= "0001";
			 elsif IR(7 downto 6) = "01" then
				   D <= "0010";
			 elsif IR(7 downto 6) = "10" then
					D <= "0100";
			 elsif IR(7 downto 6) = "11" then
					D <= "1000";
			 end if;
			Bus_Enc <= "101";
			Load(1) <= '1';
		elsif T(3) = '1' then
			CLR <= (others => '0');
			Load <= (others => '0');
			INC <= (others => '0');
			INC(5) <= '1';
			if D(0) <= '1' or D(1) = '1' then
				mem_read <= '1';
				Bus_Enc <= "111";
				Load(2) <= '1';
			elsif D(2) = '1' then
				Bus_Enc <= "001";
				Load(0) <= '1';
				SC <= '1';
			elsif D(3) = '1' then
				if IR(0) = '1' and IR(1) = '0' then
					INC(3) <= '1';
					SC <= '1';
				elsif IR(0) = '0' and IR(1) = '1' then
					ALU_OP <= "100";
					Load(3) <= '1';
					SC <= '1';
				end if;
			end if;
		elsif T(4) = '1' then
			CLR <= (others => '0');
			Load <= (others => '0');
			INC <= (others => '0');
			INC(5) <= '1';
			if D(0) = '1' then 
				ALU_OP <= "001";
				Load(3) <= '1';
				SC <= '1';
			elsif D(1) = '1' then
				ALU_op <= "010";
				Load(3) <= '1';
				SC <= '1';
			end if;
		end if;
	end process;
	
end Behavioral;

