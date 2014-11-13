require 'debugger'
require 'pv'
require 'finance'
include Finance

answers = []

# Problem 1: Sachin has asked his flat mate Jason for a $500 loan to cover a portion of
# his rent and utility costs. Sachin proposes repaying the loan with $300 from
# each of his next two financial aid disbursements, the first 4 months from
# now and the second 12 months from now. Jason's alternative is to earn 5%
# annually in his money market account. Assume there is no risk of default,
# and that compounding is monthly. What is the NPV of the loan? (Enter just
# the number without the $ sign or a comma; round off decimals.)

loan_amount     = 500
month4_payment  = 300
month12_payment = 300
r               = 0.05/12

CashFlow = [0] * 13

CashFlow[0]  = -loan_amount
CashFlow[4]  = 300
CashFlow[12] = 300

npv = CashFlow.npv(0.05/12)

answers << npv

puts "Problem 01: #{npv}"

# Problem 2: Juanita has an opportunity to invest in her friend's clothing
# store. The initial investment is $10,000 and her expected cashflows are as
# follows: Year 1: $300 Year 2: $500 Year 3: $1200 Year 4: $2000 Year 5: $2000
# Year 6: $5000 Year 7: $5000 What is Juanita's IRR on this investment?(Enter
# the answer with no more nor less than two decimal places, and leave off the
# % sign. For example, if your answer is 13.97% you should enter it as 13.97
# NOT 0.14 nor 14)

trans = [0] * 8
trans[0] = -10000 # initial investment
trans[1] =    300
trans[2] =    500
trans[3] =   1200
trans[4] =   2000
trans[5] =   2000
trans[6] =   5000
trans[7] =   5000

answers << trans.irr.to_f.round(4) * 100

puts "Problem 02: #{trans.irr.to_f.round(4)}"

# Problem 3: Fabrice is looking to buy a new plug-in hybrid vehicle. The
# purchase price is $12,000 more than a similar conventional model. However,
# he will receive a $7,500 federal tax credit that he will realize at the end
# of the year. He estimates that he will save $1,200 per year in gas over the
# conventional model; these cash outflows can be assumed to occur at the end
# of the year. The cost of capital (or interest rate) for Fabrice is 6%. How
# long will Fabrice have to own the vehicle to justify the additional expense
# over the conventional model?( i.e, What is the DISCOUNTED payback period in
# years? Discount future cash flows before calculating payback and round to a
# whole year.)

# 5 is the first year where owning the hybrid starts being cheaper

answers << 5

# Problem 4: In high school Jeff often made money in the summer by mowing
# lawns in the neighborhood. He just finished his freshman year of college
# and, after taking a Business 101 class, he has some ideas about how to scale
# up his lawn mowing operation. Previously, he had used his father's push
# mower, but he is thinking about getting a riding mower that will save time
# and allow him to do more lawns. He found a used, zero turn, riding mower on
# Craigslist for $1,200. He will also need a trailer to pull the mower behind
# his pickup; that will cost him an additional $600. With the new mower he can
# take on an additional 20 lawns per week at an average cash inflow of $20 per
# lawn he will receive at the end of each week. He has 14 weeks of summer in
# which to mow lawns. (For convenience, assume that the mower and trailer will
# have no value after Jeff is done with his work this summer.) The discount
# rate for Jeff is 10% (Keep in mind this is an annual rate). What is the Net
# Present Value of the mower/trailer project?

investment   = 1200 + 600

extra_income = 20 * 20

number_of_weeks = 14

discount_rate = 0.1/52

trans = [0] * 15

trans[0]  = - investment
14.times { |i| trans[i + 1] = extra_income }

answers << trans.npv(discount_rate).to_f.round(2)

# Problem 5: Yassein is looking to refinance his home because rates have gone
# down from when he bought his house 10 years ago. He started with a 30-year
# fixed-rate mortgage of $288,000 at an annual rate of 6.5%. He can now get a
# 20-year fixed-rate mortgage at an annual rate of 5.5% on the remaining
# balance of his initial mortgage. (All loans require monthly payments.) In
# order to re-finance, Yassein will need to pay closing costs of $3,500. These
# costs are out of pocket and cannot be rolled into the new mortgage. How much
# will refinancing save Yassein? (i.e. What is the NPV of the refinancing
# decision?)

# calculate how much Yassein still owes
initialLoan   = 288000
initialRate   = 0.065/12
initialLoanPd = 30 * 12
newRate       = 0.055/12
newLoanPd     = 20 * 12 # 240 months
closingCost   = 3500
oldCashFlow   = [0] + [-Amortization.payment(initialLoan,initialRate,initialLoanPd)] * newLoanPd

CashFlow5 = [-closingCost] + [-Amortization.payment(initialLoan,initialRate,initialLoanPd)] * newLoanPd

answers << CashFlow5.npv(newRate) - oldCashFlow.npv(initialRate)

# Problem 6: Chandra has the opportunity to buy a vacant lot next to several
# commercial properties for $50,000. She plans to buy the property and spend
# another $60,000 immediately to put in a parking lot. She has talked to the
# local businesses and has some contracts lined up to fill the parking
# spaces. The profits from the contracts will provide $25,000 per year and the
# contracts will last 10 years. What is the NPV of Chandra's plan if the
# appropriate discount/interest rate is 10%?(Enter just the number without the
# $ sign or a comma; round off decimals.)

CashFlow6 = [-110000] + [25000] * 10

answers << CashFlow6.npv(0.1)

# Problem 7: This question introduces you to the concept of an annuity with
# growth. The formula is given on p.3, equation (7), of the Note on Formulae,
# but I would encourage you to try doing it in Excel as well. (If the first
# cash flow is C, the next one will be C(1+g), and so on, where g is the
# growth rate in cash flow). As an example, the present value of an annuity
# that starts one year from now at $100, and grows at 5%, with the last cash
# flow in year 10, when the discount rate is 7%, is $860. Confirm this before
# attempting the problem; and use both the formula and excel. What is the NPV
# of of a new software project that costs $1,000,000 today, but has a cash
# flow of $200,000 in year 1 that grows at 3% per year till year 20? Similar
# investments earn 7.5% per year. (Enter just the number without the $ sign or
# a comma; round off decimals.)

CashFlow7 = [-1000000] + (1..20).map { |yr| 200000 * (1 + 0.03)**(yr-1) }

answers << CashFlow7.npv(0.075)

# Problem 8: Rebecca is 28 and considering going to graduate school so she
# sits down to calculate whether it is worth the large sum of money. She knows
# that her first year tuition will be $40,000, due at the beginning of the
# year (that is, right away). She estimates that the 2nd year of tuition would
# be $42,000. She also estimates that her living expenses above and beyond
# tuition will be $8,000 per year (assume this occurs at the end of the year)
# for the first year and will increase to $9000 the next year. She expects to
# earn $18,000 for an internship (Assume this inflow occurs one year from
# now). Were she to forgo graduate school she would be able to make $55,000 at
# the end of this year and expects that to grow 3% annually. With a graduate
# degree, she estimates that she will earn $85,000/year after graduation,
# again with annual 3% increases. Either way, she plans to work until 60 (she
# begins college right away). The interest/discount rate is 6%. What is the
# NPV of her graduate education? (Note: All cash flows except tuition payments
# occur at the end of the year.)

noSchoolBaseSalary = 55000
wtSchoolBaseSalary = 85000
salaryIncrease     = 0.03
discountRate       = 0.06

# the cash flow assuming no schooling
noSchoolCashFlow = [0] + (29..60).map { |i| (noSchoolBaseSalary * (1 + salaryIncrease)**(i-29)).to_f.round(2)} 

# the cash flow assuming schooling
schoolCashFlow   = [-40000,-42000-8000+18000,-9000]
wtSchoolSalaryCashFlow = (31..60).map {|i| (wtSchoolBaseSalary * (1 + salaryIncrease)**(i-31)).to_f.round(2)}

wtSchoolCashFlow = schoolCashFlow + wtSchoolSalaryCashFlow

# Approach #1: calculate delta cash flow and then calculate NPV
netCashFlow = wtSchoolCashFlow.zip(noSchoolCashFlow).map {|x,y| x - y}

puts "Net Cash Flow approach yields    : #{netCashFlow.npv(discountRate)}"

# Apporach #2: calculate each NPV and then compute delta

netNPV = wtSchoolCashFlow.npv(discountRate) - noSchoolCashFlow.npv(discountRate)

answers << netCashFlow.npv(discountRate)

puts "Delta of two NPVs approach yields: #{netCashFlow.npv(discountRate)}"

# Problem 9: Rafael owned an apartment building that burned down. The empty
# lot is worth $70,000 and Rafael has received $200,000 from the insurance
# company. Rafael plans to build another apartment building that will cost
# $275,000. His real estate adviser estimates that the expected value of the
# finished building on the real estate market will be $385,000 next year. The
# discount/interest rate is 10%? What are the NPV and IRR of this decision?

RafaelCashFlow = [-70000-275000,385000]
RafaelNPV = RafaelCashFlow.npv(0.1).to_f.round(2)
puts RafaelNPV
RafaelIRR = RafaelCashFlow.irr.to_f * 100

answers << [RafaelNPV, RafaelIRR].to_s

puts [RafaelNPV, RafaelIRR].to_s

# Problem 10: Sairah purchased an investment property for $350,000, 3 years
# ago. The after-tax cashfow of the property has been $35,000 per year to
# date, but market conditions have improved and Sairah expects the cashflow to
# improve to $42,000 per year for the next 25 years (assume these are year end
# cashflows). The annual cost of capital (or cap rate) for this area is
# 9%. What is the value of the property today?(Enter just the number without
# the $ sign or a comma; round off decimals.)

CashFlow = [0] + ([42000] * 25)
PropertyValue = CashFlow.npv(0.09)

answers << PropertyValue

puts "Problem 10: #{PropertyValue}"

puts "Answers to HW #3"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}


