//
//  ContentView.swift
//  RememberMe
//
//  Created by user256510 on 5/1/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var photo:PhotosPickerItem?
    @State private var photoData: Data?
    @State private var photoImage: Image?
    @State private var name: String = ""
    
    @State private var nameEntry: Bool = true
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker("Put a face to that new chat", selection: $photo, matching: .images)
                    .onChange(of: photo){
                        nameEntry = false
                        Task {
                            await loadData()
                        }
                    }
                photoImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                HStack {
                    TextField("Enter the name of this person", text: $name)
                        .disabled(nameEntry)
                    
                    Button() {
                        saveData()
                        name = "" 
                        nameEntry = true
                    }
                    label : {
                        Image(systemName: "plus")
                    }
                    .disabled(nameEntry)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.capsule)
                }
                .padding()
                
                NavigationLink("Contacts", destination: ContactsView())
                
                
                
                
            }
        }
        
        
    }
    
    func loadData() async{
        if let photoData = try? await photo?.loadTransferable(type: Data.self){
            self.photoData = photoData
            photoImage = Image(uiImage: UIImage(data: photoData)!)
        } else {
            print("loading data failed")
        }
    }
    
    func saveData() {
        let lastKnownLocation = locationFetcher.lastKnownLocation
        
        
        if let photoData {
            modelContext.insert(Pic(name: name, photo: photoData, latitude: lastKnownLocation?.latitude ?? 45.6868, longtitude: lastKnownLocation?.longitude ?? 23.45858))
        }
    }
}

#Preview {
    ContentView()
}
