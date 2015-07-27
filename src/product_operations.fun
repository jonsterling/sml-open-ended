functor ProductOperations
  (structure Left : OPERATIONS
   structure Right : OPERATIONS) : OPERATIONS =
struct
  type 'a t = 'a Left.t * 'a Right.t

  fun default () =
    (Left.default (), Right.default ())

  fun enrich project ((fallbackLeft, fallbackRight), (left, right)) =
    (Left.enrich project (fallbackLeft, left),
     Right.enrich project (fallbackRight, right))
end
