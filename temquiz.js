
// ========================================
// CAPTURA DOS ELEMENTOS HTML
// ========================================

// Captura todos os botões de temas
const themeOptions = document.querySelectorAll(".theme-option");

// Captura o botão começar
const startButton = document.getElementById("start-button");

// Captura a mensagem de erro
const errorMessage = document.getElementById("error-message");

// Guarda o tema selecionado pelo jogador
let selectedTheme = null;


// ========================================
// SELEÇÃO DO TEMA
// ========================================

// Adiciona um evento de clique em cada tema
themeOptions.forEach((themeOption) => {

    themeOption.addEventListener("click", () => {

        // Obtém o tema selecionado
        selectedTheme = themeOption.dataset.theme;


        // ========================================
        // REMOVE A SELEÇÃO DOS OUTROS TEMAS
        // ========================================

        themeOptions.forEach((option) => {

            // Remove a marcação visual
            option.classList.remove("selected");

            // Atualiza o estado de acessibilidade
            option.setAttribute("aria-pressed", "false");

        });


        // ========================================
        // MARCA O TEMA SELECIONADO
        // ========================================

        // Adiciona a classe que deixa a bolinha azul
        themeOption.classList.add("selected");

        // Atualiza o estado de acessibilidade
        themeOption.setAttribute("aria-pressed", "true");


        // ========================================
        // SALVA O TEMA NA SESSÃO
        // ========================================

        // Guarda a escolha para as próximas telas
        sessionStorage.setItem(
            "paragonSelectedTheme",
            selectedTheme
        );


        // Remove a mensagem de erro
        errorMessage.textContent = "";

    });

});


// ========================================
// BOTÃO COMEÇAR
// ========================================

// Executa quando o jogador clica no botão
startButton.addEventListener("click", () => {


    // ========================================
    // VALIDAÇÃO DO TEMA
    // ========================================

    // Verifica se nenhum tema foi escolhido
    if (!selectedTheme) {

        // Mostra o aviso sem alterar o tamanho da tela
        errorMessage.textContent = "selecione um tema";

        return;

    }


    // ========================================
    // SALVAMENTO DO TEMA
    // ========================================

    // Salva novamente o tema escolhido
    sessionStorage.setItem(
        "paragonSelectedTheme",
        selectedTheme
    );


    // ========================================
    // PRÓXIMA TELA
    // ========================================

    // Por enquanto, exibe uma mensagem de confirmação
  
// Verifica se o tema escolhido é Hack em Geral
if (selectedTheme === "hack") {

    // Vai para a primeira pergunta do tema Hack
    window.location.href = "Hack1.html";

}
    /*
        QUANDO CRIARMOS A PRIMEIRA PERGUNTA,
        SUBSTITUA O ALERT PELA NAVEGAÇÃO:

        window.location.href = "pergunta1.html";
    */

});