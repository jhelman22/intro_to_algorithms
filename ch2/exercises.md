## 2.1

1. Using Figure 2.2 as a model, illustrate the operatiion of INSERTION-SORT on the array A = [31,41,59,26,41,58]
  * A = [31,*41*,59,26,41,58] (41 is not less than 31 so move on)
  * A = [31,41,*59*,26,41,58] (59 is not less than 41 so move on)
  * A = [31,41,59,*26*,41,58] (26 is less than 59, 41, 31 so place it in the zero index and shift everything else down)
  * A = [26,31,41,59,*41*,58] (41 is less than 59 so swap the two)
  * A = [26,31,41,41,59,*58*] (58 is less than 59 so swap the two)
  * A = [26,31,41,41,58,59] (FINAL)
2. Rewrite the INSERTION-SORT procedure to sort into nonincreasing instead of nodecreasing order.
  * for j = 2 to A.length
      key = A[j]
      i = j - 1
      while i > 0 and A[i] < key
        A[i+1] = A[i]
        i = i - 1
      A[i+1] = key
3. Consider the searching problem:
    Input: A sequence of n numbers A = [a1,a2,...,an] and a value v
    Output: An index i such that v = A[i] or the special value NIL if v does not appear in A
    Write pseudocode for linear search, which scans through the sequence, looking for v. Using a loop invariant, prove that your algorithm is correct. Make sure that your loop invariant fulfills the three necessary points.
  * i = 0
    index = A[i] == v ? i : NIL
    while index == NIL && i < n
      i ++
      if A[i] == v
        index = i
    return index

    Loop invariant: At the start of each loop index must be the location of V within subarray A[0..i]
      * Initialization: Before the first iteration of the loop, index will be zero only if v is the element A[0]
      * Maintenance: During each iteration, i is incremented so that the subarray is now A[0..i+1] and we check if element at A[i+1] is v. The loop continues to run until index has been set (ie. v has been found) or if there are no more elements in the array.
      * Termination: The loop terminates if index has been set or if i exceeds the number of elements in the array. Index will either have the correct index of the value v within the array or will still be NIL.
4. Consider the problem of adding two n-bit binary integers, stored in two n-element arrays A and B. The sum of the two integers should be stored in binary form in an (n+1)-element array C. State the problem formally and write pseudocode for adding the two integers.
  * Input: Two n-element arrays A and B representing the bits of two n-bit integers.
  * Output: A single (n+1)-element array C that represents the sum of the two binary numbers
  * C = int[n+1]
    carry = 0
    for i in [n..0]
      sum = A[i] + B[i] + carry
      if sum == 3
        C[i] = 1
        carry = 1
      elseif sum == 2
        C[i] = 0
        carry = 1
      else
        C[i] = sum
        carry = 0
    return C
