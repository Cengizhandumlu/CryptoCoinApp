//
//  Webservice.swift
//  CryptoCoinApp
//
//  Created by Cengizhan DUMLU on 12.04.2021.
//

import Foundation

class Webservice {
    //internetten veri cekme kısmı
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency])->()){
        //internetten bir veri gelecek ve geldikten sonra bunu döndürecegimiz icin @escaping kullandık
        //ve gelen data dizi olarak aldık icinde veriler var
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                //bir hata varsa veri gelmedi ve nil gönderildi
            }else if let data = data {
                //json dosyalarını islememizi saglıyor jsonDecoder ve icerisine cryptoCurrency aldı dizi seklinde
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList{
                    completion(cryptoList)
            
                }
            }
        
        }.resume()
        
    
    }
}
