----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
--
-- Description:
-- This file implements the instruction memory of the RISC-V processor.
-- The memory is initialized from a file named "riscvtest.txt" in the "src" directory.
-- The memory is a 64-word memory, with each word being 32 bits wide.
--
-- Last Modified: 2024-11-26
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
use STD.TEXTIO.ALL;
use work.riscv_pkg.all;

entity imem is
    port(
        a: in std_logic_vector(31 downto 0);
        rd: out std_logic_vector(31 downto 0)
    );
end imem;

architecture behave of imem is
    type ramtype is array (63 downto 0) of std_logic_vector(31 downto 0);
    -- initialize memory from file
    impure function init_ram_hex return ramtype is
        file text_file : text open read_mode is "../src/riscvtest.txt";
        variable text_line : line;
        variable ram_content : ramtype;
        variable i : integer := 0;
    begin
        for i in 0 to 63 loop -- set all contents low
            ram_content(i) := (others => '0');
        end loop;
        
        while not endfile(text_file) loop -- set contents from file
            readline(text_file, text_line);
            if i <= 63 then
                hread(text_line, ram_content(i));
                i := i + 1;
            else
                exit; -- exit the loop if index is out of bounds
            end if;
        end loop;
        
        return ram_content;
    end function;

    signal mem : ramtype := init_ram_hex;
begin
    -- read memory
    process(a)
    begin
        if to_integer(a(31 downto 2)) <= 63 then
            rd <= mem(to_integer(a(31 downto 2)));
        else
            rd <= (others => '0'); -- default value if address is out of bounds
        end if;
    end process;
end behave;
