

shinyUI(
  navbarPage(
    title = "shinypie", 
    theme = shinytheme("journal"), 
    windowTitle = "make pie charts in R with shiny",
    
      tabPanel(
        "pie2D",
        
        sidebarPanel(
          fileInput("uploadPie2dData", h4("Upload input data",
                                          bsButton("bs1", label="", icon=icon("question"), style="info", size="small")
                                          ), multiple = FALSE),
          bsPopover("bs1", "单击“Browse”上传数据，数据集应该具有两列，两列的顺序是固定的。列名是可选的，第一列只能是数据的种类，第二列是每个种类的百分比。",
                    trigger = "focus"),
          actionButton("submit1", strong("Go!")),
          
          br(),
          h4("Plot options"),
          
          radioButtons("coltypePie2d", h4("Data color",
                                          bsButton("bs2",label = "",icon = icon("question"),style = "info",size = "small")
                                          ), c("Random" = "1", "Custom" = "2"), selected="1"),
          bsPopover("bs2","用于渲染数据的颜色，可以由应用程序随机分配，也可以由用户指定。默认情况下，将使用shinypie指定的颜色。若要自定义数据的一种颜色，用户应给每个数据选择颜色。",
                    trigger = "focus"),
        
          conditionalPanel(condition="input.coltypePie2d=='2'",	
                           textInput("colorPie2d", NULL, value="red,blue,cyan,gold,grey50")),
          
          textInput("pie2dTitle", h4("Title:",
                                     bsButton("bs3",label = "",icon = icon("question"),style = "info",size = "small")
                                     ),value = c("pie Chart 2D")),
          bsPopover("bs3","命名这个数据的饼图。",trigger = "focus"),
          numericInput("legendncolpie2d",h4(HTML("Legend column:"),
                                            bsButton("bs4",label = "",icon = icon("question"),style = "info",size = "small")
                                            ),value=5, min=1, max=10, step=1),
          bsPopover("bs4","[1，10]中的一个整数，用于调整数据排成几列。",
                    trigger = "focus"),
          checkboxInput("pie2dSize", "Adjust plot size", FALSE),
          conditionalPanel(
            condition = "input.pie2dSize",
            numericInput("pie2dHeight", "Plot height:", value = 550),
            numericInput("pie2dWidth", "Plot width:", value = 750)
          )
        ),
        
        mainPanel(
          downloadButton("downloadpie2d.pdf", "Download pdf-file"),
          downloadButton("downloadpie2d.svg", "Download svg-file"),
          plotOutput("pie2d", height = '100%', width = '100%')
          
        )
      ),
      
    
    tabPanel("pie3D",
             sidebarPanel(
               fileInput("uploadPie3dData", h4("Upload input data",
                                               bsButton("bs5",label = "",icon = icon("question"),style = "info",size = "small")
                                               ),multiple = FALSE),
               bsPopover("bs5"," 单击“Browse”上传数据，数据集应该具有两列，两列的顺序是固定的。列名是可选的，第一列只能是数据的种类，第二列是每个种类的百分比。",
                         trigger = "focus"),      
               actionButton("submit2", strong("Go!")),
               
               br(),
               h4("Plot options"),
               
               radioButtons("coltypePie3d", h4("Data color",
                                               bsButton("bs6",label = "",icon = icon("question"),style = "info",size = "small")
                                               ), c("Random" = "1", "Custom" = "2"), selected="1"),
               bsPopover("bs6","用于渲染数据的颜色，可以由应用程序随机分配，也可以由用户指定。默认情况下，将使用shinypie指定的颜色。若要自定义数据的一种颜色，用户应给每个数据选择颜色。",
                         trigger = "focus"),
               conditionalPanel(condition="input.coltypePie3d=='2'",	
                                textInput("colorPie3d", NULL, value="red,blue,cyan,gold,grey50")),
               
               textInput("pie3dTitle", h4("Title:",
                                          bsButton("bs7",label = "",icon = icon("question"),style = "info",size = "small")
                                          ), value = c("pie Chart 3D")),
               bsPopover("bs7","命名这个数据的饼图。",trigger = "focus"),
               
               numericInput("explodepie3d", h4(HTML("Explode:"),
                                               bsButton("bs8",label = "",icon = icon("question"),style = "info",size = "small")
                                                ),value=0.18, min=0, max=1, step=0.02),
               bsPopover("bs8","[0，1]中的一个十进制数，用于调整饼块之间的距离。",
                         trigger = "focus"),
               numericInput("radiuspie3d", h4(HTML("Radius:"),
                                              bsButton("bs9",label = "",icon = icon("question"),style = "info",size = "small")
                                              ),value=0.8, min=0, max=1, step=0.1),
               bsPopover("bs9","[0，1]中的一个十进制数，用于调整饼图的半径。",
                         trigger = "focus"),
               numericInput("labelSize", h4(HTML("Label size:"),
                                            bsButton("bs10",label = "",icon = icon("question"),style = "info",size = "small")
                                            ),value=0.8, min=0.5, max=1.5, step=0.1),
               bsPopover("bs10","[0，1.5]中的一个十进制数，用于调整数据在图中的大小。",trigger = "focus"),
               numericInput("thetapie3d", h4(HTML("Theta:"),
                                             bsButton("bs11",label = "",icon = icon("question"),style = "info",size = "small")
                                             ),value=0.3, min=0, max=1, step=0.1),
               bsPopover("bs11","[0，1]中的一个十进制数，用于调整饼图的倾斜度。",trigger = "focus"),
               numericInput("legendncolpie3d", h4(HTML("Legend column:"),
                                                  bsButton("bs12",label = "",icon = icon("question"),style = "info",size = "small")
                                                  ),value=5, min=1, max=10, step=1),
               bsPopover("bs12","[1，10]中的一个整数，用于调整数据排成几列。",
                         trigger = "focus"),
               
               checkboxInput("pie3dSize", "Adjust plot size", FALSE),
               conditionalPanel(
                 condition = "input.pie3dSize",
                 numericInput("pie3dHeight", "Plot height:", value = 550),
                 numericInput("pie3dWidth", "Plot width:", value = 750)
               )
             ),
             
             mainPanel(
               downloadButton("downloadpie3d.pdf", "Download pdf-file"),
               downloadButton("downloadpie3d.svg", "Download svg-file"),
               plotOutput("pie3d", height = '100%', width = '100%')
               
             )
               
    ),
    tabPanel("Usage and installation", includeMarkdown("README.md")),
    tabPanel("Application instruction", includeHTML("Application_instruction.html")),
      
     tabPanel("About",includeMarkdown("About.md"))
))

