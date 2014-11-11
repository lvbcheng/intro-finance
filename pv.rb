# Compute the PV 
#  fv - payment (fixed per period)
#  n - number of periods
#  r - interest rate (per period)
def pv(fv, n, r)
  fv*(1.0/((1+r)**n))
end
# Compute the FV

def fv(pv, n, r)
  pv * ((1+r)**n)
end
# Computes the payment for a leveled cash flow (annuity).
#  pv - present value (of cash flow)
#  n  - number of periods
#  r  - interest rate (per period)
def pmt(pv, n, r)
  (pv*r)/(1.0 - 1/(1.0+r)**n)
end 
