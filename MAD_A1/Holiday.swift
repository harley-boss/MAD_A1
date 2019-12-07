//
//  Holiday.swift
//  MAD_A1
//
//  Created by Nathan Davis on 2019-12-07.
//  Copyright © 2019 Saline Solutions. All rights reserved.
//

import Foundation

struct HolidayResponse:Decodable {
    var response:Holidays
}

struct Holidays:Decodable {
    var holidays:[HolidayDetail]
}

struct HolidayDetail:Decodable {
    var name:String
    var date:DateInfo
}

struct DateInfo:Decodable {
    var iso:String
}
