# 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
install.packages("stringi")
# devtools 는 깃허브에 공유된 패키지를 사용할 수 있음
install.packages("devtools")
# kormaps2014 패키지에는 몇 가지 지역별 통계 정보가 포함됨
devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)
library(ggiraphExtra)
library(dplyr)
library(ggplot2)
library(ggiraphExtra)

str(changeCode(korpop1))
korpop1

korpop1 <- rename(korpop1,
                  pop = "총인구_명",
                  name = "행정구역별_읍면동")

str(changeCode(kormap1))

ggChoropleth(data = korpop1, # 지도에 표현할 데이터
             aes(fill = pop, # 색깔로 표현할 변수
                 map_id = "code", # 지역 기준 변수
                 tooltip = "name"), # 지도 위에 표시할 지역명
             map = kormap1, # 지도 데이터
             interactive = T) # 인터랙티브

str(changeCode(tbc))

ggChoropleth(data = tbc, # 지도에 표현할 데이터
             aes(fill = NewPts, # 색깔로 표현할 변수
                 map_id = "code", # 지역 기준 변수
                 tooltip = "name"), # 지도 위에 표시할 지역명
             map = kormap1, # 지도 데이터
             interactive = T) # 인터랙티브
