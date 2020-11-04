// 100 Days of Swift
// Day 6-7. Closures


import UIKit

var str = "Hello, playground"

// C L O S U R E S, part one

/*
 Brace yourself, because today we’re covering the first thing in Swift that many people have hard time understanding. Please keep in mind Flip Wilson's law: “you can't expect to hit the jackpot if you don't put a few nickels in the machine.”
 */

// 1. Creating basic closures

/*
 Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

 Functions used in this way are called closures, and although they work like functions they are written a little differently.

 Let’s start with a simple example that prints a message:
 */
let driving = {
    print("I'm driving in my car")
}

driving()

// Замыкания
/*
 Замыкания - это самодостаточные блоки с определенным функционалом, которые могут быть переданы и использованы в вашем коде. Замыкания в Swift похожи на блоки в C и Objective-C, и лямбды в других языках программирования.
 Замыкания могут захватывать и хранить ссылки на любые константы и переменные из контекста, в котором они объявлены. Эта процедура известна как заключение этих констант и переменных, отсюда и название "замыкание". Swift выполняет всю работу с управлением памятью при захвате за вас.
 
 Глобальные и вложенные функции, которые были представлены в главе Функции, являются частным случаем замыканий. Замыкания принимают одну из трех форм:
 Глобальные функции являются замыканиями, у которых есть имя и которые не захватывают никакие значения.
 Вложенные функции являются замыканиями, у которых есть имя и которые могут захватывать значения из включающей их функции.
 Выражения замыкания являются безымянными замыканиями, написанные в облегченном синтаксисе, которые могут захватывать значения из их окружающего контекста.
 Выражения замыкания в Swift имеют четкий, ясный, оптимизированный синтаксис в распространенных сценариях. Эти оптимизации включают:
 Вывод типа параметра и возврат типа значения из контекста
 Неявные возвращающиеся значения однострочных замыканий
 Сокращенные имена параметров
 Синтаксис последующих замыканий
 */

// What the heck are closures and why does Swift love them so much?

/*
 So, if you’re sitting here thinking “wow, closures are really hard”, don’t be dismayed – they are hard, and you finding them hard just means your brain is operating correctly.
 */

/*
 One of the most common reasons for closures in Swift is to store functionality – to be able to say “here’s some work I want you to do at some point, but not necessarily now.” Some examples:

 Running some code after a delay.
 Running some code after an animation has finished.
 Running some code when a download has finished.
 Running some code when a user has selected an option from your menu.
 */

/*
 Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.

 When you’re learning, closures are a little hard to read – particularly when they accept and/or return their own parameters. But that’s OK: take small steps, and backtrack if you get stuck, and you’ll be fine.
 */


// 2. Accepting parameters in a closure

/*
 When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.
 
 To make a closure accept parameters, list them inside parentheses just after the opening brace, then write "in" so that Swift knows the main body of the closure is starting.
 
 For example, we could make a closure that accepts a place name string as its only parameter like this:
 */

let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}

/*
 One of the differences between functions and closures is that you don’t use parameter labels when running closures. So, to call driving() now we’d write this:
 */

driving1("London")

// Why are Swift’s closure parameters inside the braces?

/*
 Both closures and functions can take parameters, but the way they take parameters is very different. Here’s a function that accepts a string and an integer:
 */
func pay(user: String, amount: Int) {
    // code
}

/*
 And here’s exactly the same thing written as a closure:
 */
let payment = { (user: String, amount: Int) in
    // code
}

/*
 As you can see, the parameters have moved inside the braces, and the "in" keyword is there to mark the end of the parameter list and the start of the closure’s body itself.

 Closures take their parameters inside the brace to avoid confusing Swift: if we had written let payment = (user: String, amount: Int) then it would look like we were trying to create a tuple, not a closure, which would be strange.

 If you think about it, having the parameters inside the braces also neatly captures the way that whole thing is one block of data stored inside the variable – the parameter list and the closure body are all part of the same lump of code, and stored in our variable.

 Having the parameter list inside the braces shows why the in keyword is so important – without that it’s hard for Swift to know where your closure body actually starts, because there’s no second set of braces.
 */

// 3. Returning values from a closure

/*
 Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword.

 To demonstrate this, we’re going to take our driving() closure and make it return its value rather than print it directly. Here’s the original:
 let driving = { (place: String) in
     print("I'm going to \(place) in my car")
 }
 */

/*
 We want a closure that returns a string rather than printing the message directly, so we need to use -> String before in, then use return just like a normal function:
 */
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// How do you return a value from a closure that takes no parameters?

/*
 Closures in Swift have a distinct syntax that really separates them from simple functions, and one place that can cause confusion is how we accept and return parameters.
*/

/*
 First, here’s a closure that accepts one parameter and returns nothing:
 */
let payment1 = { (user: String) in
    print("Paying \(user)…")
}

/*
 Now here’s a closure that accepts one parameter and returns a Boolean:
 */

let payment2 = { (user: String) -> Bool in
    print("Paying \(user)…")
    return true
}

/*
 If you want to return a value without accepting any parameters, you can’t just write -> Bool in – Swift won’t understand what you mean. Instead, you should use empty parentheses for your parameter list, like this:
 */
let payment3 = { () -> Bool in
    print("Paying an anonymous person…")
    return true
}

/*
 If you think about it, that works just the same as a standard function where’d write func payment() -> Bool
 */


// 4. Closures as parameters

/*
 Because closures can be used just like strings and integers, you can pass them into functions. The syntax for this can hurt your brain at first, so we’re going to take it slow.

 First, here’s our basic driving() closure again
 */

let driving2 = {
    print("I'm driving in my car")
}

/*
 If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.

 So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:
 */

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

/*
 We can now call that using our driving closure, like this:
*/

travel(action: driving2)

// Why would you want to use closures as parameters?

/*
 Swift’s closures can be used just like any other type of data, which means you can pass them into functions, take copies of them, and so on. But when you’re just learning, this feel very much “just because you can, doesn’t mean you should” – it’s hard to see the benefit.

 One of the best examples I can give is the way Siri integrates with apps. Siri is a system service that runs from anywhere on your iOS device, but it’s able to communicate with apps – you can book a ride with Lyft, you can check the weather with Carrot Weather, and so on. Behind the scenes, Siri launches a small part of the app in the background to pass on our voice request, then shows the app’s response as part of the Siri user interface.
 
 Now think about this: what if my app behaves badly, and takes 10 seconds to respond to Siri? Remember, the user doesn’t actually see my app, just Siri, so from their perspective it looks like Siri has completely frozen.
 
 This would be a terrible user experience, so Apple uses closures instead: it launches our app in the background and passes in a closure that we can call when we’re done. Our app then can take as long as it wants to figure out what work needs to be done, and when we’re finished we call the closure to send back data to Siri. Using a closure to send back data rather than returning a value from the function means Siri doesn’t need to wait for the function to complete, so it can keep its user interface interactive – it won’t freeze up.

 Another common example is making network requests. Your average iPhone can do several billion things a second, but connecting to a server in Japan takes half a second or more – it’s almost glacial compared to the speed things happen on your device. So, when we request data from the internet we do so with closures: “please fetch this data, and when you’re done run this closure.” Again, it means we don’t force our user interface to freeze while some slow work is happening.
 */

let helicopterTravel = {
    print("Get to the chopper!")
}
func travel(by travelMeans: () -> Void) {
    print("Let's go on vacation...")
    travelMeans()
}
travel(by: helicopterTravel)


// 5. Trailing closure syntax

/*
 If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

To demonstrate this, here’s our travel() function again. It accepts an action closure so that it can be run between two print() calls:
*/

func travel3(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

/*
 Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:
 */
travel3() {
    print("I'm driving in my car")
}

/*
 In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
*/
travel3 {
    print("I'm driving in my car")
}

// Why does Swift have trailing closure syntax?

/*
 Trailing closure syntax is designed to make Swift code easier to read, although some prefer to avoid it.

 Let’s start with a simple example first. Here’s a function that accepts a Double then a closure full of changes to make:
 */
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation…")
    animations()
}

/*
 (In case you were wondering, that’s a simplified version of a real and very common UIKit function!)

 We can call that function without a trailing closure like this:
 */
animate(duration: 3, animations: {
    print("Fade out the image")
})

/*
 That’s very common. Many people don’t use trailing closures, and that’s OK. But many more Swift developers look at the }) at the end and wince a little – it isn’t pleasant.

 Trailing closures allow us to clean that up, while also removing the animations parameter label. That same function call becomes this:
 */
animate(duration: 3) {
    print("Fade out the image")
}

/*
 Trailing closures work best when their meaning is directly attached to the name of the function – you can see what the closure is doing because the function is called animate().

 If you’re not sure whether to use trailing closures or not, my advice is to start using them everywhere. Once you’ve given them a month or two you’ll have enough usage to look back and decide more clearly, but hopefully you get used to them because they are really common in Swift!
 */


// D A Y 7

// Closures, part two

// 1. Using closures as parameters when they accept parameters
 /*
 This is where closures can start to be read a bit like line noise: a closure you pass into a function can also accept its own parameters.

 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.

 To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string:
 */

func travel4(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

/*
 Now when we call travel() using trailing closure syntax, our closure code is required to accept a string:
 */
travel4 { (place: String) in
    print("I'm going to \(place) in my car")
}

// When would closures with parameters be used as parameters?

/*
 Closures that accept parameters are a little hard to read, but that problem gets worse when the closures themselves are used as parameters – it feels almost like an IQ test just trying to understand what’s going on. However, they are commonly used so it’s worth taking the time to understand the way they look and the way they work – and if you find them a little overwhelming, don’t be afraid to go back a little and review what came before.

 To give you a practical example, imagine you were building a car. The car needs to know what engine it has, what steering wheel it has, how many seats it has, and so on. Sure, the engine could just be a string of information, but really it should be able to actually accelerate or decelerate to a certain speed.

 So, first we might write a closure like this one:
 */
let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

/*
 And now we can create a buildCar() function that accepts any sort of closure for the engine, as long as that closure can be told to accelerate or decelerate to a specific integer value:
 */
func buildCar(name: String, engine: (Int) -> Void) {
    print("I'm getting ready to go.")
    engine(100)
    print("I arrived!")
}


buildCar(name: "MB") { (speed: Int) in
    print("I'm going at \(speed) kph in my car")
}

/*
 Once you become more comfortable with closures, you’ll start to realize the power here is that our closure is effectively a sealed box. Yes, we know that it will print a message that we’re changing speed, but all buildCar() knows is that it takes an integer and returns nothing. We could create a completely different closure to handle flying cars or underwater cars, and buildCar() wouldn’t care because it satisfies the same rules of accepting an integer and returning nothing.
 */
func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

func study(reviseNotes: (String) -> Void) {
    let notes = "Napoleon was a short, dead dude."
    for _ in 1...10 {
        reviseNotes(notes)
    }
}
study { (notes: String) in
    print("I'm reading my notes: \(notes)")
}

// 2. Using closures as parameters when they return values

/*
 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can replace that Void with any type of data to force the closure to return a value.

 To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string and returns a string:
 */

func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

/*
 Now when we call travel() using trailing closure syntax, our closure code is required to accept a string and return a string:
 */
travel2 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// When would you use closures with return values as parameters to a function?

/*
 Swift’s closures can return values as well as take parameters, and you can use those closures in functions. Even better, those functions can also return values, but it’s easy for your brain to get a bit fuzzy here because there’s a lot of syntax.
 
 To demonstrate a common usage for this kind of closures, we’re going to implement a simple "reducer" method. This is a common behavior that is designed to summarize arrays – to take a lot of numbers, or strings, or whatever, and boil them down to a single value.

 In our simplified example, our reducer will accept two parameters: an array of numbers, and a closure that can reduce that array down to a single value. For example, it might accept an array of numbers and add them together, then return the final total. To do that, the closure will accept two parameters: one to track the current value (everything that been reduced so far), and the current value that needs to be added to the reduced value. The closure will also return a value, which is the new reduced value, and the whole function will return the fully reduced value – the total of all numbers, for example.
 
 For example, if we wanted to reduce the array [10, 20, 30], it would work something like this:

 It would create a variable called current with a value set to the first item in its array. This is our starting value.
 It would then start a loop over the items in the array that got passed in, using the range 1... so that it counts from index 1 to the end.
 It would then call the closure with 10 (the current value) and 20 (the second value in the array).
 The closure might be reducing the array using addition, so it would add 10 to 20 and return the sum, 30.
 Our function would then call the closure with 30 (the new current value) and 30 (the third item in the array).
 The closure would add 30 to 30 and return the sum, which is 60.
 Our function would then send back 60 as its return value.
 In code it looks like this:
 */

func reduce(_ values: [Int], using closure: (Int, Int) -> Int) -> Int {
    // start with a total equal to the first value
    var current = values[0]

    // loop over all the values in the array, counting from index 1 onwards
    for value in values[1...] {
        // call our closure with the current value and the array element, assigning its result to our current value
        current = closure(current, value)
    }

    // send back the final current value
    return current
}

/*
 With that code in place, we can now write this so add up an array of numbers:
 */

let numbers = [10, 20, 30]

let sum = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal + next
}

print(sum)

/*
 The great thing here is that reduce() doesn’t care what its closure does – it only cares that it will accept two integers and return one integer. So, we could multiply all the items in our array like this:
 */
let multiplied = reduce(numbers) { (runningTotal: Int, next: Int) in
    runningTotal * next
}

/*
 Although this was just an example to demonstrate why closures with return values make useful functional parameters, I want to mention three more things.
 
 First, our reduce() function uses values[0] for its initial value, but what happens if we call reduce() with an empty array? We get a crash – that’s happens. Clearly that isn’t a good thing, so you wouldn’t want to use this code outside of a learning sandbox.
 
 Second, I mentioned previously that Swift’s operators are actually functions in their own right. For example, + is a function that accepts two numbers (e.g. 5 and 10) and returns another number (15).

 So, + takes two numbers and returns a number. And our reduce() function expects a closure that takes two numbers and returns a number. That’s the same thing! The + function fulfills the same contract as reduce() wants – it takes the same parameters and returns the same value.

 As a result, we can actually write this:
 */
let sum1 = reduce(numbers, using: +)

/*
 Yes, really. Neat, huh?
 
 Third, this reduce() function is so important that a variant actually comes with Swift as standard. The concept is the same, but it’s more advanced in several ways:
 
 - You can specify your own starting value.
 - It will work on arrays of any type, including strings.
 - It handles errors gracefully.
 */

/*
 Even better, it won’t crash when used on an empty array!

 This took quite a bit of explaining, but I hope it’s given you a practical example of why closures that return values can be useful as parameters. As you progress in your skills you’ll learn many more examples – it’s surprisingly common.
 */

func activateAI(_ ai: () -> String) {
    print("Let's see what this thing can do...")
    let result = ai()
    print(result)
}
activateAI {
    return "Come with me if you want to live."
}


// 3. Shorthand parameter names

/*
 We just made a travel() function. It accepts one parameter, which is a closure that itself accepts one parameter and returns a string. That closure is then run between two calls to print().

 Here’s that in code:
 */

func travel5(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
/*
 We can call travel() using something like this:
 */
travel5 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
/*
 However, Swift knows the parameter to that closure must be a string, so we can remove it:
 */
travel5 { place -> String in
    return "I'm going to \(place) in my car"
}

/*
 It also knows the closure must return a string, so we can remove that:
 */
travel5 { place in
    return "I'm going to \(place) in my car"
}

/*
 As the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too:
 */

travel5 { place in
    "I'm going to \(place) in my car"
}

/*
 Swift has a shorthand syntax that lets you go even shorter. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0.
 */
travel5 {
    "I'm going to \($0) in my car"
}

// When should you use shorthand parameter names?

/*
 When working with closures, Swift gives us a special shorthand parameter syntax that makes it extremely consider to write closures. This syntax automatically numbers parameter names as $0, $1, $2, and so on – we can’t use names such as these in our own code, so when you see them it’s immediately clear these are shorthand syntax for closures.

 As for when you should use them it’s really a big “it depends”:
 
 Are there many parameters? If so, shorthand syntax stops being useful and in fact starts being counterproductive – was it $3 or $4 that you need to compare against $0 Give them actual names and their meaning becomes clearer.
 Is the function commonly used? As your Swift skills progress, you’ll start to realize that there are a handful – maybe 10 or so – extremely common functions that use closures, so others reading your code will easily understand what $0 means.
 Are the shorthand names used several times in your method? If you need to refer to $0 more than maybe two or three times, you should probably just give it a real name.
 What matters is that your code is easy to read and easy to understand. Sometimes that means making it short and simple, but not always – choose shorthand syntax on a case by case basis.
 */


// 4. Closures with multiple parameters

/*
 Just to make sure everything is clear, we’re going to write another closure example using two parameters.

 This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter’s type:
 */

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

/*
 We’re going to call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1:
 */
travel {
    "I'm going to \($0) at \($1) miles per hour."
}

/*
 Some people prefer not to use shorthand parameter names like $0 because it can be confusing, and that’s OK – do whatever works best for you.
 */

// How many parameters can a closure take?
/*
 Swift’s closures are like Swift’s functions, so they can take any number of parameters. However, you should exercise your power with restraint: I’ve previously said functions that accept many parameters can be hard to understand, and closures take that same problem further by adding their natural complexity on top.

 So, in theory a closure can take as many parameters as you like, but in practice the overwhelming majority of examples you’ll see take zero to three parameters. This is likely helped by the fact that using $0, $1 and $2 is probably the most shorthand parameter names we can reasonably work with.

 I’m not saying you can’t write closures that take four or more parameters, only that it’s extremely rare – one or two parameters covers the vast majority of cases, with three parameters being most of the remainder.
 */

func playSong(instrumentClosure: (String, Int) -> Void) {
    let song = "Stairway to Heaven"
    let volume = 11
    print("I'm going to play \(song)...")
    instrumentClosure(song, volume)
}

playSong {
    print ("play \($0) at \($1)")
}


// 5. Returning closures from functions

/*
 In the same way that you can pass a closure to a function, you can get closures returned from a function too.

 The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.

 To try this out, we’re going to write a travel() function that accepts no parameters, but returns a closure. The closure that gets returned must be called with a string, and will return nothing.

 Here’s how that looks in Swift:
 */

func travel6() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

/*
 We can now call travel() to get back that closure, then call it as a function:
 */

let result = travel6()
result("London")

/*
 It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
 */

//let result2 = travel6()("London")
//
//result2("Beograd")

// Returning closures from functions

/*
 Functions can return strings, integers, arrays, and more, and because Swift lets us use closures anywhere we can also return closures from functions. But why would you want to do this – is it actually a reasonable thing to want to do?
 
 The most common situation is effectively this: I need a function to call, but I don’t know what that function is. I know how to find out that function – I know who to ask to find the function – but I don’t know myself.
 
 For example, I want to generate lots of random numbers, but I don’t know what algorithm to use. All I know is that if I call makeRandomGenerator() I’ll get back a function I can call that will generate a new random number every time I call it.
 
 This behavior means we don’t need to know what the actual random number generator does, or how it was created. Behind the scenes we might get sent the same closure each time or perhaps a different closure; we don’t care. Without this, we’d need to type the precise name of the function everywhere we wanted to use it.
 */

/*
 That leads to a second benefit: we can change our mind whenever we want, just by changing the function that creates the random number generator. All the places that call the function won’t change, because they still call makeRandomGenerator(). And all the ways they use the returned random number generator won’t change, because it’s just a closure that somehow returns a random number every time it’s called.

 So, if you want to change the generator to a “fair” algorithm – where each number is generated an equal number of times, in a random order – then you just change the returned closure in makeRandomGenerator(). Or if you want to change it to have a Gaussian distribution, which means you get a bell curve where numbers in the middle of your range are returned more commonly than numbers towards the end of your range, then again you just change the returned closure – everywhere you use it remains absolutely unchanged.
 */
/*
 I want to give you a little example of how this looks, because Swift actually comes with a built-in random number generator. It looks like this:
 */
print(Int.random(in: 1...10))

/*
 That will print a number from 1 through 10.

 If we wanted to write a function that returned one random number between 1 and 10, we would write this:
 */
func getRandomNumber()-> Int {
    Int.random(in: 1...10)
}

/*
 That will return a random integer every time it’s called, so we can use it like this:
 */
print(getRandomNumber())

/*
 Now let’s go a step further: we’re going to make a function that returns a closure that, when called, will generate a random number from 1 through 10:
 */
func makeRandomGenerator() -> () -> Int {
    let function = { Int.random(in: 1...10) }
    return function
}

/*
 Notice that our return type is now () -> Int, which means “a closure that takes no parameters and returns an integer.” Then, inside the function, we create a closure that wraps Int.random(in: 1...10) and send back that closure.

 We can now use makeRandomGenerator() like this:
 */
let generator = makeRandomGenerator()
let random1 = generator()
print(random1)

/*Again, the flexibility here is that all our code can call makeRandomGenerator() to be sent back some sort of code that can generate a random number. It doesn’t have to care what it does; we only care that it generates a new number every time it’s called.

If you’re finding closure syntax hard to remember, you’ll be pleased to know there’s a site just for you: http://goshdarnclosuresyntax.com/
 */


// 6. Capturing values

/*
 If you use any external values inside your closure, Swift captures them – stores them alongside the closure, so they can be modified even if they don’t exist any more. - Если вы используете какие-либо внешние значения внутри замыкания, Swift их захватывает - сохраняет вместе с замыканием, поэтому их можно изменить, даже если они больше не существуют.
 */
/*
 Right now we have a travel() function that returns a closure, and the returned closure accepts a string as its only parameter and returns nothing:
 */
func travel7() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result3 = travel7()
result3("London")

/*
 Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called:
*/

func travel8() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
/*
Even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure.

So, if we call result("London") multiple times, the counter will go up and up:
*/
let result4 = travel8()

result4("London")
result4("London")
result4("London")

// Why do Swift’s closures capture values?

/*
 One of the most important features of Swift’s closures is that they capture values they use. At the same time, one of the most confusing features of Swift is that they capture values they use. Put simply, value capturing takes place so that your closure always has access to the data it needs to work, which means Swift can run the closure safely.
 */
/*
 As an example, let’s try writing a function that generates random numbers, but with a twist: it won’t return the same number twice in a row.
 */
/*
 The logic for this is fairly simple:

 We’ll start with an initial value of 0, stored in previousValue.
 We’ll then create a new variable called newNumber to store a new random number.
 We’ll use a repeat loop with Int.random(in: 1...3).
 The condition for that loop will be newNumber == previousNumber – keep the loop going around picking new numbers as long as the new random number is the same as the previous random number.
 Once the loop finishes it means our number is definitely different from the previous one, so we update previousValue to be newValue, then send it back. Remember, this should be sent back as a closure, so we can generate random numbers from wherever we want.

 Here’s how we could write all that:
 */
func makeRandomNumberGenerator() -> () -> Int {
    return {
        var previousNumber = 0
        var newNumber: Int

        repeat {
            newNumber = Int.random(in: 1...3)
        } while newNumber == previousNumber

        previousNumber = newNumber
        return newNumber
    }
}
/*
 We can now take that code for a test drive like this:
 */

let generator1 = makeRandomNumberGenerator()

for _ in 1...10 {
    print(generator())
}
/*
 Give it a try! Chances are you’ll see things didn’t quite go to plan – I got numbers repeated several times, e.g. 1, 2, 1, 1, 3, 1, 3, 3, 3, 2.

 That wasn’t what we wanted; we wanted no repeating numbers, so what happened?

 The problem is here:

 return {
     var previousNumber = 0
     var newNumber: Int
 That returns the closure we’re calling, which means every time we call generator() it creates a new previousNumber variable set to 0 – it isn’t storing the previous value at all.

 Now I want you to move that var previousNumber = 0 line so it comes before the return, like this:

 var previousNumber = 0

 return {
     var newNumber: Int
 If you run the code now, you’ll see it works just as we hoped – we get a new random value each time, but won’t get any repeats.
 */

/*
 What you’re seeing here is the power of closure capturing: that previousNumber variable isn’t inside the closure, but because the closure requires it to exist in order to run it will be captured. That is, Swift will make sure it stays in existence even after makeRandomNumberGenerator() has finished running and it would normally have been destroyed.

 This matters for two reasons:

 If the variable had been destroyed, then our closure wouldn’t be able to work any more. It tries to read and write previousNumber, so Swift’s keeping it alive ensures the closure functions as intended.
 Although the variable is used by the closure, it’s created outside the closure. This means it only gets set to 0 once, rather than every time the closure is run, which is why it now stores the previous value correctly.
 So, this is a real example of why closuring capturing matters: having an external value makes sure we can track some state outside a closure while using it inside.
 */

/*
 Closure capturing is a complicated topic, but if you’d like to read even more about it then check out Olivier Halligon’s post: https://alisoftware.github.io/swift/closures/2016/07/25/closure-capture-1/
 */


// 7. Closures summary
/*
 You can assign closures to variables, then call them later on.
 Closures can accept parameters and return values, like regular functions.
 You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
 If the last parameter to your function is a closure, you can use trailing closure syntax.
 Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
 If you use external values inside your closures, they will be captured so the closure can refer to them later.
 */
