server<- shinyServer(function(input, output) {
    
    
    dados <- reactive({
        file1 <- input$file
        if(is.null(file1)){return(NULL)}
        read.table(file=file1$datapath, sep = input$sep,header=input$header)
    })
    
    output$variavel <- renderUI({
        df <- dados()
        if (is.null(df)) return(NULL)
        items=names(df)
        names(items)=items
        selectInput("variavel","Escolha uma variável:",
                    items,
                    multiple=FALSE)
    })
    
    library(plotrix)
    output$grafico<- renderPlot({
        df <- dados()
        dados<- data.frame(df)
        if (input$paula=="Barras") barplot(table(dados[,input$variavel]), 
                                           main=paste("Gráfico de barras da variável", input$variavel),
                                           ylim = c(0,1.2*max(table(dados[,input$variavel]))),
                                           col=input$Cor, xlab=input$variavel, ylab="Frequência")
        else pie(table(dados[,input$variavel]), radius = 0.9, main=paste("Gráfico de setores da variável", input$variavel))
    })
    
})
