(** solution using assoc list instead of map *)
open Core.Std

type school = (int * string list) list 

module A = List.Assoc 

(** Create a new empty school *)
let create () = []

(** Add a student to a school *)
let add name g school = 
  (match A.find school g with
  | None -> [name]
  | Some names -> name :: names)
  |> A.add school g

(** Get all the students from a grade *)
let grade g school = 
  match A.find school g with
  |None -> []
  |Some names -> names

(** Sort the list of students in a grade, if necessary *)
let sort school = 
  List.map school ~f:(fun (g, names) -> (g, List.sort names ~cmp:(fun l r -> String.compare l r)))


(** Return the list of grades and students as a map *)
let to_map school = Map.of_alist_exn school ~comparator:Int.comparator
