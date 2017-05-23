## 1.1

1. Give a real world example that requires sorting or a real world example that requires computing a convex hull.
  * Sorting would be needed for determining the valedictorian of a class (sorting GPAs to find the highest)
  * Computing a convex hull might be needed to set up the minimal amount of sprinklers needed to cover a yard
2. Other than speed, what other measures of efficiency might one use in a real world setting?
  * Memory needed
3. Select a data structure that you have seen previously, and discuss its strengths and limitations.
  * An array is easy to traverse and manipulate but doesn't provide any way of "keeping track" of certain elements other than the actual value which could be the same as another value within the array. Unlike a hash, where a specific key can be assigned to each value or set of values for further classification
4. How are the shortest-path and traveling-salesman problems give above similar? How are they different?
  * They are similar in that you are trying to find the shortest route among multiple points but with the shortest-path you are only visiting a point once whereas with the traveling-salesman, "backtracking" or doubling-back through previously visited points may result in a overall shorter path.
5. Come up with a real-world problem in which only the best solution will do. Then come up with one in which a solution that is "approximately" the best is good enough.
  * Going back to the shortest path, getting directions from one point on the map to another. Typically, only the best solution will do taking into account distance, average speed, traffic, etc.
  * And with the traveling-salesman, finding the best approximation is good enough.

## 1.2

1. Give an example of an application that requires algorithmic content at the application level, and discuss the function of the algorithms involved.
  * Google Maps requires lots of algorithmic content. From GPS positioning, networking, shortest path algorithms, etc, there are a ton of problems to solve that require algorithms.
2. Suppose we are comparing implementations of insertion sort and merge sort on the same machine. For inputs of size n, insertion sort runs in 8n^2 steps, while merge sort runs in 64nlgn steps. For which values of n does insertion sort beat merge sort?
  * x < 43
3. What is the smallest value of n such that an algorithm whose running time is 100n^2 runs faster than an algorithm whose running time is 2^n on the same machine?
  * x > 15
