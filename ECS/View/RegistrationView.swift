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
    @ObservedObject var storeNation = CityViewModel()
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    @State var username = ""
    let userDefaults = UserDefaults.standard
    @State var flagButton = false
    var body: some View
    {
    
        
        NavigationStack()
        {
            ZStack
            {

                ZStack
                {
                // SE FINISCE LA REGISTRAZIONE CHIAMA LA CONTENTVIEW
                    VStack(alignment:.leading)
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
                        VStack
                        {
                            earth3D
                            userStorage
                        }
                    }
                }
                            
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
                    user1.username = username
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
            
            Button(action:
            {
                flagButton = true
                UserDefaults.standard.set(true, forKey: "firstRegistration")
                var user1 = userDefaults.string(forKey: username)
                if(username != "")
                {
                    userDefaults.set(username, forKey: "username")
                    print(userDefaults.string(forKey: "username"))
                }
            },label:
            {
                Text("UserDefeault")
            })
            
            Button(action:
            {
                flagButton = true
                UserDefaults.standard.set(true, forKey: "firstRegistration")
               
                if(username != "")
                {
                    let str = username
                    let url = getDocumentsDirectory().appendingPathComponent("database.txt")
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            },label:
            {
                Text("FileManager")
            })
        }
    }
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        do {
            let items = try FileManager.default.contentsOfDirectory(atPath: "Documents")

            for item in items {
                print("Found \(item)")
            }
        } catch {
            print(error)
        }
        // just send back the first one, which ought to be the only one
        return paths[0]
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
