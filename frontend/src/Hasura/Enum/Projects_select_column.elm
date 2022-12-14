-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Hasura.Enum.Projects_select_column exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| select columns of table "Projects"

  - Id - column name
  - Title - column name

-}
type Projects_select_column
    = Id
    | Title


list : List Projects_select_column
list =
    [ Id, Title ]


decoder : Decoder Projects_select_column
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "id" ->
                        Decode.succeed Id

                    "title" ->
                        Decode.succeed Title

                    _ ->
                        Decode.fail ("Invalid Projects_select_column type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : Projects_select_column -> String
toString enum____ =
    case enum____ of
        Id ->
            "id"

        Title ->
            "title"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe Projects_select_column
fromString enumString____ =
    case enumString____ of
        "id" ->
            Just Id

        "title" ->
            Just Title

        _ ->
            Nothing
