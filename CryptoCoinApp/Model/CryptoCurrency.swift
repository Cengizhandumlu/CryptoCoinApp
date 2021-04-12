//
//  CryptoCurrency.swift
//  CryptoCoinApp
//
//  Created by Cengizhan DUMLU on 12.04.2021.
//

import Foundation

struct CryptoCurrency : Decodable {
    //api dosyasında olan degiskenlerle aynı isimde olması gerekiyor
    let currency : String
    let price : String
}
