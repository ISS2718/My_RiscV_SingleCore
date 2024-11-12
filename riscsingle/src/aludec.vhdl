----------------------------
-- Authors: Isaac Santos Soares; Guilherme Mendonca Gregorio; Mateus Santos Messias
-- nUSP: 12751713; 12688511; 12548000
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- 
-- Description:
-- This module decodes the ALU operation based on the opcode and funct3 fields
-- of the RISC-V instruction. The ALU operation is output as a 3-bit signal.
--
-- Last Modified: 2024-11-12
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aludec is
  port (
    aluop : in std_logic_vector(1 downto 0);
    opb5 : in std_logic;
    funct3 : in std_logic_vector(2 downto 0);
    funct7b5 : in std_logic;
    ALUControl : out std_logic_vector(2 downto 0)
  );
end entity aludec;

architecture behavioral of aludec is
  signal opb5_funct7b5 : std_logic_vector(1 downto 0);
begin
  opb5_funct7b5 <= opb5 & funct7b5;

  process(aluop, funct3, opb5_funct7b5)
  begin
    case aluop is
      when "00" =>
        ALUControl <= "000"; -- ADD
      when "01" =>
        ALUControl <= "001"; -- SUB
      when "10" =>
        case funct3 is
          when "000" =>
            case opb5_funct7b5 is
              when "11" =>
                ALUControl <= "001"; -- SUB
              when others =>
                ALUControl <= "000"; -- ADD
            end case;
          when "010" =>
            ALUControl <= "101"; -- SLT
          when "110" =>
            ALUControl <= "011"; -- OR
          when "111" =>
            ALUControl <= "010"; -- AND
          when others =>
            ALUControl <= "111"; -- ZERO
        end case;
      when others =>
        ALUControl <= "111"; -- ZERO
    end case;
  end process;
end behavioral;