//
//  siswaTableViewController.swift
//  DataSiswaIDNApps
//
//  Created by abdul fatah on 11/20/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class siswaTableViewController: UITableViewController {
    var idselected:String?
    var usernameselected:String?
    var kelasSelected:String?
    var alamatselected:String?
    var jeniskelaminselected:String?
    
    var user = [Siswa]()
    var orr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/DataSiswaServer/index.php/Siswa/getSiswa").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.orr = resData as! [[String:AnyObject]]
                }
                if self.orr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return orr.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siswa", for: indexPath) as!
        TableViewCell
        
        // Configure the cell...
        var dict = orr[indexPath.row]
        cell.nama.text = dict["nama_siswa"] as? String
        cell.jnisKelamin.text = dict["jnis_kelamin"] as? String
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = orr[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        idselected = task["id_siswa"] as? String
        //  gambarSelcetd = task["gambar"] as! String
        usernameselected = task["nama_siswa"] as? String
        kelasSelected = task["id_kelas"] as? String
        alamatselected = task["alamat"] as? String
        jeniskelaminselected = task["jnis_kelamin"] as? String
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passSiswa", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "passSiswa"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! siswaViewController
                let value = orr[indexPath.row]
                controller.passJeniskelamin = value["jnis_kelamin"] as? String
                controller.passUsername = value["nama_siswa"] as? String
                controller.passID = value["id_siswa"] as? String
                controller.passKelas = value["id_kelas"] as? String
                controller.passalamat = value["alamat"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }
}



