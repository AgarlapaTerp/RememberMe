//
//  SwiftUIView.swift
//  RememberMe
//
//  Created by user256510 on 5/1/24.
//

import SwiftUI
import MapKit

struct SwiftUIView: View {
    var item: Pic?
    
    var itemUnwrapped: Pic {
        if let item {
            return item
        }
        return Pic(name: "abhi", photo: Data(), latitude: 1.0, longtitude: 1.0)
    }
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: itemUnwrapped.photo)!)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
            
            Map(initialPosition: MapCameraPosition.region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: itemUnwrapped.latitude, longitude: itemUnwrapped.longtitude),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))) {
                    Marker(itemUnwrapped.name, coordinate: CLLocationCoordinate2D(latitude: itemUnwrapped.latitude, longitude: itemUnwrapped.longtitude))
                }
        }
        
        
        
    }
}

#Preview {
    SwiftUIView()
}
