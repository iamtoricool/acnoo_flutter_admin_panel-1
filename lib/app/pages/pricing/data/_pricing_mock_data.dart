part of '../pricing_view.dart';

const List<PricingCardModel> basicPricingPlan = [
  PricingCardModel(
    icon: IconsaxPlusBold.flash_1,
    planName: 'Standard',
    planDescription: 'For the professionals',
    planPrice: 24,
    subscriptionType: 'user',
    features: {
      "20 Asset Delivery": true,
      "Unlimited Bandwidth": true,
      "Support System": false,
      "120+ Message all Operator": false,
    },
  ),
  PricingCardModel(
    icon: IconsaxPlusBold.crown,
    planName: 'Pro Business',
    planDescription: 'For the professionals',
    planPrice: 30,
    discountPrice: 28,
    subscriptionType: 'user',
    features: {
      "20 Asset Delivery": true,
      "Unlimited Bandwidth": true,
      "Support System": true,
      "120+ Message all Operator": true,
    },
  ),
  PricingCardModel(
    icon: IconsaxPlusBold.cup,
    planName: 'Enterprise',
    planDescription: 'For the professionals',
    planPrice: 35,
    subscriptionType: 'user',
    features: {
      "20 Asset Delivery": true,
      "Unlimited Bandwidth": true,
      "Support System": false,
      "120+ Message all Operator": false,
    },
  ),
];

const List<PricingCardModel> defaultPricingPlan = [
  PricingCardModel(
    icon: IconsaxPlusBold.flash_1,
    planName: 'Freebie',
    planDescription:
        'Ideal for individuals who need quick access to basic features.',
    planPrice: 0,
    subscriptionType: 'Month',
    features: {
      "20,000+ of PNG & SVG graphics": true,
      "Access to 100 million stock images": true,
      "Upload custom icons and fonts": false,
      "Unlimited Sharing": false,
      "Upload graphics & video in up to 4k": false,
      "Unlimited Projects": false,
      "Instant Access to our design system": false,
      "Create teams to collaborate on designs": false,
    },
  ),
  PricingCardModel(
    icon: IconsaxPlusBold.crown,
    planName: 'Professional',
    planDescription:
        'Ideal for individuals who who need advanced features and tools for client work.',
    planPrice: 25,
    subscriptionType: 'Month',
    features: {
      "20,000+ of PNG & SVG graphics": true,
      "Access to 100 million stock images": true,
      "Upload custom icons and fonts": true,
      "Unlimited Sharing": true,
      "Upload graphics & video in up to 4k": true,
      "Unlimited Projects": true,
      "Instant Access to our design system": false,
      "Create teams to collaborate on designs": false,
    },
  ),
  PricingCardModel(
    icon: IconsaxPlusBold.cup,
    planName: 'Business',
    planDescription:
        'Ideal for individuals who who need advanced features and tools for client work.',
    planPrice: 35,
    subscriptionType: 'Month',
    features: {
      "20,000+ of PNG & SVG graphics": true,
      "Access to 100 million stock images": true,
      "Upload custom icons and fonts": true,
      "Unlimited Sharing": true,
      "Upload graphics & video in up to 4k": true,
      "Unlimited Projects": true,
      "Instant Access to our design system": false,
      "Create teams to collaborate on designs": false,
    },
  ),
  PricingCardModel(
    icon: IconsaxPlusBold.cup,
    planName: 'Enterprise',
    planDescription:
        'Ideal for businesses who need personalized services and security for large teams. ',
    planPrice: 100,
    subscriptionType: 'Month',
    features: {
      "20,000+ of PNG & SVG graphics": true,
      "Access to 100 million stock images": true,
      "Upload custom icons and fonts": true,
      "Unlimited Sharing": true,
      "Upload graphics & video in up to 4k": true,
      "Unlimited Projects": true,
      "Instant Access to our design system": true,
      "Create teams to collaborate on designs": true,
    },
  ),
];
