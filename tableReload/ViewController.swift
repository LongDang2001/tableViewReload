//
//  ViewController.swift
//  tableReload
//
//  Created by admin on 6/29/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtView: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var arrayData: [String] = []
    
    var index = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "IDCell")
        // khai báo như này thì khi nào các gt cung đc hiển thị lên màn hình.
        arrayData = ["label1","label2","label3","label4","label5","label6"]
        view.addSubview(tableView)
    }
    
    // sử dụng kiểu thay đổi hiển thị ngay.
    @IBAction func txtEditingChanged(_ sender: Any) {
        if let cell = tableView.cellForRow(at: index) as? UITableViewCell  {
            // gán text của txtView bằng với text của cell
            cell.textLabel?.text = self.txtView.text
            
        }
        
    }
    
    
    
    @IBAction func btnUpdateClick() {
        // khi bấm vào nút thì pass data từ txtView Xuống các cell của tableView
//        if let cell = tableView.cellForRow(at: index) as? UITableViewCell  {
//            // gán text của txtView bằng với text của cell
//            cell.textLabel?.text = self.txtView.text
//
//        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath)
        if cell != nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "IDCell") as! UITableViewCell
        }
        
        cell.textLabel?.text = arrayData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // gán index toàn cục bằng với indexPath của vị trí cell, sau đó dùng cho hàm nút bấm.
        index = indexPath
        
        // gán txtView bằng với các index của cell
        txtView.text = arrayData[indexPath.row]
    }
    
    
}

