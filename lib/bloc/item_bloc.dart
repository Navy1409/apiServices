// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../services/api_service.dart';
// import '../models/item.dart';
//
// abstract class ItemEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class FetchItems extends ItemEvent {}
//
// abstract class ItemState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }
//
// class ItemInitial extends ItemState {}
// class ItemLoading extends ItemState {}
// class ItemLoaded extends ItemState {
//   final List<Item> items;
//
//   ItemLoaded(this.items);
// }
// class ItemError extends ItemState {}
//
// class ItemBloc extends Bloc<ItemEvent, ItemState> {
//   final ApiService apiService;
//
//   ItemBloc({required this.apiService}) : super(ItemInitial());
//
//   @override
//   Stream<ItemState> mapEventToState(ItemEvent event) async* {
//     if (event is FetchItems) {
//       yield ItemLoading();
//       try {
//         final items = await apiService.fetchItems();
//         yield ItemLoaded(items);
//       } catch (_) {
//         yield ItemError();
//       }
//     }
//   }
// }
