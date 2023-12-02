//
//  LoasingView.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 2/12/2023.
//

import SwiftUI
struct ActivityIndicator : UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(Color("ColorGreen"))
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    struct LodingView:View {
        var body: some View {
            ZStack{
                Color(.systemBackground)
                    .edgesIgnoringSafeArea(.all)
                ActivityIndicator()
            }
        }
    }
}
