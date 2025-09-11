abstract class Usecase<T, P> {
  Future<Type> call({P params});
}
