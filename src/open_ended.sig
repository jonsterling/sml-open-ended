signature OPEN_ENDED =
sig
  type t
  structure Operations : OPERATIONS
  val embed : 'a Operations.t -> ('a -> t) * (t -> 'a option)
  val operations : unit -> t Operations.t
end
