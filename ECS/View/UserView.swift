//
//  UserView.swift
//  ECS
//
//  Created by Michele Trombone  on 12/01/23.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var storeNation = StoreData()
    var dataController: DataController
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    
    var body: some View {
        
        VStack
        {
//            List(user)
//            { users in
//                Text(users.username ?? "")
//            }
//
//
//            Button("Add") {
//                let username = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
//                let chosenFirstName = username.randomElement()!
//                let users = User(context: moc)
//                users.username = "\(chosenFirstName)"
//
//                try? moc.save()
//            }
            
            Text("CiccioBello")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(storeNation: StoreData(),dataController: DataController())
    }
}
