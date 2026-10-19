Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FE4EBAF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409185; cv=none; b=X4JJaEMPYYyNwDz+Bv31JKhV2QWCZ/Xkw2UbYd8phCuyAwive+ZQILt/IVcs/6j9V/mwlLXNuNv2i8PQlIxvZt73YbY1H/Mzevc3BWL20G4CVDPj1krb3ngG3TTY6h44fFhG/QfX+oLTm97+Cc7uaJbVxx1DrSjO/0dyTkEbUGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409185; c=relaxed/simple;
	bh=bqeeWAz+d4IHQrcnKjbogs3Jr+vUY0ij/Dq/7cvVfhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GErbzCsjZQwC7KP83zWIgcdzLPsgvMXY/vqlDCgzW/n4+VgeKjRoOjX03oqv9a1iexfOa07XNYO+UHmD3+KNiq2HWt1qPf/YxmuVqO6a1BHcNGfWCUZxiIXcIiFgvIJTEfjcBS81yz/iJgS0F3s2hnatzNC6h0s+p/SH73b8Ek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwzgyYAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0zy6pXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwzgyYAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0zy6pXT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OshA1168031
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/iv0Hjic3D1gnEdMJH+n9iwoS1ng3NDhVKTxbtsGWw=; b=PwzgyYAQeeqsF16C
	34otn7IdrYPX/joLSwulceMORSeSywqTnQhNc95A4TOHQfcRupn9cJ38TJEmIy/H
	BTY153r06ZGw3uImg+XeIhR8DQ/BOo5zFkJlz6xjf1ZeX5YmHTesHZWzRmAk+YvJ
	PJ893shDonUtzdCLaagA/TWf0WAR0zYJg52cSdhDNeJqkMrfoWFfVAOCiT3iW9C5
	4EKi8WZHFB7qrO8HcTfwFx5Ii3/+7KhyR+4uDOOEQxKr/Z20CZrhfpY4ZSisX0oq
	eESjL+n9bahMk5Cv2on0lwBhD853xmHCaTsTU85Kor755uf2E8M9cRIV2Mrw3Rup
	BpC93Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8th9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 11:26:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so566254485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409168; x=1793013968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/iv0Hjic3D1gnEdMJH+n9iwoS1ng3NDhVKTxbtsGWw=;
        b=Y0zy6pXTe/smlJ+9LfTqbiWWCT+B0U8zlM7RV6wSt8C1R6UZoHeoyUb2fl8hEvwQtR
         XnB80meG1x/Ozcl+eTbFlY7OWS8Vo3QvNwtABjnKC12GKsHZbjL7aKIiWIGaf2STQal0
         jjwg5iumAh5U8J0MOLKXaDsapvaaNc2fz1YrWgHpIsiL2JT5oKxIXlSRAZTymowUCxRK
         DnMd8AAEE+YlpWTYls9uwda3whdEJsh/+vFXtMhcfX3uD5kAndNkFYBfOtCkph6LQZME
         vNwX7y45IBcyID6xb6cMetV01L4r8UZ9f1IVgiBxbBaXv2P8ghFYKK/imP7DfRgpsXn4
         CUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409168; x=1793013968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/iv0Hjic3D1gnEdMJH+n9iwoS1ng3NDhVKTxbtsGWw=;
        b=KKTMaB0TFeHTXpcQMv6sRmiYphKBpBMQuCNAO05Q6DNwPA8ASCNsLZz0K6hxYZwfHh
         PYD/Xs3s5g1DpXo2ifIy/NEb/hmXS2MVccGvrs0Vf1l03zcb/5mX0g2g6qaiY7Kv56Wm
         2dtXnjiU5xjy0fdV4jarKUPOlQLY8eftk8DjQeZETdSJlXI6TL5c1aUPlNwQ6aO5lZFo
         4Y9SNxivlXIoQawWc2IsUWnQkCRMixCx2btLzjTs6qjNrMmZZfMpKVP4lPDIIzFzLbDT
         2qoomijpyPfJ2cdb4Nw0+HDIbs205S7wp5SFwlCpI426gued3X5ZTrPyDgtZj7B9qHZQ
         HEIw==
X-Gm-Message-State: AFq9FYJoOCXl0jwT2K4voDkEu9hZZ2rXNCgxWaQ9sWosoJvOtIAHV3/L
	6sccZE3o4JV2uTpTb0VLZyIofqg7xW84+GLzNqY54lDyEwiO/epqllvfMy59FeJ1lU7Dw1/KVuk
	MP2HxNISEE/OaFe/OHYp4y/ktBMdEbRGokzLl9RpnK7qiF3noSXLksfIax96/r1lWbGob
X-Gm-Gg: AYBFou3WYGJN+JwseObeJdbxJxTSwpSrGb+nKpSHbcEowHFSrwIOxSt1YaE/J1eOft5
	ohHwYCMMNbvoEb5BASrZanIdB2k+s55KADjR9okMAXUoo0I6+tAtjxvDzYsm01NoFGCpKYEMfLw
	HaTlvhS9A1z56oafiEYYTQDbuaY2WJC+zz/LzGItl2n1bXJZn6+b2DRsOKmbp02BEdWuW+4Teeb
	jsZpO0LlKz3X8ZgW3prVEiRl9xPb5M2MO+S6Eoj7wtoGwnDjtBIqe9g+n93+lSVUuwhaxvqhah5
	FwtX0DKXh/HjlhZpfz1Ty3XyyC25inf7S6nGDTMHsa7fVfer3z9rm5LVXW5mrbya2n2OOE6ZICu
	D+TaAm0aBxLpH8vKNA8V4H9v+ez26zat4ev9dhyMtRVNENqpKHkI2tBVbL3tx4WZPJvT9aiztC9
	+jJEe07dtthyp9
X-Received: by 2002:a05:620a:6f87:20b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f2def5f1dmr706071485a.51.1792409167367;
        Mon, 19 Oct 2026 04:26:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6f87:20b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f2def5f1dmr706067085a.51.1792409166750;
        Mon, 19 Oct 2026 04:26:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:26:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:44 +0300
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8150-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-8-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3897;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bqeeWAz+d4IHQrcnKjbogs3Jr+vUY0ij/Dq/7cvVfhY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f47DvElBnzXYultIe4T5kpg6h6cmQXePLs8C
 oEt3lHh3k2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OwAKCRCLPIo+Aiko
 1ejlCACckV4FUSqkCy6G0axjtLG15uGa0R/QYb0KshxjrPod2Tc4VvA3WNkJBvc16zeUQfc8o+Q
 M5YD4BoJVAQTOhlfS009+/7NHs30Jq2cUKP+FXe+ggo61qUC6iTSg5v050YgWg7uds9UcnY4zed
 MABGKlEjWcHUzAvBlNLAfazG5uCM2U8lp5VcQ+IydWm3tMQU8drkAEeQ3i/PYsYKpzmektp6e3d
 eRRlRxuHB2lCCnqeaEklKp42xdAHq3t1MfWrurLdj2XUuE92RfxrTbNfNfwy4+uoShpj/4tPUxi
 y8fubgeboAwcb8y/CMawbCWA5Pi0B4TNKcU/FwsFcmhqGgZY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfXwrc9Nk7vxPfH
 grCC+pWheshxPoKYM95Uo/3bp0hBvGAeSAU1C4u+QhEOQdWo3xJmqMjOlwIJS/k4D4oobD2DwF7
 km5jHS32FhCInh9/BEYBVQjN+goVCTc=
X-Proofpoint-ORIG-GUID: AcyVBI19iw3ugA77aXHjLuxWqp4kwWrX
X-Proofpoint-GUID: AcyVBI19iw3ugA77aXHjLuxWqp4kwWrX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX8BDdYmW63/B6
 0xsh+p1IqlN25ZbP710293NLPeIf5KFXw8PFfVEqWxUeskm4q6PH+uKoL+WP0iOrND2ybi2C4ml
 G3ZCxsAcnxeeV1rqkgJmFH1fC0KDTPYvrdYODGWzSaRtrj3UxBtIVcNYWlCKPFWtF3tHR/f9OKE
 2B3ARfjFeKpma7TLcYa7QfoisCOZ4L6MCG7dfZCN2Djz5GsxC7l3JW3diF6ak3LW75JZAWcAJGM
 2HjxgsumvRQAkm5rmaUF8LEonl501Tw3N/YxHE8zoGIIkDTgskXgtElw4Jmi0/8dSfCAtwbQAbA
 stq8MKJ/REs6/zYjcS9EjasEWJKJvuN3GieQJo+SS9+0PLq3CH/f99IDt0/IeT3QlRmTHjQXL5P
 elTc0OrwevVFboxmkHjxhOaSF7E5aNGHh4Q9YRWwbbly5cB2aTRL9HXrEnbqh3a0P7/EKbGIcQH
 S/SgKtAxKQG9Ztpgl+w==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5fe50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=k5xu95HCNwnmwRhsQXIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

The SM8150 HDK can be fitted with a display card carrying a Truly
NT36850 WQHD dual-DSI panel. It uses the PM8150L WLED for the backlight
and LCDB for the bias rails, and it is mutually exclusive with the
on-board LT9611 HDMI bridge.

Only two of the three WLED strings are connected on the card: the
backlight stays dark and the boost runs into the overvoltage limit if
only the third string is driven.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sm8150-hdk-display-card.dtso     | 113 +++++++++++++++++++++
 2 files changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 85d06a950b4a..571bda210d63 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -409,6 +409,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-nothing-spacewar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-xiaomi-lisa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm7325-xiaomi-taoyao.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
+
+sm8150-hdk-display-card-dtbs	:= sm8150-hdk.dtb sm8150-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8150-hdk-display-card.dtso
new file mode 100644
index 000000000000..bd57459f9c86
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk-display-card.dtso
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/*
+ * Display Card kit overlay.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "truly,wqhd60-nt36850";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l14a_1p8>;
+		avdd-supply = <&pm8150l_lcdb_ldo>;
+		avee-supply = <&pm8150l_lcdb_ncp>;
+
+		backlight = <&pm8150l_wled>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				panel0_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				panel1_in: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pm8150l_lcdb {
+	status = "okay";
+};
+
+&pm8150l_lcdb_ldo {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm8150l_lcdb_ncp {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&pm8150l_wled {
+	qcom,num-strings = <2>;
+
+	status = "okay";
+};
+
+&tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio8";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.47.3

