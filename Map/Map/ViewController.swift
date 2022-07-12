//
//  ViewController.swift
//  Map
//
//  Created by 한소희 on 2022/06/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 앱을 실행하면 지도가 나타나도록 하는 함수 추가
        lblLocationInfo1.text = ""  // 위치 정보를 표시할 레이블에는 아직 특별히 표시할 필요가 없으므로 공백으로 둠.
        lblLocationInfo2.text = ""
        locationManager.delegate = self  // 상수 locationManager의 델리게이트를 self로 설정.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest  // 정확도를 최고로 설정.
        locationManager.requestWhenInUseAuthorization()  // 위치 데이터를 추적하기 위해 사용자에게 승인을 요구.
        locationManager.startUpdatingLocation()  // 위치 업데이트를 시작.
        myMap.showsUserLocation = true  // 위치 보기 값을 true로 설정.
    }
    
    // 사용자가 원하는 위도와 경도의 지도만 보여 주는 것과 범위의 크기를 지정하면 지도에 원하는 위치를 표시해 주는 함수
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation}
    /* {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        /* 위도 값과 경도 값을 매개변수로 하여 CLLocationCoordinate2DMake 함수를 호출하고, 리턴 값을 pLocation으로 받음.*/
        
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        /* 범위 값을 매개변수로 하여 MKCoordinateSpanMake 함수를 호출하고, 리턴 값을 spanValue로 받음.*/
        
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        /* pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받음.*/
        
        myMap.setRegion(pRegion, animated: true)
        /* pRegion 값을 매개변수로 하여 myMap.setReigon 함수 호출.*/
    } */
    
    func setAnnotation(latitudeVale : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double, title strTitle : String, subtitle strSubtitle : String) {
        let annotation = MKPointAnnotation()  // 핀을 설치하기 위해 MKPointAnnotation 함수를 호출하여 리턴 값을 annotation으로 받음.
        annotation.coordinate = goLocation(latitudeValue: latitudeVale, longitudeValue: longitudeValue, delta: span)
        // annotation의 coordinate 값을 goLocation 함수로부터 CLLocationCoordinate2D 형태로 받아야 하는데, 이를 위해서는 goLocation 함수를 수정해야 함.
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    // 위치가 업데이트되었을 때 지도에 위치를 나타내기 위한 함수
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last  // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아냄.
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        /* 마지막 위치의 위도와 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출함. 이때 delta 값은 지도의 크기를 정하는데,
         값이 작을수록 확대되는 효과가 있음 .delta가 0.01이므로 1의 값보다 지도를 100배로 확대하여 보여 줄 것임.*/
        
        // 위도와 경도값을 가지고 역으로 위치의 정보, 즉 주소를 찾아보는 익명 함수
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first  // placemarks 값의 첫부분만 pm 상수로 대입.
            let country = pm!.country  // pm 상수에서 나라 값을 country 상수에 대입.
            var address : String = country!  // 문자열 address에 country 상수의 값을 대입.
            if pm!.thoroughfare != nil  // pm 상수에서 지역 값이 존재하면 address 문자열에 추가.
            {
                address += ""
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil  // pm 상수에서 도로 값이 존재하면 address 문자열에 추가.
            {
                address += ""
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "현재 위치"  // 레이블에 현재 위치 텍스트와 address 문자열의 값을 표시.
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()  // 마지막으로 위치가 업데이트되는 것을 멈추게 함.
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        // sender.selectSegmentIndex 값은 현재 위치를 기점으로 하기 때문에 '현재 위치'를 선택하면 0이 되고, '폴리텍대학'은 1, '이지스퍼블리싱'은 2가 됨.
        if sender.selectedSegmentIndex == 0
        {
            // 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1
        {
            // 폴리텍대학 표시
            setAnnotation(latitudeVale: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "한국폴리텍대학 강릉캠퍼스"
        }
        else if sender.selectedSegmentIndex == 2
        {
            // 이지스퍼블링 표시
            setAnnotation(latitudeVale: 37.556876, longitudeValue: 126.914066, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        }
    }
    
}

