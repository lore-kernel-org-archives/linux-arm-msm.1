Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4A33F8B2
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230340; cv=none; b=JQzNXbp8U2esoG7afABm7v9L+QJ8ywUkaTbNDt2AnzfM6oXcbZXlLCeRfA5rOux0jDi7MN5Zl8n9CyGHal1ng7TySBuiIdksdFMDTFA6KiQZESxxEML1gtejCyn9BmhduBRzLg3O4+GNKhVUcE9536/SjD88qEc+fZepKMEeXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230340; c=relaxed/simple;
	bh=IYXfTVPMCK/el0CMUANPRO8OaG4Oym+gcs0IAqN8PEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g0KpX9Ew2Uw+V3Mgnv4SDmX2bCHTXkG1hYnnog4/Gq0OdW8ffdCgCYXgfX8Vv14TSDwwXZxlTIoY+8KfkIeGkTMQChfCWi1GXIL4ix07PtfW7ZO8H7CFrebfqkQsr2B2j6+JsQdK8j+0KZdVdbz1DHr2nK6iI7kFAmauqrR+0f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7Bbt3X2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CttGRT6n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7Bbt3X2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CttGRT6n"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oYbn813774
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XMZcfz/11DnDHLN5NSRKwY
	jq0JKQ8gstJmfqFEICHQ0=; b=J7Bbt3X2LT9eYAy3C3H4CKUnK/KXG0ARnRqhbv
	DQ5QLIJ/y5x7/sniek3WAP9y+SBY8a78JAPBFcnGWLtVAuKBDKnfSd/HBweSEtz0
	UGoBQle51wScUN7pcRtresLvxTU/AdQUPHlqjlLcNjN+93JhKPTCBJPLr38+mqcr
	GjpuqczOD1XkhibkFA90XbC9/wre29B2QX/w2uXw/KIWEOYKVLORIQ71EuVGu1Si
	sSCJnhFgisbgyMnsEDKd4m/xm9YxaPQXCqC4C+WoBJXDonUCXEdbAQroN4tEifc3
	+vKsPREHgG19SZ/zUsrzDa93BiMd1lsoKJmOQC5m6eVQRPzA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc016grch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 09:45:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso1925576c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 02:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230334; x=1792835134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XMZcfz/11DnDHLN5NSRKwYjq0JKQ8gstJmfqFEICHQ0=;
        b=CttGRT6nvRVqTV0ldnqiPZSvbeeowIaJC5n3PqHRrFVZM7km+3Uf/7DZK9N2bbrlrZ
         VobkMTkB7U/k6rZNVsSO2iNvsCztQ5iX9dgXcDd0r/2y0JTEfVLa4/TvJ0GSpq1CT35N
         fDZlFPw5ff259yixnFqmEQpHCqn+Z4VyFVCuudcEZhjlzBUmAtOQUYW2d/+9zoDpeIyo
         DW6hLa/e3mjrg/fxM05ZzuOB4AAhzZJ3zu3dLKJPy2YiPCov/gd7r4F56fP4lw9vTaXO
         s4XQvfJfqKiBWpCurr4QGDunBzk/rodmMulIZGsLXBkDvFA2omGElmHuRLj65bhFmNSa
         4KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230334; x=1792835134;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XMZcfz/11DnDHLN5NSRKwYjq0JKQ8gstJmfqFEICHQ0=;
        b=uKlZBrUSGIibCV0SRaAyE/l/danIN3Qi+eJgNU7PrWP6jsXlM5S/JE8NpGGnoA8V4f
         js6I3qviwYHiOgvP3muBGJyeSSj0wvpYfT0waetkdwGzMoghtq8Npzf9krdfhMKduNv5
         /xrjqYP9mg7yxQv6z5kjrZ4ILlAiK21vCUMO/eeaBEWv6G7NBuTj4fdoEP72Hl+B0DZH
         ISbMOOFttBO0oXJEm78ilYOPG3rnxpjYmpIk27ck+7MjbyRGXhYYz3ETvco8iDZWsR/+
         gnfl2fx55sYZ8RamvIH7jF88w/6JJBHMJjb8mHxt6XbkAHykrc2Gy1Ju4qOaFgpjlEna
         mfMw==
X-Forwarded-Encrypted: i=1; AKwUvBzKAJAosFLo1PDrQt1nzcE1gzWNQGhGZd3lWs25GCz08nlI/ElMKt6gK9QfUoL4HKHMzZlseUUd7rIlWcAe@vger.kernel.org
X-Gm-Message-State: AFq9FYLiq1+XkfsrDppqRNUUOta5RgqZ1VUUOvSbx64dpxe+iKMwv1H7
	xjT6TeUyUyzGvRAFOj44nqXbdnms8dMxlPeQXsW20wF6P+BrmzO03/rpMgOI1k5YlZneDYzfTO7
	XhOZzqDWYAkUyIK0vRK7YCtSQ+bL1VCvoz8nLdpxhwas+79dmD29sddjMxeQcIdKvS7bF
X-Gm-Gg: AYBFou1rBWvnZeRfD/MVgDjc5Cu+sS4/lGXmnTBdpgJxtLdH0iDAmAxDHB+NkqBGhtl
	w+MwpSpmGMBlhaGKet5NT6ZOgjA3uhrsVRXHqP/y5+XdoTJWnU7N0UzdQIQgWY6dF37tTkAmqT2
	+B5EybBdyTeA2sANS5XRObY4+CQihp+Sl9Piu8kWzZ1RcwvCPat9jDWh+alq/e1PDjn7+G+3v61
	yRcjs4ljNDDDkFKW9mTsexiU2MXH/5TmLWiM/YRVfed1sFj33VLKMpWuQ7HRuRkxNM5Pl8xyG1w
	6WI7CDa7rRGx1MuTGYiAwukSeasMbGhkUo6hUUPW4zDZx6kncjNfjG3yZGHMZzuLi7SD/1TMJVp
	s4400flhDr19cBejx/Hn0CDTO8pjFzA==
X-Received: by 2002:a05:7022:ea44:b0:181:83c:5df8 with SMTP id a92af1059eb24-1851238b3e7mr3256396c88.11.1792230334182;
        Sat, 17 Oct 2026 02:45:34 -0700 (PDT)
X-Received: by 2002:a05:7022:ea44:b0:181:83c:5df8 with SMTP id a92af1059eb24-1851238b3e7mr3256364c88.11.1792230333493;
        Sat, 17 Oct 2026 02:45:33 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:32 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
Date: Sat, 17 Oct 2026 15:15:11 +0530
Message-Id: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdD02oC/23NQQ7CIBAF0KsY1tJQKLR15T2MMbQdhWhBAUlN0
 7uLxIVJ3Uzy82fezMiD0+DRbjMjB1F7bU0KbLtBvZLmAlgPKSNKqCAtYdgrfXXyBEGBMxCwhLo
 D4NCQClC6ujs46ymLB/RZMDAFdEyN0j5Y98qvYpn7r1qt1FhigiUnteBtKwjje+t98XjKW2/Hs
 Ugjk5H+Ms2aoYnpOmCsaQciOP3DLMvyBuIZ4qoGAQAA
X-Change-ID: 20260903-shikra_ethernet-ae7bee5e804e
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=5696;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=IYXfTVPMCK/el0CMUANPRO8OaG4Oym+gcs0IAqN8PEE=;
 b=ioR6csnsJjP5p1t3JOpR3QmMOEtM7iEG5xSslMTKkeP1bLZ2CK60dEg9coNaeJ0xD92rmPXMv
 Bsujezmf7QABhibFvmlczlo6A6SR9z8A0OYYj6Z1ef5kUZQ2Q9TPvMB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX/T26TfTpu7Yc
 y2WVvEFnB/VlrYeVb8FdewyZFoQfWCREtMe6AAQG2REB++ZGRQGLWdWWpFI6wOfHgOPJaQQpSqM
 Ad7U8WogRZSmF9mDoPkILDCrt1YICug=
X-Proofpoint-GUID: RXsaspQ4dwsr7LLFTMh1Odxe1NvDaETm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXw4fqcwelZEAm
 u8sgN0IByx0w3aN17/reh/cEOxb7ePNsbWtMGrPNhrfS82XigBiF+rbnVQmSuLhmpE1FUfg6fvj
 ASFLpnnMKJNRZ5lo2ziOZ6I/jR4bclOhbd9IhI3asyoqdDIteFSzOKAmbqdXOLV2/k0yi6Lp8/5
 AUPufmf6Fdjwm8X/Xk4iTlHMCXONsBUYremWkVgTijSa6gXGXrk7Xqmg0LXlXICXPJcpfgab39f
 KM3wjP9HxWQE/3NA+srxOjwIogx2GOzNwnLg1U4AGiACIWI/G46IXOMqvYY2EMjmYTo2xs90lyD
 v2pzsIqFkdULlt5oncSmbKq2aUIXqdcQBi6T1kJoKejYqp/N2pPVwcTqHxPN677oqsY+BBjN5Vc
 6sHi9vBsg9hvPU7g9SUwWPqiGCvnqwlLjN3Th6GotK6GuweTJ1cVygsTrOTbegw1xEBZEGrjCw9
 gHXR2Bc/d9B7QQMqMiw==
X-Authority-Analysis: v=2.4 cv=COm/zhrD c=1 sm=1 tr=0 ts=6ad343bf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=oTwP7VKmK1vJnwN5z0oA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: RXsaspQ4dwsr7LLFTMh1Odxe1NvDaETm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038

This series incorporates feedback from the RFC and adds the dt-bindings
and driver changes required to enable Gigabit Ethernet support on the
Qualcomm Shikra SoC. DTS changes will be sent out separately.

The series has grown from the RFC and can be broadly divided into three
areas: PHY power supply management, proper support for RGMII ID mode in
the Qualcomm ETHQOS driver, and Shikra specific clock dependencies
required for NOC access.

1. Shikra EVK boards use a GPIO-gated regulator for the DP83867 PHY
power supply. Patches 1 and 2 add supply management to the DP83867
driver so the PHY driver holds the regulator vote at probe. These
changes are largely inspired by similar work done for the QCA8081 PHY:
https://lore.kernel.org/netdev/20261015143849.483339-1-elder@riscstar.com/

2. The generic RGMII fixes from the RFC remain. As suggested, an
additional patch now emits a warning (patch 6) when the legacy "rgmii"
or "rgmii-txid" modes are detected. A new change (patch 7) now
initialises the RGMII link clock at SPEED_10 on probe instead of
SPEED_1000, dropping the unnecessary 250 MHz source before link up.

3. NOC clock voting (patch 9) now uses dev_pm_opp_set_opp() so the
required VDD_CX performance state can be propagated through the clock
controller. The Shikra binding (patch 3) is updated accordingly: an
if/else block constrains Shikra to exactly six clocks and requires
operating-points-v2.

Testing:
The following boards have been tested with this new (proper) handling
for RGMII ID:
  - Shikra CQ/IQ variants (with the TI DP83867 PHY)
  - QCS615 Ride (with the Micrel KSZ9031 PHY)
  - Talos EVK (again with the Micrel KSZ9031 PHY)
  - Talos Lyra EVK (TI DP83867 PHY, this board also has a GPIO-gated
    regulator for the PHY power supply)

Changes in v3:
 - Remove #ifdef CONFIG_OF from the dp83867_power_on() function. This is
   a result of the recent discussion regarding similar handling in the
   qca808x driver:
   https://lore.kernel.org/netdev/atCSWZQAyqvz62_K@aspen.lan/
 - Clean up the -ENODEV handling in dp83867_power_on() and use a boolean
   to identify if supplies are provided -- Lorenzo.
 - Patch 7's commit message now says set_clk_tx_rate instead of
   fix_mac_speed -- Sashiko.
 - Add a new patch to abstract away the common dwma4_addrs for different
   versions of ethqos rather than duplicating them -- Lorenzo.
 - Use OPP table to set both the required clock rates and power state,
   update ethqos bindings accordingly to specify how the clock rates are
   described in DTS -- Konrad, Lorenzo.
 - Link to v2: https://lore.kernel.org/r/20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com

Changes in v2:
  - Collected Maxime's Reviewed-by tags.
  - Updated Patch 9's commit message to explain the double enable vote
    on the "stmmaceth" clock. Open to discussion on how best to handle
    this.
  - Wrapped regulator vote for dp83867 inside an #ifdef CONFIG_OF check
    to avoid adding an unnecessary 200 ms delay on systems where
    devm_regulator_get_enable_optional() would return 0. The change now
    mirrors the QCA8081 patch -- Sashiko.
  - Fixed ethqos_set_clk_tx_rate() to double the rate for all PHY modes
    other than RGMII-ID -- Sashiko.
  - Moved warning about the use of non RGMII-ID mode to probe instead
    of fix_mac_speed to avoid spamming during each link up event --
    Sashiko.
  - Fixed error unwind drops OPP before stopping link_clk -- Sashiko.
  - Fixed OPP vote set in probe not cleaned up on error -- Sashiko.
  - Link to v1: https://lore.kernel.org/netdev/20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com/#t

Changes since RFC:
  - Two new patches add supply management for the DP83867, replacing
    the gpio-hog approach for PHY power -- Konrad, Andrew.
  - Use dev_pm_opp_set_rate() for the NOC AXI clock and require
    operating-points-v2 for Shikra -- Konrad.
  - Warn on legacy "rgmii"/"rgmii-txid" to encourage DTB migration --
    Andrew, Maxime.
  - Updated binding document for qcom,ethqos and snps,dwmac.
  - Drop the duplicate "axi" clock from Shikra's DT; use "axi-noc" and
    "pcie-tile-axi-noc" as the only additional clock-names.
  - Initialise RGMII link clock at SPEED_10 rather than SPEED_1000 on
    probe.
  - Link to RFC: https://lore.kernel.org/netdev/20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com/

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
Mohd Ayaan Anwar (9):
      net: phy: dp83867: add regulator supply management
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
      net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
      net: stmmac: qcom-ethqos: share common GMAC4 address table
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  55 ++++-
 .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 259 +++++++++++++++++----
 drivers/net/phy/dp83867.c                          |  32 +++
 5 files changed, 297 insertions(+), 52 deletions(-)
---
base-commit: 8b71f1f5a28347cefb1a4711c4eeb492d5c619fb
change-id: 20260903-shikra_ethernet-ae7bee5e804e

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

