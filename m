Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F34476053
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784807343; cv=none; b=UMSPCuTKa9Uz/UkowiWjtnJFdOlOHBSiPi40dYHe+k/vs5Itjyz4iW69EPBo5pG4oRePerNhPKaev9GKVeJyFBALvdIx8W9ns+TdZj+mWbJR/+RwIp15ryaRDCceUT3hr0CamVcPqqm0yPpzPKUO+spoVTfuqGtx/la8rN4B4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784807343; c=relaxed/simple;
	bh=rR+bMV4O1HWRyUfn0PS2V1qLpBC0AbtGXYziuLCkD88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HtkgnyrLI4eP9kvpG9JGN+KGl6+ogULsFbRu6675HJOFwYfGsiKwgW31DUSq9S1J4KEzlHhN2qaDl9gFnqGFvv7W2qnbukjEIF0V68V8nnvy152OkEZV5VB+aTFUZRsa5bakx2rIjTqKXV/1Vak/cfLU+qIkTCcReGGMOCDIgrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToNwI7Md; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GW+h2xd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToNwI7Md";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GW+h2xd0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8r4iU3790809
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq
	4D7xgIgc=; b=ToNwI7MdmnSTE76X7sPyuXHG25rb6kPmJCV4xrMNxNEIurudhll
	YNps4fxs+uKOVGS+ZJMtc9L3Vkt2Ytx8/C3Dn4PasRJE4tv7FWl8Yc03z+V7Cuu+
	pmol2gcBcmaTo2G+g2yuDO35/IIYoBczskkZiaSwPITEncN4srTzT3Rk8u1HiaCg
	h+J/fIMjBI9FEYcScS8q6YXI9tRMFAhl5mvxSpdsVfPCtnpdan4lzJcCBX+O5Sy+
	LWAw9MLqNPBLLzZzjPFHUCoOd5pld4L6j/Kas2QPKCGnPUeoZ/DnDtlZJZ0qEPF6
	2jgUrHtNIcz88kbjAMkOdccQASUPrY6K73g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52mbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 11:48:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c075c1e25so8829411cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784807327; x=1785412127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq4D7xgIgc=;
        b=GW+h2xd0PFwwroLProaIPpV7QD7dbx4uwm0q8tUTC1ety9/dRj17e6VSh+6cAW9HAW
         kcOZIJ7AjrQFc0tmhz7CoET+/5ZbXWqwS3PcqtGm6SsF2HxEYdtGJJXnvZ4MXf/onRH3
         MxnakwUSpp4qhp2KESVCyOl5m1p5lMpH3d1oQYKoIN01knnDQP4fS8kKMBHlRaPAmP4U
         np4ZGgB9ALGpxdlU7slqgcuEtTIAhrZoMNLUz8UcnEymRlff9qHKm7FCVov8J0BgbULs
         A8GXhNJiCS+hcmMnFOyvem2uB7a7K2zWUxKhrR7Pgx/gX8upi0URamMHeEnT2phDd71W
         15yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784807327; x=1785412127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=05RNfZx2rT4e5dyY4zlHQ/MiVh2TM+NTqYq4D7xgIgc=;
        b=d2s8r9ujHWrflkSw8NZcdqMfpCs2oBLagGZVYQE7qXG8s/vzAYcKnL0MfAnP2Tntz0
         ublCl4umd0OkrScHUbDWxIEX9FmwQEkujjbarWypWhMIar2517+/NeacoWcDAhWt+WgJ
         ywk6nJ7rN5YahijCk2vi24FVs4J5nFaQir9R4GFlJ7+/wIOcwAWu3TUrpsLEknnEowmg
         s5SE/8AnokzS6kj0HKjdJE/fS7Wk//tgrZqO/Qa5lOKK2uk0sdoqxURATq8BjLX6PJiX
         YAYHNBW+/N+htOqnAwTf30UpqJpEOfBPd9XHvbryRuhYOMT/SWvAPyQB2ieSBUpW8MyD
         Vq4g==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Q1nsI037YSRTJve1GTeKwhyzbwUD5cFMisHvod2V6Ylpf/Gg6Wu1e3i5F9Y7GQ6t2QiDN6MlBtQglluW@vger.kernel.org
X-Gm-Message-State: AOJu0YySALpIjbdCuFOizxoOo3G1/oewlKOFmAEFx93WjD2lRj/jOpud
	RfQWToTQRh5oZW/I1aECvNHdEkExp6HdgY1/dKCOVsnAcnVFLCKCpbFl8Rk5zY4PJ4TXj/j3KCg
	K8Ef5NYpifAgg4bupoTunJHCS6yKxMwbrfwavaGYQzvUfD3wDYk6oDNwyuWZodqN7kSKM
X-Gm-Gg: AR+sD13nUuDQvInOlAQ3AbgIjmVzcG+cc7FJuB/uDmXdudKAQPsh/Co8XTQsjMLZ8zA
	tt1ckqZMZvPfuN/RMYmTG1RFmojdPt5+GP10JxBIf5Gl/L8p/sUoFNMrAbXQJrpnKW7XeRJg/Do
	6PWVr4XYH+/y5fzSKnmondEmmWTboNwPE1pF/MIz4C6w7VvXOkjqCLHvV2OsoH1IQiNM9WS2RXJ
	SugY3g8HmTdCx1lJ+HZUPv2ehp154IXR2J2jBmEToA2WkIpCP/c2/OW7yoEYj8BaFb3cvocv5iT
	6B/9Vr1U7F2K8jWpAzTmySYvxpp9re8k1I15d9zvKoaB1NOKNDXpGEjEtFDfyMOP+s0opF76YoH
	LxntdZ4FBMeXjW/Bd/KcjpCTZ0SrZqmWofR+EuJHn9RLGjDIHLuERAf1w96I/GaAV+pk4f5mgGz
	6J6nW7c+v4yl50l6o=
X-Received: by 2002:ac8:5751:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-5283dfcf944mr23732161cf.85.1784807327027;
        Thu, 23 Jul 2026 04:48:47 -0700 (PDT)
X-Received: by 2002:ac8:5751:0:b0:51c:7b11:41b9 with SMTP id d75a77b69052e-5283dfcf944mr23731981cf.85.1784807326440;
        Thu, 23 Jul 2026 04:48:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c4196ed98sm166302566b.30.2026.07.23.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:48:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus frequency
Date: Thu, 23 Jul 2026 13:48:44 +0200
Message-ID: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDExNiBTYWx0ZWRfXzdUzYDXTT0zY
 7pclUeszqa1Dn4RqrbEbpA1Ac7QY6TBI8SW/bpXIuIrTPSIjbEWPV0ntFQvrpYW9hzrBTx99W2c
 vW/ZMG4XVVRVMssENYQI+mioBDnZsh6ex19KaTi/iuHmodsB6ckMfSii8fBzM0Cr60NHBIwmWqN
 5duFD6d35lf2Ukg2zFNvb8kQInZ5Dr0xbtA/Wa8esU6dZj6r7tal9KroHoKZGeDNpYgZYDDiUYq
 jaC03eSaVAypXUBIGloAfMZeKndSRiFBWRXywkfGw2y9yk/kPAo7FdDfk0nvB3njuEUyCZx5rAq
 y2nNjW47uZRT0I8Rljt5TzwGiFZB5G3cBA7EaejQQVoBs0i/zq/l9esx1/MTVtlcPzVcgbYAOnK
 xyUPuNgZiW482N0Fo6tvq7YUZ7gdl4KkCRjAfSmmB5fltHZTBVKInXGBc4oTJu1/bsiIVDTSb3g
 6X+114kzoRI6+Oltzcw==
X-Proofpoint-GUID: YeKdndQ12oSebnZvogE8712ka8jm6iCp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDExNiBTYWx0ZWRfX55vuwqjtOjDd
 HqRW9YAH9yIulQ1C/N5rlWfN3jizITD45qLt9cYeY58gngs5MyjMI1RgkoxUsz5bFsI0aLc4BjT
 1kNRFEjkfQWmsRqjFqeua41MGNVfS9E=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61ffa0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=4Wih4rDtSPqUeWgalQMA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YeKdndQ12oSebnZvogE8712ka8jm6iCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230116

1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
to 400 KHz which is a more reasonable default.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a22be507ed9c..d3b59b9e84e6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5472,14 +5472,14 @@ cci0: cci@ac13000 {
 
 			cci0_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci0_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
@@ -5509,14 +5509,14 @@ cci1: cci@ac14000 {
 
 			cci1_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci1_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
@@ -5546,14 +5546,14 @@ cci2: cci@ac15000 {
 
 			cci2_i2c0: i2c-bus@0 {
 				reg = <0>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 
 			cci2_i2c1: i2c-bus@1 {
 				reg = <1>;
-				clock-frequency = <1000000>;
+				clock-frequency = <400000>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
-- 
2.55.0

