structure UnitOperations : OPERATIONS =
struct
  type 'a t = unit
  fun default () = ()
  fun enrich _ _ = ()
end
