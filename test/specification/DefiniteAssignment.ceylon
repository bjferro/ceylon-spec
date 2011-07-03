interface DefiniteAssignment {
    
    class X() {}
    void doSomething() {}
    void doSomethingElse() {}
    void doNothing() {}
    void use(X x) {}
    Boolean testSomething()  { return 1>100; }
    
    //void methods:
    
    void badMethodWithImmutableSpec() {
        @error variable X x = X();
    }
    
    void badMethodWithImmutableSpec2() {
        variable X x;
        @error x = X();
    }
    
    void goodMethodWithNoSpec() {
        variable X x;
        doSomething();
        doSomethingElse();
    }
    
    void badMethodWithNoSpec() {
        variable X x;
        doSomething();
        doSomethingElse();
        @error use(x);
    }
    
    void goodMethodWithSpec() {
        variable X x;
        doSomething();
        x := X();
        doSomethingElse();
        use(x);
    }
    
    void badMethodWithSpec() {
        variable X x;
        doSomething();
        @error use(x);
        doSomethingElse();
        x := X();
    }
    
    void badMethodWithRepeatedSpec() {
        variable X x;
        doSomething();
        x := X();
        doSomethingElse();
        x := X();
    }
        
    void badMethodWithRecursiveSpec() {
        variable X x;
        doSomething();
        @error x := x;
        doSomethingElse();
        use(x);
    }
    
    void badMethodWithRecursiveSpec2() {
        @error variable X x := x;
        doSomething();
        use(x);
    }
    
    void goodMethodWithRecursiveSpec3() {
        variable X y := X();
        variable X x := y;
        use(x);
    }
    
    void goodMethodWithSpecInIf() {
        variable X x;
        if (testSomething()) {
            doSomething();
            x := X();
            doSomethingElse();
            use(x);
        }
        doNothing();
    }
    
    void badMethodWithSpecInIf() {
        variable X x;
        if (testSomething()) {
            doSomething();
            x := X();
            doSomethingElse();
        }
        doNothing();
        @error use(x);
    }
    
    void goodMethodWithSpecInIf2() {
        variable X x;
        if (testSomething()) {
            x := X();
            doSomething();
            use(x);
        }
        else {
            doSomethingElse();
        }
        doNothing();
    }
    
    void badMethodWithSpecInIf2() {
        variable X x;
        if (testSomething()) {
            doSomething();
            x := X();
        }
        else {
            doSomethingElse();
            @error use(x);
        }
        doNothing();
    }
    
    void badMethodWithSpecInIf3() {
        variable X x;
        if (testSomething()) {
            doSomething();
            x := X();
            use(x);
        }
        else {
            doSomethingElse();
        }
        doNothing();
        x := X();
    }
    
    void badMethodWithSpecInIf4() {
        variable X x := X();
        doNothing();
        if (testSomething()) {
            doSomething();
            x := X();
        }
    }
    
    void badMethodWithSpecInIf5() {
        variable X x;
        doNothing();
        x := X();
        if (testSomething()) {
            doSomething();
            x := X();
        }
    }
    
    void goodMethodWithSpecInNestedIf() {
        variable X x;
        if (testSomething()) {
            x := X();
            if (testSomething()) {
                doSomething();
                use(x);
            }
            else {
                use(x);
            }
        }
        else {
            doSomethingElse();
        }
    }
    
    void badMethodWithSpecInNestedIf() {
        variable X x;
        if (testSomething()) {
            if (testSomething()) {
                x := X();
                doSomething();
                use(x);
            }
            else {
                @error use(x);
            }
        }
        else {
            doSomethingElse();
        }
    }
        
    void goodMethodWithSpecInElse() {
        variable X x;
        if (testSomething()) {
            doSomething();
        }
        else {
            x := X();
            doNothing();
            use(x);
        }
        doSomethingElse();
    }
    
    void badMethodWithSpecInElse() {
        variable X x;
        if (testSomething()) {
            doSomething();
            @error use(x);
        }
        else {
            x := X();
            doNothing();
            use(x);
        }
        doSomethingElse();
    }
    
    void badMethodWithSpecInElse2() {
        variable X x;
        if (testSomething()) {
            doSomething();
        }
        else {
            x := X();
            doNothing();
            use(x);
        }
        doSomethingElse();
        x := X();
    }
    
    void badMethodWithSpecInElse3() {
        variable X x := X();
        doSomethingElse();
        if (testSomething()) {
            doSomething();
        }
        else {
            x := X();
            doNothing();
        }
    }
    
    void badMethodWithSpecInElse4() {
        variable X x;
        doSomethingElse();
        x := X();
        if (testSomething()) {
            doSomething();
        }
        else {
            x := X();
            doNothing();
        }
    }
    
    void goodMethodWithSpecInIfAndElse() {
        variable X x;
        if (testSomething()) {
            x := X();
            doSomething();
            use(x);
        }
        else {
            x := X();
            doSomethingElse();
            use(x);
        }
    }
    
    void goodMethodWithSpecInIfAndElse2() {
        variable X x;
        if (testSomething()) {
            doSomething();
            x := X();
        }
        else {
            doSomethingElse();
            x := X();
        }
        use(x);
    }
    
    void goodMethodWithRecursiveSpecInIfAndElse() {
        variable X y;
        if (testSomething()) {
            y := X();
        }
        else {
            y := X();
            use(y);
        }
        variable X x := y;
        use(x);
    }
    
    void badMethodWithRecursiveSpecInIf() {
        variable X y;
        if (testSomething()) {
            y := X();
        }
        @error variable X x := y;
    }
    
    void goodMethodWithSpecInFor() {
        for (X x in {X()}) {
            variable X y;
            doSomething();
            y := x;
        }
        doNothing();
    }
    
    void badMethodWithSpecInFor() {
        variable X y;
        for (X x in {X()}) {
            doSomething();
            y := x;
        }
        doNothing();
    }
    
    void goodMethodWithSpecInFail() {
        variable X y;
        for (X x in {X()}) {
            doSomething();
        }
        fail {
            doSomethingElse();
            y := X();
        }
        doNothing();
    }
    
    void badMethodWithSpecInFail() {
        for (X x in {X()}) {
            variable X y;
            doSomething();
        }
        fail {
            doSomethingElse();
            @error y := X();
        }
        doNothing();
    }
    
    void badMethodWithSpecInFail2() {
        variable X y;
        for (X x in {X()}) {
            doSomething();
        }
        fail {
            doSomethingElse();
            y := X();
        }
        doNothing();
        @error use (y);
    }
    
    void goodMethodWithSpecInWhile() {
        while (testSomething()) {
            variable X x;
            doSomething();
            x := X();
        }
        doSomethingElse();
    }
    
    void badMethodWithSpecInWhile() {
        variable X x;
        while (testSomething()) {
            doSomething();
            x := X();
        }
        doSomethingElse();
    }
    
    void goodMethodWithSpecInDo() {
        do {
            variable X x;
            doSomething();
            x := X();
        }
        while (testSomething());
    }
    
    void badMethodWithSpecInDo() {
        variable X x;
        do {
            doSomething();
            x := X();
        }
        while (testSomething());
    }
    
}