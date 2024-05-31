//
//  ContactsView.swift
//  RememberMe
//
//  Created by user256510 on 5/1/24.
//

import SwiftUI
import SwiftData

struct ContactsView: View {
    @Query(sort: \Pic.name) var pics: [Pic]
    
    var body: some View {
        List(pics, id: \.self){ picture in
            NavigationLink {
                SwiftUIView(item: picture)
            } label: {
                HStack {
                    Text(picture.name)
                    Spacer()
                    
                    Image(uiImage: UIImage(data: picture.photo)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                }
            }
        }
        
    }
    
    
}

#Preview {
    ContactsView()
}
