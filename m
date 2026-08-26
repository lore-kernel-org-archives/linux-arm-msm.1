Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749873ACA60
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743522; cv=none; b=jkdjF1JT83YjfpUoZMiRklYzb9w1UoBHzW8ikQn3InuO8TNfsplLU4AKTFKxTCXgtX/QXSrgMiYF2vgaTNl+WR55mJ3hpeUapCOnnptBgVQwio8z5F1ejvqE/Pi5/SSNc2C3alMmBLN5TatgV9ZZc0I9OPmbi0LxnIoccttBtMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743522; c=relaxed/simple;
	bh=Pp3H1/rIFLOhPVqMh9wOTjrIWW/51yVYEW5d2cMUT/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UiAYeAFbRKOynOrlqOzzhCfHelbB+JUPRv4KCWctHmbBuEsMFpwS0AkNBx4Fh1MRpd6B2+G5ZHpoQSWlRkMijDfzG72Kp7kAMKXN6MSLsTy0XyBkFleXxh3TZoX2xI90tP/CMSmjWpSxv86vWQvRVAKqC8jlIAlWkHAR5TKnR4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuPZmMag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGW0btQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuPZmMag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGW0btQU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGejH121437
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WDKZF3IT0Tn
	Hy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=; b=MuPZmMagAyAx8QFklHvaj3147Oc
	JUlJqHYth4QdzSu1yQHd5jTHsuiZXLROfKE4S4yicSLPXYoD7uFhe1QF0MdFYKKS
	jmDgi6HKXk01ZCpFWpPonrSrAAPuiJPZRALd3H/t06XSuRtERtprX+xMOFaO0baR
	te4LudAh8A2zLKUHZT7ECdrbwxvj56wxl7ObDRZG8HdbLKkAbXX1InERp0j85Z5H
	0wJebZI3HH2zd/GKT9Zy7PfZPYV7PPR+yuP6ABMHAfe/MpfaL57KkgTtly1Wd95U
	J85B8XjkJ8GZ0SMRJ1XY4Z3+TyRMeo4oGNUfYIFSXshfjCp9GOUOh3+an0Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9h9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 11:25:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1368930a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787743519; x=1788348319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDKZF3IT0TnHy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=;
        b=IGW0btQUxRBEoRr9I7IhT2lTxNjWyLH9TISDeUk3RBmBsKhG2FjrmEaYraJQv8sLG/
         yyaZIcDp+hrMHtFPCWkYFa1lGTuR2bWuhSEg+FOi526jcLsAlh9OEvG3X8rotYHqpI9B
         C5B2/Y1X8RM+dkf39zp+ykAmoNnoKPGEWQy5jfvjN6f31Kn3I9C0lHolE/LcF3H1F1Hb
         CtJWoRawA30Kj7ajJ9gi4GUVYVGxzafT73CKnciTpGbLwx8IQAk19AuiW/d66Uv0DUj9
         Zgr2ur4lGzaOZhNijv0CnYU44ZnZTF9WGL8roUNZNmq0HONk0h180SQpruRgK8LJayao
         AoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743519; x=1788348319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDKZF3IT0TnHy8gaKMVg8R0q9LyoqxusD81BwNFUE3o=;
        b=mH/H1UPDGxEK1B2FK7gxd8Z80nW4vHSb8H9JXR/xZeDasgTrx/KXGOKon/knMvZyJr
         YKN5tPja1kEpSBbDM/o0Od+4mWRyJCwoOs5zWbqR3w+mm8G3iSp5fVdwbuMRtafRd7ND
         lb9+m+5JbQRTdLMNxtVaNHksU8g/ouwg5ZQ24/bT9gvw2j/tPxhcvVYzfY1i4NYLNtdz
         6O78lGF5pDLyvx48/P+h4zRCSYp75EwMYMYf5cmGzYZFIkIZLhA+4kGk0w+cW0qoc9sl
         WABcVIdVlzwNIOnU1iEiYT3+yeC0g0Fp85Fn2Bvq2KXtDuSGfgCPags0JsdACEMDme0U
         vw0Q==
X-Gm-Message-State: AFuF++m0D38of+elQjTt351Bs+5WmcQEFrSjDFK+AR94KRdNY9GV+QY7
	VUNGaaC+17zJKZf1HlymM9CR9Fpa25TY/6q0Q6AjSlDKZjYQXWVLzE30gw5SdqvtU4SD+AG1ddD
	OOO5HRyPqCUGaOw4lNNf0NK1yjEhMu3794YtMQTNyQiA8eThl32dz/hJBFLJM1gONVzZt
X-Gm-Gg: AR+sD12Vsqbro/PwAAIii6Wv3Y8ByknaCsltrNLA5bdf12IJY4u/HUKx/Fr/+j8QLPj
	1nYfDbzLFFg09QIZq3RNDL225KP1skw8W9MeUjIYw4yx2599jtZDczOkJMCvi9KKDnpvWW3NL7B
	yimc3yq6o5peBOTMz5C2XJ6am6ooma1ko/AnSTd8gdhP9XoyAgLyJ4DSK3xvZUh+F2sDb5U063M
	mw3UTifhvPijL/euXIdRLOlljtwxwoWU9XxQ+FU0cBWeVFo2SJimo1vgtdDlvuMgcfF4Cg0FuF+
	hovG+dJ/4QoJP2MgubMYrWUmHB5wc3AiYVDzgpQJtYQ/6cYifnHijda37Fp4r2yQdcMUbVLgN0t
	FiX7esuEOF1ScxTUArtSo85GIDBUiQrhME8Y=
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr13562650a91.12.1787743518807;
        Wed, 26 Aug 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3fc4:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-3966d443146mr13562511a91.12.1787743518263;
        Wed, 26 Aug 2026 04:25:18 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm7521016a91.9.2026.08.26.04.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:25:17 -0700 (PDT)
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
Subject: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
Date: Wed, 26 Aug 2026 16:54:55 +0530
Message-Id: <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ecd1f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JwlagmxLDNlzgN86bHYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: WuRrDmvUiCzaXZEHzfo0gAiUwnxpFK_h
X-Proofpoint-ORIG-GUID: WuRrDmvUiCzaXZEHzfo0gAiUwnxpFK_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX7ClMJg8ECJ+f
 Py6TXXsoRjBKpGHaW4FJ5tH/OimrVKlEjLxEDE6omGX3Kso4AFi4sGL1tAzpP7Ahf2GUu4iGSE8
 bOXkp7iGxiDLVEJwbuiS6k7f5lmSwdkjHMQ1yT4uin9i+kk8sCb+t+p812Fu4MToYFed9+2YNkw
 WycaywqgndJVepSquW+96wnZbxxKZzUXQG63qRFSZxbHFsj0o2dv1PeLR0qn2TyC1yrbZlJr1U5
 +QhU2reFiQ+yU6sJ2VJq80yoTwt9DYgNOEjE44N9bY+ek6KtVne+i2+/mY44soSWSmsGkB/OFQc
 OZ1vIUNDHNp7EHkhpmB0JJ1I3Mg8W06JgJo0iYtWIkLSxhw1/vltlnb8b4x6JJPY/S7vWh6XIm1
 fqvznJBiBhWj4h6+L4u9w2jfDrXT8Vxv/Wc1isRAF22i3weDURobD0e4RBAVLqu+CbLDOkbawjN
 Bx0TcgKTerXWdoTSUGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5NSBTYWx0ZWRfX6LW1RnifJ6K7
 s+FzA/S2INvM+plulXASKb8S0BVTLgCeuz3rF+DiTnVdgv5IjNotxjkhnjzJjaL5T8g/xoKg0WV
 d9+LMIfPjFNjLYTpspqoppZbSY49BHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260095

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
index 1c86e7e98f55..466d4b67f72b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
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

