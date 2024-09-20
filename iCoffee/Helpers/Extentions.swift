//
//  Extentions.swift
//  iCoffee
//
//  Created by Aman on 16/05/23.
//

import Foundation
import CoreLocation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
