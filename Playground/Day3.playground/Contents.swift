// 100 Days of Swift
// Day 2.

import UIKit

var str = "Hello, playground"


// Operators and conditions


// 1. Arithmetic operators

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore


// Why can’t Swift add a Double to an Int?

/*
Swift has a number of ways of storing data, such as strings, Booleans, and arrays. But when it comes to working with numbers, it has several very specific types, including Double, Float, and Int – there are many more than those, but they are the most commonly used.
*/

/*
 The problem is that although Double uses the same amount of memory to store its value as Int, the way it stores its data is a little fuzzy – it has really great precision with smaller numbers, but increasingly fuzzy precision when you start working with large numbers. In fact, there are certain numbers that Double isn’t even able to hold, so instead it stores a very slightly different value.
 */

let value: Double = 90000000000000001

/*
 When you build that, Swift shows a warning: '90000000000000001' is not exactly representable as 'Double'; it becomes '90000000000000000’.
 */

/*
 Integers lose the ability to store fractional values, but they gain the ability to store precise values. This means the following code won’t produce a warning, because the number can be stored exactly:
 */
let value1: Int = 90000000000000001

/*
 So, it isn’t safe to add a Double to an Int because we lose any numbers after the decimal point, and it isn’t safe to add an Int to a Double because we lose some accuracy.
 
 Swift will refuse to automatically convert between its various numeric types – you can’t add an Int and a Double, you can’t multiply a Float and an Int, and so on.
 */

// Why does Swift have a dedicated division remainder operator?

/*
 Swift has an operator allows us to calculate the remainder after a division. This is sometimes called modulo, but if you wanted to be really specific it isn’t quite the same thing.

 First, let’s look at why it’s useful. If I said to you that there were 465 days until a special event, how would you show that value to a user in a more useful way?

 You might start with code like this:
 */

let weeks = 465 / 7
print("There are \(weeks) weeks until the event.")

/*
Your second attempt might tell Swift to use a Double rather than an Int, so we get a more accurate answer:
*/

let weeks1: Double = 465 / 7
print("There are \(weeks1) weeks until the event.")

/*
 This is where the remainder operator comes in:
 */

let weeks3 = 465 / 7
let days = 465 % 7
print("There are \(weeks3) weeks and \(days) days until the event.")

/*
 Tip: If your goal is to ask “does this number divide equally into some other number?” then Swift has an easier approach:
 */
let number = 465
let isMultiple = number.isMultiple(of: 7)


// Operator overloading

/*
 Swift supports operator overloading, which is a fancy way of saying that what an operator does depends on the values you use it with. For example, + sums integers like this:
 */

let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// Why does Swift need operator overloading?

/*
 Operator overloading allows the same operator – +, *, /, and so on – to do different things depending on what data you use it with. This allows us to use these symbols in various places where they would make sense: we can add two integers using +, we can append one string to another using +, we can join two arrays using +, and so on.

 Of course, this doesn’t mean we can use all the operators in every place: we can subtract one integer from another, but what would it mean to subtract one string from another? Would it subtract from the start or the end? Would it subtract all instances of the string or just one?

 When your skills grow you’ll find you can create your own custom operators if you want to, and even modify Swift’s existing operators.
 */


// Compound assignment operators - Операторы составного присваивания

/*
 Swift has shorthand operators that combine one operator with an assignment, so you can change a variable in place. These look like the existing operators you know – +, -, *, and /, but they have an = on the end because they assign the result back to whatever variable you were using.

 For example, if someone scored 95 in an exam but needs to be penalized 5 points, you could write this:
 */
var score = 9001
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Why does Swift have compound assignment operators?

/*
 If you want to add 5 to a score variable, you’re perfectly able to write score = score + 5 if you want. Swift also allows us to write score += 5 to get the same result, but why?

 Well, it isn’t for performance reasons – under the hood, Swift turns score += 5 into score = score + 5 just as if we had written it.

 Instead, they are just available as a shorthand: a simpler way to write the same thing. This means less typing for us, less code to read, and also less chance of making mistakes – a win all around!
 */

// Comparison operators

let firstScore1 = 6
let secondScore1 = 4

/*
 There are two operators that check for equality: == checks two values are the same, and != (pronounced “not equals”) checks two values are not the same:
 */

firstScore == secondScore
firstScore != secondScore

/*
 There are four operators for comparing whether one value is greater than, less than, or equal to another. These are just like in mathematics:
 */

firstScore < secondScore
firstScore >= secondScore

/*
Each of these also work with strings, because strings have a natural alphabetical order:
*/
"Taylor" <= "Swift"

// How does Swift let us compare many types of data?

/*
 Swift lets us compare many kinds of values out of the box, which means we can check a variety of values for equality and comparison. For example, if we had values such as these:
 */

let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

/*
 Behind the scenes, Swift implements this in a remarkably clever way that actually allows it to compare a wide variety of things. For example, Swift has a special type for storing dates called Date, and you can compare dates using the same operators: someDate < someOtherDate, for example.

 From Swift 5.3 and later, we can even ask Swift to make our enums comparable, like this:
 */

/*
@available(swift 5.3)
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second)


 That will print “true”, because Swift small comes before large in the enum case list.
 */


// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// What’s the difference between if and else if?

score = 9001
if score > 9000 {
    print("It's over 9000!")
} else if score == 9000 {
    print("It's exactly 9000!")
} else {
    print("It's not over 9000!")
}

/*
 You can have as many else if checks as you want, but you need exactly one if and either zero or one else.
 */


// Combining conditions

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

// How to check multiple conditions

/*
 any time you mix && and || in a single condition you should almost certainly use parentheses to make the result clear.
 
 || = pipe pipe
 */



// The ternary operator

//let firstCard = 11
//let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}

// When should you use the ternary operator in Swift?

/*
 The ternary operator lets us choose from one of two results based on a condition, and does so in a really concise way:

 let isAuthenticated = true
 print(isAuthenticated ? "Welcome!" : "Who are you?")
 Some people rely very heavily on the ternary operator because it makes for very short code, whereas some stay away from it as much as possible because it can make code harder to read.

 I’m very much in the “avoid where possible” camp because even though this code is longer I do find it easier to follow:

 if isAuthenticated {
     print("Welcome")
 } else {
     print("Who are you?")
 }
 Now, there is one time when the ternary operator gets a lot of use and that’s with SwiftUI. I don’t want to give code examples here because it can be a bit overwhelming, but you can really go to town with the ternary operator there if you want to. Even then, I prefer to remove them when possible, to make my code easier to read, but you should try it for yourself and come to your own conclusions.
 */


// 8. Switch statements

/*
 f you have several conditions using if and else if, it’s often clearer to use a different construct known as switch case. Using this approach you write your condition once, then list all possible outcomes and what should happen for each of them.

 To try this out, here’s a weather constant containing the string sunny:
 */

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

// When should you use switch statements rather than if?

/*
 Swift developers can use both switch and if to check multiple values in their code, and often there isn’t a hard reason why you should choose one rather than the other. That being said, there are three reasons why you might want to consider using switch rather than if:

 Swift requires that its switch statements are exhaustive, which means you must either have a case block for every possible value to check (e.g. all cases of an enum) or you must have a default case. This isn’t true for if and else if, so you might accidentally miss a case.
 When you use switch to check a value for multiple possible results, that value will only be read once, whereas if you use if it will be read multiple times. This becomes more important when you start using function calls, because some of these can be slow.
 Swift’s switch cases allow for advanced pattern matching that is unwieldy with if.
 There’s one more situation, but it’s a little fuzzier: broadly speaking, if you want to check the same value for three or more possible states, you’ll find folks prefer to use switch rather than if for legibility purposes if nothing else – it becomes clearer that we’re checking the same value repeatedly, rather than writing different conditions.
 */


// 9. Range operators

/*
 Swift gives us two ways of making ranges: the ..< and ... operators. The half-open range operator, ..<, creates ranges up to but excluding the final value, and the closed range operator, ..., creates ranges up to and including the final value.

 For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.

 Ranges are helpful with switch blocks, because you can use them for each of your cases. For example, if someone sat an exam we could print different messages depending on their score:
 */

score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}

//Why does Swift have two range operators?

/*
 To make the distinction easier when talking, Swift regularly uses very specific language: “1 to 5” means 1, 2, 3, and 4, but “1 through 5” means 1, 2, 3, 4, and 5. If you remember, Swift’s arrays start at index 0, which means an array containing three items have items at indexes 0, 1, and 2 – a perfect use case for the half-open range operator.
 */

let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[0])

print(names[1...3])

/*
 That carries a small risk, though: if our array didn’t contain at least four items then 1...3 would fail. Fortunately, we can use a one-sided range to say “give me 1 to the end of the array”, like this:
 */

print(names[1...])

// If you’d like to keep learning more about ranges in Swift, you should check out Antoine van der Lee’s article on the topic: https://www.avanderlee.com/swift/ranges-explained/


// 10. Operators and conditions summary

/*
 Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 You can use if, else, and else if to run code based on the result of a condition.
 Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
 */

