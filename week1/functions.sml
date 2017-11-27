(* delete values from list *)
fun delete_values(item, list) =
    if null list then [] else
        let
            val h = hd list
            val t = tl list
        in
            if item = h then delete(item, t) else h::delete(item, t)
        end
