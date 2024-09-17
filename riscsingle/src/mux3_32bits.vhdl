----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Multiplexador de 2 entradas

--Descrição:
--
--Um multiplixador de 32bits de três entradas: d0, d1 e d2, com uma chave seletrora s.
--Se s = "00", a saída y é igual a d0.
--Se s = "01", a saída y é igual a d1.
--Se s = "10", a saída y é igual a d2.
--Caso contrário, y é igual a 0.
--
----------------------------

entity mux3_32bits is
  port (
    d0, d1, d2 : in bit_vector (31 downto 0);
    s : in bit_vector (0 to 1);
    y : out bit_vector (31 downto 0)
  ) ;
end mux3_32bits;
architecture behavioral of mux3_32bits is
begin 
  with s select
    y <= d0 when "00",
         d1 when "01",
         d2 when "10",
         (others => '0') when others;
end behavioral;