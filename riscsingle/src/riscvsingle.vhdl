----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- 
-- Description:
-- This component is the single core of the RISC-V processor.
-- It includes the following components:
-- - controller: Main control decoder
-- - datapath: Data path of the RISC-V processor
--
-- Last Modified: 2024-11-21
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.all;

entity riscvsingle is
  generic(
    Width : integer := 32
  );
  port (
    clk, reset: in std_logic;
    PC: out std_logic_vector(Width-1 downto 0);
    Instr: in std_logic_vector(Width-1 downto 0);
    MemWrite: out std_logic;
    ALUResult, WriteData: out std_logic_vector(Width-1 downto 0);
    ReadData: in std_logic_vector(Width-1 downto 0)
  ) ;
end riscvsingle;

architecture behavioral of riscvsingle is
  signal zero, pcsrc, alusrc, regwrite : std_logic;
  signal resultsrc, immsrc : std_logic_vector(1 downto 0);
  signal alucontrol : std_logic_vector(2 downto 0);

begin
  c : controller port map (
    opcode => Instr(6 downto 0),
    funct3 => Instr(14 downto 12),
    funct7b5 => Instr(30),
    zero => zero,

    pcsrc => pcsrc,
    memwrite => MemWrite,
    resultsrc => resultsrc,
    alusrc => alusrc,
    immsrc => immsrc,
    regwrite => regwrite,
    alucontrol => alucontrol
  );

  dp : datapath generic map(Width) port map (
    clk => clk,
    reset => reset,
    resultsrc => resultsrc,
    pcsrc => pcsrc,
    alusrc => alusrc,
    regwrite => regwrite,
    immsrc => immsrc,
    alucontrol => alucontrol,
    instr => Instr,
    readdata => ReadData,

    aluresult => ALUResult,
    pc => PC,
    writedata => WriteData,

    zero => zero
  );
end behavioral;
