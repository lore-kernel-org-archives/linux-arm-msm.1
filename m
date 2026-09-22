Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B183455C327
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115122; cv=none; b=Juy92bvcxASY6vCJbih6et1vYIG/fEY+udwi68MIfRPrHeG8imCMM9wbDEO2iOxkQhWLhj+NSkEFOkXG4OU8PDOqHcEVjk6SbGVRXTgZDfWPL8WRhIPCPP9QFIuJSL+EM+sgR2MLBWAtsV9iQ+LYj3KuG18DBv1zdrZtqseTka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115122; c=relaxed/simple;
	bh=G20bLRtZKjZD2gjlpedYLN1aTkmMG76Xtt8Gm5aTPNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvlJrEaP3f1B2A1smcboxFPM1vHrxN1f+abV+LlF6oh4zMxQgZYaQLAXdqvjyu6PuprvRBh5ZCOhqKtV0RrfhcuLR9VGzwm46L5s9hWIkF6RdBUtN6qo0SjCYdGapTBLLUSJZVVVXWgikiPwJv5xgYKghQcg0VSQOcUNdevfceI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hr0Fjgb+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wt2fCxDo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hr0Fjgb+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wt2fCxDo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI70CO1348800
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DxeEMBKh6Jf
	FzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=; b=hr0Fjgb+O4Q/UYbgYBAQmfiokt9
	JAKe3ABDbWwobsWxbI3keaqT3w3Nd7oY9WkrEIAwsRH7q9fORGgWZ4rrdIaGDLFb
	44DNfoqCUVy+GsJc+Dv35q0tyP2NPCUcAL7jX+rkmI9h2xe5MDf+CFMER/6d+N5f
	Hx1pGncKFZsf/iL93xO6EkEvQ1rr0r/TuiWsqEPxf8R6zmOzbK3Jp7FghVviV4lV
	kHq2L1dHlZChx8yK1ON9bYjdju/mmOcade2Mzs8gD8+0/e1DL/Oh4e2eq/Co5Zo/
	DqAoyDya/JXMyXxGJbNrCtZ8Dx4jEzUHi5OMozS0QaRNkZ8XmdTB/8SHssw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux861ab3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 22:11:52 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso281139241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 15:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115111; x=1790719911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=Wt2fCxDo+CXoOSgijkd0tw+E/SDwdfz2JGZHRUDbjLzKRyYdl4BTcNF2VdwCMViQCf
         FJSQlQgLPS+BCfqTDx/x9kiYpBLarx4pL71ud/87kC4oIJUaee9lHPNMUq6YCgoPVDjV
         aNpDa8YrtmX3IIwAp6AH0WLD08mvh2kHuQjWKooDY+p0gHjjf6hye9jdfsiSOPyqCge4
         g3SMzA+htYK5AzsWZIAS/3lNFw3YnXVY+yDtuU1TpAZjHeV0I1k8P0RaqdFWAd/HmML/
         jggSXXqpZFqR2k2D7dPWGChcwymp6o9tcP6vTFm3b5XB+4SPbD2YdYhhrx84idhj6qfR
         EJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115111; x=1790719911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxeEMBKh6JfFzQG0KNCNPMJyIHazGV3M+AfgG8Vt8gc=;
        b=ThGCnAB6WV50q+dAkQoYLO8951zij8mk49QwYoK/uGsu/OIg/PkpDVJYh2pNRF59K2
         V+XjEwAHvbLq5QmcGnCV773NdDeEMJyr92l2SxLYyw4TOzCXHcWFr5UpeQnMslPS0cK/
         5jZBqHllNagA2qVqfoCKbJaseqPeLKhDXwoBDvWCHvkA+fc49SwUCZevYjdbDI6H7M3G
         i1iczxjzSHo6m3vpGQYkr0JczwC8nxfLnPsN4A5dhGC2Wo5OTjXBbZXA+T4C8vNuvHp5
         YP4K3PMVAMfmjlzJXyc74qghvXQ5n7LwOZzdB5/wLbb3czCPhq/VDbtNbBL45Tqw2Kq5
         clzA==
X-Forwarded-Encrypted: i=1; AKwUvBx1KlXOPOTpzmZvUt6bHDwXBSe3dR/Yz+Ca4NW693JO6wx/x4DFOZdFyChCC2zR8+La4aAUXlxaPsLdRd9z@vger.kernel.org
X-Gm-Message-State: AFuF++ldgA48XTlFfG8y3l03szfv+jFlBjwrF8COE59obYHeMbfSzBY/
	/LB7DIQ9iPbezdyWFd4b4kOCpMHp5kH0bdwMIwUgeRPuRZs42Xuq02jdbUmHJV9UONYfYKNiSbD
	xv3w1UDBlJiylfLTxoHUwrMtIABPNRyQhXEY1+VpVBJZNKf6fG/LHVfrrBB5maetXmGJi
X-Gm-Gg: AYBFou3EEPGHz2r+z5k2Jq3qirk9mcVX6+DwHOHgEiUEFb704pGOkiWwR7+sBBSRV78
	6SUpeQbtlVn0OYyFatog33jfUUl4HaMAzmwGDe4rr4yiHVDXvZbtAW9DikMMwsQ5RGstERIo63U
	iM8oqYd4gwVGpuGtpYP2pyknM5OxgEdcWti2zR/Qa3vrT/+Sqda23kH72xWAH/xk6gunGby0vnc
	dxzrb8FJc+ybqGEpklIOA3qZxthzZum1z8+Lktac1LtYn930HByx0Ml5jOHzqFrz657LdPe7RiF
	ODWo/ImW6kd+AHITS22hmoKCdv6R6P5v7PPI+rdG6PpwnKYJ80g5ErUApyXVM66HnygDzlIUCHa
	ds/PhFY+MCJu9mP6Q2YHkyUJnuAejPgL6POxt/cwsWgTjPFjWx3aaQx6Ic/fNXbM8g9EGSnFKT8
	g=
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967132137.15.1790115111507;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7ac1bb2edaamr967121137.15.1790115111130;
        Tue, 22 Sep 2026 15:11:51 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488688856f0sm1400270f8f.30.2026.09.22.15.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:11:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/5] arm64: dts: arduino-imola: add support for sound
Date: Tue, 22 Sep 2026 23:11:26 +0100
Message-ID: <ca8cfb43cdc08851db1283df2108e77b22fedc6e.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F1D0B-UMXs9-EKtp-G_eeL3DI_8XIqxn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXxmHNwI/D49v4
 oOSUMRS6WFbsFkyFAFARyPoIRZf3AQ6/nGn87FFMFvtIcw1dK/0bnCICSlSkA38Y9fnysEOTlPC
 g+Rub+7UH/IVzkEf1j6TB0zpmesPW5g=
X-Proofpoint-ORIG-GUID: F1D0B-UMXs9-EKtp-G_eeL3DI_8XIqxn
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab2fd28 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mtT030_wRxJr2dZJK4YA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfXyD6UYHooJlIA
 8nbi8hkp6fbWN1PJHtDKC/mPWkpuQ3O49iejCcxo2NGSeHV3o0sU5S5kPBaZw4Eri/1sENNMyTC
 vdvBsWlMVvEO3N/B6wNMwSAloiC3aISD72IZHgQuTEDZhh75e/QXxBjC/Cw0vmoD0LVuoFL8wm6
 mLtFDDTgxvhLvJ4iboVMPIAoMUM8bRonRcQQMuXtnrIT7N+Rhu7MuCS7bLgVKZBYtLpfvgJ+pqp
 aP7xFBAsrRiGjUdv3MoRXevO3TOFM0FGXjazdI8btFGQBiGxRBCKwL4DMNkA8cePU4EC6ZjX83B
 DFxke+eCE4jx41RmmiHJ7aD0ZrrwXzgIpGTkHrUdedjekFJwVxAMP3LWZydNU21E0g0k8lY0tlH
 vQY5S9RuEdHo6v8vGcf1Mf/st7sum89ikrTnJTyBzvYE0ZwXHzahDwS2hvwfQtRuwQhdcKCWslh
 W2S5JvXdRXbSVHkgL1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi          |   7 +
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 134 ++++++++++++++++++
 2 files changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..85da78aec578 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -81,6 +81,13 @@ pm4125_gpios: gpio@c000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pmic4125_codec: audio-codec@f000 {
+			compatible = "qcom,pm4125-codec";
+			reg = <0xf000>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
 	};
 
 	pmic@1 {
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..e99d2a56dc28 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -110,6 +110,102 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		ear-playback-dai-link {
+			link-name = "Ear Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "Line Out Playback";
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+	};
+
 	vreg_anx_30: regulator-anx-30 {
 		compatible = "regulator-fixed";
 		regulator-name = "anx30";
@@ -421,6 +517,44 @@ mcu@0 {
 	};
 };
 
+&pmic4125_codec {
+	vdd-io-supply = <&pm4125_l15>;
+	vdd-cp-supply = <&pm4125_s4>;
+	vdd-pa-vpos-supply = <&pm4125_s4>;
+	vdd-mic-bias-supply = <&pm4125_l22>;
+
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <1800000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	qcom,rx-device = <&pm4125_rx>;
+	qcom,tx-device = <&pm4125_tx>;
+
+	status = "okay";
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	jmisc_gpio18: jmisc-gpio18-state {
 		pins = "gpio18";
-- 
2.53.0

