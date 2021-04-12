//
//  CryptoViewModel.swift
//  CryptoCoinApp
//
//  Created by Cengizhan DUMLU on 12.04.2021.
//

import Foundation

//her bir view icin bir viewModel olması gerekiyor.
//amacımız viewModel sabitlestirmek

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency] //crypto modelini degisken halinde tutan bir attribute
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel{
        
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)//crypto view model objesi olusturacak

    }
    
    
}

struct CryptoViewModel {//liste ve tekil elemanı ayrı ayrı gösterdik
    
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    
    var price : String {
        return self.cryptoCurrency.price
    }
    
    
}

//viewModel dedigimiz model bir struct

