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

entity top is
  generic(
    Width : integer := 32
  );
  port(
    clk, reset : in std_logic;
    WriteData, DataAdr : buffer std_logic_vector(31 downto 0);
    MemWrite : buffer std_logic 
  );
end top;

architecture test of top is
  signal PC, Instr, ReadData : std_logic_vector(31 downto 0);
begin
  -- instantiate processor and memories
	rvsingle: riscvsingle generic map(Width) 
    port map(
      clk => clk, 
      reset => reset, 
      PC => PC, 
      Instr => Instr, 
      MemWrite => MemWrite, 
      ALUResult => DataAdr, 
      WriteData => WriteData, 
      ReadData => ReadData
    );

   
  imem1: imem port map(
    a => PC, 
    rd => Instr
  );

  dmem1: dmem port map( 
    clk => clk, 
    we => MemWrite, 
    a => DataAdr, 
    wd => WriteData, 
    rd => ReadData
  );
end;