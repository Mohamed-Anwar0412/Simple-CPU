----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:13:38 01/12/2022 
-- Design Name: 
-- Module Name:    Dec_2_4 - Behavioral 
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

entity Dec_2_4 is
    Port ( Input : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end Dec_2_4;

architecture Behavioral of Dec_2_4 is

begin

	Output <= "0001" when Input = "00" else
				 "0010" when Input = "01" else
				 "0100" when Input = "10" else
				 "1000" when Input = "11";

end Behavioral;

