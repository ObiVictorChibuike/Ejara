import 'package:dio/dio.dart';
import 'package:ejara_test_project/data/services/dashboard_services/vendor_services.dart';

class VendorRepository {
  final VendorServices _vendorServices;
  VendorRepository(this._vendorServices);
  Future<Response?> getTopRatedVendors() => _vendorServices.getTopRatedVendors();
  Future<Response?> getAllVendors() => _vendorServices.getAllVendors();
}