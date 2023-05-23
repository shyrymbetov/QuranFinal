//
//  ContentView.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var viewModel = ChapterViewModel(chapterRepository: APIChapterRepository())

        var body: some View {
            ChapterListView(viewModel: viewModel)
        }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
