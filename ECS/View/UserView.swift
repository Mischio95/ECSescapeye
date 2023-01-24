//
//  UserView.swift
//  ECS
//
//  Created by Michele Trombone  on 12/01/23.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var storeNation = StoreData()
    
    
    var body: some View {
        Text("ciccio bello")
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(storeNation: StoreData())
    }
}
