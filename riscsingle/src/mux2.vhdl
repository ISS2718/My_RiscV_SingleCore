----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Um multiplixador simples de duas entradas, d0 e d1, com uma chave seletrora s.
--Se s = 0, a saída y é igual a d0, caso contrário, y é igual a d1.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
  port (
    d0, d1, s : in std_logic;
    y : out std_logic
  ) ;
end mux2;
architecture behavioral of mux2 is
begin 
  y <= d0 when s = '0' else d1;
end behavioral;