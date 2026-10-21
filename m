Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592557;
	b=5qrN54svrlm5YAV+BEIYyWsX7AN7ey0e0fPkwdnkI2U/5zhkFxZSxjbZwOWlyvPADZ9X
	 SE6wVy1iN5rZjVfULiSpkpNQNMEhqm5NvwQE2ob6ZAgt/jO9Jd24HGYlNeFFO/wxd4NQ4
	 8D0E6pqA8wo3X2P5nhDTGF5pgivk5I9tP2lzWqHR3KU2+RrLYqkOtj68n95EbBP0LCCfa
	 +Qvcgj5qk6XXXGmcmq58QQhFrpn1+4pacrIpJ1pIJW5/uZAuI8JqvdrrLjKPxV6h7WNc4
	 DsTCwpVqknAsqCamD+FyhG4/mmJSylV82SCw8XDRwSP/kE+q1b6sWyqkVbBzGs5gi7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592557;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
	b=nDWgvltANwsvD2IXZ42rlzIzOxxePQqUu8ythhZZycjHZxA5HLkiiEPyAipzVs2ml+o5
	 QovqjaHom+yDMe/0DZeTkCMD+sTbMccyMj0Sce8fKTNWkkJpc8zSEeMiZgaDMJssQo7M3
	 sw1LHlvZjsVSPYj9d63G5tW5WnPgSr8vsYqwxehw6YBxdtLQI6px9I0vMIC4AiRhxNIhR
	 szTNmCVZNXxdL5K9kng8LWQsvbVjGBYIddpiTl62JBhLIh8MzZEfpC7YEZW2YKrhPTcxL
	 iMbCQ1YyViQJmhdQEqi7lQf6MHDdNzyKV7TIZmakQBKp6QA7xQAJwFRU/TrLJ3p4+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAT0eLZG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D0606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684D0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lSUC5IQ2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAT0eLZG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDf31313692
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=; b=lSUC5IQ2YWyvtHIT
	YVR47W/kO13pl5c7HMug+QaPEmjZPBsqjoO7eEl7mq+QBdURRHpGljlE6ShDKSGE
	HPqnjJ/4qSZwFO8f+JR9eSYG2bPPjSMfrUXLVEWlw8nWfgu1nzFZ2i5H3bsFXFzd
	AlA4MEKQg/dUuR3dQEOS/GfKtyG4hTFpMK5588sJtPgHa1Hb7D+h1SVgmcE+e58F
	RU7xQ9AEtSEcL/0ityWBSOR6v2m7nJhqFnd4zgZpw3U2U5efOjaXp7R7wSRUsLk2
	BphhloqLznPNTx0DvdsUv7H5Fk81J9r4oUBusNPEXnWMCxuk2R5NSmcWrgDYgE2+
	9fhXXw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03jxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e650cff93so100400eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592554; x=1793197354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=TAT0eLZGkQ2RwPGkJQ+1l9kZumshirhykHQ3CWhHZ9jSYYpAuRR8KzfLvHeInq/uqI
         AQWKclLNbQAd174f6HorjCBZIBznhD+iQXzk1kvgNwDuVw/R3tPmG26nZsV537oWvYgR
         TJl+WnBl+iuZlNXc6Qb3OlIZGOk9JxFCx4ZPAfgn6NQCEPICqHDlDJYWcrbc8QfYIbdz
         Zdw/K3qLbVv5PSEn1ON8KtDiblvBIi23iOd8SDmRXiO1jawY86kZTZ9o3C8rCnAu3V6B
         S9bZjlJBdrUpVeuuYlpYSXskhiZs4GKyTH+5lBXbI3tIGzUYbZJeZojh0hEnNV0AVGhg
         1QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592554; x=1793197354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tz3RdhSVH1Ni4eMu8/LNoemJF3J53nH7aepJzhWYinc=;
        b=LBzIZ6KRVYUldw0ILnJAd+HMzH+02cjfzZd218puoIuI+vpZipCAmsYz1pvYCE/jnq
         gAjyhLXZK4TlU/k0Odu7o4YR3t8h8wdNx3vyeYZ4oTEZkz7l76+FZKE/VljjHa1ttB2Q
         e1S0rW+mmC1EcDoH+QrXkgyzSCOg7MwhhFcFMVdPyfAWLwVAyg6WLkvEFZ56ao3L0p4W
         31SNrzf86EGEWejhACNezQ75LNlE3EsPT9rNcQiLLgN8QmV1+MWIm6wpqGESPUrtvX/v
         oJd/3C5zk3lMKmL4rokJEIo1sEirqlBdMJETFgeOSaRhlnC9izxtBLnuC0IRDCMxz8o7
         luJw==
X-Gm-Message-State: AFq9FYJvbD0vtcu9lKbcAiT8Mdx0UopfOhe/IPpvxvoFLWQWtSLSg7nV
	R2bOVS0rE9pKPNHmcuBGAq7NWkJQ8utPUrCkb7ZZSDFcEeIlww0PsOs29Q05SdBHdNHlq17zA1u
	pKRmSCcGU6Xtf3WEf6YiAO8ZRQTE1O2tjrKyiCOPIWhQGw+jSQaIS3MKy2PpH0iAmWraj
X-Gm-Gg: AYBFou3AxGJWKrq9cdrLK/mgtdPNbzPe0uEwq2UWql1f8qhWtPT4/mMfOqOM8JGQSUx
	jxdYhyWVNRY2iedfqklOuESY8ecHt/nhI7YS/t3t1CirrrOw2jCtArTejXwCLnjxdf/ClLsCLNs
	t7oF98Cc0xZvzrVpewBg9NYt64OInv2dj8C6Y23jJY4rMBP7PsVcSOG9AuIAlEOm/Uw2W++uoy1
	CYAJSpB9PuihszN93bZEN43xlLalCI8IefcA/DkpQRWhUst9h/658RaW70N8rY0w3AcYF1qJtoB
	DFImkKO51iTTsPaad9dPH7tJ4KI8He4hzDfKKMGIwfD6dSki4dfvAUvaKBcTqJpxZgyIUP/Jwv3
	ta0XbSz1fpsqh4fS9WIPslrVT96nY447/GlrQDt2mnBwz8D0IhhlbIAl+XOnQOgqimx5qN2X/jb
	ySfnKVXz4A+6Uq/tMa3YGUPb/f0pI0ToEf8LZxHQ1pRQhJvOOwQmA=
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185387eec.2.1792592554345;
        Wed, 21 Oct 2026 07:22:34 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id 5a478bee46e88-3674c43a7dfmr5185334eec.2.1792592553669;
        Wed, 21 Oct 2026 07:22:33 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:32 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:46 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: shikra-iqs-evk: Add AUO G133HAN01
 LVDS panel overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-3-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4686;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=3QYmG8M/g7dpE66TWx0XSm8iu75RDCnzid41xacPU4s=;
 b=H3V/NOZ0N8Lj6BAB5JnGYIlkC5Wu4KDFgF744Z5TfTNoS0XYZi1tgn35KnMw8WlLb/uzo8h+8
 t331C5SfVmTC6r6LFlKRWf11kUNa2U6heea1agf6eDC40U7nacEqGz3
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8caac cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZKKiMLYMdhZ7-3cI3QcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX55pfJUto7lDZ
 aR+0Zny77l4+sJr1gPdyYnUh64DgOg2WFNqZPxvEaMD/v9ABhxwDLPhCk4+BUqVxru46A/IaunJ
 imvwUCKd7bjpmAtg0nyF2gN9qoNED+xE3ZuiiyPIzLGuS/6glH/IvqRokZHnLG+wUXnSMAA0iF+
 Dmsh4XoYqPiNGx/nseJ2TtJQhTXAY0utFFPx64sXBaoHnwz5sylJDuFXVtDWMWffY/kwhWBTwGm
 t3zOPIz7wnpLqbRY/ttIVmReX23hlZPl4uaw1fBIjEXc27sCg3NjBj6BY/rKO2W5KvD2mbnMFjK
 xPkpr3r1Y2JCZIxalO0gLZoknsjufqf6fOSbJ2kXC71g7V9gP/QLbPsnvhIZWMKPYXDy0yNWfxJ
 8Gmsdbm3HyL8pKyQa5g/x8swLBcF0N0E5+jwc2X/yDwMMXsd2AhySey7WP63NkJVXRucQxqU2q5
 GXL25LVIONwWL3a5cmg==
X-Proofpoint-ORIG-GUID: 4gh62MdPqIi0ohwJeKwAxDa6AY41-fyp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX3hFS5+vPuoRt
 Z1umC0u29nlknA/W9y6nwQVuABSyalIOVDTh1wBcm+FWIQTpkxAOBQYXxVmXM1do3Nde9bA759N
 UllktKhQKqm860+eK4c/68eoBF3PQ5o=
X-Proofpoint-GUID: 4gh62MdPqIi0ohwJeKwAxDa6AY41-fyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>

Add a DT overlay for IQS, to enable LVDS interface when LVDS daughter card
is connected to PDISP1 DSI0 on carrier card.
There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C3 with reset and interrupt connected to tlmm GPIO76
and GPIO85.
Backlight is connected to gpio87 with pdm_pwm functionality. Currently this
is not supported in linux-next yet, so pull the gpio high.
Enable support for AUO G133HAN01 LVDS panel connected to this daughter card
and disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso    | 127 +++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0c5a7b7f694b..610fe640471b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -381,10 +381,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
 shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
+shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..80b9dcc92061
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,127 @@
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
+	backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
+		default-on;
+		pinctrl-0 = <&backlight_pwm>;
+		pinctrl-names = "default";
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_lvds_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
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
+	vreg_bridge_1p8: regulator-bridge-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
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
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 76 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_bridge_1p8>;
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				sn65dsi84_out_a: endpoint {
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					remote-endpoint = <&lvds_panel_out_b>;
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
+&tlmm {
+	backlight_pwm: backlight-pwm-state {
+		pins = "gpio87";
+		function = "gpio";
+		bias-pull-up;
+	};
+};

-- 
2.34.1

