//
//  main.swift
//  PavelR_lesson3
//
//  Created by Павел on 23.07.2020.
//  Copyright © 2020 Павел. All rights reserved.
//

import Foundation


enum windows: String {
    case open, close
    
    var windowsState: String {
        switch self {
        case .open: return "Окна открыты"
        case .close: return "Окна закрыты"
        
        }
    }
}
enum carTransmition: String {
    case manual = "механической", auto = "автоматической"
}

enum carEngineState: String {
    case started = "запущен", notStarded = "выключен"
}

enum Color: String {
    case yellow = "Желтый ", red = "Красный", black = "Черный", blue = "Синий"
}
struct  car {
    let brand: String
    var color: Color
    let model: String
    let year: Int
    let doors: Int
    let engineType: String
    let engineVolume: Double
    var trunkVolume: Double
  
    // открытие и закрытие окон
    var windows: windows {
        willSet {
            if newValue == .open {
                print("Окна открываютя")
            } else {
                print("Окна закрываются")
            }
        }
    }
    
    let transmition: carTransmition
    //запуск двигателя
    var engineStatus: carEngineState {
        willSet {
            if newValue == .started {
            print("Двигатель запускается")
        } else {
            print("Двигатель выключается")
            }
        }
    }
    
    var carMileage: Double
    
    func printCar() {
        print("Автомобиль марки \(brand) , модель \(model) ,\(color.rawValue) цвет , \(year) года выпуска с \(transmition.rawValue) коробкой передач , с пробегом \(carMileage) км , объем багажника \(trunkVolume)")
        
    }
    mutating func brush(with color: Color) {
        self.color = color
    }

    func printCarStatus() {
        print("У автомобиля \(brand) \(model) \(windows.windowsState) и \(engineStatus.rawValue) двигатель")
    }
    
    
}

var lexus = car(brand: "Lexus", color: .black, model: "RX 350", year: 2020, doors: 5, engineType: "Gasoline", engineVolume: 3, trunkVolume: 500, windows: .open, transmition: .manual, engineStatus: .notStarded, carMileage: 500)

var toyota = car(brand: "Toyota", color: .red, model: "Camry", year: 2018, doors: 4, engineType: "Gasoline", engineVolume: 3.5, trunkVolume: 450, windows: .close, transmition: .manual, engineStatus: .started, carMileage: 1000)

let garage = [lexus, toyota]

lexus.printCar()
lexus.windows = .close
lexus.brush(with: .yellow)
lexus.printCar()
lexus.printCarStatus()
lexus.windows = .open
lexus.printCarStatus()
lexus.windows = .open
toyota.printCar()
toyota.printCarStatus()
toyota.windows = .open
toyota.engineStatus = .notStarded
toyota.printCarStatus()
lexus.windows = .open
lexus.printCarStatus()
toyota.engineStatus = .started
toyota.printCarStatus()
