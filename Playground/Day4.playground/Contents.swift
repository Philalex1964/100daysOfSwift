// 100 Days of Swift
// Day 4.


import UIKit

var str = "Hello, playground"

// L O O P S

// As Craig Bruce said, “it’s hardware that makes a machine fast, but it’s software that makes a fast machine slow.”


// 1. For loops

/*
 Swift has a few ways of writing loops, but their underlying mechanism is the same: run some code repeatedly until a condition evaluates as false.

 The most common loop in Swift is a for loop: it will loop over arrays and ranges, and each time the loop goes around it will pull out one item and assign to a constant.

 For example, here’s a range of numbers:
 */

let count = 1...10

for number in count {
    print("Number is \(number)")
}

/*
 We can do the same with arrays:
 */
let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

/*
 If you don’t use the constant that for loops give you, you should use an underscore instead so that Swift doesn’t create needless values:
 */
print("Players gonna ")

for _ in 1...5 {
    print("play")
}

// Why does Swift use underscores with loops?

/*
 If you want to loop over items in an array, you might write code such as this:
 */
let names = ["Sterling", "Cyril", "Lana", "Ray", "Pam"]

for name in names {
    print("\(name) is a secret agent")
}

/*
 However, some times you don’t actually need the value that is currently being read, which is where the underscore comes in: Swift will recognize you don’t actually need the variable, and won’t make the temporary constant for you.
 Of course, Swift can really see that anyway – it can see whether or not you’re using name inside the loop, so it can do the same job without the underscore. However, using an underscore does something very similar for our brain: we can look at the code and immediately see the loop variable isn’t being used, no matter how many lines of code are inside the loop body.

 So, if you don’t use a loop variable inside the body, Swift will warn you to rewrite it like this:
 */
for i in names {
    print("\(i) is a secret agent!")
}


// 2. While loops

/*
 A second way of writing loops is using while: give it a condition to check, and its loop code will go around and around until the condition fails.
 */
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

// When should you use a while loop?

/*
 The main difference is that for loops are generally used with finite sequences: we loop through the numbers 1 through 10, or through the items in an array, for example. On the other hand, while loops can loop until any arbitrary condition becomes false, which allows them until we tell them to stop.

 This means we can repeat the same code until…

 …the user asks us to stop
 …a server tell us to stop
 …we’ve found the answer we’re looking for
 …we’ve generated enough data

 That’s where a while loop comes in handy: we can keep the loop going around until we’re ready to exit.
 */


// 3. Repeat loops

/*
 The third way of writing loops is not commonly used, but it’s so simple to learn we might as well cover it: it’s called the repeat loop, and it’s identical to a while loop except the condition to check comes at the end.

 So, we could rewrite our hide and seek example like this:
 */

// var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

/*
 Because the condition comes at the end of the repeat loop the code inside the loop will always be executed at least once, whereas while loops check their condition before their first run.
 */

/*
 For example, this print() function will never be run, because false is always false:
 */
while false {
    print("This is false")
}

/*
 On the other hand, this print() function will be run once, because repeat only fails the condition after the loop runs:
 */
repeat {
    print("This is false")
} while false

// When should you use a repeat loop?

/*
 The answer is partly something programmers call “DRY”: Don’t Repeat Yourself. We usually prefer to write code once and only once, and consider repeated code to be a sign that something has gone wrong. Some folks take this to an extreme and repeat nothing and that’s usually a bad idea, but here we can definitely avoid repeating ourself with a repeat loop.

 To demonstrate this to you, I want to show you how you can shuffle an array of numbers. Swift gives us shuffled(), which is code we can run on an array that creates a copy of the array array, randomizes the order of the copy’s items, and returns it.

 Now, if we had an array of numbers, we could shuffle it up like this:
 */

let numbers = [1, 2, 3, 4, 5]
var random = numbers.shuffled()

while random == numbers {
    random = numbers.shuffled()
}

repeat {
    random = numbers.shuffled()
} while random != numbers


// 4. Exiting loops
/*
 You can exit a loop at any time using the break keyword. To try this out, let’s start with a regular while loop that counts down for a rocket launch:
 */

var countDown = 10

//while countDown >= 0 {
//    print(countDown)
//    countDown -= 1
//}
//
//print("Blast off!")


while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}


// 5. Exiting multiple loops

/*
 If you put a loop inside a loop it’s called a nested loop, and it’s not uncommon to want to break out of both the inner loop and the outer loop at the same time.

 As an example, we could write some code to calculate the times tables from 1 through 10 like this:
 */

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

/*
 If we wanted to exit part-way through we need to do two things. First, we give the outside loop a LABEL, like this:
 */

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}

/*
 Second, add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time:
 */

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

/*
 With a regular break, only the inner loop would be exited – the outer loop would continue where it left off.
 */

// Why does Swift have labeled statements?
/*
 Swift’s labeled statements allow us to name certain parts of our code, and it’s most commonly used for breaking out of nested loops.

 To demonstrate them, let’s look at an example where we’re trying to figure out the correct combination of movements to unlock a safe. We might start by defining an array of all possible movements:
 */
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

/*
 To find that combination, we need to make arrays containing all possible three-color variables:

 up, up, up
 up, up, down
 up, up, left
 up, up, right
 up, down, left
 up, down, right
 …you get the idea.

 To make that happen, we can write three loops, one nested inside the other, like this:
 */

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


// 6.Skipping items

/*
 As you’ve seen, the break keyword exits a loop. But if you just want to skip the current item and continue on to the next one, you should use continue instead.

 To try this out, we can write a loop from 1 through 10, then use Swift’s remainder operator to skip any numbers that are odd:
 */

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

// When to use break and when to use continue
/*
 Sometimes Swift learners find it hard to understand when the break keyword is correct and when the continue keyword is correct, because they both alter the flow of our loops.

 When we use continue we’re saying “I’m done with the current run of this loop” – Swift will skip the rest of the loop body, and go to the next item in the loop. But when we say break we’re saying “I’m done with this loop altogether, so get out completely.” That means Swift will skip the remainder of the body loop, but also skip any other loop items that were still to come.

 Just like break, you can use continue with labeled statements if you want, but honestly I can’t remember ever seeing it done!
 */

var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal


// 7. Infinite loops

/*
 It’s common to use while loops to make infinite loops: loops that either have no end or only end when you’re ready. All apps on your iPhone use infinite loops, because they start running, then continually watch for events until you choose to quit them.

 To make an infinite loop, just use true as your condition. true is always true, so the loop will repeat forever. Warning: Please make sure you have a check that exits your loop, otherwise it will never end.

 As an example, we’re going to use while true to print the music of John Cage’s piece 4’33” – if you didn’t know, it’s famous because it’s 4 minutes and 33 seconds of complete silence.

 We can write the “music” for this piece using while true, with a condition that exits the loop when we’ve gone around enough times:
 */

var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

// Why would you want to make an infinite loop?

/*
 Infinite loops are program loops that continue effectively forever. In Swift, they look like this:

while true {
    print("I'm alive!")
}

print("I've snuffed it!")
In that code, “I’m alive!” will be printed again and again forever, whereas the “I’ve snuffed it!” message will never be printed – the loop won’t end, so the message won’t be printed. In practice, you’re more likely to have some sort of condition to your loop, like this:

var isAlive = false

while isAlive == true {
    print("I'm alive!")
}

print("I've snuffed it!")
That allows you to end the loop when you’re ready, so they aren’t truly infinite. As a result, programmers will often call these pseudo-infinite loops – they will run for a long time, and perhaps indeed forever in the case of critical systems that never restart, but technically they aren’t truly infinite.

You might wonder why this sort of code is useful, but actually it’s really common. For example, all the apps you use on your iPhone have infinite loops. Think about it: when your app launches it needs to repeat a series of instructions until it’s told to stop:

Check for any user input
Run any code you need
Redraw the screen
Repeat
That might last for 10 seconds if you’re just checking Twitter, but it might last for hours if you’re playing a game – or perhaps it might run for much longer. The point is that we don’t know when the loop will stop, so we can just loop from 1 to a billion.

Instead, they use something like an infinite loop a bit like the one I showed you earlier – the program will continue to run again and again until it’s time to close, at which point the loop can finish and any clean up code can run.
*/


// 8. Looping summary
/*
 Loops let us repeat code until a condition is false.
 The most common loop is for, which assigns each item inside the loop to a temporary constant.
 If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
 There are while loops, which you provide with an explicit condition to check.
 Although they are similar to while loops, repeat loops always run the body of their loop at least once.
 You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
 You can skip items in a loop using continue.
 Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
 */
