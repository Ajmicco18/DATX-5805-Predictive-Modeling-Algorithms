nba <- read.csv("nba_data.csv")

#Creating test and train data sets
n=nrow(nba) 
smp_size = ceiling(0.5 * n)  
set.seed(1) 
ind = sample(1:n, size = smp_size) 
train.NBA = nba[ind, ]  # training data 
test.NBA = nba[-ind, ]  # test data

#fitting logistic model
library("nnet")
logit.nba <- multinom(all_nba ~ g + gs + mp_per_game + fg_percent+
                       x3p_percent + x2p_percent + ft_percent +
                        trb_per_game + ast_per_game + stl_per_game +
                        blk_per_game + tov_per_game + pts_per_game,
                      data = train.NBA)

summary(logit.nba)
