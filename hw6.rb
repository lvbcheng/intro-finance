require 'debugger'
require 'pv'
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

answers << "has not been attempted"

# Question 4 (5 points) (One period stock pricing.) Julia's Jewel Company
# (JJC) currently has a stock price of $42 per share. If JJC's cost of equity
# capital (same as discount rate for equity) is 16% and the current dividend
# yield (DIV1/P0) is 6.25%, the expected price per share of the company in one
# year (t = 1) is closest to?  47 43 44 46

answers << "has not been attempted"

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

answers << "has not been attempted"

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

answers << "has not been attempted"

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

answers << "has not been attempted"

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

answers << "has not been attempted"
