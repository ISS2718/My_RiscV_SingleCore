----------------------------
-- Authors: Isaac Santos Soares; Guilherme Mendonca Gregorio; Mateus Santos Messias
-- nUSP: 12751713; 12688511; 12548000
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- 
-- Description:
-- This package includes the following components:
-- - mux2: 2-input multiplexer
-- - mux3: 3-input multiplexer
-- - flopr: Flip-flop with reset
-- - adder: Adder
-- - alu: Arithmetic Logic Unit (ALU)
-- - regfile: Register file
-- - extend: Extends immediate values from RISC-V instructions
-- - aludec: ALU control decoder
-- - maindec: Main control decoder
-- - datapath: Data path of the RISC-V processor
--
-- This package includes the following functions:
-- - "+" (addition)
-- - "-" (subtraction)
-- - "<" (less than comparison)
-- - nor_reduce (NOR reduction)
-- - to_integer (conversion to integer)
--
-- Last Modified: 2024-11-12
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Package riscv_pkg that contains constants, components, and functions
package riscv_pkg is
  -- Constant that defines the data width of RISC-V
  constant RISCV_Data_Width : integer := 32;

  -- Component mux2: 2-input multiplexer
  component mux2 is
    generic(
      Width : integer := RISCV_Data_Width  -- Data width
    );
    port (
      d0, d1 : in std_logic_vector (Width-1 downto 0);  -- Data inputs
      s : in std_logic;  -- Selection signal
      y : out std_logic_vector (Width-1 downto 0)  -- Data output
    );
  end component;

  -- Component mux3: 3-input multiplexer
  component mux3 is
    generic(
      Width : integer := RISCV_Data_Width  -- Data width
    );
    port (
      d0, d1, d2 : in std_logic_vector (Width-1 downto 0);  -- Data inputs
      s : in std_logic_vector (1 downto 0);  -- Selection signal
      y : out std_logic_vector (Width-1 downto 0)  -- Data output
    );
  end component;

  -- Component flopr: Flip-flop with reset
  component flopr is
    generic(
      Width : integer := RISCV_Data_Width  -- Data width
    );
    port (
      d : in std_logic_vector (Width-1 downto 0);  -- Data input
      q : out std_logic_vector (Width-1 downto 0);  -- Data output
      clk, reset : in std_logic  -- Clock and reset signals
    );
  end component;

  -- Component adder: Adder
  component adder is
    generic(
      Width : integer := RISCV_Data_Width  -- Data width
    );
    port(
      a : in std_logic_vector(Width-1 downto 0);  -- First input
      b : in std_logic_vector(Width-1 downto 0);  -- Second input
      c_in : in std_logic;  -- Carry-in
      y : out std_logic_vector(Width-1 downto 0);  -- Sum output
      c_out : out std_logic  -- Carry-out
    );
  end component;

  -- Component alu: Arithmetic and Logic Unit
  component alu is
    generic(
      Width : integer := RISCV_Data_Width  -- Data width
    );
    port(
      a : in std_logic_vector(Width-1 downto 0);  -- First input
      b : in std_logic_vector(Width-1 downto 0);  -- Second input
      alucontrol : in std_logic_vector(2 downto 0);  -- ALU control
      result : out std_logic_vector(Width-1 downto 0);  -- Result
      zero : out std_logic  -- Zero signal
    );
  end component;

  -- Component regfile: Register file
  component regfile is
    generic(
      Width : integer := 32  -- Register width
    );
    port(
      clk : in std_logic;  -- Clock signal
      we : in std_logic;  -- Write enable signal
      a1, a2, a3 : in std_logic_vector(4 downto 0);  -- Register addresses
      wd : in std_logic_vector(Width-1 downto 0);  -- Data to be written
      rd1, rd2 : out std_logic_vector(Width-1 downto 0)  -- Data read
    );
  end component;

  -- Component extend: Extends immediate values from RISC-V instructions
  component extend is
    port (
      immsrc : in std_logic_vector(1 downto 0);
      instr : in std_logic_vector(31 downto 7);
      immext : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Component aludec: ALU control decoder
  component aludec is
    port (
      aluop : in std_logic_vector(1 downto 0);
      opb5 : in std_logic;
      funct3 : in std_logic_vector(2 downto 0);
      funct7b5 : in std_logic;
      ALUControl : out std_logic_vector(2 downto 0)
    );
  end component;

  -- Component maindec: Main control decoder
  component maindec is
    port (
      opcode : in std_logic_vector(6 downto 0);
      aluop, immsrc, resultsrc : out std_logic_vector(1 downto 0);
      alusrc, branch, jump, memwrite, regwrite : out std_logic
    );
  end component;

  -- Component controller: Main control decoder
  component controller is
    port (
      zero : in std_logic;
      opcode : in std_logic_vector(6 downto 0);
      funct3 : in std_logic_vector(2 downto 0);
      funct7b5 : in std_logic;
  
      pcsrc : out std_logic;
      resultsrc : out std_logic_vector(1 downto 0);
      memwrite : out std_logic;
      alusrc : out std_logic;
      immsrc : out std_logic_vector(1 downto 0);
      regwrite : out std_logic;
      alucontrol : out std_logic_vector(2 downto 0)
    ) ;
  end component;

  -- Component datapath: Data path of the RISC-V processor
  component datapath is
    generic(
      Width : integer := 32
    );
    port (
      clk, reset : in std_logic;  -- Clock signal
      resultsrc : in STD_LOGIC_VECTOR(1 downto 0);
      pcsrc, alusrc : in STD_LOGIC;
      regwrite: in STD_LOGIC;
      immsrc : in STD_LOGIC_VECTOR(1 downto 0);
      alucontrol : in STD_LOGIC_VECTOR(2 downto 0);
      instr : in STD_LOGIC_VECTOR(Width-1 downto 0);
      readdata : in STD_LOGIC_VECTOR(Width-1 downto 0);
      
      aluresult, writedata : buffer STD_LOGIC_VECTOR(Width-1 downto 0);
      pc: buffer STD_LOGIC_VECTOR(Width-1 downto 0);
  
      zero: out STD_LOGIC
    );
  end component;

  -- Component risvcsingle: RISC-V processor
  component riscvsingle is
    generic(
      Width : integer := 32
    );
    port (
      clk, reset: in std_logic;
      PC: out std_logic_vector(Width-1 downto 0);
      Instr: in std_logic_vector(Width-1 downto 0);
      MemWrite: out std_logic;
      ALUResult, WriteData: out std_logic_vector(Width-1 downto 0);
      ReadData: in std_logic_vector(Width-1 downto 0)
    ) ;
  end component;

  -- Component imem: Instruction memory
  component imem is
    port(
      a: in std_logic_vector(31 downto 0);
		  rd: out std_logic_vector(31 downto 0)
    );
  end component;

  -- Component dmem: Data memory
  component dmem is
    port(
      clk, we: in std_logic;
      a, wd: in std_logic_vector(31 downto 0);
      rd: out std_logic_vector(31 downto 0)
    );
  end component;

  -- Component top: Top-level module
  component top is
    generic(
      Width : integer := 32
    );
    port(
      clk, reset : in std_logic;
      WriteData, DataAdr : buffer std_logic_vector(31 downto 0);
      MemWrite : buffer std_logic 
    );
  end component;

  -- Function to overload the addition operator for std_logic_vector
  function "+" (a, b : std_logic_vector) return std_logic_vector;
  
  -- Function to overload the subtraction operator for std_logic_vector
  function "-" (a, b : std_logic_vector) return std_logic_vector;
  
  -- Function to overload the "less than" comparison operator for std_logic_vector
  function "<" (a, b : std_logic_vector) return std_logic_vector;
  
  -- Function to perform the NOR reduction operation on a std_logic_vector
  function nor_reduce (a : std_logic_vector) return std_logic;

  -- Function to convert a std_logic_vector to an integer
  function to_integer (a : std_logic_vector) return integer;
end package riscv_pkg;

-- Body of the package riscv_pkg
package body riscv_pkg is
  -- Addition function
  function "+" (a, b : std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(unsigned(a) + unsigned(b));
  end function;

  -- Subtraction function
  function "-" (a, b : std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(unsigned(a) - unsigned(b));
  end function;

  -- Less than comparison function
  function "<" (a, b : std_logic_vector) return std_logic_vector is
    variable sub : std_logic_vector(a'length - 1 downto 0);
    variable result : std_logic_vector(a'length - 1 downto 0);
  begin
    sub := a - b;  -- Subtract b from a
    if sub(a'length-1) = '1' then  -- Check the sign bit
      result := (0 => '1', others => '0');  -- If negative, a < b
      return result;
    else
      result := (others => '0');  -- Otherwise, a >= b
      return result;
    end if;
  end function;

  -- NOR reduction function
  function nor_reduce (a : std_logic_vector) return std_logic is
    variable result : std_logic := '0';
  begin
    for i in 0 to a'length-1 loop
      result := result OR a(i);  -- Bitwise OR
    end loop;
    return not result;  -- Return the NOR of all bits
  end function;

  -- Function to convert std_logic_vector to integer using power of two
  function to_integer(a : std_logic_vector) return integer is
    variable result : integer := 0;
  begin
    for i in a'range loop
      if a(i) = '1' then
        result := result + 2**(i - a'low);  -- Ajustar o índice para começar de 0
      end if;
    end loop;
    return result;
  end function;
end package body riscv_pkg;