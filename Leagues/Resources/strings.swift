// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Commun {
    /// OK
    internal static let ok = L10n.tr("Localizable", "commun.ok")
  }

  internal enum Error {
    internal enum Network {
      /// Please check your network connection
      internal static let body = L10n.tr("Localizable", "error.network.body")
      /// Network error
      internal static let title = L10n.tr("Localizable", "error.network.title")
    }
    internal enum Notfound {
      /// Not found
      internal static let title = L10n.tr("Localizable", "error.notfound.title")
      internal enum Body {
        /// The requested elements are not found
        internal static let plural = L10n.tr("Localizable", "error.notfound.body.plural")
        /// The requested element is not found
        internal static let single = L10n.tr("Localizable", "error.notfound.body.single")
      }
    }
    internal enum Technical {
      /// A technical error occured. Please try later.
      internal static let body = L10n.tr("Localizable", "error.technical.body")
      /// Technical error
      internal static let title = L10n.tr("Localizable", "error.technical.title")
    }
  }

  internal enum Player {
    /// birthDate
    internal static let birthdate = L10n.tr("Localizable", "player.birthdate")
    /// price
    internal static let price = L10n.tr("Localizable", "player.price")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
