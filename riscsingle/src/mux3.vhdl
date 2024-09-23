----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Um multiplixador simples de três entradas: d0, d1 e d2, com uma chave seletrora s.
--Se s = "00", a saída y é igual a d0.
--Se s = "01", a saída y é igual a d1.
--Se s = "10", a saída y é igual a d2.
--Caso contrário, y é igual a 0.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3 is
  port (
    d0, d1, d2 : in std_logic;
    s : in std_logic_vector (0 to 1);
    y : out std_logic
  ) ;
end mux3;
architecture behavioral of mux3 is
begin 
  with s select
    y <= d0 when "00",
         d1 when "01",
         d2 when "10",
         '0' when others;
end behavioral;