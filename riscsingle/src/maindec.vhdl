----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- 
-- Description:
-- This module decodes the main control signals based on the opcode field
-- of the RISC-V instruction. The control signals are output as a 1-bit signal
-- or a 2-bit signal.
--
-- Last Modified: 2024-11-12
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maindec is
  port (
    opcode : in std_logic_vector(6 downto 0);
    aluop, immsrc, resultsrc : out std_logic_vector(1 downto 0);
    alusrc, branch, jump, memwrite, regwrite : out std_logic
  );
end maindec;

architecture behavioral of maindec is
begin
  process(opcode)
  begin
      case opcode is
        when "0000011" => -- LOAD lw
          regwrite <= '1';
          immsrc <= "00";
          alusrc <= '1';
          memwrite <= '0';
          resultsrc <= "01";
          branch <= '0';
          aluop <= "00";
          jump <= '0';
        when "0100011" => -- STORE sw
          regwrite <= '0';
          immsrc <= "01";
          alusrc <= '1';
          memwrite <= '1';
          resultsrc <= "XX";
          branch <= '0';
          aluop <= "00";
          jump <= '0';
        when "0110011" => -- R-type
          regwrite <= '1';
          immsrc <= "XX";
          alusrc <= '0';
          memwrite <= '0';
          resultsrc <= "00";
          branch <= '0';
          aluop <= "10";
          jump <= '0';
        when "1100011" => -- beq
          regwrite <= '0';
          immsrc <= "10";
          alusrc <= '0';
          memwrite <= '0';
          resultsrc <= "XX";
          branch <= '1';
          aluop <= "01";
          jump <= '0';
        when "0010011" => -- I-type ALU
          regwrite <= '1';
          immsrc <= "00";
          alusrc <= '1';
          memwrite <= '0';
          resultsrc <= "00";
          branch <= '0';
          aluop <= "10";
          jump <= '0';
        when "1101111" => -- JAL
          regwrite <= '1';
          immsrc <= "11";
          alusrc <= 'X';
          memwrite <= '0';
          resultsrc <= "10";
          branch <= '0';
          aluop <= "XX";
          jump <= '1';
        when others => -- NOP
          regwrite <= '0';
          immsrc <= "XX";
          alusrc <= 'X';
          memwrite <= '0';
          resultsrc <= "XX";
          branch <= 'X';
          aluop <= "XX";
          jump <= 'X';
      end case;
  end process;
end behavioral;