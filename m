Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2462D9EED
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123746; cv=none; b=uzocu0fxtCEtYz4yd/pbLSLCU8YXYOo+sk8qO3SEdl2rQMLVsGQDuOUBpvjkqRZ9WSkdVJMFz2lhksH3BYm2Gs+mgEpQovnbbiDdsJnQEMzWN35sdmJhXdBPTjznLDOi/QWLbKyAIGaqy20+6WZYstAKmnxmEaRR52G12xCGWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123746; c=relaxed/simple;
	bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=joVdmmp/gmCPmGFivi4Efg/7kdN/ziD6Ff2svirmA7VGT3b/532d7y/Hssu02wZ5fDifZMP2oZLN7cxSgyxeuXUYPKEH62hjn85RMA8vKA64IXZf49DcNGwDBNk/m4jRXQ+/CHHOLjMVnt5egdCABPpO/fMsc9SK0uUQUyjPHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFHIAhn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7dlHA5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFHIAhn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7dlHA5M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJm2Q734320
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=; b=BFHIAhn+mISfN1t9
	LckRa9r7KYHV+dr540xxO6F3mqGTYQASmmS7jT8rsTz+38yZKhip9zzpwa1qD6RD
	NXJlBFdeLjt50sUReZARr3OGBI7zShw4vYp/zH1mc3VqsuLo7hfIxlTV6f9IN3Tr
	owXNdtu3bOsnp62dn5a/MPNPYSKKHwOtybYSnUMSbcRgF9UNvk1WikxUn4OocwRe
	yhZuyAjVlLLmyBWSiZ4FTabsZormIsSx/ufTswwf+dcrZF/KyPOCiehkMqFW+i4g
	J+LpDUKvMo96bkwH8bI4ooDHQTYBHDYIcHIp7Hi4gb6n6Jxdy/IRA7tYtsnsOLxY
	mW3big==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq83hn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 21:02:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so4777496a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788123743; x=1788728543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=e7dlHA5MkQu77oR10liKceMrHONntO1t4ggg8f7n+y+abPjYhI8QLY1bh/RpzvXsuI
         2wrKsOnOqT26E5WL6JCLD5nnqCsc5UWyHxCtRU2WN9rMnKysT6AyPzdN8++1VVY2juAH
         zMGH85sJYK8k6THI05L/HXUCuL1zGCxxol9WaTjaoGXz3ungub17UmyZ+kuf2aZ+st7I
         LPZbltQhNryqPu/TtNWfxhB8ksx3frCGfVKEp7lWoE3lpkn5CDRdGwSaCJw8/NWsu2bZ
         yydllA5Tu2vODpbfhuUPEsjMyDwssfW3/OKdFsrxPXzQb4kkWvStCtMn3EDieeF6c/68
         oPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123743; x=1788728543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8jImfCFIp0QhmtLaoWkhsJutQo2dFJoVYFJe6BQiII=;
        b=q4rAMSplLvclny3RxFkQ/kzMIz6Bnm0mLpa+utfho8d5jlk+EQgQxzGjnXtCFXcgPw
         2AV9cY4KZ2v3FguiEHlQVreTsoIZQ9JpMGl9IEpo08wvNl7AVkRKvOPDzh3XFhQpvY1j
         ivhCy8w8n4kWpBwMzgJvd18zHp3r4Z+2euvPh3Ak+TIEpn9tqpmkoAXSagQBbYvVpIEh
         WkyU8+rzfp6vqVoEdxbvieVhjQBf80Xby84bYPGoFNKToR/2V9pSbcSHjGRXPnASe7pT
         YJewnu+aq49R3JdQj55SBo35+BKbhng1U7FZW4bQmgEkPjoR+HHVMLwiV2WWEhk5PtWs
         /1gQ==
X-Gm-Message-State: AFuF++kIzy/pdGxbn56NYhlGV0nbELJyssZDaQxPYBj/1obFbCK8Skec
	RfiYuE6diWIOx+s1t0j6Nc4CPNLcjTL5TpGlpGjwcg1lPoVhILrd9VCPkytNBQOuIYaE+GUYQR6
	gH1eighHvbVbOdRvFLCEQTsclZuFvuC7ZU46/ih4IjgTAR6S0hJWC8nwH6rnHp3+te/rv
X-Gm-Gg: AR+sD128urrvacjbuASZQ8247UHaFwSV46Vp/VmlSNlARtNViTlQ4tSBnd84Y+4cV7n
	GRL8dxehy2VdCtS/4xcEKIwUfzgY5sUOi2M8VtEGv7dGDOgecgLOw/rMJ5B8Vz+LmXxBWRirKmr
	hO81Dt+qbdDhbpjUdDekgZMYOgpftvM44pSkwAwkLpS8vufj5W41gpJ0poKOOml29a9WAzrbJKC
	O61WQRn28e3Fvl4DmdIcv3oOKv3CehafG/W9/k+CuH5L8uTTTWbJbWiP6YYYBZ0TwdAeOkubcgw
	lTB9z682/nsa2+9RCPXFtNHdM74yRQbkn+iFDvpyVZJEVNYgsvHyTp1cVR/l8Jg0P+hSLq2lJhG
	wQqRbCekhi5uqHAs6d2Bk7ftr3bGxomvOIpGF1c40dw==
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156606637.4.1788123742982;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d4b:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3d266cb67dbmr38156542637.4.1788123742580;
        Sun, 30 Aug 2026 14:02:22 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b49c867f5sm10980013eec.2.2026.08.30.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:02:21 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 21:02:03 +0000
Subject: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
In-Reply-To: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788123739; l=4383;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=3Iubn3yY0qzzYguxe6NT2uIvj1sb1cJ5GS3fGjumoj4=;
 b=I7ACeisDbTUKW+hx2+sYwC8SpI6bKi0sxAYp5rtPFlFB+PhBr9KWkjE/zj8zaYcjuz1ZOASgI
 QPnilAX/JrQDWAF7skXpUzN/buK4nWgNL9ekXHXS8M3cvFVfTWEAi3G
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: QsJ8-gx-cFLmqhG4IgLraUylJEkPyOsX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX4ZR7AW71Ll5A
 VIFzM5OGP8CQkU2bjuRiNbYp6bRjnf1DPeu8syfTmmEo5i7PoIvHKm8NNTC2ZXgN27zlUiL738p
 eKLhQ6eM0vxlcfNL6I/rlbx2nSFVoAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE4NCBTYWx0ZWRfX7k6IBhMPLyyX
 JoAtNSbAOLIlmgdldcZzWtd9oLa2CCTWHWIYnZLODSj1CP8xYVReXfkT79Myx3/2Mm0J5uZxtvB
 9pdCTA7NHB2XdU2g7cw17NIkd/G4/a2xppNJMuCavtE5tSioU6DVd3HnrYIwssvAbnZ26g+rtYy
 tWugSimy6L2kdrT9Rtrgf5sFlHrFoCgVYzSgkm/LpVrrVsn3yHaS8N9uvUI5o0NUFlhsbwZxOBH
 n/CgGKPH3OGUtv5mn8/dcnT1d43KJJ+SbOIGisJhzuuc+uDIJzc4FWWO8yDmZOz+4hBOYPFQVhD
 VSnqZHjD1/Wnr3zVIpc/a9S2qkDGCu7FtOaPDZ05tMfcWBMMJIUqss81qSwwMjmQbL9ESUt41Mt
 OuhLFcooTKstwuDcjVEbCNPYIw1F//g1UmRX7dXOwcHKmIEPNPTSzFN4lOc+eMmGrXZKd33pIIV
 QK+bTUVAdkiS3Lsa3ow==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a949a5f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=SrWXOAHHq75Mue0GltgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: QsJ8-gx-cFLmqhG4IgLraUylJEkPyOsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300184

The "limits" hardware performs rapid thermal management of the CPU
cores, but during prolonged CPU usage the system's overall temperature
need to be further managed by software.

The reference design provides seven "system thermistors", connected to
the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
thermistor", which is wired up to sys_therm1.

Use this to throttle the CPUs, in the same way that we're throttling
previous generation laptops based on "skin-temp". The trips are chosen
from those existing examples, but are comparable with the ACPI thermal
policy.

While not used for cooling/throttling, also add the other thermal zones
for temperature reporting purposes.

Enable thermal-monitor mode for all 7 channels in the ADC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 429deffcf3e9..065af18357d7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -11,6 +11,92 @@
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
 	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
+
+	thermal-zones {
+		soc-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		keyboard-thermal {
+			polling-delay-passive = <250>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				skin_alert0: trip-point0 {
+					temperature = <55000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin_alert1: trip-point1 {
+					temperature = <58000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				skin-crit {
+					temperature = <73000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&skin_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&skin_alert1>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		backcover-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		};
+
+		smb-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		};
+
+		sdx-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		east-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		west-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
 };
 
 &gpu_zap_shader {
@@ -20,3 +106,33 @@ &gpu_zap_shader {
 &iris {
 	status = "okay";
 };
+
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};

-- 
2.55.0

