package com.lunchvote

class Vote {

    String selectionName
    String username
    Double weight = 1

    static constraints = {
    }

    def beforeInsert(){
        if(!weight) weight = 1
    }

}
