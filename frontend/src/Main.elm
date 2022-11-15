module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Route exposing (Route(..))
import Url
import Util.Icon exposing (viewFactor50)



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , subscriptions = subscriptions
        , update = update
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        , view = view
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- MODEL


type alias Model =
    { currentRoute : Route
    , key : Nav.Key
    }


type MenuItem
    = MenuItem MenuItemData


type alias MenuItemData =
    { route : Route
    , title : String
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { currentRoute = Route.fromUrl url
      , key = key
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked (Browser.Internal url) ->
            ( model, Nav.pushUrl model.key (Url.toString url) )

        LinkClicked (Browser.External href) ->
            ( model, Nav.load href )

        UrlChanged url ->
            ( { model | currentRoute = Route.fromUrl url }
            , Cmd.none
            )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Project template"
    , body =
        [ main_ [ class "main" ]
            [ viewMenu model.currentRoute
            , viewPage model.currentRoute
            ]
        ]
    }


viewMenu : Route -> Html Msg
viewMenu currentRoute =
    let
        viewMenuItem (MenuItem item) =
            li [ classList [ ( "is-active", item.route == currentRoute ) ] ]
                [ Route.viewLink item.route [] [ text item.title ]
                ]

        viewRoot =
            li [ class "menu__logo" ]
                [ a [ href "/" ] [ viewFactor50 ]
                ]
    in
    nav []
        [ ol [] <| viewRoot :: List.map viewMenuItem menuItems
        ]


viewPage : Route -> Html Msg
viewPage route =
    case route of
        Root ->
            h1 [] [ text "Home" ]

        Onboarding ->
            h1 [] [ text "Onboarding" ]

        Policies ->
            h1 [] [ text "Policies" ]

        Learning ->
            h1 [] [ text "Learning" ]

        UnknownRoute ->
            h1 [] [ text "404 Page Not Found" ]



-- HELPERS


menuItems : List MenuItem
menuItems =
    [ MenuItem { route = Onboarding, title = "Onboarding" }
    , MenuItem { route = Policies, title = "Policies" }
    , MenuItem { route = Learning, title = "Learning" }
    ]
