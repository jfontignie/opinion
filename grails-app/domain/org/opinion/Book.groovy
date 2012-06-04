package org.opinion

class Book extends Product{

    static belongsTo = [author: Author]

    static constraints = {
        title(blank: false)
        author(nullable: false)
    }

    String toString() {
        return title;
    }
}
