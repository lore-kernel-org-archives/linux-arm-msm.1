Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769407;
	b=OzJEW3moai+vO+vxW/fGPrU+KdZ5A7tSiJ6qqK5/4HeI6r6QEBvWcmQGzPCP69bwSR+z
	 CnvLZHMvRX9zhC9NorcR/e0/T8rbQ9AGqyl5a888jWkagDrfvplIUUIaQQbn/avE19+Vt
	 tqTIPufHrdoYL5KhBE6LiX45oT7PwZ6n1EskfzFq6EucmG5ghL4lxwWPPSvgExPUvSkkK
	 qEO0s5Go8SwAHGzBZFOVrYfmNF7wf164aLqDWLDNx6jEL0VuPz9J7KUmEhHeNfMPn+bnc
	 4UP5BA9v0by31hE9N/lx4dvWdatN6Cq2UaTOHpukYZpKusiJqUzmSjPQfqPSRdmKJ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
	b=Y+81pmrcIgvvalG7nEZbjGrQs95IIXnj+AcQrRezmF03Hb1KG/v2eFrUbTImiGl5DwPd
	 uH/9+26m+0q7MIA84YjN5R6V8d76Ub3lt2W8seh3HFMLSE4/j8Oat+lJyKYCcFsdDKtjl
	 Fxy4TCWf8sAfl9auI151PGMvV4PAoq4HHTW8j8EVziGIkKtQIpZyZLyg214vP+alMJG0d
	 WlzgE90XCnilkkFxlVYwGgTN4MpJ0uq1JD/9K02cn9w0WCjY7j3M7AHQ5zzsqKUFBGxsO
	 DXWjJF8kUwGbkDg4plhAwU3/OnEskFb7xnYeQSbIuYs3lLK1iu4mzNdGDgaeQY3iXIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68360606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68360606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gdn03983889
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=; b=PV3Y+o1n5z2Gf2Wt
	AiYgFCVzspVXaVobnxxnOC19ws5FF4dRYulmU14K2gImSh4LcalWw4NhAUDPUYz+
	L+Gq9fqTN71Yb0uxXun4OLQ3YzSZCnvRyU75J4wexECRMMKYwzOZyeeGUNrXeUGG
	fFpRWjDWb48OYm+qFaGAgZgOWkKJU1hX9ILbGxiOOFUtpJTJsJiUj8nWlStmgooW
	qVH+QKCNpSjQ1V1tvT6q86HfbK7yh6N+OOJteGt0USAjPVEK3kle4Qf6xRHCv2py
	u/0oE2FFuYlLy9EjcOGB1AxV5qm3KRkBcXY0U/yfYp68oTK1hPOB8l2jAIhs783T
	y4jdhg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:50:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd84379223so242640a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769406; x=1796374206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=eSh07ua6xRWJmBFlPzyDILu5KXorkgDZWved3HtwxpDM7fur+jBPxx/ng0irm7NNeJ
         JkxYrOeN0FIdCa23XMVi14ejcillw/zeK+T/U8lCxJBghLOFrCSp8AUns9e+1+BKk+H+
         I5XKv9xUbtC4O+0qw8l398GMAuclIrOs6lt8riniTgEHRIx6BT3sySmbjl/P0Gz4bv98
         hc4WGOyrBcnWKU+IVYY3Rpe1YPaz0uO/eBeRMbQoUB/uCTrh5xO6dv9fL2fyUxDRfMDM
         3PHbZQGq7S5G2KCYsRSvtu/zJHYvi2o5svfUPTDlRzkdNoVjakmtLf+O5oCCFrhltHvj
         DkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769406; x=1796374206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=B8/bStRJHroozsD/N9GNnneEVAE6GkbjUomUnbeDzo1bNyI390240hJgXNabr56JC+
         EcGrqNX6mBO2iAe4aUZ0jRXbfoxl4rro9gLKgXjezLIkoIttbUUKOHEm3iSPHoiNBFj7
         MU5ZnFUWwxu0fimPawhOrP4tcZGoDySgeTGHCVDJXPweQ9caxji4wJe3/J6FiAigawHp
         XGWNFx1g+OBOa5rQttAm+SY2vc/gp7rAinJeKDj0mUiHAnLUkZ/aeRaRHm12E4hX6dA+
         VeWVNzr3tw4DTPl3PRAnC8L1fsBiUdjLH6IouEBsm9TLoooacAazFZw/ZpIrjBT/OrpS
         81Ug==
X-Gm-Message-State: APuU4Z/ygAYAL6eOHWWmBxeKbb4AvMIx68YGgwjx7rQovivIjceuB4wm
	EcbfL74FCE1mX9apDhNXFY0DDTlzMxo6OxumwKsOe0Emn0uOSUXWaSaBjnnnPwaBGkp5guNKBEh
	nidPk8/xpdy3tuavNFUJGWZAfZTzWmUsYkh96exJhbKIqgZJAwpnO/FU6cDbpapK4WHJq
X-Gm-Gg: AZFdTZfpuiOP1LPXgbN7Gg96BVThrlZfjVBq/WHtLGnvm9y/L68gx9VknSxC/R/wwFW
	U6kvPPuVjpSU2DHW5KM2uVhk0Z36sVQ+v64/tmMhpHnKctBFqXgLNx3EfJ7Glioy3ruLOwO0GWN
	rd0hvS5Pliqw3jvXOFDI7g4aQPKL3ZS8AITm8MR5Ob3I5feCN/jkRknMfJoDGIhIPCtmYCQX9/y
	uUpc3x1NmoUB49DkMDpXsHZPOR8SfBu4n/C0aKOEYzwlBDInqIpLMbsUR30RB/eFFGP2zvb30O0
	rw48GqiUXoRz3W/L2h9mywiZDMvL4ofmmRInlgdd7VlJ3RfBS4y8Ga4/j7z3oojAtJCU8CPBKzQ
	B5pW9WDDdawTmt4oHqfNTk9Qa2p+gnroExaoOVo8p7oPN5rSW0fC55U6fBTthqb+EnCpPqkvilU
	oTPj2zOvozIMq8xtKU93ajfvwnrX5+VFBSfV8E8ZREsnzUcwOs3Ld+vCVrUnQruUqoEAKAIk0Uv
	Ndy9wcOK64XyahykruJRcU4revsAQ==
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398245345ad.0.1795769405971;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398244895ad.0.1795769405440;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:27 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS
 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-5-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=5655;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=eIY48vZ7AT+BiCP/Hi//wkMEMZbw2o96jA/Lj+/JdQs=;
 b=3Wx5o30bdmAjMhLK581iqYyYklmpBDQPPsWobX4h/zj9x0twIQ0DBQVdmRIXJ9nSZUQKbIA5m
 g6neDUhEPFlBgOD1GaNZnDRaNDZ2j29kSLRcZGNm5zkaO19aQXh5BHZ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: SVuXhmYMXYr2J6DSvfmFFQjnoa9bnzsp
X-Proofpoint-ORIG-GUID: SVuXhmYMXYr2J6DSvfmFFQjnoa9bnzsp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/C1hM2tBLd5P
 g5ejsNRgQo6E500XWOrXI6VEeyZ+1JsZBQ4EFlO1Lub+2MQuga/ZAICHxj+HOAyp7s3QDVOWReC
 Enoq5AJJBDqW2R+/iUrpAAy+kikzdlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX3Ek5t+cGBLpa
 ntGNbyHK1J9oPL6EbumvvuLcuJe9nQaC9XzsRYeOAJ1cKOHft8eP55DDVyHkEYqqoUKQqFKX9BN
 1igqGHedDiMAnl5Z2unEKQ/rMpwQBrKgwPxxb5gd/BxEUGFbDwsdVmVhFc9YW9P3wzkZyb8/oqu
 TgSwM3acfTZAMJgOWMqzG73vtTn+CbcONWf7lTa6+Ca8nItmSSqd+8J67pAxrCdJq390WEkjxiz
 U3gFrBccN0TWg8b+hI9sfOuKn/HNE7RDjLfMPMfzDmSSZbq/4lXHD4vCcuS4b9xR/n4uI1gD0xT
 jGZPLtNxwlKTz1ry/uRcxaMRia6Oq4zMEu7+j+fScf4M3yAyuvl8w1DotSr0Xz+1nsVQ0KEVCD8
 YwFpErpNpegjiSJG6GXTG230MD3ro3DYsvjAwspfaVAE7IS0SzTb6gzEqd2YfRClN9OMerYkTZm
 FL+1fRjAxd6US311Kmg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09443e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X38TW9RF5Lljsf8P90YA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the AUO G133HAN01
LVDS panel on the DSI0 B2B connector.

The LVDS daughter card uses an SN65DSI84 DSI-to-LVDS bridge on I2C4 and
shares the display bias, reset and interrupt lines with the base HDMI
path, so the overlay disables HDMI and connects DSI0 to the bridge.

Add the PM7550 PWM node used for the LVDS backlight PWM output.

The LVDS DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |   1 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 64c61aa9cd8c..d8cac5322a19 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,9 +15,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
+eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
new file mode 100644
index 000000000000..3da0dc3c0de8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
@@ -0,0 +1,126 @@
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
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&pm7550_pwm 3 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <153>;
+		enable-gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lvds_bl_pwm>;
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "auo,g133han01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vreg_disp_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_lvds_in_odd: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_a>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_lvds_in_even: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_b>;
+				};
+			};
+		};
+	};
+
+	vreg_lvds_1p8: regulator-lvds-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_disp_3p3>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_lvds_1p8>;
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				sn65dsi84_lvds_a: endpoint {
+					remote-endpoint = <&panel_lvds_in_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				sn65dsi84_lvds_b: endpoint {
+					remote-endpoint = <&panel_lvds_in_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&pm7550_gpios {
+	lvds_bl_pwm: lvds-bl-pwm-state {
+		pins = "gpio9";
+		function = "func1";
+		bias-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pm7550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 734bea47855c..e3f3e3aeb089 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c4 = &i2c4;
 		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..3a7dc47ced5a 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -57,5 +57,12 @@ pm7550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm7550_pwm: pwm {
+			compatible = "qcom,pm7550-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.34.1

