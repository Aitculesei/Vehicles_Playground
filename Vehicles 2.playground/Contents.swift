import UIKit

class Car: Vehicle {
    private var name: String = ""
    private var fuelPercentage: Float = Float.random(in: 0...100)
    private var maxSpeed: Double

    init(name: String, maxSpeed: Double) {
        self.name = name
        self.maxSpeed = maxSpeed
    }

    func fillFuel() {
        print("Fuel of \(name) to 100%")
        fuelPercentage = 100
    }

    func getName() -> String {
        self.name
    }

    func getFuel() -> Float {
        self.fuelPercentage
    }
    
    func getMaxSpeed() -> Double {
        if (self.getName() == "Alfa Romeo") {
            print("Nothing is far when you are VELOCE!")
        }
        return self.maxSpeed
    }

    func mountABikeRack() {
        print("Mounted a bike rack on the \(self.name)")
    }
}

class Motorcicle: Vehicle {
    private var name: String = ""
    private var fuelPercentage: Float = Float.random(in: 0...100)
    private var maxSpeed: Double

    init(name: String, maxSpeed: Double) {
        self.name = name
        self.maxSpeed = maxSpeed
    }

    func fillFuel() {
        print("Fuel of \(name) to 100%")
        fuelPercentage = 100
    }

    func getName() -> String {
        self.name
    }

    func getFuel() -> Float {
        self.fuelPercentage
    }
    
    func getMaxSpeed() -> Double {
        if (self.getName() == "Alfa Romeo") {
            print("Nothing is far when you are VELOCE!")
        }
        return self.maxSpeed
    }

    func doAWheele() {
        print("Did a wheele with the \(name)")
    }
}

class Plane: Vehicle {
    private var name: String = ""
    private var fuelPercentage: Float = Float.random(in: 0...100)
    private var maxSpeed: Double

    init(name: String, maxSpeed: Double) {
        self.name = name
        self.maxSpeed = maxSpeed
    }

    func fillFuel() {
        print("Fuel of \(name) to 100%")
        fuelPercentage = 100
    }

    func getName() -> String {
        self.name
    }

    func getFuel() -> Float {
        self.fuelPercentage
    }
    
    func getMaxSpeed() -> Double {
        if (self.getName() == "Alfa Romeo") {
            print("Nothing is far when you are VELOCE!")
        }
        return self.maxSpeed
    }
    
    func checkWings() {
        print("""
              
              For the \(self.name) airplane: The secret of great wings? RedBull!
              Checked! ☑️
              """)
    }
}

class FuelStation {
    private var vehicles: [Vehicle] = []

    init(vehicle: Vehicle) {
        vehicles = [Vehicle]()
        vehicles.append(vehicle)
        print("Vehicle \(vehicle.getName()) entered the fuel station with fuel percentage \(vehicle.getFuel()). It's the first one!")
    }

    func fillupVehicle(_ vehicle: Vehicle) {
        let currentFuelLevel =  vehicle.getFuel()
        if (currentFuelLevel < 70.0) {
            vehicle.fillFuel()
        } else if (currentFuelLevel == 100.0) {
            print("Vehicle \(vehicle.getName()) does not need fuel!")
        } else {
            print("Filling vehicle \(vehicle.getName())...")
        }
    }
    
    func fillupAllVehicle() {
        for vehicle in vehicles {
            self.fillupVehicle(vehicle)
        }
    }
    
    func addAnotherVehicleToTheFuelStation(_ vehicle: Vehicle) {
        vehicles.append(vehicle)
        print("Vehicle \(vehicle.getName()) entered the fuel station with fuel percentage \(vehicle.getFuel()).")
    }
}


let car1 = Car(name: "Ferrari", maxSpeed: 340.0)
let fuel = FuelStation(vehicle: car1)
fuel.fillupVehicle(car1)
let car2 = Car(name: "Audi", maxSpeed: 215.0)
fuel.addAnotherVehicleToTheFuelStation(car2)
fuel.fillupVehicle(car2)
car2.cleanVehicle()

let motorcycle1 = Motorcicle(name: "BMW", maxSpeed: 330.0)
let fuelMotorcycle = FuelStation(vehicle: motorcycle1)
fuelMotorcycle.fillupVehicle(motorcycle1)

let plane1 = Plane(name: "WizzA(i)rd", maxSpeed: 2430.109)
let fuelPlane = FuelStation(vehicle: plane1)
fuelPlane.fillupVehicle(plane1)
print("Max speed for \(plane1.getName()) is: \(plane1.getMaxSpeed())")
plane1.checkWings()
plane1.takeoff()
let plane2 = Plane(name: "Alfa Romeo", maxSpeed: 1355.0)
print("Max speed for \(plane2.getName()) is: \(plane2.getMaxSpeed())")
plane2.checkWings()
plane2.takeoff()

/// Task1: Allow the Fuel Station to take in motorcycles. Use protocols
/// Task2: Create a new type of vehicle named Plane. It's suppose to have the getFuel(), fillFuel() and getName() functionality as long as a checkWings() functionality that is just gonna print something. Allow the Fuel station to take in Planes
/// Task3: Expand your Fuel Stations. Add more slots for vehicles.
/// Task4: Allow vehicles with more than 70% of fuel to enter, but do not allow them to fuel up. Print the respective message: "Filling vehicle {name}" or "Vehicle {name} does not need fuel"
/// Task5: Product owner wants a new functionality. Add a cleanVehicle() functionality with just a print. Add takeoff() functionality to plane. Use extensions
/// Task6: PO wants another functionality. Add getMaxSpeed() of each vehicle. The max speed will be set at Vehicle init.

/// Good read: Inheritence vs protocols: https://medium.com/@sambitprakash/protocol-vs-inheritance-b4bb4817bb5d

protocol Vehicle {
    func fillFuel()
    func getName() -> String
    func getFuel() -> Float
    func getMaxSpeed() -> Double
}

extension Vehicle {
    func cleanVehicle() {
        print("Vehicle \(self.getName()) was cleaned!")
    }
}

extension Plane {
    func takeoff() {
        print("Plane \(self.getName()) is taking off... 🛫")
    }
}
