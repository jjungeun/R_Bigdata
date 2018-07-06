install.packages("ggiraphExtra")
library(ggiraphExtra)

#미국 주별 범죄데이터 준비
# r에 내장된 USArrests 데이터는 1973년 미국 주별 강력 범죄율 정보임
str(USArrests)
head(USArrests)

library(tibble)

#행 이름을 state변수로 바꿔 데이터 프레임 생성
crime <- rownames_to_column(USArrests,var = "state")
crime
#지도 데이터와 동일하게 맞추기 위해 state의 값을 소문자로
crime$state<-tolower(crime$state)
crime

str(crime)

#미국 주지도 데이터 준비
#단계 구분도를 만들기 위해 위도,경도정보가 있는 지도필요
#R의 maps패키지의 미국 주별 위경도를 나타낸 state데이터얻기
library(ggplot2)
states_map<-map_data("state")
str(states_map)

##단계 구분도
ggChoropleth(data = crime,    #지도에 표현할 데이터
             aes(fill = Murder, #색으로 표현할 변수
                 map_id = "state"), #지역 기준변수
             map= states_map) #지도 데이터

##인터랙티브 단계 구분도
ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = "state"),
             map=states_map,
             interactive = T)
