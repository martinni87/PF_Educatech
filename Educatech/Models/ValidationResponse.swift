//
//  ValidationError.swift
//  Educatech
//
//  Created by Martín Antonio on 26/5/23.
//

import SwiftUI

struct ValidationResponse: Error {
    var title: Text = Text("")
    var message: Text = Text("")
    var response: Bool = false
    var alert: Bool = false
}
