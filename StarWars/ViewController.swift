//
//  ViewController.swift
//  StarWars
//
//  Created by Thang David Do (Étudiant) on 18-04-21.
//  Copyright © 2018 Thang David Do (Étudiant). All rights reserved.
//

import UIKit
import Alamofire
//import ObjectMapper

class ViewController: UIViewController {
    
    let baseURL = "https://swapi.co/api/"
    let getPersonEndpoint = "people/"
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var massLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getPersonURL = URL(string: baseURL+getPersonEndpoint)!
        Alamofire.request(getPersonURL).responseJSON{ response in
//        Alamofire.request(getPersonURL, method: .post).responseJSON{ response in

            
            //callback, completion, completionHandler
            
            //            print(response)
            
            //            let result = response.result
            //            print(result)
            
            
            //            if response.result.isSuccess{
            //                print("It's a success!!")
            //            }else{
            //                print("It's a success..oh wait it's not")
            //            }
            
            print("It is "+(response.result.isSuccess ? "" : "not")+"a success..")
            
            let json = response.value
            print(json)
            
        }
        
        let person = Person("Luke")
        let person2 = Person(firstName: "Luca", height: 160)
        let person3 = Person("Luc", height:160, hairColor: .black)
 //        print(person)
        //        print(person.getName())
        
        nameLabel.text = person.name;
        heightLabel.text = "\(person.height)";
        massLabel.text = String(person.mass);
        genderLabel.text = person.gender;
        
        print("Hair-->" + person.hairColor.rawValue)
    }
}

struct Person {
    //    private var name="Unknown"
    //    private var height=0
    //    private var mass=0
    //    private var hairColor="Unknown"
    //    private var eyeColor="Unknown"
    //    private var skinColor="Unknown"
    //    private var gender="Unknown"
    //    private var homeworld="Unknown"
    
    var name="Unknown"
    var height=0
    var mass=0
    var hairColor:HairColor = .light
    var eyeColor="Unknown"
    var skinColor="Unknown"
    var gender="Unknown"
    var homeworld="Unknown"
    
    //    init(){}
    init(_ name: String){
        self.name = name
        self.hairColor = HairColor.brown
 }
    init(firstName name: String, height: Int){
        self.name = name
        self.height = height
    }
    init(_ name: String, height: Int, hairColor: HairColor = .blond){
        self.name = name
        self.height = height
        self.hairColor = hairColor
    }
    
    
    
    func getName() -> String{
        return self.name
    }
    
    //    "birth_year": "19BBY",
    //    "created": "2014-12-09T13:50:51.644000Z",
    //    "edited": "2014-12-20T21:17:56.891000Z",
    //    "eye_color": "blue",
    //    "films": [
    //    "https://swapi.co/api/films/2/",
    //    "https://swapi.co/api/films/6/",
    //    "https://swapi.co/api/films/3/",
    //    "https://swapi.co/api/films/1/",
    //    "https://swapi.co/api/films/7/"
    //    ],
    //    "gender": "male",
    //    "hair_color": "blond",
    //    "height": "172",
    //    "homeworld": "https://swapi.co/api/planets/1/",
    //    "mass": "77",
    //    "name": "Luke Skywalker",
    //    "skin_color": "fair",
    //    "species": [
    //    "https://swapi.co/api/species/1/"
    //    ],
    //    "starships": [
    //    "https://swapi.co/api/starships/12/",
    //    "https://swapi.co/api/starships/22/"
    //    ],
    //    "url": "https://swapi.co/api/people/1/",
    //    "vehicles": [
    //    "https://swapi.co/api/vehicles/14/",
    //    "https://swapi.co/api/vehicles/30/"
    //    ]
    
}
enum HairColor:String{
    case light = "Light"
    case brown = "Brown"
    case black = "Black"
    case blond = "Blond"
}
