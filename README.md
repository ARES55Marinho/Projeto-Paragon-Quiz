# Paragon Quiz

Frontend em HTML, CSS e JavaScript puro, conectado ao Supabase. As telas seguem os frames enviados do Figma: abertura, nome, escolha de tema, pergunta com alternativas, verdadeiro/falso, feedback, resultado e ranking.

## O que está implementado

- Fluxo de início e identificação do jogador.
- Seleção entre os quatro temas do banco.
- Carregamento aleatório de até 10 perguntas por tema.
- Identificação automática de pergunta de múltipla escolha (3/4 opções) ou verdadeiro/falso (2 opções).
- Correção e justificativa após o envio.
- Pontuação baseada na dificuldade cadastrada no banco.
- Registro do resultado e ranking geral.
- Layout responsivo; botões e áreas de seleção foram ampliados para facilitar a leitura e o toque.

## Configuração do Supabase

1. No Supabase, abra **SQL Editor**.
2. Confirme que as tabelas `tema`, `dificuldade`, `alternativa`, `jogador` e `pergunta` foram criadas e que o DML foi carregado.
3. Execute `supabase/setup_supabase.sql`.
4. Confira `js/config.js`: o endereço do projeto e a chave `sb_publishable` já foram preenchidos com os dados enviados.
5. Publique os arquivos em uma hospedagem estática (ou abra com Live Server no VS Code).

O frontend usa as funções SQL (`paragon_obter_perguntas`, `paragon_corrigir_resposta`, `paragon_registrar_jogador` e `paragon_ranking`). O gabarito não é enviado ao navegador junto com as perguntas; ele só é retornado pela função de correção após o envio da resposta.

**Importante:** não coloque a chave `service_role` no frontend. A chave `sb_publishable` é a apropriada para o navegador; mantenha o acesso às tabelas controlado e utilize as funções fornecidas.

## Estrutura

```text
paragon-quiz/
├── index.html
├── css/style.css
├── js/config.js
├── js/app.js
├── supabase/setup_supabase.sql
└── README.md
```

## Observações sobre os dados recebidos

- O DML enviado contém um caractere `[` solto logo após o primeiro `INSERT INTO alternativa` (depois da linha da alternativa 1). Remova esse caractere antes de executar o arquivo completo.
- A pergunta de id 16 está associada ao tema 3 no DML, embora esteja no bloco de Erros da Computação. O script de configuração corrige essa associação para o tema 2.
- O modelo físico original não gera automaticamente `id_jogador`; o script adiciona `IDENTITY` para que os registros sejam inseridos sem colisão de IDs.
- O campo `rank` é preenchido com zero no registro. A posição exibida no ranking é calculada pela ordenação de pontuação, não por esse campo.
- Cada partida concluída cria um registro em `jogador`, conforme o modelo atual. Assim, o ranking representa partidas registradas; não consolida automaticamente o melhor resultado por nome.

## Como executar localmente

Abra a pasta no VS Code e use a extensão Live Server para abrir `index.html`. Como o projeto usa CDN do Supabase e Google Fonts, é necessária conexão com a internet.
