require 'debugger'
# require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 (5 points) In the event of liquidation (that is, a firm shutting
# down), the firm splits the assets between bondholders and stockholders
# equally.  True.  False.

answers << FALSE

# Question 2 (5 points) Becky and Mandy are arguing about the best way to
# value the rapidly growing MySpaceBook.com. Mandy argues that, since
# MySpaceBook.com is young and will plow most of their earnings back into the
# company that the present value of all future earnings represents the best
# estimate of the stocks value. Becky disagrees. Who is right?  Mandy Becky

answers << "Becky"

# Question 3 (5 points) (One-period pricing. Recall that since stocks have
# really long lives, in the video we imagined owning a stock for only one
# period. In this simple, yet powerful scenario, today's stock price is the PV
# of next year's dividend and next year's stock price. The formula was covered
# in class.) The stock for TM Consulting, and all-equity firm, is currently
# trading at $54 per share, after just having paid a $3 per share
# dividend. Management has not announced their specific dividend amount for
# next year, but they insist that they will pay a dividend. If analysts
# project the stock price to be $58 after next year's dividend is paid out,
# and the equity cost of capital (also the discount rate for equity) is 15%
# for this firm, the expected dividend (for t = 1) must be closest to: 4 3 1 2

P0   = 54
DIV0 =  3
P1   = 58 # estimated by analysts
discountRate = 0.15
DIV1 = 4
CashFlow = [0,58+DIV1]
CashFlow.npv(discountRate)

# Since $4 gives the closest estimate for NPV of $54 given a P1 of $58,
# DIV1 must be $4.

answers << 4

# Question 4 (5 points) (One period stock pricing.) Julia's Jewel Company
# (JJC) currently has a stock price of $42 per share. If JJC's cost of equity
# capital (same as discount rate for equity) is 16% and the current dividend
# yield (DIV1/P0) is 6.25%, the expected price per share of the company in one
# year (t = 1) is closest to?  47 43 44 46

P0   = 42
DIV1 = 0.0625 * P0
discountRate = 0.16
P1 = P0 * (1+discountRate) - DIV1

answers << P1.round(0)

# Question 5 (10 points) Electricity for All (EFL) is preparing for their
# Initial Public Equity Offering (IPO). Being in a highly regulated industry,
# and with no plans for expanding, EFL plans to payout all of its earnings as
# dividends that are expected to the be same. If the expected rate of return
# on its equity is 12% and a fair IPO price is $85 per share, what is EFL's
# dividend per share? (Enter just the number without the $ sign or a comma;
# round off decimals.)

returnOnEquity = 0.12
StockPrice     = 85

answers << returnOnEquity * StockPrice

# Question 6 (10 points) Investments made from retained earnings that lead to
# increases in future earnings will always increase stock price.  True.
# False.

answers << FALSE

# Question 7 (15 points) You are deciding whether to add Pony Electronics to
# your portfolio, but you are concerned about your projection for their growth
# rate. Pony's cost of equity capital (the discount rate for equity) is known
# to be 10% and they just paid a dividend of $1 per share. Most analysts are
# projecting constant growth of 8.25%, but you think that it might actually be
# 8.75%. By how much, in percentage terms, does this difference of opinion
# affect your estimate of Pony's price per share relative to the estimate
# implied by the analysts' forecast of growth rate? (Enter the answer with no
# more nor less than two decimal places, and leave off the % sign. For
# example, if your answer is 13.97% you should enter it as 13.97 NOT 0.14 nor
# 14) Answer for Question 7

DIV0           = 1
analystGrowth  = 0.0825
personalGrowth = 0.0875
r              = 0.1

DIV1A   = DIV0 * (1 + analystGrowth)
P0A     = DIV1A/(r - analystGrowth)
DIV1P   = DIV0 * (1 + personalGrowth)
P0P     = DIV1P/(r - personalGrowth)

#differenceInExpectation = (1/(discountRate - personalGrowth) ) - (1/(discountRate - analystGrowth))

answers << (P0P - P0A)/P0A

# Question 8 (15 points) GraceBook is a young firm that is in the process of
# creating a new web-based social media platform that is focused on the
# corporate market. While they are unable to pay any dividends today, once
# corporate contracts are awarded, they expect to be able to start paying a
# dividend of $2.00 per share beginning two years from now (t = 2). From that
# point forward, as they build their reputation and capacity, they expect to
# be able to increase their dividend each year at a constant rate. If
# GraceBook's current stock price is $31 and their cost of equity capital (the
# discount rate for equity) is 9%, what is the growth rate implied by this
# price per share? (Enter the answer with no more nor less than two decimal
# places, and leave off the % sign. For example, if your answer is 13.97% you
# should enter it as 13.97 NOT 0.14 nor 14)

discountRate = 0.09
growthRate   = 0.03081089
dividendStream = ([2.00]*100).zip(0..99).collect {|elt| (elt[0].to_f) * (1 + growthRate)**elt[1]} 

CashFlow = [-31.00,0] + dividendStream

puts CashFlow.npv(discountRate)

# P0 = DIV1/(1+discountRate) + DIV2/((1+discountRate)**2) + ...
# P0 = DIV2.((1+discountRate)**2) + DIV2 * (1+growthRate)/((1+discountRate)**3) + ...


answers << growthRate

# Question 9 (15 points) Viento Windmills is a utility that charges customers
# for their wind generated electricity. With their current technology, they
# earn a total of $50 million each year to pay out to their 2 million
# shareholders. While their geographic footprint is fixed and we can't expect
# the climate to get progressively windier over time, they do have an
# opportunity to invest in technology that will more efficiently extract the
# wind energy and thus produce more megawatts to sell to customers. A one-time
# investment at the end of this year (t = 1) of $25 million for a state of the
# art lubricant system for the windmills will increase their cash flows by $10
# million per year starting the following year (t = 2) and in perpetuity. If
# Viento plans to make the investment and cost of equity capital (the discount
# rate for equity) is 9%, calculate the increase or decrease in the share
# price of Viento as a result of this decision. (Draw time line to understand
# what is going on.) (Enter just the number without the $ sign or a comma;
# round off decimals.)  Answer for Question 9

oneTimeInvestment = 25000000
estimatedIncrease = 10000000
ProjectCost = [0,-oneTimeInvestment] + [estimatedIncrease]*10000
shareholderCount  =  2000000
discountRate = 0.09

answers << ProjectCost.npv(discountRate)/shareholderCount

CurrentStockPrice = ([0] + [25000000]*10000).npv(discountRate)/shareholderCount

NewStockPrice     = ([0,0] + [35000000]*10000).npv(discountRate)/shareholderCount

diffStockPrice = NewStockPrice - CurrentStockPrice

# Question 10 (15 points) HigherEducation, Inc., a private educational
# company's share price is $100 per share; earnings and dividends are $10 a
# share, and the growth rate is zero. They have just announced a new growth
# strategy whereby the companys earnings would begin growing by 5% per year
# and remain stable at this new rate. This new growth strategy will require
# the company to reinvest 50% of their earnings starting at the end of this
# year (t = 1). What will happen to the price per share of this company? 
# (Think carefully, draw a time line.)  Price will increase by $2 per share.
# Price will increase by $1 per share.  Price will remain unchanged.  Price
# will decrease by $2 per share.  Price will decrease by $1 per share.

P0   = 100
DIV0 =  10
discountRate = DIV0/P0
DIV1 = DIV0/2
DIV2 = DIV1 
dividendIncrease = DIV0/2
answers << "unchanged"

# Question 4 (5 points) (One period stock pricing.) Qin's Marine Company (QMC)
# currently has a stock price per share of $42. If QMC's cost of equity
# capital (the discount rate for equity) is 16% and capital gains rate
# (gain/loss in prices relative to today's price) for the next year is
# expected to be 11%, the dividend in the upcoming year (t = 1) should be?

r = 0.16
capitalGains = 0.11

P0 = 42
P1 = (1 + capitalGains) * P0

DIV1 = P0 * (1 + r) - P1

puts (2.10 + P1)/(1+r)

answers << DIV1

# Question 5 (10 points) Locked-In Real Estate (LIRE) is preparing for their
# Initial Public Equity Offering (IPO). With its holdings consisting of rent
# controlled apartments, and no plans for expanding, LIRE plans to payout all
# of its earnings as dividends. These dividends amount to $6 per share,
# forever. If the expected rate of return is 12%, what is the stock price of
# LIRE? (Enter just the number without the $ sign or a comma; round off
# decimals.)

LIREStockPrice = 6/0.12

answers << LIREStockPrice

# Question 8 Dixie Construction is a young firm that is in the process of
# bidding (and winning) construction contracts. While they are unable to pay
# any dividends today, once the contracts are awarded and their work begins in
# earnest, they expect to be able to start paying a dividend of $1.50 per
# share beginning three years from now (t = 3). From that point forward, as
# they build their reputation and capacity, they expect to be able to increase
# their dividend 3% each year. If Dixie's cost of equity capital is 9% (the
# discount rate for equity), what price per share should their shares trade at
# today? (Enter just the number without the $ sign or a comma; round off
# decimals.)

discountRate = 0.09
growthRate   = 0.03
dividendStream = ([1.50]*1000).zip(0..999).collect {|elt| (elt[0].to_f) * (1 + growthRate)**elt[1]} 

CashFlow = [0,0,0] + dividendStream

puts CashFlow.npv(discountRate)

# P0 = DIV1/(1+discountRate) + DIV2/((1+discountRate)**2) + ...
# P0 = DIV2.((1+discountRate)**2) + DIV2 * (1+growthRate)/((1+discountRate)**3) + ...


answers << CashFlow.npv(discountRate)

puts "Answers to HW #6"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}
