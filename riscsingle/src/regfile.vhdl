----------------------------
-- Author: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- Last modified: 2024-10-29
--
--
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.all;

entity regfile is
  generic(
    Width : integer := 32
  );
  port(
    clk : in std_logic;
    we : in std_logic;
    a1, a2, a3 : in std_logic_vector(4 downto 0);
    wd : in std_logic_vector(Width-1 downto 0);
    rd1, rd2 : out std_logic_vector(Width-1 downto 0)
  );
end regfile;