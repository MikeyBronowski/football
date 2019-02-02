k<- 0
for (k in 0:3){
matches <- ""
final <- ""
#season_years <- "2014-15"
season_years <- paste0("201",k,"-1",k+1)
for (i in 1:38) {
  URL1 <- paste0("http://www.legaseriea.it/en/serie-a/fixture-and-results/",season_years,"/UNICO/UNI/",i)
  WS <- read_html(URL1)
  #URLs <- WS %>% html_nodes(".link-matchreport br+ a") %>% html_attr("href") 
  URLs <- WS %>% html_nodes(".link-matchreport a") %>% html_attr("href") 

#  temp <- data.frame(URLs)
  temp <- data.frame(paste0("http://www.legaseriea.it",URLs))
  final <- rbind(final,temp)
  #final <-final[complete.cases(final), ]
  
  cat("#")
  } 

final <-final[complete.cases(final), ]
matches<-final %>% data.frame()

final_file <- paste0("C:/Users/M/OneDrive/J/2018_2019/Lega_Calcio_",season_years,"_matches.csv")
write.table(matches, file = final_file, row.names = FALSE, append = TRUE, sep = ",", col.names = FALSE)
}