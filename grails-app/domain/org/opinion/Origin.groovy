package org.opinion

/**
 * Author: Jacques Fontignie
 * Date: 5/31/12
 * Time: 7:58 AM
 */
enum Origin {

    WORK("work"),
    HOBBY("hobby")

    String name
    Origin(String name){
        this.name = name
    }
}
