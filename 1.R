exam <- read_excel("excel_exam.xlsx")
exam <- read.csv("csv_test.csv")
exam

exam %>% mutate(total = math+english+science)%>% head

exam %>% mutate(total = math+english+science, mean = total/3) %>% 
        arrange(desc(mean = (math+english+science)/3)) %>% head

library(ggplot2)
exam %>% group_by(class) %>%
  summarise(mean_total=mean(math+english+science)/3) %>%
  arrange(desc(mean_total))

test1<-data.frame(id=c(1:5),midterm=c(60,80,70,90,75))
test2<-data.frame(id=c(1:5),final=c(70,83,65,95,80))

total <- natual_join(test1,test2,by="id")
total

total %>% arrange(desc(midterm+final))