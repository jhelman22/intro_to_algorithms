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

## 2.2

1. Express the function n^3/1000 - 100n^2 - 100n + 3 in terms of theta-notation.
  * theta(n^3)
2. Consider sorting n numbers stored in array A by first finding the smallest element of A and exchanging it with the element in A[1]. Then find the second smallest element of A, and exchange it with A[2]. Continue in this manner for the first n-1 elements of A. Write pseudocode for this algorithm, which is know as selection sort. What loop invariant does this algorithm maintain? Why does it need to run for the first n-1 elements, rather than for all n elements? Give the best-case and worst-case running times of selection sort in theta-notation.
  * for i in [0...n]
      min = i
      for j in [i+1...n]
        if min > A[j]
          min = j
      min_element = A[min]
      A[min] = A[i]
      A[i] = min_element
  * The loop invariant is that A[i..j] will always be sorted in ascending order.
  * It only needs to run for the first n-1 elements b/c as you constantly swap the current element for the minimum element of the remaining array, you are guaranteed to have the max element at the last index. And there is no more elements left to be swapped.
  * Best case and worst-case are both theta(n^2)
3. Consider linear search again. How many elements of the input sequence need to be checked on the average, assuming that the element being searched for is equally likely to be any element in the array? How about in the worst case? What are the average-case and worst-case running times of linear search in theta-notation? Justify your answers.
  * On average n/2 elements need to be checked
  * Average-case and worst-case are both theta(n)
4. How can we modify almost any algorithm to have a good best-case running time?
  * We can add some special-case check to terminate the algorithm early.

## 2.3

1. Using Figure 2.4 as a model, illustrate the operation of merge sort on the array A = [3,41,52,26,38,57,9,49]
  * [3] [41] [52] [26] [38] [57] [9] [49]
  * [3,41] [26,52] [38,57] [9,49]
  * [3,26,41,52] [9,38,49,57]
  * [3,9,26,38,41,49,52,57]
2. Rewrite the MERGE procedure so that it does not use sentinels, instead stopping once either array L or R has had all its elements copied back to A and then copying the remainder of the other array back into A.
  * MERGE_2(A,p,q,r)
    n1 = q - p + 1
    n2 = r - q
    L = new array of size n1
    R = new array of size n2
    for i in (0..n1)
      L[i] = A[p + i]
    for j in (0..n2)
      R[i] = A[q + j + 1]
    merged = []
    while L.length and R.length > 0
      if L[0] <= R[0]
        merged.push(L.slice!(0))
      else
        merged.push(R.slice!(0))
    merged.push(L) if L.length > 0
    merged.push(R) if L.length > 0
    merged.flatten
3. Use mathematical induction to show that when n is an exact power of 2, the solution of the recurrence
    T(n) = 2 if n = 2, 2T(n/2) + n if n = 2^k, for k > 1
  is T(n) = nlgn
  * Base case n=2, lg2 = 1 so number of levels is lgn. So first level costs 1. Every level after that costs n. So the total cost is nlgn + 1 which ignoring the cost makes T(n) = nlgn
4. We can express insertion sort as a recursive procedure as follows. In order to sort A[1..n], we recursively sort A[1..n-1] and then insert A[n] into the sorted array A[1..n-1]. Write a recurrence for the running time of this recursive version of insertion sort.
  * T(n) = c if n = 1, 2T(n-1) if n > 1
