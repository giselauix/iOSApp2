//
//  HuntDetailView.swift
//  iOSApp2
//
//  Created by Amalia on 2026-06-08.
//


import SwiftUI

struct HuntDetailView: View {
    let item: HuntItem
    @ObservedObject var viewModel: HuntViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            
            Image(systemName: item.imageName)
                .font(.system(size: 90))
                .foregroundStyle(item.isFound ? .green : .blue)
                .padding()
            
            Text(item.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text(item.businessName)
                .font(.title3)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Clue")
                    .font(.headline)
                
                Text(item.clue)
                    .font(.body)
                
                Text("Prize")
                    .font(.headline)
                    .padding(.top)
                
                Text(item.prize)
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Spacer()
            
            Button {
                viewModel.markAsFound(item: item)
            } label: {
                Label(item.isFound ? "Item Already Found" : "Take Picture & Mark Found", systemImage: "camera.fill")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(item.isFound ? Color.gray : Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .disabled(item.isFound)
        }
        .padding()
        .navigationTitle("Item Details")
    }
}

#Preview {
    HuntDetailView(item: sampleHuntItems[0], viewModel: HuntViewModel())
}