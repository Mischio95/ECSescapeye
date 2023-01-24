//
//  ECSApp.swift
//  ECS
//
//  Created by Michele Trombone  on 10/01/23.
//

import SwiftUI

@main
struct ECSApp: App
{
    @StateObject private var dataController = DataController()
    var body: some Scene
    {
        WindowGroup
        {
            SplashScreenView(dataController : dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
