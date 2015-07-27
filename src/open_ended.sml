structure OpenEnded :> OPEN_ENDED where type 'a Operations.t = unit =
struct
  type t = exn
  structure Operations = UnitOperations

  fun operations () = ()

  fun 'a embed () =
   let
     exception E of 'a
     fun project (e : t) : 'a option =
       case e of
           E a => SOME a
         | _ => NONE
   in
     (E, project)
   end
end

functor EnrichOpenEnded (structure OpenEnded : OPEN_ENDED and Operations : OPERATIONS) : OPEN_ENDED =
struct
  type t = OpenEnded.t

  structure Left = OpenEnded.Operations
  structure Right = Operations

  structure Operations = ProductOperations
    (structure Left = Left and Right = Right)

  val operationsRef : t Operations.t ref = ref (Operations.default ())

  fun operations () = ! operationsRef

  fun embed (operation : 'a Operations.t) =
    let
      val (inject, project) = OpenEnded.embed (Left.default ())
      val fallback = !operationsRef
    in
      operationsRef := Operations.enrich project (!operationsRef, operation);
      (inject, project)
    end
end

