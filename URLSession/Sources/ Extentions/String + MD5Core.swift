//
//  String + MD5Core.swift
//  URLSession
//
//  Created by Евгений Ганусенко on 4/28/22.
//

import Foundation
import CryptoKit

extension String {
    func md5() -> String {
        return Insecure.MD5.hash(data: self.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
    }
}
