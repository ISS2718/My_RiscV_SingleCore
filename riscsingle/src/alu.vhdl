----------------------------
-- Author: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- Last modified: 2024-10-29
--
-- This VHDL module defines a parameterizable Arithmetic Logic Unit (ALU).
-- The ALU performs a variety of arithmetic and logical operations based on 
-- the provided opcode. Supported operations include AND, OR, ADD, SUB, and 
-- SLT (Set Less Than). The module outputs the result of the operation and 
-- a zero flag indicating if the result is zero.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.all;

entity alu is
  generic(
    Width : integer := 32
  );
  port(
    a : in std_logic_vector(Width-1 downto 0);
    b : in std_logic_vector(Width-1 downto 0);
    alucontrol : in std_logic_vector(2 downto 0);
    result : out std_logic_vector(Width-1 downto 0);
    zero : out std_logic
  );
end alu;

architecture behavioral of alu is
  signal res : std_logic_vector(Width-1 downto 0);
begin
  with alucontrol select
    res <=
      a + b when "000",
      a - b when "001",
      a AND b when "010",
      a OR b when "011",
      a < b when "101",
      (others => '0') when others;

  result <= res;
  zero <= nor_reduce(res);
end behavioral;