require 'debugger'
require 'pv'
require 'finance'
include Finance

# Problem 1: Becky (-1200), 450 (month 3), 450 (month 6), 450 (month 15)
loan_amount      = 1200
month3_payment   = 450
month6_payment   = 450
month15_payment  = 450
r               = 0.06/12
npv = - loan_amount + pv(month3_payment, 3, r) + pv(month6_payment, 6, r) + pv(month15_payment, 15, r)
puts npv

# Problem 2:

trans = []

trans[0] = -50000
trans[1] =   2500
trans[2] =   5000
trans[3] =   5000
trans[4] =   7500
trans[5] =  10000
trans[6] =  10000
trans[7] =  15000
trans[8] =  15000

puts trans.irr.to_f.round(4)

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

5


