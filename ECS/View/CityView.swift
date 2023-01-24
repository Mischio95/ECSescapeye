//
//  CalendarView.swift
//  ECS
//
//  Created by Michele Trombone  on 10/01/23.
//

import SwiftUI

struct CityView: View {
    @ObservedObject var storeNation =  StoreData()
    @Environment(\.colorScheme) var colorScheme
    var currentCity: City
    @ObservedObject var countries: CountriesData
    
   
    var body: some View
    {
       NavigationStack()
        {
            Text("")
                .navigationTitle(storeNation.nations[0].city[0].name)
 
            Image(storeNation.nations[0].city[0].background)
                .resizable()
                .frame(width: 800,height: 500, alignment: .topLeading)
                .ignoresSafeArea()
                .position(x: 150, y: 100)
            questButtons
            
            if let nations = countries.nation
            {
                Text(nations[0].name)
            }
            else
            {
                Text("NoLoad")
            }
            
//            Button {
//                Task {
//                    await countries.getNation()
//                }
//
//            } label: {
//                buttonLabel(with: "Request",and: .accentColor)
//            }
        }
    }
    
    var questButtons: some View
    {
        // LIGHT MODE
        ZStack
        {
            if colorScheme == .light
            {
                RoundedRectangle(cornerRadius: 70, style: .continuous)
                    .fill(.white)
                    .frame(width: 480, height: 550)
            }
            if colorScheme == .dark
            {
                RoundedRectangle(cornerRadius: 70, style: .continuous)
                    .fill(.black)
                    .frame(width: 480, height: 600)
            }
            
            
            ZStack
            {
                ScrollView(showsIndicators: false)
                {
                    Spacer(minLength: 50)
                    VStack(spacing: 40)
                    {
                        //ShowAllCities()
                        ForEach(0..<storeNation.nations[0].city[0].quests.count)
                        {
                            index in
                            NavigationLink(destination: QuestDetailsView(storeNation: storeNation, quest: storeNation.nations[0].city[0].quests[index]))
                            {
                                ZStack
                                {
                                    Image("Napoli")
                                        .resizable()
                                        .cornerRadius(30)
                                        .frame(width: 400, height: 200)
                                        .opacity(0.85)
                                    
                                    //Sh
                                    Text(storeNation.nations[0].city[0].quests[index].title)
                                        .foregroundColor(.black)
                                        .bold()
                                        .position(x: 200,y: 30)
                                    
                                    HStack(spacing: 20)
                                    {
                                        ForEach(0..<storeNation.nations[0].city[0].quests[index].difficultyLevel.count)
                                        {
                                            index1 in
                                            Image(storeNation.nations[0].city[0].quests[index].difficultyLevel[index1])
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.padding(80)
            }
        }
    }
    
//    @ViewBuilder
//    func buttonLabel(with text: String, and color: Color) -> some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 20)
//                .frame(height: 100)
//                .foregroundColor(color)
//            Text(text)
//                .foregroundColor(.white)
//        }
//    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        var city = City(name: "Napoli", description: "", background: "Napoli", quests: [])
        CityView(storeNation: StoreData(), currentCity: city, countries: CountriesData())
    }
}
