#R 그래프 - 선점도
library(ggplot2)

#1.배경설정 - x축은 displ y축은 hwy로 지정해 배경 설정
graph = ggplot(data=mpg,aes(x=displ,y=hwy))
graph

#2.그래프 추가 - 배경에 산점도 추가
graph + geom_point()

#3.축 범위를 조정 - 축범위는 xlim(), ylim()를 이용
graph + geom_point()+xlim(3, 6) + ylim(10,30)

#R 그래프 - 막대그래프
library(dplyr)

df_mpg <-mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))
df_mpg

ggplot(data=df_mpg,aes(x=drv,y=mean_hwy))+geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()
ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#R 그래프 - 시계열그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
ggplot(data = economics, aes(x=date, y=psavert)) + geom_line()




