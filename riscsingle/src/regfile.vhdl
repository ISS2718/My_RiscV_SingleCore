----------------------------
-- Authores: Isaac Santos Soares; Guilherme Mendonca Gregorio; Mateus Santos Messias
-- nUSP: 12751713; 12688511; 
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
use work.riscv_pkg.all;

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
  signal read_data : reg_array := (others => (others => '0'));  -- Initialize registers to zero
  signal write_data : reg_array := (others => (others => '0'));  -- Signal for write data
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if we = '1' then  -- Check if write is enabled
        write_data(to_integer(a3)) <= wd;  -- Capture write data
      else
        for i in 0 to Width-1 loop
          write_data(i) <= read_data(i);
        end loop;
      end if;
    end if;
  end process;

  -- Generate flip-flops for each register
  gen_flopr: for i in 0 to 31 generate
    flopr_inst: entity work.flopr
      generic map (Width => Width)
      port map (
        d => write_data(i),  -- Flip-flop input data
        q => read_data(i),  -- Flip-flop output data
        clk => clk,  -- Clock signal
        reset => '0'  -- Reset signal (assumed unused)
      );
  end generate gen_flopr;

  rd1 <= read_data(to_integer(a1));  -- Read from register a1
  rd2 <= read_data(to_integer(a2));  -- Read from register a2
end behavioral;