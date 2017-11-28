(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your
* code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use
* "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val
* test1 = true : bool *)


val test1 = is_older ((1,2,3), (2,3,4)) = true
val test1_1 = is_older ((2,3,4), (1,2,3)) = false
val test1_2 = is_older ((2017,3,4), (2018,2,3)) = true
val test1_3 = is_older ((2017,3,4), (2016,2,3)) = false
val test1_4 = is_older((2012,2,28), (2011,4,28)) = false
val test1_5 = is_older((2011,4,28), (2012,2,28)) = true
val test1_6 = is_older((2011,4,28), (2011,2,28)) = false
val test1_7 = is_older((2011,2,28), (2011,4,28)) = true
val test1_8 = is_older((2011,2,27), (2011,2,28)) = true
val test1_9 = is_older((2011,2,28), (2011,2,27)) = false

val test2 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1

val test3 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_1 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test3_2 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4]) = 1

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test5 = dates_in_months
([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) =
[(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string (2013, 1, 1) = "January 1, 2013"
val test7_1 = date_to_string (2017, 2, 15) = "February 15, 2017"
val test7_2 = date_to_string (2017, 3, 31) = "March 31, 2017"
val test7_3 = date_to_string (2013, 4, 1) = "April 1, 2013"
val test7_4 = date_to_string (2013, 5, 1) = "May 1, 2013"
val test7_5 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test7_6 = date_to_string (2013, 7, 1) = "July 1, 2013"
val test7_7 = date_to_string (2013, 8, 1) = "August 1, 2013"
val test7_8 = date_to_string (2013, 9, 1) = "September 1, 2013"
val test7_9 = date_to_string (2013, 10, 1) = "October 1, 2013"
val test7_10 = date_to_string (2013, 11, 1) = "November 1, 2013"
val test7_11 = date_to_string (2013, 12, 1) = "December 1, 2013"

val values = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
val test8 = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val test8_1 = number_before_reaching_sum (2, [1,2,3,4,5]) = 1
val test8_2 = number_before_reaching_sum (4, [1,2,3,4,5]) = 2
val test8_3 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_4 = number_before_reaching_sum (1, values) = 0
val test8_5 = number_before_reaching_sum (32, values) = 1
val test8_6 = number_before_reaching_sum (60, values) = 2
val test8_7 = number_before_reaching_sum (200, values) = 6
val test8_8 = number_before_reaching_sum (365, values) = 11

val test9 = what_month 1 = 1
val test9_1 = what_month 31 = 1
val test9_2 = what_month 32 = 2
val test9_3 = what_month 59 = 2
val test9_4 = what_month 60 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_1 = oldest([(2012,2,28)]) = SOME (2012,2,28)
val test11_2 = oldest([(2012,2,28),(2011,4,28)]) = SOME (2011,4,28)
val test11_3 = oldest([(2011,4,28),(2012,2,28)]) = SOME (2011,4,28)
val test11_4 = oldest([]) = NONE

(*val test_sort = sort([1,2,3]) = [1,2,3]
val test_sort_1 = sort([2,1,3]) = [1,2,3]
val test_sort_2 = sort([2,3,1]) = [1,2,3]
val test_sort_3 = sort([3,2,1]) = [1,2,3]
val test_sort_4 = sort([3,2,1,4]) = [1,2,3,4]
val test_sort_5 = sort([3,2,1,5,4]) = [1,2,3,4,5]*)

val test_min_1 = min([1,2,3,4,5]) = (1, 0)
val test_min_2 = min([2,1,3,4,5]) = (1, 1)
val test_min_3 = min([2,3,1,4,5]) = (1, 2)
val test_min_4 = min([2,3,4,1,5]) = (1, 3)
val test_min_5 = min([2,3,4,5,1]) = (1, 4)

val test_delete_nth_1 = delete_nth([1,2,3,4,5], 0) = [2,3,4,5]
val test_delete_nth_2 = delete_nth([1,2,3,4,5], 1) = [1,3,4,5]
val test_delete_nth_3 = delete_nth([1,2,3,4,5], 2) = [1,2,4,5]
val test_delete_nth_4 = delete_nth([1,2,3,4,5], 3) = [1,2,3,5]
val test_delete_nth_5 = delete_nth([1,2,3,4,5], 4) = [1,2,3,4]

val test_deduplicate_1 = deduplicate([1,1,2,3,4,5]) = [1,2,3,4,5]
val test_deduplicate_2 = deduplicate([1,1,2,2,3,4,5]) = [1,2,3,4,5]
val test_deduplicate_3 = deduplicate([1,1,2,2,3,3,4,5]) = [1,2,3,4,5]
val test_deduplicate_4 = deduplicate([1,1,2,3,4,4,4,5]) = [1,2,3,4,5]
val test_deduplicate_5 = deduplicate([1,1,2,3,4,4,4,5,5,5,5]) = [1,2,3,4,5]

val test_sort2_1 = sort([1,1,2,3,4,5]) = [1,1,2,3,4,5]
val test_sort2_2 = sort([1,1,2,5,4,3]) = [1,1,2,3,4,5]
val test_sort2_3 = sort([1,1,3,5,4,2]) = [1,1,2,3,4,5]
val test_sort2_4 = sort([1,5,3,1,4,2]) = [1,1,2,3,4,5]

(* challenge 2 tests *)

val test_reasonable_date_invalid_year = reasonable_date((0, 12, 31)) = false

val test_reasonable_date_invalid_month_1 = reasonable_date((2010, 0, 31)) = false
val test_reasonable_date_invalid_month_2 = reasonable_date((2010, 13, 31)) = false

val test_reasonable_date_1 = reasonable_date((2016, 1, 1)) = true
val test_reasonable_date_2 = reasonable_date((2016, 2, 29)) = true
val test_reasonable_date_3 = reasonable_date((2017, 2, 29)) = false
val test_reasonable_date_4 = reasonable_date((0, 2, 29)) = false
val test_reasonable_date_5 = reasonable_date((2017, 13, 29)) = false
val test_reasonable_date_6 = reasonable_date((2017, 2, 30)) = false
val test_reasonable_date_7 = reasonable_date((2017, 12, 31)) = true
val test_reasonable_date_8 = reasonable_date((400, 1, 1)) = true
val test_reasonable_date_9 = reasonable_date((800, 1, 1)) = true
val test_reasonable_date_10 = reasonable_date((2016, 1, 1)) = true
val test_reasonable_date_11 = reasonable_date((100, 1, 1)) = true
val test_reasonable_date_12 = reasonable_date((1900, 1, 1)) = true
