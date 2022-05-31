--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:53:10 01/19/2022
-- Design Name:   
-- Module Name:   D:/vhdl/project/Simple_CPU/Test_Bench.vhd
-- Project Name:  Simple_CPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Main_Module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_Bench IS
END Test_Bench;
 
ARCHITECTURE behavior OF Test_Bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Main_Module
    PORT(
         clk : IN  std_logic;
         Start : IN  std_logic;
         PCout : OUT  std_logic_vector(5 downto 0);
         ARout : OUT  std_logic_vector(5 downto 0);
         DRout : OUT  std_logic_vector(7 downto 0);
         ACout : OUT  std_logic_vector(7 downto 0);
         IRout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Start : std_logic := '0';

 	--Outputs
   signal PCout : std_logic_vector(5 downto 0);
   signal ARout : std_logic_vector(5 downto 0);
   signal DRout : std_logic_vector(7 downto 0);
   signal ACout : std_logic_vector(7 downto 0);
   signal IRout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Main_Module PORT MAP (
          clk => clk,
          Start => Start,
          PCout => PCout,
          ARout => ARout,
          DRout => DRout,
          ACout => ACout,
          IRout => IRout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		Start <= '1';
		
		wait for clk_period;
		
		Start <= '0';

      wait;
   end process;

END;
