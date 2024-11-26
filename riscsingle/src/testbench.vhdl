----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
--
-- Last Modified: 2024-11-26
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.all;

entity testbench is
end;

architecture test of testbench is	
	signal WriteData, DataAdr: std_logic_vector(31 downto 0);
	signal clk, reset, MemWrite: std_logic;
begin
	-- instantiate device to be tested
	dut: top port map(
		clk => clk, 
		reset => reset, 
		WriteData => WriteData, 
		DataAdr => DataAdr, 
		MemWrite => MemWrite
	);
	
	-- Generate clock with 10 ns period
	process begin
		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;
	end process;
	
	-- Generate reset for first two clock cycles
	process begin
		reset <= '1';
		wait for 22 ns;
		reset <= '0';
		wait;
	end process;
	
	-- check that 25 gets written to address 100 at end of program
	process(clk) begin
		if(clk'event and clk = '0' and MemWrite = '1') then
			if( to_integer(DataAdr) = 100 and
				to_integer(writedata) = 25) then
				report "NO ERRORS: Simulation succeeded" severity
				failure;
			elsif (to_integer(DataAdr) /= 96) then
				report "Simulation failed" severity failure;
			end if;
		end if;
	end process;
end;