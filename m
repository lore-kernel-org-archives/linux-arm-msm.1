Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E434EFFC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613431; cv=none; b=te84/BaD0Q1VzEb6wO9cWtKn2kONMaAkem/wg1hzZ6W/Osfw0xDD0EJ3IE9Iorsu1nfJxXl9FP039JSX0CfwGFP5MWj4LriEovhLST2Gh6HQJvtxKNlMflb6vS7iaFA3rqU+vBRc+vVz5bpQBTybqcnS2i3kGhnoA89ip+/6hMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613431; c=relaxed/simple;
	bh=bw3lRk27DYHr1IzAGaOF70J1YE4CAQr6Ctzh6DIASCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iNboiWm5+He1mK++soiBhsiEpxD0FOhG2XVERjnUr0MIqg+P87R9ghsltL654eVLVXQ8tdilDNHD6UQ846UPmyEVCeqOYnARFMnBwtwPsZb45HXno/j7OesXNFt8iQTZd1I38dJGq91zhg9SJU2pMAOU6rXAqbvDHWm0Ko+IAvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMxu8FAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8d2sW9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMxu8FAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8d2sW9T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdwp21895323
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=; b=PMxu8FAdFR3MnOlj
	YTuyYPuaHtlBiSBeMcDp3kLTjgV8vLEtIrGq5OvwGWDKZpCq9jnVSXN+QViQDGIY
	xgG4qHv/Dv+8qZrvB7r5haOHCcLwPvwCJV/ZT5S8OLElFAg+4oTHC6ECvXeQPbJy
	wUmmmT6iLU/Ak8xTdjjHCGwAYftwhV03lI2bzm+5zp4IQh0a+mPAd5aoNIkHSPvZ
	OtTTA6Yxv9Dy82k4sQMWvwSpwo73RbLnB5vtH5M1J6+DYTwaHW5o1i1VG86AD7r5
	rQUzULx8P2wKeTmZ1VU/sGWK6UDKUkLWgV3uwZutp55YR1vt4wPJt5nd4v93MgBI
	y6G0ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s2hv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:37:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5329e965ba3so51025891cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613427; x=1791218227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=b8d2sW9TMMVE9C0KwhFIUUheFbtglX4JFbH6d1pi9D11NAUOvkGwTzxg3okLaCNaHZ
         ER0Pt2Fbsf1qK6toPxaAwNM98pEny7Qy8Vpwn2ZXH5t3MP3V7z+zg8WJYjSkfnsvqfD2
         et6FivwzLVF7J7DqQCvP6AYoqtFrYlDuUGeNf9CgTKJH3YJiGU/+xbqAPYGXB4EnIAde
         6SDQAJsWl39rqMeXI7BMORr2kyGYXfY8v69A6OzN2gKk8W2te+D3chv3N75lEPKWJgwS
         tgGx7LqUq6A5boEfbedwCH+d5+yJRPCkU4gF+SWEhdwasI4LyEN2jErDOQat0QBJJNKx
         cgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613427; x=1791218227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3/hZ+aQt6/4TqWRyRqscOyRiPQOnfwCCtusSAbWeXQ=;
        b=DkuHRFExaPHwvkRdy9xFekOq/+/ZHXAVI7cYAWmsexS0sqm1dHetO6MjNY4fZZdQMP
         ztsskIIFXPJIuyLRVBGPm+vj0uEMkN4zgxOhTSYE2kFmmNK7heAyFRVT0dwj1rEDmovY
         LCM3C95L9K6qtHGsjp16vPjxU2TXw4UkfMIGUVZqMCaBJ6kAogs75OZDTp9IcqB5Wmb0
         uZFZnWDsoX42Y9JiL6wP1cRZCgGTflT393Nk+tU5y62wmfevMZSlZi/0A7B0VQWsrMqn
         RnzslVcIA5QkIeFfe9O7oQ0xq2PHP7pM4huGLc8jF4GAkmwDk3RCW4Xcf0/AEnfyWypa
         JyGg==
X-Gm-Message-State: AFuF++nSgWu4iM8USZOVHSwSwqdZjI9oslPR/AfBC3qJ/0cfgyCtcLh4
	CBx6eKvEcdUnzztdRJzispOkhA4pDyhbeL9QFXztKyzEKzjT4TM/3yC7OxvINitPUqycEKtNb+3
	Rf93WtFs9qmXXVzCl57Lq20nvIEH9wiwxkuoHbJcvVnHeA2vu0b0BLpKACxv7ALSlNmvVzssTos
	H+
X-Gm-Gg: AYBFou1I2kfI03ZsUz4VCXS4clI9b53p5q8YrI57ZyAxKrYdImRghvjfcied2Bxq9U4
	u4mL/AHEK7EXEZOP2liZqrHeWE8XhwvqNbr1M6AQTsNvjCnk4/6RIa9iHcSjjWTPK+kxjm5SpZ2
	+3/JTJG9ilrKsf7FOGiWRrwU4Zvn/4Zz+wDHM/21Nwj0dIxcvVu4OifoyIVWRZYhYax1eNPZ693
	W/Ljm0/VeE4VVkUTi9Dh/8aHPiPb37ModGIiMyEBLyQt/Il1cBeck0Kc003OZJnmtkbMgdWSxlZ
	fyYPe5LWNHs74fGToIbVILI+D8EO+mMgIE1I11mm8lcMf0/+RsbRO14Z74SjLL4oy6ORCWVowHu
	db9/Uzr8b
X-Received: by 2002:a05:620a:700f:b0:939:15e:1a5 with SMTP id af79cd13be357-93c43cb66d2mr2246806785a.35.1790613426694;
        Mon, 28 Sep 2026 09:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:700f:b0:939:15e:1a5 with SMTP id af79cd13be357-93c43cb66d2mr2246795885a.35.1790613426033;
        Mon, 28 Sep 2026 09:37:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm28442084f8f.26.2026.09.28.09.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:37:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 19:36:51 +0300
Subject: [PATCH v3 2/5] arm64: dts: qcom: eliza-cqs-evk: Move sound card
 support to Eliza EVK generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-dts-qcom-eliza-add-ufs-variant-v3-2-9a2fdbf6baf2@oss.qualcomm.com>
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=9216;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=bw3lRk27DYHr1IzAGaOF70J1YE4CAQr6Ctzh6DIASCw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqupemhEVyOFISlgRfiDzZYyW09JDUjVeXlFjKO
 +J+NxF2JRCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarqXpgAKCRAbX0TJAJUV
 VqreD/9wKw+6mLUFSQoDJ1MAl4Ti4wFGkv3z34sWkN0xpkI28m1vzFvMKVWAtjIpns/PhtT6Roj
 zAzJ7EiCAhKPqhjZLwtd/GbaCUxr7iT/Z77jwT828enyRvNY51oPfQ80WlqbiYuEc3Z+YEPFZQy
 /T+MOgRE7OxakER78/lpK5rwv6mdaxeWYOZm12oK2wjY5rCYPiXNaR8hKsf2PhhxEDd54g2onIL
 a0DLeuAHbeV9fZqUPLoqJBcdJaoDZ7+pkFgfKxXT/rWAUIwfORlTfpPXNSXJcbtRqTXhOmGrYuT
 S07SIWfJwbZQsSPSx1evRJWCpEJs8hJ90l4WZnqAlNLL1m/3pBpsFjKX9sS4ykb2ytVe7ueT/49
 Y7fPfjSLzOw9xe7xoxNhBVxfc1Qig8cQgTo+pvixQ6DVx9UXpckxh4GA/3htHMeFPKJxrhC/eST
 83B2FRbgHsO9COYlCeDaKEXbMNpQITHuw+5Yq+W+d3SabsU6Ha+5GVY+wsGIZnG7fDedujWoMuf
 +/B6BWaw37+lu9oiQ7zGYJcU8cKQfAmUSGiOFC35suyrHDV4fvVUo6c1aF2N7sWradAsbvoWPNi
 B7iP1bRNHzSrYsrcl3E5XUL2+hFPzbjXYxCkdNG7hqWRemiyOMhd3Qyi8xanRAvZrPha+Y40bSk
 IG1XJmg9LdmWfZQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXyZve2F8s25W8
 g4AX++i8B0/B6MxAOHoyvaub1r2XO0zbaQ/3dnFanP76IjCQrBw3jvqxUuULvZne+GqUAKi9QHT
 ZT3HI9aBsLHil10Wa9o2B/XPKCQFf9SfwhZ4gIBRTr5DQunmxFmfEPwIZIRaoGnpTbshCdoCacA
 ItzTkj0jMtMnKgi9U23WxO1Rg4kRLJJx2OgM97fnVPYdgLSnj+HOcvNaSwqFIAtvxKXwWJ7j9SL
 zZ7diCZ1bGyO/KK7bqDZSg+dUoorQCyOMhDnG3FLspWCdOh4p7DA4WG5glMTB96Isvxd84xjWzw
 kFy4zYPku0Kc6FA53o5hQrOpwn4dON/cjrvhh2c0UznEq1zyaX2HZ1SV1QnVkXh/4ksHrG7XPuS
 n6xrYprvR9Zjj6FNhrQQPnuHP+Yezce4ry9B0KyEEkf1uyziqsvDdmYfgQ15Mz7ZOynEajDZ8lX
 Qpque4fxJoxGYG7o3vw==
X-Proofpoint-ORIG-GUID: 5F699VRUyit94fPRCeoy1gVNs3j2lJlt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX8ELo1aAzsS7k
 n3NLgQTNQ3GHwigmzX8JUEVOMEoG60qnoCdDx1cAWDeWwYS5TMHrUhqSqfojp70zIsCwWbZmwMo
 9N7daDLcPe/7Pmu7YMvUGXN2RGQ8f4M=
X-Proofpoint-GUID: 5F699VRUyit94fPRCeoy1gVNs3j2lJlt
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba97b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=igo63PMTUtHa8Wayq9QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

The sound card support is the same across all variants of the Eliza
EVK. That means we can reuse it even for Eliza CQM EVK later.

So move the sound related nodes from Eliza CQS EVK to Eliza EVK generic
implementation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 141 -----------------------------
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 139 ++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+), 141 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
index 5e4175291f05..43d428a4ed2d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -5,151 +5,10 @@
 
 /dts-v1/;
 
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
 #include "eliza-cqs-som.dtsi"
 #include "eliza-evk.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
 	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
-
-	sound {
-		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
-		model = "eliza-cqs-evk";
-
-		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
-				"SpkrRight IN", "WSA_SPK2 OUT",
-				"VA DMIC0", "vdd-micb",
-				"VA DMIC1", "vdd-micb",
-				"VA DMIC2", "vdd-micb",
-				"VA DMIC3", "vdd-micb",
-				"VA DMIC4", "vdd-micb",
-				"VA DMIC5", "vdd-micb",
-				"VA DMIC6", "vdd-micb",
-				"VA DMIC7", "vdd-micb";
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	dmic_eldo: regulator-dmic-eldo {
-		compatible = "regulator-fixed";
-		regulator-name = "dmic-eldo";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vreg_bob>;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
-		    <&dmic45_default>, <&dmic67_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&dmic_eldo>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&swr0 {
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	/* WSA8845, Speaker Left */
-	left_spkr: speaker@0,0 {
-		compatible = "sdw20217020400";
-		reg = <0 0>;
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrLeft";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Speaker Right */
-	right_spkr: speaker@0,1 {
-		compatible = "sdw20217020400";
-		reg = <0 1>;
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-		vdd-1p8-supply = <&vreg_l7b>;
-		vdd-io-supply = <&vreg_l7b>;
-
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "SpkrRight";
-
-		/*
-		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
-		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
-		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
-		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
-		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
-		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
-		 */
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio59";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio79";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
 };
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 6c5cc47a183e..726fd8dd6c0d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
 / {
 	aliases {
 		serial0 = &uart13;
@@ -63,6 +65,55 @@ pmic_glink_ss_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
+		model = "eliza-cqs-evk";
+
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb",
+				"VA DMIC4", "vdd-micb",
+				"VA DMIC5", "vdd-micb",
+				"VA DMIC6", "vdd-micb",
+				"VA DMIC7", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_0p9: regulator-0v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_0P9";
@@ -94,6 +145,16 @@ vreg_pcie_m_3p3: regulator-3p3 {
 		enable-active-high;
 	};
 
+	dmic_eldo: regulator-dmic-eldo {
+		compatible = "regulator-fixed";
+		regulator-name = "dmic-eldo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&vreg_bob>;
+	};
+
 	connector-0 {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
@@ -148,6 +209,15 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
+		    <&dmic45_default>, <&dmic67_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&dmic_eldo>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie0 {
 	status = "okay";
 };
@@ -197,12 +267,81 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&swr0 {
+	pinctrl-0 = <&wsa_swr_active>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	/* WSA8845, Speaker Left */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 59 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1  (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2  (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3  (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker Right */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_2_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+		vdd-1p8-supply = <&vreg_l7b>;
+		vdd-io-supply = <&vreg_l7b>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4  (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5  (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6  (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7  (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
+	};
+};
+
 &tlmm {
 	sd_cd: sd-cd-state {
 		pins = "gpio58";
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio59";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
 };
 
 &pcie1 {

-- 
2.54.0

