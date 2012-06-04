package org.opinion

class Product {

    String title

    Date dateCreated
    Date lastUpdated

    static hasMany = [opinions: Opinion]
    double average

    static constraints = {
    }
}
