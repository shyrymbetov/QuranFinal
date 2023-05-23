//import Foundation
//
//
//
//func fetchData(completion: @escaping ([Chapter]?, Error?) -> Void) {
//    // Define the URL of the API
//    let apiUrl = URL(string: "https://api.quran.com/api/v4/chapters")!
//
//    // Create a URLSession instance
//    let session = URLSession.shared
//
//    // Create a data task to fetch the data from the API
//    let task = session.dataTask(with: apiUrl) { (data, response, error) in
//        // Check for errors
//        if let error = error {
//            completion(nil, error)
//            return
//        }
//
//        // Ensure that response has data
//        guard let responseData = data else {
//            completion(nil, NSError(domain: "com.example", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
//            return
//        }
//
//        do {
//            // Parse the JSON data
//            let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any]
//
//            // Access the "chapters" array in the JSON response
//            if let chapters = json?["chapters"] as? [[String: Any]] {
//                var chapterArray: [Chapter] = []
//
//                // Iterate through the chapters
//                for chapter in chapters {
//                    // Access the properties of each chapter
//                    if let id = chapter["id"] as? Int,
//                       let revelationPlace = chapter["revelation_place"] as? String,
//                       let revelationOrder = chapter["revelation_order"] as? Int,
//                       let bismillahPre = chapter["bismillah_pre"] as? Bool,
//                       let nameSimple = chapter["name_simple"] as? String,
//                       let nameComplex = chapter["name_complex"] as? String,
//                       let nameArabic = chapter["name_arabic"] as? String,
//                       let versesCount = chapter["verses_count"] as? Int,
//                       let pages = chapter["pages"] as? [Int],
//                       let translatedName = chapter["translated_name"] as? [String: Any],
//                       let translatedLanguageName = translatedName["language_name"] as? String,
//                       let translatedName = translatedName["name"] as? String {
//
//                        // Create a Chapter object and append it to the array
//                        let chapterObject = Chapter(id: id, revelationPlace: revelationPlace, revelationOrder: revelationOrder, bismillahPre: bismillahPre, nameSimple: nameSimple, nameComplex: nameComplex, nameArabic: nameArabic, versesCount: versesCount, pages: pages, translatedLanguageName: translatedLanguageName, translatedName: translatedName)
//                        chapterArray.append(chapterObject)
//                    }
//                }
//
//                // Return the chapter array
//                completion(chapterArray, nil)
//            }
//        } catch {
//            completion(nil, error)
//        }
//    }
//
//    // Start the data task
//    task.resume()
//}
