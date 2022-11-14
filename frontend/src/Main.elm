module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
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
    { page : Page
    , key : Nav.Key
    }


type Page
    = Home
    | Onboarding
    | Policies
    | Learning
    | NotFound


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { page = toPage url
      , key = key
      }
    , Cmd.none
    )


toPage : Url.Url -> Page
toPage url =
    case url.path of
        "/" ->
            Home

        "/onboarding" ->
            Onboarding

        "/policies" ->
            Policies

        "/learning" ->
            Learning

        _ ->
            NotFound



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
            ( { model | page = toPage url }
            , Cmd.none
            )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Project template"
    , body =
        [ main_ [ class "main" ]
            [ viewNavigation model.page
            , viewPage model.page
            ]
        ]
    }


viewNavigation : Page -> Html Msg
viewNavigation _ =
    let
        viewLink path =
            li [] [ a [ href path ] [ text path ] ]
    in
    nav []
        [ ol []
            [ li [] [ a [ href "/" ] [ viewFactor50 ] ]
            , viewLink "/onboarding"
            , viewLink "/policies"
            , viewLink "/learning"
            , viewLink "/asdklfjakslfj"
            ]
        ]


viewPage : Page -> Html Msg
viewPage page =
    case page of
        Home ->
            h1 [] [ text "Home" ]

        Onboarding ->
            h1 [] [ text "Onboarding" ]

        Policies ->
            h1 [] [ text "Policies" ]

        Learning ->
            h1 [] [ text "Learning" ]

        NotFound ->
            h1 [] [ text "404 Page Not Found" ]
