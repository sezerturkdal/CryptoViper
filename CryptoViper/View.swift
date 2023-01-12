//
//  View.swift
//  CryptoViper
//
//  Created by Sezer on 10.01.2023.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter : AnyPresenter?{get set}
    
    func update(with cryptos:[Crypto])
    func update(with error:String)
}

class CryptoViewController : UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource{
    
    var presenter: AnyPresenter?
    var cryptos : [Crypto] = []
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden=true
        return table
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.isHidden = false
        label.text = "Downloading..."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.blue
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        messageLabel.frame = CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 25, width: 200, height: 50)
        
    }
    
    func update(with cryptos: [Crypto]) {
        DispatchQueue.main.async {
            self.cryptos = cryptos
            self.messageLabel.isHidden = false
            self.tableView.reloadData()
            self.tableView.isHidden = true
        }
    }
    
    func update(with error: String) {
        
    }
    
    
}
