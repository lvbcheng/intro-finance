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

ReL_Moogle  = 0.1225
Re_Moogle   = 0.1060

DtoE_Google = 0.3

# Find Ra_Google

# Since Google and Moogle are in the same business they have the same Ra
# Therefore, Ra_Google = Re_Moogle

answers << (Re_Moogle * 100).round(2)

# Question 4 (10 points) Suppose CAPM holds, and the beta of the equity of
# your company is 2.00. The expected market risk premium (the difference
# between the expected market return and the risk-free rate) is 4.5% and the
# risk-free rate is 3.00%. Suppose the debt-to-equity ratio of your company is
# 20% and the market believes that the beta of your debt is 0.20. What is
# return on assets of your business? (Enter the answer with no more nor less
# than two decimal places, and leave off the % sign. For example, if your
# answer is 13.97% you should enter it as 13.97 NOT 0.14 nor 14) Answer for
# Question 4

Beta_firm = 2

R_free    = 0.03
R_market  = 0.03 + 0.045
DE_ratio  = 0.2
Beta_debt = 0.2

R_debt    = R_free + (R_market - R_free) * Beta_debt
R_equity  = R_free + (R_market - R_free) * Beta_firm

# Re        = Ra + DE_ratio * (Ra - R_debt)
# Re + DE_ratio * R_debt = (1 + DE_ratio) *Ra

Ra        = (R_equity + DE_ratio * R_debt) / (1 + DE_ratio)

answers << (Ra * 100).to_f.round(2)

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

# We do not have Beta of the Debt so...
answers << "Do not have enough information to value"

# Question 6 (10 points) Your firm has been plodding along without much
# attention from the stock market; both analysts and investors are not showing
# much interest in your company. Your boss insists that (a) he can increase
# the return on equity of the company by simply taking on more debt and (b)
# that will attract new investors to the firm because of the higher returns.

# False.
# True.
# Partly true; partly false.

answers << "Partly true; partly false"

# Question 7 (10 points) Two firms, Alpha, Inc., and Beta, Inc., are in the
# same business. Alpha, Inc., has debt that is viewed by the market as
# risk-less with a market value of $500 million. Beta, Inc., has no debt. Both
# firms are expected to generate cash flows of $100 million per year for the
# foreseeable future and the market value of the equity of Beta, Inc is $1
# billion. Estimate the return on equity of Alpha, Inc. Assume there are no
# taxes, and the risk-free rate is 5%. (Enter the answer with no more nor less
# than two decimal places, and leave off the % sign. For example, if your
# answer is 13.97% you should enter it as 13.97 NOT 0.14 nor 14)

A_debt = 5e8
B_debt = 0
R_free = 0.05
A_yield    = 1e8
B_yield    = 1e8

# Valuation of both companies must be identical since they return the same
# cashflow

A_valuation = 1e9
B_valuation = 1e9

Ra_B       = (B_yield/ B_valuation).to_f.round(2)

A_payments = A_debt * R_free

Rd_A       = R_free

Ra_A       = Ra_B
D_to_E     = A_debt/ (A_valuation - A_debt)
Re_A       = Ra_A + (D_to_E) * (Ra_A - Rd_A)

answers << (Re_A * 100).round(2)

# Question 8 (10 points) Mango, Inc. has had debt with market value of $1
# million that has paid a 6% coupon and has had an expiration date that is
# far, far away. The expected annual earnings before interest and taxes for
# the firm are $2 million and the firm has not grown, nor does it have plans
# for any growth. The firm however has just raised more equity to retire all
# its debt. If the required rate of return to equity-holders (after the
# capital structure change) is now 20%, what is the market value of the firm? 
# Assume there are no taxes. (Enter just the number without the $ sign or a
# comma; round to the nearest whole dollar.)

debtPmt_Mango  = 1e6 * 0.06

earnings_Mango = 2e6

Re_Mango = 0.2

# Earnings do not change despite restructuring of debt because
# debt does not change earnings since it is BEFORE interest and taxes

earnings_post_restructure_Mango = earnings_Mango

Mango_Val = earnings_post_restructure_Mango / 0.2

answers << Mango_Val.to_f.round(2)

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

answers << "S>R"

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

Beta_A = 2.25
Beta_B = 2.50
Beta_C = 2.75
Beta_D = 3.00

DE_A   = 0.21
DE_B   = 0.42
DE_C   = 0.63
DE_D   = 0.83
tax_rate = 0

Rd_A = Rd_B = Rd_C = Rd_D = 0.07
R_f       = 0.03
R_mf      = 0.05

BetaU_A    = Beta_A/(1 + ((1 - tax_rate) * DE_A))
BetaU_B    = Beta_B/(1 + ((1 - tax_rate) * DE_B))
BetaU_C    = Beta_C/(1 + ((1 - tax_rate) * DE_C))
BetaU_D    = Beta_D/(1 + ((1 - tax_rate) * DE_D))

Re_A      = R_f + R_mf * BetaU_A
Re_B      = R_f + R_mf * BetaU_B
Re_C      = R_f + R_mf * BetaU_C
Re_D      = R_f + R_mf * BetaU_D

Ra_A      = (Re_A + DE_A * Rd_A) / (1 + DE_A)
Ra_B      = (Re_B + DE_B * Rd_B) / (1 + DE_B)
Ra_C      = (Re_C + DE_C * Rd_C) / (1 + DE_C)
Ra_D      = (Re_D + DE_D * Rd_D) / (1 + DE_D)

Re_NS     = (Re_A + Re_B + Re_C + Re_D) / 4 
Ra_NS     = (Ra_A + Ra_B + Ra_C + Ra_D) / 4 

answers << (100 * Ra_NS).to_f.round(2)

puts "Answers to HW #9"
answers.each_with_index {|v,i| puts "Question #{i+1}: #{v}"}


# Equations worth knowing
# Re(Alpha) = Ra(Alpha) + (D/E)(Ra(Alpha) -  Rd(Alpha)) 

