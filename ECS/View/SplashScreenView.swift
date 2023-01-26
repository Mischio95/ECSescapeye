//
//  SplashScreen.swift
//  ECS
//
//  Created by Michele Trombone  on 10/01/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State var animate = false
    @State var end = false
    var dataController: DataController
    
    var body: some View {
        ZStack
        {
            
            // HO DICHIARATO DELLE VARIABILI GLOBALI IN CITYVIEWMODEL E SETTO CON USERDEFAULT NELLA REGISTRATION VIEW UNA BOOL PER CONTROLLARE SE E' IL PRIMO ACCESSO O MENO PER EVITARE DI FAR REGISTRARE L'UTENTE PIU VOLTE

            if ((userDefaults.bool(forKey: firstRegistration) == false))
            {
                RegistrationView(dataController: dataController)
            }
            else
            {
                ContentView(dataController: dataController)
            }
            
            //RegistrationView(dataController: dataController)
            ZStack
            {
                Image("Splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaleEffect(animate ? 4 : 1 )
                    .frame(width: UIScreen.main.bounds.width)
            }.ignoresSafeArea(.all,edges: .all)
                .onAppear(perform: {
                    animateSplash()
                })
                .opacity(end ? 0 : 2)
        }
    }
        
    func animateSplash()
    {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.00)
        {
            withAnimation(Animation.easeOut(duration: 0.75)) {
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.75)){
                end.toggle()
            }
        }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView(dataController: DataController())
        }
    }
}
