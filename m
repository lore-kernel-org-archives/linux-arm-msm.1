Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595893;
	b=zkX2NC0W2MA+SJVTRFQw4/jJln/tL0Dgk72OcEsgVSy/8/MozDZNlBBTkXWZzYweW19c
	 2VR8DBP2Hz91MhTp9manR+vtd9CYsfbvHwzSEyOTOXqiuF5tq0NufbJONEZ55kZHlQfcv
	 d/ZbvhwvZreBXTZ214D1FYZkV0VCptZpUWxcV3TY1EqXMG7QodIt0cmEofgbRD17V+qUq
	 BzKtx4VP97+BXNjw8A78ZOhRhFA4rcfX8oAtOJs3LtvgUCD84+ieVgJYIg81ueNKHunIs
	 jUMPjtU2SJda1O0yOUVqxeiDEjZ54g5br8pT4sMmzUYJsNstuRl2I+VNAnejQWJThGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
	b=o4LNBBJv4u4ZbGFwcIgCChJahGCEpRIDkicpVBE2hkUCI5oxKXZBfixxUbf4Nd02gYLe
	 RDxlRLyKsgxqbhSt7F1I/Jhdw7kIcwHtj824c9nagAFIgRm0APOYgjr/pAltITT0TFGqY
	 ganchfMbKVRfFo8deFJ50Zjj9GPHym2eCYln3smxmHwhOy4uVIo635LeH4TA9Xs2cI9gC
	 boc7akH/12k2Y17H95XBlegmuC5GFIQ8kxthHVYp029pv8wnbUEotSYR9bdx6epxGUXeC
	 S5RXHv9Xi6z6pYExsMzpWzuvPG0vlDaGy8dBhV+FOpjN0Z3zHxUkJ5C5m/IcnttgpRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCT7th2c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+RFShZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A8606A33D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129A8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VCT7th2c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V+RFShZk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF6Ui1389731
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=; b=VCT7th2cma/uVca/
	uojpbudS4KLgTuvw7R5iopML3QM7QRwHtf8I6Ykd84Pn4qC09tGEfgfHMwP2qcli
	QMdZ1eIDvq9SdQP7wbVCRX1pRADJZh2BNMSrAFKBOX/OO2hVw0a2P45RwPxDdhAC
	Mw94LACE9fis3ZKWXaM9M1ljFG8OMfklBpmxiUtUxOat6uH2ATTXFpUiSQUV8nVQ
	9LjV4kNh1a3YoCjQxytKFMPcmX4+JPjx+rsLKamIUeuEea1weRYmUh6a7LNZulbi
	V0Y5v+T5JhMPGqNLhiolFD2C/52TxULFuM8ETENnsWcIyF6esV5eNdPpM/NIsz/5
	HRNYQA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajmksj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:18:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-366c279b454so1697101eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595890; x=1793200690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=V+RFShZk+jNzA8VMCm6yyy5Tg8QkHVsgEuyrMlvajhDqPN4xNUf6hqw0tkUMZwDP9e
         9kWoNlg3iGnqrFl2xphONoOVNQoRXqT8o4J141MIov/Rx7U4hm4APLZlJ+YlcToY2Ew7
         9o5+1kUSLVErbFBNIs8a3DqxTIGiY8/0LxodzWNvhqfAHwzk7h5vbTz7DtZczzqWoQWh
         YhCrkqh9pdpY45IULrpN26FeUK9gVfIPN3stvXqPVwOfDC0wHQkQe0DhloMlCX3u0guG
         cQEvL9nRqiMG2YHym96LWJYuMsnMFhfVhXH7dEsGtwQuFMJoKrfctAN8gVy/2wpLsVA1
         9juQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595890; x=1793200690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/Y1qpBLY6fko34laYatPIwnPDHGmqYN6KVu8T65y1g=;
        b=vOjyznH/XFHoU6OiQvJ/h7ffMUOUSA1XRgeA6WfG0l0+tB9z8nKVbRjAvKGi/S20D1
         LzTH9zahFZBjLpvmUASm+8ClMFNCGV/BV/3vGB2b4EWzg/7EguS1+0mqlXBWw5WcN82F
         MKcc9iqDs2Y5MgY5pzobM3Pd2JPMbFwV/Zx7rOAGWfl4RgbrZOuznnTTvGCKdHv3AoUg
         087xJfaeRG3wDpw+is0nKCyKfyZrHt2wg4trdbwaj3PHwKsOUlUH5tqkw2+VQ7Eu5hVP
         eTXRPYoAgUMgnN/py4SK6ozkA48MzZmxc3VexkFK8IwcGOWQaLRjIMfrGQIYdK44TSg6
         3oSg==
X-Gm-Message-State: AFq9FYJ7lAIzoAaIuCjKOsQTD+9AMcw46xVSCcXVkpkIpHBFYY8PLKOo
	UlsS6O72ECMREQ8HijKIOeAuBdaOjcfIPYbJHbRlOAAIjW+2nltHOzOGkRshq5v8pykD9kRhCO1
	PIU2SkISyuZ1PDRX6rWd0F8pGBzi58MjEoUT7tia18Z55mNyd/EY9MYpM29zNGLOC5X3I
X-Gm-Gg: AYBFou1yZHXH2ISWsHnU5F9e09Zps3JNwZEO+zBGMsskvaif4EWLAzSqJIH5bNEMPGF
	oHonG1GIdgRdlrnJ+WXRO7q3KiBP6g9u6QhVR0/Jkg1dWP/5Bd2+AC/or4qExZrDCLBi/uqdXDZ
	vDAqEWkmLlXwj3B/aoBwoGt8lqDCelpblp6Wh8msn+YJe0Y5OCbakBB/wBwh2g6aDoAPJy5MNoU
	IePjsxAEjFo8jZIsIgeImm+fgZYU5NrbAoBlKMzoeTcOM8jRS+5mlvuXkBjNTEq7mrgDt2EXCLX
	tzHDqaxwJGrf7QRXUu7nzbVpxBWWjPG/i+c1ae36iSbEXM17IERDCctUwRA0dxF55fBFq+2bh1f
	rT98FysR72ruQLIrXc0LuMdgsQo0omBWl
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050827eec.23.1792595889876;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
X-Received: by 2002:a05:693c:864e:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3674d047ca9mr4050779eec.23.1792595889325;
        Wed, 21 Oct 2026 08:18:09 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:18:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 20:47:30 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261021-lyra-display-upstream-post-v1-6-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=5076;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=H8TzP8Dj675+nLSJdklFvA6bI8Vose0C+tpoATsgYZ0=;
 b=gjweYPGF24ry4jA6y8Z6u1TL36AQ/mMo/BMNOi42WJjw+p+cvuBIIelhqWQc4yeMFToRPzINU
 5h0j+QlRai6CLulxPqZaUoBOOZQB63dTFto5IYfcjf/nAdXTKISvadr
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfXw2+tlA/FC7qX
 veZaUdmwqcZrjSg1w7j4t9GgrhZTLeLiulsm5smH/z1Eke+hXgIqV3upSJYBbiwj4y9YNsdrx95
 ZfLAo0cE8gKp31QwtIIolcDbVXL9EmMRaGgb7hnoxEvXzhwZ23iLyUFoZHipOjm6iDA0XYqGWQ/
 LKPVWVZFcystvvxQnIuJEe3Dc3ms3mxZAVeyFGKOj96R88bao56wBstJ0fTlxjL4NCUVy50iBss
 k7eJMmukAwQYF4emVeCUAIUNWhrtvOzZeAtblHbj3DQfNK81a/GvEjO/27xGqF246xKPsztdFJN
 MHCkjHAkOKJNMBOrpz6MRIZtcWpEoe9ddrBLoDOYdFSjOJfLBPk7dP9BxOD6hjoKqspiXt4R0KE
 MH6Md6YLmHxm8BiOeECKfFc9dv3ZE0icu6bE6hFnEn8N29pOurh7BazgY0YRYFCzOLEWGKNuDgN
 Xp01TpoivuBmNupCeSw==
X-Proofpoint-GUID: c5U1HXhh-2LRMSceFMSAfmiXX16TrEpa
X-Proofpoint-ORIG-GUID: c5U1HXhh-2LRMSceFMSAfmiXX16TrEpa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX8eKbSFIdwK2G
 xQuIhDtFmeLW2gBcrkv4Zz9gi1R9ePDHSMozIw+oaLFNZc3mz2b0zjHUgFi2B32f93+aust4Xhy
 LmdT3Qy1ZVbqbCjch3CQyzNYfauLYGQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8d7b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IIR7FofeaqIF4eDoK2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

Add a DT overlay for Talos Lyra EVK, to enable LVDS interface when
LVDS daughter card is connected to DSI0_B2B on carrier card.

There is SN65DSI84 DSI-to-LVDS bridge on the daughter card which is
connected through I2C5 with reset and interrupt connected to
GPIO61 and GPIO60. Backlight is driven by a generic clock-based PWM
using GCC_GP3 on TLMM GPIO59, with an additional backlight enable
GPIO on TLMM GPIO2.

Disable the default HDMI bridge and connector in favour of the LVDS
panel.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 134 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        |   1 +
 3 files changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 614152913cbb..f0551bd2d8e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -473,6 +473,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
+talos-lyra-evk-lvds-auo,g133han01-dtbs := \
+	talos-lyra-evk.dtb talos-lyra-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtb
+dtb-$(CONFIG_ARCH_QCOM) += talos-lyra-evk-lvds-auo,g133han01.dtbo
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
new file mode 100644
index 000000000000..3edb56937446
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-lvds-auo,g133han01.dtso
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	bklt_pwm: pwm {
+		compatible = "clk-pwm";
+		#pwm-cells = <2>;
+		assigned-clock-parents = <&rpmhcc RPMH_CXO_CLK>;
+		assigned-clocks = <&gcc GCC_GP3_CLK_SRC>;
+		clocks = <&gcc GCC_GP3_CLK>;
+		pinctrl-0 = <&bklt_pwm_default>;
+		pinctrl-names = "default";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&bklt_pwm 0 100000>;
+		power-supply = <&vreg_disp_3p3>;
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	panel-lvds {
+		compatible = "auo,g133han01";
+		power-supply = <&vreg_disp_3p3>;
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* LVDS Channel A — odd pixels */
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				lvds_panel_out_a: endpoint {
+					remote-endpoint = <&sn65dsi84_out_a>;
+				};
+			};
+
+			/* LVDS Channel B — even pixels */
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
+};
+
+&hdmi_connector {
+	status = "disabled";
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_s4a>;
+
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
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_a>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				sn65dsi84_out_b: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&lvds_panel_out_b>;
+				};
+			};
+		};
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&tlmm {
+	bklt_pwm_default: bklt-pwm-default-state {
+		pins = "gpio59";
+		function = "gcc_gp";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+	data-lanes = <0 1 2 3>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index ec5c10a40521..20967c294543 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		i2c2 = &i2c2;
+		i2c5 = &i2c5;
 	};
 
 	dp0-connector {

-- 
2.55.0

