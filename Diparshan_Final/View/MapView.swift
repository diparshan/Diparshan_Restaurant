//
//  MapView.swift
//  Diparshan_Final
//
//  Created by Diparshan Bhattarai on 12/03/2024.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    private var location : CLLocation?
    private var restroAddress : String
    private var restroName : String
    
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    init(location : CLLocation?, restroAddress: String, restroName: String){
        self.location = location
        self.restroAddress = restroAddress
        self.restroName = restroName
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView(frame: .infinite)
        map.mapType = MKMapType.standard
        map.isZoomEnabled = true
        map.isUserInteractionEnabled = true
        map.showsUserLocation = true
        
        return map
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //to remove previous annotations
        uiView.removeAnnotations(uiView.annotations)
        
        if let location = location {
            let mapAnnotation = MKPointAnnotation()
            mapAnnotation.coordinate = location.coordinate
            mapAnnotation.title = "\(restroName) \n (\(restroAddress))"
            
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            uiView.setRegion(region, animated: true)
            uiView.addAnnotation(mapAnnotation)
        }

    
        
        
        
    }
    
}
