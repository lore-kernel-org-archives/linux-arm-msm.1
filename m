Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611302;
	b=3iIELOJibDV8AJ/mqzyenThlmTm2iP8BTbfHvPzW8KDjr4YdY7LZm0NO+v5EeNAER7Z8
	 mQ4qDixPBacTtqMwzAj2Kn1Ky9xrsVUyOitwfEy37B7bSUDMXMxfj0ucqntxR5SS+7qxK
	 CvPaB64uPQodyUXIJBB3GPdOJFW3erKtTEaIPfu81dk3fQpK96peo7HXcGonm7P32Kbw2
	 O/V+tFzINIlbk6I38o1wNIdeasr4Qgr8xTaHeEZ0QcGvh5/Mhcx4yELjUg58mR56F7+r7
	 zZPduwnFLYI0aIiIohQ72RHk7FSMPw35QHbnl6FcW9zEvzVn6ivEh3lfyDVzHJAvVhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
	b=v8jQoXeNulUxONDeIHhSSIG2TWNugeTgAOH0O0DqknQoh4XSa/X0lRAofhUIacWR1FUG
	 FuCXBxkG78qEGXOnjqGdrtS+1Wb+lgIys0yqqgS/FWme6ZwNbLzvKSQKLThYPmXAKHWm1
	 UaoX614Iza9fr5VrGUzEIyZnUMp1C6DtbNDljzS0bUKSbl1Bx4YWeb1xkuzpuhBSkuQtN
	 gssEBveWY8eDyRqMF+R0UJgjJCu432F4adH03PP3deauFV8FJ/SEflXc5XcSAoMDna3Hf
	 bfQc+3MwMWqGqv4QyZnF84bdsb0MNjcmIYbMMWjx/p5yyFY/Mkj93JHqTMoS+PxPnGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dIGatuEn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc64sO9T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CF606A689
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67CF606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dIGatuEn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mc64sO9T
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9movV3611838
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=; b=dIGatuEnNrSEPkUe
	cFNOr5SSZ8rc0TeagdnMl+X4+5zBnkc45bHx3JuJPAhZLu81bP4KHRy7+aNZJkP2
	OKAEFmJINCA2SebrVwy1K+8oJ1Cljylu8A4R+ajWxqKY/1f+MZ/1UOxZ5GJDwhIj
	13e1XNgCLvvB7Y2hK0q5LUy74LAcKg+ibW8CgX3E1EpyCewO2fNydUyywbWYT3UL
	z/nCOEBNM0qAnamvrY9ebqRddhgaGwJECGkICdTqVmlbzvZ5BU+2f99ZWY647W4c
	Za8y2zvLdIZRNmh+HRmx/koCocpNdtQHZyzeGqRa7ouQI/Xe2g6kGQ5ZDtvMVFwr
	/9RTxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbq0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:55:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f01caa8ab9so6289625ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611300; x=1796216100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=Mc64sO9TekIIT+VDWpz8WpYqnKAAYwqrl70z6uQgiLaDj4Xtww43JYZnDYetZq/ee7
         CxISOkRNuRIlCaT+1k9acJkt5O/BaLAQ9pbg4726Cvrs6EUi/86Of/qaMWrC/UMJN7aM
         LVlU0nn1LqxL9CwhIygGTqaK5It/J2S1zhjY3LAR/mZ7gn9icEGevqrsfjy6VWZ5Wljd
         FlayJ4HXrE8XMVvjBecA+3nK/ZTKkV/ZzreQ4o8jbmJZZCjWCcR0gix/ekuDSN200FWB
         2QhO0PBV+aQhrCf1cqYv7Pu9O+9InJxLnaoQikx3Uh6NJXLEanKqyPx/85uyyXG8oTOM
         4uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611300; x=1796216100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GkrVX5hmqwOj1uqSDHPg3dZrCtzSVe8oFTjGOLlhb9A=;
        b=F9i1GL5Qx/YI47boH88vKU0aHsCvPh9Ubvlu907lQdIBH4pzFv6HBaFNBMGp7gu/wH
         d94dHxtISfNIMhWndXNm/Wg8GZh2Fu/GozQlpuc0/D5NNZbvJd08YmzGT7kDteDC+/cN
         k2XcoEUKi9W4vaFfceB2QnGYagefqTxkv8nzbI1b2Dk7hl7JbuWHqY+N4jGBGMEW4acL
         Ikr9NBo51nu8fnTmPm/9wEAk4otjcvnlm9D4HnG8o8oslO7yKPD7srk3IragJLLK9NYn
         cOfypZ1Xr2LrJ60py5hTKrwi8mU8U254Q/v7LTGFOG4sk8ICg5hQfashDK2Lu6F1aHEl
         5Bjw==
X-Gm-Message-State: APuU4Z/IGREi0L87RsuHfcAaQUWQscRd0WrtzReNeSx9wRbUus6z4yRm
	hlUx9AkcP+bfYxaVRF+sVtpYO2P6eLckysj3i+ABs8Ld0W3dsWZJMXICJjaEWuSNO/U4fzo1sSY
	a+rWywgSRStw/pYpJOMXlnXVDbEz7yiEWZliEHA+vllsNp6eaILeHQkPJwWrEoD5Iqu/D
X-Gm-Gg: AZFdTZf/VNZYgYINezGmz/ayogoOAVABP+MwviGf5PQWHNn+tr8oAnPXy6CuwdmW09q
	t61GFQZ5tbdWNhhxDNH+zkGDypSkthyT1rKWV5Iv5sZljsiemeLheDulE/8b9JZnd7JPW7oqvCM
	zG3Zb3EyIG2lDigUyutVIrwNOKLzZjL2lm5+bUIhS98vBHvwbHL0TH41RseCclCWRpESeMF4bIi
	BvLMaP9x6t+6Z2mSrjzl4BbjYC2IhUodcKbBE9dUj21IWkXD8e+i52KmmaxU5/kP0ydrULgPvlF
	yY3K2i2bGOxLdosKwRutkWCJtiirJxbKX+h4MzLOyYsjfjXYjlYhkckbD+tPpKxK1fi35ePfnOF
	UBYrWFX5x8Syeu1AqZ73BlexS8bh4e2kpgZqvDWX/Rgj0aJ2QAtKBxr4kW1T8UBy9a0TeM7noo8
	SFGJUn0qKhqwKFrxff4/sixZb8tIKQk7pUmqoDmprmtmJ+XiC6VahiT6+6qIuQzeZ/1C2of0S7+
	ipX3Foeb2HtsL1euvEB7Vtx8Cwu
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103295ad.0.1795611300268;
        Wed, 25 Nov 2026 04:55:00 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277103005ad.0.1795611299750;
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:59 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:28 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8"
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
Message-Id: <20261125-monaco_display_intf-v1-4-8a27d60b0d94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=3852;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=AYpwK+oMY29nTRrXB5g76kNxMBtgPBjHP+Erts0kWLY=;
 b=VPq/xz95s4qEJIiMSnzPU2MYdlsR/X/L5522kfVJKkIF17DvhT4gb/P4vNmnj4qVo9dIVzcvm
 /ATiQwdtpaVDd8tgId3WFuYXiCnpU4+kJ4q59o0L7au3tAPP2D4jaEJ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 1mObwjYbw1tVvpcHmQFAwH3wHikB80GM
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06daa5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8-LhdloVUtFS-VMo-UAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX1RTul/2Hj7aC
 QSxe3uA+tZPY/hd+f8sTxyIb+xRTRozvMwCL8IEJRzIzJfYSzD/3Nji2xT08uRZ6tsW+ukGdpg+
 QxSmD+aSVIuiOoueWBMiT0blBSXag0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXwVWoZCysw5V/
 /cCpoXrC32/pk1bnRgVkGKf1WjnfAZlYC0hn8WpcXuIM1AMOcpnjoe12svHiboV4/OJVZJt8JlD
 JFUsFXMJIUDA3y0GARessl/dT/hzrnw1Jk5BXrDilULEEbUg5fbD9Ux2VPOTa4tZlSEY4ko9WGN
 Ucuju13HEzzi1yq99Cqm7qddafQ744djx6G618Z1eYp+ta87KbuQpTsr27FGaoJOuiZKwH59dCz
 E3cs1i3OV99rZGTSO4gIcZxJ3XzwoYW5iotJ8snle1ZWpW1XhCJ72lTbtpma0zETpe9fVrOGH2y
 QiQfGt2Z0qTLdIWPYauu6sLJNB8dqQOp4zu6E/v4Gunum+aRngrzaqSbswACUFHb4/CIo/ULt++
 5YASojFnCmv6+13i4jWA5T+PH2MVB4B6CXTdzph5vDoKWCaUQnq//y4FFf/kIJDlqVveWTheW7V
 siYm3wM6UrhG2nJhsdA==
X-Proofpoint-ORIG-GUID: 1mObwjYbw1tVvpcHmQFAwH3wHikB80GM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add a DT overlay to enable the Waveshare 8" DSI touch panel connected to
DSI0 on the Monaco Draco EVK, with four DSI lanes. The panel supplies,
reset, backlight and the Goodix GT9271 touch controller reset are
controlled through the panel GPIO expander on channel 0 of the I2C mux.

DSI0 is shared with the LT9611UXD HDMI bridge on the base board, so
disable the default HDMI bridge and connector in favour of the
Waveshare 8" panel.

DIPSW2.4 needs to be OFF on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso | 94 ++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d677d1677f24..99c733c480ce 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -99,6 +99,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-dlc0697-dsi.dtbo
 monaco-draco-evk-raspberrypi-dsi-7inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-raspberrypi-dsi-7inch.dtbo
+monaco-draco-evk-waveshare-dsi-8inch-dtbs := monaco-draco-evk.dtb monaco-draco-evk-waveshare-dsi-8inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-waveshare-dsi-8inch.dtbo
 
 monaco-draco-evk-el2-dtbs := monaco-draco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-draco-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
new file mode 100644
index 000000000000..79ce8cc4a289
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
@@ -0,0 +1,94 @@
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
+
+	panel_vcc: regulator-panel-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "panel-vcc";
+		gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
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
+		wsgpio: gpio@45 {
+			compatible = "waveshare,dsi-touch-gpio";
+			reg = <0x45>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		touch: goodix@5d {
+			compatible = "goodix,gt9271";
+			reg = <0x5d>;
+			reset-gpios = <&wsgpio 9 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&mdss_dsi0 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+		reg = <0>;
+
+		backlight = <&wsgpio>;
+		reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&panel_iovcc>;
+		vdd-supply = <&panel_avdd>;
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
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};

-- 
2.34.1

