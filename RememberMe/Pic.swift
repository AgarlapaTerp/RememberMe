//
//  Pic.swift
//  RememberMe
//
//  Created by user256510 on 5/1/24.
//

import Foundation
import SwiftData

@Model
class Pic {
    var name: String
    @Attribute(.externalStorage) var photo:Data
    var latitude: Double
    var longtitude: Double
    
    init(name: String, photo: Data, latitude: Double, longtitude: Double) {
        self.name = name
        self.photo = photo
        self.latitude = latitude
        self.longtitude = longtitude
    }
}
