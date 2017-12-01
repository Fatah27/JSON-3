//
//  kelasTableViewController.swift
//  DataSiswaIDNApps
//
//  Created by FatahKhair on 11/21/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class kelasTableViewController: UITableViewController {
    var kelasselected:String?
    var jumlahselected:String?
    var idselected:String?
    
    var user = [Kelas]()
    var irr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/DataSiswaServer/index.php/Kelas/getKelas").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.irr = resData as! [[String:AnyObject]]
                }
                if self.irr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return irr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKelas", for: indexPath) as! kelasTableViewCell
        var dict = irr[indexPath.row]
        cell.kelas.text = dict["nama_kelas"] as? String
        cell.jumlah.text = dict["jumlah_siswaa"] as? String
        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = irr[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        kelasselected = task["nama_kelas"] as? String
        //  gambarSelcetd = task["gambar"] as! String
        jumlahselected = task["jumlah_siswaa"] as? String
        idselected = task["id_kelas"] as? String
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passKelas", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "passKelas"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! kelasViewController
                let value = irr[indexPath.row]
                controller.passJumlah = value["jumlah_siswaa"] as? String
                controller.passKelas = value["nama_kelas"] as? String
                controller.passid = value["id_kelas"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }
}




