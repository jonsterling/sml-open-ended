signature OPERATIONS =
sig
  type 'a t
  val default : unit -> 'a t
  val enrich : ('a, 'b) Prism.t -> 'b t * 'a t -> 'b t
end
