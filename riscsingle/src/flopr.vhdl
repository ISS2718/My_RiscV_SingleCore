----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Multiplexador de 2 entradas

-- Descrição:
--
-- Registrador de 32 bits com borda de subida e reset assíncrono.
--
----------------------------
entity flopr is
  port (
    d : in bit_vector (31 downto 0);
    q : out bit_vector (31 downto 0);
    clk, reset : in bit
  );
end flopr;
architecture behavioral of flopr is
begin 
  process(clk, reset)
  begin
    if reset = '1' then
      q <= (others => '0');
    elsif rising_edge(clk) then
      q <= d;
    end if;
  end process;
end behavioral;