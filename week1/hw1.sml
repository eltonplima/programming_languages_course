fun is_older(date1 : int * int * int, date2 : int * int * int) =
    let
        val hours_day = 1440
        val hours_month = hours_day * (365 div 12)
        val hours_year = hours_month * 12
        val hours_d1 = #1 date1 * hours_year + #2 date1 * hours_month + #3 date1 * hours_day
        val hours_d2 = #1 date2 * hours_year + #2 date2 * hours_month + #3 date2 * hours_day
    in
        hours_d1 < hours_d2
    end

fun number_in_month(dates: (int * int * int) list, month: int) =
    if null dates then 0 else
    if #2 (hd dates) = month then
        1 + number_in_month(tl dates, month)
    else
        number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null dates orelse null months then 0 else
        number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates then [] else
        if #2 (hd dates) = month then
            hd dates::dates_in_month(tl dates, month)
        else
            dates_in_month(tl dates, month)

fun dates_in_months(dates: (int * int * int) list, months: int list) =
    if null dates orelse null months then [] else
        dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings: string list, n: int) =
    if n <= 0 then "" else List.nth(strings, n-1)

fun date_to_string(date: (int * int * int)) =
    let
        val months = ["January", "February", "March", "April", "May", "June",
                      "July", "August", "September", "October", "November", "December"]
        val month = get_nth(months, #2 date)
        val day = Int.toString(#3 date)
        val year = Int.toString(#1 date)
    in
        month ^ " " ^ day ^ ", " ^ year
    end

exception EmptyList
fun number_before_reaching_sum(sum: int, numbers: int list) =
    if null numbers then raise EmptyList else
        if hd numbers >= sum then 0 else
            1 + number_before_reaching_sum(sum - hd numbers, tl numbers)

exception InvalidDay
fun what_month(day: int) =
    if day < 1 orelse day > 365 then raise InvalidDay else
    let
        val last_day_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day, last_day_months) + 1
    end

fun month_range(day1: int, day2: int) =
    if day1 > day2 then [] else
        if day1 = day2 then [what_month(day2)] else
            what_month(day1)::month_range(day1 + 1, day2)

fun oldest(dates: (int * int * int) list) =
    if null dates then NONE else
        if null (tl dates) then SOME(hd dates) else
            let
                val date1 = SOME(hd dates)
                val date2 = oldest(tl dates)
            in
                if is_older(valOf date1, valOf date2) then date1 else date2
            end

(* challenges *)
exception EmptyList
fun min(l: int list) =
    (* Returns the min value of a list and your position(1 indexed) *)
    if null l then raise EmptyList else
        let
            fun inner_min(m: int list, n: int) =
                if null (tl m) then (hd m, n) else
                    let
                        val x = hd m
                        val y = inner_min(tl m, n + 1)
                    in
                        if x < #1y then (x, n) else y
                    end
        in
            inner_min(l, 0)
        end

fun delete_nth(list, nth) =
    if null list then [] else
        let
            val h = hd list
            val t = tl list
        in
            if nth = 0 then t else h::delete_nth(t, nth - 1)
        end

fun deduplicate(values: int list) =
    if null values then [] else
        if null (tl values) then values else
            let
                val head = hd values
                val neck = hd (tl values)
                val tail = tl (tl values)
            in
                if head = neck then deduplicate(neck::tail) else
                    head::deduplicate(neck::tail)
            end

fun sort(l: int list) =
    if null l then [] else
        let
            val vp = min(l)
            val value = #1 vp
            val pos = #2 vp
        in
            value::sort(delete_nth(l, pos))
        end

(* challenge 12.1 *)
fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
    number_in_months(dates, deduplicate(sort(months)))

(* challenge 12.2 *)
fun dates_in_months_challenge(dates: (int * int * int) list, months: int list) =
    dates_in_months(dates, deduplicate(sort(months)))

(* challenge 13 *)
fun reasonable_date(date: (int * int * int)) =
    let
        val y = #1 date
        val m = #2 date
        val d = #3 date
        val last_day_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        fun is_leap_year(year) =
            if ((year mod 400) = 0) then true else
                if ((year mod 4) = 0) andalso ((year mod 100) > 0) then true else false
    in
        if y > 0 andalso m > 0 andalso m <= 12
        then
            let
                val month_bound = List.nth(last_day_months, m - 1)
            in
                if m = 2 andalso is_leap_year(y)
                then
                    d <= month_bound + 1
                else
                    d <= month_bound
            end
        else
            false
    end
