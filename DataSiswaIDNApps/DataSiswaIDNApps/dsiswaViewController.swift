//
//  dsiswaViewController.swift
//  DataSiswaIDNApps
//
//  Created by FatahKhair on 11/21/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class dsiswaViewController: UIViewController {
    @IBOutlet weak var inputkelas: UITextField!
    @IBOutlet weak var inputJumlah: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSave(_ sender: Any) {
        let nkelas = inputkelas.text!
        let njumlah = inputJumlah.text!
        if ((nkelas.isEmpty) || (njumlah.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let paramss = ["nama_kelas" : nkelas, "jumlah_siswaa" : njumlah]
            print (paramss)
            
            let url = "http://localhost/DataSiswaServer/index.php/Kelas/daftar"
            
            Alamofire.request(url, method: .post, parameters: paramss, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data berhasil disimpan", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self.present(alertWarning, animated: true, completion: nil)
                    
                }
                
            })
        }
    }
}

