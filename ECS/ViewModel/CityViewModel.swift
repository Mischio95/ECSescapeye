//
//  CityViewModel.swift
//  ECS
//
//  Created by Kiar on 11/01/23.
//

import Foundation

let firstRegistration = "firstRegistration"
let userDefaults = UserDefaults.standard



var star = "Star"

var newQuestN0 = Quest(title: "Pizza forever", description: "Go to Sorbillo and eat you're favourite pizza!", backgroundImage: "pizza", difficultyLevel: [star], trophy: Trophy.bronze)
var newQuestN1 = Quest(title: "Sfogliatella is the best", description: "Puff pastry Curly Neapolitans are a typical dessert of the Neapolitan pastry tradition, just like the PUFF PASTRY NEAPOLITAN, it was a lifetime that I wanted to prepare them and finally I made it, I do not hide that they are not really fast, but on the other hand if we want to enjoy a good homemade curly puff pastry we must arm ourselves with patience.", backgroundImage: "sfogliatella", difficultyLevel: [star,star], trophy: Trophy.bronze)
var newQuestN2 = Quest(title: "Sant'Elmo's way", description: "Castel Sant'Elmo is a medieval castle, used as a museum, located on the hill of Vomero near San Martino in Naples. Once it was called Paturcium and rises in the place where there was, starting from the tenth century, a church dedicated to Sant'Erasmo (from which Eramo, Ermo and then Elmo).", backgroundImage: "elmo", difficultyLevel: [star,star], trophy: Trophy.silver)
var newQuestN3 = Quest(title: "Big Culture!", description: "Visit the Man!", backgroundImage: "culture", difficultyLevel: [star,star,star,star,star], trophy: Trophy.gold)

var napoli = City(name: "Napoli", description: "A città chiù bella do munno!", background: "Napoli", quests: [newQuestN0, newQuestN1, newQuestN2,newQuestN3])
var mialno = City(name: "Milano", description: "Città di Milano", background: "Mialno", quests: [newQuestN0, newQuestN1, newQuestN2,newQuestN3])
var torino = City(name: "Torino", description: "Città di Torino", background: "Torino", quests: [newQuestN0, newQuestN1, newQuestN2,newQuestN3])


var italy = Nation(name: "Italy", backgroundImage: "Italy", city: [napoli, mialno, torino])
var holland = Nation(name: "Holland", backgroundImage: "Holland", city: [napoli, mialno, torino])

class StoreData: ObservableObject
{
    @Published var nations: [Nation] = [italy, holland]
    @Published var cityApi: CityApi?
    var user = User()
}

//MARK: USER VIEW
extension StoreData
{
    func showVisitatedNations()
    {
        for nationIndex in 0..<nations.count
        {
            if(nations[nationIndex].visited)
            {
                //Show nation visited
            }
        }
    }

    func showCitiesVisited(nation: Nation)
    {
        for cityIndex in 0..<nation.city.count
        {
            if(nation.city[cityIndex].visited)
            {
                //Show city visited
            }
        }
    }
    
    func showCompletedQuests(city: City)
    {
        for questIndex in 0..<city.quests.count
        {
            if(city.quests[questIndex].completed)
            {
                //Show completed quest
            }
        }
    }
    
    func chowCompletedCities(city: City)
    {
        for questIndex in 0..<city.quests.count
        {
            if(city.quests[questIndex].completed)
            {
                //Show completed quest
            }
        }
    }
    
    func changeUserName()
    {
        
    }
    
    func changeUserImage()
    {
        
    }
}


//MARK: MAIN PAGE
extension StoreData
{
    func showAllNations()
    {
        for nationIndex in 0..<nations.count
        {
            //Show all nations
        }
    }
    
    func showAllCities(nation: Nation) //-> String
    {
        for cityIndex in 0..<nation.city.count
        {
            //Show All cities of a selectedNation
        }
    }
    
    func showQuestImage(city: City, questIndex: Int) -> String
    {
        return city.quests[questIndex].backgroundImage
    }
}




