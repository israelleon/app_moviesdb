//
//  ModuleBuilderProtocol.swift
//  moviesdb
//
//  Created by Israel Alejandro Dzul León on 03/03/23.
//


protocol ModuleBuilderProtocol {
    associatedtype ViewController
    func build() -> ViewController
}
