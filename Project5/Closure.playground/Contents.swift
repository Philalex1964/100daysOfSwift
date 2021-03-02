import UIKit

var str = "Hello, playground"

class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

func sing() -> () -> Void {
    let taylor = Singer()
    
    let singing = { [weak taylor] in
        taylor?.playSong()
        return
    }
    return singing
}

let singFunction = sing()
singFunction()
print("Shake off!")

/* Capture lists alongside parameters
writeToLog { [weak self] user, message in
    self?.addToLog("\(user) triggered event: \(message)")
}
*/

class House {
    var ownerDetails: (() -> Void)?

    func printDetails() {
        print("This is a great house.")
    }

    deinit {
        print("I'm being demolished!")
    }
}

class Owner {
    var houseDetails: (() -> Void)?

    func printDetails() {
        print("I own a house.")
    }

    deinit {
        print("I'm dying!")
    }
}

print("Creating a house and an owner")

do {
    let house = House()
    let owner = Owner()
// let’s create a strong reference cycle
//    house.ownerDetails = owner.printDetails
//    owner.houseDetails = house.printDetails
    house.ownerDetails = { [weak owner] in owner?.printDetails() }
    owner.houseDetails = house.printDetails
}
print("Done")


func sing1() -> () -> Void {
    let taylor = Singer()
    let adele = Singer()

    let singing = { [unowned taylor, adele] in
        taylor.playSong()
        adele.playSong()
        return
    }

    return singing
}

//Now, if you want taylor to be unowned but adele to be strongly captured, that’s fine. But if you want both to be unowned you need to say so:
//[unowned taylor, unowned adele]

var numberOfLinesLogged = 0

let logger1 = {
    numberOfLinesLogged += 1
    print("Lines logged: \(numberOfLinesLogged)")
}

logger1()

let logger2 = logger1
logger2()
logger1()
logger2()
