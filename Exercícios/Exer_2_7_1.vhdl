----------------------------
--Nome Isaac Santos Soares
--NUSP 12751713
--
--Exercício 2.7.1

--Descrição:

--
----------------------------

ENTITY express IS
  PORT(
    a, b, c, d: IN BIT;
    s1, s2, s3, s4: OUT BIT
  );
END express;

ARCHITECTURE behavioral OF express IS
BEGIN
  s1 <= a OR NOT(b);
  s2 <= a OR (NOT(b) AND c) OR d;
  s3 <= (a OR NOT(b)) AND (c OR d);
  s4 <= (a OR NOT(b)) AND NOT(c OR (a AND d));
END behavioral;