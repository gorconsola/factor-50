module Route exposing (..)

import Html exposing (..)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Builder
import Url.Parser as Parser
    exposing
        ( (</>)
        , (<?>)
        , Parser
        )



-- ROUTING


type Route
    = Root
    | Onboarding
    | Policies
    | Learning
    | UnknownRoute



-- PARSING


fromUrl : Url -> Route
fromUrl url =
    Maybe.withDefault UnknownRoute <|
        Parser.parse parser url


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Onboarding (Parser.s "onboarding")
        , Parser.map Policies (Parser.s "policies")
        , Parser.map Learning (Parser.s "learning")
        , Parser.map Root Parser.top
        ]



-- HELPERS


viewLink : Route -> List (Attribute msg) -> List (Html msg) -> Html msg
viewLink route attributes content =
    a (Attr.href (toUrl route) :: attributes) content


toUrl : Route -> String
toUrl route =
    let
        ( segments, params ) =
            toPathSegments route
    in
    Url.Builder.absolute segments params


toPathSegments : Route -> ( List String, List Url.Builder.QueryParameter )
toPathSegments route =
    case route of
        Learning ->
            ( [ "learning" ], [] )

        Onboarding ->
            ( [ "onboarding" ], [] )

        Policies ->
            ( [ "policies" ], [] )

        Root ->
            ( [], [] )

        UnknownRoute ->
            ( [ "not-found" ], [] )
