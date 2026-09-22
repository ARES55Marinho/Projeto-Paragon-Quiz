
// ========================================
// CONFIGURAÇÕES DA PERGUNTA
// ========================================

// Valor de pontos para cada resposta correta
const POINTS_PER_CORRECT_ANSWER = 10;

// Identificador da pergunta atual
const QUESTION_ID = "Hack2";

// Resposta correta desta pergunta
const CORRECT_ANSWER = "fortran";


// ========================================
// CAPTURA DOS ELEMENTOS HTML
// ========================================

// Nome do quiz
const quizName = document.getElementById("quiz-name");

// Todas as alternativas
const answerOptions = document.querySelectorAll(".answer-option");

// Botão enviar
const submitButton = document.getElementById("submit-answer");

// Bloco de feedback
const answerFeedback = document.getElementById("answer-feedback");

// Status do feedback
const feedbackStatus = document.getElementById("feedback-status");

// Título do feedback
const feedbackTitle = document.getElementById("feedback-title");

// Descrição do feedback
const feedbackDescription = document.getElementById("feedback-description");


// ========================================
// VARIÁVEIS DA PERGUNTA
// ========================================

// Guarda a alternativa selecionada
let selectedAnswer = null;

// Verifica se a pergunta já foi confirmada
let answerConfirmed = false;


// ========================================
// RECUPERAR O NOME DO JOGADOR
// ========================================

// Recupera o nome salvo na tela nomejog.html
const playerName = sessionStorage.getItem(
    "paragonCurrentPlayer"
);

// Exibe o nome do quiz no cabeçalho
const selectedQuizName = sessionStorage.getItem(
    "paragonSelectedTheme"
);

// Mostra o nome do tema ou o nome padrão
if (selectedQuizName === "hack") {

    quizName.textContent = "Hack em Geral";

} else {

    quizName.textContent = "Paragon Quiz";

}


// ========================================
// SELEÇÃO DAS ALTERNATIVAS
// ========================================

// Adiciona um evento para cada alternativa
answerOptions.forEach((answerOption) => {

    answerOption.addEventListener("click", () => {


        // ========================================
        // IMPEDE ALTERAÇÃO APÓS CONFIRMAÇÃO
        // ========================================

        // Não permite mudar a resposta depois de enviar
        if (answerConfirmed) {

            return;

        }


        // ========================================
        // CAPTURA DA RESPOSTA
        // ========================================

        // Salva o valor da alternativa selecionada
        selectedAnswer = answerOption.dataset.answer;


        // ========================================
        // REMOVE SELEÇÃO ANTERIOR
        // ========================================

        // Retira a seleção visual de todas as alternativas
        answerOptions.forEach((option) => {

            option.classList.remove("selected");

        });


        // ========================================
        // MARCA A ALTERNATIVA SELECIONADA
        // ========================================

        // Deixa a bolinha azul
        answerOption.classList.add("selected");


        // ========================================
        // LIMPA MENSAGEM ANTERIOR
        // ========================================

        // Limpa o feedback enquanto a pergunta não foi enviada
        answerFeedback.className = "answer-feedback";

        feedbackStatus.textContent = "";
        feedbackTitle.textContent = "";
        feedbackDescription.textContent = "";

    });

});


// ========================================
// FUNÇÃO PARA ATUALIZAR A PONTUAÇÃO
// ========================================

function addPointsToPlayer(points) {


    // ========================================
    // RECUPERA PONTUAÇÃO ATUAL
    // ========================================

    // Recupera a pontuação atual ou começa com zero
    let currentScore = Number(
        sessionStorage.getItem("paragonCurrentScore") || "0"
    );


    // ========================================
    // SOMA OS PONTOS
    // ========================================

    // Adiciona a quantidade de pontos recebida
    currentScore += points;


    // ========================================
    // SALVA A PONTUAÇÃO NA SESSÃO
    // ========================================

    sessionStorage.setItem(
        "paragonCurrentScore",
        String(currentScore)
    );


    // ========================================
    // SALVA NOME E PONTUAÇÃO NO RANKING
    // ========================================

    // Recupera os jogadores já registrados
    let ranking = JSON.parse(
        localStorage.getItem("paragonRanking") || "[]"
    );


    // Procura o jogador atual pelo nome
    const existingPlayerIndex = ranking.findIndex(
        (player) => player.name === playerName
    );


    // ========================================
    // ATUALIZA OU CRIA O JOGADOR
    // ========================================

    if (existingPlayerIndex !== -1) {

        // Atualiza a pontuação do jogador existente
        ranking[existingPlayerIndex].score = currentScore;

    } else {

        // Adiciona um novo jogador ao ranking
        ranking.push({

            name: playerName || "Jogador",

            score: currentScore

        });

    }


    // ========================================
    // ARMAZENAMENTO DO RANKING
    // ========================================

    // Salva o ranking atualizado
    localStorage.setItem(
        "paragonRanking",
        JSON.stringify(ranking)
    );


    // Retorna a pontuação atual
    return currentScore;

}


// ========================================
// FUNÇÃO PARA MOSTRAR O RESULTADO
// ========================================

function showAnswerFeedback(isCorrect) {


    // ========================================
    // MOSTRA O BLOCO DE FEEDBACK
    // ========================================

    // Aplica o estilo azul do resultado
    answerFeedback.classList.add(
        isCorrect ? "correct" : "incorrect"
    );


    // ========================================
    // RESPOSTA CORRETA
    // ========================================

    if (isCorrect) {

        // Mostra o status de acerto
        feedbackStatus.textContent = "CORRETA";

        // Mostra o título do feedback
        feedbackTitle.textContent = "RESPOSTA CORRETA";

        // Explicação da resposta
        feedbackDescription.textContent =
            "Fortran foi criada na década de 1950.";


    } else {


        // ========================================
        // RESPOSTA ERRADA
        // ========================================

        // Mostra o status de erro
        feedbackStatus.textContent = "ERRADO";

        // Mostra o título do feedback
        feedbackTitle.textContent = "RESPOSTA CORRETA: FORTRAN";

        // Explicação da resposta
        feedbackDescription.textContent =
            "Fortran foi criada na década de 1950.";

    }

}



// ========================================
// BOTÃO ENVIAR / CONTINUAR
// ========================================

submitButton.addEventListener("click", () => {


    // ========================================
    // ETAPA 1: CONFIRMAR A RESPOSTA
    // ========================================

    // Se a resposta ainda não foi confirmada
    if (!answerConfirmed) {


        // ========================================
        // VALIDAÇÃO DA RESPOSTA
        // ========================================

        // Verifica se o jogador selecionou alguma alternativa
        if (!selectedAnswer) {

            alert("Selecione uma resposta antes de enviar.");

            return;

        }


        // ========================================
        // CONFIRMA A RESPOSTA
        // ========================================

        // Marca a pergunta como confirmada
        answerConfirmed = true;


        // ========================================
        // VERIFICAÇÃO DA RESPOSTA
        // ========================================

        // Confere se a resposta escolhida está correta
        const isCorrect = selectedAnswer === CORRECT_ANSWER;


        // ========================================
        // SOMA OS PONTOS
        // ========================================

        // Adiciona 10 pontos se acertar
        if (isCorrect) {

            addPointsToPlayer(POINTS_PER_CORRECT_ANSWER);

        }


        // ========================================
        // MOSTRA O RESULTADO
        // ========================================

        // Exibe o feedback correto ou incorreto
        showAnswerFeedback(isCorrect);


        // ========================================
        // BLOQUEIA AS ALTERNATIVAS
        // ========================================

        // Impede alterar a resposta após a confirmação
        answerOptions.forEach((option) => {

            option.disabled = true;

        });


        // ========================================
        // MUDA O BOTÃO PARA CONTINUAR
        // ========================================

        // Altera o texto do botão
        submitButton.textContent = "continuar";


        // Mantém o botão habilitado para avançar
        submitButton.disabled = false;


        return;

    }


    // ========================================
    // ETAPA 2: IR PARA A PRÓXIMA PERGUNTA
    // ========================================

    // Quando o jogador clicar em continuar
    // após confirmar a resposta

    window.location.href = "Hack3.html";


});