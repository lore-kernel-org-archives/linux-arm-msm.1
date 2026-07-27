Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32D431A34
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172837; cv=none; b=OIVc8hoPqATzgPfFFR+Z6qNoPRkBwgEq9ILYjEBC1wBqWwNEn1Fn79gS1xEMu298VRdifiAOl7C9pG3u4+dfgPS+9nF4IbCeKoomw98K65DeJ8bwUS+eBdOnNDmepH9QXVuHjXnPVFxjBHYIAsQ2a1cMJoN/YJ1eVdHEPelEueM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172837; c=relaxed/simple;
	bh=BL6j5H5m37TzqcudsoCQpnU2bvwoR+kGsvfjqpq6Z5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwfSC+HpgnHbp4jNjRo+I5AjOfMZ5FFDjqgidy2yCqYvh4igz2ZHz0v4Fl6JgUH62Cu2ZPixdHzy+TQqzurlPynN2qxYQqviDzb0C4Do/UmFWAy4NZ3QAlrpSVT5/9/2oEqYUlzs4pdbk2RhMnp/raoTrkMc1EWsbfp4OSw77rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyZI4mrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j67GpY/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyZI4mrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j67GpY/C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlap03414023
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=; b=eyZI4mrAacHgO2AL
	ExKJDLzQr7TwJv4fgxAmLmg7AiJtCcbb7twQAeSAoo0wAqUQjCgk01QcJF/lrNJZ
	F+0EfJ8QwKDADaZTuXPUlZIRzSJFjhNdAYWTSd3fGC82Prg9WMoVElQINYZVs+Ah
	3wRSyiK0Azre1TcV+wosUlqW/5wUQIgyhxmj1WbKP58oAEyGssUIwiAB0D+ziq1Y
	GldCONyESuduCK0GiNnW3jEuk0tlq+GzXYNxMN9tyoCVFtB9muyYJHqwv3HteQIk
	zzat1STQMgyqio9Pjkme7BC05Sqt0u4eKGyWSoF9xJf6ajsb7JUGRPtGZZcuHl7U
	PRaH/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v69yfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1854925a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172825; x=1785777625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=j67GpY/CsPQSVeMRyLFoQRsW0Qbe0b64D5gykhknMRjhB4WwF3omK4AJAbgb2kmTb8
         owk0J7ZsK+FE3UlGCtuEKUxycSPX5W2cl/+k9prNH64wuT3Nyqun/8xo2KkyeMk1CRtr
         8fFq/EeJVqRfG7Ev4/GGLtzzg3qI7PrGSZPczIVsQP73dnhUfofkbVvdNQ3YilxiZcux
         SojEyDljVWaIRRkbRMrOOLd/GrpBS5POvcis4OKZQC6kFcIi3pcpiD2CT76k+tcAyRqY
         fm+IBF7yR1ROwdonkXVNHWSOyqDzi9O80wLzttrfDHa79KQ2/VUkAdCvf0TmiwnlTU3n
         bPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172825; x=1785777625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e90gAsgCeZ6RUGKM9of9HPgicOqZqYMoZfyrIu7uCDc=;
        b=I09483LOaHS50WjAbN5IIlxgciMCmef9D/loEYfbRGKIlqvGG1HtsuvkvutIa01u1r
         uDV+EDZ7IPpfxro/y37Eznh0mgWYQKG3C6KpZU8MYNaBeobmf+YNdLkJJw618CeR0AI7
         aVKzzb/VCg1sEsKZSyDW/++otDGdVeJWChehVECUiRKzHEJk8RqUkzcjJO34xiy/AtZN
         hqI1pkDz/qMtSBPLHBsVPCPTU5J0W9PpO1BNxjmYAOn7VmOCIkKBA6r6UTPwjevRMe04
         U4Ni0kbBKKrIgkCyQ4kIQKwM8erKMwgRUWCPcZUzrkelCE+C0b77R4LGsUgIynkY9/oT
         5Pyg==
X-Gm-Message-State: AOJu0YwsD9wUiw1juY9CtoNzfeTtPO3XzB0jLzKbOuP/gNxomXEOgXGZ
	8Dc+xfQJaV3zwcOyxKlFatUdcldWRhKiZNpyTFhcTeKDp26Ljr+EmNMzq4LpZ3gFziMNDLD6Kjh
	vHfZK3ZF2x15bBSWtcmOwQWQTGToEJARh9aQPL3elxg8FwhGH2E9izFBCkD79sYTHLmeF
X-Gm-Gg: AR+sD13LFawc35SqPxhhA5n6zWzedYVgqWppyVkALq86va9aIH+eZ0Yx00EwITi6SR8
	H9tzPIaBIbazhGKqLQuJ+nU7v42tkyHzOOvITJoNqLNOfI/+7Mf0kGXZmp+RKXqQsEyflAT1V+h
	ZH/l8dNW5ZNNWI4ZuSqo0CPrG98Gaa+9RQGFyMfO3b9ugoAMG4298Y90t3Sa4BcC7E8L4tZRONU
	2tJBUn6o1maOBCUtGlohyhphB6PdgAxiNcUmUvIwFbJ1Ua6kUy7HJdvAibztem9eNb417UrUzR6
	F3wxIUcSzeEcb5myICChGoEdYwp2gLqYZdWNNZdANmY/+XI7EN6LDwLhmfzpZ01WI/Wnt23s8Yd
	NDAuipzkqt9dyehIT7BA=
X-Received: by 2002:a05:6a21:6e86:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c6c7bc8d39mr444185637.34.1785172825100;
        Mon, 27 Jul 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e86:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c6c7bc8d39mr444163637.34.1785172824648;
        Mon, 27 Jul 2026 10:20:24 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:12 +0530
Subject: [PATCH v3 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-2-bc00223648f3@oss.qualcomm.com>
References: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
In-Reply-To: <20260727-adc5_gen3_dt-v3-0-bc00223648f3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=4796;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=YDR7Fzf7/23vJ6lUmAOe24RMDWg4KghZNkREwSOpJBc=;
 b=J3maEZNLif7pK0Me08k0jbdeb7u/Pbi1ESVFO1zaNx4tQm/t6G0+3ypUtxqxjLLknGE6neyPp
 +7uIsCPw1uMBAb+vahs5wa+FDtyuCNZO5WxXrgfTNiA5flPkQyEVnuE
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX0rCCBQW2dnEE
 J0ME4DTK3KKNJUctWH505jAwycUSzuuHFIz9plpmOCSwSVcMMlt+CxnpsgCb6CMAp9XuKhZLCw6
 5DPB54ymA72XGM659qt0fShThWn+bmM=
X-Proofpoint-GUID: Q5qfH14791i1FhQNfIu0_mpUIjqumzhX
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a679359 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Q5qfH14791i1FhQNfIu0_mpUIjqumzhX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXw6MhjogC0Qmg
 z2gdio0jEe0gdp4aZOvj4LaXiivaVQtuMnRjUaOfc5xnTykb11otikxMXUkZKq10/9G0TgEag0d
 ZKzeYXywfSKctw13NkYXLmFUyzLfwqVegJE2trjQwvnpumy38mz8r4V58s0c6d/i0iRcH31mk3q
 NyUVdXsVFhTM7plew1e7YCFG7HeNn8OkMk4UMLsAKCJotdzIfJUYKcASXQp3IOBD78oL356d6Nk
 EWhc6X704WAWpHNCU5mFQR0apa1oeifmRLTjqRKdAq0xrXZK1BGQO8VpA9KT5Sv4U+8x+J1Hq7c
 P5Z0VarGmPf6y532ZFse3nIOdSARJdYoZ7bbOy2n0mO5Xj0cWl0n4yv9IAnJwQInMM4gpxPUpX0
 OXa+wRwnSA8cdP0jRWa/VgAg4NSuSPAc4c+BAQynw/Njzm4OmNRuCpBr0OY58P3IO/AW+rKQrbA
 G2RehaYGxcdTe9lM4Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270160

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

