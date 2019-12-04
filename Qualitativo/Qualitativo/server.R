server<- function(input,output){ 
    
    dadosX<- reactive({
        dados <- input$file1
        if (is.null(dados)) return(NULL)
        read.csv(dados$datapath, header=input$header)  
    })
    
    output$variavel <- renderUI({
        df <- dadosX()
        if (is.null(df)) return(NULL)
        items=names(df)
        names(items)=items
        selectInput("variavel","Escolha uma variável:",
                    items,
                    multiple=FALSE)
    })
    
    output$grafico<- renderPlot({
        dadosXX <- dadosX()[,1] 
        n<- length(dadosXX)      # tamanho da amostra#
        dados<- as.matrix(dadosXX,n,1)
        A<- diff(range(dados))   #max(dados)-min(dados) #amplitude dos dados#
        nclas<- round(sqrt(n)) #numero de classes#
        c<- A/(nclas-1)   #amplitude de classes#####
        clas<-matrix(0,nclas,2)
        freq<-matrix(0,nclas,1)
        li<-min(dados)-c/2  # Limite inferior primeira classe
        clas[,1]<-seq(li,li+c*(nclas-1),c) # cria todos os LI
        clas[,2]<-seq(li+c,li+c*nclas,c)   # cria todos os LS
        Clas <- round(clas,4)
        x<-c(dados[,1])
        bins<-c(Clas[,1], max(Clas[,2] ))
        hist(x, breaks=bins, xlim=c(min(clas[,1])-c/2,max(clas[,2])+ c/2), 
             main=paste("Histograma da variável", input$variavel), xaxt="n", xlab=" ", ylab="Frequência", col = input$Cor)
        axis(1,at=bins, las=2)
    },height = 350, width = 600)
    
    output$tdf <- renderPrint({
        dadosXX <- dadosX()[,1] 
        n<-length(dadosXX)      # tamanho da amostra#
        dados<- as.matrix(dadosXX,n,1)
        
        minimo <- min(dados)
        maximo <- max(dados)
        media <- mean(dados)
        mediana <- median(dados)
        # criando a tabela #
        tab<-cbind(minimo, maximo, media, mediana)
        colnames(tab)<-c("Mínimo","Máximo", "Média", "Mediana")
        tab
    })
}