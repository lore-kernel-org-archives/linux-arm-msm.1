Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9AC2EEE90
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284512; cv=none; b=nfmPb+TpZ75ZKQ7o8KgeFxOk6zIEmnw9nsET1sbU1VPEHlSERWms8G+R2QRLrYmzol3YEbIC7Dkxvg4f0CyQhs3BFn6rKlzmR4+8538VwP4FJtxO0/iW+8HzSxVHpaxtsw1CcOIG6cY9QQNzWskaELOGRf9J14CpxGa8QZklYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284512; c=relaxed/simple;
	bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TN8VHeYoyEb9zhsTxMotK4Wb5iQTP2myx2eH2Q2cHH1/pKEu1D8wMDRpCRfbdpzAnMkmtZu9bZi8L6sEETi92OtHMnUKuZtSkNWWDpVVTqBU2j6eprbKzw99JOKfqZudEFiCzB9QykzAPLcaUbF7g7chKfupiICXpeDynpMGBic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4pQOXcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCM4Ygdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4pQOXcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCM4Ygdf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1U4Z3838755
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 14:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=; b=P4pQOXcvxcMlPcd8
	wxd4iJKtf7OEyCIrS4v/ZbOEP5oYqnoOBR2yfR7h6wUUtpu4a97DJgjDen2wOkr6
	xHfMQCOJsloPcUD5yi09yjAerx5QAbfWCzAdN2eCn88uc6CgsZRtJeiMZDdzZxWk
	qf+bbhcQSC4RvLgWFRfnxUqRsK4AqEHaJag/JTiIy55M0hF1RK/cXnv+DwBUhlbS
	0no0tQcBIfsCtIWUyW3S52DoUB1sLU876632NV2AIUOSy85tfern1/X76bLsCrPf
	x8GfZuGmDO4SfOlTBmYbugE4DKADTI10Q7S3i9T9SJTEkItHEDRr0NdEjXtlUyU3
	pEmYTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gk78b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 14:08:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1884723a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786284510; x=1786889310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=hCM4Ygdfxqmoxa7M+PIK1Ja9tvSZoND8liainvWiUL4tQD/qi+T2j6IIAWqDupXWnI
         vZUoMf5VG97NepKusZQMbZQ8EdbkCrmGJ4R6R7/8Ha5R5/FvOWvAC8LsrULz+2sL80hF
         j7Wqb5/ojaZSq0dZupko6pWmym9kdB+0N2Y49E/wZ+TqE1tsOlcrMYmNCO+g2C53clQj
         0AF7ejhmhRCyJ0HfGJG8Bny3bsZYyYDc2J13+YhfJtGlflFc0fQbMolmXUhc3jVlay4j
         71X7TUh4WSunygnn6OP/Ksx1BdH6NyPsM2RMUs/D8gyOvoGEBvCV7xBtjsl8TqQTS5zB
         RWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284510; x=1786889310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrQhzCTgkaQMU2fKeLMo35UyvbwinUgYcusy9CpvFUQ=;
        b=bHhbnzVT5/HydsFk6+lKN0OvIWfLLImA6iEf8Mfca3HsETpCxhLq2Y0W+jnbRq+D/z
         jWXkngHVLA2WOxfwzDqh9DdeLtrkNpIV8GVBsvQLROmpht3XixgMXFIvG9k1dZy+9iqs
         TEZSuXenqNfrCud6h5XCA6tD5uSP/08ezlZO83tYJhS9qU61J7jXZeO+dLUeapUGUPtf
         +x7JtmydcFO+kLN6/Md22A/eR/l1Gsm5h08ColoYozY27ypETL1rzOadQf1+tMgRu07W
         RITKbxMon5wwTcPL3jQ6eIj66jBFDDQyU+eTsx48q0jfiFws2KYS87hSuk6JMWm9J0OR
         TUDw==
X-Gm-Message-State: AOJu0YxSbB3LxH6NOxaDnTMFYNmfmw4+7FHHEqJM8JxACCKC5asi1Og2
	VWWios/awfigUYktT2Why+OR33M25CAr7du0G6KtW+ECtpAraogNa/n3AuOwMcYQrboReFGIITO
	3zuA1L3XH3kguufpexzkhJBcARIr3XhV0TmIF+FoS49RdjEtUVDr6wY8r8oIPqtpLMr998FuDLh
	GS
X-Gm-Gg: AR+sD12cr7yrG8pOo7xoWI+F+xErcxn4Zp81Sx7fVOUvdiq5BwxwDIZ3idoFIEWKmkA
	Y5jXVxBZySADbEvUAGdm8x4lCxs171kGpYeA5/JUNnMRr++htTbD91BGjmcnUIjZJpkh9pGPqPA
	6eYcMextAXIr9MP3UXR+aiBZCMmKvjKFhfNqo9uDN5g0IVmFCFKU3PZFxPuNSs4cJ56lAH3KYuB
	KMKNoxLOJ6aHls+6JGMQ71knzWJmyAXBPvd8g8c9jWvBz3z9OaiTLMOO/qnQ+GEaAKNgqc868VG
	ToVg8OYpHFDfmthIabg+l+1Ywyq4OlyjB6514uNAP/yAC6M+5uxNpzl6FtAOL/n+cOyq5Sr8cOY
	khsg4304webCsCPfIrWw=
X-Received: by 2002:a17:90b:1347:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-392823376d5mr14889765a91.7.1786284509673;
        Sun, 09 Aug 2026 07:08:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1347:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-392823376d5mr14889703a91.7.1786284509239;
        Sun, 09 Aug 2026 07:08:29 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm25489437c88.6.2026.08.09.07.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:08:28 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 19:37:51 +0530
Subject: [PATCH v5 1/4] arm64: dts: qcom: pm4125: Add VADC and temp alarm
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-shikra_adc_support-v5-1-bf6882d18bad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786284499; l=3268;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=JavzIoARy+ghtdbaLpTk2KQN6M0TF78WaJ7b0GcCGNk=;
 b=hDWT6sqdbil+S9ewo3lYCahc24V8qxEdbQrMflav04GHDX2T0wXl2EiqUWIJaVgXYSiZK0fw4
 q/Tg5e7cxdzCLvavnCrBNKEe3iu40G+C0ZCDriRPgWieNF5Kq8IBN8C
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a7889de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=32WKvE36LqkSdRhMvAkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfX2pIMUneRvIl9
 WBmNq5vGaZRef40EvtjwO5HmrHs6vynir6gQ4bpz+zMQYylArgOgDhwLQexHN0cuHTwXeNy5gYl
 lqZ5hW5oZTpKf+P6WJNKWwZ4y3WFR34=
X-Proofpoint-ORIG-GUID: ns91g0ytXlTcgfttvQyxxG2HqopoRrt9
X-Proofpoint-GUID: ns91g0ytXlTcgfttvQyxxG2HqopoRrt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDEyNSBTYWx0ZWRfXzak5rM7S8f0X
 aM138xKXrE+oaYlFYhKBQL2qKbL1hlSEylpla9gCs3Br+9cYqeBiiljWIGuCGr3K1SjIqDM1Fz+
 he7yqW+cSPLbeBpAVXZM3LbUj6IHTCC/vMxmptKhlTXoRMPc1n46/pjUKM6OW2RJXmPelatqg9f
 UE0res4zKYNiwvrHODOmQfOjjt6xb5XL5u7S9suvGDbJ1glYrgj4w4kY/uv649dUY2WowhypNCd
 Dyu3OfN7z+l5BFWt/jZHK3fvv/e3VXtaPsSw7xLRu/0cJYmHFkO8XHSKg2Z7QRKsOhaJ2cMyJwo
 QgeAMgPlC9XbAzJih/wXt5byiNrBHDm4tO0XhiSo5ZaaAREUIQ2+j+YYdIGlgKimAOa92aXCdEj
 mePliMJQBD/RciPcodHus/T1rwCPT86D38V+s2mfXOWDuVcECMkQzEyESeakHfY0UDuETiZ6rhj
 McWjJ1d8uY36+Rts77w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090125

Add VADC node with some channels under it, for voltage and
temperature readings. Add temperature alarm node, used for
PMIC thermal mitigation.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm4125.dtsi | 104 +++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm4125.dtsi b/arch/arm64/boot/dts/qcom/pm4125.dtsi
index 3dc8d667d091..77de9db8c119 100644
--- a/arch/arm64/boot/dts/qcom/pm4125.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm4125.dtsi
@@ -8,6 +8,35 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmic@0 {
 		compatible = "qcom,pm2250", "qcom,spmi-pmic";
@@ -65,6 +94,81 @@ pm4125_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		pm4125_tz: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			io-channels = <&pm4125_adc ADC5_DIE_TEMP>;
+			io-channel-names = "thermal";
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm4125_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			/* Channel nodes */
+			channel@0 {
+				reg = <ADC5_REF_GND>;
+				label = "ref_gnd";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@1 {
+				reg = <ADC5_1P25VREF>;
+				label = "vref_1p25";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@6 {
+				reg = <ADC5_DIE_TEMP>;
+				label = "die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@7 {
+				reg = <ADC5_USB_IN_I>;
+				label = "usb_in_i_uv";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8 {
+				reg = <ADC5_USB_IN_V_16>;
+				label = "usb_in_v_div_16";
+				qcom,pre-scaling = <1 16>;
+			};
+
+			channel@9 {
+				reg = <ADC5_CHG_TEMP>;
+				label = "chg_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@4b {
+				reg = <ADC5_BAT_ID_100K_PU>;
+				label = "bat_id";
+				qcom,ratiometric;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@83 {
+				reg = <ADC5_VPH_PWR>;
+				label = "vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+
+			channel@84 {
+				reg = <ADC5_VBAT_SNS>;
+				label = "vbat_sns";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.43.0

