if(!require(pacman)) install.packages("pacman")
pacman::p_load(shiny, bslib, ggplot2, dplyr, stringr, forecast, patchwork, tseries, urca, showtext)

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
