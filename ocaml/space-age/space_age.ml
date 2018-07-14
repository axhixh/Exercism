type planet = Mercury | Venus | Earth | Mars
            | Jupiter | Saturn | Neptune | Uranus

let age_on p a = 
  let a' = float_of_int a /. float_of_int 31557600 in
  match p with
  | Mercury -> a' /. 0.2408467
  | Venus -> a' /. 0.61519726
  | Earth -> a'
  | Mars -> a' /. 1.8808158 
  | Jupiter -> a' /. 11.862615
  | Saturn -> a' /. 29.447498
  | Uranus -> a' /. 84.016846
  | Neptune -> a' /. 164.79132
