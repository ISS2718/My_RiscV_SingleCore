----------------------------
--Author Isaac Santos Soares
--nUSP 12751713
--
--Copyright (c) 2024 Isaac Soares
--Licensed under the MIT License
--Last modified: 2023-10-05
--
--A 32-bit three-input multiplexer: d0; d1; d2, with a selector switch s.
--If s = "00", the output y is equal to d0.
--If s = "01", the output y is equal to d1.
--If s = "10", the output y is equal to d2.
--Otherwise, y is equal to 0.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3 is
  port (
    d0, d1, d2 : in std_logic_vector (31 downto 0);
    s : in std_logic_vector (1 downto 0);
    y : out std_logic_vector (31 downto 0)
  ) ;
end mux3;
architecture behavioral of mux3 is
begin 
  with s select
    y <= d0 when "00",
         d1 when "01",
         d2 when "10",
         (others => '0') when others;
end behavioral;