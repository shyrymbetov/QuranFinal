//
//  ChapterViewModel.swift
//  QuranFinal
//
//  Created by Yerasyl Shyrymbetov on 23.05.2023.
//

import Foundation

class ChapterViewModel: ObservableObject {
    @Published var chapters: [Chapter] = []
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    
    private let chapterRepository: ChapterRepository
        
    init(chapterRepository: ChapterRepository) {
        self.chapterRepository = chapterRepository
    }

    func fetchData() {
        isLoading = true

        // Define the URL of the API
        guard let apiUrl = URL(string: "https://api.quran.com/api/v4/chapters") else {
            isLoading = false
            error = NSError(domain: "com.example", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid API URL"])
            return
        }

        // Create a URLSession instance
        let session = URLSession.shared

        // Create a data task to fetch the data from the API
        let task = session.dataTask(with: apiUrl) { [weak self] (data, response, error) in
            defer {
                self?.isLoading = false
            }

            // Check for errors
            if let error = error {
                self?.error = error
                return
            }

            // Ensure that response has data
            guard let responseData = data else {
                self?.error = NSError(domain: "com.example", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                return
            }

            do {
                // Parse the JSON data
                let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]

                // Access the "chapters" array in the JSON response
                if let chapters = json?["chapters"] as? [[String: Any]] {
                    var chapterArray: [Chapter] = []

                    // Iterate through the chapters
                    for chapter in chapters {
                        // Access the properties of each chapter
                        if let id = chapter["id"] as? Int,
                           let revelationPlace = chapter["revelation_place"] as? String,
                           let revelationOrder = chapter["revelation_order"] as? Int,
                           let bismillahPre = chapter["bismillah_pre"] as? Bool,
                           let nameSimple = chapter["name_simple"] as? String,
                           let nameComplex = chapter["name_complex"] as? String,
                           let nameArabic = chapter["name_arabic"] as? String,
                           let versesCount = chapter["verses_count"] as? Int,
                           let pages = chapter["pages"] as? [Int],
                           let translatedName = chapter["translated_name"] as? [String: Any],
                           let translatedLanguageName = translatedName["language_name"] as? String,
                           let translatedName = translatedName["name"] as? String {

                            // Create a Chapter object and append it to the array
                            let chapterObject = Chapter(id: id, revelationPlace: revelationPlace, revelationOrder: revelationOrder, bismillahPre: bismillahPre, nameSimple: nameSimple, nameComplex: nameComplex, nameArabic: nameArabic, versesCount: versesCount, pages: pages, translatedLanguageName: translatedLanguageName, translatedName: translatedName)
                            chapterArray.append(chapterObject)
                        }
                    }

                    DispatchQueue.main.async {
                        // Update the chapters array on the main queue
                        self?.chapters = chapterArray
                    }
                }
            } catch {
                self?.error = error
            }
        }

        // Start the data task
        task.resume()
    }
}




