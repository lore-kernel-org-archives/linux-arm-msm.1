Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A968E45D197
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253809; cv=none; b=Xgn0RWncejw98Sia+f5EyrVXX2o91F1ldOQ/gKWyWjdkj5e6CmhEuqFjo+9fYaLRPTVLbAlb3X0RkicdJWrWfSZtcVj95tRm3IMfDv/SrOH6dNmyxmK5HyaF5DyHTr3a1fV/Oh4vdum5Am+pJdBVypBN7tLyCRBxu/KnCG1hnsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253809; c=relaxed/simple;
	bh=BL6j5H5m37TzqcudsoCQpnU2bvwoR+kGsvfjqpq6Z5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cl1h4K1uzRI6nYSU3JbRiCzEizto3BVowjfestn1BMVD3nUK9hvyP4wWjQj8YVf+ik+XHsJZovMr1Rzx2U6kI026jDi6aEpmnnMmvPrVGB7lcJUEldoDEQuB4hIpqCjlBPsTX6MOPsogcs931EUY4tVDwrUVLkwI+U1B15wsI7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRaGKd4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4MDdj4/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRaGKd4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4MDdj4/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEckS33244943
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=; b=lRaGKd4FM3va86Ol
	QIl+/X7xng6/zdbYPVCwaGCYH1okmqS0K/F+mIgl38xtWdersivSA9gdgpHbbTIu
	AV3bfH4Df6K4DQwtGfn0TqqOXL+csoTASyCwH0QRMXMyZp6TgaQG0y4R/Y2nrPRp
	7gmPLjNnGBQhCwjkIHuQ6Koq50euPDgH1rqRR+xxlfBBvFYZoPC3BKftiEntIf80
	J4Y6ZD3+dUkUkNAnFfTO6m0pH4uVLV7JtvIdER69EP7C4To3T4sTS5LjKEHQMbkx
	R8ksxWfqzS70c7xYxDQjEuU1D1QAIbFJ80nuKElsNQB8fTQ8SciA+VCq3MQaritG
	mzmBdw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptathqkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:50:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso166995ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785253806; x=1785858606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=D4MDdj4/AXle1T8U80lQDZUvoQztinvmvPBkv36K5mDrt75KxKezrGgadITEOBAGG5
         +gVd92eygSmL9rNFjA++shvbMWEeSXaHPs6USL/2rsBk421k6wwBeD5m7XhF7nnP9vdF
         sCnAIjvjVCbcLvgCI79JciUcONtMs+SvHay/Y80IDh1BoEtdZeY7ChTYEXXQ9g5rwmPl
         mx45MNMPt65+AYepxmdcm5SM6KN9ANuvAhGV7B3Ten0lZlJWrgQl3A2xw16jWWabACbr
         mCC+XvvQA9CyQNQokYD4JSC/RjEdEToItgI9VbH89ef9/sf6pheIRXPrr6qFSiWl2ImD
         Qzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253806; x=1785858606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=A5NUovVFPihvKGDUiZw+38TPoUeMVN55V3SLQVFSUvGU6o01PEPiLLSvdZnB6LJy5o
         F8LiHfuxSQsHoFuxtUlFSnu/BlJG4zg6LQmmdJZRgVXZtJ6ZinG0X3Lpps+Z58AIaTt6
         q3ZrX911Z1yMi8fkL3ZOT3Fsi6CwjDfBKfFCYXDegwLZKW6NYoyayhre40zSfomQy7CO
         JmJbhxLdPu2nF3m2dinr0C1DETn5htc0rYr5TpmJZ3zP2J1M6OSJWEIU6Skz5/kK+xv+
         cJ3xYAFRUl/FVnx1Omc6ytZ2hSi5u60w/plL8a0TWJPZXPGLyUubNi/bMlKnmxSr5tL2
         WKcA==
X-Gm-Message-State: AOJu0YwQw4scqKt8+6J2hodXq0OmPa/FX88u5ZIKtJ98siIZ2pMsHqUG
	sUEz1hLrJ55FwDy7QVkVxnNXEAKK6NfJGY9bm25mcbiwDbQfisoz4+wxyCny36HmaqbfqhHTn/9
	/+f4rCfUattpCFFexTt5gevDogmAWAn7xe6Tkxeulgh5Tq+TbCucHVZutp3WLY3p7Jk6hIDTDk/
	Fz
X-Gm-Gg: AR+sD11MYSXLc2ALb1XkYO+jf554LfoK43GPiGI/fAuh759BfVpWCqgqJHDpZvze///
	ni3h5r/G0xsFPx+V/1fgmf9brGNnr0j2TX5k36g/Wq9QJ+oJ3XsDX6Nu8pT5iTWa9eD7A5w3ZfB
	293xNRJUdm0FiTdvFd++xVVbuzpIyEIFaGNjN9uWfxRTp8E/ciNpeFW+4IRkBW55kL5rt0fLgam
	VchWCt3//hiK5eOVtvyzWdZ9bp3Me8WZ/mCuVbonKcX1iL2rtQQdct8O8cgLK797yk628ZOv/jw
	y5dHGkm69nni81ru5CGfOIjgvzUKINEyjSWWpa+yDwi0aY4VzVbEBimhwXQJcYGvGKAuxkAf8JG
	I+X6Qmb2cuFUqClOpgts=
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr37225875ad.34.1785253806190;
        Tue, 28 Jul 2026 08:50:06 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr37225375ad.34.1785253805615;
        Tue, 28 Jul 2026 08:50:05 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7eea52sm55688695ad.61.2026.07.28.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:50:05 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 21:19:42 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-adc5_gen3_dt-v4-2-355f0edece77@oss.qualcomm.com>
References: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
In-Reply-To: <20260728-adc5_gen3_dt-v4-0-355f0edece77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785253792; l=4796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=YDR7Fzf7/23vJ6lUmAOe24RMDWg4KghZNkREwSOpJBc=;
 b=HOxHE6LFoX1ERoXB8/b86wlcCQ/aLo9+P+BYjiPNTbiFj4hKkGszWcwldgB5dWLB+cRG/FQGf
 p3aRUTI1UqHC7VhBm6zUQvERhf3z3eY2Q/Se3coE3yzEaeLe+U56ENj
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfXxP9xk4o+XZlo
 QwmVjemtvjwWB4JE/s0cQknz5A1DQxB+UJ6hrVUQxZL8cqKmP01ij+SI5rxrc7jxk2nVrCAneS7
 9RSb7AGSMgq1ctUaWYgxcIiX2vp29ZY=
X-Proofpoint-ORIG-GUID: S5yGVV8mzOjNtDedIP5v8fzjauwktQpn
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a68cfae cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: S5yGVV8mzOjNtDedIP5v8fzjauwktQpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE0MCBTYWx0ZWRfX88H55nTr1olD
 tVuPA0lkpJhW49vTvjWbwmQnX1HbcbXzsCn2yrqpZj87KCi5qsi9L0pts9VpIPYne989ogX8NKZ
 O6PPX/b/KRB1oIsvL+SijcBfsUfbltd1r/2b1KVTpPeGxX1uSAFTbUyaUys1Rril4hCwlhVolTK
 +iGVX8l9xVLs8pKKPMyHCftusiZVEwNWgyYvtnVD04ZnuSix5xskEGkD0cwoDOsoyvZkcPv62D8
 7hqI4FQzxCGYVfN5Tqcxnh0FUwQJp7FLfKHFAWgqtasF0XYv3hg7GkFKKOu/9ScuEB5GaGrnQs+
 17kV9UwvHdbWL2mTES7dnwDOdF5dXK4/tyY84WsP8qZo8LjLKHW29InIhMNd2stomkAcRW5yOgJ
 izHGDW1bLOdgD99doatx5JeSZ0s1vjaJxDad4tOFMCJSYRTeZVG+U5jK6SRiS21+lfxOC1Lk0AL
 YBL5eyVTPC3OG4OZ6VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280140

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
pmm8654au_3) on the Lemans platform.

Each ADC node exposes the following ADC channels:
- DIE_TEMP: PMIC die temperature channel
- VPH_PWR: Battery/supply voltage channel

Also add the io-channels and io-channel-names properties under
the temp-alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..500f715931aa 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
 		};
 
 		pmm8654au_0_pon: pon@1200 {
@@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8654au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8654au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8654au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -176,6 +200,29 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8654au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8654au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_1_gpios: gpio@8800 {
@@ -200,6 +247,29 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_2_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmm8654au_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@48e {
+				reg = <ADC5_GEN3_VPH_PWR(4)>;
+				label = "pmm8654au_2_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_2_gpios: gpio@8800 {
@@ -224,6 +294,29 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_3_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmm8654au_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@68e {
+				reg = <ADC5_GEN3_VPH_PWR(6)>;
+				label = "pmm8654au_3_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_3_gpios: gpio@8800 {

-- 
2.43.0

