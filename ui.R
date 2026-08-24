ui <- 
  page_sidebar(
    # Application title
    title = "ARIMAシミュレーター", 
    theme = bs_theme(bootswatch = "united"),  
    sidebar = sidebar(
      card(
        numericInput("ar_d", label="AR（自己回帰）の次数", value=0, min=0, max=15, step=1),
        numericInput("ma_d", label="MA（移動平均）の次数", value=0, min=0, max=15, step=1),
        textInput("intr_v", label="切片項", value = 0),
        numericInput("i_d", label="I（和分）の次数", value=0, min=0, max=15, step=1),
        textInput("sd_v", label="標準偏差", value = 1),
        numericInput("n_d", label="時系列の長さ", value=100, min=100, max=1500, step=1),
        actionButton("runculc", label="実行")
      ),
      tags$a(href="https://github.com/sb8001at/ARIMAsim", "sb8001at/ARIMAsim"),
      tags$a(href = "https://github.com/sb8001at/ARIMAsim", icon("github")),
      tags$p("Rから以下のコードで実行すると、ローカルPCで動かすことができます。"),
      tags$p(code("if(require(shiny)){install.packages(\"shiny\")};runGitHub(\"ARIMAsim\", \"sb8001at\")"))
    ),
    navset_card_underline(
      nav_panel(
        "時系列と自己回帰",
        card(full_screen = TRUE, card_header("グラフ"), plotOutput("tsplot"))
      ),
      nav_panel(
        "統計",
        card(
          card_header("ar関数の結果"),
          verbatimTextOutput("ar")
        ),
        card(
          card_header("auto.arima関数の結果"),
          verbatimTextOutput("autoarima")
        ),
        card(
          card_header("設定値"),
          layout_column_wrap(
            max_height = 100,
            value_box(
              title = "ARの係数",
              value = textOutput("ar_p")
            ),
            value_box(
              title = "MAの係数",
              value = textOutput("ma_p")
            )
          ),
          p("（前から1次、2次…）")
        )
      ),
      nav_panel(
        "単位根検定",
        card(
          card_header("ADF検定"),
          verbatimTextOutput("adf"),
          p("（棄却された場合は単位根がない）")
        ),
        card(
          card_header("KPSS検定"),
          verbatimTextOutput("kpss"),
          p("（test-statisticとcritical valuesを比較し、test-statisticの方が大きい場合は単位根がある）")
        )
      )
    )
  )