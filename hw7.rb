require 'debugger'
# require 'pv'
require 'finance'
include Finance

class Array
 def mean
   (inject(0.to_f) { |h, i| h = h + i }/size)
 end

 def variance
   arrayMean = mean
   inject(0.to_f) { |h,i| h = h + (i - arrayMean)**2 }/(size - 1)
 end

 def sdev
   (variance**0.5)
 end

 def correl(secondArray)
   selfMean  = mean
   otherMean = secondArray.mean
   (zip(secondArray).inject(0) { |h,elt| h = h + ((elt[0] - selfMean) * (elt[1] - otherMean)) }/(size - 1))/(sdev*secondArray.sdev)
 end
end

answers = []

# Question 1 (5 points) Shareholders of Exxon Oil Company face a variety of
# risks in holding its shares. If the economy falters, people tend to travel
# less and so there is less demand from the airlines industry for Exxon's
# fuels. This type of risk that Exxon's shareholders bear is
# Specific/Idiosyncratic Risk.  

answers << "Systemic Risk"

# Question 2 (5 points) Suppose there are three securities (X, Y, and Z) to
# choose from, and next year the economy will be in an expansion, normal, or
# recession state with probabilities 0.30, 0.35, and 0.35, respectively. The
# returns (%) on the securitiies in these states are as follows: Security X
# {expansion = +10, normal = +8, recession = +6}; Security Y {+25,+10,-10};
# Security Z {+7.5,+7.5,+7.5}. If the investor is risk neutral and must choose
# whether to invest in Security Y or Security Z, which would she buy?

# Security Y.
# Indifferent between Y & Z.
# Security Z.

Economy1  = [0.30, 0.35, 0.35]
SecurityX = [ 10.0, 8.0,   6.0]
SecurityY = [ 25.0,10.0, -10.0]
SecurityZ = [  7.5, 7.5,   7.5]

ExpectedX = Economy1.zip(SecurityX).inject(0) { |h,i| h = i[0] * i [1] + h }
ExpectedY = Economy1.zip(SecurityY).inject(0) { |h,i| h = i[0] * i [1] + h }
ExpectedZ = Economy1.zip(SecurityZ).inject(0) { |h,i| h = i[0] * i [1] + h }

if (ExpectedY == ExpectedZ)
  answers << "Indifferent"
elsif (ExpectedY > ExpectedZ)
  answers << "Security Y"
else
  answers << "Security Z"
end

# Question 3 (5 points) Suppose your dear old Grandfather approaches you for
# investment advice. He knows of your great training in finance and statistics
# and gives the following instructions: "I have lived a long time and through
# many challenges. But the recent financial upheaval, with its ups and downs,
# is too much for me to bear. Just pick for me a portfolio with the least
# risk." Suppose there are portfolios (A, B, and C) to choose from, and next
# year the economy will be in an expansion, normal, or recession state with
# probabilities 0.40, 0.40, and 0.20 respectively. The returns (%) on the
# portfolios in these states are as follows: Portfolio A {expansion = +13,
# normal = +9, recession = +8.5}; Portfolio B {+10,+9,+5}; Portfolio C
# {+13,+8,+7.5}. Which investment best fits your grandfather's needs?

# Portfolio A.
# Portfolio C.
# Portfolio B.

Economy3  = [0.40, 0.40, 0.20]
PortfolioA = [ 13, 9, 8.5]
PortfolioB = [ 10, 9, 5.0]
PortfolioC = [ 13, 8, 7.5]

PortfolioAMean = Economy3.zip(PortfolioA).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
PortfolioBMean = Economy3.zip(PortfolioB).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
PortfolioCMean = Economy3.zip(PortfolioC).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }

PortfolioASDEV = (Economy3.zip(PortfolioA).collect { |elt| elt[0] * (elt[1] - PortfolioAMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
PortfolioBSDEV = (Economy3.zip(PortfolioB).collect { |elt| elt[0] * (elt[1] - PortfolioBMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
PortfolioCSDEV = (Economy3.zip(PortfolioC).collect { |elt| elt[0] * (elt[1] - PortfolioCMean)**2 }.inject(0) { |h,i| h = h + i })**0.5

puts "Portfolio A: Mean: #{PortfolioAMean.round(2)} SDEV: #{PortfolioASDEV.round(2)} Variance: #{(PortfolioASDEV**2).round(2)}"
puts "Portfolio B: Mean: #{PortfolioBMean.round(2)} SDEV: #{PortfolioBSDEV.round(2)} Variance: #{(PortfolioBSDEV**2).round(2)}"
puts "Portfolio C: Mean: #{PortfolioCMean.round(2)} SDEV: #{PortfolioCSDEV.round(2)} Variance: #{(PortfolioCSDEV**2).round(2)}"
PortfoliosStats = {:A=>[PortfolioAMean,PortfolioASDEV], 
                   :B=>[PortfolioBMean,PortfolioBSDEV], 
                   :C=>[PortfolioCMean,PortfolioCSDEV]}

# answers << "Portfolio #{Expectations.min[0]}"

# Sort the portfolios by their SDEV and return the key of the first element
# (lowest SDEV)

answers << PortfoliosStats.sort {|a,b| a[1][1] <=> b[1][1]}.first[0]

# Question 4 (10 points) The more idiosyncratic risk in the return of a
# security, the larger the risk premium investors will demand.  False.  True

answers << true

# Question 5 (10 points) We often want to find investments that perform well
# when other parts of our portfolio are struggling. When considering stocks to
# add to the portfolio, those with a correlation closer to zero with our
# existing portfolio will most effectively help us diversify.  True.  False.

# We want negative correlation not zero correlation

answers << false

# Question 6 (10 points) As a CEO you wish to maximize the productivity of
# your workers. You are thinking about providing your employees with
# smartphones so they can be readily available to clients and increase
# sales. However, you are also concerned that your employees are just as
# likely to download apps that will distract them from their work, leading
# them to play games and update their social networking sites rather than
# focus on the job of pleasing clients. To test this you randomly select 6
# employees for an experiment. You provide 3 with the new smart phone and the
# other 3 use their existing technology. The following chart shows their
# changes in sales. Based on this small sample, what is the correlation
# between smartphone and increase in sales? [Hint: It may help to use the
# spreadsheet function CORREL to calculate the correlation] (Enter the answer
# with no more nor less than two decimal places, and leave off the % sign. For
# example, if your answer is 13.97% you should enter it as 13.97 NOT 0.14 nor
# 14) {Anthony, Smartphone: Yes; change in sales 120; Kira, Smartphone No;
# Change in Sales 60; Michael, Smartphone No; Change in Sales 150; Scarlett.,
# Smartphone Yes; Change in Sales 130; Pete, Smartphone Yes; Change in Sales
# 40; Angela, Smartphone No; Change in Sales 60.}  Answer for Question 6

employees = [{:name=>"Anthony",  :smartPhone=>1, :sales=>120},
             {:name=>"Kira",     :smartPhone=>0, :sales=> 60},
             {:name=>"Michael",  :smartPhone=>0, :sales=>150},
             {:name=>"Scarlett", :smartPhone=>1, :sales=>130},
             {:name=>"Pete",     :smartPhone=>1, :sales=> 40},
             {:name=>"Angela",   :smartPhone=>0, :sales=> 60}]

smartPhoneArray = employees.inject([]) { |h,i| h << i[:smartPhone] }
salesArray      = employees.inject([]) { |h,i| h << i[:sales] }

puts smartPhoneArray.to_s
puts salesArray.to_s

answers << smartPhoneArray.correl(salesArray).round(2)

# Question 7 (10 points) It is well known that investors generally do not like
# to bear risk. For two otherwise identical corporate bonds, the one with more
# idiosyncratic risk should have a price that is Higher.  Lower.  The same.

# The face and coupons would be the same. However, the bond with the higher
# risk would be cheaper to buy, i.e., have a higher rate of return to
# compensate for the higher idiosyncratic risk

answers << "lower"

# Question 8 (15 points) Suppose your client is risk-averse but can invest in
# only one of the three securities, X, Y, or Z, in an uncertain world
# characterized as follows. Next year the economy will be in an expansion,
# normal, or recession state with probabilities 0.40, 0.40, and 0.20,
# respectively. The returns (%) on the three securities in these states are as
# follows: Security X {expansion = +14, normal = +10, recession = +7};
# Security Y {+11, +9, +8}; Security Z {+13, +8, +7.5}. Which security can you
# rule out, that is, you will not advise your client to invest in it?  None of
# the securities.  Security Y.  Security X.  Security Z.


Economy8  = [0.4, 0.4, 0.20]
SecurityX = [14,10, 7]
SecurityY = [11, 9, 8]
SecurityZ = [13, 8, 7.5]

SecurityXMean = Economy8.zip(SecurityX).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
SecurityYMean = Economy8.zip(SecurityY).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
SecurityZMean = Economy8.zip(SecurityZ).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }

SecurityXSDEV = (Economy8.zip(SecurityX).collect { |elt| elt[0] * (elt[1] - SecurityXMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
SecurityYSDEV = (Economy8.zip(SecurityY).collect { |elt| elt[0] * (elt[1] - SecurityYMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
SecurityZSDEV = (Economy8.zip(SecurityZ).collect { |elt| elt[0] * (elt[1] - SecurityZMean)**2 }.inject(0) { |h,i| h = h + i })**0.5

puts "Notes for Question 8"
puts "Security X: Mean: #{SecurityXMean.round(2)} SDEV: #{SecurityXSDEV.round(2)} Variance: #{(SecurityXSDEV**2).round(2)}"
puts "Security Y: Mean: #{SecurityYMean.round(2)} SDEV: #{SecurityYSDEV.round(2)} Variance: #{(SecurityYSDEV**2).round(2)}"
puts "Security Z: Mean: #{SecurityZMean.round(2)} SDEV: #{SecurityZSDEV.round(2)} Variance: #{(SecurityZSDEV**2).round(2)}"

SecuritiesStats = {:A=>[SecurityXMean,SecurityXSDEV], 
                   :B=>[SecurityYMean,SecurityYSDEV], 
                   :C=>[SecurityZMean,SecurityZSDEV]}

# Return the portfolio with the highest standard deviation

LowestReturn = SecuritiesStats.sort {|a,b| a[1][0] <=> b[1][0]}.first[0]
PortfoliosSortedByRiskASC = SecuritiesStats.sort {|a,b| a[1][1] <=> b[1][1]}

HighestRisk = PortfoliosSortedByRiskASC.last[0]

# check if the portfolio with the highest risk is unique. If not, we may need
# to look at which, among the riskiest portfolios, has the highest return

if PortfoliosSortedByRiskASC[1][1][1] != PortfoliosSortedByRiskASC.last[1][1]
  answers << HighestRisk
else
  answers << "None of the securities"
end

# Question 9 (15 points) You have just taken over as a fund manager at a
# brokerage firm. Your assistant, Thomas, is briefing you on the current
# portfolio and states "We have too much of our portfolio in Alpha. We should
# probably move some of those funds into Gamma so we can achieve better
# diversification." Is he right? [Hint: Feel free to use spreadsheet
# statistical functions.] Here is the data on all three stocks. Assume, for
# convenience, that all three securities do not pay dividends. Alpha, Current
# Price 40; Current Weight 80%; Next Year's Price: Expansion 48, Normal 44,
# Recession 36; Beta, Current Price 27.50; Current Weight 20%; Next Year's
# Price: Expansion 27.50, Normal 26, Recession 25; Gamma, Current Price 15;
# Current Weight 0%; Next Year's Price: Expansion 16.50, Normal 19.50,
# Recession 12.  No.  It depends.  Yes.

Alpha = {:currentPrice=>40.00, :currentWeight=>0.8, :futurePrice=>[48.00,44.00,36.00]}
Beta  = {:currentPrice=>27.50, :currentWeight=>0.2, :futurePrice=>[27.50,26.00,25.00]}
Gamma = {:currentPrice=>15.00, :currentWeight=>0.0, :futurePrice=>[16.50,19.50,12.00]}

Alpha[:futurePercentage] = Alpha[:futurePrice].collect { |elt| (elt - Alpha[:currentPrice])*100/Alpha[:currentPrice]}
Beta[:futurePercentage]  = Beta[:futurePrice].collect { |elt| (elt - Beta[:currentPrice])*100/Beta[:currentPrice]}
Gamma[:futurePercentage] = Gamma[:futurePrice].collect { |elt| (elt - Gamma[:currentPrice])*100/Gamma[:currentPrice]}

Alpha[:expectedReturn] = Alpha[:futurePercentage].mean
Beta[:expectedReturn]  = Beta[:futurePercentage].mean
Gamma[:expectedReturn] = Gamma[:futurePercentage].mean

Alpha[:sdev] = Alpha[:futurePercentage].sdev
Beta[:sdev]  = Beta[:futurePercentage].sdev
Gamma[:sdev] = Gamma[:futurePercentage].sdev

correl9 = {:axb=>Alpha[:futurePercentage].correl(Beta[:futurePercentage]),
           :bxg=>Beta[:futurePercentage].correl(Gamma[:futurePercentage]),
           :axg=>Alpha[:futurePercentage].correl(Gamma[:futurePercentage])}

# if they are not perfectly correlated, either positively or negatively, we
# need to look at the probabilities of the three different futures.

if correl9[:axg] == 1
  answers << false
elseif correl9[:axg] == -1
  answers << true
else
  answers << "It depends. correl(axg): #{correl9[:axg]}"
end

# Question 10 (15 points) Suppose there are two mortgage bankers. Banker 1 has
# two $1,000,000 mortgages to sell. The borrowers live on opposite sides of
# the country and face an independent probability of default of 5%, with the
# banker able to salvage 40% of the mortgage value in case of default. Banker
# 2 also has two $1,000,000 mortgages to sell, but Banker 2's borrowers live
# on the same street, have the same job security and income. Put differently,
# the fates and thus solvency of Banker 2's borrowers move in lock step. They
# have a probability of defaulting of 5%, with the banker able to salvage 40%
# of the mortgage value in case of default. Both Bankers plan to sell their
# respective mortgages as a bundle in a mortgage-backed security (MBS) (i.e.,
# as a portfolio). Which of the following is correct?  Banker 2's MBS has a
# higher expected return and less risk.

# The two portfolios have equal expected value but banker 2's portfolio is
# more risky since the two mortgages are perfectly correlated.

Banker1Mort = [1000000,1000000]
Banker1PoD  = [0.05, 0.05]
Banker1Salv = [0.4, 0.4]

Banker2Mort = [1000000,1000000]
Banker2PoD  = [0.05, 0.05]
Banker2Salv = [0.4, 0.4]

answers << "Banker 2's MBS has equal expected return and more risk"

# Extra Question 3 (5 points) Suppose your dear old Grandfather approaches you
# for investment advice. He knows of your great training in finance and
# statistics and gives the following instructions: "I have lived a long time
# and through many challenges. But the recent financial upheaval, with its ups
# and downs, is too much for me to bear. Just pick for me a portfolio with the
# least risk." Suppose there are portfolios (A, B, and C) to choose from, and
# next year the economy will be in an expansion, normal, or recession state
# with probabilities 0.40, 0.40, and 0.20 respectively. The returns (%) on the
# portfolios in these states are as follows: Portfolio A {expansion = +13,
# normal = +9, recession = +8.5}; Portfolio B {+10,+9,+5}; Portfolio C
# {+13,+8,+7.5}. Which investment best fits your grandfather's needs?

# Portfolio A.
# Portfolio C.
# Portfolio B.

EconomyE3  = [0.40, 0.40, 0.20]
PortfolioA = [ 13, 9, 8.5]
PortfolioB = [ 10, 9, 5.0]
PortfolioC = [ 13, 8, 7.5]

PortfolioAMean = EconomyE3.zip(PortfolioA).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
PortfolioBMean = EconomyE3.zip(PortfolioB).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }
PortfolioCMean = EconomyE3.zip(PortfolioC).collect { |elt| elt[0] * elt[1] }.inject(0) { |h,i| h = h + i }

PortfolioASDEV = (EconomyE3.zip(PortfolioA).collect { |elt| elt[0] * (elt[1] - PortfolioAMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
PortfolioBSDEV = (EconomyE3.zip(PortfolioB).collect { |elt| elt[0] * (elt[1] - PortfolioBMean)**2 }.inject(0) { |h,i| h = h + i })**0.5
PortfolioCSDEV = (EconomyE3.zip(PortfolioC).collect { |elt| elt[0] * (elt[1] - PortfolioCMean)**2 }.inject(0) { |h,i| h = h + i })**0.5

puts "Portfolio A: Mean: #{PortfolioAMean.round(2)} SDEV: #{PortfolioASDEV.round(2)} Variance: #{(PortfolioASDEV**2).round(2)}"
puts "Portfolio B: Mean: #{PortfolioBMean.round(2)} SDEV: #{PortfolioBSDEV.round(2)} Variance: #{(PortfolioBSDEV**2).round(2)}"
puts "Portfolio C: Mean: #{PortfolioCMean.round(2)} SDEV: #{PortfolioCSDEV.round(2)} Variance: #{(PortfolioCSDEV**2).round(2)}"
PortfoliosStats = {:A=>[PortfolioAMean,PortfolioASDEV], 
                   :B=>[PortfolioBMean,PortfolioBSDEV], 
                   :C=>[PortfolioCMean,PortfolioCSDEV]}

# answers << "Portfolio #{Expectations.min[0]}"

# Sort the portfolios by their SDEV and return the key of the first element
# (lowest SDEV)

answers << PortfoliosStats.sort {|a,b| a[1][1] <=> b[1][1]}.first[0]

puts "Answers to HW #7"
answers.each_with_index {|v,i| puts "Problem #{i+1}: #{v}"}
