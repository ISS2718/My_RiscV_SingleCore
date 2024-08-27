----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Exercício 2.7.8

--Descrição:

--
----------------------------

ENTITY errad_2 IS
  PORT(
    a, b, c, d: IN BIT;
    r, s, t, u, v, x : OUT BIT_VECTOR (0 TO 5)
  );
END errad_2;

ARCHITECTURE behavioral OF errad_2 IS
BEGIN
  r(0 TO 2) <= a & b & c;
  s <= a & b & c & "010";
  t(0 TO 2) & u(3 TO 5) <= "101101";
  v <= a & (OTHERS => '0');
  x <= a & (OTHERS => '0') & 1;
END behavioral;