----------------------------
--Author Isaac Santos Soares
--nUSP 12751713
--
--Copyright (c) 2024 Isaac Soares
--Licensed under the MIT License
--Last modified: 2024-10-29
--
-- This VHDL module defines a parameterizable adder.
-- It takes two n-bit input vectors (a and b) and an input carry (c_in).
-- The module produces an n-bit sum output vector (y) and an output carry (c_out).
-- The bit-width of the adder is specified by the generic parameter Width, defaulting to 32 bits.
-- The module includes two architectures:
-- 1. Behavioral: Implements the adder using a generate statement for bit-wise addition and carry propagation.
-- 2. Efficient: Implements the adder using the LPM_ADD_SUB component for optimized addition.
--
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

LIBRARY lpm; 
USE lpm.lpm_components.lpm_add_sub;

entity adder is
  generic(
    Width : integer := 32
  );
  port(
    a : in std_logic_vector(Width-1 downto 0);
    b : in std_logic_vector(Width-1 downto 0);
    c_in : in std_logic;
    y : out std_logic_vector(Width-1 downto 0);
    c_out : out std_logic
  );
end adder;

architecture behavioral of adder is
  signal carry : std_logic_vector(Width downto 0);
begin
  carry(0) <= c_in;

  gen_adder: for i in 0 to Width-1 generate
    y(i) <= a(i) XOR b(i) XOR carry(i);
    carry(i+1) <= (a(i) AND b(i)) OR (a(i) AND carry(i)) OR (b(i) AND carry(i));
  end generate;

  c_out <= carry(Width);
end behavioral;

architecture efficient of adder is
  begin
    adder_inst: lpm_add_sub
    generic map (
      LPM_WIDTH => Width,
      LPM_DIRECTION => "ADD"
    )
    port map (
      dataa => a,
      datab => b,
      cin => c_in,
      result => y,
      cout => c_out
    );
end efficient;

configuration cfg_adder of adder is
  for behavioral
  end for;
end cfg_adder;