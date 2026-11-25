Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611297;
	b=r/5j//JPAOd1mXDstgPsh/v228WTQE53vd04iPuP06e3GavRpobGfWTCeWWn0x9WQMdi
	 iPbJXVq7DGj/xImDmNC3CW5T37bBNPPBT+bYTTRGakZr07ot9Q7+3rrfgXYveX4fyEEGP
	 lVhOgNwWvuEsgtaG5j1JUFcB77YRUL1M4KrgmqtLTtZS/znpM8BW6OygOZWUS3luBf1S1
	 xIqzLJXw5jBANCBc/9ZYtoPn3sRl+WlsDJ2q3JFXkbHbekJEDGsUNj2hVMpY75WAJiKAd
	 6CkbeyXRfZ7wnWDYedVEX0ABJDnQhZjGY8bbaXda7Llb8TlvhK8gPzSd56sGCy6DHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
	b=zLgxUzjEzB3zC41FaQdsSvCEABSLL4+mdNf0tsfd+g6T9iX52oNcMeK4d+PvNSZW/l9J
	 JC4pAkQ/70ZSkQh2swjuTcQU+MBM3y4ArEM761rlbft1NNwqeHpvCYM2B3AqQX1o4WpX+
	 9AjYWmuEFOLxJy7wL56wz8VfAZdC5/pcIlWMGvLVkE9SSY32RL14QVYHA0U+oydxKST6c
	 LDlFWPO2LlE5/FT9e2TQDUzlx/BDSHSsbP5By/if//yu6rlCiUoq6XxYeFgPjn+ebZcAw
	 ajuikNHILoyfRyGr7D94dd936hPE6iWOa+NXwKqmqXH1Z3/XaYj/xgaDkpO12I3H0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A80606A69C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77A80606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jHEwGN+i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ijf6gUMK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9moK03611848
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=; b=jHEwGN+imaVLuIM7
	RTyc7knKXnMGosalgXSIcs6sABQ6f+v8JqLqjxsWe2VaPujdmV6F2IQuTPfDvQma
	zhALd1ZCDuRCUJ4bTxbDBini0EDYPTSt47UuLYAzMubFBpd/89Jayy7X7E0Og+xz
	DQnqIRplI2jhfReki0E9fSn9UkBFze20gv2phZLfwFgX33bedtbHkrtn1M//GBI4
	FnB9sAnb0oTWo75mZry6+qgB743qbDMrZNUqVrzDsnkCr7o/WJ7fOC3O6eNrEb3R
	EfO8ZfxgLES89sIw1UGMgJdR8b94BGYtx6CxbaufhJGHb4oInTQY1oFTttnkhw6e
	OzVlrQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbq00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:54:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f01caa8ab9so6289385ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611295; x=1796216095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=ijf6gUMKWDUZxQt79XUV2U2Nshn18jJvu09lm1hnBUFBAzT/c0O0FBYQ+h81TlUq8A
         3jCx9IMjykmg/ju7P9+isDPc/FAFz6DGj9T9WcOguhNd2jMEiYuEgMJmAvDA22Lfe8eE
         azt8UJkBsq8X7isDcssh9/EzAD0+bzOy7dV1Q9MOqk6+L2z4GUmRkc5qChHMrsLWfieo
         caolKpufIIK1LHKslywjBOH8jOHop66lwB2+Rn5hSwTuVZJ1jpjqPioiCP+AeNLyB/P0
         Be6Zlnx3IgbbCLZwCKg+jZJ7KxBJJqxHeFv0HrnhV57n1QJLcYHA352gdTb6VI3+T7Ng
         Vxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611295; x=1796216095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIT3LY/NnA77L/6DRiyEURyM+xFwCg00LGKNqW3Vx/k=;
        b=mBekNqsNB7uAEugia1MS4ji6+F7g0mo5FsAFsRJsvz3TLkPoAIjGYsq0zm19saoXfT
         7pObWsh4fDsFKyz8zL8wH7HGnzyqJ7sYXxdk3VbG78BV6ezCAURnigu0oqvrLY/r41zF
         /x+3xXgCWw32FqgAn3a6DULSwRD4kB2xDBsoO1ok9so1JCSZqkMPwndeOQr+g1PWmad2
         irH2jqyjJiHnHsWnGmBwSCb4wppYpgMmPcXrPoy1NJnaENIsAP+H6IvUm2udHVrXRY5w
         pSeU4lLlI9uFsnNy0GsHLk4JkHKOBP0RxWMYecMpiI754Jg/7Xv+nLIZtlWTSThE+bSX
         0TPA==
X-Gm-Message-State: APuU4Z9jXWvlcoOaL8s4kj2oDtvaeYRcyHNif4AnSmPnBQKWOjCnan8o
	BcUOOgkcrOt2kVuFkcz41y3Svaxs3LofhJuPqUFZE6lJCuzPy0Lb5vC0o26eQJ9doqnZi6YWqE/
	gqRmQ7eLnzDhMondMLlUFkmF7AQ3JLJopGAH34ZmFd6eUpuLqXi+6c3lWJ6Cak7ffjumv
X-Gm-Gg: AZFdTZdYZtibrZtVNRw9UtFXwmpxHmVXFjAgH10U0KXSp6gZsX29T3LH1NeJ9i33iZ/
	FZcuKM8SUsRWP+YmgSIQtqrk0ArvqODdMCNblXm+Dy4JwbJV/jLhqu3R/7amuxAdRdK97zD73kV
	hauL1ZWCcH/LNEyvoBJAwGhVKik5kU6D/x0h1FZQLYxXDU5Rc5vK0Z9yaXrynIHCW9EGXNYAPFu
	vNe21+ZBM6vcyHD2pSfG8kVObz7gMk1fi1/NeWROHEbFqsJ0iTEt3WqdtQU2NnuVrk7WA1YjVnM
	AHNctaTiV0FCt3NxsBBDDdDjVLpuurEAIqHcsev9guPgGWXBuYxJb6iSdSFCEslZQKYhzazH9JN
	Dd7IGGDhKQ7PkKVbO9FFbq8aQx/YKe3LgfgB26z1aHpQmGWw8wzZlbHiYuFxbBuhC4Pir8Gff80
	IdOVz/iY6AeaAKEUplcuSjiODOASLTkyYXXAQ95Orep70mI1svX8ZrSPgTQSR2S7EjFGZGcMABa
	thUpWBelAjeDHwGjN6frq+FqpwM
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295131015ad.3.1795611294966;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2dd:b95a:e1db with SMTP id d9443c01a7336-2f03f1c9cd7mr295130595ad.3.1795611294448;
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:54 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:27 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: monaco-draco-evk: Add Raspberry Pi
 7" DSI panel overlay
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
Message-Id: <20261125-monaco_display_intf-v1-3-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4084;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=NS+G7kuPoI5kpwYy8h9e04dPJOgLcttGfinqWG0uVlQ=;
 b=hvKx2XYbFNQClyDVj0S1dgMpa5wdjrHTv43YL+DMilg+Rt+JGeMS/0BCPkfwMNv6MSEG3N4EW
 hxRJ+hKYqCrBnGjnr3keTyCJQvU3rvFo78zsEIYIalOB5SeyUIJ/I1P
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 5iQJsqJnGAta9sk53KIbZejS4ayUnace
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06da9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX/ywtatSeTjoG
 pF4ObxkOSeVPByRC+gGVkaGkckYThFpRgkcmD4jm2P9SNT/lrESLq6vxbLU0ATLfFWML5cs4IfV
 YAUY8GeAcZ3vAPbY6zAgGpaXYKAnV+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX5Y7F6HoJePgG
 xWGUUnbvfCw0h/7s1F9JPDY8mBeXTQ9ym9uPuK/5dtswGPg6Ls+9vt7EMPyx+vX3VSq/ra49HND
 d/uz9MkW+qv7p6kPZZAIei4TBqhWHQd8p+e0GCPwAZE8rVDiq1rZoao+idQTtqm3m9joNCNIkbM
 rWZsG94Pp1fqpqFqIxTS5r0AlTbqUhRkOq7xUCxerkYwpgPPHptMgDJEMLcD+CgY+4zMTsLmuDh
 Qm+4PRGZVHKrryulVIjtoim2jU/SHUxF5vPa8S9Y+kWkRIKlpaZVvF5O/e4zZBA5zIVIhuCZ5hv
 0V4QCJRK9NUOi/RKRv8oGIA0LQQbZJ2gGv74vvINR9D5Z6Z8o4eIWfyom+k8HB1p6mQlkN2XTbM
 TqcRE+YaRgpV8PohGjcTNY/lMMgqAskXU09w7wEX343zKp42dK5+JNl3+08ySEAfnNsJOUiN5UD
 H5XPx4oFl4EfDQBqBcg==
X-Proofpoint-ORIG-GUID: 5iQJsqJnGAta9sk53KIbZejS4ayUnace
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the Raspberry Pi 7" DSI panel connected to
DSI0 on the Monaco Draco EVK, with two DSI lanes. The panel is behind
the Raspberry Pi touchscreen regulator on channel 0 of the I2C mux,
which provides the panel reset GPIO and the PWM backlight. Also add the
Goodix GT911 touch controller on the same channel, with its supply
gated by a GPIO of the touchscreen regulator.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Raspberry Pi 7" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../monaco-draco-evk-raspberrypi-dsi-7inch.dtso    | 97 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 348ab62ddece..d677d1677f24 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk.dtb
 monaco-draco-evk-dlc0697-dsi-dtbs := monaco-draco-evk.dtb monaco-draco-evk-dlc0697-dsi.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
+monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..bb646714fe28
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,97 @@
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
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_panel>;
+		pwms = <&reg_backlight 0 255 0>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-dsi-panel";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&reg_backlight 1 GPIO_ACTIVE_HIGH>;
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
+&i2c_mux {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		reg = <0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_backlight: regulator@45 {
+			compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+			reg = <0x45>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			#pwm-cells = <3>;
+		};
+
+		touchscreen@5d {
+			compatible = "goodix,gt911";
+			reg = <0x5d>;
+			AVDD28-supply = <&reg_dsi_touch>;
+			touchscreen-size-x = <720>;
+			touchscreen-size-y = <1280>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+
+		backlight = <&display_bl>;
+		power-supply = <&reg_dsi_panel>;
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&panel0_in>;
+};

-- 
2.34.1

