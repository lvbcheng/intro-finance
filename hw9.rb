require 'debugger'
# require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 ( 5 points) In a world with no frictions (taxes, etc.), value is
# created by how you finance a project.  True.  False.

answers << false

# Question 2 (5 points) The return on equity is equal to the return on assets
# of a project/firm.  Never true.  Sometimes true.  Always true.

answers << "Sometimes true"

# Question 3 (10 points) Moogle, Inc. is in the same business as Google, Inc.,
# but has recently retired all its debt to become an all-equity firm. Its
# return on equity has dropped from 12.25% to 10.60% as a result of
# this. Google, Inc. continues to have debt in its capital structure, and its
# debt-to-equity ratio is 30%. What is the return on assets of Google,
# Inc.(Enter the answer with no more nor less than two decimal places, and
# leave off the % sign. For example, if your answer is 13.97% you should enter
# it as 13.97 NOT 0.14 nor 14) Answer for Question 3

answers << "Not attempted"

# Question 4 (10 points) Suppose CAPM holds, and the beta of the equity of
# your company is 2.00. The expected market risk premium (the difference
# between the expected market return and the risk-free rate) is 4.5% and the
# risk-free rate is 3.00%. Suppose the debt-to-equity ratio of your company is
# 20% and the market believes that the beta of your debt is 0.20. What is
# return on assets of your business? (Enter the answer with no more nor less
# than two decimal places, and leave off the % sign. For example, if your
# answer is 13.97% you should enter it as 13.97 NOT 0.14 nor 14) Answer for
# Question 4

answers << "Not attempted"

# Question 5 (10 points) You are planning on opening a consulting firm. You
# have projected yearly cash flows of $2 million starting next year (t = 1)
# with a growth rate of 3% over the foreseeable future thereafter. This
# endeavor will require a substantial investment and you will have to convince
# investors to provide you the capital to do so. You will invest some of your
# own money, convincing other investors will of course be useful for your
# valuing your own investment decision. A critical piece of your analysis is
# figuring out the present value of the cash flows of the business. Your
# research has revealed the following information: similar consulting
# businesses equity has an average beta of 2.40 and the average debt-to-equity
# ratio in this industry is 10%. The risk-free rate is 3.25% and the expected
# market risk premium (the average difference between between the market
# return and the risk-free rate) is 4.50%. What is the value of the cash flows
# of your business?

# 18099548.
# 20060181.
# Do not have enough information to value.

answers << "Not attempted"

# Question 6 (10 points) Your firm has been plodding along without much
# attention from the stock market; both analysts and investors are not showing
# much interest in your company. Your boss insists that (a) he can increase
# the return on equity of the company by simply taking on more debt and (b)
# that will attract new investors to the firm because of the higher returns.

# False.
# True.
# Partly true; partly false.

answers << false

# Question 7 (10 points) Two firms, Alpha, Inc., and Beta, Inc., are in the
# same business. Alpha, Inc., has debt that is viewed by the market as
# risk-less with a market value of $500 million. Beta, Inc., has no debt. Both
# firms are expected to generate cash flows of $100 million per year for the
# foreseeable future and the market value of the equity of Beta, Inc is $1
# billion. Estimate the return on equity of Alpha, Inc. Assume there are no
# taxes, and the risk-free rate is 5%. (Enter the answer with no more nor less
# than two decimal places, and leave off the % sign. For example, if your
# answer is 13.97% you should enter it as 13.97 NOT 0.14 nor 14)

answers << "Not attempted"

# Question 8 (10 points) Mango, Inc. has had debt with market value of $1
# million that has paid a 6% coupon and has had an expiration date that is
# far, far away. The expected annual earnings before interest and taxes for
# the firm are $2 million and the firm has not grown, nor does it have plans
# for any growth. The firm however has just raised more equity to retire all
# its debt. If the required rate of return to equity-holders (after the
# capital structure change) is now 20%, what is the market value of the firm? 
# Assume there are no taxes. (Enter just the number without the $ sign or a
# comma; round to the nearest whole dollar.)

answers << "Not attempted"

# Question 9 (15 points) Suppose all investors are risk-averse and hold
# diversified portfolios. You are evaluating a new drug company that is going
# to have two divisions: an R&D unit and a Sales unit. Your CEO and you are
# arguing about whether the two units should have the same cost of capital
# (WACC), or whether the discount rates should be different. If different,
# what should be the relative magnitudes of the discount rates, that is, which
# unit R&D or Sales should have the higher discount rate. Assume the discount
# rates of the two units are labeled as R (for R&D) and S (for Sales),
# respectively. What do you think?

# S>R.
# The same discount rates for both divisions/units (R=S).
# R>S.
# 

answers << "Not attempted"

# Question 10 (15 points) NorthSouth Airlines has been granted permission to
# fly passengers between major U.S. cities. The new company faces competition
# from four airlines that operate between the major cities. The betas of the
# equity of the four major competitors (A, B, C, D) are 2.25, 2.50, 2.75, and
# 3.00; and the debt-to-equity ratios of these four companies (in the same
# order: A, B, C, D) are 0.21, 0.42, 0.63, 0.83. Although these D/E ratios
# vary, all airline debt is rated the same. Suppose the yield on airline debt
# is 7%, the risk-free rate is 3% and the expected market risk premium (the
# average difference between the market return and the risk-free rate) is
# 5%. What is the cost of capital (or discount rate) that you should use in
# valuing NorthSouth Airlines? (Enter the answer with no more nor less than
# two decimal places, and leave off the % sign. For example, if your answer is
# 13.97% you should enter it as 13.97 NOT 0.14 nor 14)

answers << "Not attempted"

puts "Answers to HW #9"
answers.each_with_index {|v,i| puts "Question #{i+1}: #{v}"}


# Equations worth knowing
# Re(Alpha) = Ra(Alpha) + (D/E)(Ra(Alpha)  Rd(Alpha)) 

