# Monte Carlo valuation of European Call Option
# Index Prediction by Black-Scholes-Merton model

import math
import numpy as np

# parameters
S0 = 10000 # initial index level
K = 105 # call option strike price
T = 1.0 # 1 year time-to-maturity
r = 0.02 # riskless short rate
sigma = 0.2 # volatility

I = 2000 # number of simulation

# calculate the value of the stock index 
np.random.seed(666)
z = np.random.standard_normal(I) 

# vectorized calculation of numpy
indexValue = S0*np.exp( (r - 0.5*sigma**2)*T + sigma*math.sqrt(T)*z)

# calculate call option value
hT = np.maximum(indexValue - K, 0)

# MC estimator of Call Option Prize
c0 = math.exp(-r*T)*np.mean(hT)

# 
print(f"The value of the European Call option: {c0:5.5f}")