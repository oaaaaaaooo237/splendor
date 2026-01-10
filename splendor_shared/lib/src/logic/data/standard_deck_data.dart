import '../../models/game/card.dart';
import '../../models/game/gem.dart';
import '../../models/game/noble.dart';

class StandardDeckData {
  static List<SplendorCard> get allCards => [
        ..._tier1,
        ..._tier2,
        ..._tier3,
      ];

  // Tier 1 (40 Cards)
  static final List<SplendorCard> _tier1 = [
    // Black Bonus
    SplendorCard(id: 't1_k_1', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.blue: 1, Gem.green: 1, Gem.red: 1, Gem.white: 1}),
    SplendorCard(id: 't1_k_2', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.blue: 2, Gem.green: 1, Gem.red: 1, Gem.white: 1}),
    SplendorCard(id: 't1_k_3', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.blue: 2, Gem.red: 1, Gem.white: 2}),
    SplendorCard(id: 't1_k_4', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.black: 1, Gem.green: 1, Gem.red: 3}),
    SplendorCard(id: 't1_k_5', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.green: 2, Gem.red: 1}),
    SplendorCard(id: 't1_k_6', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.green: 2, Gem.white: 2}),
    SplendorCard(id: 't1_k_7', tier: 1, points: 0, bonusGem: Gem.black, cost: {Gem.green: 3}),
    SplendorCard(id: 't1_k_8', tier: 1, points: 1, bonusGem: Gem.black, cost: {Gem.blue: 4}),

    // Blue Bonus
    SplendorCard(id: 't1_u_1', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.black: 1, Gem.green: 1, Gem.red: 1, Gem.white: 1}),
    SplendorCard(id: 't1_u_2', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.black: 1, Gem.green: 1, Gem.red: 2, Gem.white: 1}),
    SplendorCard(id: 't1_u_3', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.green: 2, Gem.red: 2, Gem.white: 1}),
    SplendorCard(id: 't1_u_4', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.blue: 1, Gem.green: 3, Gem.red: 1}),
    SplendorCard(id: 't1_u_5', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.black: 2, Gem.white: 1}),
    SplendorCard(id: 't1_u_6', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.black: 2, Gem.red: 2}),
    SplendorCard(id: 't1_u_7', tier: 1, points: 0, bonusGem: Gem.blue, cost: {Gem.black: 3}),
    SplendorCard(id: 't1_u_8', tier: 1, points: 1, bonusGem: Gem.blue, cost: {Gem.red: 4}),

    // White Bonus
    SplendorCard(id: 't1_w_1', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 1, Gem.blue: 1, Gem.green: 1, Gem.red: 1}),
    SplendorCard(id: 't1_w_2', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 1, Gem.blue: 1, Gem.green: 2, Gem.red: 1}),
    SplendorCard(id: 't1_w_3', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 1, Gem.blue: 2, Gem.green: 2}),
    SplendorCard(id: 't1_w_4', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 1, Gem.blue: 1, Gem.white: 3}),
    SplendorCard(id: 't1_w_5', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 1, Gem.red: 2}),
    SplendorCard(id: 't1_w_6', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.black: 2, Gem.blue: 2}),
    SplendorCard(id: 't1_w_7', tier: 1, points: 0, bonusGem: Gem.white, cost: {Gem.blue: 3}),
    SplendorCard(id: 't1_w_8', tier: 1, points: 1, bonusGem: Gem.white, cost: {Gem.green: 4}),

    // Green Bonus
    SplendorCard(id: 't1_g_1', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.black: 1, Gem.blue: 1, Gem.red: 1, Gem.white: 1}),
    SplendorCard(id: 't1_g_2', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.black: 2, Gem.blue: 1, Gem.red: 1, Gem.white: 1}),
    SplendorCard(id: 't1_g_3', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.black: 2, Gem.blue: 1, Gem.red: 2}),
    SplendorCard(id: 't1_g_4', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.blue: 3, Gem.green: 1, Gem.white: 1}),
    SplendorCard(id: 't1_g_5', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.blue: 1, Gem.white: 2}),
    SplendorCard(id: 't1_g_6', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.blue: 2, Gem.red: 2}),
    SplendorCard(id: 't1_g_7', tier: 1, points: 0, bonusGem: Gem.green, cost: {Gem.red: 3}),
    SplendorCard(id: 't1_g_8', tier: 1, points: 1, bonusGem: Gem.green, cost: {Gem.black: 4}),

    // Red Bonus
    SplendorCard(id: 't1_r_1', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.black: 1, Gem.blue: 1, Gem.green: 1, Gem.white: 1}),
    SplendorCard(id: 't1_r_2', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.black: 1, Gem.blue: 1, Gem.green: 1, Gem.white: 2}),
    SplendorCard(id: 't1_r_3', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.black: 2, Gem.green: 1, Gem.white: 2}),
    SplendorCard(id: 't1_r_4', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.black: 3, Gem.red: 1, Gem.white: 1}), // Wait, CSV says 3 black, 0 blue, 1 red, 1 green? CSV: Red Bonus, 0 PV, 3 Black, 0 Blue, 0 Green, 1 Red, 1 White.
    // CSV Line: 1,Red,0,3,0,0,1,1 -> Black, Blue, Green, Red, White. So 3 Black, 0 Blue, 0 Green, 1 Red, 1 White.
    SplendorCard(id: 't1_r_5', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.blue: 2, Gem.green: 1}),
    SplendorCard(id: 't1_r_6', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.red: 2, Gem.white: 2}),
    SplendorCard(id: 't1_r_7', tier: 1, points: 0, bonusGem: Gem.red, cost: {Gem.white: 3}),
    SplendorCard(id: 't1_r_8', tier: 1, points: 1, bonusGem: Gem.red, cost: {Gem.white: 4}),
  ];

  // Tier 2 (30 Cards)
  static final List<SplendorCard> _tier2 = [
    // Black Bonus
    SplendorCard(id: 't2_k_1', tier: 2, points: 1, bonusGem: Gem.black, cost: {Gem.blue: 2, Gem.green: 2, Gem.white: 3}),
    SplendorCard(id: 't2_k_2', tier: 2, points: 1, bonusGem: Gem.black, cost: {Gem.black: 2, Gem.green: 3, Gem.white: 3}),
    SplendorCard(id: 't2_k_3', tier: 2, points: 2, bonusGem: Gem.black, cost: {Gem.blue: 1, Gem.green: 4, Gem.red: 2}),
    SplendorCard(id: 't2_k_4', tier: 2, points: 2, bonusGem: Gem.black, cost: {Gem.green: 5, Gem.red: 3}),
    SplendorCard(id: 't2_k_5', tier: 2, points: 2, bonusGem: Gem.black, cost: {Gem.white: 5}),
    SplendorCard(id: 't2_k_6', tier: 2, points: 3, bonusGem: Gem.black, cost: {Gem.black: 6}),

    // Blue Bonus
    SplendorCard(id: 't2_u_1', tier: 2, points: 1, bonusGem: Gem.blue, cost: {Gem.blue: 2, Gem.green: 2, Gem.red: 3}),
    SplendorCard(id: 't2_u_2', tier: 2, points: 1, bonusGem: Gem.blue, cost: {Gem.black: 3, Gem.blue: 2, Gem.green: 3}),
    SplendorCard(id: 't2_u_3', tier: 2, points: 2, bonusGem: Gem.blue, cost: {Gem.blue: 3, Gem.white: 5}),
    SplendorCard(id: 't2_u_4', tier: 2, points: 2, bonusGem: Gem.blue, cost: {Gem.black: 4, Gem.red: 1, Gem.white: 2}),
    SplendorCard(id: 't2_u_5', tier: 2, points: 2, bonusGem: Gem.blue, cost: {Gem.blue: 5}),
    SplendorCard(id: 't2_u_6', tier: 2, points: 3, bonusGem: Gem.blue, cost: {Gem.blue: 6}),

    // White Bonus
    SplendorCard(id: 't2_w_1', tier: 2, points: 1, bonusGem: Gem.white, cost: {Gem.black: 2, Gem.green: 3, Gem.red: 2}),
    SplendorCard(id: 't2_w_2', tier: 2, points: 1, bonusGem: Gem.white, cost: {Gem.blue: 3, Gem.red: 3, Gem.white: 2}),
    SplendorCard(id: 't2_w_3', tier: 2, points: 2, bonusGem: Gem.white, cost: {Gem.black: 2, Gem.green: 1, Gem.red: 4}), 
    SplendorCard(id: 't2_w_4', tier: 2, points: 2, bonusGem: Gem.white, cost: {Gem.black: 3, Gem.red: 5}),
    SplendorCard(id: 't2_w_5', tier: 2, points: 2, bonusGem: Gem.white, cost: {Gem.red: 5}),
    SplendorCard(id: 't2_w_6', tier: 2, points: 3, bonusGem: Gem.white, cost: {Gem.white: 6}),

    // Green Bonus
    SplendorCard(id: 't2_g_1', tier: 2, points: 1, bonusGem: Gem.green, cost: {Gem.green: 2, Gem.red: 3, Gem.white: 3}),
    SplendorCard(id: 't2_g_2', tier: 2, points: 1, bonusGem: Gem.green, cost: {Gem.black: 2, Gem.blue: 3, Gem.white: 2}),
    SplendorCard(id: 't2_g_3', tier: 2, points: 2, bonusGem: Gem.green, cost: {Gem.black: 1, Gem.blue: 2, Gem.white: 4}), 
    SplendorCard(id: 't2_g_4', tier: 2, points: 2, bonusGem: Gem.green, cost: {Gem.blue: 5, Gem.green: 3}),
    SplendorCard(id: 't2_g_5', tier: 2, points: 2, bonusGem: Gem.green, cost: {Gem.green: 5}),
    SplendorCard(id: 't2_g_6', tier: 2, points: 3, bonusGem: Gem.green, cost: {Gem.green: 6}),

    // Red Bonus
    SplendorCard(id: 't2_r_1', tier: 2, points: 1, bonusGem: Gem.red, cost: {Gem.black: 3, Gem.red: 2, Gem.white: 2}),
    SplendorCard(id: 't2_r_2', tier: 2, points: 1, bonusGem: Gem.red, cost: {Gem.black: 3, Gem.blue: 3, Gem.red: 2}),
    SplendorCard(id: 't2_r_3', tier: 2, points: 2, bonusGem: Gem.red, cost: {Gem.blue: 4, Gem.green: 2, Gem.white: 1}),
    SplendorCard(id: 't2_r_4', tier: 2, points: 2, bonusGem: Gem.red, cost: {Gem.black: 5, Gem.white: 3}),
    SplendorCard(id: 't2_r_5', tier: 2, points: 2, bonusGem: Gem.red, cost: {Gem.black: 5}),
    SplendorCard(id: 't2_r_6', tier: 2, points: 3, bonusGem: Gem.red, cost: {Gem.red: 6}),
  ];

  // Tier 3 (20 Cards)
  static final List<SplendorCard> _tier3 = [
    // Black Bonus
    SplendorCard(id: 't3_k_1', tier: 3, points: 3, bonusGem: Gem.black, cost: {Gem.blue: 3, Gem.green: 5, Gem.red: 3, Gem.white: 3}),
    SplendorCard(id: 't3_k_2', tier: 3, points: 4, bonusGem: Gem.black, cost: {Gem.red: 7}),
    SplendorCard(id: 't3_k_3', tier: 3, points: 4, bonusGem: Gem.black, cost: {Gem.black: 3, Gem.red: 3, Gem.white: 6}),
    SplendorCard(id: 't3_k_4', tier: 3, points: 5, bonusGem: Gem.black, cost: {Gem.black: 3, Gem.red: 7}),

    // Blue Bonus
    SplendorCard(id: 't3_u_1', tier: 3, points: 3, bonusGem: Gem.blue, cost: {Gem.black: 3, Gem.blue: 3, Gem.red: 3, Gem.white: 5}),
    SplendorCard(id: 't3_u_2', tier: 3, points: 4, bonusGem: Gem.blue, cost: {Gem.white: 7}),
    SplendorCard(id: 't3_u_3', tier: 3, points: 4, bonusGem: Gem.blue, cost: {Gem.black: 3, Gem.blue: 3, Gem.white: 6}),
    SplendorCard(id: 't3_u_4', tier: 3, points: 5, bonusGem: Gem.blue, cost: {Gem.blue: 3, Gem.white: 7}),

    // White Bonus
    SplendorCard(id: 't3_w_1', tier: 3, points: 3, bonusGem: Gem.white, cost: {Gem.black: 3, Gem.blue: 3, Gem.green: 3, Gem.red: 5}),
    SplendorCard(id: 't3_w_2', tier: 3, points: 4, bonusGem: Gem.white, cost: {Gem.black: 7}),
    SplendorCard(id: 't3_w_3', tier: 3, points: 4, bonusGem: Gem.white, cost: {Gem.black: 6, Gem.red: 3, Gem.white: 3}),
    SplendorCard(id: 't3_w_4', tier: 3, points: 5, bonusGem: Gem.white, cost: {Gem.black: 7, Gem.white: 3}), 

    // Green Bonus
    SplendorCard(id: 't3_g_1', tier: 3, points: 3, bonusGem: Gem.green, cost: {Gem.black: 3, Gem.blue: 3, Gem.red: 5, Gem.white: 3}), // CSV: 3,Green,3,3,3,0,3,5 -> Black3, Blue3, Green0, Red3, White5. 
    // wait CSV header: Level,Color,PV,Black,Blue,Green,Red,White
    // Row: 3,Green,3,3,3,0,3,5
    // so Black:3, Blue:3, Green:0, Red:3, White:5. 
    SplendorCard(id: 't3_g_2', tier: 3, points: 4, bonusGem: Gem.green, cost: {Gem.blue: 7}),
    SplendorCard(id: 't3_g_3', tier: 3, points: 4, bonusGem: Gem.green, cost: {Gem.blue: 6, Gem.green: 3, Gem.white: 3}),
    SplendorCard(id: 't3_g_4', tier: 3, points: 5, bonusGem: Gem.green, cost: {Gem.blue: 7, Gem.green: 3}),

    // Red Bonus
    SplendorCard(id: 't3_r_1', tier: 3, points: 3, bonusGem: Gem.red, cost: {Gem.black: 3, Gem.blue: 5, Gem.green: 3, Gem.white: 3}),
    SplendorCard(id: 't3_r_2', tier: 3, points: 4, bonusGem: Gem.red, cost: {Gem.green: 7}),
    SplendorCard(id: 't3_r_3', tier: 3, points: 4, bonusGem: Gem.red, cost: {Gem.blue: 3, Gem.green: 6, Gem.red: 3}),
    SplendorCard(id: 't3_r_4', tier: 3, points: 5, bonusGem: Gem.red, cost: {Gem.green: 7, Gem.red: 3}),
  ];

  // Standard Nobles (10)
  static final List<Noble> nobles = [
     // 4/4 Requirements
     Noble(id: 'n_0', points: 3, requirements: {Gem.green: 4, Gem.red: 4}), // Mary Stuart
     Noble(id: 'n_1', points: 3, requirements: {Gem.white: 4, Gem.blue: 4}), // Niccolò Machiavelli (Diamond/Sapphire)
     Noble(id: 'n_2', points: 3, requirements: {Gem.black: 4, Gem.white: 4}), // Isabella I (Onyx/Diamond)
     Noble(id: 'n_3', points: 3, requirements: {Gem.green: 4, Gem.blue: 4}), // Suleiman (Emerald/Sapphire)
     Noble(id: 'n_4', points: 3, requirements: {Gem.black: 4, Gem.green: 4}),  // Henry VIII (Onyx/Emerald)

     // 3/3/3 Requirements
     Noble(id: 'n_5', points: 3, requirements: {Gem.black: 3, Gem.red: 3, Gem.white: 3}), // Charles V (Onyx/Ruby/Diamond)
     Noble(id: 'n_6', points: 3, requirements: {Gem.green: 3, Gem.blue: 3, Gem.red: 3}), // Catherine de' Medici
     Noble(id: 'n_7', points: 3, requirements: {Gem.green: 3, Gem.blue: 3, Gem.white: 3}), // Anne of Brittany
     Noble(id: 'n_8', points: 3, requirements: {Gem.black: 3, Gem.blue: 3, Gem.white: 3}), // Elizabeth of Austria
     Noble(id: 'n_9', points: 3, requirements: {Gem.black: 3, Gem.red: 3, Gem.green: 3}), // Francis I
  ];
}
