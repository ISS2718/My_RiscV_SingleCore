----------------------------
--Autor Isaac Santos Soares
--nUSP 12751713
--
--Copyright (c) 2024 Isaac Soares
--Licenciado sob a Licença MIT
--Última modificação: 2023-10-05
--
--Um multiplixador simples de duas entradas: d0; d1, com uma chave seletrora s.
--Se s = 0, a saída y é igual a d0, caso contrário, y é igual a d1.
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