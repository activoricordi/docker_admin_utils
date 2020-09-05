# Elm Programming Language

## Tools

### Add Css Styles to Elm

As you could presume, it is possible to add **css** to a **style.css** file. This file could be added to the **html file**.

### Basic Syntax

#### String

#### [Add functions](#basic-syntax-functions)

Functions in Elm are everywhere even operators a functions as well.

```elm
-- HelloWord03.elm
module Main exposing(main)

-- In this line we import the Html module, to access to div and text functionality
import Html exposing (Html,div,text)

{-
We create a funtion for dinamically add text based on two parameters.
The *makeGreeting* function concatenate the strings we have used for the greeting
in a new String.
ELm has a String module with multiple functions such as concat, left, reverse and others.
This function could be written with ++ sign operator for contact
-}
makeGreeting : String -> String -> String
makeGreeting greeting name =
    String.concat [greeting," ",name]

{-
ELm has currying it can include a function inside of another function.
The main function retains an element to draw into the page.
-}
main =
    Html.div
        [] -- inside attributes list such as class, or other
        [text( makeGreeting "Hello!" "Dolores" )] -- We add two functions text and makeGreeting for text
```

#### Arrays and Collections

We could work with **Arrays** and **Collections**. In JavaScript, there are libraries for working with Collections.

#### Custom or Union Types

The Custom types used to be referred to as *union types*. Programming languages have a set of predefined types such as *Boolean*, *Int* and *String*.

## Elm Architecture Examples

### Event Architecture and CRQS

Elm allows to program based with Event Streams. An event could happen and whenever that event happens, we react by doing something.
While **ReactJS** only manages the **View** part and Redux manages the **model** and the **updaters** (which are called Reducers). Elm manages the whole flux model.
Create a *module* called **Account**. This Account keeps the state

* **addAmountAccount**
* **removeAmountAccount**
* **getBookings**

### Add Date and Time functions

```shell
elm install justinmimbs/date
```

We do an example for calculate the date after 12 weeks.

```elm
-- Calculate the date after 12 weeks

```

We do another example for calculating the date based on today after 20 weeks.

```elm

```

We add an example for list the monday date for the next 12 ocurrences.

## Generate Production Code

### Generate a Component

Elm is not organized based in **components** but rather in **functions** which exchange **messages (msg)**

Elm has multiple *modules* which acts as *components*. One is [elm-datepicker](https://github.com/CurrySoftware/elm-datepicker). The [elm-datepicker](https://github.com/CurrySoftware/elm-datepicker) is a reusable date picker component adapted to Elm 0.19. Its documentation could be found [here](https://package.elm-lang.org/packages/CurrySoftware/elm-datepicker/latest/.).

Another good example which has been used as a reference by this chapter is the [Visualization of Elm Signals](https://github.com/yang-wei/elmflux)

We generate a module where first select what are the functions to expose.

The date picker creates a [type alias](basicSyntax#typealias)

#### Force Layout Simplest Possible Graph

The force layout requires two data arrays We declare a data type array called *nodes*.

* [Elm Visualization](https://github.com/gampleman/elm-visualization)

References

* [Getting Started with Elm Language](https://riptutorial.com/elm/topic/1011/getting-started-with-elm-language)
* [elm-live](https://github.com/wking-io/elm-live)
* [Elm Directory Documentation for Packages](http://elm-directory.herokuapp.com/)

### Server for rendering ELM

### Basic Elm Http.post

### Create an Static Generator Site

### Create a Data library (Datalib)

This is a library inspired on [Datalib](https://github.com/vega/datalib) or [D3 Jetpack](https://github.com/gka/d3-jetpack)

### Utils Functions

At **Elm**, it does not require many of the functions created [Lodash](https://https://lodash.com/) . We analyze how to implement each of the functions.

### Arrays functions

### Collections functions

#### Elm .gitignore

Change directories to the your local *GitHub Pages* repository. As usual, it is necessary to add a new file called **.gitignore** to the distribution folder.
At this **.gitignore**. We put the names of files and folders we don’t want stored in our repo within this file. Ideally these will be automatically generated files like the ones that were created when we ran the elm package install command. Those files are necessary in order for us to develop and compile our Elm code, but the final product that it produces, theelm.jsfile, is all we need for our site to work. And while we don’t require the Main.elm file to make our website work, we don’t want to ignore it because without it we won’t be able to generate a newelm.js file in the future. Add the following to your .gitignore file:

```sh
#! Elm artifacts
/elm/elm-stuff
```

Elm architecture is an alternative pattern to organizing your application logic. It is an alternative to MVC pattern. The Elm architecture is a Model View Update architecture. Model is not an object that encapsulate behaviour and application data but just encapsulate the application state.
Similarly View is not an object but a function which renders only the visual representation of that state. View is enforced to be a pure function easily testable

* [Animated TEA Architecture](https://medium.com/@l.mugnaini/the-elm-architecture-tea-animation-3efc555e8faf)
* [TEA](https://riptutorial.com/elm/topic/3771/the-elm-architecture)
* [Model](https://elmprogramming.com/model-view-update-part-1.html)
* [View](https://elmprogramming.com/model-view-update-part-1.html)
* [elm-application-with-parcel](https://dev.to/mickeyvip/writing-a-word-memory-game-inelm---part-1-setting-up-an-elm-application-with-parcel-1ppk)
* [functors-and-monads](https://dev.to/drbearhands/invoices-2-functors-and-monads-in-action-209p)
* [Decoders](https://dev.to/jwoudenberg/keeping-decoders-simple-360e)
* [Modelling a save button in elm](https://dev.to/jwoudenberg/modelling-a-save-button-in-elm-2eo8)
* [Minimum Elm components with parcel](https://dev.to/mizchi/minimum-elm-component-with-percel-and-webcomponents-2oh9)
* [Redux and Elm](https://dev.to/clicktravelengorg/a-look-at-a-small-elm-application-2loh)
* [Elm and SaaS](https://github.com/gribouille/elm-bootstrap)
* [Array Utils functions](https://github.com/Shearerbeard/beginning-elm-book/blob/master/src/RippleCarryAdder.elm)
* [SVG Icons to Elm](https://github.com/elm/compiler/blob/master/reactor/src/Index/Icon.elm)
* [React Components](https://dev.to/norpan/embedding-react-components-in-elm-with-custom-elements-28n1)
* [Elm Collections](https://dev.to/skinney/elm-019-brings-better-collections-3320)
* [Elm Geolocation](https://dev.to/elmupdate/geolocation-in-an-elm-web-app-4n9i)
* [invoices-in-elm](https://dev.to/drbearhands/invoices-in-elm-part-1-30kf)
* [elm-tools](https://dev.to/zwilias/elm-tools-571a)
* [nested-reusable-view-functions-in-elm](https://medium.com/@mickey.vip/an-approach-to-nested-reusable-view-functions-in-elm-a1531b9abaf3)
* [Time Travel Events ordered](https://riptutorial.com/elm/example/13156/time-traveling-debugger)
* [Subscriptions](https://github.com/jakewitcher/Elm_Browser-dot-document-Boilerplate/blob/master/src/Main.elm)
* [Binding First Part One](https://www.codefornerds.com/understanding-the-browser-document-elm-application-pt-1/)
* [Binding Second Part Two](https://www.codefornerds.com/understanding-the-browser-document-elm-application-pt-2/)
* [Single Page Web Apps elm part one](https://www.linkedin.com/pulse/single-page-web-apps-elm-part-one-getting-started-new-kevin-greene/)

#### Credits

[Pawan Poudel](https://github.com/pawanpoudel)
[Elm Author](http://elmprogramming.com/about-the-author.html)
[Kevin Greene](https://www.linkedin.com/in/kevin-greene-a4496971/)
