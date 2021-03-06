require 'debugger'
require 'pv'
require 'finance'
include Finance

answers = []

# Question 1: (5 points) The project with the highest IRR is always the
# project with the highest NPV.

# IRRs are not even unique: say when cash flows are negative.
# 100 111 0
# 100 109 3

answers << FALSE

# Question 2: (10 points) Ann Arbor is considering offering public bus service
# for free. Setting up the service will cost the city $0.6M (where M stands
# for million). The useful life of the buses is 25 years. Annual maintenance
# of the buses would cost $50,000 per year and they would need a major
# overhaul in year 15 that will cost a total of $350,000. This overhaul is in
# addition to the annual maintenance. Annual operating costs will begin at
# $90,000 in year 1 and grow at 2% per year thereafter. By using the buses as
# advertisement space, the city will generate a revenue of $75,000 in year 1
# and it will grow at 4% per year thereafter. Reduced parking requirements and
# other benefits generated by the project will save the city
# $100,000/year. The salvage value (price city can get in the future after
# maintenance) of the used buses in year 25 is expected to be $150,000. What
# is the NPV of the bus proposal? Ann Arbor does not pay taxes and the
# discount rate is 5%.(Again, all cash flows except initial investments happen
# at the end of the year.) (You are strongly encouraged to use a spreadsheet.)

busPurchasePrice      = -600000

annualMaintenance     = [0] + [-50000] * 25
annualMaintenance[15] = annualMaintenance[15] - 350000

baseOperatingCost     = -90000
operatingCostGrowth   = 0.02
operatingCosts        = [0] + (1..25).map { |i| baseOperatingCost * (1 + operatingCostGrowth)**(i-1)}

baseAdRevenue         = 75000
adRevenueGrowth       = 0.04
adRevenues            = [0] + (1..25).map { |i| baseAdRevenue * (1 + adRevenueGrowth)**(i-1)}

reducedParkingBenefit = [0] + [100000] * 25

busSalvageValue       = 150000

totalCosts            = annualMaintenance.zip(operatingCosts).map { | x, y| x + y }

totalRevenues         = adRevenues.zip(reducedParkingBenefit).map { | x, y| x + y }

totalStreams          = totalRevenues.zip(totalCosts).map { | x, y| x + y }
totalStreams[0]       = totalStreams[0] + busPurchasePrice
totalStreams[25]      = totalStreams[25] + busSalvageValue

discountRate          = 0.05
npvCalculation        = totalStreams.npv(discountRate)
answers << npvCalculation

# Question 3: (5 points) Alpha Inc. has the following two projects that it is
# considering, and it wants to choose one. Project A has an investment
# outlay/expense today of $1,000, and its cash flows over the next three years
# are $500, $600, $700. Project B has an outlay of $2,000, and cash flows of
# $1,000, $1,200, and $1,400. Which project should Alpha choose? (You can
# assume no taxes.)  Cannot make a choice based on information

projectACashFlow     = [-1000,500,600,700]
projectBCashFlow     = [-2000,1000,1200,1400]

if false 
  if (projectACashFlow.irr.to_f * 100 > projectBCashFlow.irr.to_f * 100)
    answers << "Project A"
  else
    answers << "Project B"
  end;
else
  answers << "Cannot decide: IRR is invalid"
end


# Question 4 (10 points) Mango Technology has the following three projects
# that it is considering; it can choose only one. Project A has an investment
# outlay/expense today of $100M, and its cash flows over the next three years
# are $20M, $40M, $70M. Project B has an outlay of $110M, and cash flows of
# $40M, $80M, $20M; Project C has an outlay of $120M and cash flows of $0M,
# $20M, and $142M. Which project should the company choose if the cost of
# capital for similar projects is 6%?  

# Project B Do not have enough
# information Project C Project A

projectACashFlow = [-100000000, 20000000, 40000000,  70000000]
projectBCashFlow = [-110000000, 40000000, 80000000,  20000000]
projectCCashFlow = [-120000000,        0, 20000000, 142000000]

discountRate = 0.06
projects = {:A=>projectACashFlow.npv(discountRate),
            :B=>projectBCashFlow.npv(discountRate),
            :C=>projectCCashFlow.npv(discountRate)}

maxNPV = projects.values.max

answers << projects.select {|k,v| v == maxNPV }.keys[0]

# Question 5: (5 points) To get from net operating profits after tax (NOPAT)
# to free cash flows (FCF), you need to ADD back depreciation, SUBTRACT
# capital expenditures and ADD net working capital (i.e., current operating
# assets - current operating liabilities). (Free cash flow is another name for
# cash flows.)

answers << FALSE

# Question 6: (5 points) Last year your firm had revenue of $36 million, cost
# of goods sold (COGS) of $32 million, Selling, General, & Administration
# costs (SG&A) of $3 million, Account Receivables (AR) of $6 million, Account
# Payables (AP) of $4 million and Inventory of $4 million. What will be the
# free cash flow next/this year if you boost revenue 8%, while holding COGS
# growth to 3%, and increasing AP 30%, while everything else remains same as
# last year? (Assume no taxes and no additional capital expenditures.) (You
# are encouraged to use a spreadsheet even for this specific type of
# question.)

revenue   = 36000000
cogs      = 32000000
sags      =  3000000
ar        =  6000000
ap        =  4000000
inventory =  4000000

currRevenue   = revenue * 1.08
currCOGS      = cogs    * 1.03
currSAGS      = sags
cashPos       = 0
currInventory = inventory
currAR        = ar
currAP        = ap      * 1.30

workingCap  = cashPos + (currInventory - inventory) + (currAR - ar) - (currAP - ap)

fcf = currRevenue - currCOGS - currSAGS - workingCap

answers << fcf

# Question 7: (15 points) Silver Bear Golf (SBG) is a manufacturer of top
# quality golf clubs with a specialty of putters. Currently, each putter they
# sell brings in $200 of revenue at a cost of $150. This past year, they sold
# 1,000 putters and they expect this number to grow each year by 12% until
# this model becomes obselete after 10 more years. The foreman at the SBG
# factory recently brought to your attention a new technology that could lower
# the cost of production. This technology requires an upfront fixed investment
# of $100,000 and has the capacity to produce all the putters you want to sell
# per year at a unit cost of $135. There is no increased working capital need
# due to this new technology, and no value of the machine/technology after 10
# years. What is the NPV of investing in the new technology? Ignore taxes and
# assume a discount rate of 9%. (Hint: Think incrementally; the difference
# between the world without and with this new technology! Also, ignoring taxes
# will be a big help if you think right.) (Enter just the number without the $
# sign or a comma; round off decimals.)(You are strongly encouraged to use a
# spreadsheet.)  Answer for Question 7 

currentUnitRev  = 200
currentUnitCOGS = 150
discountRate    = 0.09
salesProjection = (1..10).map { |i| 1000 * (1 + 0.12)**i}

currentProfits  = ([0] + salesProjection.map { |i| (currentUnitRev - currentUnitCOGS) * i }).npv(discountRate)

newTechUnitCOGS = 135

newTechProfits  = ([-100000] + salesProjection.map { |i| (currentUnitRev - newTechUnitCOGS) * i }).npv(discountRate)

answers << "The NPV is: #{newTechProfits - currentProfits}"

# Question 8: (15 points) Fresh off the excitement of the 2012 London Olympic
# Games, you decide that you want your firm to take advantage of the profits
# to be made for the 2016 games in Rio de Jeneiro. To do so you plan to open a
# factory in Brazil. After examining the idea, your CFO projects revenues next
# year (2013) to be $15 million and costs to be $9 million. Both of these are
# expected to grow at a rate of 25% per year as the excitement for the games
# builds. Your firm faces a 35% tax rate, a 14% discount rate and you can
# depreciate your new investment using the straight line method over the four
# years leading up to the games, at which point the value of the venture
# moving forward will be $5 million. (This $5 million is the terminal value
# that is in year 4 (that is, 2016) dollars and is the PV of all cash flows
# year 5 and beyond.) The capital expenditure of this project is $12M. What is
# the NPV of the project? Assume that you have no significant working capital
# costs.(Enter just the number without the $ sign or a comma; round off
# decimals.) (You are strongly encouraged to use a spreadsheet.)  Answer for
# Question 8 

revAndCostGrowthRate  = 0.25
taxRate               = 0.35
discountRate          = 0.14

capex                 = -12000000
initialPerYearRevenue =  15000000
initialPerYearCost    =  -9000000

residue               =   5000000

revenueStream = [0] + (2013..2016).map {|yr| initialPerYearRevenue * (1 + revAndCostGrowthRate)**(yr - 2013)}
costStream    = [0] + (2013..2016).map {|yr| initialPerYearCost * (1 + revAndCostGrowthRate)**(yr - 2013)}

depreciationSchedule = [0] + [-capex/4] * 4

cashFlow      = ((revenueStream.zip(costStream).map { |x,y| x + y }).zip(depreciationSchedule).map { |x,y| x - y }).map { |c| c * (1 - taxRate) }

# add back the depreciation
cashFlow     = cashFlow.zip(depreciationSchedule).map { |x,y| x + y }

cashFlow[0]   = cashFlow[0] + capex
cashFlow[4]   = cashFlow[4] + residue
debugger
answers << "The NPV = #{cashFlow.npv(discountRate).to_f.round(2)}"

# Question 9: (15 points) Starbuck's is considering opening another store in
# Chicago. A store is expected to have a long economic life, but the valuation
# horizon is 7 years. The store in Chicago is expected to create revenues of
# $3M in the first year and they are likely to grow at 2% per year
# thereafter. The cost of goods sold are $1.2M in year 1 and they are also
# expected to grow at 2% per year thereafter. Selling and administration costs
# are likely to be $0.5M in the first year and then grow at 5%. The tax rate
# is 35%. Starbucks is so good at managing its stores that working capital
# increases can be assumed to be negligible. But Starbucks will have to invest
# $3.5M in purchasing a store (with land). The good news is that this outlay
# can be straight line depreciated over 7 years. Also, Starbucks has estimated
# that the terminal value in year 7 dollars will be $10M. This value is the
# value of all cash flows in year 8 and beyond. What is the NPV of opening
# this new store if the appropriate discount rate is 7.75%?(Again, all cash
# flows except initial investments happen at the end of the year. Enter just
# the number without the $ sign or a comma; round off decimals.)(You are
# strongly encouraged to use a spreadsheet.)  Answer for Question 9 

initialPerYearRevenue   =  3000000
initialPerYearCost      =  1200000
initialSAGS             =   500000
landInvestment          =  3500000
terminalValue           = 10000000
discountRate            = 0.0775

revenuePercentageGrowth =  0.02
costPercentageGrowth    =  0.02
SAGSPercentageGrowth    =  0.05
taxRate                 =  0.35

revenueStream = [0] + (1..7).map { |yr| initialPerYearRevenue * (1 + revenuePercentageGrowth )**(yr - 1) }
costStream    = [0] + (1..7).map { |yr| initialPerYearCost    * (1 + costPercentageGrowth )**(yr - 1) }
sagsStream    = [0] + (1..7).map { |yr| initialSAGS           * (1 + SAGSPercentageGrowth )**(yr - 1) }
depStream     = [0] + [landInvestment/7] * 7

nopat = (((revenueStream.zip(costStream).map { |x,y| x - y }).zip(sagsStream).map { |x,y| x - y }).zip(depStream).map { |x,y| x - y }).map { |c| c * (1 - taxRate) }

# compute free cash flow starting with nopat then add depreation, awg and capex
fcf = nopat

(1..7).each { |i| fcf[i] = fcf[i] + (landInvestment/7) }

fcf[0] = fcf[0] - landInvestment
fcf[7] = fcf[7] + terminalValue

answers << "NPV = #{fcf.npv(discountRate).to_f.round(2)}"

# Question 10: (15 points) Springfield Ironworks (SI) recently had their
# furnace break down and they need to quickly purchase a new one to minimize
# the disruption in their production. They can either choose a high quality
# furnace (H) that costs $110,000 with $4,000 of annual maintenance costs for
# the 7-year life of the furnace, or a low quality furnace (L) that costs
# $60,000 with $7,500 in annual maintenance costs for the 4-year life of the
# furnace. Which furnace should SI choose? What is the annualized cost of
# their choice? Assume a discount rate of 6%, and ignore all taxes.  (L,
# 24815) (H, 24565) (L,16875) (H,19714) (H, 23705) (L, 20854)

HQCost = [110000] + [4000] * 7

LQCost = [60000] + [7500] * 4

theRate = 0.06

# Calculate the HQCost.pv then redistribute the payment over 7 years
puts "HQ NPV = #{HQCost.npv(theRate)}"
puts "LQ NPV = #{LQCost.npv(theRate)}"

HQAnnualizedCost = -Amortization.payment(HQCost.npv(theRate),theRate,7)
LQAnnualizedCost = -Amortization.payment(LQCost.npv(theRate),theRate,4)

if HQAnnualizedCost > LQAnnualizedCost
  answers << ['L', LQAnnualizedCost]
else
  answers << ['H', HQAnnualizedCost]
end

puts "Answers to HW #4"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}
