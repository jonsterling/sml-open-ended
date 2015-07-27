signature INJECTION =
sig
  type t
  type ambient

  (* inject a [t] into [ambient] *)
  val `> : t -> ambient
  (* project an [ambient] into a [t] *)
  val `<? : ambient -> t option

  exception Mismatch

  (* project an [ambient] into [t], possibly raising [Mismatch] *)
  val `< : ambient -> t
end

