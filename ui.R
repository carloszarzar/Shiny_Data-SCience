require(shiny)
choi <- c("Linear"="Linear",
          "Quadratica"="Quadratica",
          "Exponencial"="Exponencial",
          "Modular"="Modular",
          "Logaritmica"="Logaritmica")

shinyUI(
    fluidPage(
        titlePanel(span("Estudo de funções")), 
        sidebarPanel(
            selectInput(inputId="funcao",
                        label="Escolha uma função:",
                        choices=choi),
            uiOutput("ui"),
            
            selectInput(inputId = "Cor", 
                        label=span("Escolha uma cor para o gráfico:"), 
                        choices = colors(),
                        selected = "blue")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Gráfico", plotOutput("plot")),
                tabPanel("Atividades propostas",
                         h5("Questão 1: Construa o gráfico das seguintes funções e classifique-as em crescente ou decrescente:"),
                         h5("a) y = 5x – 8"),
                         h5("b) y = x + 2"),
                         h5("c) y = -3 - x"),
                         h5("d) y = 9 + 3x"),
                         h5("e) y = -3x"),   
                         h5("Questão 2: Construa o gráfico da função definida por f(x) = 5x - 3 pelo aplicativo de função. A partir dele, responda as questões abaixo:"),
                         h5("a) Verifique se a função é crescente ou decrescente."),
                         h5("b) O zero da função."),
                         h5("c) O ponto onde a função intersecta o eixo y."),
                         h5("Questão 3: Seja a função f(x) = 2x + 1. Construa o gráfico de f(x) no aplicativo. A seguir, execute cada comando e anote o que acontece com o gráfico de f(x)."),
                         h5("a) Multiplique f por -1"),
                         h5("b) Multiplique f por 2"),
                         h5("c) Subtraia 1 em h"),
                         h5("d) Subtraia 2 em h"),
                         h5("e) Some 3 em h ")
                         
                )
            )
            
        )
    )
)