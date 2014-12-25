require 'debugger'
# require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 (5 points) By simply increasing the number of assets (e.g.,
# assets > 30) in any portfolio, you can diversify your exposure to
# specific/idiosyncratic risk.  True.  False.
 
# if all of your assets have 100% correlation, the number of assets is immaterial
# As an example, BRK.A and BRK.B have 100% correlation by definition

answers << false

# Question 2 (10 points) You have an equally-weighted portfolio that consists
# of equity ownership in three firms. Firm X is trading at $19 per share and
# has a beta of 1.40; Firm Y is trading at $87 per share with a beta of 2.00;
# Firm Z is trading at $21 per share with a beta of 0.70. Assume a risk free
# rate of 2.5% and market return of 8%. If each stock has a standard deviation
# of 35% and the stocks have a correlation of 0.25 with each other, your
# portfolio's expected return is closest to 14%.  12%.  8%.  10%.

stocks = {:X=>{:price=>19, :beta=>1.4, :sdev=>0.35},
          :Y=>{:price=>87, :beta=>2.0, :sdev=>0.35},
          :Z=>{:price=>21, :beta=>0.7, :sdev=>0.35}}

question2Rate         = 0.025
question2MarketReturn = 0.080

question2Matrix = [1.00, 0.25, 0.25,
                   0.25, 1.00, 0.25,
                   0.25, 0.25, 1.00]


# a stock's expected return given the risk free rate r_f and the market return r_m
# is r_s = r_f + (r_m - r_f) * beta_s

r_f = 0.025
r_m = 0.08

r_X = r_f + (r_m - r_f) * stocks[:X][:beta]
r_Y = r_f + (r_m - r_f) * stocks[:Y][:beta]
r_Z = r_f + (r_m - r_f) * stocks[:Z][:beta]

question2ReturnArray = [r_X, r_Y, r_Z]

# Assume a hypothetical portfolio of 11571*3, 11571 being LCM(19,87,21)
portfolioValue = 11571*3

portfolio2 = [portfolioValue/(stocks[:X][:price]),portfolioValue/stocks[:Y][:price],portfolioValue/stocks[:Z][:price]]

totalReturn = question2ReturnArray.zip(portfolio2).inject(0) { |h,elt| h = h + elt[0]/3 }

answers << (totalReturn * 100).round(2)

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

TotalBasket = ((SDCShares * SDCPrice) + (CCShares * CCPrice) + (SFShares * SFPrice)).to_f

SFWeight = (100 * (SFShares * SFPrice)/TotalBasket).round(2)

# 44.39

answers << SFWeight

# Question 4 (10 points) With everyone nervous about their investments after
# the recent financial crisis, suppose a new firm, Safety Net Insurance (SNI),
# emerges to sell people insurance against poorly performing markets in
# exchange for an annual premium. As an investor in SNI, you would expect this
# company's share to have a beta that is: Close to zero.  Positive.  Negative.

# When the market is doing well, the company pockets the premiums. When the
# market is doing poorly, it pays out. Therefore, the company is profitable
# when the market is profitable and therefore has a positive BETA.

answers << "Positive"

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

economy5 = [0.30, 0.50, 0.20]

Xgrowth  = [  12,    7,    0]
Ygrowth  = [   7,    6,    5]
Zgrowth  = [  -1,    0,    6]

PortfolioI   = [0.20,  0.40, 0.40]
PortfolioII  = [0.34,  0.33, 0.33]
PortfolioIII = [0.50,  0.25, 0.25]
PortfolioIV  = [0.15,  0.70, 0.15]

Xmean     = economy5.zip(Xgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Ymean     = economy5.zip(Ygrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Zmean     = economy5.zip(Zgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Xvariance = economy5.zip(Xgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Xmean)**2) }
Yvariance = economy5.zip(Ygrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Ymean)**2) }
Zvariance = economy5.zip(Zgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Zmean)**2) }

Xsdev     = Xvariance**0.5
Ysdev     = Yvariance**0.5
Zsdev     = Zvariance**0.5

XYcov     = economy5.zip(Xgrowth.zip(Ygrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Xmean) * (elt[1][1] - Ymean)) }
YZcov     = economy5.zip(Ygrowth.zip(Zgrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Ymean) * (elt[1][1] - Zmean)) }
XZcov     = economy5.zip(Xgrowth.zip(Zgrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Xmean) * (elt[1][1] - Zmean)) }

XYrho     = XYcov/(Xsdev * Ysdev)
YZrho     = YZcov/(Ysdev * Zsdev)
XZrho     = XZcov/(Xsdev * Zsdev)

PortfolioIVar = (PortfolioI[0]**2) * Xvariance +
                 (PortfolioI[1]**2) * Yvariance +
                 (PortfolioI[2]**2) * Zvariance +
  2 * (PortfolioI[0]*PortfolioI[1]) * XYrho * Xsdev * Ysdev +
  2 * (PortfolioI[1]*PortfolioI[2]) * YZrho * Ysdev * Zsdev +
  2 * (PortfolioI[0]*PortfolioI[2]) * XZrho * Xsdev * Zsdev 
PortfolioIIVar = (PortfolioII[0]**2) * Xvariance +
                 (PortfolioII[1]**2) * Yvariance +
                 (PortfolioII[2]**2) * Zvariance +
  2 * (PortfolioII[0]*PortfolioII[1]) * XYrho * Xsdev * Ysdev +
  2 * (PortfolioII[1]*PortfolioII[2]) * YZrho * Ysdev * Zsdev +
  2 * (PortfolioII[0]*PortfolioII[2]) * XZrho * Xsdev * Zsdev 
PortfolioIIIVar = (PortfolioIII[0]**2) * Xvariance +
                 (PortfolioIII[1]**2) * Yvariance +
                 (PortfolioIII[2]**2) * Zvariance +
  2 * (PortfolioIII[0]*PortfolioIII[1]) * XYrho * Xsdev * Ysdev +
  2 * (PortfolioIII[1]*PortfolioIII[2]) * YZrho * Ysdev * Zsdev +
  2 * (PortfolioIII[0]*PortfolioIII[2]) * XZrho * Xsdev * Zsdev 
PortfolioIVVar = (PortfolioIV[0]**2) * Xvariance +
                 (PortfolioIV[1]**2) * Yvariance +
                 (PortfolioIV[2]**2) * Zvariance +
  2 * (PortfolioIV[0]*PortfolioIV[1]) * XYrho * Xsdev * Ysdev +
  2 * (PortfolioIV[1]*PortfolioIV[2]) * YZrho * Ysdev * Zsdev +
  2 * (PortfolioIV[0]*PortfolioIV[2]) * XZrho * Xsdev * Zsdev 

PortfolioVars = {:PortfolioI=>PortfolioIVar,:PortfolioII=>PortfolioIIVar,:PortfolioIII=>PortfolioIIIVar,:PortfolioIV=>PortfolioIVVar}

SortedPortfolio = PortfolioVars.sort {|a,b| a[1] <=> b[1]}

answers << PortfolioVars.first[0]



# Question 6 (10 points) The FTSE 100 is an index of the 100 largest market
# capitalization stocks traded on the London Stock Exchange. You think that
# 100 stocks are too much to keep up with, so you want to drop that number to
# 50. By doing this, what is the percentage drop in the UNIQUE relations
# between any two stocks in your portfolio that you will have to worry about? 
# (Enter the answer with no more nor less than two decimal places, and leave
# off the % sign. For example, if your answer is 13.97% you should enter it as
# 13.97 NOT 0.14 nor 14) Answer for Question 6

relationsDrop = (100*(50*49/2).to_f / (100*99/2)).to_f.round(2)

answers << (100 - relationsDrop)

# Question 7 (10 points) Given the definition of beta in the context of the
# CAPM, a stock with low beta can have more volatility (variance or standard
# deviation) than a stock with high beta.  False.  True.

# true. While beta measures the ratio between the stock's movement and the market's
# movement, it does not measure the idiosyncratic risk of a stock

answers << true

# Question 8 (10 points) Suppose CAPM works, and you know that the expected
# returns on IBM and Google are estimated to be 11% and 9.5%,
# respectively. You have just calculated extremely reliable estimates of the
# betas of IBM and Google to be 1.25 and 0.95, respectively. Given this data,
# what is a reasonable estimate of the market risk-premium (the
# average/expected difference between the market return and the risk-free
# rate)? (Enter the answer with no more nor less than two decimal places, and
# leave off the % sign. For example, if your answer is 13.97% you should enter
# it as 13.97 NOT 0.14 nor 14) Answer for Question 8

# Given the two equations:
# 11  = 100 * r_f + (r_m - r_f) * 125
# 9.5 = 100 * r_f + (r_m - r_f) * 95 
# Subtracting the two
# 1.5 = (r_m - r_f) * 30
# 0.5 = (r_m - r_f) * 10
# (r_m - r_f) = 0.05 or 5.00%

answers << "5.00"

# Question 9 (10 points) The standard deviation of a portfolio's return is the
# weighted average of the standard deviations of the returns of all securities
# in the portfolio, where the weights are proportional to the amount of your
# investment in a security relative to your total investment.  False.  True.

# This ignores cross-correlation

answers << false

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

# r_s = r_f + (r_m - r_f) * beta_s

beta_s = 2.50
r_f    = 0.025
r_m    = 0.04 + r_f
r_s    = r_f + (r_m - r_f) * beta_s

perpPayoff = 500000000

project = [-2000000000,-2000000000] + [perpPayoff/r_s]

r_project = project.irr

answers << "Do not know. r_s = 12.5% while r_project = is also 12.5% meaning it might be a break even proposition. However, we do not know the risk of the new project nor the correlation between this project and the projects the company already has. Therefore, we do not know the answer"

# Extra Question 5: Suppose there are three securities (A,B, and C) to choose
# from to create your portfolio. Next year the economy will be in an
# expansion, normal, or recession state with probabilities 0.30, 0.50, and
# 0.20, respectively. The returns (%) on the securities in these states are as
# follows: Security A {expansion = +8, normal = +7, recession = +2}; Security
# B {-1, -1, +5}; Security C {+14, +7, -8}. You are considering 4 potential
# portfolios of these 3 securities, with the following specific weights on
# each: Portfolio I (0.20, 0.40, 0.40); Portfolio II (0.34, 0.33, 0.33);
# Portfolio III (0.50, 0.25, 0.25); Portfolio IV (0.70, 0.15, 0.15); where the
# numbers in each parentheses are (weight of A, weight of B, weight of
# C). Which portfolio has the lowest risk?

economy5 = [0.30, 0.50, 0.20]

Agrowth  = [   8,    7,    2]
Bgrowth  = [  -1,    -1,   5]
Cgrowth  = [  14,    7,   -8]

PortfolioI   = [0.20,  0.40, 0.40]
PortfolioII  = [0.34,  0.33, 0.33]
PortfolioIII = [0.50,  0.25, 0.25]
PortfolioIV  = [0.70,  0.15, 0.15]

Amean     = economy5.zip(Agrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Bmean     = economy5.zip(Bgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Cmean     = economy5.zip(Cgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * elt[1] }
Avariance = economy5.zip(Agrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Amean)**2) }
Bvariance = economy5.zip(Bgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Bmean)**2) }
Cvariance = economy5.zip(Cgrowth).inject(0) { |ret, elt| ret = ret + elt[0] * ((elt[1] - Cmean)**2) }

Asdev     = Avariance**0.5
Bsdev     = Bvariance**0.5
Csdev     = Cvariance**0.5

ABcov     = economy5.zip(Agrowth.zip(Bgrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Amean) * (elt[1][1] - Bmean)) }
BCcov     = economy5.zip(Bgrowth.zip(Cgrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Bmean) * (elt[1][1] - Cmean)) }
ACcov     = economy5.zip(Agrowth.zip(Cgrowth)).inject(0) { |ret, elt| 
              ret = ret + (elt[0] * (elt[1][0] - Amean) * (elt[1][1] - Cmean)) }

ABrho     = ABcov/(Asdev * Bsdev)
BCrho     = BCcov/(Bsdev * Csdev)
ACrho     = ACcov/(Asdev * Csdev)

PortfolioIVar = (PortfolioI[0]**2) * Avariance +
                 (PortfolioI[1]**2) * Bvariance +
                 (PortfolioI[2]**2) * Cvariance +
  2 * (PortfolioI[0]*PortfolioI[1]) * ABrho * Asdev * Bsdev +
  2 * (PortfolioI[1]*PortfolioI[2]) * BCrho * Bsdev * Csdev +
  2 * (PortfolioI[0]*PortfolioI[2]) * ACrho * Asdev * Csdev 
PortfolioIIVar = (PortfolioII[0]**2) * Avariance +
                 (PortfolioII[1]**2) * Bvariance +
                 (PortfolioII[2]**2) * Cvariance +
  2 * (PortfolioII[0]*PortfolioII[1]) * ABrho * Asdev * Bsdev +
  2 * (PortfolioII[1]*PortfolioII[2]) * BCrho * Bsdev * Csdev +
  2 * (PortfolioII[0]*PortfolioII[2]) * ACrho * Asdev * Csdev 
PortfolioIIIVar = (PortfolioIII[0]**2) * Avariance +
                 (PortfolioIII[1]**2) * Bvariance +
                 (PortfolioIII[2]**2) * Cvariance +
  2 * (PortfolioIII[0]*PortfolioIII[1]) * ABrho * Asdev * Bsdev +
  2 * (PortfolioIII[1]*PortfolioIII[2]) * BCrho * Bsdev * Csdev +
  2 * (PortfolioIII[0]*PortfolioIII[2]) * ACrho * Asdev * Csdev 
PortfolioIVVar = (PortfolioIV[0]**2) * Avariance +
                 (PortfolioIV[1]**2) * Bvariance +
                 (PortfolioIV[2]**2) * Cvariance +
  2 * (PortfolioIV[0]*PortfolioIV[1]) * ABrho * Asdev * Bsdev +
  2 * (PortfolioIV[1]*PortfolioIV[2]) * BCrho * Bsdev * Csdev +
  2 * (PortfolioIV[0]*PortfolioIV[2]) * ACrho * Asdev * Csdev 

PortfolioVars = {:PortfolioI=>PortfolioIVar,:PortfolioII=>PortfolioIIVar,:PortfolioIII=>PortfolioIIIVar,:PortfolioIV=>PortfolioIVVar}

SortedPortfolio = PortfolioVars.sort {|a,b| a[1] <=> b[1]}

answers << SortedPortfolio.first


# Extra Question 6: The PSI-20 is an index of the 20 largest market
# capitalization stocks traded on the Euronext Lisbon Stock Exchange in
# Portugal. You think that 20 stocks may not give you enough diversification,
# so you want to expand that list to the top 60 stocks. By doing this, what is
# the percentage increase in the UNIQUE relations between any two stocks in
# your portfolio that you will have to worry about? (Enter the answer with no
# more nor less than two decimal places, and leave off the % sign. For
# example, if your answer is 13.97% you should enter it as 13.97 NOT 0.14 nor
# 14)

baseUniqueRelations = (20*19)/2
newUniqueRelations  = 60*59/2

percentageIncrease = 100 * (newUniqueRelations - baseUniqueRelations)/baseUniqueRelations.to_f

answers << percentageIncrease.round(2)

# Extra Question 8: Suppose CAPM works, and you know that the expected returns
# on Walmart and Amazon are estimated to be 12% and 10%, respectively. You
# have just calculated extremely reliable estimates of the betas of Walmart
# and Amazon to be 1.30 and 0.90, respectively. Given this data, what is a
# reasonable estimate of the risk-free rate (the return on a long-term
# government bond)? (Enter the answer with no more nor less than two decimal
# places, and leave off the % sign. For example, if your answer is 13.97% you
# should enter it as 13.97 NOT 0.14 nor 14)


answers << 5.50

puts "Answers to HW #8"
answers.each_with_index {|v,i| puts "Question #{i+1}: #{v}"}
