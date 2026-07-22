Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E1353A86
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727716; cv=none; b=ekP4P8c35XHtIHVmSivrN7CtrzzXgeS1Xht5TWvVUTlyiwiEz1XjJjFTgyE5jhdaHitTRbwTugz2xdMTtiHKfLMfFcaTPGBH7+WoNinuqBTH8J4OAPo20OlgaI+POMLA653MOovjl5+AnKH3iE0Kw+iAzoJPa9aUAI75ujUFgQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727716; c=relaxed/simple;
	bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vmr26tzZ680Ub8DAh0ppFnKtJtEEIXx7hL9wLjFxIeyJAN5YzTYxiX5/FXRmszbgW5M15/6erkI28WyAsss8Q2um9sqDv5Wcaw3gCsG/LxSPzfyPadoSEBbvYQkusr/9CC5bzuHZtQCfhYC0Hhl6SBT1SidzctC8m5aDKPclCUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddxO+K0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwBIMwB6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddxO+K0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwBIMwB6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWpP2860810
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=; b=ddxO+K0d6DAx7hJI
	K0TFT/vFf4ZWPMxfkUpGKYFsZR80MXXpyXovIqsHKpZOafu0LrB1DYXLQRanGfom
	zeBTwjrPCXz6jWmRziWJnh7eo1DT23J3VkJZ8tVxk0Ht2ZHhfzAoCLDYK1+F6iaw
	2HMFxLqzTT0DvcotqKksMFapGv2cuDKCRkvXySfU1lBnHyprI4QF/iJA5VJQGBOx
	khiCGSpPP1i4Ehih4czlPDWlO2yC8TYe/MPvUZIbww7HpZnjBMNMdSds5tFj9XBg
	yN/6GLZYuf87E1sKRoVmceTP8Y3D/d7dTmPJHrGc8jQyGco7n5jQyAxz71urkbqd
	1NO2nw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn2cjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:41:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso157686375ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727713; x=1785332513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=hwBIMwB6HveoQQkcg31RZ52a8dKyNE6DiUuY3U+7r7vip9d4PYY6efg9dhQ2GzTgKl
         rvidcXeCLf7Dkee5tUu3ZM9tBwkv1alRkBwsLNYgRD7xPJYxegNgaOGU9QWVHQY6wXxC
         AmIy52otY3TAlELYQeug2gR8HANgXs3FcyaxnBTMLEFQrrTlLEq8ychzzBhcwx1zD8/+
         ivOGCxz0UojwMisTB+SGeZYc8qXfBhjVb0NfpYMyWyTvNoz5+dIWW6xWYslJqwZsTGzT
         HSEHFAVl02coqagWWt313ZZDl6xkaFldLScfzs/TVwjUrlkDzc9SCkVR/ZO9OxqJ/RY6
         oVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727713; x=1785332513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZQFkX5FyhxLaY5DKTWnVBymP0x+xEb9jOdyAO3+SJA=;
        b=Fd34Exd+ZT9wHKE3yKMSuGUoOpcwa6v+EgjLZja6jwg8RR0Rl7/1CNNbn1PL0Fdjkn
         h+95jSdv8PY6rcL7qqVBEBszfJw0DW43Es0UExHRoEO+2kun07OO1mCQWZEYjberUKQ4
         Fkz4MOYqZjRuNi67t3QDggSpaojiyOLKQM6mNIcy0vbuSDOlxNfhbEbAowJyZBE4hx25
         T3f2/IPTe7OkDsIVtRQtfqsBQ5FpXPNV3wXNOO10kGpucMfd6heenqNbjsRYxeIRh4lT
         d8ZK4EHy1aXPBimfzjQoAwmM6QUK0nDyaWFBvCE0Vc2BOUwtldBwN+L1dToTlSxeUeQZ
         BSGw==
X-Gm-Message-State: AOJu0YybszwN2jYMQyG3O210zHqScdBWR9vqzF22V0osaRBg0BxDE6tv
	SRMmoLtIEtNOQzptf+kxUzV/DR/7FjAqe+Vm9BBG/sw5Cn5cPLUmIqJXJQIF9PBVM1oT5+3te1g
	NqZsWZyBJuGp/Mf5BQwue5HbTaS8/4wE89kmvsum/AHm5txgh7Pq8Em6x5WXz9vr6bnrT
X-Gm-Gg: AR+sD10d0a5Jkad2lyPC3bp/KTZ+bxGDyxrSoVAyis+rx6bLEtr8/V06KK7fT3ewoYc
	aZiLN6ofs2ZGu2uO0fOuAjro6PEmFbxMUsPwflExqDWT/2l937p+ZrHO1dM4ah+z8n6tNYxL51r
	oaGUqdtqLF/jZJUfa830amN6oOBR7Xzy1RGmFdr/3IIJrMlJTQ5RfYl/wlKnM3DBMl8m7Ko2XND
	X66pXuJLgcy+z0hWP1hsy5o1E9bH90Sy3i1yKkSN/Slem5b6Uz8FPhK+QvIji6pzI7Oukfn1xhM
	W2I7n5NFswI8Qg5eKqPl5//4KGGRpUwuaTzzj+YmRYJhv2scugPYjKg0CNh5Tkbh1vliX7uqSLP
	S6IEbMpItqG+smhjkOpSKUX76h6JzTQT8Cis=
X-Received: by 2002:a17:902:f64d:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cf349d30b8mr275356455ad.42.1784727712767;
        Wed, 22 Jul 2026 06:41:52 -0700 (PDT)
X-Received: by 2002:a17:902:f64d:b0:2cc:df15:91de with SMTP id d9443c01a7336-2cf349d30b8mr275356085ad.42.1784727712355;
        Wed, 22 Jul 2026 06:41:52 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b46absm15186705ad.80.2026.07.22.06.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:41:51 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:11:20 +0530
Subject: [PATCH v5 3/4] arm64: dts: qcom: shikra: Add Iris video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-shikra_vpu-v5-3-3d80babd4672@oss.qualcomm.com>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
In-Reply-To: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784727691; l=3402;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=dRdzRZtDzTUzOIxXxBGHyusYw2nh12RXvgdIDJYpbbs=;
 b=szCEPW88ebjQirI778+EQXCYnVO/lZfIs3WmxDgTXeJc/OEhsGGS3ZVQ91RVjKLah2bThZVUD
 k/toE3a+CfrCAj4AnFm4nG9c78M74FNi3GEoReijxrNYXdgij9NQ/qM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c8a1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qMXWHOQDURcJ0nTM7qwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: gzGx1Su02BqwvTFO-BCdWqg4Jg4c_xDN
X-Proofpoint-ORIG-GUID: gzGx1Su02BqwvTFO-BCdWqg4Jg4c_xDN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX8rR5e9T9ieaT
 ijZjsiDti58t65bOWnskfTlxklY0QlTSf2W3myU3NyVfwb1rCeY9wwBYDhHgSGPIn2mcWj7qq3p
 oG2y/KIwAiLme7RMDFvv2VsX5I1hJ7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfX5yt7Li1KLKp9
 mzhFk7YXx/jmjgynK5uppL7SUheVDho8FrvFtOPTnXHqfnaoBnQBGZGS/KEasifsfTp+Jdruo7G
 zS5Iv5VSAI+eaUaE0KHUKjgElVWCMNFLRkwOWQuTMqyYFQl5qn5JNEwJ3Qxdlb/2wJUxu323Sln
 RhLv2a6a766l7ba34dZ261VsLjJX8ZPFzPIDXaWNFKZfVXbY7Xkoe6eDOjbSRrXr/VEqX0yui4A
 B8DGRiaQjDUnUEgaEi42e+MAv46mgXU7mkEL7cwfXF57U726BCMNk/3WQC30LtFtOvVoipfeCzv
 U7DIf2Tq6CTD5DgEIKNQES9u37xLKms/Jj6MGEHASSf29rHt2CMtJ5TKZcUq0UuKpHsDFtYjdiJ
 hbd9UQe5r63x5PJ8tPZWmioSHYqck7uPDU91ZNhC1A/NZoaXCED0B8Z589UTq74eVo8+3aoi0wt
 L35d/PF0h929YI2Omyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220134

Add the Iris video codec device tree node for the Shikra platform.

Shikra reuses the QCM2290-class video hardware and programming model.
The video node is added to describe the Iris based video decoder
encoder block, allowing the media driver to probe and initialize
the hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2a131ae601a7040142da16e39dbe2f8563ef43ee..8449af599cfc501bf17904c7533b0796948f8fb3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -314,6 +314,16 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 			reg = <0x0 0xb4702000 0x0 0x40000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocation above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -655,6 +665,67 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@5a00000 {
+			compatible = "qcom,shikra-venus", "qcom,qcm2290-venus";
+			reg = <0x0 0x05a00000 0x0 0x200000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&video_mem>, <&iris_iova>;
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			iommus = <&apps_smmu 0x780 0x20>;
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.34.1

