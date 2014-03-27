package lunchvote

import com.lunchvote.Vote

class VoteService {

    def getDistinct() {
        def voteList = Vote.getAll()
        def distinctVotes = []
        voteList.each{ vote ->
            def found = false
            distinctVotes.each{ distinct ->
                if(vote.selectionName == distinct.selectionName){
                    distinct.weight += vote.weight
                    found = true
                }
            }
            if(!found)distinctVotes.add(["selectionName": vote.selectionName, "weight": vote.weight])
        }
        return distinctVotes
    }
}
