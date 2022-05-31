----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:34:53 12/07/2021 
-- Design Name: 
-- Module Name:    reg - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
	 Generic (n : NATURAL := 8);
    Port ( I : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           L : in  STD_LOGIC;
           INC : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (n-1 downto 0));
end reg;

architecture Behavioral of reg is
signal temp : STD_LOGIC_vector (n-1 downto 0);
begin
process (clk)
begin
	if(clk'EVENT AND clk = '1')then
		if(L = '1')then
			temp <= I;
		elsif(INC = '1')then
			temp <= temp + 1;
		elsif(CLR = '1')then
			temp <= (others => '0');
		end if;
	end if;
end process;
O <= temp;
end Behavioral;

