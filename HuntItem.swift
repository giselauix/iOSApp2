//
//  HuntItem.swift
//  iOSApp2
//
//  Created by Amalia on 2026-06-08.
//


import SwiftUI

struct HuntItem: Identifiable {
    let id = UUID()
    let title: String
    let businessName: String
    let clue: String
    let prize: String
    let imageName: String
    var isFound: Bool = false
}