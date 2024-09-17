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

entity mux2_32bits is
  port (
    d0, d1 : in bit_vector (31 downto 0);
    s : in bit;
    y : out bit_vector (31 downto 0)
  ) ;
end mux2_32bits;
architecture behavioral of mux2_32bits is
begin 
  y <= d0 when s = '0' else d1;
end behavioral;