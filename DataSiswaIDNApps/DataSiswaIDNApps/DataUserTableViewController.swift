//
//  DataUserTableViewController.swift
//  DataSiswaIDNApps
//
//  Created by Nando Septian Husni on 18/11/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DataUserTableViewController: UITableViewController {
    
    var emailselected:String?
    var usernameselected:String?
    var idselected:String?
    var tglSelected:String?
    var passwordselected:String?
    
    var user = [User]()
    var arr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://localhost/DataSiswaServer/index.php/Api/getUser").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
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
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "user", for: indexPath) as!
        UserTableViewCell

        // Configure the cell...
        var dict = arr[indexPath.row]
        cell.username.text = dict["username"] as? String
        cell.email.text = dict["email"] as? String

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        idselected = task["id_user"] as? String
        //  gambarSelcetd = task["gambar"] as! String
        usernameselected = task["username"] as? String
        emailselected = task["email"] as? String
        passwordselected = task["password"] as? String
        tglSelected = task["tgl_daftar"] as? String
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            //        let kirimData = segue.destination as! KontakViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arr[indexPath.row]
                controller.passPassword = value["password"] as? String
                controller.passNama = value["username"] as? String
                controller.passid = value["id_user"] as? String
                controller.passtgl = value["tgl_daftar"] as? String
                controller.passEmail = value["email"] as? String
                // controller.passgambar = value["gambar"] as? UIImage
            }
        }
    }
}


