----------------------------
--Author Isaac Santos Soares
--nUSP 12751713
--
--Copyright (c) 2024 Isaac Soares
--Licensed under the MIT License
--Last modified: 2023-10-05
--
--A 32-bit four-input multiplexer: d0; d1; d2; d3, with a selector switch s.
--If s = "00", the output y is equal to d0.
--If s = "01", the output y is equal to d1.
--If s = "10", the output y is equal to d2.
--If s = "11", the output y is equal to d3.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4 is
  port (
    d0, d1, d2, d3 : in std_logic_vector (31 downto 0);
    s : in std_logic_vector (1 downto 0);
    y : out std_logic_vector (31 downto 0)
  ) ;
end mux4;
architecture behavioral of mux4 is
begin 
  with s select
    y <= d0 when "00",
         d1 when "01",
         d2 when "10",
         d3 when "11";
end behavioral;