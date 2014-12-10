require 'debugger'
# require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 (5 points) By simply increasing the number of assets (e.g.,
# assets > 30) in any portfolio, you can diversify your exposure to
# specific/idiosyncratic risk.  True.  False.
 
answers << false

# Question 2 (10 points) You have an equally-weighted portfolio that consists
# of equity ownership in three firms. Firm X is trading at $19 per share and
# has a beta of 1.40; Firm Y is trading at $87 per share with a beta of 2.00;
# Firm Z is trading at $21 per share with a beta of 0.70. Assume a risk free
# rate of 2.5% and market return of 8%. If each stock has a standard deviation
# of 35% and the stocks have a correlation of 0.25 with each other, your
# portfolio's expected return is closest to 14%.  12%.  8%.  10%.

XPrice = 19
XBeta  = 1.4
YPrice = 87
YBeta  = 2.0
ZPrice = 21
ZBeta  = 0.7

answers << "Not attempted"

# Question 3 (10 points) You have a portfolio that consists of equity
# ownership in three firms. You own 400 shares of Stout Drink Company (SDC),
# 300 shares of Carbon Computing (CC) and 300 shares of Serrano Foods
# (SF). Their current share prices are $82, $46, and $124, respectively. What
# is the weight of SF in your portfolio? (Enter the answer with no more nor
# less than two decimal places, and leave off the % sign. For example, if your
# answer is 13.97% you should enter it as 13.97 NOT 0.14 nor 14) Answer for
# Question 3

SDCShares = 400
SDCPrice  = 82
CCShares  = 300
CCPrice   = 46
SFShares  = 300
SFPrice   = 124

TotalBasket = ((SDCShares * SDCPrice) + (CCShares + CCPrice) + (SFShares * SFPrice)).to_f
SFWeight = (100 * (SFShares * SFPrice)/TotalBasket).round(2)

# 52.88%

answers << SFWeight

# Question 4 (10 points) With everyone nervous about their investments after
# the recent financial crisis, suppose a new firm, Safety Net Insurance (SNI),
# emerges to sell people insurance against poorly performing markets in
# exchange for an annual premium. As an investor in SNI, you would expect this
# company's share to have a beta that is: Close to zero.  Positive.  Negative.

answers << "Negative"

# Question 5 (10 points) Suppose there are three securities (X, Y, and Z) to
# choose from to create your portfolio. Next year the economy will be in an
# expansion, normal, or recession state with probabilities 0.30, 0.50, and
# 0.20, respectively. The returns (%) on the securities in these states are as
# follows: Security X {expansion = +12, normal = +7, recession = 0}; Security
# Y {+7, +6, +5}; Security Z {-1, 0, +6}. You are considering 4 potential
# portfolios of these 3 securities, with the following specific weights on
# each: Portfolio I (0.20, 0.40, 0.40); Portfolio II (0.34, 0.33, 0.33);
# Portfolio III (0.50, 0.25, 0.25); Portfolio IV (0.15, 0.70, 0.15); where the
# numbers in each parentheses are (weight of X, weight of Y, weight of
# Z). Which portfolio has the lowest risk?  Portfolio II.  Portfolio I.
# Portfolio III.  Portfolio IV.

answers << "Not attempted"

# Question 6 (10 points) The FTSE 100 is an index of the 100 largest market
# capitalization stocks traded on the London Stock Exchange. You think that
# 100 stocks are too much to keep up with, so you want to drop that number to
# 50. By doing this, what is the percentage drop in the UNIQUE relations
# between any two stocks in your portfolio that you will have to worry about? 
# (Enter the answer with no more nor less than two decimal places, and leave
# off the % sign. For example, if your answer is 13.97% you should enter it as
# 13.97 NOT 0.14 nor 14) Answer for Question 6


answers << "Not attempted"

# Question 7 (10 points) Given the definition of beta in the context of the
# CAPM, a stock with low beta can have more volatility (variance or standard
# deviation) than a stock with high beta.  False.  True.

answers << "Not attempted"

# Question 8 (10 points) Suppose CAPM works, and you know that the expected
# returns on IBM and Google are estimated to be 11% and 9.5%,
# respectively. You have just calculated extremely reliable estimates of the
# betas of IBM and Google to be 1.25 and 0.95, respectively. Given this data,
# what is a reasonable estimate of the market risk-premium (the
# average/expected difference between the market return and the risk-free
# rate)? (Enter the answer with no more nor less than two decimal places, and
# leave off the % sign. For example, if your answer is 13.97% you should enter
# it as 13.97 NOT 0.14 nor 14) Answer for Question 8

answers << "Not attempted"

# Question 9 (10 points) The standard deviation of a portfolio's return is the
# weighted average of the standard deviations of the returns of all securities
# in the portfolio, where the weights are proportional to the amount of your
# investment in a security relative to your total investment.  False.  True.

answers << "Not attempted"

# Question 10 (15 Points) Your own company has been very successful in
# producing and selling rocket engines. Given that airplane engines are not
# that cheap, and the airline industry is extremely sensitive to the market,
# the beta of your company is 2.50. The market risk premium (the
# average/expected difference between the market return and the risk-free
# rate) is 4.00% and the return on a long-term government bond is 2.50%. You
# have discovered an exciting opportunity to create a new wireless device that
# will cover a whole state in the U.S. with one station. This project will
# require a $4 billion investment, spread out equally between now (t = 0) and
# the end of this year (t = 1), and will produce $500 million dollars in
# perpetuity starting in year 2 (t = 2). Should you proceed with this project?

answers << "Not attempted"

puts "Answers to HW #8"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}
