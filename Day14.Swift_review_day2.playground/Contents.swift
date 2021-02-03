import UIKit

var str = "Hello, playground"


// Functions

/*
 Functions let you define re-usable pieces of code that perform specific pieces of functionality. Usually functions are able to receive some values to modify the way they work, but it's not required.

 Let's start with a simple function:
 */
func favoriteAlbum() {
    print("My favorite is Fearless")
}

favoriteAlbum()

/*
 That runs the function (or "calls" it), so now you'll see "My favorite is Fearless" printed out.

 As you can see, you define a function by writing func, then your function name, then open and close parentheses, then a block of code marked by open and close braces. You then call that function by writing its name followed by an open and close parentheses.

 Of course, that's a silly example – that function does the same thing no matter what, so there's no point in it existing. But what if we wanted to print a different album each time? In that case, we could tell Swift we want our function to accept a value when it's called, then use that value inside it.

 Let's do that now:
 */

func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

/*
 That tells Swift we want the function to accept one value (called a "parameter"), named "name", that should be a string. We then use string interpolation to write that favorite album name directly into our output message. To call the function now, you’d write this:
 */

favoriteAlbum(name: "Fearless")

/*You might still be wondering what the point is, given that it's still just one line of code. Well, imagine we used that function in 20 different places around a big app, then your head designer comes along and tells you to change the message to "I love Fearless so much – it's my favorite!" Do you really want to find and change all 20 instances in your code? Probably not. With a function you change it once, and everything updates.

You can make your functions accept as many parameters as you want, so let's make it accept a name and a year:
 */

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

/*
 These function parameter names are important, and actually form part of the function itself. Sometimes you’ll see several functions with the same name, e.g. handle(), but with different parameter names to distinguish the different actions.
 */


// External and internal parameter names
/*
 Sometimes you want parameters to be named one way when a function is called, but another way inside the function itself. This means that when you call a function it uses almost natural English, but inside the function the parameters have sensible names. This technique is employed very frequently in Swift, so it’s worth understanding now.

 To demonstrate this, let’s write a function that prints the number of letters in a string. This is available using the count property of strings, so we could write this:
 */
func countLettersInString(string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLettersInString(string: "Hello")

/*
 While that certainly works, it’s a bit wordy. Plus it’s not the kind of thing you would say aloud: “count letters in string string hello”.

 Swift’s solution is to let you specify one name for the parameter when it’s being called, and another inside the method. To use this, just write the parameter name twice – once for external, one for internal.

 For example, we could name the parameter myString when it’s being called, and str inside the method, like this:
 */

func countLettersInString(myString str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString(myString: "Hello")

/*
 You can also specify an underscore, _, as the external parameter name, which tells Swift that it shouldn’t have any external name at all. For example:
 */

func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString("Hello")

/*
 As you can see, that makes the line of code read like an English sentence: “count letters in string hello”.

 While there are many cases when using _ is the right choice, Swift programmers generally prefer to name all their parameters. And think about it: why do we need the word “String” in the function – what else would we want to count letters on?

 So, what you’ll commonly see is external parameter names like “in”, “for”, and “with”, and more meaningful internal names. So, the “Swifty” way of writing this function is like so:
 */

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

/*
 That means you call the function with the parameter name “in”, which would be meaningless inside the function. However, inside the function the same parameter is called “string”, which is more useful. So, the function can be called like this:
 */
countLetters(in: "Hello")

/*
 And that is truly Swifty code: “count letters in hello” reads like natural English, but the code is also clear and concise.
 */


// Return values

/*
 Swift functions can return a value by writing -> then a data type after their parameter list. Once you do this, Swift will ensure that your function will return a value no matter what, so again this is you making a promise about what your code does.

 As an example, let's write a function that returns true if an album is one of Taylor Swift's, or false otherwise. This needs to accept one parameter (the name of the album to check) and will return a Boolean. Here's the code:
 */
func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }

    return false
}

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

// Optionals
/*
 Swift is a very safe language, by which I mean it works hard to ensure your code never fails in surprising ways.

 One of the most common ways that code fails is when it tries to use data that is bad or missing. For example, imagine a function like this:
 */
func getHaterStatus() -> String {
    return "Hate"
}

/*
 That function doesn't accept any parameters, and it returns a string: "Hate". But what if today is a particularly sunny day, and those haters don't feel like hating – what then? Well, maybe we want to return nothing: this hater is doing no hating today.

 Now, when it comes to a string you might think an empty string is a great way to communicate nothing, and that might be true sometimes. But how about numbers – is 0 an "empty number"? Or -1?

 Before you start trying to create imaginary rules for yourself, Swift has a solution: optionals. An optional value is one that might have a value or might not. Most people find optionals hard to understand, and that’s OK – I’m going to try explaining it in several ways, so hopefully one will work.

 For now, imagine a survey where you ask someone, “On a scale of 1 to 5 how awesome is Taylor Swift?” – what would someone answer if they had never heard of her? 1 would be unfairly slating her, and 5 would be praising her when they had no idea who Taylor Swift was. The solution is optionals: “I don’t want to provide a number at all.”

 When we used -> String it means "this will definitely return a string," which means this function cannot return no value, and thus can be called safe in the knowledge that you'll always get a value back that you can use as a string. If we wanted to tell Swift that this function might return a value or it might not, we need to use this instead:
 */

func getHaterStatus() -> String? {
    return "Hate"
}

/*
Note the extra question mark: String? means “optional string.” Now, in our case we're still returning “Hate” no matter what, but let's go ahead and modify that function further: if the weather is sunny, the haters have turned over a new leaf and have given up their life of hating, so we want to return no value. In Swift, this "no value" has a special name: nil.

Change the function to this:
*/
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

/*
 That accepts one string parameter (the weather) and returns one string (hating status), but that return value might be there or it might not – it's nil. In this case, it means we might get a string, or we might get nil.

 Now for the important stuff: Swift wants your code to be really safe, and trying to use a nil value is a bad idea. It might crash your code, it might screw up your app logic, or it might make your user interface show the wrong thing. As a result, when you declare a value as being optional, Swift will make sure you handle it safely.

 Let's try this now: add these lines of code to your playground:
 */

//var status: String
//status = getHaterStatus(weather: "rainy")

/*
The first line creates a string variable, and the second assigns to it the value from getHaterStatus() – and today the weather is rainy, so those haters are hating for sure.

That code will not run, because we said that status is of type String, which requires a value, but getHaterStatus() might not provide one because it returns an optional string. That is, we said there would definitely be a string in status, but getHaterStatus() might return nothing at all. Swift simply will not let you make this mistake, which is extremely helpful because it effectively stops dead a whole class of common bugs.

To fix the problem, we need to make the status variable a String?, or just remove the type annotation entirely and let Swift use type inference. The first option looks like this:
*/

var status: String?
status = getHaterStatus(weather: "rainy")

//And the second like this:

//var status = getHaterStatus(weather: "rainy")

/*
 Regardless of which you choose, that value might be there or might not, and by default Swift won't let you use it dangerously. As an example, imagine a function like this:
 */

func takeHaterAction(status: String?) {
    if status == "Hate" {
        print("Hating")
    }
}

//takeHaterAction(status: status)

/*
 That takes a string and prints a message depending on its contents. This function takes a String value, and not a String? value – you can't pass in an optional here, it wants a real string, which means we can't call it using the status variable.

 Swift has two solutions. Both are used, but one is definitely preferred over the other. The first solution is called optional unwrapping, and it's done inside a conditional statement using special syntax. It does two things at the same time: checks whether an optional has a value, and if so unwraps it into a non-optional type then runs a code block.

 The syntax looks like this:
 */
if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
} else {
    // in case you want an else block, here you go…
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

/*
 If you understand this concept, you're welcome to skip down to the title that says "Force unwrapping optionals". If you're still not quite sure about optionals, carry on reading.

 OK, if you're still here it means the explanation above either made no sense, or you sort of understood but could probably use some clarification. Optionals are used extensively in Swift, so you really do need to understand them. I'm going to try explaining again, in a different way, and hopefully that will help!

 Here's a new function:
 */

//func yearAlbumReleased(name: String) -> Int {
//    if name == "Taylor Swift" { return 2006 }
//    if name == "Fearless" { return 2008 }
//    if name == "Speak Now" { return 2010 }
//    if name == "Red" { return 2012 }
//    if name == "1989" { return 2014 }
//
//    return 0
//}

/*
 That takes the name of a Taylor Swift album, and returns the year it was released. But if we call it with the album name "Lantern" because we mixed up Taylor Swift with Hudson Mohawke (an easy mistake to make, right?) then it returns 0 because it's not one of Taylor's albums.

 But does 0 make sense here? Sure, if the album was released back in 0 AD when Caesar Augustus was emperor of Rome, 0 might make sense, but here it's just confusing – people need to know ahead of time that 0 means "not recognized."

 A much better idea is to re-write that function so that it either returns an integer (when a year was found) or nil (when nothing was found), which is easy thanks to optionals. Here's the new function:
 */
//func yearAlbumReleased(name: String) -> Int? {
//    if name == "Taylor Swift" { return 2006 }
//    if name == "Fearless" { return 2008 }
//    if name == "Speak Now" { return 2010 }
//    if name == "Red" { return 2012 }
//    if name == "1989" { return 2014 }
//
//    return nil
//}


// Force unwrapping optionals
/*
 Swift lets you override its safety by using the exclamation mark character: !. If you know that an optional definitely has a value, you can force unwrap it by placing this exclamation mark after it.

 Please be careful, though: if you try this on a variable that does not have a value, your code will crash.

 To put together a working example, here's some foundation code:
 */

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }

    return nil
}

var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

/*
 That gets the year an album was released. If the album couldn't be found, year will be set to nil, and an error message will be printed. Otherwise, the year will be printed.

 Or will it? Well, yearAlbumReleased() returns an optional integer, and this code doesn't use if let to unwrap that optional. As a result, it will print out the following: "It was released in Optional(2012)" – probably not what we wanted!

 At this point in the code, we have already checked that we have a valid value, so it's a bit pointless to have another if let in there to safely unwrap the optional. So, Swift provides a solution – change the second print() call to this:

 print("It was released in \(year!)")
 
 Note the exclamation mark: it means "I'm certain this contains a value, so force unwrap it now."
 */

//Implicitly unwrapped optionals
/*
 You can also use this exclamation mark syntax to create implicitly unwrapped optionals, which is where some people really start to get confused. So, please read this carefully!

 A regular variable must contain a value. Example: String must contain a string, even if that string is empty, i.e. "". It cannot be nil.
 An optional variable might contain a value, or might not. It must be unwrapped before it is used. Example: String? might contain a string, or it might contain nil. The only way to find out is to unwrap it.
 An implicitly unwrapped optional might contain a value, or might not. But it does not need to be unwrapped before it is used. Swift won't check for you, so you need to be extra careful. Example: String! might contain a string, or it might contain nil – and it's down to you to use it appropriately. It’s like a regular optional, but Swift lets you access the value directly without the unwrapping safety. If you try to do it, it means you know there’s a value there – but if you’re wrong your app will crash.
 The main times you're going to meet implicitly unwrapped optionals is when you're working with user interface elements in UIKit on iOS or AppKit on macOS. These need to be declared up front, but you can't use them until they have been created – and Apple likes to create user interface elements at the last possible moment to avoid any unnecessary work. Having to continually unwrap values you definitely know will be there is annoying, so these are made implicitly unwrapped.

 Don't worry if you find implicitly unwrapped optionals a bit hard to grasp - it will become clear as you work with the language.
 */


//
