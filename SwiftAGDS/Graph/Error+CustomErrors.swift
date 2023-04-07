//
//  Error+CustomErrors.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-04.
//

import Foundation

enum RuntimeError: Error {
    case illegalArgumentError(String)
}
