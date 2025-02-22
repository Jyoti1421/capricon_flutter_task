class StockDetailModel {
  final int id;
  final String name;
  final String symbol;
  final String createdAt;
  final String updatedAt;
  final String alpacaId;
  final String exchange;
  final String description;
  final String assetType;
  final String isin;
  final String industry;
  final String sector;
  final int employees;
  final String website;
  final String address;
  final String netZeroProgress;
  final int carbonIntensityScope3;
  final int carbonIntensityScope1And2;
  final int carbonIntensityScope1And2And3;
  final String tempAlignmentScopes1And2;
  final bool dnshAssessmentPass;
  final bool goodGovernanceAssessment;
  final bool contributeToEnvironmentOrSocialObjective;
  final bool sustainableInvestment;
  final int scope1Emissions;
  final int scope2Emissions;
  final int scope3Emissions;
  final int totalEmissions;
  final String listingDate;
  final String marketCap;
  final int ibkrConnectionId;
  final double price;
  final double changePercent;
  final List<dynamic> holdings;
  final List<dynamic> sectorAllocation;
  final double sustainableInvestmentHoldingPercentage;
  final bool inPortfolio;

  StockDetailModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.createdAt,
    required this.updatedAt,
    required this.alpacaId,
    required this.exchange,
    required this.description,
    required this.assetType,
    required this.isin,
    required this.industry,
    required this.sector,
    required this.employees,
    required this.website,
    required this.address,
    required this.netZeroProgress,
    required this.carbonIntensityScope3,
    required this.carbonIntensityScope1And2,
    required this.carbonIntensityScope1And2And3,
    required this.tempAlignmentScopes1And2,
    required this.dnshAssessmentPass,
    required this.goodGovernanceAssessment,
    required this.contributeToEnvironmentOrSocialObjective,
    required this.sustainableInvestment,
    required this.scope1Emissions,
    required this.scope2Emissions,
    required this.scope3Emissions,
    required this.totalEmissions,
    required this.listingDate,
    required this.marketCap,
    required this.ibkrConnectionId,
    required this.price,
    required this.changePercent,
    required this.holdings,
    required this.sectorAllocation,
    required this.sustainableInvestmentHoldingPercentage,
    required this.inPortfolio,
  });
  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    double safeDouble(dynamic value) {
      if (value is double) {
        return value;
      } else if (value is int) {
        return value.toDouble();
      } else {
        return 0.0; // Default value if it's neither int nor double
      }
    }

    return StockDetailModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'N/A',
      symbol: json['symbol'] ?? 'N/A',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      alpacaId: json['alpaca_id'] ?? '',
      exchange: json['exchange'] ?? 'N/A',
      description: json['description'] ?? 'No description available',
      assetType: json['asset_type'] ?? 'N/A',
      isin: json['isin'] ?? '',
      industry: json['industry'] ?? 'N/A',
      sector: json['sector'] ?? 'N/A',
      employees: json['employees'] ?? 0,
      website: json['website'] ?? '',
      address: json['address'] ?? '',
      netZeroProgress: json['net_zero_progress'] ?? '',
      carbonIntensityScope3: json['carbon_intensity_scope_3'] ?? 0,
      carbonIntensityScope1And2: json['carbon_intensity_scope_1_and_2'] ?? 0,
      carbonIntensityScope1And2And3:
          json['carbon_intensity_scope_1_and_2_and_3'] ?? 0,
      tempAlignmentScopes1And2: json['temp_alignment_scopes_1_and_2'] ?? '',
      dnshAssessmentPass: json['dnsh_assessment_pass'] ?? false,
      goodGovernanceAssessment: json['good_governance_assessment'] ?? false,
      contributeToEnvironmentOrSocialObjective:
          json['contribute_to_environment_or_social_objective'] ?? false,
      sustainableInvestment: json['sustainable_investment'] ?? false,
      scope1Emissions: json['scope_1_emissions'] ?? 0,
      scope2Emissions: json['scope_2_emissions'] ?? 0,
      scope3Emissions: json['scope_3_emissions'] ?? 0,
      totalEmissions: json['total_emissions'] ?? 0,
      listingDate: json['listing_date'] ?? '',
      marketCap: json['market_cap'] ?? 'N/A',
      ibkrConnectionId: json['ibkr_connection_id'] ?? 0,
      price: safeDouble(json['price']),
      changePercent: safeDouble(json['change_percent']),
      holdings: json['holdings'] ?? [],
      sectorAllocation: json['sector_allocation'] ?? [],
      sustainableInvestmentHoldingPercentage: safeDouble(
        json['sustainable_investment_holding_percentage'],
      ),
      inPortfolio: json['in_portfolio'] ?? false,
    );
  }
}

class StockDetailState {
  final bool isLoading;
  final StockDetailModel? stock;
  final String errorMessage;

  StockDetailState({
    required this.isLoading,
    this.stock,
    required this.errorMessage,
  });

  // Initial state with no data and not loading
  factory StockDetailState.initial() =>
      StockDetailState(isLoading: false, stock: null, errorMessage: '');

  // Factory method to show loading state
  factory StockDetailState.loading() =>
      StockDetailState(isLoading: true, stock: null, errorMessage: '');

  // Factory method to show error state
  factory StockDetailState.error(String message) =>
      StockDetailState(isLoading: false, stock: null, errorMessage: message);

  // Factory method to show results after fetching stock details
  factory StockDetailState.success(StockDetailModel stock) =>
      StockDetailState(isLoading: false, stock: stock, errorMessage: '');
}
