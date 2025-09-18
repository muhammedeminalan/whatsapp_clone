import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/utils/extensions/index.dart';
import 'package:whatsapp_clone/core/widgets/index.dart';
import '../../widgets/storage_widgets/phone_storage_card.dart';
import '../../widgets/storage_widgets/app_data_card.dart';
import '../../widgets/storage_widgets/storage_categories_section.dart';
import 'cubits/storage_cubit.dart';

/// Depolama ve veri görüntüleme sayfası
/// Cihaz depolama bilgilerini animasyonlu olarak gösterir
class StorageView extends StatefulWidget {
  const StorageView({super.key});

  @override
  State<StorageView> createState() => _StorageViewState();
}

class _StorageViewState extends State<StorageView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  /// Animasyon controller'ını başlatır
  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  /// Ana body widget'ını oluşturur
  Widget _buildBody() {
    return BlocBuilder<StorageCubit, StorageState>(
      builder: (context, state) {
        if (state is StorageLoading) {
          return _buildLoadingWidget();
        } else if (state is StorageLoaded) {
          return _buildLoadedContent(state);
        } else if (state is StorageError) {
          return _buildErrorWidget(state.message);
        }
        return _buildLoadingWidget();
      },
    );
  }

  /// Yükleme durumu widget'ı
  Widget _buildLoadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Hata durumu widget'ı
  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 64, color: Colors.red[300]),
          16.height,
          Text("Hata: $message", style: const TextStyle(fontSize: 16)),
          16.height,
          ElevatedButton(
            onPressed: () => context.read<StorageCubit>().refreshStorageData(),
            child: const Text("Tekrar Dene"),
          ),
        ],
      ),
    );
  }

  /// Yüklenen içerik widget'ı
  Widget _buildLoadedContent(StorageLoaded state) {
    return SingleChildScrollView(
      child: [
        20.height,
        PhoneStorageCard(
          usedStorage: state.usedStorage,
          totalStorage: state.totalStorage,
          animationValue: _animation.value,
        ),
        20.height,
        AppDataCard(
          appDataSize: state.appDataSize,
          animationValue: _animation.value,
        ),
        20.height,
        StorageCategoriesSection(
          categories: state.categories,
          appDataSize: state.appDataSize,
          animationValue: _animation.value,
        ),
        30.height,
      ].column(crossAxisAlignment: CrossAxisAlignment.start),
    );
  }

  /// Uygulama başlık çubuğunu oluşturur
  CoreAppBar _buildAppBar() {
    return CoreAppBar(titleText: "Depolama ve Veri");
  }
}
