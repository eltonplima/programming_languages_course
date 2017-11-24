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
    if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else number_in_month(tl dates, month)

fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null dates orelse null months then 0 else
        let
            val dates_in_cur_month = number_in_month(dates, hd months)
        in
            if dates_in_cur_month > 0 then dates_in_cur_month + number_in_months(dates, tl months) else
                number_in_months(dates, tl months)
        end

fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates then [] else
        if #2 (hd dates) = month then hd dates::dates_in_month(tl dates, month) else
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
            fun oldest_date(dates: (int * int * int) list) =
                if null (tl dates) then hd dates else
                let
                    val date1 = hd dates
                    val date2 = oldest_date(tl dates)
                in
                    if is_older(date1, date2) then date1 else date2
                end
        in
            SOME(oldest_date(dates))
        end

fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
    let
        fun contains(value: int, values: int list) =
            if null values then false else
                if null (tl values) then false else
                    if value = hd values then true else
                        contains(value, tl values)
        fun deduplicate(values: int list) =
            if null values then [] else
                if null (tl values) then values else
                    if contains(hd values, tl values) then [] else
                        hd values

    in

    end
