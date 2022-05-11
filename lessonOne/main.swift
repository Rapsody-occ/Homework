//
//  main.swift
//  lessonOne
//
//  Created by user on 4/12/22.
//

import Foundation
//
//        6TH HOMEWORK
//
struct Journal {
    var name: String
    var mark: Int
}

extension Journal: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Mark: \(mark)"
    }
}


struct queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    public var head: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("Last element is \(elements.last!)")
            return elements.last
        }
    }
    
    public var front: T? {
        if isEmpty {
            print("The elemnets aren't found. Array is empty.")
            return nil
        } else {
            print("First element is \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var pupil = queue<Journal>()
pupil.enqueue(element: .init(name: "Alice", mark: 4))
pupil.enqueue(element: .init(name: "John", mark: 5))
pupil.enqueue(element: .init(name: "Jessie", mark: 5))
pupil.enqueue(element: .init(name: "Andrea", mark: 3))
pupil.enqueue(element: .init(name: "Alex", mark: 4))
pupil.enqueue(element: .init(name: "Timothi", mark: 3))
pupil.enqueue(element: .init(name: "Sarah", mark: 4))
pupil.enqueue(element: .init(name: "Pamela", mark: 3))

pupil.printMyQueue()
pupil.head
pupil.front

let honoursPupil = pupil.myFilter(predicate: {$0.mark == 5})
print(honoursPupil)
//
//        5TH HOMEWORK
//
enum CarBrand: String {
    case nissan = "Nissan"
    case honda = "Honda"
    case toyota = "Toyota"
    case volkswagen = "Volkswagen"
    case peterbilt = "Peterbilt"
}

enum CarModel: String {
    case z400 = "400Z"
    case civic = "Civic"
    case camry = "Camry"
    case touareg = "Touareg"
    case p330 = "330"
}

enum CarEquipment: String {
    case base = "base"
    case midle = "midle"
    case full = "full"
    case individual = "individual"
}

enum BodyType: String {
    case sedan = "sedan"
    case stationWagon = "station wagon"
    case coupe = "coupe"
    case hatchback = "hatchback"
    case convertible = "convertible"
    case suv = "SUV"
    case van = "van"
    case bus = "bus"
    case truck = "truck"
    case other = "other"
}

enum TransmissionType: String {
    case mt = "manual"
    case at = "automatic"
    case am = "automated manual"
    case cvt = "continuously variable"
}

enum BodyColor: String {
    case white  = "white"
    case black = "black"
    case red = "red"
    case green = "green"
    case yellow = "yellow"
    case blue = "blue"
    case grey = "grey"
    case brown = "brown"
    case orange = "orange"
    case pink = "pink"
    case purple = "purple"
    case violet = "violet"
    case beige = "beige"
    case gold = "gold"
}

enum DoorsLockUnlock: String {
    case lock = "lock"
    case unlock = "unlock"
}

enum EngineState: String {
    case off = "off"
    case on = "on"
}

enum WindowsLockUnlock: String {
    case lock = "lock"
    case unlock = "unlock"
}

enum ConcreteMixerState: String {
    case on = "on"
    case off = "off"
}

enum ConcreteMixerPump: String {
    case on = "on"
    case off = "off"
}

enum ExhaustMode: String {
    case comfort = "comfort"
    case race = "race"
}

enum TransmissionMode: String {
    case comfort = "comfort"
    case sport = "sport"
    case race = "race"
}

enum DoorsState: String {
    case open = "open"
    case close = "close"
}
// 1st  exercise "Create a "Car" protocol and describe the properties common to cars, as well as the action method.".
protocol Car {
    var carBrand: CarBrand { get }
    var carModel: CarModel { get }
    var carPlate: String {get set}
    var manufactureYear: Int { get }
    var bodyType: BodyType { get }
    var transmissionType: TransmissionType { get }
    var bodyColor: BodyColor { get }
    var doorsLockUnlock: DoorsLockUnlock { get set }
    var engineState: EngineState { get set }
    var windowsLockUnlock: WindowsLockUnlock { get set }
    var doorsState: DoorsState { get set }
    
    mutating func doorOpen()
    mutating func doorClose()
}

// 2nd  exercise "Create extensions for the "Car" protocol and implement methods for specific actions with the car in them: open/close a window, start/stop the engine, etc. (one method per action, only those actions should be implemented, the implementation of which is common for all cars).".
extension Car {
    mutating func unlockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .lock:
            self.doorsLockUnlock = .unlock
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the doors are unlocked.")
        case _ where self.doorsLockUnlock == .unlock:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors is already unlocked.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}

extension Car {
    mutating func lockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .unlock:
            doorsLockUnlock = .lock
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the doors are locked.")
        case _ where doorsLockUnlock == .lock:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors is already locked.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}

extension Car {
    mutating func unlockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .lock:
            windowsLockUnlock = .unlock
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the windows are unlocked.")
        case _ where windowsLockUnlock == .unlock:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors is already unlocked.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
}

extension Car {
    mutating func lockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .unlock:
            windowsLockUnlock = .lock
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the windows are locked.")
        case _ where windowsLockUnlock == .lock:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors is already locked.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}

extension Car {
    mutating func engineOn() {
        switch self.engineState {
        case _ where self.engineState == .off:
            engineState = .on
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now engine is on.")
        case _ where engineState == .on:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The engine is already on.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}

extension Car {
    mutating func engineOff() {
        switch self.engineState {
        case _ where self.engineState == .on:
            engineState = .off
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the engine is off.")
        case _ where engineState == .off:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The engine is already off.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}
// 3rd  exercise "Create two classes that implement the "Car" protocol: tunkCar and sportCar. Describe in them the properties that are different for a sports car and a tank car.".
class TunkCar: Car {
    var carBrand: CarBrand
    var carModel: CarModel
    var carPlate: String
    var manufactureYear: Int
    var bodyType: BodyType
    var transmissionType: TransmissionType
    var bodyColor: BodyColor
    var doorsLockUnlock: DoorsLockUnlock
    var engineState: EngineState
    var windowsLockUnlock: WindowsLockUnlock
    var doorsState: DoorsState
    var concreteMixerState: ConcreteMixerState
    var concreteMixerPump: ConcreteMixerPump
    var description: String {
        return "\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
        "Brand: \(carBrand.rawValue)\n" +
        "Model: \(carModel.rawValue)\n" +
        "Manufacture year: \(manufactureYear)\n" +
        "Body type: \(bodyType.rawValue)\n" +
        "Transmission type: \(transmissionType.rawValue)\n" +
        "Body color: \(bodyType.rawValue)\n" +
        "Engine state: \(engineState.rawValue)\n" +
        "Doors lock/unlock: \(doorsLockUnlock.rawValue)\n" +
        "Windows state: \(windowsLockUnlock.rawValue)\n" +
        "Doors open/close: \(doorsState.rawValue)\n" +
        "Concrete mixer state: \(concreteMixerState.rawValue)\n" +
        "Concrete mixer pump: \(concreteMixerPump.rawValue)\n"
    }
    
    init(carBrand: CarBrand, carModel: CarModel, carPlate:String, manufactureYear: Int,
         bodyType: BodyType, transmissionType: TransmissionType, bodyColor: BodyColor,
         engineState: EngineState, doorsLockUnlock: DoorsLockUnlock, windowsLockUnlock: WindowsLockUnlock,
         doorsState: DoorsState, concreteMixerState: ConcreteMixerState,
         concreteMixerPump: ConcreteMixerPump) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carPlate = carPlate
        self.manufactureYear = manufactureYear
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.bodyColor = bodyColor
        self.doorsLockUnlock = doorsLockUnlock
        self.engineState = engineState
        self.windowsLockUnlock = windowsLockUnlock
        self.doorsState = doorsState
        self.concreteMixerState = concreteMixerState
        self.concreteMixerPump = concreteMixerPump
    }
    
    func doorOpen(){
        switch self.doorsState {
        case _ where self.doorsState == .close:
            doorsState = .open
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now doors are open.")
        case _ where doorsState == .open:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors are already open.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func doorClose() {
        switch self.doorsState {
        case _ where self.doorsState == .open:
            doorsState = .close
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now doors are close.")
        case _ where doorsState == .close:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors are already close.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func concreteMixerStateOn() {
        switch self.concreteMixerState {
        case _ where self.concreteMixerState == .off:
            concreteMixerState = .on
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now concrete mixer is on.")
        case _ where concreteMixerState == .on:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The concrete mixer is already on.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func concreteMixerStateOff() {
        switch self.concreteMixerState {
        case _ where self.concreteMixerState == .on:
            concreteMixerState = .off
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the concrete mixer is off.")
        case _ where concreteMixerState == .off:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The concrete mixer is already off.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func concreteMixerPumpOn() {
        switch self.concreteMixerPump {
        case _ where self.concreteMixerPump == .off:
            concreteMixerPump = .on
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now concrete mixer pump is on.")
        case _ where concreteMixerState == .on:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The concrete mixer pump is already on.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func concreteMixerPumpOff() {
        switch self.concreteMixerPump {
        case _ where self.concreteMixerPump == .on:
            concreteMixerPump = .off
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now the concrete mixer pump is off.")
        case _ where concreteMixerPump == .off:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The concrete mixer is already off.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
}
// 4th  exercise "For each class, write an extension that implements the "CustomStringConvertible" protocol.".
extension TunkCar: CustomStringConvertible {
    func printInConsole() {
        print(description)
    }
}
// 3rd  exercise "Create two classes that implement the "Car" protocol: tunkCar and sportCar. Describe in them the properties that are different for a sports car and a tank car.".
class SportCar: Car {
    var carBrand: CarBrand
    var carModel: CarModel
    var carPlate: String
    var manufactureYear: Int
    var bodyType: BodyType
    var transmissionType: TransmissionType
    var bodyColor: BodyColor
    var doorsLockUnlock: DoorsLockUnlock
    var engineState: EngineState
    var windowsLockUnlock: WindowsLockUnlock
    var doorsState: DoorsState
    var exhaustMode: ExhaustMode
    var transmissionMode: TransmissionMode
    var description: String {
        return "\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
        "Brand: \(carBrand.rawValue)\n" +
        "Model: \(carModel.rawValue)\n" +
        "Manufacture year: \(manufactureYear)\n" +
        "Body type: \(bodyType.rawValue)\n" +
        "Transmission type: \(transmissionType.rawValue)\n" +
        "Body color: \(bodyType.rawValue)\n" +
        "Engine state: \(engineState.rawValue)\n" +
        "Doors lock/unlock: \(doorsLockUnlock.rawValue)\n" +
        "Windows state: \(windowsLockUnlock.rawValue)\n" +
        "Doors open/close: \(doorsState.rawValue)\n" +
        "Exhaust mode: \(exhaustMode.rawValue)\n" +
        "Transmission mode: \(transmissionMode.rawValue)\n"
    }
    
    init(carBrand: CarBrand, carModel: CarModel, carPlate:String, manufactureYear: Int,
         bodyType: BodyType, transmissionType: TransmissionType, bodyColor: BodyColor, doorsLockUnlock: DoorsLockUnlock,
         engineState: EngineState,windowsLockUnlock: WindowsLockUnlock, doorsState: DoorsState,
         exhaustMode: ExhaustMode, transmissionMode: TransmissionMode) {
        self.carBrand = carBrand
        self.carModel = carModel
        self.carPlate = carPlate
        self.manufactureYear = manufactureYear
        self.bodyType = bodyType
        self.transmissionType = transmissionType
        self.bodyColor = bodyColor
        self.doorsLockUnlock = doorsLockUnlock
        self.engineState = engineState
        self.windowsLockUnlock = windowsLockUnlock
        self.doorsState = doorsState
        self.exhaustMode = exhaustMode
        self.transmissionMode = transmissionMode
        
    }
    
    func doorOpen(){
        switch self.doorsState {
        case _ where self.doorsState == .close:
            doorsState = .open
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now doors are open.")
        case _ where doorsState == .open:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors are already open.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func doorClose() {
        switch self.doorsState {
        case _ where self.doorsState == .open:
            doorsState = .close
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now doors are close.")
        case _ where doorsState == .close:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The doors are already close.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func someMethod() {
        print("\n\nThis is Easter Egg\n\n")
    }
    
    func exhaustModeRace() {
        switch self.exhaustMode {
        case _ where self.exhaustMode == .comfort:
            exhaustMode = .race
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now exhaust is in race mode.")
        case _ where exhaustMode == .race:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The exhaust is already in race mode.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func exhaustModeComfort() {
        switch self.exhaustMode {
        case _ where self.exhaustMode == .race:
            exhaustMode = .comfort
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now exhaust is in comfort mode.")
        case _ where exhaustMode == .comfort:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The exhaust is already in comfort mode.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func transmissionModeRace() {
        switch self.transmissionMode {
        case _ where self.transmissionMode == .comfort && self.transmissionMode == .sport:
            transmissionMode = .race
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now transmission is in race mode.")
        case _ where transmissionMode == .race:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The transmission is already in race mode.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func transmissionModeSport() {
        switch self.transmissionMode {
        case _ where self.transmissionMode == .comfort && self.transmissionMode == .race:
            transmissionMode = .sport
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now transmission is in sport mode.")
        case _ where transmissionMode == .sport:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The transmission is already in sport mode.")
        default:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "There is some error in function.")
        }
    }
    
    func transmissionModeComfort() {
        switch self.transmissionMode {
        case _ where self.transmissionMode == .sport && self.transmissionMode == .race:
            transmissionMode = .comfort
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Now transmission is in comfort mode.")
        case _ where transmissionMode == .comfort:
            print("\n(\(carBrand.rawValue) \(carModel.rawValue), registration plates '\(carPlate)'.)" +
                  "Error: The transmission is already in comfort mode.")
        default:
            print("\nThere is some error in function.")
        }
    }
}
// 4th  exercise "For each class, write an extension that implements the "CustomStringConvertible" protocol.".
extension SportCar: CustomStringConvertible {
    func printInConsole() {
        print(description)
    }
}
// 5th  exercise "Create multiple objects of each class. Apply various actions to them.".
var peterbildP330 = TunkCar(carBrand: .peterbilt, carModel: .p330, carPlate: "PDS1J", manufactureYear: 2022,
                            bodyType: .truck, transmissionType: .mt, bodyColor: .white, engineState: .off,
                            doorsLockUnlock: .unlock, windowsLockUnlock: .lock, doorsState: .close, concreteMixerState: .on, concreteMixerPump: .off)

var peterbildP3302 = TunkCar(carBrand: .peterbilt, carModel: .p330, carPlate: "KJD8923", manufactureYear: 2022,
                            bodyType: .truck, transmissionType: .mt, bodyColor: .white, engineState: .on,
                            doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, doorsState: .close, concreteMixerState: .off, concreteMixerPump: .off)

var nissanZ400 = SportCar(carBrand: .nissan, carModel: .z400, carPlate: "JDSP2", manufactureYear: 2022,
                          bodyType: .coupe, transmissionType: .at, bodyColor: .green, doorsLockUnlock: .unlock,
                          engineState: .off, windowsLockUnlock: .lock, doorsState: .close, exhaustMode: .comfort, transmissionMode: .sport)

var hondaCivic = SportCar(carBrand: .honda, carModel: .civic, carPlate: "032JSH", manufactureYear: 2022,
                          bodyType: .coupe, transmissionType: .at, bodyColor: .red, doorsLockUnlock: .unlock,
                          engineState: .off, windowsLockUnlock: .lock, doorsState: .open, exhaustMode: .race, transmissionMode: .comfort)

peterbildP330.engineOn()
peterbildP330.unlockDoors()
peterbildP330.unlockWindows()
peterbildP330.doorOpen()
peterbildP330.concreteMixerStateOn()

peterbildP3302.engineOff()
peterbildP3302.lockDoors()
peterbildP3302.lockWindows()
peterbildP3302.doorOpen()
peterbildP3302.concreteMixerStateOff()

nissanZ400.unlockDoors()
nissanZ400.doorOpen()
nissanZ400.engineOn()
nissanZ400.exhaustModeRace()
nissanZ400.transmissionModeRace()

hondaCivic.unlockDoors()
hondaCivic.doorClose()
hondaCivic.engineOn()
hondaCivic.exhaustModeComfort()
hondaCivic.transmissionModeSport()

// 6th  exercise "Output the objects themselves to the console.".
peterbildP330.printInConsole()
peterbildP3302.printInConsole()
nissanZ400.printInConsole()
hondaCivic.printInConsole()
//
//        4TH HOMEWORK
//
//// was created enums for structure propeties, because it is very convenient
//enum CarBrand: String {
//    case nissan = "Nissan"
//    case honda = "Honda"
//    case toyota = "Toyota"
//    case volkswagen = "Volkswagen"
//    case peterbilt = "Peterbilt"
//}
//
//enum CarModel: String {
//    case z400 = "400Z"
//    case civic = "Civic"
//    case camry = "Camry"
//    case touareg = "Touareg"
//    case p330 = "330"
//}
//
//enum CarEquipment: String {
//    case base = "base"
//    case midle = "midle"
//    case full = "full"
//    case individual = "individual"
//}
//
//enum ManufactureYear: Int {
//    case my2000 = 2000
//    case my2001 = 2001
//    case my2002 = 2002
//    case my2003 = 2003
//    case my2004 = 2004
//    case my2005 = 2005
//    case my2006 = 2006
//    case my2007 = 2007
//    case my2008 = 2008
//    case my2009 = 2009
//    case my2010 = 2010
//    case my2011 = 2011
//    case my2012 = 2012
//    case my2013 = 2013
//    case my2014 = 2014
//    case my2015 = 2015
//    case my2016 = 2016
//    case my2017 = 2017
//    case my2018 = 2018
//    case my2019 = 2019
//    case my2020 = 2020
//    case my2021 = 2021
//    case my2022 = 2022
//}
//
//enum BodyType: String {
//    case sedan = "sedan"
//    case stationWagon = "station wagon"
//    case coupe = "coupe"
//    case hatchback = "hatchback"
//    case convertible = "convertible"
//    case suv = "SUV"
//    case van = "van"
//    case bus = "bus"
//    case truck = "truck"
//    case other = "other"
//}
//
//enum EngineType: String {
//    case petrol = "petrol"
//    case diesel = "diesel"
//    case electric = "electric"
//}
//
//enum HybridSistem: String {
//    case noHybridSistem = "no hybrid sistem"
//    case hev = "HEV"
//    case phev = "PHEV"
//}
//
//enum TransmissionType: String {
//    case mt = "manual"
//    case at = "automatic"
//    case am = "automated manual"
//    case cvt = "continuously variable"
//}
//
//enum BodyColor: String {
//    case white  = "white"
//    case black = "black"
//    case red = "red"
//    case green = "green"
//    case yellow = "yellow"
//    case blue = "blue"
//    case grey = "grey"
//    case brown = "brown"
//    case orange = "orange"
//    case pink = "pink"
//    case purple = "purple"
//    case violet = "violet"
//    case beige = "beige"
//    case gold = "gold"
//}
//
//enum EngineState: String {
//    case off = "off"
//    case on = "on"
//}
//
//enum DoorsLockUnlock: String {
//    case lock = "lock"
//    case unlock = "unlock"
//}
//
//enum WindowsLockUnlock: String {
//    case lock = "lock"
//    case unlock = "unlock"
//}
//
//enum CargoHandling: Int {
//    case load
//    case unload
//}
//
//// 1st exercise "Describe the class Car with general properties of cars and an empty action method, similar to the previous  homework"
//// class was created and described
//class Car {
//    let carBrand: CarBrand
//    let carModel: CarModel
//    let carEquipment: CarEquipment
//    let manufactureYear: ManufactureYear
//    let bodyType: BodyType
//    let engineType: EngineType
//    let hybridSistem: HybridSistem
//    let transmissionType: TransmissionType
//    let bodyColor: BodyColor
//    var engineState: EngineState
//    var doorsLockUnlock: DoorsLockUnlock
//    var windowsLockUnlock: WindowsLockUnlock
//    let volumeInterior: Double
//    var interiorFullnes: Double
//    let volumeTrunk: Double
//    var trunkFullnes: Double
//    var engineOilResource: Double = 0
//    var engineOilLamp: Bool = false
//    var mileage: Double {
//            didSet {
//                print("Mileage data has been updated. The total mileage is \(mileage).")
//                let distance = mileage - oldValue
//                engineOilResource += distance
//                if engineOilResource > 7999 && engineOilResource < 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
//                    engineOilLamp = true
//                    }
//                if engineOilResource > 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
//                    engineOilLamp = true
//                }
//            }
//        }
//
//    func engineOilChange() {
//        engineOilResource = 0
//        engineOilLamp = false
//        print("Oil change check has been reset")
//        }
//
//    func engineOn() {
//        switch self.engineState {
//        case _ where self.engineState == .off:
//            engineState = .on
//            print("Now engine is on.")
//        case _ where engineState == .on:
//            print("Error: The engine is already on.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func engineOff() {
//        switch self.engineState {
//        case _ where self.engineState == .on:
//            engineState = .off
//            print("Now the engine is off.")
//        case _ where engineState == .off:
//            print("Error: The engine is already off.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func lockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .unlock:
//            doorsLockUnlock = .lock
//            print("Now the doors are locked.")
//        case _ where doorsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func unlockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .lock:
//            doorsLockUnlock = .unlock
//            print("Now the doors are unlocked.")
//        case _ where doorsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func lockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .unlock:
//            windowsLockUnlock = .lock
//            print("Now the windows are locked.")
//        case _ where windowsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func unlockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .lock:
//            windowsLockUnlock = .unlock
//            print("Now the windows are unlocked.")
//        case _ where windowsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
//                  " You cannot unload more than \(trunkFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            trunkFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            trunkFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
//                  " You cannot unload more than \(interiorFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            interiorFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            interiorFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
//        )
//              switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)\n")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)\n")
//              default:
//                  print("There is some error in function.\n")
//        }
//    }
//
//    func addMileage(lastTripMileage: Double) {
//        mileage += lastTripMileage
//    }
//
//    func engineOilCheck() {
//            switch engineOilResource {
//            case _ where engineOilResource < 7999:
//                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
//            case _ where engineOilResource > 7999 && engineOilResource < 9999:
//                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
//            case _ where engineOilResource > 9999:
//                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
//            default: print("There is some error.")
//                }
//        }
//    init(carBrand: CarBrand, carModel: CarModel, carEquipment: CarEquipment, manufactureYear: ManufactureYear, bodyType: BodyType, engineType: EngineType, hybridSistem: HybridSistem, transmissionType: TransmissionType, bodyColor: BodyColor, engineState: EngineState, doorsLockUnlock: DoorsLockUnlock, windowsLockUnlock: WindowsLockUnlock, volumeInterior: Double, interiorFullnes: Double, volumeTrunk: Double, trunkFullnes: Double, engineOilResource: Double = 0, engineOilLamp: Bool = false, mileage: Double) {
//        self.carBrand = carBrand
//        self.carModel = carModel
//        self.carEquipment = carEquipment
//        self.manufactureYear = manufactureYear
//        self.bodyType = bodyType
//        self.engineType = engineType
//        self.hybridSistem = hybridSistem
//        self.transmissionType = transmissionType
//        self.bodyColor = bodyColor
//        self.engineState = engineState
//        self.doorsLockUnlock = doorsLockUnlock
//        self.windowsLockUnlock = windowsLockUnlock
//        self.volumeInterior = volumeInterior
//        self.interiorFullnes = interiorFullnes
//        self.volumeTrunk = volumeTrunk
//        self.trunkFullnes = trunkFullnes
//        self.engineOilResource = engineOilResource
//        self.engineOilLamp = engineOilLamp
//        self.mileage = mileage
//
//    }
////an empty action method by analogy with the previous task was created
//    func someMethod() {
//    }
//}
//
//// 3rd exercise "To take from the last enum lesson with actions on the car. Think about what special actions TrunkCar has and what the SportCar has. Add these actions to the enum.".
//// new enum for SportCar was created
//enum SportCarModes: String {
//    case normalMode = "normal mode"
//    case sportMode = "sport mode"
//    case trackMode = "track mode"
//}
//
////new enum for TrunkCar was created
//enum AutonomousHeatingInterior: String {
//    case on = "on"
//    case off = "off"
//}
//
//// 2nd exercise "Describe a couple of his sub-class TrunkCar and SportCar. Think about what distinguishing features these cars have. Describe properties specific to each successor"
////sub-class SportCar was created and described
//class SportCar: Car {
////distinctive properties have been added
//    var improvedSuspension: Bool
//    var improvedEngine: Bool
//    var improvedTransmission: Bool
//    var sportCarModes: SportCarModes
//    init(carBrand: CarBrand, carModel: CarModel, carEquipment: CarEquipment, manufactureYear: ManufactureYear, bodyType: BodyType, engineType: EngineType, hybridSistem: HybridSistem, transmissionType: TransmissionType, bodyColor: BodyColor, engineState: EngineState, doorsLockUnlock: DoorsLockUnlock, windowsLockUnlock: WindowsLockUnlock, volumeInterior: Double, interiorFullnes: Double, volumeTrunk: Double, trunkFullnes: Double, engineOilResource: Double = 0, engineOilLamp: Bool = false, mileage: Double, improvedSuspension: Bool, improvedEngine: Bool, improvedTransmission: Bool, sportCarModes: SportCarModes) {
//        self.improvedSuspension = improvedSuspension
//        self.improvedEngine = improvedEngine
//        self.improvedTransmission = improvedTransmission
//        self.sportCarModes = sportCarModes
//        super.init(carBrand: carBrand, carModel: carModel, carEquipment: carEquipment, manufactureYear: manufactureYear, bodyType: bodyType, engineType: engineType, hybridSistem: hybridSistem, transmissionType: transmissionType, bodyColor: bodyColor, engineState: engineState, doorsLockUnlock: doorsLockUnlock, windowsLockUnlock: windowsLockUnlock, volumeInterior: volumeInterior, interiorFullnes: interiorFullnes, volumeTrunk: volumeTrunk, trunkFullnes: trunkFullnes, mileage: mileage)
//    }
//// the printInConsole method is overridden according to SportCar class
//    override func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km.")
//
//        switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch improvedSuspension {
//              case _ where improvedSuspension == false:
//                  print("Improved suspension: no improved suspension.")
//              case _ where improvedSuspension == true:
//                  print("Improved suspension: improved suspension fitted.")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch improvedEngine {
//              case _ where improvedEngine == false:
//                  print("Improved engine: no improved engine.")
//              case _ where improvedEngine == true:
//                  print("Improved engine: improved engine fitted.")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch sportCarModes {
//              case _ where sportCarModes == .normalMode:
//                  print("Car mode: now normal mode is on.")
//              case _ where sportCarModes == .sportMode:
//                  print("Car mode: now sport mode is on.")
//              case _ where sportCarModes == .trackMode:
//                  print("Car mode: now track mode is on.")
//              default:
//                  print("There is some error in function.")
//        }
//    }
//// the car action method is overridden according to its class
//    override func someMethod() {
//        switch sportCarModes {
//        case .normalMode:
//            print("Now normal mode is on.")
//        case .sportMode:
//            print("Now sport mode is on.")
//        case .trackMode:
//            print("Now track mode is on.")
//        }
//    }
//}
//
////sub-class SportCar was created and described
//class TrunkCar: Car {
////distinctive properties have been added
//    var numberOfFuelTanks: Int
//    var sleepingArea: Bool
//    var trailerMount: Bool
//    var autonomousHeatingInterior: AutonomousHeatingInterior
//    init(carBrand: CarBrand, carModel: CarModel, carEquipment: CarEquipment, manufactureYear: ManufactureYear, bodyType: BodyType, engineType: EngineType, hybridSistem: HybridSistem, transmissionType: TransmissionType, bodyColor: BodyColor, engineState: EngineState, doorsLockUnlock: DoorsLockUnlock, windowsLockUnlock: WindowsLockUnlock, volumeInterior: Double, interiorFullnes: Double, volumeTrunk: Double, trunkFullnes: Double, engineOilResource: Double = 0, engineOilLamp: Bool = false, mileage: Double, numberOfFuelTanks: Int, sleepingArea: Bool, trailerMount: Bool, autonomousHeatingInterior: AutonomousHeatingInterior) {
//        self.numberOfFuelTanks = numberOfFuelTanks
//        self.sleepingArea = sleepingArea
//        self.trailerMount = trailerMount
//        self.autonomousHeatingInterior = autonomousHeatingInterior
//        super.init(carBrand: carBrand, carModel: carModel, carEquipment: carEquipment, manufactureYear: manufactureYear, bodyType: bodyType, engineType: engineType, hybridSistem: hybridSistem, transmissionType: transmissionType, bodyColor: bodyColor, engineState: engineState, doorsLockUnlock: doorsLockUnlock, windowsLockUnlock: windowsLockUnlock, volumeInterior: volumeInterior, interiorFullnes: interiorFullnes, volumeTrunk: volumeTrunk, trunkFullnes: trunkFullnes, mileage: mileage)
//    }
//// the printInConsole method is overridden according to TrunkCar class
//    override func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Number of fuel tanks: \(numberOfFuelTanks)" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km.")
//
//        switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch sleepingArea {
//              case _ where sleepingArea == false:
//                  print("Sleeping area: car has no sleeping area.")
//              case _ where sleepingArea == true:
//                  print("Sleeping area: car has a sleeping area.")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch trailerMount {
//              case _ where trailerMount == false:
//                  print("Trailer mount: car has no trailer mount.")
//              case _ where trailerMount == true:
//                  print("Trailer mount: car has a trailer mount.")
//              default:
//                  print("There is some error in function.")
//        }
//
//        switch autonomousHeatingInterior {
//              case _ where autonomousHeatingInterior == .off:
//                  print("Autonomous interior heating: now autonomous interior heating is off.")
//              case _ where autonomousHeatingInterior == .on:
//                  print("Autonomous interior heating: now autonomous interior heating is on.")
//              default:
//                  print("There is some error in function.")
//        }
//    }
//// the car action method is overridden according to its class
//    override func someMethod() {
//        switch autonomousHeatingInterior {
//        case .on:
//            print("Autonomous interior heating is on.")
//        case .off:
//            print("Autonomous interior heating is off.")
//        }
//    }
//}
//// 5th exerice "Initialize multiple instances of classes. Apply various actions to them."
//// initialize of 4 structures
//var nissanZ400 = SportCar(carBrand: .nissan, carModel: .z400, carEquipment: .full, manufactureYear: .my2021, bodyType: .coupe, engineType: .petrol, hybridSistem: .noHybridSistem, transmissionType: .mt, bodyColor: .red, engineState: .off, doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, volumeInterior: 234, interiorFullnes: 234, volumeTrunk: 54, trunkFullnes: 43, engineOilResource: 34, engineOilLamp: false, mileage: 1214, improvedSuspension: true, improvedEngine: true, improvedTransmission: false, sportCarModes: .normalMode)
//
//var nissanZ4002 = SportCar(carBrand: .nissan, carModel: .z400, carEquipment: .full, manufactureYear: .my2022, bodyType: .coupe, engineType: .petrol, hybridSistem: .noHybridSistem, transmissionType: .at, bodyColor: .blue, engineState: .on, doorsLockUnlock: .lock, windowsLockUnlock: .lock, volumeInterior: 234, interiorFullnes: 150, volumeTrunk: 54, trunkFullnes: 10, engineOilResource: 543, engineOilLamp: false, mileage: 12141, improvedSuspension: true, improvedEngine: true, improvedTransmission: false, sportCarModes: .trackMode)
//
//var peterbildP330 = TrunkCar(carBrand: .peterbilt, carModel: .p330, carEquipment: .individual, manufactureYear: .my2022, bodyType: .truck, engineType: .diesel, hybridSistem: .noHybridSistem, transmissionType: .at, bodyColor: .brown, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 500, interiorFullnes: 200, volumeTrunk: 10000, trunkFullnes: 10000, engineOilResource: 3000, engineOilLamp: false, mileage: 235043, numberOfFuelTanks: 2, sleepingArea: true, trailerMount: true, autonomousHeatingInterior: .on)
//
//var peterbildP3302 = TrunkCar(carBrand: .peterbilt, carModel: .p330, carEquipment: .individual, manufactureYear: .my2022, bodyType: .truck, engineType: .diesel, hybridSistem: .noHybridSistem, transmissionType: .at, bodyColor: .brown, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 500, interiorFullnes: 130, volumeTrunk: 500, trunkFullnes: 10000, engineOilResource: 4673, engineOilLamp: false, mileage: 294543, numberOfFuelTanks: 1, sleepingArea: true, trailerMount: true, autonomousHeatingInterior: .off)
//
////apply various actions to them.
//nissanZ400.engineOilChange()
//nissanZ400.lockDoors()
//
//nissanZ4002.sportCarModes = .normalMode
//nissanZ4002.engineOilCheck()
//
//peterbildP330.loadingUnloadingTrunk(loadingOrUnloading: .unload, cargoWeight: 10000)
//peterbildP330.loadingUnloadingInterior(loadingOrUnloading: .unload, cargoWeight: 200)
//
//peterbildP3302.someMethod()
//peterbildP3302.autonomousHeatingInterior = .on
//
//// 6th exercise "Print instance property values ​​to the console."
//// information about structures was entered into the console was displayed using the structure method
//nissanZ400.printInConsole()
//nissanZ4002.printInConsole()
//peterbildP330.printInConsole()
//peterbildP3302.printInConsole()
//
//        3RD HOMEWORK
//
//// was created enums for structure propeties, because it is very convenient
//enum CarBrand: String {
//    case nissan = "Nissan"
//    case honda = "Honda"
//    case toyota = "Toyota"
//    case volkswagen = "Volkswagen"
//    case peterbilt = "Peterbilt"
//}
//
//enum CarModel: String {
//    case z400 = "400Z"
//    case civic = "Civic"
//    case camry = "Camry"
//    case touareg = "Touareg"
//    case p330 = "330"
//}
//
//enum CarEquipment: String {
//    case base = "base"
//    case midle = "midle"
//    case full = "full"
//    case individual = "individual"
//}
//
//enum ManufactureYear: Int {
//    case my2000 = 2000
//    case my2001 = 2001
//    case my2002 = 2002
//    case my2003 = 2003
//    case my2004 = 2004
//    case my2005 = 2005
//    case my2006 = 2006
//    case my2007 = 2007
//    case my2008 = 2008
//    case my2009 = 2009
//    case my2010 = 2010
//    case my2011 = 2011
//    case my2012 = 2012
//    case my2013 = 2013
//    case my2014 = 2014
//    case my2015 = 2015
//    case my2016 = 2016
//    case my2017 = 2017
//    case my2018 = 2018
//    case my2019 = 2019
//    case my2020 = 2020
//    case my2021 = 2021
//    case my2022 = 2022
//}
//
//enum BodyType: String {
//    case sedan = "sedan"
//    case stationWagon = "station wagon"
//    case coupe = "coupe"
//    case hatchback = "hatchback"
//    case convertible = "convertible"
//    case suv = "SUV"
//    case van = "van"
//    case bus = "bus"
//    case truck = "truck"
//    case other = "other"
//}
//
//enum EngineType: String {
//    case petrol = "petrol"
//    case diesel = "diesel"
//    case electric = "electric"
//}
//
//enum HybridSistem: String {
//    case noHybridSistem = "no hybrid sistem"
//    case hev = "HEV"
//    case phev = "PHEV"
//}
//
//enum TransmissionType: String {
//    case mt = "manual"
//    case at = "automatic"
//    case am = "automated manual"
//    case cvt = "continuously variable"
//}
//
//enum BodyColor: String {
//    case white  = "white"
//    case black = "black"
//    case red = "red"
//    case green = "green"
//    case yellow = "yellow"
//    case blue = "blue"
//    case grey = "grey"
//    case brown = "brown"
//    case orange = "orange"
//    case pink = "pink"
//    case purple = "purple"
//    case violet = "violet"
//    case beige = "beige"
//    case gold = "gold"
//}
//
//// 3rd exercise "Describe the enumeration with possible actions with the car: start/stop the engine, open/close windows, load/unload cargo of a certain volume from the body/trunk."
//enum EngineState: String {
//    case off = "off"
//    case on = "on"
//}
//
//enum DoorsLockUnlock: String {
//    case lock = "lock"
//    case unlock = "unlock"
//}
//
//enum WindowsLockUnlock: String {
//    case lock = "lock"
//    case unlock = "unlock"
//}
//
//enum CargoHandling: Int {
//    case load
//    case unload
//}
//
//// 1st exercise "Describe several structures - any SportCar and any TrunkCar."
//// 2nd exercise "The structures should contain the make of the car, the year of manufacture, the volume of the trunk / body, whether the engine is running, whether the windows are open, the volume of the trunk filled."
//// structures were created and described
//struct SportCar {
//    let carBrand: CarBrand
//    let carModel: CarModel
//    let carEquipment: CarEquipment
//    let manufactureYear: ManufactureYear
//    let bodyType: BodyType
//    let engineType: EngineType
//    let hybridSistem: HybridSistem
//    let transmissionType: TransmissionType
//    let bodyColor: BodyColor
//    var engineState: EngineState
//    var doorsLockUnlock: DoorsLockUnlock
//    var windowsLockUnlock: WindowsLockUnlock
//    let volumeInterior: Double
//    var interiorFullnes: Double
//    let volumeTrunk: Double
//    var trunkFullnes: Double
//    var engineOilResource: Double = 0
//    var engineOilLamp: Bool = false
//    var mileage: Double {
//            didSet {
//                print("Mileage data has been updated. The total mileage is \(mileage).")
//                let distance = mileage - oldValue
//                engineOilResource += distance
//                if engineOilResource > 7999 && engineOilResource < 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
//                    engineOilLamp = true
//                    }
//                if engineOilResource > 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
//                    engineOilLamp = true
//                }
//            }
//        }
//
//// 4th exercise "Add a method to the structure with an enum type argument that will change the properties of the structure depending on the action."
//// different methods were created and added to change the structure properties
//    mutating func engineOilChange() {
//        engineOilResource = 0
//        engineOilLamp = false
//        print("Oil change check has been reset")
//        }
//
//    mutating func engineOn() {
//        switch self.engineState {
//        case _ where self.engineState == .off:
//            engineState = .on
//            print("Now engine is on.")
//        case _ where engineState == .on:
//            print("Error: The engine is already on.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func engineOff() {
//        switch self.engineState {
//        case _ where self.engineState == .on:
//            engineState = .off
//            print("Now the engine is off.")
//        case _ where engineState == .off:
//            print("Error: The engine is already off.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .unlock:
//            doorsLockUnlock = .lock
//            print("Now the doors are locked.")
//        case _ where doorsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .lock:
//            doorsLockUnlock = .unlock
//            print("Now the doors are unlocked.")
//        case _ where doorsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .unlock:
//            windowsLockUnlock = .lock
//            print("Now the windows are locked.")
//        case _ where windowsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .lock:
//            windowsLockUnlock = .unlock
//            print("Now the windows are unlocked.")
//        case _ where windowsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
//                  " You cannot unload more than \(trunkFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            trunkFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            trunkFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
//                  " You cannot unload more than \(interiorFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            interiorFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            interiorFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//// 6th exercise "Print instance property values ​​to the console."
//// a method was created for a optimize output to the console of data about a structure instance
//    func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
//        )
//              switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)\n")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)\n")
//              default:
//                  print("There is some error in function.\n")
//        }
//    }
//
//    mutating func addMileage(lastTripMileage: Double) {
//        mileage += lastTripMileage
//    }
//
//    func engineOilCheck() {
//            switch engineOilResource {
//            case _ where engineOilResource < 7999:
//                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
//            case _ where engineOilResource > 7999 && engineOilResource < 9999:
//                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
//            case _ where engineOilResource > 9999:
//                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
//            default: print("There is some error.")
//                }
//        }
//}
//
//struct TrunkCar {
//    let carBrand: CarBrand
//    let carModel: CarModel
//    let carEquipment: CarEquipment
//    let manufactureYear: ManufactureYear
//    let bodyType: BodyType
//    let engineType: EngineType
//    let hybridSistem: HybridSistem
//    let transmissionType: TransmissionType
//    let bodyColor: BodyColor
//    var engineState: EngineState
//    var doorsLockUnlock: DoorsLockUnlock
//    var windowsLockUnlock: WindowsLockUnlock
//    let volumeInterior: Double
//    var interiorFullnes: Double
//    let volumeTrunk: Double
//    var trunkFullnes: Double
//    var engineOilResource: Double = 0
//    var engineOilLamp: Bool = false
//    var mileage: Double {
//            didSet {
//                print("Mileage data has been updated. The total mileage is \(mileage).")
//                let distance = mileage - oldValue
//                engineOilResource += distance
//                if engineOilResource > 7999 && engineOilResource < 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
//                    engineOilLamp = true
//                    }
//                if engineOilResource > 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
//                    engineOilLamp = true
//                }
//            }
//        }
//
//    mutating func engineOilChange() {
//        engineOilResource = 0
//        engineOilLamp = false
//        print("Oil change check has been reset")
//        }
//
//    mutating func engineOn() {
//        switch self.engineState {
//        case _ where self.engineState == .off:
//            engineState = .on
//            print("Now engine is on.")
//        case _ where engineState == .on:
//            print("Error: The engine is already on.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func engineOff() {
//        switch self.engineState {
//        case _ where self.engineState == .on:
//            engineState = .off
//            print("Now the engine is off.")
//        case _ where engineState == .off:
//            print("Error: The engine is already off.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .unlock:
//            doorsLockUnlock = .lock
//            print("Now the doors are locked.")
//        case _ where doorsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .lock:
//            doorsLockUnlock = .unlock
//            print("Now the doors are unlocked.")
//        case _ where doorsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .unlock:
//            windowsLockUnlock = .lock
//            print("Now the windows are locked.")
//        case _ where windowsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .lock:
//            windowsLockUnlock = .unlock
//            print("Now the windows are unlocked.")
//        case _ where windowsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
//                  " You cannot unload more than \(trunkFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            trunkFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            trunkFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
//                  " You cannot unload more than \(interiorFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            interiorFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            interiorFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
//        )
//              switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)\n")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)\n")
//              default:
//                  print("There is some error in function.\n")
//        }
//    }
//
//    mutating func addMileage(lastTripMileage: Double) {
//        mileage += lastTripMileage
//    }
//
//    func engineOilCheck() {
//            switch engineOilResource {
//            case _ where engineOilResource < 7999:
//                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
//            case _ where engineOilResource > 7999 && engineOilResource < 9999:
//                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
//            case _ where engineOilResource > 9999:
//                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
//            default: print("There is some error.")
//                }
//        }
//}
//
//struct Car {
//    let carBrand: CarBrand
//    let carModel: CarModel
//    let carEquipment: CarEquipment
//    let manufactureYear: ManufactureYear
//    let bodyType: BodyType
//    let engineType: EngineType
//    let hybridSistem: HybridSistem
//    let transmissionType: TransmissionType
//    let bodyColor: BodyColor
//    var engineState: EngineState
//    var doorsLockUnlock: DoorsLockUnlock
//    var windowsLockUnlock: WindowsLockUnlock
//    let volumeInterior: Double
//    var interiorFullnes: Double
//    let volumeTrunk: Double
//    var trunkFullnes: Double
//    var engineOilResource: Double = 0
//    var engineOilLamp: Bool = false
//    var mileage: Double {
//            didSet {
//                print("Mileage data has been updated. The total mileage is \(mileage).")
//                let distance = mileage - oldValue
//                engineOilResource += distance
//                if engineOilResource > 7999 && engineOilResource < 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
//                    engineOilLamp = true
//                    }
//                if engineOilResource > 9999 {
//                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
//                    engineOilLamp = true
//                }
//            }
//        }
//
//    mutating func engineOilChange() {
//        engineOilResource = 0
//        engineOilLamp = false
//        print("Oil change check has been reset")
//        }
//
//    mutating func engineOn() {
//        switch self.engineState {
//        case _ where self.engineState == .off:
//            engineState = .on
//            print("Now engine is on.")
//        case _ where engineState == .on:
//            print("Error: The engine is already on.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func engineOff() {
//        switch self.engineState {
//        case _ where self.engineState == .on:
//            engineState = .off
//            print("Now the engine is off.")
//        case _ where engineState == .off:
//            print("Error: The engine is already off.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .unlock:
//            doorsLockUnlock = .lock
//            print("Now the doors are locked.")
//        case _ where doorsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockDoors() {
//        switch self.doorsLockUnlock {
//        case _ where self.doorsLockUnlock == .lock:
//            doorsLockUnlock = .unlock
//            print("Now the doors are unlocked.")
//        case _ where doorsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func lockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .unlock:
//            windowsLockUnlock = .lock
//            print("Now the windows are locked.")
//        case _ where windowsLockUnlock == .lock:
//            print("Error: The doors is already locked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func unlockWindows() {
//        switch self.windowsLockUnlock {
//        case _ where self.windowsLockUnlock == .lock:
//            windowsLockUnlock = .unlock
//            print("Now the windows are unlocked.")
//        case _ where windowsLockUnlock == .unlock:
//            print("Error: The doors is already unlocked.")
//        default:
//            print("There is some error in function.")
//        }
//    }
//
//    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
//                  " You cannot unload more than \(trunkFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            trunkFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            trunkFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
//        switch cargoWeight {
//        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
//            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
//                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
//            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
//                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
//                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
//        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
//            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
//                  " You cannot unload more than \(interiorFullnes) kg.)")
//        case _ where loadingOrUnloading == .load:
//            interiorFullnes += cargoWeight
//        case _ where loadingOrUnloading == .unload:
//            interiorFullnes -= cargoWeight
//        default:
//            print("There is some error in load function.")
//        }
//    }
//
//    func printInConsole() {
//        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
//              "Brand: \(carBrand.rawValue)\n" +
//              "Model: \(carModel.rawValue)\n" +
//              "Equipment: \(carEquipment.rawValue)\n" +
//              "Manufacture year: \(manufactureYear.rawValue)\n" +
//              "Body type: \(bodyType.rawValue)\n" +
//              "Engine type: \(engineType.rawValue)\n" +
//              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
//              "Transmission type: \(transmissionType.rawValue)\n" +
//              "Body color: \(bodyType.rawValue)\n" +
//              "Engine state: \(engineState.rawValue)\n" +
//              "Doors state: \(doorsLockUnlock.rawValue)\n" +
//              "Windows state: \(windowsLockUnlock.rawValue)\n" +
//              "Volume of interior: \(volumeInterior)\n" +
//              "Interior fullnes: \(interiorFullnes)\n" +
//              "Volume of trunk: \(volumeTrunk)\n" +
//              "Trunk fullnes: \(trunkFullnes)\n" +
//              "Mileage: \(mileage)\n" +
//              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
//        )
//              switch engineOilLamp {
//              case _ where engineOilLamp == false:
//                  print("(The oil resource in the engine is within acceptable limits.)\n")
//              case _ where engineOilLamp == true:
//                  print("(The engine oil needs to be changed.)\n")
//              default:
//                  print("There is some error in function.\n")
//        }
//    }
//
//    mutating func addMileage(lastTripMileage: Double) {
//        mileage += lastTripMileage
//    }
//
//    func engineOilCheck() {
//            switch engineOilResource {
//            case _ where engineOilResource < 7999:
//                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
//            case _ where engineOilResource > 7999 && engineOilResource < 9999:
//                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
//            case _ where engineOilResource > 9999:
//                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
//            default: print("There is some error.")
//                }
//        }
//}
//
//
//// 5th exerice "Initialize multiple instances of structures. Apply various actions to them."
//// initialize of 4 structures
//var nissanZ400 = SportCar(carBrand: .nissan, carModel: .z400, carEquipment: .full, manufactureYear: .my2022, bodyType: .coupe, engineType: .petrol, hybridSistem: .noHybridSistem, transmissionType: .mt, bodyColor: .green, engineState: .off, doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, volumeInterior: 200, interiorFullnes: 0, volumeTrunk: 300, trunkFullnes: 0, engineOilResource: 0, engineOilLamp: false, mileage: 0)
//
//var peterbiltP330 = TrunkCar(carBrand: .peterbilt, carModel: .p330, carEquipment: .individual, manufactureYear: .my2010, bodyType: .truck, engineType: .diesel, hybridSistem: .noHybridSistem, transmissionType: .at, bodyColor: .grey, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .lock, volumeInterior: 300, interiorFullnes: 50, volumeTrunk: 10000, trunkFullnes: 4000, engineOilResource: 8324, engineOilLamp: true, mileage: 512724)
//
//var hondaCivic = Car(carBrand: .honda, carModel: .civic, carEquipment: .full, manufactureYear: .my2022, bodyType: .hatchback, engineType: .petrol, hybridSistem: .hev, transmissionType: .cvt, bodyColor: .red, engineState: .off, doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, volumeInterior: 270, interiorFullnes: 0, volumeTrunk: 500, trunkFullnes: 0, engineOilResource: 0, engineOilLamp: false, mileage: 0)
//
//var toyotaCamry = Car(carBrand: .toyota, carModel: .camry, carEquipment: .midle, manufactureYear: .my2009, bodyType: .sedan, engineType: .petrol, hybridSistem: .hev, transmissionType: .cvt, bodyColor: .black, engineState: .on, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 350, interiorFullnes: 210, volumeTrunk: 600, trunkFullnes: 380, engineOilResource: 326, engineOilLamp: false, mileage: 360473)
//
//var volkswagenTouareg = Car(carBrand: .volkswagen, carModel: .touareg, carEquipment: .base, manufactureYear: .my2021, bodyType: .suv, engineType: .petrol, hybridSistem: .phev, transmissionType: .at, bodyColor: .brown, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 800, interiorFullnes: 279, volumeTrunk: 1000, trunkFullnes: 905, engineOilResource: 9824, engineOilLamp: true, mileage: 82406)
//
////apply various actions to them.
//nissanZ400.loadingUnloadingInterior(loadingOrUnloading: .load, cargoWeight: 20)
//peterbiltP330.unlockDoors()
//hondaCivic.loadingUnloadingTrunk(loadingOrUnloading: .load, cargoWeight: 100)
//toyotaCamry.engineOff()
//volkswagenTouareg.lockWindows()
//
//// 6th exercise "Print instance property values ​​to the console."
//// information about structures was entered into the console was displayed using the structure method
//nissanZ400.printInConsole()
//peterbiltP330.printInConsole()
//hondaCivic.printInConsole()
//toyotaCamry.printInConsole()
//volkswagenTouareg.printInConsole()
//
//        2ND HOMEWORK
//
//// 1st exercise "Write a function that determines if a number is even or not."
//// was created function which don't return something, because in this exercise we can use such function
//print("▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that determines if a number is even or not. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//func evenOrOdd(number: Int) {
//    if number % 2 == 0 {
//        print("The number \(number) is even.")
//    } else {
//        print("The number \(number) is odd.")
//    }
//}
//// demonstrating the result of a function call (using a "For-In Loop")
//// number of iterations "For-In Loop" can be set via variables
//let initialNumber = 0
//let lastNumber = 10
//print("Numbers from \(initialNumber) to \(lastNumber) will be checked for evenness:")
//for i in initialNumber...lastNumber {
//    evenOrOdd(number: i)
//}
//
//
//// 2nd exercise "Write a function that determines if a number is evenly divisible by 3."
//// using "Switch", for diversity, since I did the 1st exercise through "If"
//print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that determines if a number is evenly divisible by 3. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//func checkDivisionBy3(number: Int) {
//    switch number {
//    case _ where number == 0:
//        print("Dividing zero by any number gives a remainder of 0.")
//    case _ where number % 3 == 0:
//        print("The number \(number) can be divisible by 3 without a remainder")
//    case _ where number % 3 != 0:
//        print("The number \(number) cannot be divisible by 3 without a remainder.")
//    default:
//        print("An error has occurred.")
//    }
//    }
//// demonstrating the result of a function call (using a "For-In Loop")
//// number of iterations "For-In Loop" can be set via variables
//let primaryNumber = 0
//let finalNumber = 10
//print("For numbers from \(primaryNumber) to \(lastNumber), will be checked for the possibility of dividing without a remainder by 3 will be checked:")
//for i in primaryNumber...lastNumber {
//    checkDivisionBy3(number: i)
//}
//
//
//// 3rd exercise "Create an increasing array of 100 numbers."
//print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Create an increasing array of 100 numbers. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//var increasingArray = [Int]()
//for i in 0...99 {
//    increasingArray.append(i)
//}
//// printed the created array on the screen
//print(increasingArray)
//
//
//// 4th exercise "Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3."
//print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//// using functional filtering (use 2 functions instead of 1 to make the code more universal
//func arrayElementParityCheck(arrayElement: Int) -> Bool {
//    return arrayElement % 2 == 0
//}
//func arrayElementDivisionBy3(arrayElement: Int) -> Bool {
//    return arrayElement % 3 == 0
//}
//increasingArray = increasingArray.filter(arrayElementParityCheck)
//print("An array from 0 to 99, with only even numbers:\n",increasingArray)
//increasingArray = increasingArray.filter(arrayElementDivisionBy3)
//print("\nAn array from 0 to 99, with only even numbers that can be divisible by 3 without a remainder:\n",increasingArray)
//
//
//// 5th exercise "Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3."
//print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that adds a new Fibonacci number to an array and add 50 elements with it. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//func arrayFibonacci(array: inout Array<Int>) -> Array<Int> {
//    var previousNumberMinusOne = 0
//    var previousNumber = 1
//    // manually add the element "1" to the array, because according to the sequence of Fibonacci numbers, the new value is equal to the sum of the two previous values ​​(if you do not add "1" it will always be 0 + 0, therefore it will not work to create a sequence of Fibonacci numbers)
//    array.append(1)
//    for _ in 0...49 {
//        let newNumber = previousNumberMinusOne + previousNumber
//        array.append(newNumber)
//        previousNumberMinusOne = previousNumber
//        previousNumber = newNumber
//    }
//return array
//}
//var arrayFibonacci = [Int]()
//print(arrayFibonacci(array: &arrayFibonacci))
//
//
//// 6th exercise "Fill an array of 100 elements with various prime numbers."
//print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Fill an array of 100 elements with various prime numbers. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//// create of function that checks if a number is prime
//func primeNumberCheck (number: Int) -> Bool {
//    if number < 2 {
//        return false
//    }
//    for i in 2..<number {
//        if number % i == 0 {
//            return false
//        }
//    }
//
//    return true
//}
//// create of an empty array that will be filled with simple values
//var arrayWithPrimeNumbers = [Int]()
//// create of a function that will fill the array with prime numbers using the "primeNumberCheck" function for checking
//func oneHundredPrimeNumbers (array: inout Array<Int>) -> Array<Int> {
//    var i = 2
//    while array.count < 100 {
//        if primeNumberCheck(number: i) {
//            array.append(i)
//        }
//        i += 1
//    }
//    return array
//}
//print("Array with 100 prime numbers:\n",oneHundredPrimeNumbers(array: &arrayWithPrimeNumbers),"\n")
//
//        1ST HOMEWORK
//
//// 1st exercise "Solution of a quadratic equation."
//// using Optional<Double> type to check to be able to check that all constants have values
//print("▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Solution of a quadratic equation. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//let aCoefficient: Double? = 1
//let bCoefficient: Double? = 5
//let cCoefficient: Double? = 3
//// using "if" to check that all constants have values
//if (aCoefficient != nil) && (bCoefficient != nil) && (cCoefficient != nil) {
//    let discriminant = pow(bCoefficient!, 2) - 4 * (aCoefficient!) * (cCoefficient!)
//    // use "switch" to calculate the root, depending on the data, if there is a root. (I used "switch" because it requires less resources than "if". LET ME KNOW IF I AM WRONG!)
//    switch discriminant {
//    case _ where discriminant == 0:
//        let x = (-bCoefficient!) / (2 * aCoefficient!)
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant = 0, the only one root = \(x).\n")
//    case _ where discriminant > 1:
//        let x1 = ((-bCoefficient! + sqrt(discriminant)) / (2 * aCoefficient!))
//        let x2 = ((-bCoefficient! - sqrt(discriminant)) / (2 * aCoefficient!))
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant > 0, there are two roots.\nFirst root = \(x1), second root = \(x2).\n")
//    case _ where discriminant < -1:
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant is negative, therefore there are no real roots.\n")
//    default: print("There is some error in switch with discriminant")
//    }
//// if one coefficient is equal to "nil", then the program will say about it and indicate in which specific constant with the coefficient it is necessary to write the data
//} else if aCoefficient == nil {
//    print("Coefficient a = nil, please enter a value for coefficient a.\n")
//    }
//    if bCoefficient == nil {
//        print("Coefficient b = nil, please enter a value for coefficient b.\n")
//        }
//    if cCoefficient == nil {
//        print("Coefficient c = nil, please enter a value for coefficient c.\n")
//        }
//
//// 2nd exercise "Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle."
//print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//// using Optional<Double> type to check to be able to check that all constants have values
//let aLeg: Double? = 15
//let bLeg: Double? = 20
//// using "if" to check that all constants have values and that they are not equal to 0
//if aLeg != nil && bLeg != nil && aLeg != 0 && bLeg != 0 {
//    let hypotenuse = (pow (aLeg!, 2) + pow (bLeg!, 2)).squareRoot()
//    let rectanglePerimeter = aLeg! + bLeg! + hypotenuse
//    var rectangleArea = (aLeg! + bLeg! + hypotenuse) / 2
//    rectangleArea = (rectangleArea * (rectangleArea - aLeg!) * (rectangleArea - bLeg!) * (rectangleArea - hypotenuse)).squareRoot()
//    print("In a triangle in which leg a = \(aLeg!), leg b = \(bLeg!):" +
//          "\nhypotenuse = \(hypotenuse)," +
//          "\nperimeter = \(rectanglePerimeter)," +
//          "\narea = \(rectangleArea).\n")
//// if one constant is equal to "nil" or 0, then the program will say about it and indicate in which specific constant it is necessary to write correct the data
//} else if aLeg == nil {
//    print("Leg a = nil, please enter a value for leg a.\n")
//    }
//if bLeg == nil {
//    print("Leg b = nil, please enter a value for leg b.\n")
//        }
//if aLeg == 0 {
//    print("Leg a = 0, please enter a right value for leg a.\n")
//        }
//if bLeg == 0 {
//    print("Leg b = 0, please enter a right value for leg b.\n")
//       }
//
//// 3rd "The user enters the amount of the deposit to the bank and the annual percentage. Find the deposit amount after 5 years"
//print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//print("Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
//      "not a not a comma to separate the integer and non-integer part.)\n")
//print("Enter the amount of the deposit please")
//let initialDepositFromUser = readLine()
//print("Enter annual percentage please")
//let annualPercentageFromUser = readLine()
//// using "if" and "Optional Binding" to safely get values ​​from keyboard input
//if let doubleDeposit = Double(initialDepositFromUser!), let doublePercentage = Double(annualPercentageFromUser!) {
//    let finalDeposit = doubleDeposit + doubleDeposit * (doublePercentage / 100) * 5
//    print("\ninitial deposit = \(doubleDeposit)," +
//          "\nannual percetage = \(doublePercentage)%," +
//          "\nafter five years the deposit will be = \(finalDeposit)," +
//          "\nprofit will be = \(finalDeposit - doubleDeposit).\n")
//// if the user does not enter numbers, the program will tell him about it. This is implemented for security. If this functionality is not implemented and the user enters something other than numbers, then the program will crash.
//} else {
//    print("\nYou had entered no number, please restart the program and enter a number." +
//          " Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
//          "not a not a comma to separate the integer and non-integer part.)\n")
//}








//var a = [1, 2, 3]
//if a.isEmpty == false{
//    print("123")
//    print(a)
//} else {
//    print("321")
//}
  

//func1 func checkDivisionBy3(number: Int) {
//    if number % 3 == 0 && number == 0 {
//        print("Dividing zero by any number gives a remainder of 0.")
//        break mainLooap
//    }
//    if number % 3 == 0 {
//        print("The number \(number) can be divisible by 3 without a remainder")
//    } else {
//        print("The number \(number) cannot be divisible by 3 without a remainder.")
//    }
//}

//func checkDivisionBy3(number: Int) {
//    switch number {
//    case _ where number % 3 == 0 && number == 0:
//        print("Dividing zero by any number gives a remainder of 0.")
//        break
//    case _ where number % 3 == 0:
//        print("The number \(number) can be divisible by 3 without a remainder")
//    case _ where number % 3 != 0:
//        print("The number \(number) cannot be divisible by 3 without a remainder.")
//    default:
//        print("An error has occurred.")
//    }
//    }
