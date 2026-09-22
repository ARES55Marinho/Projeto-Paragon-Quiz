
// ========================================
// CAPTURA DOS ELEMENTOS HTML
// ========================================

// Campo onde o jogador digita o nome
const playerNameInput = document.getElementById("player-name");

// Botão de continuar
const continueButton = document.getElementById("continue-button");

// Mensagem de erro
const errorMessage = document.getElementById("error-message");


// ========================================
// FUNÇÃO PARA INICIAR O QUIZ
// ========================================

// Executada quando o jogador clica em continuar
function startQuiz() {

    // Remove espaços desnecessários do nome
    const playerName = playerNameInput.value.trim();


    // ========================================
    // VALIDAÇÃO DO NOME
    // ========================================

    // Verifica se o jogador não digitou nada
    if (playerName.length === 0) {

        // Mostra a mensagem de erro
        errorMessage.textContent =
            "Digite seu nome para continuar.";

        // Coloca o cursor no campo
        playerNameInput.focus();

        // Interrompe a função
        return;
    }


    // ========================================
    // ARMAZENAMENTO DO NOME
    // ========================================

    // Salva o nome do jogador durante a sessão
    sessionStorage.setItem(
        "paragonCurrentPlayer",
        playerName
    );


    // ========================================
    // PONTUAÇÃO INICIAL
    // ========================================

    // Começa a partida com zero pontos
    sessionStorage.setItem(
        "paragonCurrentScore",
        "0"
    );


    // ========================================
    // NAVEGAÇÃO PARA A PRÓXIMA TELA
    // ========================================

    // Abre a tela de seleção de temas
    window.location.href = "temquiz.html";

}


// ========================================
// EVENTO DO BOTÃO CONTINUAR
// ========================================

// Executa a função ao clicar no botão
continueButton.addEventListener(
    "click",
    startQuiz
);


// ========================================
// TECLA ENTER
// ========================================

// Permite continuar pressionando Enter
playerNameInput.addEventListener(
    "keydown",
    (event) => {

        // Verifica se a tecla pressionada é Enter
        if (event.key === "Enter") {

            startQuiz();

        }

    }
);