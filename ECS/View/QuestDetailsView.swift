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
            Image("Napoli")
            .resizable()
            .frame(width: 500, height: 370)
            .position(x: 200, y: 40)
            VStack{
                Text("")
                .navigationTitle(quest.title)
                .colorInvert()
            }
        }
    }
}

struct QuestDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        var quest = Quest(title: "Napoli", description: "sono di napoli fuck", backgroundImage: "Napoli", difficultyLevel: ["Star","Star"], trophy: .bronze)
        QuestDetailsView(storeNation: StoreData(), quest: quest)
    }
}
