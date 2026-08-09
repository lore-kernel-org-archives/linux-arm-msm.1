Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFFA1C2AA
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 14:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284522; cv=none; b=D6bqbcQQAUK74RRf1pZrAuOF+6vf2Yirn4iGCttWwCxcvlvrIaNhuqeRuJFdqoxke9oYRIeTlazsR1t+fiJfkJ+ZN/1l77wbRrbbyTVSRmSMray1VLLjlXomIlWhu/K1FhTRLpRVPj1GOJP0Cct1eoV51CTr5/Nhf6Nz6n/wHck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284522; c=relaxed/simple;
	bh=4M2nmeseQs63i7tw5CIjqo1y7WPD+SUyKRCXT5w5eBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shqbzUMOU3zdjSx//G0geLgGSkFpMvvgxgBddf8mXVoqGYF1SFPqXmNTQt6knguiSLat7ldXFTCWszIjLvWpf502u9cKX1HwtGFCz0LAq0Su0kZFAt2EOzb2NTOHppCSpSt+P+XWgaIReCxildiee/TdcAKCr7GjMjnNUVv86LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fa/M+Jl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ML5f/cIj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fa/M+Jl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ML5f/cIj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1MI92729995
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 14:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3zaPDRYYYoX1qeh2R8vvELJqfgXECRLJOtwxMSnza4=; b=Fa/M+Jl4mfVAsoHH
	o9hZEL2xdjeVqIDjAc4V9qi93nTj9WpgOGQ3ebqo0u9j+Ef1axTMvnqwp0Uh6wbF
	9IoqmwvxT3lCByjtWJsTmwca5VcADTfd7TZ5iQ/xWxESHbsKe8AkgBKmGuRSgrd1
	DPZGLsu9jQaMKy2JQG8//Q1rPnO8885jr8A8pvhRxC7QWeKJVkDKUCHZzjbkheen
	LriBioj/XtkMP2gRHDypACxRhbtHEtdHtDmh+3b5uHhB3YJrCdtFgFMiBx5vOxI1
	yzv0AXyt1qD3O7eIPwSMAV4C53jZfTYrL8IUoKlveJPspKdC28FiPa21zT4wx/Ji
	GomOfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvp1jx4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:08:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so1479336a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284520; x=1786889320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3zaPDRYYYoX1qeh2R8vvELJqfgXECRLJOtwxMSnza4=;
        b=ML5f/cIj78ffdfLmNJsghmJvPp4wpCx8ZvusrfxIZWCeTD4p7jvDaDg34encwW2YCk
         OBJ9jxxDmKDe7WvPEE3CUUYEcW5zkBnz2i3PzZthZWEB6rQty5HV01rEugxZhM9/QdAs
         YIT2lXLS+0uy3jbDk2CVLeoxUe516E0s2ctshoGGCSLf8aOjg+KukvdDMUqwDX6MRpZ3
         VcJXshFvdGi3fPs3hqeMj1VmZuaW4CeHyHG/XMunyZQ92CZ0jHa5tRA+GeTGLEq+dgOd
         Ii0mXbheiyGoTRhOQ2AQSDqnH2X5lb6w+Iaho4696PEqEtcWpiHYctG5/r799ECAGucL
         rhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284520; x=1786889320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3zaPDRYYYoX1qeh2R8vvELJqfgXECRLJOtwxMSnza4=;
        b=bc9KLiijEeRdPJ4OnwhoIyMzAcpgyU4PnYlR5gbLddC/yM99vPwnvipIUTaQxOORvj
         eG3YeVZtVG7xaByf2Sy9FcYVF1AbXHfSU0x2SdOTEWMezxvX03tv6607egAZ7V4VB5FV
         mDOYj+EOsFkC8wXJE81vmfJyPUoQS3AWfimWu+7YGgbZTNdy4PMMbtWhS2/Qkwe7EtNq
         tRAZaQoxjddJF+v5JDJ33L9UUK2ZrHCgW7q0XFKJVnOAw0if99IY1l3wExFP1/9A7EZM
         7+ApCZHoInrGpKtdkMxSqXqtzv6cAwQoVbqXmo0Bgoig/ZEZbv8wL5/BpzGL9QaAH9HG
         aQVw==
X-Gm-Message-State: AOJu0YzdkcW9OyI9a9Ef+lTmYnl10zDQdLNXUlr+TqGiVoP/f32eAwfi
	+oJT4FVzkDVnG+FtSfw9XVmvHDLGGHVR3KOqiONzQ/aH0APfj0uy1EMO2oLkhH23bReHs7bhQOy
	DtvBoH23WNRWOtNXUyVNuNge6m7by38d5fI2OJW0DiZjHxuKkRNBsNBHb30ZbLTiqCokl
X-Gm-Gg: AR+sD12i3QiGj3z8pfqElEldyMQbG8h1BBrmVoGzmuh2wI5yo0J0XOH35SKKh/8iEb/
	972VsY/5kBH+5UdnohiOWXWRQf7UphFm2Vuj1zvpyhJXV3xYDz4E0nQ+E+pCfp8BY/NCqujjN4G
	HIHoRSp4kUwuDwJX+FiWeuD4tK107Cp8ABJD6NB/Unmr+2t2vHH5PqLnIeZOOyKChbqW1uQEaos
	ecqjk2lImsFHIiNu6YqSzRcdzcePiZ1ZnPQZkitoURDJ5327ftbAAY2h//jsIShaAtSxX+v0GSt
	8JcIHcitYqllN0Xvx9ZipHRL5G3IqaT0oa7cfIV1BVHnqSdAMAkWSzJHY5tK7ZaQjik4q9WXA6m
	MqISeiR2wxisQDLs2FYY=
X-Received: by 2002:a17:90a:e7c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-392822bf267mr10282454a91.2.1786284519940;
        Sun, 09 Aug 2026 07:08:39 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c4:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-392822bf267mr10282422a91.2.1786284519496;
        Sun, 09 Aug 2026 07:08:39 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:39 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 19:37:53 +0530
Subject: [PATCH v5 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-shikra_adc_support-v5-3-bf6882d18bad@oss.qualcomm.com>
References: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
In-Reply-To: <20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=3930;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=4M2nmeseQs63i7tw5CIjqo1y7WPD+SUyKRCXT5w5eBc=;
 b=5Uz+9rDCl7iV3/+b+ifFPRitylB3u7zRr1n/d9fqP1W3X3eAzneagA1IbAMIJCT9UCYz0o8vm
 G7R3ijUDaiGA67Y2n5oxbVfSJk4AF/H0blfdpeg18UCKLgNSfqkTqo0
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX2oq8lb3VNo6k
 eg+04aat8VHgb0HpU0uSmOhl+ds7Aft5ctRfG3D2TFQ0ce4ulqJif17drQTN66UDA3RvFlqREs7
 U9NMIlWOfitXUOFUuZRdnJgLGhp9QpNS6/SDHzpT1o+4/30Ia4nB/Vk3k2flaU0cOpPBFKMXPsw
 6ysfXqBykmacHlj8X1GOlKNwhA3YutKUT5yOSu+OHG2DdrqJWCOj44ZDxnHorHED51+Ybwkvl5D
 PLd6lpAyZ8TTXQJAolHeC78mSkgpfIsKd9LkfavFKRYW0WHR6nNupsgq9Iw4YTxbk2PoDQ5dhIu
 hFz4JcTq9Zrn23ToeuYLX+BZX1CaDK+9/toP/eDx23o9qocW1FIBuur177hfo7QQAH1jzgwBGDJ
 bXtExEHefT6YjEjyvlGL8lCqX3XL60J6EhSQTtQq8umMlbwfnUiLqZtUy/dJIuzVPMq/5ca8jBe
 nUi4i3dw0Gpx/hE2C+A==
X-Proofpoint-GUID: wQ2_avV1TJnrGSgGvOjAhjoTRV7gyxlN
X-Proofpoint-ORIG-GUID: wQ2_avV1TJnrGSgGvOjAhjoTRV7gyxlN
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a7889e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XPlkfCdyFubSKYJrR1oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX0NmhFz8WjxlK
 5Rqq7ecEyvfm9GDmcN60Il6yOEwha2qYA/CRLR/3RrdNma6XRRJ1LUnBQ8x9xhjeg7mMWlnedfe
 V3VCnUBhC6Ug46BZU7SFoRZ+VNPW+4o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

Add ADC channels for pa, quiet and msm thermistors along with
their ADC thermal bridge nodes and thermal zones for PMIC
thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..9caff1a70d13 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -32,6 +33,68 @@ key-volume-up {
 		};
 	};
 
+	msm_therm_bridge: msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pa_therm_bridge: pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	quiet_therm_bridge: quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&pa_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&quiet_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			thermal-sensors = <&msm_therm_bridge>;
+
+			trips {
+				active-config0 {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -69,7 +132,64 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+};
+
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;

-- 
2.43.0

