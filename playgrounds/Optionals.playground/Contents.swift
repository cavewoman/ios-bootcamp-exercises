//: Playground - noun: a place where people can play

import UIKit

var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?

if let theError = errorCodeString, let errorCodeInteger = Int(theError),
    errorCodeInteger == 404 {
    errorDescription = "\(errorCodeInteger + 200): resource was not found."
}

var upcaseErrorDescription = errorDescription?.uppercased()
errorDescription

upcaseErrorDescription?.append(" PLEASE TRY AGAIN")
upcaseErrorDescription


errorDescription = nil
let description = errorDescription ?? "No error"


