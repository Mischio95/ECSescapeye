//
//  RegistrationView.swift
//  ECS
//
//  Created by Michele Trombone  on 24/01/23.
//

import SwiftUI

struct RegistrationView: View {
    
    var dataController: DataController
    @ObservedObject var storeNation = StoreData()
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    @State var username = ""
    @State var password = ""
    let userDefaults = UserDefaults.standard
    @State var user1 = userDefaults.string(forKey: username)
    
    
    
    
    var body: some View {
        
        // SE FINISCE LA REGISTRAZIONE CHIAMA LA CONTENTVIEW
        VStack
        {
            TextField(
                "Username",
                text: $username
            )
            TextField(
                "Password",
                text: $password
            )
            NavigationView
            {
                List(user)
                { users in
                
                
                    NavigationLink{
                        Text(users.username ?? "")
                    }label: {
                            Text(users.username ?? "")
                    }
                        
                }
            }
            
            HStack(spacing: 30){
                
                Button("Add in CoreData") {
                    let users = User(context: moc)
                    if(username != "" && password != "")
                    {
                       
                        users.username = username
                        users.password = password
                        try? moc.save()
                        print(user)
                    }
                }
                
                Button("Add in UserDefeault")
                {
                    
                    if(username != "" && password != "")
                    {
//                        user1.username = username
//                        user1.password = password
                        userDefaults.set(username, forKey: "username")
                        userDefaults.set(password, forKey: "password")
                        
                        print(userDefaults.string(forKey: "username"))
                    }
                }
                Button("Add in FileManager")
                {
                    if(username != "" && password != "")
                    {
                        
                    }
                }
                
            }
        }.padding(30)
        
    }
    
    private func deleteItems(offsets: IndexSet) {
            withAnimation {
                offsets.map { user[$0] }.forEach(moc.delete)

                do {
                    try moc.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error (nsError), (nsError.userInfo)")
                }
            }
        }

}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(dataController: DataController())
    }
}
