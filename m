Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604729;
	b=DKq0D3qRD4h4zxAPiWJZ+xYPwTnJBXXv+6MzVVaX9hHhKIab9AivAsPpOs/p4+PI470n
	 HaDNU+WfGdU8yZvFAM7UdanJZ7jkOeBOebfzwOTg7Eveqigi0orZfGf5Xy3wO8IhgpFoc
	 E2b6sXNDJRctEeASB75Yse5vE8f5D0HSspcVSiLQiLr8eh2mplKh5HDUbHkI79/FnV5dO
	 vWV4NIW0gt4CA+auZL9Jk8JgvlLUWQn9z4Xt/dNaV8JrRXHlWznwwDgVyawVfqQcNACLa
	 SZeM1NJWalg+r3QQ+FuefaXDKF00HRR+X5oB4IwQjWXC3k5igzV0nI0++KGBY0ul/yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
	b=lAcP/TQsWDLnuj8cujbgHmQ1PQv8Xpwg7e8xTCAkrVs0JCrtpiOy8IjZGswdZPNMDdO+
	 7QK3nhjreUpygLqNzCngNFeSzsF/GAYBY6m57oHNy5gnR0e9tB3ZmzfU3GHKAQTEbDGo+
	 C0xkTmYoW6tjp8+ELExA9zF1zxxBmjZRNvw7g6RxnH2eByUDX7ZkTD7IBPAjjfz4PLMze
	 YpTDC7w4vFNyybnDWYsblVMp5iSNevr38nTJu1sUcjR5h0mKS/7wgaai9enDyeJPscBUt
	 v9gvcmtxlf+9gxXMnbD1cCswh0sz3e63czdUSws6+TXBJ7I1dBvJPexuszxKzm6zdIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VuylNs/y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B5606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C79B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l53BqFl+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VuylNs/y
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vFmj3348781
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=; b=l53BqFl+lxJcsyoF
	jER9sTiiLtaCN0XwOhqhX+YSnU1hrgMdnhbgWnIBdjAYr9TvLIQtGe8PrVcdRbJp
	0B+WC9SIIq9jUodFBCfuTeOSiN+iH3m5UhklrCtK8IWvAHlIWzag8aqxgy6nWYWk
	nb3o4WPuvDmmuYePTbFTG0VguZFgI9WgzIkjdv3C0NmnmXr8gj/luc+9iUTfBzzf
	+0epvmRw67QXa8SAjbJ40kyVNaO/KW8YJQCV47vhPTlwOIUkS7IqdYaT2Mhvmcdx
	60wlRE44kc982fB35fCNUyP41q2u3M30cGbIrr9kglYtoP++iRQsYNwzwQe/JUGq
	49F2KQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxnrc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:32:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf3f829b3so29109785ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604727; x=1794209527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=VuylNs/ycqW8ZwtLrDLEB/XSdVDEXJjf+bsSccXVkSxJR/yl1bBpw0EG3EvQs0BXjV
         DbLwqnNNhw3qRn/3i5ZzivpUNvODtJhhC+3ciHvwlb7dyrCe3lj7VqaW02icvlpPI/L5
         DFmQcQu1/yNLfeP4tfLG5UJ+l1al23/pQooZk2nDQzdHQ/fZIRD0LGQjV+iDkB3o4Xv9
         iVMpX7lwpg19LDI+XmfEB5KYj93S287EfL6xLkizAajTNOfBWAfRmUtWHjw47NMyxJ1b
         FTn2UBS7FTGhI+x8b+mzwtxcJ4WyVMZEetYz9l7btl46rieYguEAmyeFXpjIIohlVDWA
         O6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604727; x=1794209527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xdYJS0wWdZRR8xHRKu5AEryTd/6nXIFt/V4UCjAEBoU=;
        b=yUVrDD9F/YweWBqBTVRc/OdS9/YvqnUVETjWYsIr4cf0e9fE+mHm8YZxwojGc22Guj
         vNaQxX+9Bkh9d3/skRgx+xZtklWhle2lvqmKdn7IvZmGrDHRhanQzSv4ruVW5CIzDMb1
         Bb3KbSDasKuqgUTUu4il8T5DWR1z6l26dljGNjWlf20c2w7CKrOucsaHtjU7pi6Zm44j
         Sgj/x5NYrPpD+oqKVyK1vNCRcac/kYmQImoRMZXZEh6l30GOHZEY2JrsZmSRLbc6tb1F
         eDV6LYPwGQjAPJe/I9X2GKNzrD64d6q4iHpzeEWb6kQ4g2d+3L/0IlTp7Ct7TZaQzE66
         LAmQ==
X-Gm-Message-State: APuU4Z/pIMSvEDmeoLAQH2v3hPNmpwgyVlA9GYDLQT+s9WSdY4tQlv46
	Qwph7sp/dx9o+Ao8uPufpa5A/KNVhmqCsQo4880vadXtM3NLlhhd0hkYDCNo5AFcrL0dHk2okr0
	B1P/+Ml3R4QQ2C9SRkvlQ4WkFnZU+SwpAZQxn2P1sDzJ83Az2TBrWEW1QdvkM16iLOBva
X-Gm-Gg: AYBFou3mI7TO4GJQkpWEeDLzptF1Hutj2eOTbibq4fY23BH1zUZcv0H5w4OOew7XxuP
	f1dsuMyHw/GgxBvISCTjmNC3SjEHKaO/+IE5KPn2pBWZ+pDHN1Xd10w95jN+ZLuNxP6Okz5vLbt
	0NPo4T0uvY5QcBVtl2k/OSV8k0BmQL9egFyw4SA6mmtOoFMrkiAZV459R2oUNVUPBpC6XOQ4TgH
	gng3sQ71YUlJ4s9x1SMbk7l2rH3J64ipEFCaJj8MkOVuAxlqB+zsuTz/QT4mN2+HodGZr6oaEKj
	CmOG/t9gB+PENc1OVPlNpCU2DmZ2qKAalaU7JQ1Ptcg6I46Z/fVRpIgxr2jYBp3InuNCVk4SRel
	bra/L4ReHEW/7jiZIaBwmikG5J/8BzM+bY/Rj0uUno42IItEQmK1BnVwTzGdbTSrZclNaabJ9jA
	dopOSL
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850635ad.1.1793604726618;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
X-Received: by 2002:a17:902:dac2:b0:2e2:c84b:43e9 with SMTP id d9443c01a7336-2eb363965ccmr87850375ad.1.1793604726101;
        Sun, 01 Nov 2026 23:32:06 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:05 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:33 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch
 DSI panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-3-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
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
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3988;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=khjAi2jQy1zq3snDT67UsqjsppVgIl1f7iUfWMD5fRY=;
 b=z4D5+XRjcELJZGY+Tqzuj93wKZjqBIYMC2aKMBQZ4dkyAeU26xSv+XfULfNgUug7LIVchm0GE
 6UF1aEhqUCvANDiY8kVUmIm5XAwGt1lJnoUvEi5JxJp/9MEECXUk1ni
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: _E7fmbxoVBm0u3k8_sQ8g1qK2osTsI1C
X-Proofpoint-ORIG-GUID: _E7fmbxoVBm0u3k8_sQ8g1qK2osTsI1C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX5+yeXNDaTVl8
 avWgcBydaEywnbaBfYPukHORdHiQl78xfqYpZP7eV+cH+XOCsoXaFSCxkD9TMgW6z9ePB9rNuDj
 VUZHjUENSGsH+YXc8AqzIjlMx/DKyPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX19QlZ91p0G/Q
 +PPWvy4S8wJUHuwKOyAmO/ddxtY8aUeOkJpdEAl3XtXkiQc30p7oFpc+hKnHJgtFpw3mdhYH/dH
 EsaBTKahMphZTihcZXhHNCyKlKv5863jq9ViIBk4DgBOp61EASflza+Yh83CTp+Q894PW2ANyVw
 Z06eTH3mhzIZDtmaUCo5f2YZ22HOZ87SSzcLxrt67U2MCwpSaLzLVIsfoqmJ5Gx+NFpszZ9dvUy
 KG2BGdat9dm9VZcRWfiq1SNTtSO4cVwiYCQbSugjCPaNmJmxOiX4ebsTPFoGtfzbLv8VNMB+e1d
 Erpb+9LK848xWz8vsg7XYdy8U0rXYp8qWXS0V3hbGfa56KB/gl6ofPXeXYVhRdAs1yX0voEEp1O
 IxHcfGyIatAKmYRg7hTxprgmH92m6ttVLo3OdYcyc0bAGUGy8PavQ6lTUv2F21PsCYB1PEBJN6L
 lHT1XUYKjjsOg/Ao2HQ==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae83c77 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jdnGpsxoh38fhdhdbFoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
to DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON for enabling this 22pin connector.

Add the regulator and backlight controller at I2C2 address 0x45,
Goodix GT911 touch controller, panel power and reset control, and
a 2-lane DSI connection.

Disable the default HDMI bridge and connector in favour of the RPi
DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso | 88 ++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 709a96ece14e..298054f47046 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -480,6 +480,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 talos-lyra-evk-dlc0697-dtbs := talos-lyra-evk.dtb talos-lyra-evk-dlc0697.dtbo
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtb
 dtb-$(CONFIG_ARCH_QCOM)     += talos-lyra-evk-dlc0697.dtbo
+
+talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..6dafdbb87d3d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
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
+
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display>;
+		iovcc-supply = <&vreg_s4a>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1>;
+};

-- 
2.55.0

