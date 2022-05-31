----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:30 01/12/2022 
-- Design Name: 
-- Module Name:    Dec_3_8 - Behavioral 
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

entity Dec_3_8 is
    Port ( Input : in  STD_LOGIC_VECTOR (2 downto 0);
           Output : out  STD_LOGIC_VECTOR (7 downto 0));
end Dec_3_8;

architecture Behavioral of Dec_3_8 is

begin

	Output <= "00000001" when Input = "000" else
				 "00000010" when Input = "001" else
				 "00000100" when Input = "010" else
				 "00001000" when Input = "011" else
				 "00010000" when Input = "100" else
				 "00100000" when Input = "101" else
				 "01000000" when Input = "110" else
				 "10000000" when Input = "111";

end Behavioral;

