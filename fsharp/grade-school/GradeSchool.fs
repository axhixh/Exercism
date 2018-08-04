module GradeSchool

type School = Map<int, string list>

let empty: School = Map.empty

let add (student: string) (grade: int) (school: School): School =
    match school.TryFind grade with
    | Some students -> school.Add (grade, List.sort (student :: students))
    | None -> school.Add (grade, [student])

let roster (school: School): (int * string list) list =
  Map.toList school |> List.sortBy   (fun (g, s) -> g) 

let grade (number: int) (school: School): string list =
  match school.TryFind number with
  | Some students -> students
  | None -> []

