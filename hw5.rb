require 'debugger'
require 'pv'
require 'finance'
include Finance

answers = []

# Question 1 (5 points) A pure discount (or zero-coupon) government bond has a
# face value of $10,000 and a yield of 4.88 percent. If the current price of
# the bond is $6,800, what is the maturity of the bond? (Recall that the
# compounding interval for bonds is 6 months.) (Choose the closest round
# number in years.)

# Excel claims 8 years = NPer(4.88%/2,0,6800,10000)

faceValue     = 10000.to_f
currentPrice  =  6800.to_f
sixMonthYield = 0.0488/2

numberOfPeriods = Math.log(faceValue/currentPrice) / Math.log(1 + sixMonthYield)

answers << (numberOfPeriods/2).round

# Question 2 (5 point) For two otherwise identical coupon bonds, the one with
# the higher yield will have a higher price.  True False

answers << false

# Question 3 (5 points) For coupon bonds, the yield to maturity always equals
# the coupon rate.  True False

# Yield to Maturity: the rate of return anticipated on a bond if held until
# the maturity date.

# Coupon rate: the rate of a bond on the issue date.

# In fact, if:
#   coupon rate < YTM, bond is selling at discount
#   coupon rate = YTM, bond is selling at par
#   coupon rate > YTM, bond is selling at premium

answers << false

# Question 4 (10 points) What is the yield to maturity (YTM) of a zero coupon
# bond with a face value of $1,000, current price of $950 and maturity of 2
# years? (Recall that the compounding interval is 6 months and the YTM, like
# all interest rates, is reported on an annualized basis.) (Enter the answer
# with no more nor less than two decimal places, and leave off the % sign. For
# example, if your answer is 13.97% you should enter it as 13.97 NOT 0.14 nor
# 14) Answer for # Question 4

currentPrice =  950.to_f
faceValue    = 1000.to_f
zeroCouponBond = [-currentPrice,0,0,0,faceValue]
YTM = zeroCouponBond.irr.to_f

debugger
# ytm = 2 * ((10**(Math.log10(faceValue/950)/4)) - 1)

ytm = 2 * ((1000.to_f/950.to_f)**(1/4.to_f) - 1)

answers << ytm.to_f * 100

# Question 5 (10 points) The government in the U.S. issues zero-coupon bonds
# up to one year maturity, but STRIPS are "manufactured" zero-coupon bonds
# with maturities up to 30 years. So, for example, a financial institution
# could first buy 200 30-year coupon bonds issued by the government that each
# pay $5 of coupon every six months. The institution could then sell the
# combined coupons totaling $1,000 as a separate zero-coupon bond with
# maturities ranging from 6 months up to 30 years. This is a financial
# innovation that occurred decades ago in the face of volatile inflation and
# an increased demand for long-term zero coupon government bonds. Given this
# information, analyze the following statement: "The yield to maturity (YTM)
# of a long-term STRIP will typically be higher than that of a short-term
# STRIP."  False True

# This is basically saying that the YTM of the long term STRIP must be higher
# to compensate for the extra risk

answers << true

# Question 6 (10 points) Suppose Moogle, Inc. wishes to issue a bond with a
# maturity of 6 years, a face value of $100,000 and an annual coupon rate of
# 5% to raise $89,793. What is the yield to maturity (YTM) on this bond? (Note
# that the annual coupon rate is the annual coupon as a percentage of face
# value, but the coupon is paid every six months, and the YTM, like all
# interest rates, is reported on an annualized basis.) (Enter the answer with
# no more nor less than two decimal places, and leave off the % sign. For
# example, if your answer is 13.97% you should enter it as 13.97 NOT 0.14 nor
# 14) Answer for # Question 6

interestRate = 0.05
faceValue    = 100000.00
periods      = 12
MoogleBond = [-89793] + [(interestRate/2) * faceValue] * (periods - 1) + [faceValue + faceValue * (interestRate/2)]

answers << 2 * MoogleBond.irr.to_f.round(2) * 100

# Question 7 (10 points) Suppose you have $10,000 to invest in either (a) Bond
# A, a 5-year zero-coupon; or (b) Bond B, a 10-year zero coupon bond. Both are
# risk free government bonds. You plan to hold the bond for a year and your
# only objective is to take on as little interest rate risk as possible. Which
# one should you choose?  Bond A.  Bond B.

answers << "Bond A"

# Question 8 (15 points) Some years ago, your aunt Megan gave you a 5% coupon
# bond with a face value of $1,000 that had a YTM of 5% and 15 years left
# until maturity at that time. Due to a financial emergency, you are forced to
# sell the bond today. The bond still has many years left to maturity and a
# price of $1,050. What is your capital gain/loss, which is defined as the
# dollar gain/loss relative to the price of the bond when you bought it? 
# (Recall that the compounding interval is 6 months and the YTM, like all
# interest rates, is reported on an annualized basis.) (Enter just the number
# without the $ sign or a comma, and no decimals.)  Answer for # Question 8


answers << "Why is the answer not $#{1050 - 1000}?"

# Question 9 (15 points) Hard Spun Industries (HSI) has a project that it
# expects will produce a cash flow of $2.5 million in 12 years. To finance the
# project, the company needs to borrow $1.5 million today. The project will
# also produce intermediate cash flows, $150,000 of which HSI will use to
# service annual coupon payments (the coupons will actually be paid
# semi-annually as a payment of $75,000). Based on the risk of this
# investment, market participants will require a 10% yield. If HSI wishes a
# maturity of 12 years (matching the arrival of the lump sum cash flow), what
# does the face value of the bond have to be? (Recall that the compounding
# interval is 6 months and the YTM, like all interest rates, is reported on an
# annualized basis.) (Enter just the number without the $ sign or a comma, and
# no decimals.)  Answer for # Question 9

theYield   = 0.1

coupon     = 75000

faceValue = 75000/(theYield/2)

answers << faceValue

# Question 10 (15 points) Two years ago, Motors, Inc. issued a corporate bond
# with an annual coupon of $4,000, paid at the rate of $2,000 every six
# months, and a maturity of 5 years. The par (face) value of the bond is
# $500,000. Recently, however, the company has run into some financial
# difficulty and has restructured its obligations.Todays coupon payment has
# already been paid, but the remaining coupon payments will be postponed until
# maturity. The postponed payments will accrue interest at an annual rate of
# 3% per year and will be paid as a lump sum amount at maturity along with the
# face value. The discount rate on the renegotiated bonds, now considered much
# riskier, has gone from 5% prior to the renegotiations to 10% per annum with
# the announcement of the restructuring. What is the price at which the new
# renegotiated bond should be selling today? (Recall that the compounding
# interval is 6 months and the YTM, like all interest rates, is reported on an
# annualized basis.) (Enter just the number without the $ sign or a comma, and
# no decimals.)  Answer for # Question 10 In accordance with the Coursera
# Honor Code, I (Beethoven Cheng) certify that the answers here are my own
# work.  You cannot submit your work until you agree to the Honor
# Code. Thanks!

MotorsBond   = [0] + [2000] * 5 + [2000 + 500000]
accrualRate  = 0.03
discountRate = 0.10
CashFlow = (0..(MotorsBond.size - 1)).zip(MotorsBond)

FVSum = CashFlow.map {|k,v| v * (1 + accrualRate/2)**(6-k)}.inject(0) {|h,i| h = h + i }

P     = FVSum/(1+discountRate/2)**6

answers << P.round(2)

puts "Answers to HW #5"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}
