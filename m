Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B533DA7F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282326; cv=none; b=OrqzUXbHcrSkxjDU/vgZu4q62ewuDwBECjFpt6cNHSssJd98wlgBOxF9Xrysqff+9zJG1aR5kRkow2eH/+/C3WADsT6VMUmpeNf1BZe4jlngwbBJQUi/zy/GzqnZHjnU0j4JIsFQqH+kqRonZl/mYpUZA9IWAxRienDPj0zpXrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282326; c=relaxed/simple;
	bh=9FeTXPQw+cQm9ysf+FsJrEpss3asU8i8cBWSUkWk0wM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QsWDAIOyvyQkI4JbftVKmEjYzSCfIr6VHgQtGBofonfuBk9PDqwtXy7NlIRskw00mFLAC35HdGwDKSY3LQ8fkIRfYB+7o15XTDAQ1/7+DTuAm+MOMkDK6r31B+2MfjVRWZXA5mM4P1ewMnM+kl8+CkzO+bH1hasG5+PdItvWfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f91NlvzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFbNpbjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f91NlvzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFbNpbjR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGEB1065344
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8k0JwyDVq9pQhEGw3nEGQr
	d1JhB0VfPP1D53y+nXTNQ=; b=f91NlvzW7TLjlhV49ikl7QWEaHtp+dj5r7CFp9
	0mneO7MIRHAOIBZ8/jUbPp86zCElnfBo+2zKMP4drtBsGF23/zVl0Nbc4EMe0Y1d
	0P8a1IMVCZVWVNOjgqdYG++sHmNLJ3MTWJ+q/Gg/vvEjy3tDQpHwnkHszhBnbNcI
	pDnPS3pAlQM0jVFh4lJNzKThd0CrvzJgVX0d9dzctlZXGUi2rJNuNV316HnZDQjr
	gmoRdp7AJAUyVlocBZ0/zC6U0Zb4z/MLn6Z8L9XoGkFlF/TG9HtIELPzjRtj1d7X
	557uSJiufWzV2odQ2P65kQvBlW7OsrIhjkjsFgiNmG35lYKg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquhhue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso3492542a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282320; x=1784887120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8k0JwyDVq9pQhEGw3nEGQrd1JhB0VfPP1D53y+nXTNQ=;
        b=KFbNpbjRkGNCP5c9z9tYDNvse9A3gFliIeECOOnK3X68oPCW8B/fvTyGn7jbR+L7vL
         1PavoicvoID6cAgQ4Cut5LmKLyqu0Y/yUxAxqjtMCIEFPJ0MRQZBS3AhvFlkMgG8942c
         v6XMtu+8vdON0sBgFkkhWaW0XgwV+ZSPEzkjlQvlmcUAaNpa4Y/Le/HfPb33mPnIuJ1+
         zY1fcgSss+MnI5yFQWBosrMpcba7pSbSgHDgaik5WV63Ivbrbpf44cYkaXBS8xe5e4hr
         QmZCfb0J2N5GqN819P+kYFgx91c0akZGL/rdDdsBBRsp8U2QNgRHfxLTIEXm2KGe7Tyt
         JR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282320; x=1784887120;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8k0JwyDVq9pQhEGw3nEGQrd1JhB0VfPP1D53y+nXTNQ=;
        b=PdeL+R6OR9K+/LRvKxHPl/ocf0+PzPyrJLQ5Phc2jOIyN5remlpDjlbPvg5Vs9giV5
         T3rUVbgkvNlkcL0KCD2uM5YMULRkJhsBL1d3L2f/ET7A6br5jvH/6QyoVgwprSF2H0UX
         bpS4ikZtWuNiMXC+qfo7gVthxXcOiqSingC0hlsssN51Gs5XpnygKLPI5ObDos2OFtG7
         gLs+yAnjvFC+XsSriTtKr5rDDBQKt/T7wW8GdbBz8FBVWyzVenZf6U+MVQOllaAbxETi
         7/tbLlms+6BDQoGS2yNQ+eRpRDb54VZQxSPMA6M6MXrRcnJRtzVUbLAQn/HyPpdytXdQ
         kl0Q==
X-Forwarded-Encrypted: i=1; AHgh+RrW2JJGnPTTwcaP2uZHgvlq+elRUA0tEEa4KnETkgpbvEMYxH/FCIKzELL8xkmnXRAiLvc2zZS63CPdedU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PABZiRTKUH6TpA9U4IyUs1YUqoxe7aCvfX1S/KAujo9jGFlB
	SCaZ/S00EBgXV6KlHMsOxQEhJGWRkBM921GNUngNbEro3+IgsbBPFhJc07G250EvXCI664cFovz
	Y2ZjV8RRCMDv2kwoRmKT2PgA7+BwmsB/SqCMweh4FWdauR5OyEFJ0C9PvS/imC0PqzeX0b7edwK
	hx
X-Gm-Gg: AfdE7clJ2d/QR5pWfaOJyn9F5837p98VJjQX1L5aEqC3ebptuufjJthHI+x9Gp/yJcY
	9ivfkcWfe3p4RB5cMZDa65JJuhFOr69Cv2WSXXg5aO6P8CoHoKiGto7q4QMm4WF0/wkiH/sPdbT
	+kr6hXXFkZIWLyBtG52KiOUxKOowX7fw4mn+CcFAulsd8m9cNgxh2fJyuuVPMCLkFNPlo01KpAi
	+Wodu6iEB0KhUw6Oznr0+ihoCAJj+08VRxz2cowVhm6cYZfQOwBi35a9ouh8WYeRkSkfcLWB3Uy
	DFAFUrP2lUmlEEjuPHhImzjCZRxz8bQPHFOO1J7S2EwivT1gnDcJ/4vlM54qBP7KXyZP4WqfmSh
	Nkv/eFsShO81njRyeNcE/Zr8Cn3Mzyu7WPoiolxaSFb1wP2k=
X-Received: by 2002:a17:90b:1a90:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e4b5627f8mr1625508a91.30.1784282320324;
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:37f:9cdf:f0af with SMTP id 98e67ed59e1d1-38e4b5627f8mr1625479a91.30.1784282319784;
        Fri, 17 Jul 2026 02:58:39 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm5586375eec.13.2026.07.17.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:38 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add QMP PCIe multiple link-mode PHY support
Date: Fri, 17 Jul 2026 02:58:32 -0700
Message-Id: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMj8WWoC/yXM7QpAMBTG8VvR+Ww1aia3Imnm4HgZbYjk3g0ff
 089/wscWkIHWXCBxZ0czcZDhAHoTpkWGdXeEPM44TJKWDue02bLkcwwzTWWfpRMclS64akSWoC
 /LhYbOr5sXvx2W9WjXt8W3PcD/yFkLHgAAAA=
X-Change-ID: 20260716-glymur_linkmode_0717-70eacf08a5c5
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784282318; l=4954;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9FeTXPQw+cQm9ysf+FsJrEpss3asU8i8cBWSUkWk0wM=;
 b=+Ap6TS7LJgX+5IelteLmIEpAzkNnSpPY5SsEbl87UBdtcznLcX1XlkXmtndQHcqKug8aOsv/w
 CC6OMcJB0WWDnlYn5tJQX1+7qDZ1QJ0Z3kYxLAKHSWQ4VBoqdpzE6eB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 0uAvDXuJBvWuBeN2ekEawJqFd1A7ij8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX3tR3NI6Lc06S
 5cpNr7WO+JzYDhJ1FP8ekiF1fz+SxmEaHkwSaOvmBhsOrSRNDV8fD4fz4WbQgyHT9lIODPIqE/x
 6CcJbC1i+/BzUGPiWDRF9/DwYmArpo4ReKBWZFFZ28OKBJQLSgDJFfCjefoWoJaBxnsjMfHmNJx
 e2sEdurd89pLZtabmp4Ur6wV+emOoyhXyi7x1ja0g0+jJdo+MtQT1NH7lGrISbeirToG8PdY9Cn
 nySM9aa7MM0u8/XqCpgKJEWUilvjlzJrHqP3RndhARmxUhEpCXxg00lA4dSBwTHCUc8OPrrMvYt
 5pn7ViZYIaUHSO5oWeUefRk04DQGP8YswJ9Wbh3mhSgkA1rYrl/3ovbKBHfl8mlnK4o9ihRj1DS
 CTGe13JRpANOq6kvPynBWCDuHasVAuKWYg5QhK6QDZ4AR2ocaqxRpCK2QCIqRG+XdwjjDsWS/y1
 Jt64bHcNB2he35j9LUA==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59fcd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JfrnYn6hAAAA:8
 a=uHxzPtsY3S2Ib2_9k84A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 0uAvDXuJBvWuBeN2ekEawJqFd1A7ij8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX283w0Q/DJ3pv
 jg6ZONmnJkCDGyzO+1NeZa53TXcdo6iABRMbcM94oOhlah1sgHbxKrnRQk7MTsXoL7hinaSUXGX
 iFBAD8ek9mY+vC6JRVv7CrtzDRW4QYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

Hi all,

Some QMP PCIe PHY hardware blocks can be configured through a link-mode
register into different link topologies, such as a single wide link, or
multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
PCIe3 PHY).

Earlier revisions tried to extend the existing single-instance
phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
amount of conditional, multi-PHY logic to a driver whose data model
assumes one PHY per node.

This series adds a dedicated PHY provider driver,
phy-qcom-qmp-pcie-multiphy.c:

A single PHY provider node describes the shared hardware block. A new
"qcom,link-mode" property points at the TCSR syscon register that reports
the active topology; the driver reads it once at probe. #phy-cells = <1>
lets consumers pass a logical PHY index to obtain their sub-PHY. Match
data is indexed by link mode, and each link mode has its own array of
per-PHY config tables, so one shared provider exposes a different set of
logical PHYs depending on the active mode. The driver inherits the PHY
settings and link mode already programmed by UEFI, so only the no-CSR
reset is used, and no PHY setting tables or related structures are
defined. Each sub-PHY owns its register regions and power domain, so in a
bifurcated mode the links are brought up, and powered independently.

The driver is implemented and validated on Glymur, and is intended to
be extensible to other multi-mode QMP PCIe PHYs.

This series depends on a prerequisite patch by Krzysztof Kozlowski:
https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v5:
- Split the Glymur multi PHY binding out of the shared qcom,sc8280xp-qmp-pcie-phy.yaml into its own schema.
- Reworked phy-qcom-qmp-pcie-multiphy.c into a standalone driver instead of extending phy-qcom-qmp-pcie.c with conditional multi-PHYlogic.
- Dropped the "link mode value" cell from qcom,link-mode.
- Removed the QMP_PHY_SELECTOR_0/1 dt-bindings macros.
- Link to v4: https://lore.kernel.org/all/20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com/

Changes in v4:
- Replaced the static bifurcation probe model with a link-mode
  architecture: the active topology (x8 or x4+x4) is selected via a
  new "qcom,link-mode" DT property and written to a TCSR register at
  power-on. This replaces v3 patches 4 and 5 with four new patches
  (driver refactor, secondary PHY clock/reset lists, link-mode probe
  infrastructure, and Glymur config).
- Updated dt-bindings to describe "qcom,link-mode", #phy-cells = <1>,
  per-mode validation rules, and added a new header with
  QMP_PHY_SELECTOR_* and QMP_PCIE_GLYMUR_MODE_* macros.
- Patches 2 and 3 (multiple power-domains, multiple nocsr resets) are
  unchanged from v3.
- Link to v3: https://lore.kernel.org/r/20260412-glymur_gen5x8_phy_0413-v3-0-affcebc16b8b@oss.qualcomm.com

Changes in v3:
- Add description of each power-domain.
- Add 64bit prefetchable memory range required by some EPs eg. AI100 ultra.
- Move PCIe3a after PCIe3b and move PCIe3a PHY before PCIe3b PHY.
- Link to v2: https://lore.kernel.org/all/20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com/

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (3):
      dt-bindings: phy: qcom: Add Glymur QMP PCIe multiple link-mode PHY
      phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
      arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared Gen5x8 PHY

 .../phy/qcom,glymur-qmp-pcie-multiphy.yaml         | 176 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 336 ++++++++-
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c  | 770 +++++++++++++++++++++
 6 files changed, 1300 insertions(+), 2 deletions(-)
---
base-commit: 59ccadbf59aedee486fce5b4a5486a07c3f4b5d3
change-id: 20260716-glymur_linkmode_0717-70eacf08a5c5

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

