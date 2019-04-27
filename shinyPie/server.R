
options(shiny.maxRequestSize = 200*1024^2)

shinyServer(function(input, output, session) {
  
  
  # pieCharts
  # pie2d
  observe({
    if (input$submit1>0) {
      isolate({
        pie2d.height <<- input$pie2dHeight
        pie2d.width <<- input$pie2dWidth
        data.pie2d <- data.frame(fread(input$uploadPie2dData$datapath), stringsAsFactors = F)
        
        output$pie2d <- renderPlot({
          if (input$coltypePie2d == "1") {
            pie(data.pie2d[,2], labels = data.pie2d[,2], col=rainbow(nrow(data.pie2d)), main=input$pie2dTitle)
            legend("bottom", fill = rainbow(nrow(data.pie2d)), legend=data.pie2d[,1], 
                   box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
          } else {
            col.input <- gsub("\\s","", strsplit(input$colorPie2d, ",")[[1]])
            pie(data.pie2d[,2], labels = data.pie2d[,2], col=col.input, main=input$pie2dTitle)
            legend("bottom", fill = col.input, legend=data.pie2d[,1], box.col=NA, 
                   cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
          }
        }, height = pie2d.height, width = pie2d.width)
      })
    } else {
      NULL
    }
  })
  
  ## Download PDF file of pie2D
  output$downloadpie2d.pdf <- downloadHandler(
    filename <- function() { paste('pie2D.pdf') },
    content <- function(file) {
      pie2d.height <<- input$pie2dHeight
      pie2d.width <<- input$pie2dWidth
      data.pie2d <- data.frame(fread(input$uploadPie2dData$datapath), stringsAsFactors = F)
      
      pdf(file, width = 800/72, height = 720/72)
      if (input$coltypePie2d == "1") {
        pie(data.pie2d[,2], labels = data.pie2d[,2], col=rainbow(nrow(data.pie2d)), main=input$pie2dTitle)
        legend("bottom", fill = rainbow(nrow(data.pie2d)), legend=data.pie2d[,1], 
               box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
      } else {
        col.input <- gsub("\\s","", strsplit(input$colorPie2d, ",")[[1]])
        pie(data.pie2d[,2], labels = data.pie2d[,2], col=col.input, main=input$pie2dTitle)
        legend("bottom", fill = col.input, legend=data.pie2d[,1], box.col=NA, 
               cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
      }
      
      dev.off()
    }, contentType = 'application/pdf')
  ## Download svg file of pie2D
  output$downloadpie2d.svg <- downloadHandler(
    filename <- function() { paste('pie2D.svg') },
    content <- function(file) {
      pie2d.height <<- input$pie2dHeight
      pie2d.width <<- input$pie2dWidth
      data.pie2d <- data.frame(fread(input$uploadPie2dData$datapath), stringsAsFactors = F)
      
      svg(file, width = 800/72, height = 720/72)
      if (input$coltypePie2d == "1") {
        pie(data.pie2d[,2], labels = data.pie2d[,2], col=rainbow(nrow(data.pie2d)), main=input$pie2dTitle)
        legend("bottom", fill = rainbow(nrow(data.pie2d)), legend=data.pie2d[,1], 
               box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
      } else {
        col.input <- gsub("\\s","", strsplit(input$colorPie2d, ",")[[1]])
        pie(data.pie2d[,2], labels = data.pie2d[,2], col=col.input, main=input$pie2dTitle)
        legend("bottom", fill = col.input, legend=data.pie2d[,1], box.col=NA, 
               cex=1, border=NA, bty="n", ncol=input$legendncolpie2d)
      }
      
      dev.off()
    }, contentType = 'application/svg')
  
  # pie3d
  observe({
    if (input$submit2>0) {
      isolate({
        pie3d.height <<- input$pie3dHeight
        pie3d.width <<- input$pie3dWidth
        data.pie3d <- data.frame(fread(input$uploadPie3dData$datapath), stringsAsFactors = F)
        
        output$pie3d <- renderPlot({
          if (input$coltypePie3d == "1") {
            par(mar = c(3,4,4,2) + 0.1)
            pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=rainbow(nrow(data.pie3d)), main=input$pie3dTitle,
                  explode=input$explodepie3d, radius=input$radiuspie3d, 
                  labelcex=input$labelSize, theta=pi * input$thetapie3d)
            legend("bottom", fill = rainbow(nrow(data.pie3d)), legend=data.pie3d[,1], 
                   box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
          } else {
            col.input <- gsub("\\s","", strsplit(input$colorPie3d, ",")[[1]])
            par(mar = c(3,4,4,2) + 0.1)
            pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=col.input, main=input$pie3dTitle,
                  explode=input$explodepie3d, radius=input$radiuspie3d, 
                  labelcex=input$labelSize, theta=pi * input$thetapie3d)
            legend("bottom", fill = col.input, legend=data.pie3d[,1], box.col=NA, 
                   cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
          }
        }, height = pie3d.height, width = pie3d.width)
      })
    } else {
      NULL
    }
  })
  
  ## Download PDF file of pie3D
  output$downloadpie3d.pdf <- downloadHandler(
    filename <- function() { paste('pie3D.pdf') },
    content <- function(file) {
      pie3d.height <<- input$pie3dHeight
      pie3d.width <<- input$pie3dWidth
      data.pie3d <- data.frame(fread(input$uploadPie3dData$datapath), stringsAsFactors = F)
      
      pdf(file, width = 800/72, height = 720/72)
      if (input$coltypePie3d == "1") {
        par(mar = c(3,4,4,2) + 0.1)
        pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=rainbow(nrow(data.pie3d)), main=input$pie3dTitle,
              explode=input$explodepie3d, radius=input$radiuspie3d, 
              labelcex=input$labelSize, theta=pi * input$thetapie3d)
        legend("bottom", fill = rainbow(nrow(data.pie3d)), legend=data.pie3d[,1], 
               box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
      } else {
        col.input <- gsub("\\s","", strsplit(input$colorPie3d, ",")[[1]])
        par(mar = c(3,4,4,2) + 0.1)
        pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=col.input, main=input$pie3dTitle,
              explode=input$explodepie3d, radius=input$radiuspie3d, 
              labelcex=input$labelSize, theta=pi * input$thetapie3d)
        legend("bottom", fill = col.input, legend=data.pie3d[,1], box.col=NA, 
               cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
      }
      
      dev.off()
    }, contentType = 'application/pdf')
  ## Download SVG file of pie3D
  output$downloadpie3d.svg <- downloadHandler(
    filename <- function() { paste('pie3D.svg') },
    content <- function(file) {
      pie3d.height <<- input$pie3dHeight
      pie3d.width <<- input$pie3dWidth
      data.pie3d <- data.frame(fread(input$uploadPie3dData$datapath), stringsAsFactors = F)
      
      svg(file, width = 800/72, height = 720/72)
      if (input$coltypePie3d == "1") {
        par(mar = c(3,4,4,2) + 0.1)
        pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=rainbow(nrow(data.pie3d)), main=input$pie3dTitle,
              explode=input$explodepie3d, radius=input$radiuspie3d, 
              labelcex=input$labelSize, theta=pi * input$thetapie3d)
        legend("bottom", fill = rainbow(nrow(data.pie3d)), legend=data.pie3d[,1], 
               box.col=NA, cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
      } else {
        col.input <- gsub("\\s","", strsplit(input$colorPie3d, ",")[[1]])
        par(mar = c(3,4,4,2) + 0.1)
        pie3D(data.pie3d[,2], labels = data.pie3d[,2], col=col.input, main=input$pie3dTitle,
              explode=input$explodepie3d, radius=input$radiuspie3d, 
              labelcex=input$labelSize, theta=pi * input$thetapie3d)
        legend("bottom", fill = col.input, legend=data.pie3d[,1], box.col=NA, 
               cex=1, border=NA, bty="n", ncol=input$legendncolpie3d)
      }
      
      dev.off()
    }, contentType = 'application/svg')
  
  
})



