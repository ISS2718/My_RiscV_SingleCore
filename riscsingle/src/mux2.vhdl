----------------------------
--Author Isaac Santos Soares
--nUSP 12751713
--
--Copyright (c) 2024 Isaac Soares
--Licensed under the MIT License
--Last modified: 2023-10-05
--
--A simple two-input multiplexer: d0; d1, with a selector switch s.
--If s = 0, the output y is equal to d0, otherwise, y is equal to d1.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
  port (
    d0, d1 : in std_logic_vector (31 downto 0);
    s : in std_logic;
    y : out std_logic_vector (31 downto 0)
  ) ;
end mux2;

architecture behavioral of mux2 is
begin 
  y <= d0 when s = '0' else d1;
end behavioral;