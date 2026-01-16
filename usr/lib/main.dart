import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lancelot Luan Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFD4AF37), // Luxury Gold
        scaffoldBackgroundColor: const Color(0xFF000000), // Pure Black
        // Use Lato for body text for a clean, modern, international look
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: const Color(0xFFE0E0E0),
          displayColor: const Color(0xFFFFFFFF),
        ),
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37), // Gold
          secondary: Color(0xFFE5E5E5), // Silver
          surface: Color(0xFF121212),
          onSurface: Color(0xFFE0E0E0),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProfileHomePage(),
      },
    );
  }
}

// --- Data Models ---

class Experience {
  final String year;
  final String title;
  final String company;
  final String description;

  Experience(this.year, this.title, this.company, this.description);
}

class Achievement {
  final String title;
  final String subtitle;

  Achievement(this.title, this.subtitle);
}

// --- Content Data ---

const String bioSummary = "Lancelot Luan is a distinguished expert in Information Security, Process Mining, and Artificial Intelligence, and a serial entrepreneur. A graduate of Shanghai Jiao Tong University in Information Security Engineering, he has held key positions at Symantec and co-founded Miaozhen Systems (later Mininglamp Technology). As CTO for multiple high-tech enterprises, he has led innovations in distributed systems, process automation, and AI agents. In 2024, he founded CouldAI, pioneering the next generation of General Purpose Agents and AI-driven programming platforms.";

final List<Experience> experiences = [
  Experience(
    "2024 - Present",
    "Founder & CEO",
    "CouldAI Inc.",
    "Founded in Nov 2024, focusing on AGI and AI coding platforms. Successfully developed the world's first AI App Builder for cross-platform native apps by Aug 2025. Officially launched the global-first Flutter-based AI coding platform in Nov 2025, enabling one-click publishing to App Store & Google Play.",
  ),
  Experience(
    "2021 - 2024",
    "CTO",
    "JiuKe Info Tech (Shenzhen)",
    "Incubated by China Merchants Group. Spearheaded the R&D of China's first commercialized enterprise-grade GUI Agent 'bit-Agent', establishing core technical barriers in AI Agents, Process Mining, and RPA. Empowered over 100 large-scale enterprises with revenues exceeding 20 billion RMB.",
  ),
  Experience(
    "2016 - 2021",
    "CTO",
    "Thinkerx",
    "Built an Industrial Internet platform from zero to one, serving over 10,000 factories. Independently engineered a 0.1s layout optimization algorithm (industry avg: minutes). The 'Guigui' software serves over 1.42 million merchants, utilizing AI to maximize material efficiency.",
  ),
  Experience(
    "2011 - 2016",
    "Founder",
    "VR Integrated Home Platform",
    "Established the world's first VR integrated home decoration platform. Developed proprietary VR design software using game engines. The company reached a valuation of 500 million RMB, integrating supply chains to create a comprehensive VR ecosystem.",
  ),
  Experience(
    "2007 - 2011",
    "Product Lead / Co-founder",
    "Miaozhen Systems (Mininglamp)",
    "Co-founded the predecessor of Mininglamp Technology. Led the team to build Asia's largest internet advertising data platform, processing 100 billion daily PVs. Mininglamp listed on the HKEX in 2025 with a market cap exceeding 42 billion HKD.",
  ),
  Experience(
    "2007",
    "Software Engineer",
    "Symantec",
    "Served at the world's fourth-largest software company, developing distributed disaster recovery software and enterprise-grade endpoint security products (Enterprise Norton).",
  ),
];

final List<Achievement> achievements = [
  Achievement("NOI First Prize", "National Olympiad in Informatics"),
  Achievement("Process Mining Pioneer", "China's First in Process Mining Tech"),
  Achievement("VR Tech Pioneer", "Innovator of VR Home Design Software"),
  Achievement("AI App Builder Pioneer", "Pioneered Cross-platform Native App AI Builder Tech"),
];

// --- UI Components ---

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  State<ProfileHomePage> createState() => _ProfileHomePageState();
}

class _ProfileHomePageState extends State<ProfileHomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          ProfileHeader(scrollOffset: _scrollOffset),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FadeInEntry(
                    delay: 100,
                    child: SectionHeader(title: "BIOGRAPHY", subtitle: "ABOUT ME"),
                  ),
                  const SizedBox(height: 20),
                  const FadeInEntry(
                    delay: 200,
                    child: BioCard(),
                  ),
                  const SizedBox(height: 60),
                  const FadeInEntry(
                    delay: 300,
                    child: SectionHeader(title: "DISTINCTIONS", subtitle: "ACHIEVEMENTS"),
                  ),
                  const SizedBox(height: 20),
                  const FadeInEntry(
                    delay: 400,
                    child: AchievementsGrid(),
                  ),
                  const SizedBox(height: 60),
                  const FadeInEntry(
                    delay: 500,
                    child: SectionHeader(title: "CAREER HISTORY", subtitle: "EXPERIENCE"),
                  ),
                  const SizedBox(height: 20),
                  const TimelineList(),
                  const SizedBox(height: 60),
                  const FadeInEntry(
                    delay: 600,
                    child: PersonalInfoSection(),
                  ),
                  const SizedBox(height: 80),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Simple Fade-In Animation Widget
class FadeInEntry extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeInEntry({super.key, required this.child, this.delay = 0});

  @override
  State<FadeInEntry> createState() => _FadeInEntryState();
}

class _FadeInEntryState extends State<FadeInEntry> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _translate = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _translate,
        child: widget.child,
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final double scrollOffset;

  const ProfileHeader({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 420.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.black,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image / Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1A1A1A),
                    Color(0xFF000000),
                  ],
                ),
              ),
            ),
            // Decorative Abstract Shapes
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFD4AF37).withOpacity(0.15), // Gold glow
                      Colors.transparent
                    ],
                    radius: 0.6,
                  ),
                ),
              ),
            ),
            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar with Glow
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFD4AF37).withOpacity(0.3),
                          blurRadius: 40,
                          spreadRadius: 5,
                        )
                      ],
                      color: const Color(0xFF121212),
                    ),
                    child: const Icon(Icons.person, size: 70, color: Color(0xFFE0E0E0)),
                  ),
                  const SizedBox(height: 30),
                  // Name
                  Text(
                    "Lancelot Luan",
                    style: GoogleFonts.playfairDisplay( // Serif font for luxury feel
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "FOUNDER & CTO",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white70,
                      letterSpacing: 4.0,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Title Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4AF37).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.auto_awesome, size: 16, color: Color(0xFFD4AF37)),
                        const SizedBox(width: 10),
                        Text(
                          "Founder @ CouldAI Inc.",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFD4AF37),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 24,
              color: const Color(0xFFD4AF37),
            ),
            const SizedBox(width: 12),
            Text(
              subtitle,
              style: GoogleFonts.montserrat(
                color: const Color(0xFFD4AF37),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class BioCard extends StatelessWidget {
  const BioCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(4), // Sharper corners for modern look
        border: Border(
          left: BorderSide(color: const Color(0xFFD4AF37).withOpacity(0.5), width: 2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        bioSummary,
        style: GoogleFonts.lato(
          color: const Color(0xFFCCCCCC),
          fontSize: 16,
          height: 1.8, // Better readability
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class AchievementsGrid extends StatelessWidget {
  const AchievementsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.2, // Flatter, more compact cards
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.emoji_events_outlined, color: Color(0xFFD4AF37), size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      achievements[index].title,
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      achievements[index].subtitle,
                      style: GoogleFonts.lato(
                        color: Colors.white54,
                        fontSize: 10,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TimelineList extends StatelessWidget {
  const TimelineList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return FadeInEntry(
          delay: 100 * index,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline Line
                Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: index == 0 ? const Color(0xFFD4AF37) : const Color(0xFF121212),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFD4AF37),
                          width: 2,
                        ),
                      ),
                    ),
                    if (index != experiences.length - 1)
                      Expanded(
                        child: Container(
                          width: 1,
                          color: const Color(0xFF333333),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 24),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp.year,
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFD4AF37),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          exp.title,
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exp.company,
                          style: GoogleFonts.lato(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          exp.description,
                          style: GoogleFonts.lato(
                            color: Colors.grey[400],
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          _buildInfoRow("Name", "Lancelot Luan"),
          const Divider(color: Colors.white10),
          _buildInfoRow("Education", "SJTU (InfoSec Engineering)"),
          const Divider(color: Colors.white10),
          _buildInfoRow("Hometown", "Mudanjiang, China"),
          const Divider(color: Colors.white10),
          _buildInfoRow("Birth Date", "April 15, 1984"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Powered by CouldAI",
            style: GoogleFonts.montserrat(
              color: Colors.white24,
              fontSize: 12,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
