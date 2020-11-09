// 100 Days of Swift
// Day 13. Swift review, day one

import UIKit

var str = "Hello, playground"

// Day 13. Swift review, day one

/*
 Repetition helps us learn things more thoroughly. These fundamentals are really important in all the Swift you’ll write, so it’s worth doubling down to make sure you understand them fully.
 Some concepts only make complete sense when you’ve understood other concepts. Circling back like this will help link together the core Swift concepts in your head.
 You might have missed something. Let’s face it, you’ve just gone through 100 videos about the most important parts of Swift – are you absolutely sure you remembered all of it?
 You’ll see how far you’ve come. When you read about arrays and loops – things you might have found challenging previously – hopefully you’ll find them easier now, and feel good that you’re making progress.
 */

// 1. Variables and constants

/*
 Every useful program needs to store data at some point, and in Swift there are two ways to do it: variables and constants. A variable is a data store that can have its value changed whenever you want, and a constant is a data store that you set once and can never change. So, variables have values that can vary, and constants have values that are constant – easy, right?
 */
/*
 Having both these options might seem pointless, after all you could just create a variable then never change it – why does it need to be made a constant? Well, it turns out that many programmers are – shock! – less than perfect at programming, and we make mistakes.
 One of the advantages of separating constants and variables is that Xcode will tell us if we've made a mistake. If we say, "make this date a constant, because I know it will never change" then 10 lines later try to change it, Xcode will refuse to build our app.
 Constants are also important because they let Xcode make decisions about the way it builds your app. If it knows a value will never change, it is able to apply optimizations to make your code run faster.
 In Swift, you make a variable using the var keyword, like this:
 */
//var name = "Tim McGraw"
//name = "Romeo"
//
//let name1 = "Tim McGraw"
// name1 = "Romeo"

//Important note: variable and constant names must be unique in your code. You'll get an error if you try to use the same variable name twice, like this:


// 2. Types of Data

//String
/*
 you assigned some text to a variable, but in Swift this is called a String – literally a string of characters.
 */
var name: String // use what's called a type annotation, which is where you tell Swift what data type the variable will hold later on, even though you aren't giving it a value right now.
name = "Tim McGraw"

// Float and Double

/*
 official Apple recommendation is always to use Double because it has the highest accuracy.
 */
//var latitude: Double
//latitude = 36.166667
//
//var longitude: Float
//longitude = -86.783333

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var longitude1: Double
longitude1 = -86.783333
longitude1 = -186.783333
longitude1 = -1286.783333
longitude1 = -12386.783333
longitude1 = -123486.783333
longitude1 = -1234586.783333
longitude1 = 123456789.123456789

//This is because, again, Double has twice the accuracy of Float so it doesn't need to cut your number to fit.


// Boolean

/*
 Swift has a built-in data type that can store whether a value is true or false, called a Bool, short for Boolean. Bools don't have space for "maybe" or "perhaps", only absolutes: true or false. For example:
 */
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false

// Type inference
/*
 As you've learned, there are two ways to tell Swift what type of data a variable holds: assign a value when you create the variable, or use a type annotation. If you have a choice, the first is always preferable because it's clearer. For example:

 var name = "Tim McGraw"
 …is preferred to:

 var name: String
 name = "Tim McGraw"
 This applies to all data types. For example:

 var age = 25
 var longitude = -86.783333
 var nothingInBrain = true
 This technique is called type inference, because Swift can infer what data type should be used for a variable by looking at the type of data you want to put in there. When it comes to numbers like -86.783333, Swift will always infer a Double rather than a Float.

 For the sake of completeness, I should add that it's possible to specify a data type and provide a value at the same time, like this:

 var name: String = "Tim McGraw"
 */

// 3. Operators
/*
 Operators are those little symbols you learned in your very first math classes: + to add, - to subtract, * to multiply, / to divide, = to assign value, and so on. They all exist in Swift, along with a few extras.

 Let's try a few basics – please type this into your playground:
 */
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

//When it comes to strings, + will join them together. For example:

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

/*
One more common operator you’ll see is called #modulus#, and is written using a percent symbol: %. It means “divide the left hand number evenly by the right, and return the remainder.” So, 9 % 3 returns 0 because 3 divides evenly into 9, whereas 10 % 3 returns 1, because 10 divides by 3 three times, with remainder 1.
*/

9 % 3
10 % 3

// Comparison operators
var aa = 1.1
var bb = 2.2
var c = a + b

c > 3
c >= 3
c > 4
c < 4

/*
 That shows off greater than (>), greater than or equal (>=), and less than (<). In the results window you'll see true, true, false, true – these are Booleans, because the answer to each of these statements can only ever be true or false.

If you want to check for equality, you can't use = because it already has a meaning: it's used to give a variable a value. So, Swift has an alternative in the form of ==, meaning "is equal to."
*/

var name3 = "Tim McGraw"
name3 == "Tim McGraw"

/*
 There's one more operator I want to introduce you to, and it's called the "not" operator: !. Yes, it's just an exclamation mark. This makes your statement mean the opposite of what it did. For example:
*/

stayOutTooLate
!stayOutTooLate

//You can also use ! with = to make != or "not equal". For example:
name3 != "Tim McGraw"


// 4. String interpolation - combining variables and constants inside a string.

var name4 = "Tim McGraw"

"Your name is \(name4)"
"Your name is " + name4

var age = 25
var latitude = 36.166667

"Your name is \(name), your age is \(age), and your latitude is \(latitude)"

/*
 Doing that using + is much more difficult, because Swift doesn't let you add integers and doubles to a string.
 */

/*
 One of the powerful features of string interpolation is that everything between \( and ) can actually be a full Swift expression. For example, you can do mathematics in there using operators, like this:
 */
"You are \(age) years old. In another \(age) years you will be \(age * 2)."



// 5. Arrays

/*
 Arrays let you group lots of values together into a single collection, then access those values by their position in the collection. Swift uses type inference to figure out what type of data your array holds, like so:
 */
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

/*
 When it comes to reading items out an array, there's a catch: Swift starts counting at 0. This means the first item is 0, the second item is 1, the third is 2, and so on. Try putting this into your playground:
 */
songs[0]
songs[1]
songs[2]
//songs[4] Fatal error: Index out of range
type(of: songs)

var songs1 = ["Shake it Off", "You Belong with Me", "Back to December", 5] as [Any] //Heterogeneous collection literal could only be inferred to '[Any]'; add explicit type annotation if this is intentional Insert ' as [Any]'

var songs2: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
type(of: songs1)
type(of: songs2)

// Creating arrays

/*
 If you make an array using the syntax shown above, Swift creates the array and fills it with the values we specified. Things aren't quite so straightforward if you want to create the array then fill it later – this syntax doesn't work:
 
 */
var songs3: [String]
// songs3[0] = "Shake it Off" - Variable 'songs3' passed by reference before being initialized
/*
 The reason is one that will seem needlessly pedantic at first, but has deep underlying performance implications so I'm afraid you're just stuck with it. Put simply, writing var songs: [String] tells Swift "the songs variable will hold an array of strings," but it doesn't actually create that array. It doesn't allocate any RAM, or do any of the work to actually create a Swift array. It just says that at some point there will be an array, and it will hold strings.
 */

/*
There are a few ways to express this correctly, and the one that probably makes most sense at this time is this:
 */
var songs4: [String] = []
/*
 That uses a type annotation to make it clear we want an array of strings, and it assigns an empty array (that's the [] part) to it.
 */

/*
 You'll also commonly see this construct:
 */
var songs5 = [String]()
/*
 That means the same thing: the () tells Swift we want to create the array in question, which is then assigned to songs using type inference. This option is two characters shorter, so it's no surprise programmers prefer it!
 */

// Array operators

/*
 You can use a limited set of operators on arrays. For example, you can merge two arrays by using the + operator, like this:
 */
var songs6 = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs7 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var bothSongs = songs6 + songs7
/*
 You can also use += to add and assign, like this:
 */
bothSongs += ["Everything has Changed"]


// 6. Dictionaries

/*
 Dictionaries are another common type of collection, but they differ from arrays because they let you access values based on a key you specify.
 */
/*
 To give you an example, let's imagine how we might store data about a person in an array:
 */
var person1 = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
/*
 To read out that person's middle name, we'd use person[1], and to read out the month they were born we'd use person[3]. This has a few problems, not least that it's difficult to remember what index number is assigned to each value in the array! And what happens if the person has no middle name? Chances are all the other values would move down one place, causing chaos in your code.
 */

/*
 With dictionaries we can re-write this to be far more sensible, because rather than arbitrary numbers you get to read and write values using a key you specify. For example:
 */
var person = ["first": "Taylor", "middle": "Alison", "last": "Swift", "month": "December", "website": "taylorswift.com"]
person["middle"]
person["month"]

var person2 = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person2["middle"]
person2["month"]

/*
 As you can see, when you make a dictionary you write its key, then a colon, then its value. You can then read any value from the dictionary just by knowing its key, which is much easier to work with.

 As with arrays, you can store a wide variety of values inside dictionaries, although the keys are most commonly strings.
 */


// 7. Conditional statements
var action: String
var person3 = "hater"

if person3 == "hater" {
    action = "hate"
} else if person3 == "player" {
    action = "play"
} else {
    action = "cruise"
}

// Evaluating multiple conditions
var action1: String
var stayOutTooLate1 = true
var nothingInBrain1 = true

if stayOutTooLate1 && nothingInBrain1 {
    action1 = "cruise"
}

// Looking for the opposite of truth
if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}


// 8. Loops
/*
 Computers are great at doing boring tasks billions of times in the time it took you to read this sentence. When it comes to repeating tasks in code, you can either copy and paste your code multiple times, or you can use loops – simple programming constructs that repeat a block of code for as long as a condition is true.

 To demonstrate this, I want to introduce you to a special debugging function called print(): you give it some text to print, and it will print it. If you're running in a playground like we are, you'll see your text appear in the results window. If you're running a real app in Xcode, you'll see your text appear in Xcode's log window. Either way, print() is a great way to get a sneak peek at the contents of a variable.

 Take a look at this code:
 */
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

/*
 When it has finished running, you'll have the 10 times table in your playground results pane. But it's hardly efficient code, and in fact a much cleaner way is to loop over a range of numbers using what's called the closed range operator, which is three periods in a row: ...

 Using the closed range operator, we could re-write that whole thing in three lines:
 */

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}
/*
 If you don't need to know what number you're on, you can use an underscore instead. For example, we could print some Taylor Swift lyrics like this:
 */
var string = "Fakers gonna"

for _ in 1 ... 5 {
    string += " fake"
}

print(string)

/*
 If Swift doesn’t have to assign each number to a variable each time the loop goes around, it can run your code a little faster. As a result, if you write for i in… then don’t use i, Xcode will suggest you change it to _.
 */
/*
 There's a variant of the closed range operator called the half open range operator, and they are easily confused. The half open range operator looks like ..< and counts from one number up to and excluding another. For example, 1 ..< 5 will count 1, 2, 3, 4.
 */

// Looping over arrays
/*
 Swift provides a very simple way to loop over all the elements in an array. Because Swift already knows what kind of data your array holds, it will go through every element in the array, assign it to a constant you name, then run a block of your code. For example, we could print out a list of great songs like this:
 */
var greatSongs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in greatSongs {
    print("My favorite song is \(song)")
}

/*
 You can also use the for i in loop construct to loop through arrays, because you can use that constant to index into an array. We could even use it to index into two arrays, like this:
 */
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ... 3 {
    print("\(people[i]) gonna \(actions[i])")
}
/*
 You might wonder what use the half open range operator has, but it's particularly useful for working with arrays because they count from zero. So, rather than counting from 0 up to and including 3, we could count from 0 up to and excluding the number of items in an array.

 Remember: they count from zero, so if they have 4 items the maximum index is 3, which is why we need to use excluding for the loop.

 To count how many items are in an array, use someArray.count. So, we could rewrite our code like this:
 */
//var people = ["players", "haters", "heart-breakers", "fakers"]
//var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    print("\(people[i]) gonna \(actions[i])")
}


// Inner loops

/*
 You can put loops inside loops if you want, and even loops inside loops inside loops – although you might suddenly find you're doing something 10 million times, so be careful!

 We can combine two of our previous loops to create this:
 */
for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}
/*
 One important note: although programmers conventionally use i, j and even k for loop constants, you can name them whatever you please: for personNumber in 0 ..< people.count is perfectly valid.
 */

// While loops
/*
 There's a third kind of loop you'll see, which repeats a block of code until you tell it to stop. This is used for things like game loops where you have no idea in advance how long the game will last – you just keep repeating "check for touches, animate robots, draw screen, check for touches…" and so on, until eventually the user taps a button to exit the game and go back to the main menu.

 These loops are called while loops, and they look like this:
 */
var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

/*
 That code introduces a new keyword, called break. It's used to exit a while or for loop at a point you decide. Without it, the code above would never end because the condition to check is just "true", and true is always true. Without that break statement the loop is an infinite loop, which is A Bad Thing.
 
 These while loops work best when you're using unknown data, such as downloading things from the internet, reading from a file such as XML, looking through user input, and so on. This is because you only know when to stop the loop after you've run it a sufficient number of times.
 */
/*
 There is a counterpart to break called continue. Whereas breaking out of a loop stops execution immediately and continues directly after the loop, continuing a loop only exits the current iteration of the loop – it will jump back to the top of the loop and pick up from there.
 */
for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}
/*
 That loops through three Taylor Swift songs, but it will only print the name of two. The reason for this is the continue keyword: when the loop tries to use the song "You Belong with Me", continue gets called, which means the loop immediately jumps back to the start – the print() call is never made, and instead the loop continues straight on to “Look What You Made Me Do”.
*/


// 9. Switch case
/*
 You've seen if statements and now loops, but Swift has another type of flow control called switch/case. It's easiest to think of this as being an advanced form of if, because you can have lots of matches and Swift will execute the right one.

 In the most basic form of a switch/case you tell Swift what variable you want to check, then provide a list of possible cases for that variable. Swift will find the first case that matches your variable, then run its block of code. When that block finishes, Swift exits the whole switch/case block.
 */

let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}
/*
 We could very well have written that using lots of if and else if blocks, but this way is clearer and that's important.

 One advantage to switch/case is that Swift will ensure your cases are exhaustive. That is, if there's the possibility of your variable having a value you don't check for, Xcode will refuse to build your app.
 */
let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}
/*
 One thing you should know is that switch/case blocks in Swift don't fall through like they do in some other languages you might have seen. If you're used to writing break in your case blocks, you should know this isn't needed in Swift.

 Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite. Of course, if you have no idea what any of this means, that's even better: don't worry about it!
 */

outer: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("Product is \(product)")
        break outer
    }
}
