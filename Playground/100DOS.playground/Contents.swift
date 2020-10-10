// 100 Days of Swift
// Day 1.

import UIKit

// 1. Variables
var str = "Hello, playground"

str = "Goodbye!"

// Why does Swift have variables?

/*
 Variables allow us to store temporary information in our program, and form a key part of almost every Swift program. Ultimately, your program is going to transform data somehow: maybe you let the user enter in todo list tasks then check them off, maybe you let them roam around a deserted Island working for a capitalist raccoon, or maybe you read the device time and display it in a clock. Regardless, you’re taking some sort of data, transforming it somehow, and showing it to the user.
 */

var favoriteShow = "Orange is the New Black"
favoriteShow = "The Good Place"
favoriteShow = "Doctor Who"

// 2. Strings and integers

var age = 38

var population = 8_000_000

population = 8000000

// Why is Swift a type-safe language?

/*
 Swift lets us create variables as strings and integers, but also many other types of data too. When you create a variable Swift can figure out what type the variable is based on what kind of data you assign to it, and from then on that variable will always have that one specific type.
 */

var meaningOfLife = 42
/*
meaningOfLife = "Forty two"
 error: 100DOS.playground:32:17: error: cannot assign value of type 'String' to type 'Int'
 meaningOfLife = "Forty two"
                 ^~~~~~~~~~~
 */

// 3. Multi-line strings

var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

// Why does Swift need multi-line strings?
/*
 Swift’s standard strings start and end with quotes, but must never contain any line breaks. For example, this is a standard string:
 */
var quote = "Change the world by being yourself"
/*
That works fine for small pieces of text, but becomes ugly in source code if you have lots of text you want to store. That’s where multi-line strings come in: if you use triple quotes you can write your strings across as many lines as you need, which means the text remains easy to read in your code:
 */
var burns = """
The best laid schemes \
O’ mice and men \
Gang aft agley
"""

// 4. Doubles and booleans

var pi = 3.141 //Double

var awesome = true // Bool

// Why does Swift need both Doubles and Integers?
/*
The two main types of numbers you’ll use are called integers and doubles. Integers hold whole numbers, such as 0, 1, -100, and 65 million, whereas doubles hold decimal numbers, such as 0.1, -1.001, and 3.141592654.
 */
var myInt = 1
var myDouble = 1.0

// 5. String interpolation

/*
 You’ve seen how you can type values for strings directly into your code, but Swift also has a feature called string interpolation – the ability to place variables inside your strings to make them more useful.

 You can place any type of variable inside your string – all you have to do is write a backslash, \, followed by your variable name in parentheses. For example:
 */
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

// Why does Swift have string interpolation?
/*
 When it comes time to showing information to your user – whether that’s messages being printed out, text on buttons, or whatever fits your app idea – you will usually rely heavily on strings.

 Of course, we don’t just want static strings, because we want to show the user some sort of relevant data they can use. So, Swift gives us string interpolation as a way of injecting custom data into strings at runtime: it replaces one or more parts of a string with data provided by us.

 For example:
 */
var city = "Cardiff"
var message = "Welcome to \(city)!"

//https://www.hackingwithswift.com/articles/178/super-powered-string-interpolation-in-swift-5-0

//let age = 38
var user: String?
print("You are \(age)")
print("Hi, \(user ?? "Anonymous")")

/*
 Well, after five years of hard service, Swift Evolution has finally come for string interpolation: in Swift 5.0 it gains new super powers that give us substantially more control over how it works.

 To try it out, let’s dive into some code.

 If we make a new age integer like this:

 let age = 38
 */

print("Hi, I'm \(age).")

//Using the new string interpolation system in Swift 5.0 we can extend String.StringInterpolation to add our own custom interpolations, like this:

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Int) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut

        if let result = formatter.string(from: value as NSNumber) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(_ value: Date) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full

        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
}

/*
 We could use the same technique to adjust date formatting, because by default dates in strings don’t look great. Try writing this:
 */

print("Today's date is \(Date()).")

/*
 Note: to avoid confusing your colleagues, you probably shouldn’t override Swift’s defaults. So, name your parameters as needed to avoid confusion:

 mutating func appendInterpolation(format value: Int) {
 
 Now we call that using a format parameter name, like this:

 print("Hi, I'm \(format: age).")
 
 With that change it’s clear we’re triggering custom behavior now.
 */


// TO DO: Continue article.

// 6. Constants

/*
 The let keyword creates constants, which are values that can be set once and never again. For example:
 */

let taylor = "swift"

/*
taylor = "C"
 100DOS.playground:173:1: note: change 'let' to 'var' to make it mutable
 let taylor = "swift"
 ^~~
 var
 */

// Why does Swift have constants as well as variables?

/*
 Swift really loves constants, and in fact will recommend you use one if you created a variable then never changed its value. The reason for this is about avoiding problems: any variable you create can be changed by you whenever you want and as often as you want, so you lose some control – that important piece of user data you stashed away might be removed or replaced at any point in the future.
 */

// 7. Type annotations

/*
 let str = "Hello, playground"
 That will make str a string, so you can’t try to assign it an integer or a boolean later on. This is called type inference: Swift is able to infer the type of something based on how you created it.
 
 If you want you can be explicit about the type of your data rather than relying on Swift’s type inference, like this:
 */
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

// Why does Swift have type annotations?

/*
 “why does Swift have type annotations?”, which is usually followed by “when should I use type annotations in Swift?”

 The answer to the first question is primarily one of three reasons:

 Swift can’t figure out what type should be used.
 You want Swift to use a different type from its default.
 You don’t want to assign a value just yet.
 The first of those will usually happen only in more advanced code. For example, if you were loading some data from the internet that you know happens to be the name of your local politician, Swift can’t know that ahead of time so you’ll need to tell it.

 The second scenario is quite common as you learn more in Swift, but right now a simple example is trying to create a double variable without having to constantly write “.0” everywhere:
 */

var percentage: Double = 99

/*
 The third option happens when you want to tell Swift that a variable is going to exist, but you don’t want to set its value just yet. This happens in lots of places in Swift, and looks like this:
 */

var name: String

/*
 You can then assign a string to name later on, but you can’t assign a different type because Swift knows it would be invalid.
 */

/*
 Of course, the second question here is “when should I use type annotations in Swift?” This is much more subjective, because the answer usually depends on your personal style.

 In my own code, I prefer to use type inference as much as possible. That means I leave off the type annotations, and let Swift figure out the type of things based on what data I store in them. My reasons for this are:

 It makes my code shorter and easier to read.
 It allows me to change the type of something just by changing whatever is its initial value.
 */


// S U M M U R Y
 /*
 1. You make variables using var and constants using let. It’s preferable to use constants as often as possible.
 2. Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
 3. Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
 4. String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
 5. Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you
 */

