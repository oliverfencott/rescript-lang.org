type t = {
  title: string,
  description: Js.null<string>,
  canonical: Js.null<string>,
  ghEditHref: string,
}

let decode = (json): result<t, string> => {
  open! Json.Decode
  try Ok({
    title: field("title", string, json),
    description: optional(field("description", string), json)->Js.Null.fromOption,
    canonical: optional(field("canonical", string), json)->Js.Null.fromOption,
    ghEditHref: field("__ghEditHref", string, json),
  }) catch {
  | DecodeError(errMsg) => Error(errMsg)
  }
}
