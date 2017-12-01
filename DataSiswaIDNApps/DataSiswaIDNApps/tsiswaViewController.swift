//
//  tsiswaViewController.swift
//  DataSiswaIDNApps
//
//  Created by FatahKhair on 11/21/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class tsiswaViewController: UIViewController {
    @IBOutlet weak var etuser: UITextField!
    @IBOutlet weak var etkelas: UITextField!
    @IBOutlet weak var etalamat: UITextField!
    @IBOutlet weak var etjenis: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        let nuser = etuser.text!
        let nkelas = etkelas.text!
        let nalamat = etalamat.text!
        let njenis = etjenis.text!
        
        if ((nuser.isEmpty) || (nkelas.isEmpty) || (nalamat.isEmpty) || (njenis.isEmpty)) {
            let alertWarning = UIAlertController(title: "Warning", message: "This is required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            let paramss = ["nama_siswa" : nuser, "id_kelas" : nkelas, "alamat" : nalamat, "jnis_kelamin" : njenis]
            print (paramss)
            
            let url = "http://localhost/DataSiswaServer/index.php/Siswa/daftar"
            
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
