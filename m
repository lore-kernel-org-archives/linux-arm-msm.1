Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348A3B19A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787514502; cv=none; b=Ctwu91JvSu7e8xOriJuxYPalO5XsMBvRBqWLPETSH2guqYfZkmRby/3AzhLLOIzG0FXv2AxYsnvdssVX6iQVta+jmFESSYkUBaTmBC7W8NbSjnbCh8+q7t00FSWEmwusztO1LAdloUvVbif0GZA5waZ+qcaaUWqkh/F/rTCjQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787514502; c=relaxed/simple;
	bh=x1iqRk3HVUS/CcF/hXLoxPVnQK7ivi+5ZVRHnCUMofI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBCWYNKRlv0SawLPKobYziqUojJ3/x78GBDBb2XnFuXn6mIlwHLo+KrZv1ak5KiElsXHJ7WLp0K/8UFa2znQD2oUspzoejsq4kZt7YGos7zVbpqBjdxYYRoMOY66jIDXFm0dt5pUubGrx/YJagqf0ey7uHXhmZTOBAv4zKzhTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3dMq+Vq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jy8kf8Dx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3dMq+Vq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jy8kf8Dx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67NG718b198687
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=; b=p3dMq+VqfawZR3Wm
	EEeGohZrhHqV2cTLY51Auq6UB4CAaciPKw6RjxmlC3v0BimY0TwyxCkf3gqJwq+w
	QNUfs0ojv0ok7OB2Wz23LUm8hPsneyoFm/sBQrs/FoUgYFo0X+Yrr8DhGpXBKp8B
	sWyYJwWuEE42Psb0tGhalwZNOFEubgrs1nWuMmF5rrAXaG+KUpYwJdN4KSe3tKU6
	4ltzIWHE1e8mjXuY/CcuoS0ev6D5nLrpIL2WHEvJQwIUNvZy/54EQsfqNnDwrgfe
	wskZ5jJHEyhYOMFGUf5S9IdKKiHw9o/sZMZgQ5QslBoZrACsCLwYlE6tyYP3c3/D
	5DbsVw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740f4dvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 19:48:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso12100995ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787514496; x=1788119296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=;
        b=Jy8kf8DxrKoy1M+Ho5aI4CcTKR86CUhddV+0euRG0Ec8rx318ROFEsoCeIldnhE6vi
         jEH/5krQmd/5scBSQvLTwjpZu9vnP3IF/I44g0vYd7AOlfjswUsVaXYlAU6WA6hncB4b
         SbdLSTcTrCfwwTZA429/6/VaFs2VrQxktkxksOQXVaKoJM+5XQHwP5496OMwjkHuTKbJ
         1/OzUIV2g9REB1XpVa3+2pP5coIvMDRfJlnlaBD3pjZ4fXMJbTDcdwoxXiqNHxPSqhAo
         hwwwa6dv5UvF7iUpZnTAJlVuY+Mr/hRwlrYh4c8VOWTcGimfNd9jnOU/ABhGuhD2lfzN
         U8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787514496; x=1788119296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=faESQJSsZSzMQIUWsvbnCDla02Ciwf6cJxe2npadCW4=;
        b=RvgIqNjUs+HV1L3rphg79W5j9qKvietyLag1EMZ9LdgyjyUYXsCWNjoyYClGkKZ0fg
         WpOIRJDl4DN1gy2rKWdZTMzjBjIvy0eyrhflO4POSIO9zSfSWbPco8MB2no8FomxWsqB
         pTDV5UMqen0ptmr5yGcjaimmk/Iwa4bIFEVMEkAA5C1B10CRQQzKqOzKIx3A2mTZ7/kJ
         R80S0ilclnyhodTYUefBhwafgYhGGo8BPb5TX5HYqVBCQXJv1Y6F2opT8Ti7gNVO+YPd
         NodBQQ1O9POZpbHvwGP2Sq4n4GNFFBUbxWza0wMDVDf4IHRNJc7ccxjQvwdtebEKmILK
         LuKw==
X-Gm-Message-State: AFuF++n9ZBA1tP9THxTl8lnsuLMwMIAiBsEhFD/0f1HHs0ULlD0m5gPi
	/Zg+eWtQ9Q+q65n0H+Iw2i/jPKKpeoY9gKoxJ+NpoXnRrVjrYoopHY52KAHScnyZ0+SUvgnDsT0
	mlohSN66OdN4p/BksBL/J8tX2Hive8z++ZKjI0j7FIb1OcHJIyHXdeoOnJ14hXBlce9BQwQGaLS
	vM
X-Gm-Gg: AR+sD11XlxYPIUp4wtocOAuC3bOb4LJPU6mspWELG/cwYVcR/X+Xdf9AU6U+ptJpLUC
	MFt6hUvDWubB+ukjNh3atKqLO1YuoJCxhNZjF0d6s5HhFzx7qPakVI5EAgunVus02ILkqgDlGTf
	/Zg+Mimurr7dOmU1CkkeeVgzXTGhpU2X2x7lWqjAyUlFnhrscwlP0vHI4j87hcOdodSQ/rxd1wc
	kCys1u4NvtiTTr8L1XialteUDz0mhpSBf3oJqg30wmiA5rayfAHw6vU9QSboEUgTtzd893UgU5J
	1bMcv4tDDVNG4h11i1BB/bwNxmA59wH12Xnuezd3SXzaCknfQz0IZtf+GJ/+5x5ro6Jkk5SQ1g4
	ANeYem2JVc2YSi7xcjMBzQGAI0t9Hb6HC8wiR2w==
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr400110585ad.0.1787514496530;
        Sun, 23 Aug 2026 12:48:16 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d64a9f80afmr400110045ad.0.1787514496128;
        Sun, 23 Aug 2026 12:48:16 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f925190fsm32321623eec.31.2026.08.23.12.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 12:48:15 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 01:17:42 +0530
Subject: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX7RJ1YUeUw01p
 A/q/zHr0A9W8CiT7SM3psb15sUqATDCL34xTEZ28KDhGg++xngfWX0zDGj8Q0wXi3eeWtJvZFQQ
 Ozbrph2Cpk8ZDKCP17bHe9vvr7yGyScPgVs4vHmqHsWFnIifW6+Rv5Q+OClbnPiJuhGuPJQ9mn6
 1uB43FKKSPakapba/dkD7OXNZazO86bpPTeJ0GlvCK+6gcQ6GIc/J7TM56oRwjMptFBp78fRKuJ
 wcMB2hEEgNvW1EDtZeCpKC9A0XzwkltOQGiwnx2PnxLgesfPHFFdttXNgRMS+JpXo74ysnryvXT
 KuBEIlpm4X8cVLhqy7BfdwrbBmWZpdDMzM0xQFDf+ZIMWt2MLy/JFppHKaZv3nsywviBTgwiZtE
 PJt2ODXWAe01WREexKUcAaxIX8nGSCC1Xhm8C9KqdQw9aUctfKkazoyQOlfUHtOaKzCpYY2mPIR
 KyNMLjTyBppPdTw2g+w==
X-Authority-Analysis: v=2.4 cv=BZjoFLt2 c=1 sm=1 tr=0 ts=6a8b4e81 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIzMDE4MSBTYWx0ZWRfX5Q47UKNHV63B
 B6XVzkeOSCXTOUvHN1fGjrvkutvpRbbkfBPlchJD/EORQqfcxjJN3QqeO/Ikw7MBTaYEefVRhe1
 s+Z7HVwjUE/gamGeta/AFQbfoW2r0N4=
X-Proofpoint-GUID: nu618XOomLQQxzxxil2jnCyyXKX0rZ_5
X-Proofpoint-ORIG-GUID: nu618XOomLQQxzxxil2jnCyyXKX0rZ_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-23_06,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608230181

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index ffb13d61ee36dca61bb4a720c51001fbbd135a40..91f55244078a9122365cba635f8d0034f70d11e0 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4907,6 +4928,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&sdhc_ice_opp_table>;
+
+			sdhc_ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1

