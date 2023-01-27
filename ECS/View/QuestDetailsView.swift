//
//  QuestDetailsView.swift
//  ECS
//
//  Created by Michele Trombone  on 12/01/23.
//

import SwiftUI

struct QuestDetailsView: View {
    var storeNation: StoreData
    @State var quest: Quest
   
   
              
    var body: some View
    {
        NavigationStack{
            VStack(alignment: .leading, spacing: 30)
            {
                Image("Napoli")
                .resizable()
                .frame(width: 500, height: 270)
                .offset(CGSize(width: 0, height: -80))
                .shadow(color: .black, radius: 10)
                .opacity(0.85)
                
                .navigationTitle(quest.title)
                
                Text("Description:")
                    .font(.title)
                    .bold()
                    .offset(CGSize(width: 50, height: -100))
                    .padding()
                
                Text(quest.description)
                    .offset(CGSize(width: 50, height: -130))
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)

                
                Image(quest.backgroundImage)
                    .resizable()
                    .cornerRadius(30)
                    .opacity(0.85)
                    .shadow(color: .black, radius: 3)
                    .frame(width: 360,height: 300)
                    .offset(CGSize(width: 50, height: -150))
                    .padding()
            }
            
            
        }

    }
}

struct QuestDetailsView_Previews: PreviewProvider {
    static var previews: some View {
//        var quest = Quest(title: "Napoli", description: "sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck sono di napoli fuck", backgroundImage: "Napoli", difficultyLevel: ["Star","Star"], trophy: .bronze)
//        QuestDetailsView(storeNation: StoreData(), quest: quest)
        QuestDetailsView(storeNation: StoreData(), quest: Quest(title: "", description: "", backgroundImage: "", difficultyLevel: [""], trophy: .bronze))
    }
}
