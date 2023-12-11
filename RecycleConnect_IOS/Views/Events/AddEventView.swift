//
//  AddEventView.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 11/12/2023.
//

import SwiftUI
import PhotosUI

struct AddEventView: View {

    @State private var nameEvent = ""
    @State private var descriptionEvent = ""
    @State private var adressEvent = ""
    @State private var PhotoEvent: UIImage?
    @State private var photopickerItem: PhotosPickerItem?
    @State private var startEvent = Date()
    @StateObject var eventViewModel = EventViewModel()
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Event Details") .font(.headline)){
                    TextField("event name", text: $nameEvent)
                    TextField("event description", text: $descriptionEvent)
                    TextField("event adress", text: $adressEvent)
                    DatePicker("Event Start Date", selection: $startEvent , displayedComponents: .date)
                    
                }
                Section(header: Text("Event Photo") .font(.headline)){
                    PhotosPicker(selection: $photopickerItem, matching: .images){
                        Image(uiImage: PhotoEvent ?? UIImage( resource: .placeholder))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipped()
                            .cornerRadius(3)
                    }
                    
                }
                .onChange(of: photopickerItem) { _, _ in
                    Task{
                        if let photopickerItem,
                           let data = try? await photopickerItem.loadTransferable(type:Data.self){
                            if let image = UIImage(data: data){
                                PhotoEvent = image
                                print("image loaded", image)
                            }
                        }
                        photopickerItem = nil
                    }
                }
                
                
            }
            .navigationBarTitle("Add Event")
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        hideKeyboard()
                    } label: {
                        Image (systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save") {
                        eventViewModel.createEvent(name: nameEvent, description: descriptionEvent, address: adressEvent, start: startEvent, photo: PhotoEvent?.jpegData(compressionQuality: 0.5))
                            
                    }
                    .alert(item: $eventViewModel.alertItem) { alertitem in
                                Alert(title: alertitem.title,message: alertitem.message, dismissButton: alertitem.dismissButton)
                            }
                }
            }
        }
        .accentColor(Color.colorGreen)
    }
    
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        AddEventView()
    }
}
extension View {
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
