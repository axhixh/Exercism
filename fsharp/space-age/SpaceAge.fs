module SpaceAge

type Planet =
  | Earth
  | Mercury
  | Venus
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

let age (planet: Planet) (seconds: int64): float =
  let helper factor = System.Math.Round ((float seconds / 31557600.0 / factor), 2)
  match planet with
  | Earth -> helper 1.0
  | Mercury -> helper 0.2408467
  | Venus -> helper 0.61519726
  | Mars -> helper 1.8808158
  | Jupiter -> helper 11.862615
  | Saturn -> helper 29.447498
  | Uranus -> helper 84.016846
  | Neptune -> helper 164.79132
