----------------------------
-- Authors: Isaac Santos Soares
-- nUSP: 12751713
--
-- Copyright (c) 2024 Isaac Soares
-- Licensed under the MIT License
-- 
-- Description:
--
-- Last Modified: 2024-11-19
----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.riscv_pkg.ALL;

entity controller is
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
end controller;

architecture behavioral of controller is
  signal aluop : std_logic_vector(1 downto 0);
  signal branch, jump : std_logic;
  alias opb5 is opcode(5);
begin
  mdec : maindec
    port map (
      opcode => opcode,
      aluop => aluop,
      immsrc => immsrc,
      resultsrc => resultsrc,
      alusrc => alusrc,
      branch => branch,
      jump => jump,
      memwrite => memwrite,
      regwrite => regwrite
    );
    
  adec : aludec
    port map (
      aluop => aluop,
      opb5 => opb5,
      funct3 => funct3,
      funct7b5 => funct7b5,
      ALUControl => alucontrol
    );

  pcsrc <=(zero and branch) or jump;
end behavioral;