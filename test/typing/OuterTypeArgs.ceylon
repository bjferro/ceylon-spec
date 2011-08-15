class OuterTypeArgs() {
	class Foo<T>() {
		shared default class Bar<S>() {
			Bar<S> b0 = Bar<S>();
			@error Bar<S> b1 = Foo<Natural>().Bar<S>();
			Bar<S> b2 = Foo<T>().Bar<S>();
			shared default Bar<S> get() {
				return this;
			}
			shared T getT() {
				throw;
			}
			shared class Qux<R>() {
				shared Bar<S> bar {
					return outer;
				}
			}
		}
	}
	class Baz<T>() extends Foo<T>() {}
	class Fum<T>() extends Foo<T>() {
		shared actual class Bar<S>() extends super.Bar<S>() {
			shared actual Bar<S> get() {
				return this;
			}
		}
	}
	Baz<String>.Bar<Natural> foobar = Baz<String>().Bar<Natural>();
	@type["OuterTypeArgs.Foo<String>.Bar<Natural>"] value fbg = foobar.get();
	@type["String"] value fbgt = foobar.getT();
	Baz<Float>.Bar<String>.Qux<Object> foobarqux = Baz<Float>().Bar<String>().Qux<Object>();
	@type["OuterTypeArgs.Foo<Float>.Bar<String>"] value fbqg = foobarqux.bar;

	Fum<String>.Bar<Natural> fumbar = Fum<String>().Bar<Natural>();
	@type["OuterTypeArgs.Fum<String>.Bar<Natural>"] value fmbg = fumbar.get();
	Fum<String>.Bar<Natural>.Qux<Integer> fumbarqux = Fum<String>().Bar<Natural>().Qux<Integer>();
	@type["OuterTypeArgs.Foo<String>.Bar<Natural>"] value fmbqg = fumbarqux.bar;
	
	Foo<String>.Bar<Natural> fb1 = fmbg;
	Foo<String>.Bar<Natural> fb2 = fbg; 
	Fum<String>.Bar<Natural> fb3 = fmbg;
	@error Fum<String>.Bar<Natural> fb4 = fbg; 
	Baz<String>.Bar<Natural> fb5 = fmbg;
	Baz<String>.Bar<Natural> fb6 = fbg; 
}

