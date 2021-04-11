//
//  DataModel.swift
//  SwiftUIWebinar
//
//  Created by user on 09.04.2021.
//

import Foundation
import Combine

final class DataModel: ObservableObject { // подписание под протокол ObservableObject
    @Published var title: String = "Apples"
    @Published var description: String = "Eating big apples"
}
