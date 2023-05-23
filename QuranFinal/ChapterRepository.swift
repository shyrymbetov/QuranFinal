//
//  ChapterRepository.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import Foundation

protocol ChapterRepository {
    typealias FetchCompletion = (Result<[Chapter], Error>) -> Void
    
    func fetchChapters(completion: @escaping FetchCompletion)
}
