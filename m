Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A554AA3ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053588; cv=none; b=KvTs7TrNLn6vZb4CTSWx8KjdogBVeuHhxIREIz31GCZuD9JZL/n4yoE6eDpWadYTVPscivsL/9ptF5WjXcSMt0yVY6WabeKnf2O+uKzXmK425JvRsmzDi+fbDTBvgFQmAhxNpmFz7SPpZZ5wtNyc7reCrPCyzcr0pSZHAAQ87+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053588; c=relaxed/simple;
	bh=lPeEe7tz+0YSnJKsAf50jnjdmdW341RGDSdUQ921plk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WAl0Q5zCncIQbEsmyh6FdBgSeTJF2QkStD5LkdqDmj91aqIV5ksUjAMc1D1dcPqPhPOZgYyRwLOSz1Mep0kweHFs7zD8eh/oP53xKE2zo73XGnMUaHncwb4p1QMI6r7oXYKx8raotnxz1FwXnCOjWJtW9B/RqYFDaYplkTjqfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeKAWu+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiNw5KNc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeKAWu+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiNw5KNc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6rQ1U1682876
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=; b=XeKAWu+8nTF+m3il
	2lHqIQAZSM36hW4nCyCo4ca68w2UCt10w9/1pgcd69mNWCcWvbEnSVB5w+hH5ZYG
	NNuOlT9vLiqflMUcUAha4NSP+RpRiUWEHO0+FyX1b/q4HyL8LPxRVG0PdYSmy2WF
	tA5qroFF5Zzwm1gyTY8jrZ8dD5FoYMHIuLbZfviIxZp+8cDhjcHeFzLggyF6fRr2
	gg2NNzA7H6vuZtIV98u6Ycd+ZdVwRGwBLftk8x8i5KY/ougHd5UmLnn3n4Qgt7kD
	73AruOL75hr20aWjYnSvmXGwAhGRGlE1ikf1ISCYj0z7kD7h6RmhasELwsLNW4Ty
	evAhHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03jsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:39:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so1018244885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053584; x=1792658384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=;
        b=SiNw5KNcLe6S33bbfyo1xei7+Xdu2roeKG20IQH9S2cRjW+XgiXJX7PxcSqyVI+Yl+
         SwWmn/H4xwDFmdZvRhBZ90qBSr/r5cQogDAqRXe17XSLC9fwaF3K+yVqILLBJwJNEb+w
         jt4B/4BVq4y1WRPQxv2oakqadLSWUAocDS+RLJyeHJrc1wizwc8P59HMCAeCR8235pDf
         hshSq32/1Shf0Y98Z7AL4Bzll8sNgUpw/qybWEHOA3tLIZtNj8pg/EOkOpEiee/TMEHt
         MIcPaAwBRxbj2107rmlaCkmuhDcsa+tjBC7kge5R9AURTqO29ZFeM2Sha885kNc3z1sK
         y9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053584; x=1792658384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxCVevdJDei/FrP0xFIQ/25OzUVG+gGQ5ld3vJX0vpw=;
        b=N9OxR2yujjurNFw3Wy5aoz9JApIAzjNl3pI2cOuFOeWw/iC6q/tjSWgHC9e45W7xcR
         32jeUNn6TTwqCsRxkTYJGO2iKedkwrgfGSKmtpuQDaFWl4GuFYOR5VzVKyPxP9bumRsT
         iQQgWyVYp5yUT4SowyB4kgG5z6LviqG2d/duqnoRfxBuUx0bYt6E0ImFzv7NJA4Fsqb0
         nfhifVM+xfEahxDFzf9Z2Q5Bg/O7YVDoJDEFf0vt4VQX0riPe7/NFTDoVPpnvrpn9Nrj
         Q5/QYFwShzDfdPhj/1d3tIw/fZno5qcCHXceeq33VBK9qHkxoF7JWbly3ShaNKcDlyI1
         y8iA==
X-Gm-Message-State: AFq9FYLx/G0VxFJvfbduE9EMMIOePS1XHA6nWMeZfmrxfpiqBn0nUROv
	vBRPguUCJGzihJqRLL+7JCQwEjzhGOzs7knfK3rL5SaJfIx7yHkNENGcqMIAB416wjcm0PRM4ly
	VohNk0sOdVT4m23hjJ4iawjQ3CEPpuY5sEc27iAl5oMR3azLHZ9Cy3KfI4ijBp8SW0RYA
X-Gm-Gg: AYBFou0NkOhBGVmngb2HvqhpoAiGBbBN31qkWRkIDUwa3csE9c7Wq+78HFNNExh2Q2Y
	eLke7UE2YrhpSCyFa8Q2bJu0ETr+m6i1pcJgvu2+CRurtbE68ASJF1tdjd/oq8zPSw2Bjj8jff6
	jE9EdIIeQ9j1XlPrA4iNszq6Stn8fJ2i1vYFuVFxX6m8DYVpWbjIt+b/1Xgj+dDF0+DeAyRVwx7
	XmI9JWbOKeT6ffBEhY9CsUydheYZBvC1b8hXybqjkFXOfQyIU+m6NGUGTia+cS5j5dGsm87xlhY
	vawZpvzOTv5uNJXq7XtD6Ig2+dXIQ0t8I58PSU45sz1hW4LSv/kJo+eVI5E5g69eOKky4f5Pb32
	uH47p8IKMywzeqbGBDxwXxE8+kOCdoEf/bIzBhds0B8KQKuc8vgpLN9i0DQ8D7LAg4VHCNhxu5u
	zj87nYtQnpvr99
X-Received: by 2002:a05:620a:6489:b0:93e:9171:b82 with SMTP id af79cd13be357-93ebd208959mr2802418185a.36.1792053584274;
        Thu, 15 Oct 2026 01:39:44 -0700 (PDT)
X-Received: by 2002:a05:620a:6489:b0:93e:9171:b82 with SMTP id af79cd13be357-93ebd208959mr2802415285a.36.1792053583691;
        Thu, 15 Oct 2026 01:39:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:39:12 +0300
Subject: [PATCH v4 5/5] arm64: dts: qcom: sdm845-hdk: add display card
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v4-5-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3699;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lPeEe7tz+0YSnJKsAf50jnjdmdW341RGDSdUQ921plk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JE/KiJJFSOHp1Qvl9QkM40kcGJVrQLIbF4NZ
 NpZUKyKmE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRPwAKCRCLPIo+Aiko
 1aeICACcdX4Dx/PckMzaaUVlD8PnCWdqIzMq7iBJ53ZUgelXF/Ge4z/kW/N3OXwPXoDu+Pg0dFm
 gxLf6AhnmvNlCVDEcbWTX6nvt9USbz49QMeCkY2viWc9Nd1Kw5RbFayMpXa3+r1clnPnkUxaKWp
 j8WJoK1A4yfaA2t9B+ksT4rUWuRJ0zcfTmr+70NzqOzE0xPLbS/bnXiBHJbiJ3rSKESQzNjj0q2
 AcBRE59F8mPgBHQsUfMQ/tYxg0W0Dqyazn3DALX8lg3VSpHIhVs/3nC0/Mvq7PPLO6f4yBqdleH
 hYyg0Y6bKmo8J4T/qybGtTvMYQKB7lltijs1HK4DnPQ5yEvh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad09151 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=FFXsBguXHA8yshPlDHEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX5R5JWxMxNyMP
 3TcrBaJ0IoZ1xXsL+Pjs5AlNR0MZXBXg1Q5FeGgkcB0QO+58v/ffg+i6OlIkBc2q93lMpA1Bquq
 MvrByvdKxJEqoqCBSPoOH3jl5l1mdh0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX7K2wCyplEA7c
 x1msspxlOhA0v0n2BzSHRlu8uqPBK8K4wl9rRA4BNakijFu6urehqB2MrF7q5i2Ee0+BdBCYTsG
 /gY2o1GHWffOfi+bQ42TxU2cHkh04TW+7uOajjqyq3lf8sVYLMYBzotS2tpQYr/ZSoiGB7Bch+U
 opJh5+GPMUzyyf3okxZrWxMcPYIr0aNo6DjZzZe4P6waA9SKqfabi7RnwsqtNd/L4hiShsB6J7g
 RFzkUBc6T6DSoi+f9fR6BR0ue6Y14U+0bjacMADAB+lC1ZqVMZu6CaS9CJQmzOAHNrA5DsU0Jur
 7w5xGGESh8+w6zqnwZTmc1RhFBZtj2QxY0Fk1oRtTCq8ETRbmR8Dn84dBEjnJ2to55IZRxpAMM4
 Y9QH77z740ns45mNJJtphlDxWKOV5+fTON7eE+CeAeEvEfTKoy0MctfJy/D6f0yiDuQAKzPWkfe
 h2TvVWCywXX/kIy8i9g==
X-Proofpoint-ORIG-GUID: 2xDUBe0yWiSNby3eAvnSkOgDTwoDq33E
X-Proofpoint-GUID: 2xDUBe0yWiSNby3eAvnSkOgDTwoDq33E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

The SDM845 HDK can be fitted with the same display card as the SM8150
HDK, carrying a Truly NT36850 WQHD dual-DSI panel. Here it is powered
by the PMI8998 LAB/IBB and WLED, and it is mutually exclusive with the
on-board LT9611 HDMI bridge.

The configuration follows the vendor kernel, with the bias rails at the
5.5 V default of the LCD mode.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5be99934cf9f..85d06a950b4a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -356,6 +356,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-crosshatch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-google-blueline.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk.dtb
+
+sdm845-hdk-display-card-dtbs	:= sdm845-hdk.dtb sdm845-hdk-display-card.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-hdk-display-card.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
new file mode 100644
index 000000000000..1022ab096170
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-hdk-display-card.dtso
@@ -0,0 +1,109 @@
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
+
+/dts-v1/;
+/plugin/;
+
+/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
+&lt9611_codec {
+	status = "disabled";
+};
+
+&ibb {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
+};
+
+&lab {
+	regulator-min-microvolt = <5500000>;
+	regulator-max-microvolt = <5500000>;
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
+		avdd-supply = <&lab>;
+		avee-supply = <&ibb>;
+
+		backlight = <&pmi8998_wled>;
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
+&pmi8998_wled {
+	qcom,num-strings = <2>;
+	qcom,external-pfet;
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
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.47.3

