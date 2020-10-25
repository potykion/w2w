import 'api_clients.dart';
import 'models.dart';

class LoadLamodaClothing {
  final LamodaParseApiClient apiClient;

  LoadLamodaClothing(this.apiClient);

  Future<Clothing> call(String lamodaLink) => apiClient(lamodaLink);
}
