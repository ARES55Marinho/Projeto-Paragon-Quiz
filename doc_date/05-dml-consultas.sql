/* INSERT dos temas */
insert into tema(id_tema, nome_tema) VALUES
(1, 'Diferenças de linguagens de programação'),
(2, 'Erros de computação'),
(3, 'Historia da computação'),
(4, 'Hack em geral');

  
/* INSERT das dificuldades */
insert into dificuldade(id_dificuldade, Nome_dificuldade, valor_pontos) VALUES
(1, 'Fácil', 5),
(2, 'Médio', 8),
(3, 'Difícil', 12),
(4, 'Extremo', 20);

## Diferenças de linguagens de Programação

  
## Hack em Geral

  
## Erros da Computação
/**Perguntas de Erros da Computação **/

INSERT INTO pergunta (id_pergunta, texto_pergunta, id_tema, id_dificuldade, id_alternativa) VALUES
(21, 'O termo bug, se originou quando encontraram um inseto dentro de um computador?', '3', '1', 21);
(22, 'Nas linguagens de programação podemos colocar números no início do nome das variáveis? Como 1nota e 2nota?', '3', '1', 22);
(23, 'Um erro de programação pode fazer um programa funcionar corretamente, mas apresentar resultados errados?', '3', '1', 23);
(24, 'Se um código apresenta um erro de sintaxe, significa que a lógica do programa está necessariamente errada?', '3', '1', 24);
(25, 'O que acontece quando um programa tenta acessar uma posição inexistente de um vetor?', '3', '2', 25);
(26, 'O famoso bug do processador Pentium, descoberto em 1994, fazia com que determinados cálculos de divisão produzissem resultados incorretos. A Intel corrigiu o problema simplesmente atualizando o sistema operacional dos computadores afetados. Verdadeiro ou falso?', '3', '2', 26);
(27, 'O problema do ano 2000 (Bug do Milênio) aconteceu porque todos os computadores do mundo interpretavam o ano 2000 como 1900.
Verdadeiro ou falso?', '3', '2', 27);
(28, 'Um programa entra em um loop infinito devido a um erro de programação. Qual das alternativas descreve melhor essa situação?', '3', '3', 28);
(29, 'Em programação, um programa pode apresentar um erro que desaparece quando o desenvolvedor tenta investigá-lo usando ferramentas de depuração (debugging). Verdadeiro ou falso?', '3', '3', 29);
(30, 'Um programa escrito em C apresenta o seguinte código:
int x = 2147483647;
x = x + 1;
printf("%d", x);
Considerando uma implementação comum em que int é um inteiro de 32 bits com sinal, qual afirmação está correta segundo o padrão da linguagem C?', '3', '4', 30);

/**Alternativas de Erros da Computação **/

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, resposta, justificativa) VALUES 
(21, 'Verdadeiro', 'falso', 2, 'Falso: o caso realmente aconteceu, acharam uma mariposa causando problemas na máquina, mas o termo já era usado muito antes do ocorrido.');
(22, 'Verdadeiro', 'falso', 2, 'Falso:A maioria das linguagens de programação permite colocar números nos nomes das variáveis, mas geralmente não permite que o nome comece com um número.');
(23, 'Verdadeiro', 'falso', 1, 'Verdadeiro: Um programa pode executar sem travar e ainda conter erros lógicos, como uma fórmula de soma que, por engano, realiza uma subtração.');
(24, 'Verdadeiro', 'falso', 2, 'Falso:Um erro de sintaxe acontece quando o código desrespeita as regras da linguagem. A lógica pode estar correta, mas o programa não consegue ser interpretado ou compilado até que o problema seja corrigido.');

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, alternativa_c, alternativa_d, resposta, justificativa) VALUES 
(25, 'A) O computador sempre desliga automaticamente.',
 'B) O programa pode apresentar um erro ou comportamento inesperado.',
 'C) A linguagem de programação corrige automaticamente o código.', 
 'D) O vetor aumenta de tamanho obrigatoriamente.',
2,
   'O comportamento depende da linguagem. Em algumas, o acesso inválido gera uma exceção; em C, por exemplo, acessar uma posição fora dos limites de um vetor pode causar comportamento indefinido.');

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, resposta, justificativa) VALUES 
(26, 'Verdadeiro', 'falso', 2, 'Falso:O problema estava no próprio hardware do processador, mais especificamente na unidade de divisão de ponto flutuante. A correção definitiva exigia substituir os processadores defeituosos, embora soluções de software pudessem contornar o problema em algumas situações.');
(27, 'Verdadeiro', 'falso', 2, 'Falso:O problema afetava principalmente sistemas que armazenavam anos com apenas dois dígitos. Assim, o ano 2000 podia ser interpretado como 00 e confundido com 1900, dependendo das regras utilizadas pelo sistema. Nem todos os computadores foram afetados.');

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, alternativa_c, alternativa_d, resposta, justificativa)
VALUES (28, 'A) O programa executa um bloco de código repetidamente sem atingir uma condição de parada.',
 'B) O programa apaga automaticamente todos os arquivos do computador.',
 'C) O compilador transforma o código em uma linguagem impossível de executar.', 
 'D) O programa deixa de ocupar memória RAM enquanto está em execução.',
1,
   'A: Um loop infinito acontece quando uma estrutura de repetição nunca termina, geralmente porque sua condição de parada nunca é satisfeita. Isso pode consumir recursos do computador e fazer o programa parar de responder.');

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, resposta, justificativa)
VALUES (29, 'Verdadeiro', 'falso', 1, 'Verdadeiro: Esse fenômeno é conhecido informalmente como Heisenbug. Ele acontece quando a tentativa de investigar um erro altera o comportamento do programa, fazendo com que o problema desapareça ou se manifeste de maneira diferente. Isso pode ocorrer, por exemplo, devido a mudanças no tempo de execução causadas pelo depurador, especialmente em programas com múltiplas threads.');

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, alternativa_c, alternativa_d, resposta, justificativa)
VALUES (30, 'A) O programa sempre imprime -2147483648, pois os inteiros dão a volta automaticamente',
 'B) O programa sempre imprime 2147483648, pois o C permite que um int ultrapasse seu limite.',
 'C) O programa apresenta comportamento indefinido, pois ocorre estouro de um inteiro com sinal (signed integer overflow).', 
 'D) O compilador é obrigado a interromper a execução antes da soma.',
1,
   'C: Em C, o estouro de um inteiro com sinal causa comportamento indefinido. Isso significa que o padrão da linguagem não garante um resultado específico. Embora algumas máquinas possam produzir -2147483648, esse resultado não é garantido pelo padrão C.');

  
## História da Computação
