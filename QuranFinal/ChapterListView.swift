//
//  ChapterListView.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import Foundation


import SwiftUI

struct ChapterListView: View {
    @ObservedObject var viewModel: ChapterViewModel
    
    var body: some View {
        List(viewModel.chapters, id: \.id) { chapter in
            HStack {
                Text("\(chapter.id)")
                    .fontWeight(.bold)
                Text(chapter.nameSimple)
                Spacer()
                Text("Verses: \(chapter.versesCount)")
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
