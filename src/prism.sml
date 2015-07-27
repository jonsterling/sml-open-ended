structure Prism =
struct
  type ('a, 'b) t =
    {inject : 'a -> 'b,
     project : 'b -> 'a option}
end
