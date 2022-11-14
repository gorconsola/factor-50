-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Hasura.Enum.Projects_constraint exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| unique or primary key constraints on table "Projects"

  - Projects\_pkey - unique or primary key constraint on columns "id"

-}
type Projects_constraint
    = Projects_pkey


list : List Projects_constraint
list =
    [ Projects_pkey ]


decoder : Decoder Projects_constraint
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "Projects_pkey" ->
                        Decode.succeed Projects_pkey

                    _ ->
                        Decode.fail ("Invalid Projects_constraint type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Projects_constraint -> String
toString enum____ =
    case enum____ of
        Projects_pkey ->
            "Projects_pkey"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Projects_constraint
fromString enumString____ =
    case enumString____ of
        "Projects_pkey" ->
            Just Projects_pkey

        _ ->
            Nothing
