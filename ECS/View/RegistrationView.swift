//
//  RegistrationView.swift
//  ECS
//
//  Created by Michele Trombone  on 24/01/23.
//

import SwiftUI
import SceneKit

struct RegistrationView: View {
    
    var dataController: DataController
    @ObservedObject var storeNation = StoreData()
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    @State var username = ""
    let userDefaults = UserDefaults.standard
    @State var flagButton = false
    var body: some View {
        
        NavigationStack()
        {
        // SE FINISCE LA REGISTRAZIONE CHIAMA LA CONTENTVIEW
            VStack(alignment:.leading, spacing: 1)
            {
                Text("REGISTRATION")
                    .frame(alignment: .leading)
                    .font(.title2)
                    .padding()
                Text("Choose your Username")
                    .font(.title3)
                    .frame(alignment: .leading)
                    .padding()
                TextField("Username",text: $username)
                    .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .gray)
                    .padding(30)
                    .navigationTitle("NO NAME APP")
            }
                VStack
                {
                    earth3D
                    userStorage
                }
            }
        }
    
    
    var earth3D : some View
    {
        SceneView(scene: SCNScene(named: "planet1.usdz"),options: [.autoenablesDefaultLighting,.allowsCameraControl])
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 3)
            
        
    }
    
    var userStorage: some View
    {
        HStack(spacing: 30){
         
            // BUTTON CORE DATA AND CHANGE VIEW
            Button(action:{
                let users = User(context: moc)
                
                if(username != "")
                {
                    flagButton = true
                    UserDefaults.standard.set(true, forKey: "firstRegistration")
                    users.username = username
                    try? moc.save()
                    print(user)
                }
            },label:
            {
                Text("CoreData")
            })
            
            NavigationStack
            {
                NavigationLink(destination: ContentView(dataController: dataController), isActive: $flagButton)
                {
                 
                }
            }.navigationBarBackButtonHidden(true)

            // BUTTON TO SAVE DATA WITH USERDEAULT
            
            Button("UserDefeault")
            {
                var user1 = userDefaults.string(forKey: username)
                if(username != "")
                {
                    userDefaults.set(username, forKey: "username")
                    print(userDefaults.string(forKey: "username"))
                }
            }
            
            //                Button("Add in FileManager")
            //                {
            //                    if(username != "" && password != "")
            //                    {
            //
            //                    }
            //                }
            //
        }
    }
}

extension TextField {

    func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
        self
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .shadow(color: .black, radius: 10)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(dataController: DataController())
    }
}
