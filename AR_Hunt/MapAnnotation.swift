//
//  MapAnnotation.swift
//  AR_Hunt
//
//  Created by Thomas Phillips on 1/20/20.
//  Copyright © 2020 Razeware LLC. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D
  
  let title: String?
  
  let item: ARItem
  
  init(location: CLLocationCoordinate2D, item: ARItem) {
    self.coordinate = location
    self.item = item
    self.title = item.description
    
    super.init()
  }
}
