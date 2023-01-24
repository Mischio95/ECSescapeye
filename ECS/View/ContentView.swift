//
//  ContentView.swift
//  ECS
//
//  Created by Michele Trombone  on 10/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var storeNation = StoreData()
    @ObservedObject var countries = CountriesData()
    var dataController: DataController
    
    var body: some View {
        TabView
        {
            CityView(storeNation: storeNation,currentCity: storeNation.nations[0].city[0], countries: countries)
                .tabItem
            {
                Image(systemName: "house")
                Text("City")
            }
            
            UserView(storeNation: storeNation, dataController: dataController)
                .tabItem
            {
                Label("User", systemImage: "person")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View
    {
        ContentView(storeNation: StoreData(), dataController: DataController())
    }
}
