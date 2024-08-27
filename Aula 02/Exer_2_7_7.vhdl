----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Exercício 2.7.7

--Descrição:

--
----------------------------

ENTITY errad_1 IS
  PORT(
    a, b, c, d: IN BIT;
    s: OUT BIT_VECTOR (5 DOWNTO 0)
  );
END errad_1;

ARCHITECTURE behavioral OF errad_1 IS
BEGIN
  s(0) <= (a AND b) OR (c AND d);
  s(1) <= (a NOR b) NOR c;
  s(2) <= (a AND b) OR c;
  s(3) <= NOT(a AND b) NAND c;
  s(4) <= (a XOR b) XOR c;
END behavioral;