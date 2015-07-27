signature INJECTION =
sig
  type t
  type ambient

  (* inject a [t] into [ambient] *)
  val `> : t -> ambient

  exception Mismatch

  (* project an [ambient] into [t], possibly raising [Mismatch] *)
  val `< : ambient -> t
end

