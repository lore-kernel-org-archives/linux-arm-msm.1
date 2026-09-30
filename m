Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B1471CED
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766943; cv=none; b=ZR8HUSQiAIN9ejSMLGs1C5KlJLfzaV5DJExvS0gajJXdV/tpIISzktPdj+ALCNMl/VhxdoCMPYBlMpRIOKMWEdh+OBaPQxLDP0y8akqMor+uQpfGeVQ7FZLEWGEeDChmh0TOmqtpTGWe2i0QXODNemPBlv03d+2IXSjh8lY0MgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766943; c=relaxed/simple;
	bh=FlsVjPQuDtqjaxxWjx+jdulLoth/F08E/GtbuiUpfy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m++RaeuHDqZn9P4Y0o6ol9eaw36pdNS43FYwN+5Lz6gden6nmezWya6I9EreTTHqNGcrmUEnk+WoI+v+vnjCzqr+tVPfDA9/JHhdXFHiX3qW0Z2XpN20kMRsGYMJyEUtHlNQuq5HnEdTv2Lpomc7SzuXCyQksVdlYw7s8RU7r/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmwxrKeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbcrymOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmwxrKeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbcrymOq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7Q2Q2019495
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0vFxoDo350lWQ1TF1Qr4ltDjqT513BpGFh1q0I0wO0=; b=XmwxrKeU8PkEXjEp
	0ApDgGW5nz1vUZoiWsA2vwuZF2V7aaNQXrqEUlISnCKWPpyTk8L2nVf9PNtWmuoV
	l5Y9wQN9eNNMiLunlx8l/Y3w9j6f5jtn1ZhQeq7EPhBCk5eQ1rMOWlb3oUKiw8np
	NgsMxHMfJduM3+xZbx4BGLYSIAdwrYME07qvroWs4qxyn1Os6WTUxNJG4ISV6x4K
	oTWoWieKmEf6GHbyfy0Y8LhHKHh60wtvvIAjBkiZQC1+AAl4AvZ18SzY3a9lLku1
	g0+MmJSemAPuF1vX0a/Jkah9N7hU6tsSHHXrnXH5QkeYSglSHq/fJTQ6T3p0QBEj
	q5QmTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0yq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3d832827so58740295ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766940; x=1791371740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0vFxoDo350lWQ1TF1Qr4ltDjqT513BpGFh1q0I0wO0=;
        b=NbcrymOqAFavjugDWz1T+rt4043HUEKn+OUTKK9iGeab2EdP6u+oU5VYKpAGV2E4fv
         cACfuuO7mVTOfZVbJtWzoyFEtyQ11jetzHDwGJkOnIt8lVb12kJricAtyNFZQXXjUG7O
         xzGZmPYFucLG7akxBGvmF/BPsWVkq7528STHSWvqPMJS8OP0TU17lDZrFyV4H02ZG+Zi
         JYaoSQcCXpzSvZy1qeHPjmoKNdW6cKXpfHh5tzntrj2yGJBYENMWWTGM4qjyWgnaP1xO
         8TdN3jOMY8oyTtSLkFdsuoGYnyg9AT2BJczl+6iFx5XtNAotDLJc2OTDmXLATFS60S49
         Hlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766940; x=1791371740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0vFxoDo350lWQ1TF1Qr4ltDjqT513BpGFh1q0I0wO0=;
        b=lq50e3zDRUeTXEY45nDmQ3z1NYVgamDO8RDJQa0RhMYNp5buAu84mGGU1B7G6K5zPj
         jp0zCWXXrmWLq1mcgzHE4cQaMQ0Zy1nU/aZT0lI2nt1diSytwzAXg1S7VKu5wJVSK2j/
         qpe0XnsXnSQf7kHsN3xk1YPfgddb0y3PmSJzrc0pHk2TXxdbyGucfh4Vg33nmilezYEv
         hy2bKFk7b/hkbVAaJnZGVsTlHoroZDtFmFJOWNlC9gYLEsHQxzJ3FrVfVS8Rl0DQe0HF
         3V2ylnWC1PR73z8tBozsfmIdXOitGWIb+VFP2ty9n0N9ctUuc+lJ9MssJBx4yYfp4M2Z
         RUow==
X-Forwarded-Encrypted: i=1; AKwUvBxCFVJdIrrUDTLBSr/7L8Sr19C92gzUgxCoPUIuto8Kb3ldQg7yxZH+dmE+6gJdslUT/yReG8eGf6OYEyUB@vger.kernel.org
X-Gm-Message-State: AFq9FYLb+ys37aPDEj2drnMdSdoCF/tKxjz+yAqSs5+t/l2bioGKl3gw
	QcR37JSvoBEchIuJjl2cr0TwY/zpkE6MkQFAh+MSa6YETYXh0KYaqsYQEygo3qwvGYtKWYXjqkp
	hPXlD89sNbUTVcutBn/lpvZcBqlSjH8rJTHNmfnsLUCQvJyaQjn24YpqWG+Jiw0GDb6Fo
X-Gm-Gg: AYBFou0IAhIZYCdZOq2pN8h5//GVkgx5evUVpEJxEvXJMKQ2slyoRCNjlPx0jbyaaam
	3OGXRf3GDOv9w/wv6ap3ngSLSUWg6PKIcEgp0a2X2upf1pTt1FyWnY/zK4znJGF949MdOGs5+UX
	ZrKjUuOeykJzt4KT70QoewQsskB892OsyCiZTHTiaKeSS/zrkS/PqCCejJAQZ/CwF03a7e93E+f
	Rxij5bS+b7baT0T5GZyGoMFvR2Y1uVT4KV+wYZMv26iwbLxB3YfWT5ncE9nSoGPwEVmxT1/OsXN
	PtgnAqsdpIUoaLo4QWc6Q/SqrAXc3dwpzDUSUElpha/k2Lws3dDImTGpBOu6qfWq8QTnF0bwRFo
	myxGAeW42naaVGOOQ9KPurf+8Elw=
X-Received: by 2002:a17:902:f712:b0:2dd:c100:a5dd with SMTP id d9443c01a7336-2e2e4b98244mr10200415ad.49.1790766939938;
        Wed, 30 Sep 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a17:902:f712:b0:2dd:c100:a5dd with SMTP id d9443c01a7336-2e2e4b98244mr10200055ad.49.1790766939472;
        Wed, 30 Sep 2026 04:15:39 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:32 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:11 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-1-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=6974;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=FlsVjPQuDtqjaxxWjx+jdulLoth/F08E/GtbuiUpfy8=;
 b=wk2BE87ewYJSl/jvWD+v++4XpyklbftOuzNu7UMayeI/Z8FZQiQ9V7hb4GvfpGbw4+lsl+rp1
 FIL15CB/k4wD+NDeTTM2XV26QLI8hhQK7ssbJj8WEVvpu5J8F2CvdXS
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX8Dq7UF41EAb+
 RKXat7FMaMZH+y65i6GArmaRhMGbuAtsUltQ/hQ05JTz8U1yO002F7QaOTGIbAsjiNuP/Boivdb
 ajQdgXH5X3Et9k3/9XqsfeA4EJbH4do=
X-Proofpoint-ORIG-GUID: 56COS8yhQYRr8f6c9dS12lB3yjgFQpoX
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcef5c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ETLJq0YgDw9Z7rpyrqwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 56COS8yhQYRr8f6c9dS12lB3yjgFQpoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX9qijHX+ciVhy
 cYqudlNvYYNvLmpd09ytXk5s2Xo+4ZcOU6VYRgwF3HxspyUXeLWllCQVHeR3PxHVfwiOjtvMefV
 VgPqJDAvhV1eUJjLK/XCBDU928Cjyr4eO3lNojfBsmp8m0WcoK090iDsmQoM+ycZKCzpbzAbztv
 1aEK4ajfiNHj+gl/YeYI4o82US0yw/fwOjCZ64gyPKTxXeSOxBhvVoMBgHWlzBtMwYEkJV5fZe+
 uUfab8cBymfQcVEoRXyW2YFLCEkg2bN5wNwVwnZBLFhtSbl14dbeK0Qs9yN61ikgug6E6px3g06
 moRUaiG7S1tsbBaHOBXvLLl+g+hZ8OGYHA8wXyW5E+7CTzSlIj7OAeh91g3KpIkbf9z5lcd0zNq
 j0gnIq+ZWpqXYRvZyveaIvfVPvlcNSFfSe5uFgNJ2tm3VH133OEfq42YOW1V+SKfYvqOWx7W6m4
 7QnxMWzibimrWzfMc3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

Add the SoC-level display subsystem nodes for Qualcomm Shikra:
MDSS wrapper,DPU display controller, DSI host controller, and
14nm DSI PHY.

Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 9823c591b02b..4ff85c1c8fdd 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
@@ -2809,6 +2810,207 @@ adreno_smmu: iommu@59a0000 {
 			power-domains = <&gpucc GPU_CX_GDSC>;
 		};
 
+				mdss: display-subsystem@5e00000 {
+			compatible = "qcom,shikra-mdss", "qcom,qcm2290-mdss";
+			reg = <0x0 0x05e00000 0x0 0x1000>;
+			reg-names = "mdss";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x2>;
+			interconnects = <&mmrt_virt MASTER_MDP_PORT0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &config_noc SLAVE_DISPLAY_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,shikra-dpu", "qcom,qcm2290-dpu";
+				reg = <0x0 0x05e01000 0x0 0x8f000>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,shikra-dsi-ctrl",
+					     "qcom,qcm2290-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x05e94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+
+				power-domains = <&rpmpd RPMPD_VDDMX>;
+				required-opps = <&rpmpd_opp_nom>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;
@@ -2816,8 +3018,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",

-- 
2.34.1

