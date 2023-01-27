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
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        
        VStack
        {
            VStack
            {
                ZStack(alignment: .top)
                {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 100)
                   
                    Button
                    {
                        isPresenting.toggle()
                    } label: {
                        VStack
                        {
                            if let uiImage = self.uiImage
                            {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(80)
                            }
                            else
                            {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 80))
                                    .padding()
                                    .foregroundColor(Color(.label))
                            }
                        }
                    }
                }
            }
            VStack(spacing: 15)
            {
                VStack(spacing: 5)
                {
                    Text(user1.username)
                        .bold()
                        .font(.body)
                        .foregroundColor(.secondary)
                }.padding()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $isPresenting, onDismiss: nil) {
                ImagePicker(uiImage: $uiImage)
            }
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
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(storeNation: StoreData(),dataController: DataController())
    }
}

struct ImagePicker: UIViewControllerRepresentable
{
    @Binding var uiImage: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate
    {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.uiImage = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func  makeUIViewController(context: Context) -> some UIViewController
    {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
