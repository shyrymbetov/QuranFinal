//
//  APIChapterRepository.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import Foundation

class APIChapterRepository: ChapterRepository {
    func fetchChapters(completion: @escaping FetchCompletion) {
        guard let url = URL(string: "https://api.quran.com/api/v4/chapters") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let chapters = try decoder.decode([Chapter].self, from: data)
                completion(.success(chapters))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case noData
}
