// 100 Days of Swift
// Day 2.

import UIKit

var str = "Hello, playground"

// Complex data types

// 1. Arrays

/*
 Arrays are collections of values that are stored as a single value. For example, John, Paul, George, and Ringo are names, but arrays let you group them in a single value called The Beatles.

 In code, we write this:
 */

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]
beatles[2]
beatles[3]
beatles[0]

/*
Note: If you’re using type annotations, arrays are written in brackets: [String], [Int], [Double], and [Bool].
 */

// Why does Swift have arrays?

/*
 Swift’s strings, integers, Booleans, and Doubles allow us to temporarily store single values, but if you want to store many values you will often use arrays instead.
 */


// 2. Sets

/*
 Sets are collections of values just like arrays, except they have two differences:

 Items aren’t stored in any order; they are stored in what is effectively a random order.
 No item can appear twice in a set; all items must be unique.
 You can create sets directly from arrays, like this:
 */

let colors = Set(["red", "green", "blue"])

let colors2 = Set(["red", "green", "blue", "red", "blue"])

// Why are sets different from arrays in Swift?

/*
 Both sets and arrays are collections of data, meaning that they hold multiple values inside a single variable. However, how they hold their values is what matters: sets are unordered and cannot contain duplicates, whereas arrays retain their order and can contain duplicates.
 
 Those two differences might seem small, but they have an interesting side effect: because sets don’t need to store your objects in the order you add them, they can instead store them in a seemingly random order that optimizes them for fast retrieval. So, when you say “does this set contain item X,” you’ll get an answer in a split second no matter how big the set is.

 In comparison, arrays must store their items in the order you give them, so to check whether item X exists in an array containing 10,000 items Swift needs to start at the first item and check every single item until it’s found – or perhaps it isn’t found at all.
 */

/*
For more information on this topic, check out Antoine van der Lee’s post: https://www.avanderlee.com/swift/array-vs-set-differences-explained/
 */


// 3. Tuples (Кортежи)

/*
 Tuples allow you to store several values together in a single value. That might sound like arrays, but tuples are different:

 You can’t add or remove items from a tuple; they are fixed in size.
 You can’t change the type of items in a tuple; they always have the same types they were created with.
 You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
 Tuples are created by placing multiple items into parentheses, like this:
 */

var name = (first: "Taylor", last: "Swift")
name.0
name.self
name.last

name = (first: "Justin", last: "X")
name.first

// How are tuples different from arrays in Swift?

/*
 Both tuples and arrays allow us to hold several values in one variable, but tuples hold a fixed set of things that can’t be changed, whereas variable arrays can have items added to them indefinitely.

 For example, if we wanted a variable tuple to store a website, we might write this:
 */

var website = (name: "Apple", url: "www.apple.com")

var person = (name: "Paul", age: 40, isMarried: true)

/*
 That combines a string, an integer, and a Boolean in a single value, which would be pretty ugly in an array.
 */

/*
 Dictionaries provide an interesting third case, because they give us some of the name safety of tuples but can grow and change like arrays. I say “some of the name safety” because we can’t guarantee that a particular value exists in a dictionary like we can with a tuple – we just need to try reading it and handle the optional that comes back.
 */

  
// 4. Arrays vs sets vs tuples

/*
 If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
*/

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

/*
 If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
 */
let set = Set(["aardvark", "astronaut", "azalea"])

/*
 If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
 */
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

/*
 Arrays are by far the most common of the three types.
 */

// When should you use an array, a set, or a tuple in Swift?

/*
 If you want to store a list of all words in a dictionary for a game, that has no duplicates and the order doesn’t matter so you would go for a set.
 If you want to store all the articles read by a user, you would use a set if the order didn’t matter (if all you cared about was whether they had read it or not), or use an array if the order did matter.
 If you want to store a list of high scores for a video game, that has an order that matters and might contain duplicates (if two players get the same score), so you’d use an array.
 If you want to store items for a todo list, that works best when the order is predictable so you should use an array.
 If you want to hold precisely two strings, or precisely two strings and an integer, or precisely three Booleans, or similar, you should use a tuple.
 */


// 5. Dictionaries

/*
 Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.

 The most common way of storing dictionary data is using strings. For example, we could create a dictionary that stores the height of singers using their name:
 */

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

/*
 Just like arrays, dictionaries start and end with brackets and each item is separated with a comma. However, we also use a colon to separate the value you want to store (e.g. 1.78) from the identifier you want to store it under (e.g. “Taylor Swift”).

 These identifiers are called keys, and you can use them to read data back out of the dictionary:
 */

heights["Taylor Swift"]

/*
 Note: When using type annotations, dictionaries are written in brackets with a colon between your identifier and value types. For example, [String: Double] and [String: String].
 */

// Why does Swift have dictionaries as well as arrays?

/*
 Dictionaries and arrays are both ways of storing lots of data in one variable, but they store them in different ways: dictionaries let us choose a “key” that identifies the item we want to add, whereas arrays just add each item sequentially.

 So, rather than trying to remember that array index 7 means a user’s country, we could just write user["country"] – it’s much more convenient.

 Like sets, dictionaries don’t store our items with a specific order, so they optimize the way they store items for fast retrieval. So, when we say user["country"] it will send back the item at that key (or nil) instantly, even if we have a dictionary with 100,000 items inside.

 Unlike tuples, you can’t be guaranteed that a key in a dictionary exists. This is why reading a value from a dictionary might send back nothing – you might have requested a key that doesn’t exist!
 */


// 6. Dictionary default values

/*
 If you try to read a value from a dictionary using a key that doesn’t exist, Swift will send you back nil – nothing at all. While this might be what you want, there’s an alternative: we can provide the dictionary with a default value to use if we request a missing key.
 */

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]

favoriteIceCream["Charlotte"]

favoriteIceCream["Charlotte", default: "Unknown"]

// Why does Swift have default values for dictionaries?

/*
 Whenever you read a value from a dictionary, you might get a value back or you might get back nil – there might be no value for that key. Having no value can cause problems in your code, not least because you need to add extra functionality to handle missing values safely, and that’s where dictionary default values come in: they let you provide a backup value to use for when the key you ask for doesn’t exist.
 */

let results = [
    "english": 100,
    "french": 85,
    "geography": 75
]

/*
 As you can see, they sat three exams and scored 100%, 85%, and 75% for English, French, and Geography. If we wanted to read their history score, how we do it depends on what we want:

 If a missing value means the student failed to take the test, then we could use a default value of 0 so that we always get an integer back.
 If a missing value means the student has yet to take the exam, then we should skip the default value and instead look for a nil value.
 So, it’s not like you always need a default value when working with dictionaries, but when you do it’s easy:
 */

let historyResult = results["history", default: 0]


// 7. Creating empty collections

/*
 Arrays, sets, and dictionaries are called collections, because they collect values together in one place.

 If you want to create an empty collection just write its type followed by opening and closing parentheses. For example, we can create an empty dictionary with strings for keys and values like this:
 */

var teams = [String: String]()
/*
 We can then add entries later on, like this:
 */
teams["Paul"] = "Red"

/*
 Similarly, you can create an empty array to store integers like this:
 */

var results1 = [Int]()

/*
 The exception is creating an empty set, which is done differently:
 */

var words = Set<String>()
var numbers = Set<Int>()

/*
 This is because Swift has special syntax only for dictionaries and arrays; other types must use angle bracket syntax like sets.

 If you wanted, you could create arrays and dictionaries with similar syntax:
 */

var scores = Dictionary<String, Int>()
var results2 = Array<Int>()

// Why would you want to create an empty collection?

/*
 When you’re just learning Swift, it’s common to see examples such as this one:
 */

let names = ["Eleanor", "Chidi", "Tahani", "Jianyu", "Michael", "Janet"]

/*
 That’s a constant array of six strings, and because it’s constant it means we can’t add more things to the array – we know all our items when the array is created, so the rest of our program is just using that fixed data.

 But sometimes you don’t know all your data up front, and in those cases it’s more common to create an empty collection then add things as you calculate your data.

 For example, we have our fixed names array above, and if we wanted to figure out which names started with J then we would:

 Creating an empty string array called something like jNames
 Go over every name in the original names array and check whether it starts with “J”
 If it does, add it to the jNames array.
 When we’ve gone over all the names, we’ll end up with two strings in jNames: Jianyu and Janet. Of course, if our check was which names started with “X” then we’d end up with no names in the array – and that’s OK. It started as empty and ended as empty.
 */


// 8. Enumerations

/*
 Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.

 For example, if you wanted to write some code to represent the success or failure of some work you were doing, you could represent that as strings:
 */

let result = "failure"
let result2 = "failed"
let result3 = "fail"

/*
 All those three are different strings, so they mean different things.

 With enums we can define a Result type that can be either success or failure, like this:
 */

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// Why does Swift need enums?

/*
 Enums are an extraordinarily powerful feature of Swift, and you’ll see them used in a great many ways and places. Many languages don’t have enums and get by just fine, so you might wonder why Swift needs enums at all!

 Well, at their simplest an enum is simply a nice name for a value. We can make an enum called Direction with cases for north, south, east, and west, and refer to those in our code. Sure, we could have used an integer instead, in which case we’d refer to 1, 2, 3, and 4, but could you really remember what 3 meant? And what if you typed 5 by mistake?

 So, enums are a way of us saying Direction.north to mean something specific and safe. If we had written Direction.thatWay and no such case existed, Swift would simply refuse to build our code – it doesn’t understand the enum case. Behind the scenes, Swift can store its enum values very simply, so they are much faster to create and store than something like a string.
 */


// 9. Enum associated values

/*
 As well as storing a simple value, enums can also store associated values attached to each case. This lets you attach additional information to your enums so they can represent more nuanced data.

 For example, we might define an enum that stores various kinds of activities:
 */

enum Activity {
    case bored
    case running
    case talking
    case singing
}

/*
 That lets us say that someone is talking, but we don’t know what they talking about, or we can know that someone is running, but we don’t know where they are running to.

 Enum associated values let us add those additional details:
 */

enum Activity1 {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity1.talking(topic: "football")

// Why would you want to associate a value with an enum case?

/*
 One of the most powerful features of Swift’s enums is their ability to store one or more associated values – extra pieces of information that describe the enum case in more detail.

 Associated values can be attached to every case, or only some cases. Plus, each case can have as many associated values as you want, as long as each one has a type.

 For example, we might create a Weather enum with three cases:
 */

enum Weather {
    case sunny
    case windy(speed: Int)
    case rainy(chance: Int, amount: Int)
}

/*
 We could do something similar, but it would be pretty unpleasant. Imagine this:
 */

enum Weather1 {
    case sunny
    case lightBreeze
    case aBitWindy
    case quiteBlusteryNow
    case nowThatsAStrongWind
    case thisIsSeriousNow
    case itsAHurricane
}

/*
 So, enums with associated values let us add extra information to an enum case – think of them as being adjectives to a noun, because it lets us describe the thing in more detail.
 */


// 10. Enum raw values

/*
 Sometimes you need to be able to assign values to enums so they have meaning. This lets you create them dynamically, and also use them in different ways.

For example, you might create a Planet enum that stores integer values for each of its cases:
 */

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

/*
 Swift will automatically assign each of those a number starting from 0, and you can use that number to create an instance of the appropriate enum case. For example, earth will be given the number 2, so you can write this:
 */
let earth = Planet(rawValue: 2)

/*
 If you want, you can assign one or more cases a specific value, and Swift will generate the rest. It’s not very natural for us to think of Earth as the second planet, so you could write this:
 */

enum Planet1: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}


// 11. Complex types: Summary

/*
 Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 Arrays store items in the order you add them, and you access them using numerical positions.
 Sets store items without any order, so you can’t access them using numerical positions.
 Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 Dictionaries store items according to a key, and you can read items using those keys.
 Enums are a way of grouping related values so you can use them without spelling mistakes.
 You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */




