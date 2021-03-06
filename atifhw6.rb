require 'debugger'
# require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 (5 points) Bonds require issuers to repay the principal (or face
# value) and (where applicable) precise coupon payments until contract
# maturity, while Equity requires the firm to pay a certain dividend in
# perpetuity.

# Dividends are never required.

answers << false

# Question 2 (5 points) Rafael and Roberta are arguing about the best way to
# value Sporks, Inc - a mature firm that manufactures plastic utensils. Rafael
# argues that this industry has little room for innovation and since Sporks,
# Inc no longer retains any of their earnings, the present value of all future
# earnings represents a good estimate of the stock's value. Roberta
# disagrees. Who is right?

# Sporks does not retain earnings meaning all earnings turn into dividends

answers << "Rafael"

# Question 3 (5 points) (One-period pricing. Recall that since stocks have
# really long lives, in the video we first imagined owning a stock for only
# one period. In this simple, yet powerful scenario, today's stock price is
# the PV of next year's dividend and next year's stock price.) The stock of
# Alydar Oil, an all-equity firm, is currently trading at $45 per share, after
# just having paid a $2 per share dividend. The market expects a dividend of
# $3 per share to be paid one year from today. If the equity cost of capital
# (same as discount rate for equity) is 20% for this firm, the expected
# ex-dividend price (the stock price after the dividend is paid next year) in
# one year (t = 1) should be closest to:

#     54
#     45
#     51
#     48
# 

discountRate = 0.2
P1 = (45 - (3/(1+discountRate))) * (1 + discountRate)

answers << P1

# Question 4 (5 points) (One period stock pricing.) Julia's Jewel Company
# (JJC) currently has a stock price of $42 per share. If JJC's cost of equity
# capital (same as discount rate for equity) is 16% and the current dividend
# yield (DIV1/P0) is 6.25%, the expected price per share of the company in one
# year (t = 1) is closest to?

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

# Question 6 (10 points) A good way to align the incentives of a CEO with
# those of shareholders is to make his pay directly related to earnings (or
# cash flows) per share (EPS), since an increase in earnings always leads to
# an increase in shareholder value.  False.  True.

answers << false

# Question 7 (15 points) You are deciding whether to add Bard Publishing to
# your portfolio, but you are concerned about your projection for their growth
# rate. Bard's cost of equity capital (the discount rate for equity) is known
# to be 14% and they just paid a dividend of $2 per share. When calculating
# the value of the stock today, you cannot decide if the constant growth rate
# will be 6% or 7%. By how much does this seemingly small difference impact
# your valuation, i.e., the price per share? (Enter just the number without
# the $ sign or a comma; round off decimals.)

DIV0           = 2
analystGrowth  = 0.06
personalGrowth = 0.07
r              = 0.14

DIV1A   = DIV0 * (1 + analystGrowth)
P0A     = DIV1A/(r - analystGrowth)
DIV1P   = DIV0 * (1 + personalGrowth)
P0P     = DIV1P/(r - personalGrowth)

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
# should enter it as 13.97 NOT 0.14 nor 14) Question 9

discountRate = 0.09
growthRate   = 0.03081089
dividendStream = ([2.00]*1000).zip(0..999).collect {|elt| (elt[0].to_f) * (1 + growthRate)**elt[1]} 

CashFlow = [-31.00,0] + dividendStream

puts CashFlow.npv(discountRate)

# P0 = DIV1/(1+discountRate) + DIV2/((1+discountRate)**2) + ...
# P0 = DIV2.((1+discountRate)**2) + DIV2 * (1+growthRate)/((1+discountRate)**3) + ...


answers << growthRate

# (15 points) Viento Windmills is a utility that charges customers for their wind generated electricity. With their current technology, they earn a total of $50 million each year to pay out to their 2 million shareholders. While their geographic footprint is fixed and we can't expect the climate to get progressively windier over time, they do have an opportunity to invest in technology that will more efficiently extract the wind energy and thus produce more megawatts to sell to customers. A one-time investment at the end of this year (t = 1) of $25 million for a state of the art lubricant system for the windmills will increase their cash flows by $10 million per year starting the following year (t = 2) and in perpetuity. If Viento plans to make the investment and cost of equity capital (the discount rate for equity) is 9%, calculate the increase or decrease in the share price of Viento as a result of this decision. (Draw time line to understand what is going on.) (Enter just the number without the $ sign or a comma; round off decimals.)
# Question 10
# 

oneTimeInvestment = 25000000
estimatedIncrease = 10000000
ProjectCost = [0,-oneTimeInvestment] + [estimatedIncrease]*1000
shareHolderCount  =  2000000
discountRate = 0.09

puts ProjectCost.npv(discountRate)
answers << ProjectCost.npv(discountRate)/shareHolderCount

# (15 points) HigherEducation, Inc., a private educational company's share
# price is $100 per share; earnings and dividends are $10 a share, and the
# growth rate is zero. They have just announced a new growth strategy whereby
# the companys earnings would begin growing by 5% per year and remain stable
# at this new rate. This new growth strategy will require the company to
# reinvest 50% of their earnings starting at the end of this year (t =
# 1). What will happen to the price per share of this company? (Think
# carefully, draw a time line.)  Price will increase by $1 per share.  Price
# will remain unchanged.  Price will increase by $2 per share.  Price will
# decrease by $1 per share.  Price will decrease by $2 per share.

P0   = 100
DIV0 =  10
discountRate = DIV0/P0
DIV1 = DIV0/2
DIV2 = DIV1 
dividendIncrease = DIV0/2
answers << "unchanged"

puts "Answers to HW #6"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}

