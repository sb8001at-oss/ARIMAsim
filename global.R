library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
library(stringr)
library(forecast)
library(patchwork)
library(tseries)
library(urca)
library(showtext)

font_paths("./")
font_add("noto", "NotoSansJP-VariableFont_wght.ttf")
showtext_auto()

sum_ma <- function(ma_){
  sum_MA <- 2
  while(sum(sum_MA) > 1){
    sum_MA <- runif(ma_, -1, 1)
  }
  sum_MA
}
