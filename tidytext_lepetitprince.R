# mobi =======

mobi <- readr::read_lines("../../../Downloads/l'etranger.mobi")

mobi


# txt analysis =======
library(tidyverse)
library(rvest)
library(tidytext)
library(wordcloud)
library(SnowballC)

# downlaod le petit prince
txt_prep <- function(ch = "", link){
  url <- paste0(link,ch,".html")
  
  tmp <- url %>% 
    read_html() %>% 
    html_nodes("body") %>% 
    html_text(trim = T) %>% 
    #clean
    str_replace_all("\r\n","") %>% 
    str_split("\\.") %>% 
    unlist() %>% 
    head(-1) 
  
  tmp %>% 
    # make dataframe
    tibble(line = 1:length(tmp), text = tmp) %>% 
    select(line, text) %>% 
    mutate(chapter = ch)
  }

# L'etranger
txt_df <- txt_prep(link = "https://www.ebooksgratuits.com/html/camus_l_etranger")
# tidy text
# txt_prep(link = "http://microtop.ca/lepetitprince/chapitre", ch = "02")
txt_df <- purrr::map_dfr(str_pad(seq(1:27),2,"left","0"),txt_prep, link = "http://microtop.ca/lepetitprince/chapitre")

# stop words
stop_words <- get_stopwords("fr","stopwords-iso")

tidy_books <- txt_df %>% 
  unnest_tokens(word, text) %>% 
  anti_join(stop_words)

# stemming
tidy_books %>% 
  count(word) %>% 
  mutate(word_alt = wordStem(word, language = "fre")) %>%
  count(word_alt, sort = TRUE) %>% view()
  # group_by(chapter) %>%
  # count(word_alt, sort = TRUE) %>%
  # top_n(3) %>%
  # arrange(chapter)

  # skimr::skim()

  with(wordcloud(word, n, max.words = 100, random.color = T))

  # bigram
tidy_books_bi <- txt_df %>% 
  unnest_tokens(bigram, text, token = "ngrams", n = 2)

tidy_books_bi %>%
  separate(bigram, c("word1", "word2"), sep = " ") %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word) %>% 
  count(word1, word2, sort = TRUE)

