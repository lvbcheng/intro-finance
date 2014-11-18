require 'debugger'
require 'pv'
require 'finance'
include Finance

answers = []

# Problem 1: Becky needs another $1,200 in her vehicle fund to purchase the
# car she wants. Her parents offer to loan her the money, but want to teach
# her about the time value of money. They offer to have her repay the loan in
# the future using birthday and holiday money. They agree that she will repay
# $450 at each of her next two birthdays and one holiday season. These events
# are 3, 6 and 15 months from now. Assume a 6% cost of capital. Assume there
# is no risk of default, and that compounding is monthly. What is the NPV of
# the loan?

loan_amount     = 1200

CashFlow = [0] * 15

CashFlow[0]  = -loan_amount
CashFlow[3]  = 450
CashFlow[6]  = 450
CashFlow[15] = 450

npv = CashFlow.npv(0.06/12)

answers << npv

puts "Problem 01: #{npv}"

# Problem 2: Jacob has an opportunity to invest in a new retail development in
# his building. The initial investment is $50,000 and the expected cashflows
# are as follows: Year 1: $2,500 Year 2: $5,000 Year 3: $5,000 Year 4: $7,500
# Year 5: $10,000 Year 6: $10,000 Year 7: $15,000 Year 8: $15,000 What is
# Jacob's IRR on this investment? (Enter the answer with no more nor less than
# two decimal places, and leave off the % sign. For example, if your answer is
# 13.97% you should enter it as 13.97 NOT 0.14 nor 14)

trans = [0] * 8
trans[0] = -50000 # initial investment
trans[1] =   2500
trans[2] =   5000
trans[3] =   5000
trans[4] =   7500
trans[5] =  10000
trans[6] =  10000
trans[7] =  15000
trans[8] =  15000

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

# Problem 5: Da Feng is looking to refinance his home because rates have gone
# down since he purchased the house 5 years ago. He started with a 30-year
# fixed-rate mortgage of $240,000 at an annual rate of 6.75%. He has to make
# monthly payments. He can now get a 25-year fixed-rate mortgage at an annual
# rate of 5.5% on the remaining balance of his initial mortgage. This loan
# also requires monthly payments. In order to re-finance, Da Feng will need to
# pay closing costs of $4,500. These costs are out of pocket and cannot be
# rolled into the new mortgage. How much will refinancing save Da Feng? 
# (i.e. What is the NPV of the refinancing decision?)

# calculate how much Da Feng still owes
initialLoan   = 240000
initialRate   = 0.0675/12
initialLoanPd = 30 * 12
newRate       = 0.055/12
newLoanPd     = 25 * 12 # 300 months
closingCost   = 4500
oldCashFlow   = [0] + [-Amortization.payment(initialLoan,initialRate,initialLoanPd)] * newLoanPd

CashFlow5 = [-closingCost] + [-Amortization.payment(initialLoan,initialRate,initialLoanPd)] * newLoanPd

answers << CashFlow5.npv(newRate) - oldCashFlow.npv(initialRate)

# Problem 6: The United States purchased Alaska in 1867 for $7.2M (where M
# stands for million). Assume that federal tax revenue from the state of
# Alaska (net federal expenditures) will be $50M in 2012 and that tax revenue
# started in 1868 and has steadily increased by 3% annually since then. Assume
# that the cost of capital (or interest rate) is 7%. What is the NPV of the
# Alaska purchase? (Hint: Try and imagine you are in 1867 looking forward.)

TaxCashFlow = (1868..2012).map { |yr| (50000000 / (1 + 0.03)**(2012-yr)) }
ForwardCashFlow = (2013..3000).map { |yr| (50000000) * (1 + 0.03)**(yr-2012) }
CashFlow6 = [-7200000] + TaxCashFlow + ForwardCashFlow
answers << CashFlow6.npv(0.07)

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

# Problem 9: Reggie has just taken over management of a family business. He
# wants to make sure that it makes financial sense to keep the business
# going. He could sell the building today for $520,000. Keeping the business
# going will require a $50,000 renovation now and will yield an annual profit
# of $72,000 for the next 20 years (for simplicity assume these occur at year
# end, beginning one year from now). The discount/interest rate is 10%? What
# are the NPV and IRR of this decision?

ReggieCashFlow = [-570000] + [72000]*20
ReggieNPV = ReggieCashFlow.npv(0.1).to_f.round(2)
ReggieIRR = ReggieCashFlow.irr.to_f * 100

answers << [ReggieNPV, ReggieIRR].to_s

puts [ReggieNPV, ReggieIRR].to_s

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

# Problem 11: Roxanne invested $500,000 in a new business 6 years ago. The
# business was expected to pay $8,000 each month for the next 21 years (in
# excess of all costs). The annual cost of capital (or interest rate) for this
# type of business was 9%. What is the value of the business today?(Enter just
# the number without the $ sign or a comma; round off decimals.)  

initialInvestment = 500000

cashFlowOrig11    = [-initialInvestment] + [8000] * (21 * 12)

puts "Problem 11 NPV six years ago #{cashFlowOrig11.npv(0.09/12)}"
cashFlowToday11   = [0] + [8000] * (15 * 12)


answers << cashFlowToday11.npv(0.09/12)


puts "Answers to HW #3"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}


