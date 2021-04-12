//
//  ViewController.swift
//  CryptoCoinApp
//
//  Created by Cengizhan DUMLU on 12.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel! //karısıklık olmaması icin private olarak tanımladık
    
    var colorArray = [UIColor]() //color array dizisi olusturduk
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 75/255, green: 57/255, blue: 210/255, alpha: 1.0),
            UIColor(red: 10/255, green: 147/255, blue: 14/255, alpha: 1.0),
            UIColor(red: 104/255, green: 57/255, blue: 54/255, alpha: 1.0),
            UIColor(red: 104/255, green: 127/255, blue: 64/255, alpha: 1.0),
            UIColor(red: 114/255, green: 57/255, blue: 214/255, alpha: 1.0),
            UIColor(red: 154/255, green: 67/255, blue: 225/255, alpha: 1.0),

        ]
        
        getData()

    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if cryptos != nil { //optional iptal edildi
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                //tableView icin reloadData yerine internetten indirecegimiz icin DispatchQueue kullanacagız
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection() //nil oldugunda sıfır göster degilse göster
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row) //her bir cell icin yeni bir cryptoViewModel olusturulacak
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6] //her gelen sey icin altıya böl ve kalanı yazdır.
        
        return cell
    }
    


}

