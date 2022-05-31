----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:24 01/11/2022 
-- Design Name: 
-- Module Name:    Bus - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity C_Bus is
	port ( I1 : in STD_LOGIC_VECTOR(5 downto 0);
			 I2 : in STD_LOGIC_VECTOR(5 downto 0);
			 I3 : in STD_LOGIC_VECTOR(7 downto 0);
			 I4 : in STD_LOGIC_VECTOR(7 downto 0);
			 I5 : in STD_LOGIC_VECTOR(7 downto 0);
			 I7 : in STD_LOGIC_VECTOR(7 downto 0);
			 Bus_out : out STD_LOGIC_VECTOR(7 downto 0);
			 Bus_select : in STD_LOGIC_VECTOR (2 downto 0));
end C_Bus;

architecture Behavioral of C_Bus is

begin

process(Bus_select) is
begin
	if Bus_select = "001" then
		Bus_out(5 downto 0) <= I1;
		Bus_out(7 downto 6) <= "00";
	elsif Bus_select = "010" then
		Bus_out(5 downto 0) <= I2;
		Bus_out(7 downto 6) <= "00";
	elsif Bus_select = "011" then
		Bus_out <= I3;
	elsif Bus_select = "100" then
		Bus_out <= I4;
	elsif Bus_select = "101" then
		Bus_out <= I5;
	elsif Bus_select = "111" then
		Bus_out <= I7;
	end if;
end process;
end Behavioral;

