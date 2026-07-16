Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937942BE9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211932; cv=none; b=tEUqifs68vVve2ohubNDt2VJQ+VD+xoRMY9wXPywhepwV9u8o4hAZ7YnTBfU8NyLvrK2llXXoAgcCEoCpbVXbhPS8BZuoa103Bt8/GGX/AJ4r2JvoHc4/EmvKQCZ7IsEvJGeZu5ot3e58wxAS0Fwaa5BncHIMHytOGhSrap5zIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211932; c=relaxed/simple;
	bh=F2pjUZPSQSG0UbROTs2H68prkNCNZx7c4zDAujqDi/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXYxmIGM0QwCkO9BWGrvhUFaesUlwvwSkxdEkcDBvn62eXgaHVUqoL6XOXKISFRtYZMc8+00z952nulth9K3xp/LpbsO2aEd/wr9TtUWRjKEMs9ytzGBFgmgU0stSgPZ35KjWffMdKkPKqpKH7QWbLgZqPOSdn6X9vPK1ufHaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIKydUle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brI+WSVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIKydUle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brI+WSVM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKAeY2722852
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4VVPsqKfWwY
	ISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=; b=VIKydUlepjo1gLEbFxvHtJz7mCL
	/6ATMz/NI55zimZSGnzClM8zYGJl5RlsuDJkb15CIAZKr4+U8KQa+RgHhKP+tQH5
	PKuU/oGfF6hojz7fNpAoiyw71zUkt7tKCzIEWl4TYTAN5XFVUY7YJKcAxD4MlSmF
	P0XnuCfsB4bbTdGP8GNjomg5PeSWFEorzClU1iij6v6Vew8ksdcjsnOxmNWYlg0T
	UQ6lQ+jn2vQmy2ptLptIRluauTBHYWFJSEExYYjghaq2xHYjPsouMu9hghzNSP0r
	/2tCo+K+8SWYLGC5j69RCL99yXQWe+J5G3pz1HqMDPuolBqTfuKIAK4hOgQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvcasj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55f0613cso868481685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211929; x=1784816729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VVPsqKfWwYISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=;
        b=brI+WSVM2MPgYEEvtaKAlO9DyVLQ4v2Qyf1KBqutEK1bVvX4etBlJj6FK1ND0gL20G
         E56nh5zOKIP4yTJa/l1bw/Xq6tfw+rni4tbqq1QHuZhq+Oti93jw59KY8kgNifipxdJz
         VFXipMdl0tyxG7ZYlkqofytlatcv/OTWOyXR4w5wX0fKrYYDyyG6kzb48yoEzlix9GNJ
         18yato6S8c4RSZNf0TdHDHf+loGBZTHlcYN7ltgDPGQFD/bDtGTWorrGMYrTGXGs8DJR
         2us7lYO6IKexB0MuditEUE1yOb6VFQS7o5ovodS/FKiKIphzv6YtEh0BbJRbiUoiZhSR
         TtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211929; x=1784816729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VVPsqKfWwYISo55Jbmm/CezrGc8XxTKTGbKnDBnQgw=;
        b=lD3wO6kCVGAEKEtRelo8fu/NNSKB51Zj+dvFr8ipPLF9nM97LsEFCCuXOnwzkTjxcO
         c4mc3Ds7I+D3Z9FqkjTgcntFzYrvEDLFh0VIy7F3nwKLUb/g1bU0fXYXp+rDVoSvCRaQ
         KwjyzmHACiqE26St8LB9bEeoq/8G6+WE23EmGrP54RzNZw0W9FoS8EIe7RWUC9MXsGa/
         t61PaM46OpJ7OyqPda6i1U3CE0uqw/BawqonL1zb5bfrp/a57MYPifa3rzM/ZRubXz8Z
         h1Vw/+gMlyZY235QQ1YyF6fVSwlyfoHV3ZmV8ICijYevcSM3tC3ZPH7xu0HeENdW5ZuL
         YKJQ==
X-Gm-Message-State: AOJu0YzLOaOSjJp0Jwm4F38J7r9Yn1un8Ney0YYNWGCsEXCK+4jt17XJ
	5Iz+Z64EvtnFxzl2mlrkyMjpoe4bMUsnhZd4eXxNebn8hILg9VsR7RS7SnP3ZPAZq7xlzz4n4z0
	kUh0iL3aVXN+hGBfYu4SfATjFbAieThnbKYZWuZ6FUaydyJwuqXN+ot/aYNZFxvClGXbW
X-Gm-Gg: AfdE7ckZjvZ4fgpZaIav5TENuzuW4rpEL6Zwfqel2M7uk/4L2dUKbqwH55GA8IY0fI4
	qmlzIKHA12tmIvKAKsumo01h+mlJiqY6khkACVgWfg4DR0hDuVWNYCP7Vg4BRFybeBMfrlk+wi1
	rXU5fS64UrEbqfxrd735pi+hgIHDf5BW5M+7Zz5AB9R6EMusvodHRbKj515zCxBz0JMPyeOHS1T
	CpsZTv1QcyFnSMGMrzfPwUSEP3dligbB/1jvwJZpQqh45QhmHOK2JwIqW9Cj4n/whEYVvj5o9KS
	nTbZBMToRrc17mluPWGGL5tyYbq3D3cUw+FtZez0w/O43prSSEZFstujbHzoeouPsN2Ua6Ax1Hq
	njXbdyxlXX4Kc1b0hMQueUykCw5fP6xh5YKM=
X-Received: by 2002:a05:622a:f:b0:517:9095:c329 with SMTP id d75a77b69052e-51e42480577mr113365061cf.45.1784211926161;
        Thu, 16 Jul 2026 07:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:f:b0:517:9095:c329 with SMTP id d75a77b69052e-51e42480577mr113364411cf.45.1784211925232;
        Thu, 16 Jul 2026 07:25:25 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:24 -0700 (PDT)
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
Subject: [PATCH V4 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Thu, 16 Jul 2026 19:54:44 +0530
Message-Id: <20260716142445.2767955-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58e9d9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JwlagmxLDNlzgN86bHYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX2cWOHjNXEzTx
 tUghEaGsh0qY6LKFk89ix9mb05V0wFDxGsmQ1hQl6v7HfnENwta5v+5dwP4fDveVsaLuYcR+6tZ
 NETwwsTsCs67HlRtOJW/5OfegUKZNGNdLAL9BiIAMeQm1WjmIZYHv9REk73EfzI8N+9w5Y13E9k
 YNvO2brjrWOBCaPmMStrNrlz8TRaTus9R00t140GQgowjnhdTavmheYrrbqKneGhMthYM7RMa4n
 vk0EQZ5ME19CQ1svXWJxuVEZsRr13czatGqP0dUHdfRs/qifFL25QrlLuvuG90nPAfzfRX/oTqW
 dt+2K9Q95uj2Gw8oA6DGMOQl/y161DyJA7bAv1jrfyMFYSL4z78LqewuzAstoNWN4NEQk+Y308d
 82csjOxmelR/iWoOAf3z4aCMzXQCU9gAHJbA45a8g3rWDvXfDfwj8ZS7+MN7uC8Ha122sEXIPx8
 6okBwWwqyKwhKsscSRQ==
X-Proofpoint-GUID: v7wcZRDC8EGcs7ij9ONe8iJRpOWhxh4Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX6FKuUILMh+6Y
 phGvnZgat7UHUkJJz3HQomVUoTgCmNkbVTZANR2ba4fyTYyWbz1sitEy7wW0kdOxg87w6ssdAVz
 TuCLjUBIcJ2bMOV34wG3JQ7cPuYwXTM=
X-Proofpoint-ORIG-GUID: v7wcZRDC8EGcs7ij9ONe8iJRpOWhxh4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

The monaco EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
configuration from it. This allows storage media selection to be handled
through device tree overlays.

Introduce an SD card overlay that enables the SD Host Controller
Interface (SDHCI) for SD-based storage on the monaco EVK board.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  4 ++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 11 ---
 3 files changed, 76 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..20e5a0fe7dbe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -70,6 +70,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
new file mode 100644
index 000000000000..bc4ea12587a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+        vmmc_sdc: regulator-mmc-sdc {
+                compatible = "regulator-fixed";
+
+                regulator-name = "vmmc_sdc";
+                regulator-min-microvolt = <2950000>;
+                regulator-max-microvolt = <2950000>;
+        };
+
+        vreg_sdc: regulator-sdc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vreg_sdc";
+		regulator-type = "voltage";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+
+		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1>, <2950000 0>;
+
+		startup-delay-us = <100>;
+        };
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
+	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	cap-sd-highspeed;
+	no-1-8-v;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc1_opp_table {
+	opp-100000000 {
+		opp-hz = /bits/ 64 <100000000>;
+		required-opps = <&rpmhpd_opp_low_svs>;
+	};
+
+	opp-202000000 {
+		opp-hz = /bits/ 64 <202000000>;
+		required-opps = <&rpmhpd_opp_svs_l1>;
+	};
+};
+
+&tlmm {
+        sd_cd: sd-cd-state {
+                pins = "gpio11";
+                function = "gpio";
+                bias-pull-up;
+        };
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..436727350dd3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -694,17 +694,6 @@ &remoteproc_gpdsp {
 	status = "okay";
 };
 
-&sdhc_1 {
-	vmmc-supply = <&vreg_l8a>;
-	vqmmc-supply = <&vreg_s2s>;
-
-	no-sd;
-	no-sdio;
-	non-removable;
-
-	status = "okay";
-};
-
 &serdes0 {
 	phy-supply = <&vreg_l4a>;
 
-- 
2.34.1

