Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611309;
	b=Q9Q2K6RAtQrGGfPs1dbYn8/ETLsoFCRzdecC23z8zCwPo3eKprxZcHLEzcvuvCq/27Zu
	 DBY/NtMdLLwz5IrcnFdwCKxOrxy6hAC/7Q2N/xAFP9J49Xiiy3K/If/qWEeYDlyobbgkA
	 WZQeK3kJr4VNeJ7xO0KuqkC38mv0yUMdVviud9y55yCybZqLBFEAXOTIrozGYAF7oPdTO
	 Bzl8NEquQ0/wWFeKH1VESegpdCKqY7cOUejpKfglokeva0TKJQhSeeEXA74+TpZ9iHvMc
	 NkoU3/k2SwyZiRDjC9rjqxnEjyyfY4wOJi/DTtuVG+qRa2fazArN+Pg5mjQbRbGGv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
	b=T3spJRyoSxJmH+9gTO52qnd1SQ/QK+Df72cJGcAgaEdMXlyEeL3tYT0AGyr5jDWZJfzz
	 wx5XWRv7fNgeuPQdUsaGUyE5TR0OLLxbsIYFBq8x2ZF84L9SY6niQ0KNHUjsR6Bq/fiC9
	 n9eOHfwK58nqYBy7mpDjDY2YYLLLUA+pPKmvtt4fwfdZaxUaUO6f9pKkFmY4hhzhF/LVt
	 8I1YmX01NUppx7fHXK/AfpsDq55jRKKz3PVyt+skTL6PuruBHB/H3gXMljEeRP69kUqz1
	 ChfjklcX5I+cHdU5nF/ZEnphVNVHFACLoZeytT78lwuQpxkASezO6zF1jBvJwUMZvFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvgIjAAI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADz2rh0D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FE8606A68F
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FE8606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvgIjAAI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADz2rh0D
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlw83611457
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=; b=cvgIjAAILbtsloFZ
	yrPlQ8iybmLMH7qFfd1sfPJkOjrxCS0CmvUTIvOQ92+goERSR0T7a9aM3zB1sxwW
	nZaIguRKoWVI95jjbHO8pSs1+lO6JdHB3qL0JlNk7+78CipCkhQ9bq8gtaLhnSAW
	j1sNQBP3FElTZDC9y4Rz6SlJlj5YYqyxPp5KRPvYZZ7zvTPoV4pFRI1UL54Nhpg3
	AWgbAbO889X+OvjRTGnasXbqlv/uoVx4jdLcsjbEyd6ayYOzA2I6Q9kFtHYEu1b6
	uxVW9LB/UJvjzZAvYqdJ5GGdnAo2z0mnb73S8J4dkjMJ7U1c/QRWxWQmkRwcO8cT
	mlCcpA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbq13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0a0afb55dso4222335ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611305; x=1796216105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=ADz2rh0DHQzzKueLgThWtsLpQc6UMJRAPo0ayUz5PfjfVBEN758yWLMOWmDBS/gadT
         ve+iZyVfAnp2W0+a+EHvg1ux1uo1CaSN5AbQdoCX3KubGpOAyK//pFCZObR5MkLhRy04
         Htc2d45zEpKNBs/94p/sX+x0QFdCoMB37oXT0Lmnm4pKE8niQNucF2oCRDzVjUKtQb4a
         3zdFyYBH+1JZUEY28dFLNfXGtxgnIQDg908ZguFluTh9+N6NjFl9+Fy10I5rF/5zHxXE
         VPeR9Bn1ePBMhf68m0dSfH9NLHAR1tR7GhQlDddazbsZj7YaGfOr8KTm8REgAll+yzo0
         NIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611305; x=1796216105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZFEZJh/kiz3Wuz0tlw5gxTMXmRS2CncrfuIY6KDmig=;
        b=rz6h64A27bJ+dBOE+kggz9HMdYVkZF8zsW9C8wnDT2JKMhyVrGHsZ+WHEJPsq4DNdH
         cx/D7Tdy2+ssDcLkrlLmgVu7ZKbO/oEvFI3yvwr1aQhexUzu8IBGxHnmhPeTGDC1oDMy
         0OVhFIvXS7ugDIgqV+oVDAEhSdGvxfrts38VYxjJ3ls5jrJ9ZvCTBTldX/ePpLr1Rb+5
         F+4Nj7GidlV0Tp3oU7dEDtoRjH5VMS0f1uOD4A8KmvmPE8eaLDB6ZRHrmR8Rf7m7V+lk
         GU4K8cc+9mA6eBbj/xsVvRNyhknZw8VNZEREszJOFufrjB9PBQ/QJ/+LAV8W/4a0j2sz
         6/pQ==
X-Gm-Message-State: APuU4Z9OR8JxmC+RZGIYTT/m62t6PMovyBLQlAzt3jSBJpqHcduPLk7x
	jCn7m1FJmRAFc0PGqC0rF2iyDOX28kCqV6Mx8QyOLIX7smk0Cy0MD5QPTvop9jsMvzrCmffHh6q
	un4wJ5bjJDSRbZnMmHwjV7WAgKKAwAqXnvuHegoC3qx1GfkpQSD27gOyK3qe1GVMHscTZ
X-Gm-Gg: AZFdTZfsHvdPDuOoFBntDAzfF0PUk4L6+g9MypI7yMoVa4zQ6Uk0MiIiPBWLp2O/cCG
	F7/DfM34GwdnlwvNbRNO6Qp+98LTAFFBEke44s7iWsbCepiQZM0sJzBHjQfT4eFdye3+ZOPN5hE
	hmIAuxa9HljQ1b1H+nZBmJq2Q+pjLGEmVSDQ1QWYEshD8g7YB6Sfxd/hPtq08KgUtQgTeKAuJlH
	xvuvq4Yu+kx3pRUqusMSlxBjR0+MKgDYvV+RBk9LFqPbPdHwdWKbboSvzdakDMpwa2OhA4joRMp
	RwfMmddcCSqTlONaUoiJ4m4C/Nx2QcS9ElRa08v4EH7RbDuVEK8tpszyMG4lzmcDQwfFsoxUCBs
	t5zguxppv/aP4F/dqZHbT0av3XEnEs1jIi1BdtOlHPOMyf1NmHQA/8EYGK/Ns1jq/KuN8SPYKtz
	DtG9UJNwVTDWW9e2b4GoFakcpnewz/gSGQZVGoGiZz3nITSwIfGA2ZagsBx00SSXnygI1FuhtUg
	PnUYwkm/lG+FX6NjY/fBu66mhtw
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208695ad.4.1795611305467;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr126208405ad.4.1795611305033;
        Wed, 25 Nov 2026 04:55:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:55:04 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:29 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: monaco-draco-evk: Add LVDS AUO
 G133HAN01 panel overlay
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-monaco_display_intf-v1-5-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=5520;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=6nbVHX+/Cq/YF01FFFGiP3B+WoYwWq3CUOhOIkIUo/E=;
 b=VBqXVsSUO37LRiyeV8Nc+EfLgdq+yzvhxbgppDKFeQQAUQ8vDtv5C+stmHjpOz0unnsMe1EUL
 6qVjA87F/JLCvq5DOiExvPtc/trAMp5rPrpF0FePyckWjWmtmGT157C
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 7Xxe_BmfrsTndtDFSbA8y9bbPuehw7w_
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06daaa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y427l31XdlkixRcQg0gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX1KZLQbS/b+s6
 CTMBCCLpfti520Qrjx5tPfvYSCsYDXfWTxLISbqH8v+kZJgkTOsu/nuAYlF6d2dzNLwfB1oWGVs
 MZQone921gJEtY/U/5dg6zOBfSKAtV0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX4qTsHitBjh/Q
 yBXvyna2M+pGIZ3a+/64R91UMZMSWrLx96drUuUHQrjz3LpP0EmjJGcye4i2jsoSyLqpNwXZ4Dx
 /WZIEx4wudpRt+HVOvbt/42uMoVhThgYxFg5vpAxSd0M8p0aIivhJbsog1/2rvTWdo30thEJauU
 GmRzzmdpij18i9Yf15MpKxk5flGn2MOol0U96mcbe1CFCiOSDebp5L/gVqEm+8FRRZQIcQJw/aZ
 VPh1EuFmjSlODQvxmm4NG/Yl9/cJpKvAwJ7iySTxohBZaxb71FsH3nuyZRZWIGSM6oqnN3oq5/o
 PAE0jsjUvyYvL8y3qS9qYWH/3u9Qy3s7Cd5o4aM6kq4Tg3SydTd7dd3fXUB6LFmNRelRINStZe8
 K37rVd4JGZbZyyjQ4RwGhgMz8BRQps2LnerB7SyU4QIGwmoYRM0PGdH6CJ9l/ezAG2fm4UD+pLs
 CEmAp4mZv8UUceoWSMg==
X-Proofpoint-ORIG-GUID: 7Xxe_BmfrsTndtDFSbA8y9bbPuehw7w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the AUO G133HAN01 dual-channel LVDS panel on
the Monaco Draco EVK. DSI0 is routed to the panel through the TI
SN65DSI84 DSI-to-LVDS bridge on channel 1 of the I2C mux, with enable
on GPIO3 and interrupt on GPIO76. The panel backlight is driven by the
PCA9685 PWM controller on i2c13.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the LVDS
panel.

Also add an alias for i2c13 to keep the I2C bus numbering stable.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/monaco-draco-evk-lvds-auo,g133han01.dtso  | 147 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts      |   1 +
 3 files changed, 151 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 99c733c480ce..83dd2bb6e04e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -102,6 +102,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
+monaco-draco-evk-lvds-auo,g133han01-dtbs := monaco-draco-evk.dtb monaco-draco-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-lvds-auo,g133han01.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..17f1ef00829a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pca9685 2 1000000>;
+		power-supply = <&vreg_disp0_bl_en>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+		backlight = <&backlight_lvds>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A - odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B - even pixels */
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				lvds_panel_out_b: endpoint {
+					remote-endpoint = <&sn65dsi84_out_b>;
+				};
+			};
+		};
+	};
+
+	vreg_disp0_bl_en: regulator-disp0-bl-en {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp0_bl_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_lvds_3p3: regulator-lvds-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c13 {
+	clock-frequency = <100000>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	pca9685: pwm@42 {
+		compatible = "nxp,pca9685-pwm";
+		reg = <0x42>;
+		#pwm-cells = <2>;
+	};
+};
+
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@1 {
+		reg = <1>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sn65dsi84: bridge@2c {
+			compatible = "ti,sn65dsi84";
+			reg = <0x2c>;
+
+			enable-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+			interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+			vcc-supply = <&vreg_bridge_3p3>;
+			pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+			pinctrl-names = "default";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					sn65dsi84_in: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&mdss_dsi0_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					sn65dsi84_out_a: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_a>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					sn65dsi84_out_b: endpoint {
+						data-lanes = <1 2 3 4>;
+						remote-endpoint = <&lvds_panel_out_b>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index 3e1b18de8920..a576159933b1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -20,6 +20,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		i2c8 = &i2c8;
+		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};

-- 
2.34.1

