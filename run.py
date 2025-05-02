"""Function calls are made from this file."""


import time
import add_pass_mark as boost


# Function calls
e1 = time.time()
boost.increase_score('students_results.csv')
e2 = time.time()
# Time taken for first function
function_1_time = e2 - e1
print("Function 1 runtime:", function_1_time)

e3 = time.time()
boost.increase_score_v2()
e4 = time.time()
# Time taken for first function
function_2_time = e4 - e3
print("Function 2 runtime:", function_2_time)
