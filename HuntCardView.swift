//
//  HuntCardView.swift
//  iOSApp2
//
//  Created by Amalia on 2026-06-08.
//


import SwiftUI

struct HuntCardView: View {
    let item: HuntItem
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: item.imageName)
                .font(.largeTitle)
                .foregroundStyle(item.isFound ? .green : .blue)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(.headline)
                
                Text(item.businessName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(item.isFound ? "Found" : "Not Found")
                    .font(.caption)
                    .foregroundStyle(item.isFound ? .green : .orange)
            }
            
            Spacer()
            
            if item.isFound {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    HuntCardView(item: sampleHuntItems[0])
}