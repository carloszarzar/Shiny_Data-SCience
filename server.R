library(shiny)

shinyServer(
    function(input, output){
        output$ui <- renderUI({
            if(is.null(input$funcao)){
                return()}
            switch(input$funcao, 
                   "Linear"={
                       output$plot <- renderPlot({
                           curve(input$a*x + input$b,ylim=c(-10,10),xlim=c(-10,10),
                                 lwd=2,col=input$Cor,ylab="f(x)", main=expression(paste("y = f(x) = ", a*x+b)))
                           abline(v=-10:10,h=-10:10,col="gray", lwd=1,lty=2);  abline(v=0,col="black", lwd=2,lty=2);abline(h=0,col="black", lwd=2,lty=2)
                       })
                       wellPanel(sliderInput("a","Valor de a",min = -10,max = 10,step = 0.5,value = 1),
                                 sliderInput("b","Valor de b",min = -10,max = 10,step = 0.5,value = 1),
                                 helpText("Lembre-se:"),
                                 helpText("a e b são números reais."),
                                 helpText("Se a=0 temos uma função constante.")) },
                   
                   
                   "Quadratica"={
                       output$plot <- renderPlot({
                           curve(input$a*x^2 + input$b*x + input$c,ylim=c(-10,10),xlim=c(-10,10),
                                 lwd=2,col=input$Cor,ylab="f(x)", main=expression(paste("y = f(x) = ", a*x^2+b*x+c)))
                           abline(v=-10:10,h=-10:10,col="gray", lwd=1,lty=2);abline(v=0,col="black", lwd=2,lty=2);abline(h=0,col="black", lwd=2,lty=2)
                       })
                       wellPanel(sliderInput("a","Valor de a",min = -10,max = 10,step = 0.5,value = 1),
                                 sliderInput("b","Valor de b",min = -10,max = 10,step = 0.5,value = 1),
                                 sliderInput("c","Valor de c",min = -10,max = 10,step = 0.5,value = 1),
                                 helpText("Lembre se:"),
                                 helpText("a, b e c são números reais."),
                                 helpText("Além de a ser diferente de zero.")) },
                   
                   "Exponencial"={
                       output$plot <- renderPlot({
                           curve(input$a^x,ylim=c(-10,10),xlim=c(-10,10),
                                 lwd=2,col=input$Cor,ylab="f(x)",  main=expression(paste("y = f(x) = ", a^x)))
                           abline(v=-10:10,h=-10:10,col="gray", lwd=1,lty=2);abline(v=0,col="black", lwd=2,lty=2);abline(h=0,col="black", lwd=2,lty=2)
                       })
                       wellPanel(sliderInput("a","Valor de a",min = -10,max = 10,step = 0.1,value = 1),
                                 helpText("Lembre-se:"),
                                 helpText("a deve ser um número real maior que zero e diferente de 1.")) },
                   
                   "Modular"={
                       output$plot <- renderPlot({
                           curve(input$a*abs(x),ylim=c(-10,10),xlim=c(-10,10),
                                 lwd=2,col=input$Cor,ylab="f(x)", main=expression(paste("y = f(x) = ", a*group("|", x, "|"))))
                           abline(v=-10:10,h=-10:10,col="gray", lwd=1,lty=2);abline(v=0,col="black", lwd=2,lty=2);abline(h=0,col="black", lwd=2,lty=2)
                       })
                       wellPanel(sliderInput("a","Valor de a",min = -10,max = 10,step = 0.5,value = 1),
                                 helpText("Lembre-se:"),
                                 helpText("a deve ser um número real diferente de zero.")) },
                   
                   "Logaritmica"={
                       output$plot <- renderPlot({
                           curve(log(x,input$a),ylim=c(-10,10),xlim=c(-10,10),
                                 lwd=2,col=input$Cor,ylab="f(x)",  main=expression(paste("y = f(x) = " (log[a]*x) )))
                           abline(v=-10:10,h=-10:10,col="gray", lwd=1,lty=2);abline(v=0,col="black", lwd=2,lty=2);abline(h=0,col="black", lwd=2,lty=2)
                       })
                       wellPanel(sliderInput("a","Valor de a",min = -10,max = 10,step = 0.5,value = 1),
                                 helpText("Lembre-se:"),
                                 helpText("O valor de a deve ser um número real maior que zero e diferente de 1."))
                   })
        })
        
        
    }
)