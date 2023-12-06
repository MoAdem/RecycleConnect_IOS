//
//  OrgEventListCell.swift
//  RecycleConnect_IOS
//
//  Created by Med adem on 6/12/2023.
//

import SwiftUI

struct OrgEventListCell: View {
    let event: Events
    var body: some View {
        HStack{
            Text(event.nameEvent)
        }
    }
}

struct OrgEventListCell_Previews: PreviewProvider {
    static var previews: some View {
        OrgEventsView()
    }
}
