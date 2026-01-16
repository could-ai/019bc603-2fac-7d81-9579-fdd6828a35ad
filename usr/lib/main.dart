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
        // 使用 Noto Sans SC 作为主要字体，解决中文乱码问题
        textTheme: GoogleFonts.notoSansScTextTheme(ThemeData.dark().textTheme).apply(
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

const String bioSummary = "毕业于上海交通大学信息安全工程专业，信息安全、流程挖掘与人工智能领域技术专家、连续创业者。曾任职于 Symantec，参与创办秒针系统，并在多家人工智能、工业互联网及企业数字化公司担任首席技术官。长期从事分布式系统、流程自动化与智能体相关技术研发。";

final List<Experience> experiences = [
  Experience(
    "2024 - Present",
    "创始人 & CEO",
    "CouldAI Inc.",
    "2024年11月创立，专注于通用智能体(AGI)与AI编程平台。2025年8月开发完成世界首个可生成跨平台原生应用的AI App Builder。2025年11月正式发布全球首个基于Flutter技术的AI编程平台，实现一键发布到App Store及Google Play。",
  ),
  Experience(
    "2021 - 2024",
    "CTO",
    "九科信息技术 (深圳)",
    "孵化于招商局集团。主导研发国内首个实现商业化落地的企业级GUI智能体bit-Agent，构建AI Agent、流程挖掘、RPA核心技术壁垒。服务200亿以上营收规模大型企业上百家。",
  ),
  Experience(
    "2016 - 2021",
    "CTO",
    "新格尔人居 (Thinkerx)",
    "从0到1打造服务上万家工厂的工业互联网平台。独自开发0.1秒排版优化算法（行业通常需数分钟）。柜柜软件服务超过142万家商家，通过AI优化板材利用率。",
  ),
  Experience(
    "2011 - 2016",
    "创始人",
    "VR整体家装平台",
    "创办世界首个VR整体家装平台，基于游戏引擎开发家居VR设计软件。公司最高估值5亿元，整合产业链资源，打造VR家装生态链。",
  ),
  Experience(
    "2007 - 2011",
    "产品负责人 / 早期核心成员",
    "秒针系统 (明略科技)",
    "参与创办明略科技前身。带领团队发展为亚太最大互联网广告公司，日处理1000亿次PV数据。明略科技于2025年在港交所挂牌，市值超420亿港元。",
  ),
  Experience(
    "2007",
    "软件工程师",
    "Symantec",
    "任职于世界第四大软件商，从事分布式容灾备份软件及企业级端点安全产品(企业级诺顿)开发。",
  ),
];

final List<Achievement> achievements = [
  Achievement("NOI 一等奖", "全国信息学奥林匹克竞赛"),
  Achievement("流程挖掘第一人", "中国流程挖掘技术先行者"),
  Achievement("VR技术开创者", "VR家居设计软件技术开创者"),
  Achievement("Google Camp", "创办全球第一家学生社团"),
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
                    child: SectionHeader(title: "关于我", subtitle: "ABOUT ME"),
                  ),
                  const SizedBox(height: 20),
                  const FadeInEntry(
                    delay: 200,
                    child: BioCard(),
                  ),
                  const SizedBox(height: 60),
                  const FadeInEntry(
                    delay: 300,
                    child: SectionHeader(title: "主要成就", subtitle: "ACHIEVEMENTS"),
                  ),
                  const SizedBox(height: 20),
                  const FadeInEntry(
                    delay: 400,
                    child: AchievementsGrid(),
                  ),
                  const SizedBox(height: 60),
                  const FadeInEntry(
                    delay: 500,
                    child: SectionHeader(title: "职业经历", subtitle: "EXPERIENCE"),
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

// 简单的淡入动画组件
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
                    "栾添昊",
                    style: GoogleFonts.notoSansSc(
                      fontSize: 24,
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
          style: GoogleFonts.notoSansSc(
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
        style: GoogleFonts.notoSansSc(
          color: const Color(0xFFCCCCCC),
          fontSize: 16,
          height: 2.0, // Better readability
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
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stars, color: const Color(0xFFD4AF37), size: 28),
              const Spacer(),
              Text(
                achievements[index].title,
                style: GoogleFonts.notoSansSc(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                achievements[index].subtitle,
                style: GoogleFonts.notoSansSc(
                  color: Colors.white54,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
                          style: GoogleFonts.notoSansSc(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          exp.company,
                          style: GoogleFonts.notoSansSc(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          exp.description,
                          style: GoogleFonts.notoSansSc(
                            color: Colors.grey[400],
                            fontSize: 15,
                            height: 1.8,
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
          _buildInfoRow("中文名", "栾添昊"),
          const Divider(color: Colors.white10),
          _buildInfoRow("外文名", "Lancelot Luan"),
          const Divider(color: Colors.white10),
          _buildInfoRow("毕业院校", "上海交通大学 (信息安全工程)"),
          const Divider(color: Colors.white10),
          _buildInfoRow("籍贯", "黑龙江省牡丹江市"),
          const Divider(color: Colors.white10),
          _buildInfoRow("出生日期", "1984年4月15日"),
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
            style: GoogleFonts.notoSansSc(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.notoSansSc(
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
