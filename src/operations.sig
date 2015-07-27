signature OPERATIONS =
sig
  type 'a t
  val default : unit -> 'a t
  val enrich : ('b -> 'a option) -> 'b t * 'a t -> 'b t
end
