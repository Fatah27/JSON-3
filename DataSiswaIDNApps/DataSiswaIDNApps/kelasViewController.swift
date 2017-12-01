//
//  kelasViewController.swift
//  DataSiswaIDNApps
//
//  Created by FatahKhair on 11/21/17.
//  Copyright © 2017 Rizki Syaputra. All rights reserved.
//

import UIKit

class kelasViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var kelas: UILabel!
    @IBOutlet weak var jumlahSiswa: UILabel!
    
    var passid:String?
    var passKelas:String?
    var passJumlah:String?
    
    
    override func viewDidLoad() {
        id.text = passid!
        kelas.text = passKelas!
        jumlahSiswa.text = passJumlah!
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
