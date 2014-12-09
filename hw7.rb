require 'debugger'
# require 'pv'
require 'finance'
include Finance

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

# Question 4 (10 points) The more idiosyncratic risk in the return of a
# security, the larger the risk premium investors will demand.  False.  True

# Question 5 (10 points) We often want to find investments that perform well
# when other parts of our portfolio are struggling. When considering stocks to
# add to the portfolio, those with a correlation closer to zero with our
# existing portfolio will most effectively help us diversify.  True.  False.

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

# Question 7 (10 points) It is well known that Investors generally do not like
# to bear risk. For two otherwise identical corporate bonds, the one with more
# idiosyncratic risk should have a price that is Higher.  Lower.  The same.

# Question 8 (15 points) Suppose your client is risk-averse but can invest in
# only one of the three securities, X, Y, or Z, in an uncertain world
# characterized as follows. Next year the economy will be in an expansion,
# normal, or recession state with probabilities 0.40, 0.40, and 0.20,
# respectively. The returns (%) on the three securities in these states are as
# follows: Security X {expansion = +14, normal = +10, recession = +7};
# Security Y {+11, +9, +8}; Security Z {+13, +8, +7.5}. Which security can you
# rule out, that is, you will not advise your client to invest in it?  None of
# the securities.  Security Y.  Security X.  Security Z.

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
