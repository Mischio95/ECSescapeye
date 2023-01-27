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
    @State var userFetch: [String]?
    
    var body: some View {
        
        VStack
        {
            VStack
            {
                ZStack(alignment: .top)
                {
    
                    Image("user")
                        .resizable()
                        .frame(width: 600,height: 230)
                        .edgesIgnoringSafeArea(.top)
                        .offset(CGSize(width: 20, height: -40))
                        
                    Button
                    {
                        isPresenting.toggle()
                    } label: {
                        VStack
                        {
                            if let uiImage = self.uiImage
                            {
                                Circle()
                                    .edgesIgnoringSafeArea(.top)
                                    .frame(height: 150)
                                    .offset(CGSize(width: -100, height: 80))
                                    .shadow(color: .black, radius: 6)
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(80)
                                    .offset(CGSize(width: -100, height: -67))
                                    .shadow(color: .black, radius: 6)
                            }
                            else
                            {
                                Circle()
                                    .edgesIgnoringSafeArea(.top)
                                    .frame(height: 150)
                                    .offset(CGSize(width: -100, height: 60))
                                    .shadow(color: .black, radius: 6)
                                Image(systemName: "plus")
                                    .font(.system(size: 30))
                                    .padding()
                                    .colorInvert()
                                    .foregroundColor(Color(.label))
                                    .scaledToFill()
                                    .frame(width: 140, height: 30)
                                    .cornerRadius(80)
                                    .offset(CGSize(width: -100, height: -40))
                            }
                        }
                    }
                }
            }
            VStack(spacing: 15)
            {
                VStack(spacing: 5)
                {
//                    Button("Load Name")
//                    {
//                        do{
//                            ForEach(user, id: \.self)
//                            {users in
//                                userFetch?.append(users.username ?? "")
//                            }
//                        } catch
//                        {
//                            print(error)
//                        }
//                    }
                    Text(userFetch?[0] ?? "No Name")
                        .bold()
                        .font(.body)
                        .foregroundColor(Color(.label))
                        .offset(CGSize(width: 75, height: -108))
                        .fixedSize()
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $isPresenting, onDismiss: nil) {
                ImagePicker(uiImage: $uiImage)
            }
        }
        .offset(CGSize(width: 0, height: -230))
    }
}

//func fetchUserCoreData()
//{
//    do{
//        ForEach(user, id: \.self)
//        {
//            users in
//            userFetch?.append(users.username ?? "")
//        }
//    } catch
//    {
//        print(error)
//    }
//}

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
