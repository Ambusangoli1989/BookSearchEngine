//
//  SearchResultModel.swift
//  BookSearchEngine
//
//  Created by ambu sangoli on 3/1/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   var searchResultModel = try? newJSONDecoder().decode(SearchResultModel.self, from: jsonData)

import Foundation

// MARK: - SearchResultModel
class SearchResultModel: Codable {
    var numFound, start: Int?
    var numFoundExact: Bool?
    var docs: [Doc]?
    var searchResultModelNumFound: Int?
    var q: String?
    var offset: JSONNull?

    enum CodingKeys: String, CodingKey {
        case numFound, start, numFoundExact, docs
        case searchResultModelNumFound = "num_found"
        case q, offset
    }

    init(numFound: Int?, start: Int?, numFoundExact: Bool?, docs: [Doc]?, searchResultModelNumFound: Int?, q: String?, offset: JSONNull?) {
        self.numFound = numFound
        self.start = start
        self.numFoundExact = numFoundExact
        self.docs = docs
        self.searchResultModelNumFound = searchResultModelNumFound
        self.q = q
        self.offset = offset
    }
}

// MARK: - Doc
class Doc: Codable {
    var key, type: String?
    var seed: [String]?
    var title, titleSuggest: String?
    var hasFulltext: Bool?
    var editionCount: Int?
    var editionKey, publishDate: [String]?
    var publishYear: [Int]?
    var firstPublishYear, numberOfPagesMedian: Int?
    var lccn, publishPlace, oclc, contributor: [String]?
    var lcc, ddc, isbn: [String]?
    var lastModifiedI, ebookCountI: Int?
    var ia: [String]?
    var publicScanB: Bool?
    var iaCollectionS, lendingEditionS, lendingIdentifierS, printdisabledS: String?
    var coverEditionKey: String?
    var coverI: Int!
    var firstSentence, publisher, language, authorKey: [String]?
    var authorName, authorAlternativeName, person, place: [String]?
    var subject, time, idAmazon, idGoodreads: [String]?
    var idGoogle, idLibrarything, idPaperbackSwap, idScribd: [String]?
    var iaLoadedID, iaBoxID, publisherFacet, personKey: [String]?
    var placeKey, timeFacet, personFacet, subjectFacet: [String]?
    var version: Double?
    var placeFacet: [String]?
    var lccSort: String?
    var authorFacet, subjectKey: [String]?
    var ddcSort: String?
    var timeKey: [String]?

    enum CodingKeys: String, CodingKey {
        case key, type, seed, title
        case titleSuggest = "title_suggest"
        case hasFulltext = "has_fulltext"
        case editionCount = "edition_count"
        case editionKey = "edition_key"
        case publishDate = "publish_date"
        case publishYear = "publish_year"
        case firstPublishYear = "first_publish_year"
        case numberOfPagesMedian = "number_of_pages_median"
        case lccn
        case publishPlace = "publish_place"
        case oclc, contributor, lcc, ddc, isbn
        case lastModifiedI = "last_modified_i"
        case ebookCountI = "ebook_count_i"
        case ia
        case publicScanB = "public_scan_b"
        case iaCollectionS = "ia_collection_s"
        case lendingEditionS = "lending_edition_s"
        case lendingIdentifierS = "lending_identifier_s"
        case printdisabledS = "printdisabled_s"
        case coverEditionKey = "cover_edition_key"
        case coverI = "cover_i"
        case firstSentence = "first_sentence"
        case publisher, language
        case authorKey = "author_key"
        case authorName = "author_name"
        case authorAlternativeName = "author_alternative_name"
        case person, place, subject, time
        case idAmazon = "id_amazon"
        case idGoodreads = "id_goodreads"
        case idGoogle = "id_google"
        case idLibrarything = "id_librarything"
        case idPaperbackSwap = "id_paperback_swap"
        case idScribd = "id_scribd"
        case iaLoadedID = "ia_loaded_id"
        case iaBoxID = "ia_box_id"
        case publisherFacet = "publisher_facet"
        case personKey = "person_key"
        case placeKey = "place_key"
        case timeFacet = "time_facet"
        case personFacet = "person_facet"
        case subjectFacet = "subject_facet"
        case version = "_version_"
        case placeFacet = "place_facet"
        case lccSort = "lcc_sort"
        case authorFacet = "author_facet"
        case subjectKey = "subject_key"
        case ddcSort = "ddc_sort"
        case timeKey = "time_key"
    }

    init(key: String?, type: String?, seed: [String]?, title: String?, titleSuggest: String?, hasFulltext: Bool?, editionCount: Int?, editionKey: [String]?, publishDate: [String]?, publishYear: [Int]?, firstPublishYear: Int?, numberOfPagesMedian: Int?, lccn: [String]?, publishPlace: [String]?, oclc: [String]?, contributor: [String]?, lcc: [String]?, ddc: [String]?, isbn: [String]?, lastModifiedI: Int?, ebookCountI: Int?, ia: [String]?, publicScanB: Bool?, iaCollectionS: String?, lendingEditionS: String?, lendingIdentifierS: String?, printdisabledS: String?, coverEditionKey: String?, coverI: Int!, firstSentence: [String]?, publisher: [String]?, language: [String]?, authorKey: [String]?, authorName: [String]?, authorAlternativeName: [String]?, person: [String]?, place: [String]?, subject: [String]?, time: [String]?, idAmazon: [String]?, idGoodreads: [String]?, idGoogle: [String]?, idLibrarything: [String]?, idPaperbackSwap: [String]?, idScribd: [String]?, iaLoadedID: [String]?, iaBoxID: [String]?, publisherFacet: [String]?, personKey: [String]?, placeKey: [String]?, timeFacet: [String]?, personFacet: [String]?, subjectFacet: [String]?, version: Double?, placeFacet: [String]?, lccSort: String?, authorFacet: [String]?, subjectKey: [String]?, ddcSort: String?, timeKey: [String]?) {
        self.key = key
        self.type = type
        self.seed = seed
        self.title = title
        self.titleSuggest = titleSuggest
        self.hasFulltext = hasFulltext
        self.editionCount = editionCount
        self.editionKey = editionKey
        self.publishDate = publishDate
        self.publishYear = publishYear
        self.firstPublishYear = firstPublishYear
        self.numberOfPagesMedian = numberOfPagesMedian
        self.lccn = lccn
        self.publishPlace = publishPlace
        self.oclc = oclc
        self.contributor = contributor
        self.lcc = lcc
        self.ddc = ddc
        self.isbn = isbn
        self.lastModifiedI = lastModifiedI
        self.ebookCountI = ebookCountI
        self.ia = ia
        self.publicScanB = publicScanB
        self.iaCollectionS = iaCollectionS
        self.lendingEditionS = lendingEditionS
        self.lendingIdentifierS = lendingIdentifierS
        self.printdisabledS = printdisabledS
        self.coverEditionKey = coverEditionKey
        self.coverI = coverI
        self.firstSentence = firstSentence
        self.publisher = publisher
        self.language = language
        self.authorKey = authorKey
        self.authorName = authorName
        self.authorAlternativeName = authorAlternativeName
        self.person = person
        self.place = place
        self.subject = subject
        self.time = time
        self.idAmazon = idAmazon
        self.idGoodreads = idGoodreads
        self.idGoogle = idGoogle
        self.idLibrarything = idLibrarything
        self.idPaperbackSwap = idPaperbackSwap
        self.idScribd = idScribd
        self.iaLoadedID = iaLoadedID
        self.iaBoxID = iaBoxID
        self.publisherFacet = publisherFacet
        self.personKey = personKey
        self.placeKey = placeKey
        self.timeFacet = timeFacet
        self.personFacet = personFacet
        self.subjectFacet = subjectFacet
        self.version = version
        self.placeFacet = placeFacet
        self.lccSort = lccSort
        self.authorFacet = authorFacet
        self.subjectKey = subjectKey
        self.ddcSort = ddcSort
        self.timeKey = timeKey
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        var container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

