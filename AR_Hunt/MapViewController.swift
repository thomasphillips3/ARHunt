/*
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!
  var targets = [ARItem]()
  let locationManager = CLLocationManager()
  
  func setupLocations() {
    let firstTarget = ARItem(
      description: "wolf",
      location: CLLocation(latitude: 33.972109, longitude: -118.374789))
    targets.append(firstTarget)
    
    let secondTarget = ARItem(
      description: "butt",
      location: CLLocation(latitude: 33.972109, longitude: -118.374789))
    targets.append(secondTarget)
    
    let thirdTarget = ARItem(
      description: "crab",
      location: CLLocation(latitude: 33.972109, longitude: -118.374789))
    targets.append(thirdTarget)
    
    for item in targets {
      let annotation = MapAnnotation(location: item.location.coordinate, item: item)
      self.mapView.addAnnotation(annotation)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
    setupLocations()
    
    if CLLocationManager.authorizationStatus() == .notDetermined {
      locationManager.requestWhenInUseAuthorization()
    }
  }
}
