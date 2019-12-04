ui<- shinyUI(fluidPage(
    
    
    titlePanel(span("Gráfico de barras e setores")),
    sidebarLayout(
        sidebarPanel(
            fileInput(inputId = "file" , label = 
                          'Use o botão "Browse" para localizar o arquivo com extensão
                  .txt (bloco de notas) que contém os dados.'),
            checkboxInput(inputId = 'header', label = 'Seus dados tem cabeçalho? Se sim, escolha essa opção.', value = FALSE),
            br(),
            selectInput("paula","Escolha um tipo de gráfico:",
                        c("Barras"="Barras","Setores"="Setores")),
            
            uiOutput("variavel"),
            
            selectInput(inputId = "Cor", 
                        label=span("Escolha uma cor para o gráfico:"), 
                        choices = colors(),
                        selected = "yellow")
        ),
        
        mainPanel(
            plotOutput("grafico"))
    )
))