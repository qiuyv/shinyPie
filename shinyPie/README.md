<h1><center> Usage and installation of shinyPie </center></h1>

This is the repository for the Shiny application presented in "shinyPie: make pie chart in R with shiny .

*****


#	Use shinyPie online

shinyPie is deployed at http://127.0.0.1:5520/for online use.  
shinyPie is idle until you activate it by accessing the URLs.  
So, it may take some time when you access this URL for the first time.   
Once it was activated, shinyPie could be used smoothly and easily.

*****

#	Launch shinyPie directly from R 

User can choose to run shinyPie installed on local computers (Windows, Mac or Linux) for a more preferable experience.

**Step 1: Install R and RStudio**

Before running the app you will need to have R and RStudio installed (tested with <font color="red">R 3.5.0</font> and RStudio 1.1.419).  
Please check CRAN (https://cran.r-project.org/) for the installation of R.  
Please check https://www.rstudio.com/ for the installation of RStudio.  

**Step 2: Install the R Shiny package and other packages required by shinyPie**

Start an R session using RStudio and run these lines:  
```
# try an http CRAN mirror if https CRAN mirror doesn't work
install.packages("shiny")
install.packages("data.table")
install.packages("shinythemes")
install.packages("shinyBS")
library(plotrix)
```

**Step 3: Start the app**  

Start an R session using RStudio 
*****

#	Deploy shinyPie on local or web Linux server

**Step 1: Install R**  

Please check CRAN (https://cran.r-project.org/) for the installation of R.

**Step 2: Install the R Shiny package and other packages required by shinyPie**  

Start an R session and run these lines in R:  
```
# try an http CRAN mirror if https CRAN mirror doesn't work  
install.packages("shiny")
install.packages("data.table")
install.packages("shinythemes")
install.packages("shinyBS")
```

For more information, please check the following pages:  
https://cran.r-project.org/web/packages/shiny/index.html  
https://github.com/rstudio/shiny  
https://shiny.rstudio.com/  

**Step 3: Install Shiny-Server**

Please check the following pages for the installation of shiny-server.  
https://www.rstudio.com/products/shiny/download-server/  
https://github.com/rstudio/shiny-server/wiki/Building-Shiny-Server-from-Source  

**Step 4: Upload files of shinyPie**

Put the directory containing the code and data of shinyPie to /srv/shiny-server.  

**Step 5: Configure shiny server (/etc/shiny-server/shiny-server.conf)**

```
# Define the user to spawn R Shiny processes
run_as shiny;

# Define a top-level server which will listen on a port
server {  
  # Use port 3838  
  listen 3838;  
  # Define the location available at the base URL  
  location /shinyPie {  
    # Directory containing the code and data of shinyPie  
    app_dir /srv/shiny-server/shinyPie;  
    # Directory to store the log files  
    log_dir /var/log/shiny-server;  
  }  
}  
```

**Step 6: Change the owner of the shinyPie directory**

```
$ chown -R shiny /srv/shiny-server/shinyPie  
```

**Step 7: Start Shiny-Server**

```
$ start shiny-server  
```

Now, the shinyPie app is available at http://IPAddressOfTheServer:3838/shinyPie/.  


