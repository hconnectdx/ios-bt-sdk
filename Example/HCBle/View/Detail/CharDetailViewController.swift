//
//  CharDetailViewController.swift
//  HCBle_Example
//
//  Created by 곽민우 on 2/26/25.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import CoreBluetooth
import HCBle
import UIKit

class CharDetailViewController: UIViewController {
    @IBOutlet var lblChar: UILabel!
    var uuid: UUID!
    var service: CBService!
    var characteristic: CBCharacteristic!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblChar.text = characteristic.uuid.uuidString
//        HCBle.shared.setService(uuid: uuid, service: service)
//        HCBle.shared.setChar(uuid: uuid, characteristic: characteristic)

        HCBle.shared.setTargetService(uuid: uuid, serviceUUID: service.uuid.uuidString)
        HCBle.shared.setTargetChar(uuid: uuid, characteristicUUID: characteristic.uuid.uuidString)
    }

    @IBAction func onClickWrite(_ sender: UIButton) {
        let byteArray = [UInt8]("ECG_RESTART".utf8)
        let data = Data(byteArray)
        HCBle.shared.writeData(uuid: uuid, data: data)
    }

    @IBAction func onClickRead(_ sender: UIButton) {
        HCBle.shared.readData(uuid: uuid)
    }

    @IBAction func onClickSubscribe(_ sender: UIButton) {
        HCBle.shared.enableNotifications(uuid: uuid)
    }
}
