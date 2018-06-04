//
//  ViewController.swift
//  SimpleMapView
//
//  Created by D7703_02 on 2018. 6. 4..
//  Copyright © 2018년 D7703_02. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //번개반점
        //부산광역시 부산진구 양정1동 418-260
        //35.167783, 129.070502
        
        //동의과학대
        //부산광역시 부산진구 양정동 429-19
        //35.165976, 129.072540
        
        
        //위치정보(위도 경도 나타냄 =  let location = CLLocationCoordinate2D)
    
       let center = CLLocationCoordinate2D(latitude: 35.165976, longitude: 129.072540)
    //    let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
     //   let region = MKCoordinateRegion(center: center, span: span)
        
      //  myMapView.setRegion(region, animated: true)
        
        let region = MKCoordinateRegionMakeWithDistance(center, 2000, 2000)
        myMapView.setRegion(region, animated: true)
        //Annotation추가
       // let loc01 = CLLocationCoordinate2D(latitude: 35.167783, longitude: 129.070502)
        
      //  let anno01 = MKPointAnnotation()
      //  anno01.coordinate = loc01
      //  anno01.title = "번개반점"
      // anno01.subtitle = "부산광역시 부산진구 양정1동 418-260"
      //  myMapView.addAnnotation(anno01)
        
        
      //  let anno02 = MKPointAnnotation()
      //  anno02.coordinate = center
      //  anno02.title = "동의과학대"
      //  myMapView.addAnnotation(anno02)
        
        //토마토 도시락 핀 꼽기
        //토마토 도시락
        //부산광역시 부산진구 양정동
        //35.168156, 129.070419
        
        
        //  번개 반점의 주소를 위도 경도로 변환: geocoding
        
        let addr = "부산광역시 부산진구 양정1동 418-260"
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(addr) {
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            }
            
            if placemarks != nil {
                let placemark = placemarks![0]
           //     print(placemark.location?.coordinate)
            
                let loc01 = placemark.location?.coordinate
                let anno01 = MKPointAnnotation()
                anno01.coordinate = loc01!
                anno01.title = "번개반점"
                anno01.subtitle = addr
                self.myMapView.addAnnotation(anno01)
                
                
                
            }else {
                print("nil 발생")
            }
        }
        
    }

    

}

