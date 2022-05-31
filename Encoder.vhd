----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:28 01/12/2022 
-- Design Name: 
-- Module Name:    Encoder - Behavioral 
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

entity Encoder is
    Port ( Input : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end Encoder;

architecture Behavioral of Encoder is

begin

	Output <= "000" when Input = "00000001" else
				 "001" when Input = "00000010" else
				 "010" when Input = "00000100" else
				 "011" when Input = "00001000" else
				 "100" when Input = "00010000" else
				 "101" when Input = "00100000" else
				 "110" when Input = "01000000" else
				 "111" when Input = "10000000";

end Behavioral;

