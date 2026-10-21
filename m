Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592572;
	b=2TCdswRZoFIUu3f97edgBqrO1osQQL0oUj4qv5Uav0NX1EAlFrU29+ft33u/Pg8toNyF
	 J0CFU7F7lL/8xpGH/lrXfgiRB8UJGe6bphcDvNEo8KNuwFO8Bbwgx9IYcsNZDhyksn6LJ
	 +ENtl24TokhtLktzVMWvFvAk7ykLFHuNUCbJGQCpGp/sdZo8FWKlD9o8ndxsZv+Qa/prS
	 DvCfHmRtnlPumqBw5J6YYYDXn/t0rK1LELwDksg9aj9mcPd4FJ4S8NaBXskCh3oeHwEHM
	 d2jEa8VvAyJMgQUEr4U9KBtUl487Yy/ayeP3Kl+kc+Pj/5e5Xj8OOeri/fDXYPLwpbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592572;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
	b=R9HLLNCfByMXwEzC3xFrNqn405ctFbXNfGxo2WnODk7C+WW9CDKRqn3YHdQE+jUOx8Tv
	 d1oGfyIrFRKcImL9lizrjESJbrd43sxZ77d/S8Q0XEQuQoPlGrmFTOBfPP0Eetyat3iQv
	 2PR3bGwA75E1zc/ZaOgHgBLCW58H3fBJgWxiSgCrxXSOZ1dvy/UOYf84UASmo1Q4eZ0zN
	 2GBltzgdX8o5X6L3/YbcDpvtZ8rRLyJ7ZUvzzCqFn0JydFWGFH64WEG8L5rIyW61DbwfQ
	 ljk4URJ/sw5YZA32LJPlpgrfhEUHfmrQ1STCxtTfbmKx+Z5SHQTQdhrUWBUTCd92UVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WAwM/NVl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626C606A33D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8626C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UcxVNumr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAwM/NVl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFL4j1315347
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=; b=UcxVNumrX63VcLiC
	v4I6Gdy54rqPExcF/+P2rr40vXKgHoHwH+xmr1n/2jHcXwfTSCi+Um7TxqgEo0Yl
	qtV3RP00iXn8xvph2GkaeDh3jvmbwfbl4p0ntJZZumQi5modkAwWAFEFF0sNjoT6
	zxyUvVCisUMCRAlW4ReFtKPI6Ked/vwDIFS2oesQFO0VCBHJgZ9ctjsKHceKixkJ
	k7bwAWgV9bmyoMmJrI39Rn1SNY+jOYUckRiH47vn5ns2g7UWWJTEwxB3lWB4tPhd
	HZq88JpxhBhJmnfeELD1NmfYbkjU+E9Zfrs03VWvT0684WB5Ozy+MDyxjlKhHkNJ
	Yziudg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs03jyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35179e7f081so71102eec.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592568; x=1793197368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=WAwM/NVlGmKTi6WNdMLAl+GV3IqeoGl7JtFD41RP2T4fBSuWk89kmnM3fIic0TUNam
         Qfv/iFp9/kPBXn+EON9altFzZDMxwFMrSxDVR4HbiENTRrLbLejG/G8UcyNkjocuL73D
         yN+OIS7xR2odcZyHNUZdUUACgxagRCOaB90xiQzXqOK7Y4IYvFicxddy/blvwaZW+v6s
         kl7TR9KAmNHYupdzxRdB1060y07TAnWoQrIZRa6VK+S0IMvVPKWifN6UeP6MGPLrPUso
         4FYS+Adu56MrmgFBvbbS5cilJD61dRgj49hDe8H0FGlIMDshP3SWYIybnIeCffn/fNyo
         nLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592568; x=1793197368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyMSVKtr9EdhNtGJmdy/pJkUsP+zzVnpGR0dFTR6NX0=;
        b=Qzucp5zRzO70rym+RunICe0xohMwGw1dJu2JP8Vtai1JczayrZX5TaMyFWIXQBXXdC
         Zcd//6JTtGeAov2sUh7+DLt5/srVD1+x7DlZu3Y8RC6uIT0ipqMw+4MH7S8hIo0ZM8WU
         5X7HJ3pD3lF5vptTebYiNgDHiY8XLPbiRkEUDG4Nkh6g2AHF18g5eBYx2VNTyG50D1ds
         owwtEi4uorPcTkOxxxJtAht+qgvzxATzTRY/blAzOA4HMGiZysnvRTVRILxrOnV/gYQx
         dsloplypjW4h8Q2LQT76/4CouGceyQb9OvmGkEP7mfzf6SlEk8lTMM3+KhQNd+b+CEvT
         X/sw==
X-Gm-Message-State: AFq9FYIztcj21brDfNm7tbEfZPkfLlNQ7o+Wle0jRzNyBxlb2KkxZPdz
	0gpdqhBZLQYfe1H1IDCcNSsn3CYx0sA+lDfK+ASAjR5fGYAd1Qzzh/i578uP+ODb4MuOxKY3SKd
	mg8dQJLrvfx7Xo0jS3gk7UF0s9mwnUYsym89L9sjSj0NnzVIlqnjpvpBtVc7ikNjZ6F+oX8cVYl
	XG
X-Gm-Gg: AYBFou3TD/MtrqA0gkjg7R63GQDbS3VCCZM6piA3IiDMkvCYAs74w62ChUOYoKqdjjs
	C5rBcPTUXlfW5QrQZJhyV4PIRpwMh2TUJYkUDTaBgVOuKm0n/EH0+QKy+/HBvAZQuhgst2Quqgx
	oJYPqvQlqGYe0MyoFgJS2VjHCE+DUtXokpL+oujJq5YAuc0E0CyMUDt8pF38slUWH6yjLZjWXF/
	Y6BepeUXXkb5B+WAHSToN0yZ/mY8bOq7t1zCpKzhW27CgvEJtVISil8LlpebQ+8xyIaRCCMMDeu
	hpUpKa0xLEeCCmw2E2IO9cDiJDC/82I7Ok/acxgzaB0Ycz+6L+7WSkMg3mxYDBhDoGvGVgpsqlA
	WaP4C6WhPMEWfoiE5A75SCkSl00qojXEeiq02rKNHvZI20KiWFboh38O9171ip+cnJkIaIBBZug
	64FuM0YMHak6VTL3CrBBGUj1MO7pBGPP8TADOcq8/b+4fm+/Sc/Go=
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804215c88.0.1792592567598;
        Wed, 21 Oct 2026 07:22:47 -0700 (PDT)
X-Received: by 2002:a05:7022:f519:b0:14b:edb2:c3bc with SMTP id a92af1059eb24-1909acc857bmr3804095c88.0.1792592566027;
        Wed, 21 Oct 2026 07:22:46 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:45 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:48 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: shikra-iqs-evk: Add RPi 7-inch DSI
 panel overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-5-adaea735999f@oss.qualcomm.com>
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
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=4163;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TpPaO2PqcD2nRBXi9HeZ1MgR6queUrnw4CleGf0Oa4U=;
 b=JCHF6IH0fOz/TzfRiTH479RpPk3hAQvJpaGk73C28IV6VwzvYMD4F0iGzghoRuJXrKX5SzHw1
 jCCG6ER6/eGA+iCgoLOSeE2JMpWHXtx/gDR8leyCFeMSnru8v8KLzbJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8caba cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5MclNqnbmWmJdBvsS10A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX96TYId7qUPFw
 3zmdq6fLzN8L/1tGzgof61CYmjDHzaZNOUh/JR5tBHT9MatTFFFLQntQYZ6oEAu5XD8nCLFKmWs
 VDkVUwUs5KoYUu1wM5gt7ll2tnZECxrGpgbkyqVb3mbncmz/PaoZZACOjLMEkiHRvFZwiuLTPNZ
 bZI6W9V8ebs0J8HDoF5gQGFqiPf2GloD+G5/Vj2WU0FG/eYP7K0ci68C8oXc6jIq9QEUs6S6SrL
 X2eqatJs2sml1crruUT8worHiYX7p24fIVvJPH+aOYj/SerAHxm3buan9C6koQzqNjCr26kAu3J
 xmMAmDTd6BJEyqBv8BJHVLkD2MegYSaQyW1keqK9o++pl0eOr4AMKQyACUmMumx5AtHpvotCU+r
 cNgL8eBPe1hmTy33lanAWZx4wVYHWmlt9fp4IUlGzSTJE408etK8ZGplZNSN8MrmK4WOh/VjTY8
 kOJvaXJdUR6n90Yl/SA==
X-Proofpoint-ORIG-GUID: 1_9LCciUShyk7qAIQvN0wI5u6-Y75INX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX1V1Iff6WRtn3
 n4e4eS/XFn7VW6WdfHbtk5NMN23gEvFVHy4rTzXV1xGy2WQFQikBX/CyPLfHUzw8LJIsl5ZZyYz
 F5erh5OZ/l0GpeSUYT/AIauP1SNI2zE=
X-Proofpoint-GUID: 1_9LCciUShyk7qAIQvN0wI5u6-Y75INX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected to DSI
22pin on the carrier card.
DSI0 from SOC is routed through MUX which can be selected by DIP switch
S1016.5 ON for enabling this 22-pin JDISP1 DSI0 connector.

Add the regulator and backlight controller at I2C4 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and a
2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso | 91 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 610fe640471b..6d64e7ce197e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -382,11 +382,13 @@ shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
 shikra-iqs-evk-dlc-panel-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-dlc-panel.dtbo
 shikra-iqs-evk-lvds-auo,g133han01-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-lvds-auo,g133han01.dtbo
+shikra-iqs-evk-raspberrypi-dsi-7inch-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-raspberrypi-dsi-7inch.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-dlc-panel.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-raspberrypi-dsi-7inch.dtb
 
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..383dc5aadcfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,91 @@
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
+&{/} {
+	model = "Qualcomm Technologies, Inc. Shikra IQS EVK Raspberry Pi 7inch DSI Panel";
+
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display>;
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&pm8150_s4>;
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel_in>;
+};

-- 
2.34.1

