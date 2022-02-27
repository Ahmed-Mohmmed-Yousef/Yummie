//
//  String+Ext.swift
//  Yummie
//
//  Created by Ahmed on 27/02/2022.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
