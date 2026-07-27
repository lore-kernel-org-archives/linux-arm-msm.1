Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB497423E82
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172840; cv=none; b=HR5YV9r1TDtGZm1BlnuF/rGW8l0vZjQDsueayhjuMuo393yKjq3UGozX8BHbl0WeDK43xmLib/8oCM6BbbtCslQpEpDNk3kNTre/aRVyxlsmb0OwSVuW+ZDtKnJJ5cETi9u3c46pIIX/KfWVc6RdQ4c9HS0bBoZ33Gq9UkivgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172840; c=relaxed/simple;
	bh=WkzMnEibAfRrWj1dKTc5IiD9fWUTupa7qdvCuMS1XlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyzHTW7FdbH5fNcJfqoglk2zJV/yuDEb9IvwUBVxEiSZ5Aw3a9bl0meKnt+deN759uhI9rX+dAV7sqAxTe1KMmOWMIRhoI0idEzFte4Qugj9O4lVbyeykMKNzFs5PBEgWINsXJX1bwbq1xMiMssdYk2lHgb8Sjv7HYl6QaptJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFGVWElx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQ9D63gL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFGVWElx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQ9D63gL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWRk3663468
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=; b=DFGVWElx31FiGUEt
	mTQd6n7OWgA66/Zw1UhfjmMS1PpkieVrlRUxPDc1WCM73ulxHHGstl1uBsReKi38
	K1ruY/i5BpV5vCqgk/k/PXGhmoe2zYkCt5E/DjxggtMnnqf2rbcUc0vel49AyWaa
	KiZ11ceLzfbYwrSD8VqE+p3YsIuzojLBdk08i4jIUG3Ce0FzCAzQFoBK0ye2xW3K
	tTZMOijCy1aT3GrzdZ+g5LEp2ngmzrNAa8I0g/lBW09Cf9Uv0+ZlPbvdqc8TAeC/
	p7CXJuQHo6elSelU20+cH7EQNKLRzRpiOYVUpqeah/ioa9Jbf+gotFq7qvuxOsxH
	5MZiHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2asjs83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:20:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso3228424a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785172830; x=1785777630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=VQ9D63gL3fV/J7x/kWEUlpTEbk2Sf954NDRhbAu6HljbV9tiZG9p6AqhvNS0oJU3fD
         k5lbPmaYA7lNIKs9XPYQ8FCg4eqN8ol0Ro65t7EoBJ6rXJ+uuOLc4zUUdXvl3dYR4vTX
         CYHKR/+io/MtJdceBIfp5zyyU+q2ZXF0Kgsc++DsgV8jG1QgnkWhpDe49TAVT2eCZflC
         wN40olyf9oQ02c3YKETDT5F84vlWu4rpVDMopoAx+4uqw98OEMbDkqJRpD5l3Xqr2cOC
         obxfTxqPN1N/oil55v15SgW89OFPXDPU3Ghcs48nsfBhNNZup+3sYYAESE86PqriBepz
         KIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172830; x=1785777630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VSKYwfNtPfddKNg4tQgqfDw1Q3QyFNH/lV+K7c/uDs=;
        b=cEkyutOLiNNl6cr5rNBOQnECKSZMZXaUX+ybksbWsLv/f7V4Ijd/NypEX4cEuOHEIw
         I3fsiw4Nw7zmOg3QujdZaeOeBEDiB5NmKP6CFrZvQ0PzkeRDpUDLyUxcgJv9KbeT3VGe
         0VIFk9Wf03bFnu/COcR10TMYs1MVGzElc6zJ8CB0EhLkiPR37TKqXJpPJq0pOEHLNoLr
         DV0trD9tVsedP8lIgAo603dJYlLPdhEncPQlWkOpCi7q+Un0D4+1IVci2wpFs2iHWrPt
         US3G+qS5O+dIV2iA5VrGKlOTikbyYC1TYFWtxeM8orXE5yNAXudxavmOUnLyK7WepGjj
         2POQ==
X-Gm-Message-State: AOJu0Yxp3l3hwpjIfbiB7w+bYGxeVy3yE/EgYa+uKuspdU/fhghjYkUL
	BY4lpOyICY2Ou24VwKM3FUpnkcSj8hmwj1D8abbZqTSiooBGUBSZNo3FHkGRt4BaFyryZdAYe83
	8wAnzR75/2OLi5nRhp0YlpyF0bS4KssKThsCggUHZyfYztAqyXRhrOw87ljlWwfCQU7GI
X-Gm-Gg: AR+sD12wpBoHM5Lo1yozGkO2ep7qo7iDf1lvl/CcDxu7I2oJMfMLe9aF0BgtkUHeIte
	s2Aww40iFcNR+t68GBRV78BSI6u7D8RIzawHZtnt9w6ww4jEd5I0x0ym+0y9qVCf3JaVOYhWCfJ
	5B1WXT+s5sGT2LHIHU/Nk3QKoQPdz0JfhM6s4PHsjJvNzOzRkYFc7IE3IkNyU21d9ZNkfwGBL7/
	hTunvxQa2h0nYO2JE6hzaddJTB0sLze/dt9tIzcqwlPMn8r7hG3g2AyZJPecJb+vh/gzzhyZAFy
	dTzff/L6x/2ZJNHUecnnX/J9AHwS/08g7Xv61ztcIa0ledTHFluqN3yOjGrdF50MmGAscBrjIBj
	z63Qn4DkzGBZFteboI3k=
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr8216882637.16.1785172829725;
        Mon, 27 Jul 2026 10:20:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:1602:b0:3c3:a140:9380 with SMTP id adf61e73a8af0-3c67da110cbmr8216851637.16.1785172829199;
        Mon, 27 Jul 2026 10:20:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm55892988eec.13.2026.07.27.10.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:20:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:49:13 +0530
Subject: [PATCH v3 3/4] arm64: dts: qcom: monaco-pmics: Add ADC support for
 PMM8620AU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-adc5_gen3_dt-v3-3-bc00223648f3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785172810; l=2532;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=M4owo64lJpZ2YhGXHBvdG/H+ClAgq9NAO1gg9YEVitw=;
 b=9ZT28aaHo0knkQNZZqjVBqY2f5JjHgHp58VhfkIjXd8z9hs3SvFJH2pCpw8Z2zz8Hub0NpGD5
 ERFcJea5LPACaGOccbOTfyCMiSeK1wnBQc52/FhdGpbG9WpkUiOBad4
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfXyvi7SKeQDReg
 /o81o5Inx6vPACqKotPejxUpTfHMjs8a4I6RT89IApk0x9QdVr6DLC4EmYgOaoyEzL0POl0w6em
 HDhuB+T7W8XrfpfrKLXAG/R75dvJrx9en5rz4mNg7BV05p8kbR53IQq1Co8jTSkgoY24c9G0KCV
 Ru10to2/mJGfJSB9i+V7KyLcSIdvdfe8d70ohz8lQ7q7j6aum1Bw3snmgmI26Ol525Kma3iHiB7
 /3vzWYEo+El9DhUfuRtqQJ6JgA8u0iXdDvITEhdzktkAmX7Aig7ToyXYakKJx34LpxioT3uJyu3
 QLA244fEIMjy7jVIBfXcQf4PCzc+5GpJOobI4SJnAWJ9RKXhuRk/ZSSmos0cwo6doKzPzN4or9S
 u9KEp45tV6//vpdv/7aN0gjRsQOiPV76Z8QCqu2GEytqHC3LcrNF9CGF9UXBwddwgXLCWYJTT2W
 x3Qz6ewL1roN2EPbWbA==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a67935e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QpQC-BmSr1VXi1yepFkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MCBTYWx0ZWRfX5gd9qCUqNm3t
 Z19XaC7WhPZTxDfD7q1b3zJ4mvkkSMIaiYVUi4X0uTrfa2p6Dqwl7rPD7OlAB3o3ylWOYlmL/2T
 0zVrkGtumGD8WVbQv9Uttrmz5qLvWrI=
X-Proofpoint-ORIG-GUID: NYJPkzNnb45gaiyZ4wZc1ShMp3YV_Fzc
X-Proofpoint-GUID: NYJPkzNnb45gaiyZ4wZc1ShMp3YV_Fzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270160

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for PMM8620AU PMIC instances (SID 0 and SID 2)
present on the Monaco platform.

Each ADC node exposes the following ADC channels:
 - DIE_TEMP: PMIC die temperature channel
 - VPH_PWR: Battery/supply voltage channel

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..6e096b9b7546 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 &spmi_bus {
 	pmm8620au_0: pmic@0 {
@@ -20,6 +21,27 @@ pmm8620au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8620au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8620au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8620au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8620au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -37,6 +59,27 @@ pmm8650au_1: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8650au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			interrupts-extended = <&spmi_bus 0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8650au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8650au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8650au_1_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

