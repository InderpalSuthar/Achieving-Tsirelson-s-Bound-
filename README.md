# Achieving-Tsirelson-s-Bound-
In this tutorial we will about to get tsirelson bound using actual quantum hardware of qiskit and also verify the result by convex optimization technique (semi definite programming) using MATLAB + python  
This tutorial contains three types of file :  
(1) classical_correlation.m
(2) qiskit_correlation.ipynb
(3) chsh_inequality.ipynb

1st file contains the content for the simple reasoning of Bell's Inequality using some example that have CHSH value < 2 due to weak correlation of B with A .  
Because B have biasness in getting the measurement outcomes while A is getting unbiased outcomes that's why they lack in correlation.  
  
2nd file contains the content that use the actual quantum hardware 'ibm_sherbrooke' to prove the CHSH and disprove the Bell's Inequality in case of entanglement.  
This file need good knowledge of qiskit to understand the functionalities.  

3rd File contains the content that use convex optimization techniques - semi definite programming to optimize CHSH value , one can also use the MATLAB for this but I use python's library 'cvxpy'  


