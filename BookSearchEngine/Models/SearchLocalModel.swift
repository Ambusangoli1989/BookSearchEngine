//
//  SearchLocalModel.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/4/22.
//

import Foundation
// MARK: - Comment
class SearchLocalModel: NSObject {
    var title: String?
    var authorName: String?
    var publishYear: String?
    var coverI: String?

    init(title: String?, authorName: String?, publishYear: String?, coverI: String?) {
        self.title = title
        self.authorName = authorName
        self.publishYear = publishYear
        self.coverI = coverI

    }
}







