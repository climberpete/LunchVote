package com.lunchvote

class Vote {

    String selectionName
    Long restaurantId
    Long user
    Double weight

    static constraints = {
        selectionName(nullable: true)
    }
}
