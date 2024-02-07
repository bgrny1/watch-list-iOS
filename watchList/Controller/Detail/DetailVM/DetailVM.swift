//
//  DetailVM.swift
//  watchList
//
//  Created by Buket girenay on 26.11.2023.
//

import Foundation
enum DetailVMStateChange: StateChange {
    case success
    case failure
}

class DetailVM:  StatefulVM<DetailVMStateChange> {
    let dataSource = DetailDS()
}
