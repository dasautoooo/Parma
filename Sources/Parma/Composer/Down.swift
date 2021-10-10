import class Down.Document
import class Down.BlockQuote
import class Down.List
import class Down.Item
import class Down.CodeBlock
import class Down.Paragraph
import class Down.Heading
import class Down.Text
import class Down.Code
import class Down.Emphasis
import class Down.Strong
import class Down.Link
import class Down.Image
import protocol Down.Node

typealias DownNode = Down.Node

typealias DownDocument = Down.Document
typealias DownBlockQuote = Down.BlockQuote
typealias DownList = Down.List
typealias DownItem = Down.Item
typealias DownCodeBlock = Down.CodeBlock
typealias DownParagraph = Down.Paragraph
typealias DownHeading = Down.Heading
typealias DownText = Down.Text
typealias DownCode = Down.Code
typealias DownEmphasis = Down.Emphasis
typealias DownStrong = Down.Strong
typealias DownLink = Down.Link
typealias DownImage = Down.Image

extension DownNode {
    var element: Element {
        switch self {

        case is DownBlockQuote: return .blockQuote
        case is DownList: return .list
        case is DownItem: return .item
        case is DownCodeBlock: return .codeBlock
        case is DownParagraph: return .paragraph
        case is DownHeading: return .heading
        case is DownText: return .text
        case is DownCode: return .code
        case is DownEmphasis: return .emphasis
        case is DownStrong: return .strong
        case is DownLink: return .link
        case is DownImage: return .image

        default: return .unknown
        }
    }

    var attributes: [String: String] {
        switch self {
        case let node as DownList:
            return node.attributes

        case let node as DownHeading:
            return node.attributes

        case let node as DownLink:
            return node.attributes

        case let node as DownImage:
            return node.attributes

        default: return [:]
        }
    }
}

private extension Dictionary where Key == String, Value == String {
    init(linkUrl url: String?, title: String?) {
        var dict: [String: String] = [:]
        if let url = url {
            dict["destination"] = url
        }

        if let title = title {
            dict["title"] = title
        }

        self = dict
    }
}

extension DownLink {
    var attributes: [String: String] {
        return .init(linkUrl: url, title: title)
    }
}

extension DownImage {
    var attributes: [String: String] {
        return .init(linkUrl: url, title: title)
    }
}

extension DownList {
    var attributes: [String: String] {
        var result: [String: String] = [:]
        switch listType {
        case .bullet:
            result["type"] = "bullet"

        case .ordered(start: let start):
            result["type"] = "ordered"
            result["start"] = "\(start)"
        }

        switch delimiter {
        case .paren: result["delim"] = "paren"
        case .period: result["delim"] = "period"
        case nil: break
        }

        return result
    }
}

extension DownHeading {
    var attributes: [String: String] {
        var result: [String: String] = [:]
        result["level"] = "\(headingLevel)"
        return result
    }
}
