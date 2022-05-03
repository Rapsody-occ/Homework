//
//  main.swift
//  lessonOne
//
//  Created by user on 4/12/22.
//

import Foundation
//
//        3RD HOMEWORK
//
// was created enums for structure propeties, because it is very convenient
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

enum ManufactureYear: Int {
    case my2000 = 2000
    case my2001 = 2001
    case my2002 = 2002
    case my2003 = 2003
    case my2004 = 2004
    case my2005 = 2005
    case my2006 = 2006
    case my2007 = 2007
    case my2008 = 2008
    case my2009 = 2009
    case my2010 = 2010
    case my2011 = 2011
    case my2012 = 2012
    case my2013 = 2013
    case my2014 = 2014
    case my2015 = 2015
    case my2016 = 2016
    case my2017 = 2017
    case my2018 = 2018
    case my2019 = 2019
    case my2020 = 2020
    case my2021 = 2021
    case my2022 = 2022
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

enum EngineType: String {
    case petrol = "petrol"
    case diesel = "diesel"
    case electric = "electric"
}

enum HybridSistem: String {
    case noHybridSistem = "no hybrid sistem"
    case hev = "HEV"
    case phev = "PHEV"
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

// 3rd exercise "Describe the enumeration with possible actions with the car: start/stop the engine, open/close windows, load/unload cargo of a certain volume from the body/trunk."
enum EngineState: String {
    case off = "off"
    case on = "on"
}

enum DoorsLockUnlock: String {
    case lock = "lock"
    case unlock = "unlock"
}

enum WindowsLockUnlock: String {
    case lock = "lock"
    case unlock = "unlock"
}

enum CargoHandling: Int {
    case load
    case unload
}

// 1st exercise "Describe several structures - any SportCar and any TrunkCar."
// 2nd exercise "The structures should contain the make of the car, the year of manufacture, the volume of the trunk / body, whether the engine is running, whether the windows are open, the volume of the trunk filled."
// structures were created and described
struct SportCar {
    let carBrand: CarBrand
    let carModel: CarModel
    let carEquipment: CarEquipment
    let manufactureYear: ManufactureYear
    let bodyType: BodyType
    let engineType: EngineType
    let hybridSistem: HybridSistem
    let transmissionType: TransmissionType
    let bodyColor: BodyColor
    var engineState: EngineState
    var doorsLockUnlock: DoorsLockUnlock
    var windowsLockUnlock: WindowsLockUnlock
    let volumeInterior: Double
    var interiorFullnes: Double
    let volumeTrunk: Double
    var trunkFullnes: Double
    var engineOilResource: Double = 0
    var engineOilLamp: Bool = false
    var mileage: Double {
            didSet {
                print("Mileage data has been updated. The total mileage is \(mileage).")
                let distance = mileage - oldValue
                engineOilResource += distance
                if engineOilResource > 7999 && engineOilResource < 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
                    engineOilLamp = true
                    }
                if engineOilResource > 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
                    engineOilLamp = true
                }
            }
        }
    
// 4th exercise "Add a method to the structure with an enum type argument that will change the properties of the structure depending on the action."
// different methods were created and added to change the structure properties
    mutating func engineOilChange() {
        engineOilResource = 0
        engineOilLamp = false
        print("Oil change check has been reset")
        }

    mutating func engineOn() {
        switch self.engineState {
        case _ where self.engineState == .off:
            engineState = .on
            print("Now engine is on.")
        case _ where engineState == .on:
            print("Error: The engine is already on.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func engineOff() {
        switch self.engineState {
        case _ where self.engineState == .on:
            engineState = .off
            print("Now the engine is off.")
        case _ where engineState == .off:
            print("Error: The engine is already off.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .unlock:
            doorsLockUnlock = .lock
            print("Now the doors are locked.")
        case _ where doorsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .lock:
            doorsLockUnlock = .unlock
            print("Now the doors are unlocked.")
        case _ where doorsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .unlock:
            windowsLockUnlock = .lock
            print("Now the windows are locked.")
        case _ where windowsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .lock:
            windowsLockUnlock = .unlock
            print("Now the windows are unlocked.")
        case _ where windowsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
                  " You cannot unload more than \(trunkFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            trunkFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            trunkFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
                  " You cannot unload more than \(interiorFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            interiorFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            interiorFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

// 6th exercise "Print instance property values ​​to the console."
// a method was created for a optimize output to the console of data about a structure instance
    func printInConsole() {
        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
              "Brand: \(carBrand.rawValue)\n" +
              "Model: \(carModel.rawValue)\n" +
              "Equipment: \(carEquipment.rawValue)\n" +
              "Manufacture year: \(manufactureYear.rawValue)\n" +
              "Body type: \(bodyType.rawValue)\n" +
              "Engine type: \(engineType.rawValue)\n" +
              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
              "Transmission type: \(transmissionType.rawValue)\n" +
              "Body color: \(bodyType.rawValue)\n" +
              "Engine state: \(engineState.rawValue)\n" +
              "Doors state: \(doorsLockUnlock.rawValue)\n" +
              "Windows state: \(windowsLockUnlock.rawValue)\n" +
              "Volume of interior: \(volumeInterior)\n" +
              "Interior fullnes: \(interiorFullnes)\n" +
              "Volume of trunk: \(volumeTrunk)\n" +
              "Trunk fullnes: \(trunkFullnes)\n" +
              "Mileage: \(mileage)\n" +
              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
        )
              switch engineOilLamp {
              case _ where engineOilLamp == false:
                  print("(The oil resource in the engine is within acceptable limits.)\n")
              case _ where engineOilLamp == true:
                  print("(The engine oil needs to be changed.)\n")
              default:
                  print("There is some error in function.\n")
        }
    }

    mutating func addMileage(lastTripMileage: Double) {
        mileage += lastTripMileage
    }

    func engineOilCheck() {
            switch engineOilResource {
            case _ where engineOilResource < 7999:
                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
            case _ where engineOilResource > 7999 && engineOilResource < 9999:
                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
            case _ where engineOilResource > 9999:
                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
            default: print("There is some error.")
                }
        }
}

struct TrunkCar {
    let carBrand: CarBrand
    let carModel: CarModel
    let carEquipment: CarEquipment
    let manufactureYear: ManufactureYear
    let bodyType: BodyType
    let engineType: EngineType
    let hybridSistem: HybridSistem
    let transmissionType: TransmissionType
    let bodyColor: BodyColor
    var engineState: EngineState
    var doorsLockUnlock: DoorsLockUnlock
    var windowsLockUnlock: WindowsLockUnlock
    let volumeInterior: Double
    var interiorFullnes: Double
    let volumeTrunk: Double
    var trunkFullnes: Double
    var engineOilResource: Double = 0
    var engineOilLamp: Bool = false
    var mileage: Double {
            didSet {
                print("Mileage data has been updated. The total mileage is \(mileage).")
                let distance = mileage - oldValue
                engineOilResource += distance
                if engineOilResource > 7999 && engineOilResource < 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
                    engineOilLamp = true
                    }
                if engineOilResource > 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
                    engineOilLamp = true
                }
            }
        }

    mutating func engineOilChange() {
        engineOilResource = 0
        engineOilLamp = false
        print("Oil change check has been reset")
        }

    mutating func engineOn() {
        switch self.engineState {
        case _ where self.engineState == .off:
            engineState = .on
            print("Now engine is on.")
        case _ where engineState == .on:
            print("Error: The engine is already on.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func engineOff() {
        switch self.engineState {
        case _ where self.engineState == .on:
            engineState = .off
            print("Now the engine is off.")
        case _ where engineState == .off:
            print("Error: The engine is already off.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .unlock:
            doorsLockUnlock = .lock
            print("Now the doors are locked.")
        case _ where doorsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .lock:
            doorsLockUnlock = .unlock
            print("Now the doors are unlocked.")
        case _ where doorsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .unlock:
            windowsLockUnlock = .lock
            print("Now the windows are locked.")
        case _ where windowsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .lock:
            windowsLockUnlock = .unlock
            print("Now the windows are unlocked.")
        case _ where windowsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
                  " You cannot unload more than \(trunkFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            trunkFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            trunkFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
                  " You cannot unload more than \(interiorFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            interiorFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            interiorFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

    func printInConsole() {
        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
              "Brand: \(carBrand.rawValue)\n" +
              "Model: \(carModel.rawValue)\n" +
              "Equipment: \(carEquipment.rawValue)\n" +
              "Manufacture year: \(manufactureYear.rawValue)\n" +
              "Body type: \(bodyType.rawValue)\n" +
              "Engine type: \(engineType.rawValue)\n" +
              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
              "Transmission type: \(transmissionType.rawValue)\n" +
              "Body color: \(bodyType.rawValue)\n" +
              "Engine state: \(engineState.rawValue)\n" +
              "Doors state: \(doorsLockUnlock.rawValue)\n" +
              "Windows state: \(windowsLockUnlock.rawValue)\n" +
              "Volume of interior: \(volumeInterior)\n" +
              "Interior fullnes: \(interiorFullnes)\n" +
              "Volume of trunk: \(volumeTrunk)\n" +
              "Trunk fullnes: \(trunkFullnes)\n" +
              "Mileage: \(mileage)\n" +
              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
        )
              switch engineOilLamp {
              case _ where engineOilLamp == false:
                  print("(The oil resource in the engine is within acceptable limits.)\n")
              case _ where engineOilLamp == true:
                  print("(The engine oil needs to be changed.)\n")
              default:
                  print("There is some error in function.\n")
        }
    }

    mutating func addMileage(lastTripMileage: Double) {
        mileage += lastTripMileage
    }

    func engineOilCheck() {
            switch engineOilResource {
            case _ where engineOilResource < 7999:
                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
            case _ where engineOilResource > 7999 && engineOilResource < 9999:
                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
            case _ where engineOilResource > 9999:
                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
            default: print("There is some error.")
                }
        }
}

struct Car {
    let carBrand: CarBrand
    let carModel: CarModel
    let carEquipment: CarEquipment
    let manufactureYear: ManufactureYear
    let bodyType: BodyType
    let engineType: EngineType
    let hybridSistem: HybridSistem
    let transmissionType: TransmissionType
    let bodyColor: BodyColor
    var engineState: EngineState
    var doorsLockUnlock: DoorsLockUnlock
    var windowsLockUnlock: WindowsLockUnlock
    let volumeInterior: Double
    var interiorFullnes: Double
    let volumeTrunk: Double
    var trunkFullnes: Double
    var engineOilResource: Double = 0
    var engineOilLamp: Bool = false
    var mileage: Double {
            didSet {
                print("Mileage data has been updated. The total mileage is \(mileage).")
                let distance = mileage - oldValue
                engineOilResource += distance
                if engineOilResource > 7999 && engineOilResource < 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km.")
                    engineOilLamp = true
                    }
                if engineOilResource > 9999 {
                    print("Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately.")
                    engineOilLamp = true
                }
            }
        }

    mutating func engineOilChange() {
        engineOilResource = 0
        engineOilLamp = false
        print("Oil change check has been reset")
        }

    mutating func engineOn() {
        switch self.engineState {
        case _ where self.engineState == .off:
            engineState = .on
            print("Now engine is on.")
        case _ where engineState == .on:
            print("Error: The engine is already on.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func engineOff() {
        switch self.engineState {
        case _ where self.engineState == .on:
            engineState = .off
            print("Now the engine is off.")
        case _ where engineState == .off:
            print("Error: The engine is already off.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .unlock:
            doorsLockUnlock = .lock
            print("Now the doors are locked.")
        case _ where doorsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockDoors() {
        switch self.doorsLockUnlock {
        case _ where self.doorsLockUnlock == .lock:
            doorsLockUnlock = .unlock
            print("Now the doors are unlocked.")
        case _ where doorsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func lockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .unlock:
            windowsLockUnlock = .lock
            print("Now the windows are locked.")
        case _ where windowsLockUnlock == .lock:
            print("Error: The doors is already locked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func unlockWindows() {
        switch self.windowsLockUnlock {
        case _ where self.windowsLockUnlock == .lock:
            windowsLockUnlock = .unlock
            print("Now the windows are unlocked.")
        case _ where windowsLockUnlock == .unlock:
            print("Error: The doors is already unlocked.")
        default:
            print("There is some error in function.")
        }
    }

    mutating func loadingUnloadingTrunk(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + trunkFullnes) > volumeTrunk:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeTrunk < (cargoWeight + trunkFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeTrunk - trunkFullnes) kg. Please unload \(cargoWeight - (volumeTrunk - trunkFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > trunkFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(trunkFullnes) kg." +
                  " You cannot unload more than \(trunkFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            trunkFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            trunkFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

    mutating func loadingUnloadingInterior(loadingOrUnloading: CargoHandling, cargoWeight: Double) {
        switch cargoWeight {
        case _ where loadingOrUnloading == .load && (cargoWeight + interiorFullnes) > volumeInterior:
            print("Error: cargo was not loaded. (The trunk is full. Please unload \(cargoWeight - (volumeInterior - interiorFullnes))" +
                  " kg from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .load && volumeInterior < (cargoWeight + interiorFullnes):
            print("Error: cargo was not loaded. (Not enough space in trunk for this cargo, now you can put only" +
                  " \(volumeInterior - interiorFullnes) kg. Please unload \(cargoWeight - (volumeInterior - interiorFullnes)) kg" +
                  " from the trunk to load your cargo that weighs \(cargoWeight) kg.)")
        case _ where loadingOrUnloading == .unload && cargoWeight > interiorFullnes:
            print("Error: cargo was not unloaded. (In the trunk is a load weighing \(interiorFullnes) kg." +
                  " You cannot unload more than \(interiorFullnes) kg.)")
        case _ where loadingOrUnloading == .load:
            interiorFullnes += cargoWeight
        case _ where loadingOrUnloading == .unload:
            interiorFullnes -= cargoWeight
        default:
            print("There is some error in load function.")
        }
    }

    func printInConsole() {
        print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Transport unit ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n" +
              "Brand: \(carBrand.rawValue)\n" +
              "Model: \(carModel.rawValue)\n" +
              "Equipment: \(carEquipment.rawValue)\n" +
              "Manufacture year: \(manufactureYear.rawValue)\n" +
              "Body type: \(bodyType.rawValue)\n" +
              "Engine type: \(engineType.rawValue)\n" +
              "Hybrid sistem: \(hybridSistem.rawValue)\n" +
              "Transmission type: \(transmissionType.rawValue)\n" +
              "Body color: \(bodyType.rawValue)\n" +
              "Engine state: \(engineState.rawValue)\n" +
              "Doors state: \(doorsLockUnlock.rawValue)\n" +
              "Windows state: \(windowsLockUnlock.rawValue)\n" +
              "Volume of interior: \(volumeInterior)\n" +
              "Interior fullnes: \(interiorFullnes)\n" +
              "Volume of trunk: \(volumeTrunk)\n" +
              "Trunk fullnes: \(trunkFullnes)\n" +
              "Mileage: \(mileage)\n" +
              "Engine oil state: with the oil in the engine, the vehicle traveled \(engineOilResource) km."
        )
              switch engineOilLamp {
              case _ where engineOilLamp == false:
                  print("(The oil resource in the engine is within acceptable limits.)\n")
              case _ where engineOilLamp == true:
                  print("(The engine oil needs to be changed.)\n")
              default:
                  print("There is some error in function.\n")
        }
    }

    mutating func addMileage(lastTripMileage: Double) {
        mileage += lastTripMileage
    }

    func engineOilCheck() {
            switch engineOilResource {
            case _ where engineOilResource < 7999:
                print("The engine oil resource is normal, the engine oil will need to be changed after no more than \(10000 - engineOilResource) km.")
            case _ where engineOilResource > 7999 && engineOilResource < 9999:
                print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. Change the oil after no more than \(10000 - engineOilResource) km._____")
            case _ where engineOilResource > 9999:
                    print("_____Attention! On this engine oil, the car covered \(engineOilResource) km. The engine oil needs to be changed immediately._____")
            default: print("There is some error.")
                }
        }
}


// 5th exerice "Initialize multiple instances of structures. Apply various actions to them."
// initialize of 4 structures
var nissanZ400 = SportCar(carBrand: .nissan, carModel: .z400, carEquipment: .full, manufactureYear: .my2022, bodyType: .coupe, engineType: .petrol, hybridSistem: .noHybridSistem, transmissionType: .mt, bodyColor: .green, engineState: .off, doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, volumeInterior: 200, interiorFullnes: 0, volumeTrunk: 300, trunkFullnes: 0, engineOilResource: 0, engineOilLamp: false, mileage: 0)

var peterbiltP330 = TrunkCar(carBrand: .peterbilt, carModel: .p330, carEquipment: .individual, manufactureYear: .my2010, bodyType: .truck, engineType: .diesel, hybridSistem: .noHybridSistem, transmissionType: .at, bodyColor: .grey, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .lock, volumeInterior: 300, interiorFullnes: 50, volumeTrunk: 10000, trunkFullnes: 4000, engineOilResource: 8324, engineOilLamp: true, mileage: 512724)

var hondaCivic = Car(carBrand: .honda, carModel: .civic, carEquipment: .full, manufactureYear: .my2022, bodyType: .hatchback, engineType: .petrol, hybridSistem: .hev, transmissionType: .cvt, bodyColor: .red, engineState: .off, doorsLockUnlock: .unlock, windowsLockUnlock: .unlock, volumeInterior: 270, interiorFullnes: 0, volumeTrunk: 500, trunkFullnes: 0, engineOilResource: 0, engineOilLamp: false, mileage: 0)

var toyotaCamry = Car(carBrand: .toyota, carModel: .camry, carEquipment: .midle, manufactureYear: .my2009, bodyType: .sedan, engineType: .petrol, hybridSistem: .hev, transmissionType: .cvt, bodyColor: .black, engineState: .on, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 350, interiorFullnes: 210, volumeTrunk: 600, trunkFullnes: 380, engineOilResource: 326, engineOilLamp: false, mileage: 360473)

var volkswagenTouareg = Car(carBrand: .volkswagen, carModel: .touareg, carEquipment: .base, manufactureYear: .my2021, bodyType: .suv, engineType: .petrol, hybridSistem: .phev, transmissionType: .at, bodyColor: .brown, engineState: .off, doorsLockUnlock: .lock, windowsLockUnlock: .unlock, volumeInterior: 800, interiorFullnes: 279, volumeTrunk: 1000, trunkFullnes: 905, engineOilResource: 9824, engineOilLamp: true, mileage: 82406)

//apply various actions to them.
nissanZ400.loadingUnloadingInterior(loadingOrUnloading: .load, cargoWeight: 20)
peterbiltP330.unlockDoors()
hondaCivic.loadingUnloadingTrunk(loadingOrUnloading: .load, cargoWeight: 100)
toyotaCamry.engineOff()
volkswagenTouareg.lockWindows()

// 6th exercise "Print instance property values ​​to the console."
// information about structures was entered into the console was displayed using the structure method
nissanZ400.printInConsole()
peterbiltP330.printInConsole()
hondaCivic.printInConsole()
toyotaCamry.printInConsole()
volkswagenTouareg.printInConsole()
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
