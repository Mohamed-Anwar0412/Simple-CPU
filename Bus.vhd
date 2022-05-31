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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bus is
	port ( I1 : in STD_LOGIC_VECTOR(7 downto 0);
			 I2 : in STD_LOGIC_VECTOR(7 downto 0);
			 I3 : in STD_LOGIC_VECTOR(7 downto 0);
			 I4 : in STD_LOGIC_VECTOR(7 downto 0);
			 I5 : in STD_LOGIC_VECTOR(7 downto 0);
			 I6 : in STD_LOGIC_VECTOR(7 downto 0);
			 I7 : in STD_LOGIC_VECTOR(7 downto 0);
			 Bus_out : out STD_LOGIC_VECTOR(7 downto 0);
			 Bus_select : in STD_LOGIC_VECTOR (2 downto 0));
end Bus;

architecture Behavioral of Bus is

begin

	Bus_out <= I1 when (Bus_select = "001") else
				  I2 when (Bus_select = "010") else
				  I3 when (Bus_select = "011") else
				  I4 when (Bus_select = "100") else
				  I5 when (Bus_select = "101") else
				  I6 when (Bus_select = "110") else
				  I7 when (Bus_select = "111") else
				  'Z';

end Behavioral;

