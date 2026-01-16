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
        primaryColor: const Color(0xFF00E5FF),
        scaffoldBackgroundColor: const Color(0xFF050505),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF7B61FF),
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

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ProfileHeader(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(title: "关于我", subtitle: "ABOUT ME"),
                  const SizedBox(height: 16),
                  const BioCard(),
                  const SizedBox(height: 40),
                  const SectionHeader(title: "主要成就", subtitle: "ACHIEVEMENTS"),
                  const SizedBox(height: 16),
                  const AchievementsGrid(),
                  const SizedBox(height: 40),
                  const SectionHeader(title: "职业经历", subtitle: "EXPERIENCE"),
                  const SizedBox(height: 16),
                  const TimelineList(),
                  const SizedBox(height: 40),
                  const PersonalInfoSection(),
                  const SizedBox(height: 60),
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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 380.0,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF050505),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Abstract Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0D1117), Color(0xFF000000)],
                ),
              ),
            ),
            // Decorative Elements
            Positioned(
              top: -100,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF00E5FF).withOpacity(0.1),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF7B61FF).withOpacity(0.1),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF00E5FF), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00E5FF).withOpacity(0.2),
                          blurRadius: 30,
                          spreadRadius: 5,
                        )
                      ],
                      color: Colors.grey[900],
                    ),
                    child: const Icon(Icons.person, size: 65, color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Lancelot Luan",
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "栾添昊",
                    style: GoogleFonts.notoSansSc(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.rocket_launch, size: 16, color: Color(0xFF00E5FF)),
                        const SizedBox(width: 8),
                        Text(
                          "Founder @ CouldAI Inc.",
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF00E5FF),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
        Text(
          subtitle,
          style: GoogleFonts.montserrat(
            color: const Color(0xFF00E5FF).withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.notoSansSc(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF00E5FF), Color(0xFF7B61FF)],
            ),
            borderRadius: BorderRadius.circular(2),
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
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Text(
        bioSummary,
        style: GoogleFonts.notoSansSc(
          color: Colors.white70,
          fontSize: 16,
          height: 1.8,
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
        childAspectRatio: 1.4,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1A1F26),
                const Color(0xFF121212),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.emoji_events_outlined, color: Color(0xFFFFD700), size: 24),
              ),
              const Spacer(),
              Text(
                achievements[index].title,
                style: GoogleFonts.notoSansSc(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                achievements[index].subtitle,
                style: GoogleFonts.notoSansSc(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 11,
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
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline Line
              Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: index == 0 ? const Color(0xFF00E5FF) : const Color(0xFF121212),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: index == 0 ? const Color(0xFF00E5FF) : const Color(0xFF7B61FF),
                        width: 2,
                      ),
                      boxShadow: index == 0 ? [
                        BoxShadow(
                          color: const Color(0xFF00E5FF).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ] : [],
                    ),
                  ),
                  if (index != experiences.length - 1)
                    Expanded(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF7B61FF).withOpacity(0.5),
                              const Color(0xFF7B61FF).withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 24),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00E5FF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          exp.year,
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFF00E5FF),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        exp.title,
                        style: GoogleFonts.notoSansSc(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        exp.company,
                        style: GoogleFonts.notoSansSc(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        exp.description,
                        style: GoogleFonts.notoSansSc(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          _buildInfoRow("中文名", "栾添昊"),
          _buildInfoRow("外文名", "Lancelot Luan"),
          _buildInfoRow("毕业院校", "上海交通大学 (信息安全工程)"),
          _buildInfoRow("籍贯", "黑龙江省牡丹江市"),
          _buildInfoRow("出生日期", "1984年4月15日"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.notoSansSc(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.notoSansSc(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
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
          const Icon(Icons.code, color: Colors.white24),
          const SizedBox(height: 12),
          Text(
            "Powered by CouldAI",
            style: GoogleFonts.montserrat(
              color: Colors.white.withOpacity(0.3),
              fontSize: 12,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
