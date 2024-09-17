----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Multiplexador de 2 entradas

--Descrição:
--
--Um multiplixador simples de duas entradas, d0 e d1, com uma chave seletrora s.
--Se s = 0, a saída y é igual a d0, caso contrário, y é igual a d1.
--
----------------------------

entity mux2 is
  port (
    d0, d1, s : in bit;
    y : out bit
  ) ;
end mux2;
architecture behavioral of mux2 is
begin 
  y <= d0 when s = '0' else d1;
end behavioral;