Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594890;
	b=PeUh21YWS1mfbhDrWRnN75B8v7tuzMwFylYFyEqjxr+VsiWiypVHu07GfNjruYTTd+0q
	 czAg4VExIKyC3+lgcKktHOv44sPzNEaOgiLBA183eBgefDx83bzTYQXRtkkmNajULfWfR
	 lbtm3XQ5cAu9yAzAiH/waYalZ0u9sdcNSTLdcX4JN+wVPlCCMPdA2NxUjXsq5/uQd6TLS
	 DpAut0GbH/RfyE4zMsA0egTmtpbdxOgWUH5rNaRFvIdCxb5RPtG+CsXGWzl5bMrnryWWn
	 Dz+8MzROyKz7XSKqbaxX5e3zLOMfK0XA+fDx1cW4SBgSO/w0DyBThPYr9R5Xd/ZpjEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
	b=EqqGMmo0LR0PnUxOhFfX0M/vPrJfOVrMpt+w6ZdKqglCTIdUX+xyONlo90bcSPN69dGE
	 aOvzK+KN7iaAP9xW2/lJDkYi2HfSdUWz4QjIEpOyh9AVGXDIfM0ggiQ+Yup6giJVJpl8H
	 KMXm11TWpeDg96JSTROaRH4Iw/U+GqoXhUNAsRMVM0xCamrTHHqZ+osLQ2MuRPqMTiXyp
	 m+RyIKjPhws2b0jGvlfbo8IFBYbxlqckeozAWiM/1ppkBOBLAqcUPuXhIGdYoFUhikCNv
	 FsxwACdO//S/Y6y/upvKTQHWMJYjYwRQeryRpB0h1MTHb8fLKvE1SgGl23FelN/zyGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969C606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9969C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NTu57Urq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QNO0hmHs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68iBw1617350
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F9dBCzJvyPG
	LsTApMbu3cmu6bIp573jhUz5HJOob/M0=; b=NTu57UrqioZE9Ktf3PkaXVqn3QL
	E0YfKrvkb1p9x2uySICRHQ+daWNSqeBAvKcLFpKEkuVzb7pX/hAUyAZSDooCjhi+
	bLPhuBJrZE16Kq9GFNzy/HUGwFvrUnBaGpu0N6eFsaike+B7ojWjoOeSL5DYg/zI
	N5yBbgaq/3FUPunJqQWIV2TqvjCpu28avOapMXajRgJX6A0NDKB4odqvjQmP8OkK
	FNFbugWcQF3F1q39ybwGhHFgvOl7PrY+Irb9clnKEWNeRKRIOwxJPLUBmRsEZlre
	2O+JLi84QBlwNwBwIzSQayRoBNds0aywzZ654YoK1ZAqKIHtDG+TRtJ/YAw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effu9uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f074b87307so30949785ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594888; x=1796199688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=QNO0hmHsP2IixSGHKoP0t05o1LTib0/h7vkxgTzkO+CriJExBg3m78donT5Nf2MEg7
         zTbjCgB5C2c7P/8gPd+Sqf/CNYMfcTtlmTrRECBa7AVl+A49UmdO6eMSq2buIz1df1Rv
         pKYucRPrKeEx4OXazJSE7WwsjYkq9DReUg2qRAUvtqdRChCjfjqyMK1admfBqQAbZB5p
         5M76E5YwkW8WkVry8z6GIKDZigZlIUC7+FexNeZ7AI8a5hZlHmKf6o2n1gSHUE6EwjWe
         vWkyCsuBA6RZWYhoBryOh2TRA5kGvbba2A4fnQjZ2YF0r3KfjkF7tiCXoTp2/ptDvCWW
         X0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594888; x=1796199688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F9dBCzJvyPGLsTApMbu3cmu6bIp573jhUz5HJOob/M0=;
        b=QrsIdaIrNeq/s0i0K78ReSJnj6iGygQaAWzrZa1wos/lITExBdreBCUeCXsc06Sbs3
         xT04gcz/Q335WxnlMGRSxzLUAoJFwAuOazcsSY43CKikgp0lKzQ8VlKCBSxUNYVYHWc0
         +wHLh/yeYRjUeTqdOiC42uQDiG+Q2BhJY6cPj5ckgWH3JTyxPNAU4fChe3JCD7JhQ22e
         I42gVtLd0f3wiaIWawymUDhtnLMYe/SWlGk3IK9AbBtZNmNUr7baS4YgebgoVSn62d7B
         V+MSr4tgTTvRVdIWe9J+ZNtf0dBJC2mqkBMFzYCftoDFLRgIiVOGVjgHb/96yrOCsojo
         84KA==
X-Gm-Message-State: APuU4Z/Ot3MGfMnfAfef3Pr75TTkyfE2D6r36YPwyzkKlqXwqt+PC2Qp
	bawTz3sG2y1A5XVUvAZos5GNQpWveF3TM7maLuTQkkOs9ID2vWLuKHcaNArOuXARQRSEZlkWvHR
	IIW2a2EUdwgFTj05165WAAmRP639/S5/8jzluM9ixBC5sVadkjGBTFQZuy39C4t4xs6AS
X-Gm-Gg: AZFdTZfypIniVjArURyP5OGFWkuo+zsqBJbdowYuQ6BqqPXnriHFIfP2h/Cc9iI2h/m
	1D/3niBjVt2c17g3HyERKm+ZLAa/7HdMjvZA7BQEqmbR/eSeHgKjudBAUTB0aXzGp5V32L0nah0
	UfURTiTjO502VksLxN9Jc+86525dc1FHj7I26zPbgMynj5zEPfEHpZgcLE1m7oA12GXnOVKqqAD
	EQ3zmxlr7+8tV+r6DONt8dk0m6pi8VjpMlzNuYTOaOWYLiwI7lpCG9onAuNdJyoD32LFRpN4MgL
	dsbJ73HyK9e/oTMdrdEiJRfRACEBBK5rLZObgHnz5oh7PjTqeQDVGGSNVJPgGv3rzEwePjtLmmI
	SEJF2OQxSvL4vHGNlEMQJL64TLHaIiWOJFL6pvmVnbsNmbpWoTHDBIwwgPLjCbCOo4y+M/DBZbV
	hM50xSBD/C
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634705ad.42.1795594887604;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2f03f18c744mr164634405ad.42.1795594887117;
        Wed, 25 Nov 2026 00:21:27 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:26 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 3/3] arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
Date: Wed, 25 Nov 2026 13:50:55 +0530
Message-Id: <20261125082055.488583-4-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b069a88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MHOxcNdArT3Ept4j03UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX+tkbeiYRr6GL
 vqgrBlbe13OAkiVgTrtXvKCL7QAXuta2uFodrQMVRcPQYbBZ5RBL7BjkbLGFaxlIEQHMdPcXVd8
 G9QjeclGdfLEmcmen9a/PRcRoB4OHY+aMGz3GDdrZAwOuVEuMAZAO+p1MY8EvyQGbO/+1WfBziP
 x22OM6MClOoR8ESjMNOgiqq/Sw/pwWxwGlSfm8HFJUiPMs+iGiUeOMXZ4IPIma9nMTdFOo3KERv
 Typ5Qs/rx3CtQpiOxe2/4YYWThbv6ljkayvQ9fnCcP6E2ikKSizu0Wk6a3/1l0jkCpg6APQNt/o
 WHFpE3fAAer6zCeTonIgNO7i0F2myNHwUGWGvGnQMoOklfqb34CMVGMAz0AfkpF0/px5cYiGxwz
 m7l6CWRcaVwwpHSf/MZaspFBUOsshpredK5s3O028DZdep1kpAlkDMsNAGmu+PgDq2BzJqtaNu4
 LON6eYHKICDobnoyjFQ==
X-Proofpoint-GUID: nol-Ol6x2IhWHI-FEHiTADpJsGAK4083
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXwp+ba7nAn0WO
 /3bWzSt8OxXtHhSp56g4jD+XIdqOiJ5ATB5GvSajFVnkF2+38utsr1TPg2GDX8XWZxP082yAX81
 fL63ODjAP8SL3GoiSAZBN0cKMu9g6wc=
X-Proofpoint-ORIG-GUID: nol-Ol6x2IhWHI-FEHiTADpJsGAK4083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

Enable the SDHCI controller for eMMC functionality on the lemans EVK
using a device tree overlay. Configure the corresponding addresse space
and resources for eMMC.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb894ff002c6..25dae330d74e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
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
-- 
2.34.1

