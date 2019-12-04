ui<- fluidPage(
    titlePanel(span("Gráfico para dados mensurados")),
    sidebarLayout(
        sidebarPanel(
            fileInput('file1', 'Use o botão "Browse" para localizar o arquivo com extensão
                  .txt (bloco de notas) que contém os dados.', 
                      accept=c('text/csv','text/comma-separated-values,text/plain', '.csv')),
            tags$hr(),
            checkboxInput('header', 'Seus dados têm cabeçalho? Se sim, escolha essa opção.', TRUE),
            
            uiOutput("variavel"),
            
            selectInput(inputId = "Cor", 
                        label=span("Escolha uma cor para o gráfico:"), 
                        choices = colors(),
                        selected = "yellow")
            
        ),
        mainPanel(
            plotOutput("grafico"),
            h4("Medidas estatísticas"),
            verbatimTextOutput("tdf")
            
        )
    )
)