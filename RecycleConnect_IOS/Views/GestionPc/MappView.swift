//
//  MappView.swift
//  RecycleConnect_IOS
//
//  Created by abir on 29/11/2023.
//

/*
import SwiftUI
import MapKit

struct MappView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $mapRegion)
    }
}

struct MappView_Previews: PreviewProvider {
    static var previews: some View {
        MappView()
    }
}
*/
/*
import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    var id = UUID()
    var annotation: MKPointAnnotation
}

struct MappView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.809328 , longitude: 10.086327 ), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    @State private var annotations = [
        AnnotationItem(annotation: MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 36.809328, longitude: 10.086327 ), title: "Manouba", subtitle: "Manouba")),
        /*AnnotationItem(annotation: MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), title: "New York", subtitle: "The Big Apple")),*/
        // Add more annotations as needed
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: annotations) { annotationItem in
            MapPin(coordinate: annotationItem.annotation.coordinate, tint: .red)

        }
    }
}

struct MappView_Previews: PreviewProvider {
    static var previews: some View {
        MappView()
    }
}
*//*
import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    var id = UUID()
    var annotation: MKPointAnnotation
}

struct MappView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.809328, longitude: 10.086327), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    @State private var annotations = [
        AnnotationItem(annotation: {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 36.809328, longitude: 10.086327)
            annotation.title = "Manouba"
            annotation.subtitle = "Manouba"
            return annotation
        }())
        // Add more annotations as needed
    ]

    var body: some View {
        Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: annotations) { annotationItem in
            MapPin(coordinate: annotationItem.annotation.coordinate, tint: .red)
        }
    }
}

struct MappView_Previews: PreviewProvider {
    static var previews: some View {
        MappView()
    }
}
*/
import SwiftUI
import MapKit

struct AnnotationItem: Identifiable {
    var id = UUID()
    var annotation: MKPointAnnotation
}

struct MappView: View {
    @State private var mapRegion: MKCoordinateRegion
    let annotations: [AnnotationItem]

    init(mapRegion: MKCoordinateRegion, annotations: [AnnotationItem]) {
        self._mapRegion = State(initialValue: mapRegion)
        self.annotations = annotations
    }

    var body: some View {
        Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: annotations) { annotationItem in
            MapPin(coordinate: annotationItem.annotation.coordinate, tint: .red)
        }
    }
}
