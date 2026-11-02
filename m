Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604735;
	b=4bF+j1UH0fTtDKL8VlaTW2Qf4hHf5rPy3UqzHwidP2QBNKP2yzGMNZo5ojEUUkwHxJZ+
	 PvBU7gtXxRS61zQsyj5MU2DikYlm24Uw//DG6CDQR20z+JO+nsDMO0I73rAfg3CqrPaRN
	 vbSwBdF5Mo1tMAzDvRlQ4ADues5aQsUFqRD5K6fiZHVLT0s4Qra9/KCciSomRCMVEYohJ
	 Nj3PPoeKTUm1t9WFy2yo/UJfFJEXauiqMIN14O1BJF4RGsT0hNu8Km4JVmRzpFLoRUIdK
	 HuHBwV6HCI3ZQTz3eDwa/iHjtniiyVWJkBGVL7rzmRyELK72V2A6hLl9Z+Klsb8l95Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
	b=cb+yoooYkQHWQ3L2XNR0wgAhm4T09SQ2HFukJNQd5C55ZMpJleqsv6fBI/JW8xwpNMP1
	 IPX0c8Oz0lPm80l63oyuWI4gemQKZPc2cc4l1Uka0xqRd1bcpX7C4XGiyEsy9kV/3uUpe
	 Z3M4TGURtbrbDfteEvPNAzw3GFDxv6qf+lPeZDCleLnD0tXm+1cW9zWNNI0XHFFaUtAzP
	 WIyUceOe6MRB/9AEZY6+TDJvrFdw4pOKAzmongvjaJGCj0tFy9jtFSvqQoX46T2+H2fi6
	 td0Go8d0+9RntXfZdQtBLf+w11rtJM6y92GLk8rw1eXcNE5klSaIpUckeNG4x7Pkc7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iAmbnJxn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B528606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B528606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlZcZHBn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iAmbnJxn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vLTu2715819
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=; b=JlZcZHBnYVF9GeA2
	8p1OtVdC9+8fuWyNSfFzTA3ncvHWrtZ0zIFm6DuhxWD1w6mfws+bVF7hp4Ufc4Dc
	rTypKhBbdBadyXrLdrU1/q8MJ3EuTT1qTdudmHnQAsA6YcMO1yy/HI+uLj9IEMDN
	QAZurUkLd1OrqR3NfdWEExNGY13FBQ6MWUl7+DJi8Ba5Th6Ct80N6OR6z8XOlSFj
	qCm5SG/GGDMJew8AQ12QAyRmOB4X5VPIGun/KkXGDCfsMVawr3CEvNrxUoVnBxGc
	7712yvVHFeZ5bUL3d3zXx0HspBMtDlGlF/Cxy/oibzNX0eeTZ8YxUbOd7LHUGRD7
	gSgC7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2wqc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:32:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ba4757baso26023895ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604733; x=1794209533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=iAmbnJxnv3XJnS8rLKCpXJWTuvgHs5MK+SW+AXbd3uxScLZJdcr1CNNfqUir+DyNmn
         jqV2nVwyRiPUV0RDmX18hhFABZSsY9gSYRdemSxK8OWqDRpNVj4G8DudArUa4h5cLUtn
         aKsS+TwMOuqz+4bn1BIEaWE85ddxAjAp5Rh6FQ2DT5IxgLRGKBpGUepsIh3G2LHFH95S
         XmDF7qY9eG2f0j83qJdpFCi2dYELOYVjeE6GAAW7H9+WnA93Gq+HMeSjDhtPOFsiH3TP
         jnwBBfsHCQ8A/sI7srnjTbHGfeSxyVP+IBkmugFD3BIjqv39P2z9HSHj9tt+Bs04i0F/
         kUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604733; x=1794209533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZEys/cECMLMSb3pQO9KvyIgi8hDafMMqy0UH8QFxp8=;
        b=IKkr14+dPoXp3cCRBv+PTW0NW+a0FsO4Eh6aoR5PXPFPzIeDS3imAxvjE7nrhUB3b3
         lzBQrP97UYOUvks2gTs7JVUoN3bSm5/DT3nwBo9734jdVAwwltghd+Fm6ZFXgxORgCxy
         nNq7ViRP3U4kNJgySM9GyyYMLyoYKAZTyCmOMCoYrhOqQ+0ge7Jd84VewsmdfAkeD1rt
         N60cvbRUi8BtMMmeMILFc/jfdHOICStOc6Ej3pqyCEAJg639hTDQgTGkcswm7SlueNk6
         xnvSVrk7RzkqeuakSmRaumPP9gIJno/GyCb8dwlxz3pMCX7l51AkUDEUIMIIQp2Uocj2
         Gh+Q==
X-Gm-Message-State: APuU4Z/fDSrjiQGneT6HeAtUtBmImNSp2xN3RdG6B3HTalxRaCencKvd
	za07trCSJcaMnPMo4+1+WCIIP9XV1Yz666HZrg/A8AEaqKAUsrovRsdbola8WqnFkdDh/ysrCP2
	ekNGqdBmi30gSf0pCfFxaf2td7kNXBdkICkWHwpoDqOHhmXp1GzF+/Z06baST4gWlhZsz
X-Gm-Gg: AYBFou0yLc/Xy+TDx2fVXp6NLOwIrfGvHTsGwqzP1ArN1rtgOl9eKeiSjohqlkOo+Lr
	W8JkF2gCwT/gxRWN39NfCSjU3zoCFCQtYkG4+mE3jZdYsD0Nrdsywuu6FWifxlvOA4OV5/NxmWp
	dJ3XVLtLOZGh6WOuTgweM7CavdP4NazAfOG8YOfWgXxskeqoXOHDfI6UKPpJ1sE8kxkFiX9eH2I
	MH4TP3etX44SzM6BlOOjQiUb4EB9UcQtG7AItR9dcIHkEZddQ7qqdSntleLY+34xaOj/IoUmGGs
	NgaUkqKllcIySWUXq7zXvyEQUvm2OB6zD4OnuOr0/LasEIvIniFllyn3VidMQxnU6+hOXgxmKY+
	T63n6FZHTIzQDEjDy0xo6hdEyKIkk+c2eY2K2RkgqOPVd5+by6mvGBQPOAiRSZAG4kqULDS3OxW
	eyOr8k
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87352335ad.18.1793604733059;
        Sun, 01 Nov 2026 23:32:13 -0800 (PST)
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr87351735ad.18.1793604731764;
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:11 -0800 (PST)
From: anand.tiwari@oss.qualcomm.com
Date: Mon, 02 Nov 2026 13:01:34 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: talos-lyra-evk: Add Waveshare
 8-inch DSI panel overlay
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
Message-Id: <20261102-lyra-display-upstream-post-v3-4-7f660c3b622c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=3607;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ep0DWydVmKj6o+MB54eb4vl9AakC4YjRhLn758mEY0w=;
 b=VLid4p+cOMuzaN+XR84jqTFFsdpcmhmMe/PF5bm2EuqoYZ3OZao77ehvpHeGJotoRMaycLjTo
 DyfAp+WLPCqA73b8lRyA3GjCp0X33v2irTJrya/+e9XPvLcuHFzOS7D
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: f53irn1XzboLJUJdlqHzY4dNwpHyzBcv
X-Proofpoint-ORIG-GUID: f53irn1XzboLJUJdlqHzY4dNwpHyzBcv
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae83c7d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CsxVdn2IL-oTZ3OAgFMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX2d7tcSVzpezi
 Rt21QrwfNoV0Jx/E9bS4v0mxOUS4//tUkTwkz05yEzcxN4spDfXLfboL30x9U76xvxsfw6XhAFl
 OzBiShXJ9rrjowAi4x1yAe+0fBJLmW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfXw5V3legTQ2p5
 cQuOHQbVYm/aPXXBr/GPt1wc/HVeW47i5qdRCDMhdV/5qgWKuhlaWseJErphJw08S06DisrTX7H
 RZ1bBXhJSqgGBqiBr15Y96euGmXbeu4cWkZr1GrfrWhxlXJ8vMKsBveEiJ22v73wUc7JuL6P1Dr
 wykkMGzP1sedbFMG1Yhg395dfIC+2PqwPt1lh6jWe93ziro25UEfiMwl2SluCo7/Lm1qvWtW8KJ
 Q2IgulVBUl8MqbIydKuMDXy1c7NxAMGe8BE8zvuMRVsaCOMk77K9kV9+KiJUODA3kQwQ2vFr+Fq
 jKIbcnB0vpn8kghjzDQpd+xlt1JwafjdPo9CgDtLb4bb2NG0+hOmMlsXaFNe24WgH575xW2EB9p
 NdI1PnQvUokPeWZpBttAT7HIYHsytchXTNjxK6RhC4VKBwRxyyFMDfj827W8pUYi8hrE8sTIQq1
 6I5EzEjYS6DXnhkJ2Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

Add a DT overlay to enable Waveshare 8-inch DSI panel connected to
DSI 22pin on the carrier card.

DSI0 from SOC is routed through MUX which can be selected by DIP
switch S1016.5 ON, for enabling this 22pin connector.

Add the JD9365DA-H3 panel, GPIO expander at I2C2 address 0x45 for
panel power, reset and backlight, and the Goodix GT9271 touch
controller.

Disable the default HDMI bridge and connector in favour of the
Waveshare DSI panel.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  5 ++
 .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   | 75 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 298054f47046..b6a61339914d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -485,6 +485,11 @@ talos-lyra-evk-raspberrypi-dsi-7inch-dtbs := \
         talos-lyra-evk.dtb talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-raspberrypi-dsi-7inch.dtbo
+
+talos-lyra-evk-waveshare-dsi-8inch-dtbs := \
+        talos-lyra-evk.dtb talos-lyra-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-waveshare-dsi-8inch.dtbo
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..e9a8fdf0c179
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,75 @@
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
+	panel_avdd: regulator-panel-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-avdd";
+		gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	panel_iovcc: regulator-panel-iovcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-iovcc";
+		gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
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
+	wsgpio: gpio@45 {
+		compatible = "waveshare,dsi-touch-gpio";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt9271";
+		reg = <0x5d>;
+		reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
+		backlight = <&wsgpio>;
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
+};

-- 
2.55.0

