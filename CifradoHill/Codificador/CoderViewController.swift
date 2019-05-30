//
//  CoderViewController.swift
//  CifradoHill
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 5/7/19.
//  Copyright © 2019 Manuel Alejandro Aguilar Tellez Giron. All rights reserved.
//

import UIKit

var alphabet = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ1234567890!·$%&/()=|@#¢∞¬÷“”≠\"áéíóúäëöüïç🔥👅🍆💦🍑🤤👌👈"
var key = [
    [1, 0, 6],
    [2, 4, 1],
    [4, 0, 3]
]

//var everyScalar: [[Int]] = []
var alphabetSplited = splitEmpty(word: alphabet)

class CoderViewController: UIViewController {
    @IBOutlet weak var normalPhrase: UITextField!
    @IBOutlet weak var secretText: UILabel!
    
    @IBAction func lets_magic(_ sender: Any) {
        let cleanedVector = splitEmpty(word: normalPhrase.text!)
        //13, 1, 14, 22, 5, 12
        let allOfScalars = knowScalar(cleanedVector: cleanedVector)
        let everyScalar = split_all_scalars(allScalars: allOfScalars)
        let scalar = is_not_empty(everyScalar: everyScalar)
        let newScalars = matrix_multiplication(key: key, allScalars: scalar)
        let hillString = create_hill_string(newScalars: newScalars)
        
        secretText.text = hillString
        //secretText.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /*
        for i in normalPhrase.text!.split(separator: " ") {
            preMatrix.append(String(i))
        }
    */
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
    }
    
}


func splitEmpty(word: String) -> [String] {
    var array: [String] = []
    for i in word {
        if i == " "{
            continue
        } else {
            array.append(String(i))
        }
    }
    
    return array
}

func knowScalar(cleanedVector: [String]) -> [Int] {
    var arr: [Int] = []
    var count = 0
    
    
    for i in 0...(cleanedVector.count - 1) {
        for j in alphabetSplited {
            count += 1
            if cleanedVector[i] == j {
                arr.append(count)
            }
        }
        count = 0
    }
    
    return arr
}

func split_all_scalars(allScalars: [Int]) -> [[Int]] {
    var count = 0
    var temporalArray: [Int] = []
    var everyScalar: [[Int]] = []
    
    for i in allScalars {
        count += 1
        temporalArray.append(i)
        if count % 3 == 0 {
            everyScalar.append(temporalArray)
            temporalArray = []
        }
    }
    if (temporalArray.count != 0){
        everyScalar.append(temporalArray)
    }
    
    return everyScalar
}

func matrix_multiplication(key: [[Int]], allScalars: [[Int]]) -> [Int] {
    var k = 0
    var newScalar = 0
    var newScalars: [Int] = []
    
    while(k <= (allScalars.count - 1)){
        for i in 0..<3 {
            for j in 0..<3{
                newScalar += key[i][j] * allScalars[k][j]
                newScalar %= 27
            }
            newScalars.append(newScalar + 1)
            newScalar = 0
        }
        k += 1
    }
    return newScalars
}


func create_hill_string(newScalars: [Int]) -> String {
    var count = 0
    var newString: String = ""
    
    for i in newScalars {
        for j in alphabetSplited {
            count += 1
            if i == count {
                newString += j
            }
        }
        print(newString)
        count = 0
    }
    
    return newString
}


func is_not_empty(everyScalar: [[Int]]) -> [[Int]] {
    var localEveryScalar = everyScalar
    
    for i in 0..<(localEveryScalar.count) {
        while (localEveryScalar[i].count < 3) {
            localEveryScalar[i].append(11)
        }
    }
    
    return localEveryScalar
}
/*
func nGrama(textField: UITextField) -> Int {
    var n = 0
    
    guard let text = textField.text else {
        return 0
    }
    
    let len = text.count
    
    for i in 1...9 {
        if (len % i) == 0 {
            n = i
        }
    }
    
    return n
}*/
