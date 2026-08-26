Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAF12620DE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713195; cv=none; b=BENMo0gNQpIktDorLsM23UT5TGEjlagal/MTuoPIijnSMbFyrXJ63qJfquzy1qHxFm+gJbLZzSJMG/s2TkQ1lsiIKotG5SsqUetUBVC1WO/5r9tCc30gJXM7Pigv4mssnKdgXROZ88me3RWFFXEuiebqweMpWEx7H87na2hWGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713195; c=relaxed/simple;
	bh=rZHcXUpQLfOGoX2+9MvzzR5kJp0s7tU1P38XpiNjR6Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fk0qgIxmiKUXwMKe5wXFMXCrRGXI2o9qeZ7q6yoV+qnMEcAXsnGXvsEMJg0MgqQw8gwGiKIVlBK05wCzcZilAiC3R/WF2Iic1Eq5xvlR9ujYloCX6utITF7rMjsjnUejzlfVdaPTMeVKnNVoNhqv/l7uz/fQhlbQ2B5U0vk+rx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mk3CIDXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jr914z6G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk3CIDXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jr914z6G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q07X0k2963716
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tsui+jCLbes+AY1aeuJN4x
	2smWocT5xCPUCpoX8LYeo=; b=Mk3CIDXcp5//5XKXXA2LD+DUcXa6tBx2EUhxQn
	/sjxV1LvmNteCpb6ORA4OKveiVGNM6lakDJ4lkn0+0966CmITnkntoP5cccfkm1Z
	oRairDi0lfZxNOKZjnWYClLW4B3tGVq3YvkGlhe46+js9BhtLIc/u6pg1PUKfF6B
	SxSQMhc6q0rYeVQHDDbNDryNDTBwv6/Nrjl5mAfk8JFCrjiFe+KXm4+mCGNOiR2T
	WiYIbIjzNhyyiMW2PHSdYWdKdd8A6vfkqzTBQiLbuoI4qRJG0VhkgVBkI69aBOQz
	3EEGEJtysCQf4TsoWDkrGLtQCoE1fLlf7/yr2W3T2uQcXpVw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgu2m2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c5810451so267580a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713192; x=1788317992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tsui+jCLbes+AY1aeuJN4x2smWocT5xCPUCpoX8LYeo=;
        b=Jr914z6GanYJpbBWjD5Q0y8KUSDFUOsajoFRklIliO4k5dtUAG4cVpniEGMWfeVi6y
         GSwk9zJ4vN/MZE10h2BamRl9I2zllmxkRIGqAdBrPy3aki4V+I/XiooD7wsri+i4NDhM
         RnCaIzETjdsorp22x45HPQngW5DxskW5mFnVLfJHkvJCwIwYUn7SCQz1/njXuqS3GBtM
         ycP2OyMVKIg5aGugxrxQr9cD70W0xa+HcAOMaktf4Z7hh92VSGtGnEw7DT1amCw6G+FC
         y4Zeg5cs5htU96td4VlPqg6iPmT23PmhbzPNKBII9S4Ifv2BYsf3c/harQDFAxC4fNsB
         WsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713192; x=1788317992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tsui+jCLbes+AY1aeuJN4x2smWocT5xCPUCpoX8LYeo=;
        b=A0uaOsx/l4NHIXUFIxTDPq63ftn9DHOfrtM+SCymcKg7Pa2y5CVbVaNvJESmcfQ1nP
         r2ILMXFkZ2q/SJKDCDjgVTYuUhPstrQCs+PfjXtBpTz0f3rZIxphY9kFzi7X4it858n5
         OyT7kEPeVt+D8cW9uOmiGab9ipr+IK2AgxlZgf5O9jbHlExqIv/z95CIi5bhRbf+Brg9
         QJhalOEhLudZ/2N+pMZQVXZb7caqFWiRf9uQXNh2K32c6FB7q4xnJ+Md1jXuA6pWNYil
         CkDMNsWDR8X1kQ/Kjo0mWE8iBEfpO9qUAjsjZ8h5ktc5/B2fB1vsWOwdXp+vCAWaLVne
         sD4A==
X-Forwarded-Encrypted: i=1; AHgh+RoEBvhEoVh3iOmJXb4Twzi28deQBveynuy1QLm3KCWSWnbFFjVc1qvqFq8qTM67CL0TMD+neZlOxhAVIEHR@vger.kernel.org
X-Gm-Message-State: AFuF++mXTaCrkuoUb0787uFxEr1J5I96MHCCqwuzL7ug+Uxl/JMAUHhW
	KCAko00LClCdAE4RmrE3osSbPDo6rNzyUxQ8hZPQIh+/dJmJJFgCz+fuAaHimUWjdrMIMld/9pR
	bRU/PxaD5yptc+awMNg57Zf0iUhnclLkdh7CjelUVDQLot//u+uCFVxJZDsBs77Q2VVq0
X-Gm-Gg: AR+sD13e8mc+TPro4Q5o79vMgWpvZ0lcQnTrKItz/RG9e0vGW3JMYPjVn4CP7/xVhfZ
	0JJzN5WUZHroSCoxR0BhFMGZJGckLLbVIcSRsE3m04vKp492glZ90XYy2Oij0UkAb5lCXjf3TY5
	5cB9DgbnNE9DDKbtLD82a2Zd0pW0yislvCAbso4Dwz+kwh2e6DrXGyulJy9Fe7ySNS8ZkNX+l4h
	REcITsVWwMnWb5OVTdBZfB/Mfr5rCXYEJCoiA2RnX0IRriQcDSCG6XgTH2np9dq80mMo+KTan/d
	vDOLjKVsBT8Uziqbb6UMjKZ4gaZsYv5s+pgDvRh8+60pErM/lexAJUjGw0RA9Y5N8W4u6f2LfP4
	tAUwOoRT+qoBJBhFhmmTTabxav1xFezsKpoWdImfHYTgAut8=
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr6238661637.12.1787713191417;
        Tue, 25 Aug 2026 19:59:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:730e:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3cf83c17b2bmr6238539637.12.1787713190851;
        Tue, 25 Aug 2026 19:59:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:50 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v10 0/5] Add QMP PCIe Multi-PHY support
Date: Tue, 25 Aug 2026 19:59:19 -0700
Message-Id: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdWjmoC/yWM7QpAMBRAX0X3t9UslryKJLaL62O0IZJ3N/w8p
 865wKEldJAFF1jcydFsPEQ8DEB1lWmRkfYCBBeSpyJh7XhOmy1HMsM0ayy9lCxJY60Uilo2Gny
 6WGzo+L558bPb6h7V+r7gvh+IJU1HeQAAAA==
X-Change-ID: 20260825-glymur_linkmode_0826-584dcce2b6fd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=7214;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=rZHcXUpQLfOGoX2+9MvzzR5kJp0s7tU1P38XpiNjR6Q=;
 b=WSUJ1UMIBRSomGIUr7FGfQvW88zyL8Oq921Ni51+tTua8+qfI9Uq5xhZTwPKgPuq/EWttsdUd
 mUgAYyDnR9yBbfN5e2pWchn+g5bhZJJQSIU2p7fTJVR3Nu/N+PyGPbA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX11kCmY4uHrSz
 VwK31WvkC/S7Zb8H4pcU645D47NN1lv0ew/o3UWdnB0Y7bjZA1DG5z4lR6+SLcvdiIM5pQx6iM3
 kzubK40jMQyPxgwQ0NUWtAga3vgqaHU=
X-Proofpoint-ORIG-GUID: hDrl40vju--Ua_1YqfLlieXJn3RDaLCP
X-Proofpoint-GUID: hDrl40vju--Ua_1YqfLlieXJn3RDaLCP
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8e56a8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qMU6Vhuv4BxmAn6ANj0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX/rV8duhroqgT
 d6gnw17DQmPkYj40fsRi0B/SGOYJ/gfKWMI6rPwssW5898ON5F51SVrWBNIsGFRnkomcsKQag9Q
 NbUHMw9QSxcF+Yt32rwMDr51+kqgHimxFBN9h0VJlZJV6kv+lHp2txI8cvZGDUis0foExC+ixM9
 4JVlr8qqmuwUQSwf/s47VTkps3tix/Sd9J3d4hss8/vaOqAyzq0MRLHg9rYCNQbKpEyjbhv3kr+
 IkfPJ2L4ux/MBFriRz4c0+l4OmHDDDA/4sA/beSZyjpKkXncHhpexEEwO1294KT+R/TG3pYyw3R
 f2XQCSGgXIM9a6MycDQK8t7coC4c4cCMASMoYogy6ET2aKRbcPT0CFNE5A9EX4QlIMtp/O++A1T
 BsFMRMk3qR50Jfxj5Ak+GCMkZkN6xQGsJiMi0AHMfc5rtS+FiMbKIbY7rFmO5WP/upZE+3fpykx
 8R9IidgazumvB2CNiuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260022

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
settings and link mode already programmed by firmware, so only the no-CSR
reset is used, and no PHY setting tables or related structures are
defined. Each sub-PHY owns its register regions and power domain, so in a
bifurcated mode the links are brought up, and powered independently.

The driver is implemented and validated on Glymur, and is intended to
be extensible to other multi-mode QMP PCIe PHYs.

Thanks,
Qiang

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v10:
- Drop patches 1-2 (dt-bindings, driver), already merged via the PHY tree.
- Fold in the defconfig patch (previously sent standalone) per Krzysztof's feedback.
- Link to v9: https://lore.kernel.org/all/20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com/

Changes in v9:
- Drop the redundant default PHY_QCOM_QMP and fix minor style nits in the driver (Vinod).
- Add reviewed-by tag.
- Link to v8: https://lore.kernel.org/all/20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com/

Changes in v8:
- driver: drop the always-true fixed_rate check, the impossible
  num_pipe_outputs < 0 fallback, and the unused pipe_clk_fixed field;
  collapse qmp_pcie_read_link_mode() to return regmap_read() directly.
- glymur.dtsi: use GIC_SPI instead of a literal 0 in pcie3a interrupt-map.
- Pick up Konrad's Reviewed-by on patches 2-5.
- Link to v7: https://lore.kernel.org/all/20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com/

Changes in v7:
- Pick up Mani's Reviewed-by (driver), Ack (binding) and Krzysztof's Reviewed-by (binding).
- binding: fix commit message to reference the actual filename.
- driver: rename Kconfig title to "Multi PHY" and driver to qcom-qmp-pcie-multiphy; PHY_INIT_COMPLETE_TIMEOUT -> _US;
- Print errno in error messages; reverse-xmas-tree probe locals; handle NULL power-domain with IS_ERR_OR_NULL()/-ENODATA.
- glymur.dtsi: reword subject to adding PCIe3 PHY and PCIe3a controller nodes; node -> pcie@1c10000; drop num-lanes; add pciclass to pcie3a_port0; fix 32-bit MEM range identity mapping.
- Link to v6: https://lore.kernel.org/all/20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com/

Changes in v6:
- Remove dependency description since it was merged
- Rename the binding to qcom,glymur-qmp-gen5x8-pcie-phy.yaml
- Drop redundant minItems on reg, clocks, power-domains, and resets
- Rename phy_a/phy_b reset-names and power-domain-names entries to port_a/port_b (port_a_nocsr/port_b_nocsr for the no-CSR resets) match reg-names.
- Add a description for #phy-cells explaining the sub-PHY index meaning.
- Drop the unused "pcie3_phy:" label from the binding example.
- Drop the year from the driver's copyright header.
- Fix a pm_runtime refcount imbalance on the qmp_pcie_pd_power_on() error path by switching to pm_runtime_resume_and_get().
- Split the DTS patch into a SoC-level patch and a board-level patch.
- Add two patches for Mahua, which only has PCIe3b wired up and no shared Gen5x8 PHY block.
- Link to v5: https://lore.kernel.org/all/20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com/

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

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Qiang Yu (5):
      arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a controller nodes
      arm64: dts: qcom: glymur-crd: Add PHY supplies for pcie3_phy
      arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy with dedicated pcie3b_phy
      arm64: dts: qcom: mahua-crd: Add PHY supplies for pcie3b_phy
      arm64: defconfig: Enable QMP PCIe Multi-PHY driver

 arch/arm64/boot/dts/qcom/glymur-crd.dts |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 336 +++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/mahua-crd.dts  |   5 +
 arch/arm64/boot/dts/qcom/mahua.dtsi     |  89 +++++++++
 arch/arm64/configs/defconfig            |   1 +
 5 files changed, 437 insertions(+), 2 deletions(-)
---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260825-glymur_linkmode_0826-584dcce2b6fd

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

