----------------------------
-- Authors: Isaac Santos Soares; Guilherme Mendonca Gregorio; Mateus Santos Messias
-- nUSP: 12751713; 12688511; 12548000
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- Last modified: 2024-11-05
-- 
--  Extends immediate values from RISC-V instructions.
--  Receives a 2-bit control signal 'immsrc' and a 32-bit instruction 'instr'.
--  Outputs a 32-bit immediate value 'immext'.
--  The control signal 'immsrc' selects the immediate value to be extended.
--  '00' extends the I-type immediate value.
--  '01' extends the S-type immediate value.
--  '10' extends the B-type immediate value.
--  '11' extends the J-type immediate value.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extend is
  port (
    immsrc : in std_logic_vector(1 downto 0);
    instr : in std_logic_vector(31 downto 7);
    immext : out std_logic_vector(31 downto 0)
  );
end entity extend;

architecture behavioral of extend is
  alias I_sign: std_logic is instr(31);
  alias I_imm: std_logic_vector(11 downto 0) is instr(31 downto 20);

  alias S_sign: std_logic is instr(31);

  alias B_sign: std_logic is instr(31);

  alias J_sign: std_logic is instr(31);
begin
  process(immsrc, instr)
    variable S_imm : std_logic_vector(11 downto 0);
    variable B_imm : std_logic_vector(11 downto 0);
    variable J_imm : std_logic_vector(19 downto 0);
  begin
    S_imm := instr(31 downto 25) & instr(11 downto 7);
    B_imm := instr(7) & instr(30 downto 25) & instr(11 downto 8) & '0';
    J_imm := instr(19 downto 12) & instr(20) & instr(30 downto 21) & '0';

    case immsrc is
      when "00" =>
        immext <= (31 downto 12 => I_sign) & I_imm;
      when "01" =>
        immext <= (31 downto 12 => S_sign) & S_imm;
      when "10" =>
        immext <= (31 downto 12 => B_sign) & B_imm;
      when "11" =>
        immext <= (31 downto 20 => J_sign) & J_imm;
      when others =>
        immext <= (others => '0');
    end case;
  end process;
end behavioral;
