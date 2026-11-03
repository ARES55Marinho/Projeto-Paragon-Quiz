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

/**Perguntas de linguagens de Programação **/
INSERT INTO pergunta (id_pergunta, texto_pergunta, id_tema, id_dificuldade, id_alternativa) VALUES
(1, 'Qual linguagem utiliza a extensão .py em seus arquivos?', 1, 1, 1),
(2, 'Qual linguagem utiliza a extensão .c em seus arquivos?', 1, 1, 2),
(3, 'Qual destas linguagens é utilizada para consultar informações em bancos de dados?', 1, 1, 3),
(4, 'Qual destas linguagens é utilizada principalmente para definir a estrutura e o conteúdo de uma página web?', 1, 1, 4),
(5, 'Qual é a principal finalidade da linguagem SQL?', 1, 2, 5),
(6, 'Em qual linguagem é comum utilizar #include para adicionar bibliotecas?', 1, 2, 6),
(7, 'Qual destas linguagens permite manipulação direta de memória por meio de ponteiros?', 1, 3, 7),
(8, 'Qual é a função principal de um compilador?', 1, 3, 8),
(9, 'Qual é a principal diferença entre HTML e JavaScript?', 1, 2,9),
(10, 'O que é uma linguagem com tipagem gradual?', 1, 4, 10);

/** Alternativas de História da Computação **/


## Hack em Geral
INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, alternativa_c, alternativa_d, resposta, justificativa) VALUES
(31, 'Trojan', 'Firewall', 'Driver', 'Compiler', 1,
'Um Trojan, também conhecido como Cavalo de Troia, é um programa malicioso que se disfarça de software legítimo para enganar o usuário e executar ações prejudiciais.'),

(32, 'Um sistema que traduz linguagens de programação', 'Um sistema que monitora e controla o tráfego de rede',
'Um programa que aumenta a velocidade do processador', 'Um dispositivo que recupera arquivos apagados', 2,
'O firewall monitora e controla o tráfego de rede, podendo bloquear conexões suspeitas ou não autorizadas para ajudar a proteger o sistema.'),

(33, 'Phishing', 'Overclock', 'Desfragmentação', 'Criptografia', 1,
'Phishing é um golpe no qual o criminoso se passa por uma pessoa ou organização confiável para enganar a vítima e obter informações confidenciais.'),

(34, 'Compartilhar a senha com amigos', 'Utilizar a mesma senha em vários sites',
'Desativar a autenticação em dois fatores para evitar etapas extras no login', 'Utilizar senhas fortes e diferentes para cada conta', 4,
'Utilizar senhas fortes e exclusivas para cada conta dificulta invasões e impede que uma senha descoberta em um serviço seja utilizada para acessar outras contas.'),

(35, 'Modificar permissões de arquivos localmente', 'Descobrir a senha de um usuário por tentativa e erro',
'Indisponibilizar um serviço sobrecarregando-o com tráfego', 'Criptografar arquivos do usuário', 3,
'Um ataque DDoS busca tornar um serviço indisponível ao sobrecarregá-lo com uma grande quantidade de tráfego proveniente de diferentes dispositivos.'),

(36, 'Aumentar a velocidade de uma conexão de internet.', 'Executar programas em um ambiente isolado para limitar possíveis danos ao sistema principal.',
'Permitir que qualquer programa tenha acesso administrativo.', 'Remover automaticamente todas as senhas de um computador.', 2,
'Sandboxing permite executar programas em um ambiente isolado, reduzindo o risco de que atividades maliciosas afetem o restante do sistema.'),

(37, 'Quando um servidor recebe conexões de diferentes países', 'Quando um banco de dados realiza consultas simultâneas',
'Quando um programa utiliza toda a capacidade de armazenamento do disco', 'Quando dados excedem a capacidade de um buffer e podem sobrescrever áreas adjacentes da memória', 4,
'Buffer Overflow acontece quando um programa recebe mais dados do que um buffer consegue armazenar, podendo sobrescrever regiões próximas da memória e causar falhas ou permitir a execução de código malicioso.'),

(38, 'Verdadeiro', 'Falso', NULL, NULL, 1,
'Utilizar a mesma senha em vários sites aumenta os riscos porque, se um serviço sofrer um vazamento, criminosos poderão tentar utilizar essa senha para acessar outras contas.'),

(39, 'Verdadeiro', 'Falso', NULL, NULL, 2,
'Um ataque de força bruta tenta descobrir senhas testando diversas combinações possíveis, e não apenas o mínimo de combinações.'),

(40, 'Verdadeiro', 'Falso', NULL, NULL, 2, 'HTTPS protege a comunicação entre o navegador e o site por meio de criptografia, mas não garante que o próprio site seja confiável ou esteja livre de golpes.');

INSERT INTO pergunta (id_pergunta, texto_pergunta, id_tema, id_dificuldade, id_alternativa) VALUES
(31, 'Qual é o nome dado a um programa malicioso que se disfarça de software legítimo para enganar o usuário?', 4, 1, 31),
(32, 'O que é um firewall em um computador ou rede?', 4, 1, 32),
(33, 'Utilizar a mesma senha em vários sites aumenta o risco caso um desses serviços sofra um vazamento de dados.', 4, 1, 38),
(34, 'Como é chamado o golpe em que alguém se passa por uma empresa ou pessoa confiável para roubar informações?', 4, 1, 33),
(35, 'Um ataque de força bruta tenta descobrir uma senha testando o mínimo de combinações possíveis.', 4, 2, 39),
(36, 'Quais destas práticas ajudam a proteger uma conta contra invasões?', 4, 2, 34),
(37, 'Qual é a principal finalidade de um ataque DDoS?', 4, 2, 35),
(38, 'Uma conexão HTTPS garante que um site seja legítimo e não possa ser utilizado para aplicar golpes.', 4, 3, 40),
(39, 'Qual é a finalidade de uma técnica chamada "Sandboxing" em segurança?', 4, 3, 36),
(40, 'Em segurança de memória, o que é um ataque de Buffer Overflow?', 4, 4, 37);
  
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
  
/** Perguntas de História da Computação **/

INSERT INTO pergunta (id_pergunta, texto_pergunta, id_tema, id_dificuldade, id_alternativa) VALUES

(41, 'Qual destes objetos era usado para fazer cálculos muito antes dos computadores existirem?', 3, 1, 41),
(42, 'Quem é conhecido como o criador da World Wide Web (WWW)?', 3, 1, 42),
(43, 'O que significa a sigla PC?', 3, 1, 43),
(44, 'Qual empresa é responsável pela criação do sistema operacional Windows?', 3, 1, 44),
(45, 'Quem é considerada a primeira programadora da história?', 3, 1, 45),
(46, 'Qual dispositivo substituiu as válvulas e permitiu computadores menores e mais rápidos?', 3, 3, 46),
(47, 'Qual destes é um sistema operacional?', 3, 3, 47),
(48, 'Qual empresa desenvolveu o primeiro processador comercial da história, o Intel 4004?', 3, 3, 48),
(49, 'Qual era a principal função do ENIAC?', 3, 3, 49),
(50, 'Qual foi a principal inovação teórica da Máquina Analítica de Charles Babbage?', 3, 4, 50);
  
/** Alternativas de História da Computação **/

INSERT INTO alternativa (id_alternativa, alternativa_a, alternativa_b, alternativa_c, alternativa_d, resposta, justificativa) VALUES
(41, 'Mouse', 'Ábaco', 'Pendrive', 'Monitor', 2,
'O ábaco é uma das ferramentas de cálculo mais antigas da humanidade, utilizado milhares de anos antes dos computadores modernos.'),

(42, 'Bill Gates', 'Steve Jobs', 'Tim Berners-Lee', 'Linus Torvalds', 3,
'Tim Berners-Lee criou a World Wide Web (WWW), sistema que permitiu a navegação por páginas interligadas na internet.'),

(43, 'Personal Computer', 'Program Computer', 'Power Computer', 'Primary Computer', 1,
'PC significa Personal Computer (Computador Pessoal), termo utilizado para computadores destinados ao uso individual.'),

(44, 'Apple', 'Google', 'Microsoft', 'IBM', 3,
'A Microsoft desenvolveu o sistema operacional Windows, um dos mais utilizados do mundo.'),

(45, 'Grace Hopper', 'Ada Lovelace', 'Margaret Hamilton', 'Katherine Johnson', 2,
'Ada Lovelace é considerada a primeira programadora da história por ter desenvolvido algoritmos para a Máquina Analítica de Charles Babbage.'),

(46, 'Teclado', 'Transistor', 'Mouse', 'Scanner', 2,
'O transistor substituiu as válvulas eletrônicas, permitindo a criação de computadores menores, mais rápidos e mais confiáveis.'),

(47, 'Excel', 'Chrome', 'Windows', 'Intel', 3,
'Windows é um sistema operacional. Excel é um aplicativo, Chrome é um navegador e Intel é uma fabricante de processadores.'),

(48, 'IBM', 'Microsoft', 'Intel', 'Apple', 3,
'A Intel desenvolveu o Intel 4004, considerado o primeiro microprocessador comercial da história.'),

(49, 'Navegar na internet', 'Realizar cálculos complexos', 'Criar sites', 'Armazenar fotos', 2,
'O ENIAC foi um dos primeiros computadores eletrônicos de uso geral e foi projetado principalmente para realizar cálculos complexos.'),

(50, 'Uso de energia elétrica', 'Capacidade de armazenar programas e executar instruções', 'Conexão entre computadores por rede', 'Uso de transistores para processamento', 2,
'A Máquina Analítica de Charles Babbage introduziu conceitos fundamentais dos computadores modernos, como o armazenamento de instruções e a execução programável de operações.');
