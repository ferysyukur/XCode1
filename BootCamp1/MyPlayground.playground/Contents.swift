//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

typealias tesTupple = (id: Int, name: String)

var vari: tesTupple = (id:1, name: "Fery")

print(vari.id)
print(vari.name)

let str2: String = "String 2"

print(vari.name + " " + str2)
print("\(vari.id), \(str2)")

//MARK: Array

var name: [String] = ["var1", "var2", "var3"]
print(name[0])


var anyVar: [Any] = ["any 1", 2, false]

func validasiNil(str: String?) -> String{
    defer {
        print("eksekusi")
    }
    
    guard let strNew = str else { return "" }
    
    return strNew
}

func validasiIF(str: String?) -> String{
    if let strNew = str{
        return strNew
    }
    return ""
}

print(validasiNil(str: "Validasi Nil"))
print(validasiIF(str: "Validasi If"))

//MARK: - Dictionary
var numberOfleg: [String: Int] = ["ant": 6, "snake": 8, "cat":4]
print(numberOfleg["ant"])
print(numberOfleg["snake"])
numberOfleg["snake"] = 1000
print(numberOfleg["snake"])

// - Looping
for number in 1...5{
    print(number)
}

for number2 in anyVar{
    print(number2)
}

for (index, value) in anyVar.enumerated(){
    print("\(index), \(value)")
}

for value in numberOfleg{
print("\(value.key), \(value.value)")}

for number in 1...20{
    if number>=10 {
        break
    }
    
    if number % 2 == 0{
        continue
    }
    print(number)
}

// - Struct

struct Movie{
    var id: Int
    var title: String
    var genre: String
    var genap: Bool
    
    init(id: Int, title: String, genre: String){
        self.id = id
        self.title = title
        self.genre = genre
        
        self.genap = id % 2 == 0 ? true : false
    }
}

let movies: [Movie] = [Movie(id: 1, title: "Movie 1", genre: "Horror"),Movie(id: 2, title: "Movie 2", genre: "Horror")]

// - Enum

enum Warna{
    case putih
    case merah
    case hitam
    
    var desc: String{
        switch self {
        case .merah:
            return "Ini Warna Merah"
        default:
            return "Ini Warna Lain"
        }}
    
}

var warna : Warna = .putih

switch warna {
case .putih:
    print("Ini Putih")
default:
    break
}

print(warna.desc)