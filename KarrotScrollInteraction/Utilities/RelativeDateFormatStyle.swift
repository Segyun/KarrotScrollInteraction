//
//  RelativeDateFormatStyle.swift
//  KarrotScrollInteraction
//
//  Created by Huigyun Jeong on 10/3/26.
//

import Foundation
import Synchronization

struct RelativeDateFormatStyle: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    private var locale: Locale = .autoupdatingCurrent

    func format(_ value: FormatInput) -> FormatOutput {
        let formatter = Self.cachedFormatter(locale: locale)

        return formatter.localizedString(for: value, relativeTo: .now)
    }

    func locale(_ locale: Locale) -> Self {
        var copy = self
        copy.locale = locale
        return copy
    }

    private static let cache: Mutex<[String: RelativeDateTimeFormatter]> =
        .init([:])

    private static func cachedFormatter(
        locale: Locale
    ) -> RelativeDateTimeFormatter {
        let key = locale.identifier

        return cache.withLock { dict in
            if let cached = dict[key] {
                return cached
            }

            let formatter: RelativeDateTimeFormatter = .init()
            formatter.locale = locale
            formatter.dateTimeStyle = .named

            dict[key] = formatter

            return formatter
        }
    }
}

extension FormatStyle where Self == RelativeDateFormatStyle {
    static var relativeDate: RelativeDateFormatStyle { .init() }
}
