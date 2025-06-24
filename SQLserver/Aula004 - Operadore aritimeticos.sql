/* Operadores aritimeticos 
+ (soma)
-(Subtração)
*(Multiplicação)
/(Divisão)
%(Resto da divisão) */


SELECT 1 + 1 AS MAT

SELECT (2 + 7) * 10 AS MAT

SELECT 5 - 10  [AS SUBTRACAO(-1)]
SELECT (2 + 7) * 10 AS MULTIPLICACAO
SELECT  90 / 3 AS DIVISAO
SELECT 90 / 60 AS DIV2
SELECT 90 % 60 AS [RESTO DA DIVISAO]

SELECT 1 + 3 AS SOMA,
5 - 10 [SUB(-1)],
1700 + (-900) AS NEG,
5 * (5 + 1) AS MULTI_SOM,
-5 * (500 / 40) % 3 AS TODO

select 1 + '1' AS SOMA /* MESMO SE TRATANDO DE UMA STRING, O SQL ENTENDE COMO NUMERO E SOMA */
SELECT '1' + 1
SELECT '1' + '1' AS SOMA3;/* Duas string o SQL vai concatenar. formando número 11 */

SELECT '1' + '1' + 1/* Concatena os dois primeiros e soma com o terceiro = total 12 */

SELECT '1' + ('1' * 4); /* Faz a multiplicação normal e depois adiciona mais 1 - total 5 */

SELECT '1' + '1A' +5;/* Erro, não consegue ler 1A */

SELECT '5' * '5' /* Vai dar erro */

SELECT 'FERNANDO' +' '+ 'MARTINS' AS NOME /* Para contatenar, usa sinal de adição */

SELECT 'Fernando' +' '+' Martins' as nome;
 
 select 'Maria' as nome;

 