//
//  Chapter.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import Foundation

struct Chapter: Identifiable, Codable {
    let id: Int
    let revelationPlace: String
    let revelationOrder: Int
    let bismillahPre: Bool
    let nameSimple: String
    let nameComplex: String
    let nameArabic: String
    let versesCount: Int
    let pages: [Int]
    let translatedLanguageName: String
    let translatedName: String
}
