Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A553E557C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743952; cv=none; b=gd64Q7bLQpLPZmc+XMxjurvChMJCdxdRNQZubKq0DazDVuWV+W36E35xHmbg0NoNyl5MCSK8Os1GeQmF0iAekODCbHnfHx4UlbEw3CmNBjaI18fu8a+gJxLTCdOWjFZY8LltZDYrsIID3kJAzQQ4NjaWIpF7zsMwcnK96FwTtNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743952; c=relaxed/simple;
	bh=6fZMUqee2aB+Vo0b0fpaMbB3v1+SLirfRFRS3G5lKL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/QKzdDHH6OEdUxHUn11OOp6UmWwOtQvyRgMsIzjP3ZlX6nlP1n7Qqnrr4O4XgBQ15jloODg4InVO8AzZl0VzdgidNYqOdJPmXGPYPpjkRrbcwk54vN+Yexs/u1sy2RMez5DmrqDbW53TmtKdJ2R1JC2vu59i9j5F9swFYio3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+LpHC6g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgOeCkLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+LpHC6g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgOeCkLg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAHUW5426039
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aT5qAljuV0+
	+vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=; b=k+LpHC6gezEQ+W1F7sHPLMI+S57
	fFyCl/hLL0vcjw8XdrdIAjLegHdN/0t6iWndSzoETpIsEsLnkTsYZrvnMF5Q08sw
	9Xnwnn3ECowMWAAoVG2DkO3E4Biq1efOTI1/JnFylUjGpFh9ZW5NUDDFDbwbKyfM
	Mekl4+2FkT2cv1dcxKoM4RL6516bowTXjEmUZjQHegVa9uT0SwfEchxhP5nRqCFf
	s3cfWpmU6rk6BCaftkvj28rY7swdRhHflVAjhks+Cx4l7WauNNaWeJBWrVPU50sA
	aqAbQTTugu1BCZP+jENHRhzE0s2/Uk6rCRoAOGiYV0mAULFw+pMf+ezF2Aw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceun28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:32:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1656393a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743948; x=1788348748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=FgOeCkLgA9mhfyAXJ155WzR2jyeOvI5Ci926qhlHgTI2GoB7N06Yq66E+vswe8Nvhf
         uCJou4hqJvMYrUl1cvwo1piRPhuhuDF1pHrSs2Bhrk8yApblAMDNSBU69pTXxl1h7DAe
         Gk8W66C8W8aMPgY8iYY+XYZFb/ymM7LjnCli31/2YqrL5kCEc+KglgIvGmJfMnVROZyL
         oFzoNuhd4xl/VbCpVWec3SSderROjV/w7Jh4hH1x1ZNLFKueIfia1t/+bkN8rI1diUpk
         ae546nU8MNruiV9WuEFVcddw8jLBayD2mYTvYHbq49DFbyc0I7vtovfXXsjbxH+E61HK
         6gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743948; x=1788348748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT5qAljuV0++vGL4T8UbtRBJmY87Vk58Su/AO6An0Bg=;
        b=LS0bP/gwo9XHjndMm+4aCZ8qN/vaKiNXo8w7sdIWHeoFE/KzEBtiYmAc3UBWs3mR/M
         wg+zEZKB27SZ5PofoUri5E6Y0uZ5SNtxJ4kWUT1U85ao2hncgSGW+sG8gbmuEKod/Xdi
         zqeKEgW4wwtkacBhybmky58rToRC4t428HIU4Ov2qBCwgZ3tRoJe6KUZWikNZrXUJFPY
         zGy7TPDN8N9hL+dVWhaQEQZBKx0iVQpxy4EyELi7lwuKsAcg5zpWcBSCRf1VXrkRjIKx
         FbJwXzhSK4tKf9bmXvV1lV0erAxorY6XQB5ewKIq1dPDSArHrjCEnOoicaXrXZBajDm/
         MCxg==
X-Gm-Message-State: AFuF++m6je+sNuOpAHzxOozsnjiqmOpa5Tx/KFyPPm+VQ1oryf0UwTpB
	IOd2grTbjVSKioIkhO6RqOepm0HcLaplJfZYgRQeCx9DZ88MLTbf/LJsw+/NXWiRghttMWep1jm
	UfrLsu53xVcYEa/PoaeZnglE43XE4YtPP74vlMAnIu2bKNBuClKxF17wg6Ik0wpezmLT5
X-Gm-Gg: AR+sD12Bd7a9reeHjRYNcAZhn+wsoSa0EUJnTLPT+C/VZ7TiMM9VDjmbYM9y282c3Ry
	vS6XIE2NwtWRJBcKLBp0JvxNE5UTucLvPeHGF5u4v+uKlaFG/3C9eNFFcSuhOYmqfP7QTKrZWuP
	xYp3qBlRyKYohcGOuFl1ey0tqn3C1x09Cu2wvI6VW92+dYeDxg0kNHBrvfFN4Fxw3/LbysYq2xp
	2Sp5OVZndQyloTE/fUj1bRhSSIc/b8BDYsKuo6qqLTzYbKO3lg7Y5NODVlYft6FZaHOUJ2jjRq2
	prsqCXFBItRRSmoe2FY6MAyATqDvrNsq1EiygERJoQbDBAlwIh+4b6dT4yhsX+tAzBCBHE6QcQQ
	vx2hankklMfVHcS+/sAoFUCVeTMELK3tnewU=
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541161a91.7.1787743947665;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d2c7:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3966d1f21d1mr14541058a91.7.1787743947177;
        Wed, 26 Aug 2026 04:32:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b3a49bsm7748929a91.6.2026.08.26.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:32:26 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH RESEND v1 2/2] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 26 Aug 2026 17:02:06 +0530
Message-Id: <20260826113206.488991-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
References: <20260826113206.488991-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ececc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=m25OAOzQKwXoSehIqtIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX4ECpESwHILvb
 JUrSIN7AP0rySA6J2OUzwOGRIMXcRY8wfdHX3wuMyYzVE9h8VBQrAS4OXLOtdLczf7ffL3qD/gS
 Ray5zTBa1kJVhtMdKge4p3RuU471Ack=
X-Proofpoint-ORIG-GUID: jDbdMcYTCuHhPOArYqF2L9k1YiUR_0lr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NiBTYWx0ZWRfX9AavMyuEe3A1
 Si4JnYiKkn/ay260RsnX+AKVVtgY3Eu/lD0iK1xASpiJudJqnFq4tnpsMZn6U51cofZ8g8UFDwi
 SIWgK4ws9vkGTiKD6FbSk/M565AxRYaZo068ryYHtb92oE1tYRx0CfAVKLLcQ8SRVJ7P7Nebt36
 Q4OgWfPH0Br5lBMzUMmZE5IImrItPD9eQFCGqzD5gaWrjdo7FZkJjjqVAcTP54bBZgUPvW+OUEH
 a29gScY0ee4PSV41gszAFyryZ/wwy4/LtoAO05nDkG+amju2gMRDhXQfGdJ0piAQeKJpbBLbRpL
 ca9P9NTem1jNFDls20VcjXQ9zH9XcAUOBii+RGNbCrCjwmMVO5PwG74IzFzhjmVwhdlnul7QwOO
 3z+osFdQpFmFrZA34IPGwFuPuqogJ5K7mXujoFHhUbZFloE8MclhLnu/TnRT2+DlWRqYyVqJ9T6
 ctXj32FAHY0kTWqWlBQ==
X-Proofpoint-GUID: jDbdMcYTCuHhPOArYqF2L9k1YiUR_0lr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260096

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 3 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 67b768fa8063..2250e16e9366 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -46,6 +46,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-emmc-dtbs := lemans-evk.dtb lemans-evk-emmc.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-emmc.dtb
+
 lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
new file mode 100644
index 000000000000..52739d39a1ff
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+/ {
+	vmmc_sdc1: regulator-l8c {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-sdc1";
+
+		regulator-min-microvolt = <2960000>;
+		regulator-max-microvolt = <2960000>;
+	};
+
+	vqmmc_sdc1: regulator-s4a {
+		compatible = "regulator-fixed";
+		regulator-name = "vqmmc-sdc1";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc1>;
+	vqmmc-supply = <&vqmmc_sdc1>;
+
+	pinctrl-0 = <&sdc_default>, <&sdc_rclk>;
+	pinctrl-1 = <&sdc_sleep>, <&sdc_rclk_sleep>;
+
+	pinctrl-names = "default", "sleep";
+
+	supports-cqe;
+	non-removable;
+
+	qcom,dll-config = <0x000F64EC>;
+	max-frequency = <50000000>;
+
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&tlmm {
+        sdc_rclk: sdc1-rclk-state {
+                pins = "sdc1_rclk";
+                bias-pull-down;
+        };
+
+        sdc_rclk_sleep: sdc1-rclk-sleep-state {
+                pins = "sdc1_rclk";
+                drive-strength = <2>;
+                bias-bus-hold;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..99d21e3d7ab8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4300,7 +4300,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+			      <0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
@@ -4308,9 +4310,11 @@ sdhc: mmc@87c4000 {
 					  "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				 <&gcc GCC_SDCC1_APPS_CLK>;
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "iface",
-				      "core";
+				      "core",
+				      "xo";
 
 			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-- 
2.34.1

