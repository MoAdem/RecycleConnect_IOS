//
//  MappView.swift
//  RecycleConnect_IOS
//
//  Created by Marsaoui Mariem on 29/11/2023.
//
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

