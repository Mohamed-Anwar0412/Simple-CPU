--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

package PACK is

component reg is
	 Generic (n : NATURAL := 8);
    Port ( I : in  STD_LOGIC_VECTOR (n-1 downto 0);
           clk : in  STD_LOGIC;
           L : in  STD_LOGIC;
           INC : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component C_Bus is
	port ( I1 : in STD_LOGIC_VECTOR(5 downto 0);
			 I2 : in STD_LOGIC_VECTOR(5 downto 0);
			 I3 : in STD_LOGIC_VECTOR(7 downto 0);
			 I4 : in STD_LOGIC_VECTOR(7 downto 0);
			 I5 : in STD_LOGIC_VECTOR(7 downto 0);
			 I7 : in STD_LOGIC_VECTOR(7 downto 0);
			 Bus_out : out STD_LOGIC_VECTOR(7 downto 0);
			 Bus_select : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component ALU is
    Port ( DR : in  STD_LOGIC_VECTOR (7 downto 0);
           AC : in  STD_LOGIC_VECTOR (7 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Encoder is
    Port ( Input : in  STD_LOGIC_VECTOR (7 downto 0);
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component Dec_2_4 is
    Port ( Input : in  STD_LOGIC_VECTOR (1 downto 0);
           Output : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Dec_3_8 is
    Port ( Input : in  STD_LOGIC_VECTOR (2 downto 0);
           Output : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component SC is
    Port ( clk : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           INC : in  STD_LOGIC;
           Output : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component Control_Unit is
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
end component;

end PACK;

package body PACK is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end PACK;
