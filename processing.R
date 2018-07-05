#결측치가 들어온 경우 데이터 전처리
df<-data.frame(sex = c("M","F",NA,"M","F"),score=c(5,4,3,4,NA))
df

is.na(df) #x가 결측치면 true
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

df %>% filter(is.na(score)) #score가 NA인 데이터만 출력

df %>% filter(!is.na(score)) #score 결측치 제거
df_nomiss <-df %>% filter(!is.na(score))

#모든 결측치 제거방법 2가지
df_nomiss1 <- df %>% filter(!is.na(score)&!is.na(sex))
df_nomiss1
df_nomiss2 <- na.omit(df)
df_nomiss2

#-------------#
#이상치가 들어온 경우 데이터 전처리
outlier<-data.frame(sex=c("F","M","X","F","F","M"), score=c(5,4,3,2,6,1))
#성별이 F나M이 아니면 NA할당
outlier$sex<-ifelse((outlier$sex !="F" & outlier$sex !="M"),NA,outlier$sex)
#score가 5보다 크면 NA할당
outlier$score <- ifelse(outlier$score >5,NA,outlier$score)

#결측치 제외하여 score평균 계산, 내림차순정렬
outlier %>% filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score)) %>%
  arrange(desc(score))
outlier


