----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
--
-- Description:
-- This file implements the data memory of the RISC-V processor.
-- The memory is a 64-word memory, with each word being 32 bits wide.
-- The memory is implemented as a VHDL process that reads and writes memory.
--
-- Last Modified: 2024-11-26
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.all;

entity dmem is
    port(
        clk, we: in std_logic;
        a, wd: in std_logic_vector(31 downto 0);
        rd: out std_logic_vector(31 downto 0)
    );
end dmem;

architecture behave of dmem is
begin
    process
        type ramtype is array (63 downto 0) of std_logic_vector(31 downto 0);
        variable mem: ramtype;
    begin
        -- read or write memory
        if rising_edge(clk) then
            if we = '1' then 
                mem(to_integer(a(7 downto 2))) := wd;
            end if;
            rd <= mem(to_integer(a(7 downto 2)));
        end if;
        wait until rising_edge(clk); -- aguarda até a próxima borda de subida do clock
    end process;
end behave;
