----------------------------
-- Authors: Isaac Santos Soares; Guilherme Mendonca Gregorio; Mateus Santos Messias
-- nUSP: 12751713; 12688511; 12548000
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- Last modified: 2024-11-05
--
--  Register file with 32 registers, each 32 bits wide.
--  Two read ports and one write port.
--  Write port enabled by 'we'.
--  Read ports addressed by 'a1' and 'a2'.
--  Write port addressed by 'a3'.
--  Write data provided by 'wd'.
--  Read data output on 'rd1' and 'rd2'.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.ALL;

entity regfile is
  generic(
    Width : integer := 32  -- Register width
  );
  port(
    clk : in std_logic;  -- Clock signal
    we : in std_logic;  -- Write enable signal
    a1, a2, a3 : in std_logic_vector(4 downto 0);  -- Register addresses
    wd : in std_logic_vector(Width-1 downto 0);  -- Write data
    rd1, rd2 : out std_logic_vector(Width-1 downto 0)  -- Read data
  );
end regfile;

architecture behavioral of regfile is
  type reg_array is array (0 to 31) of std_logic_vector(Width-1 downto 0);  -- 32 registers array
  signal reg_data : reg_array := (others => (others => '0'));  -- Signal for write data
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if we = '1' then  -- Check if write is enabled
        reg_data(to_integer(a3)) <= wd;  -- Capture write data
      end if;
    end if;
  end process;

  rd1 <= reg_data(to_integer(a1));  -- Read from register a1
  rd2 <= reg_data(to_integer(a2));  -- Read from register a2
end behavioral;