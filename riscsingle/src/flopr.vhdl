----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
-- Registrador de 32 bits com borda de subida e reset assíncrono.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flopr is
  port (
    d : in std_logic_vector (31 downto 0);
    q : out std_logic_vector (31 downto 0);
    clk, reset : in std_logic
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