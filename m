Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672F55172EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687473; cv=none; b=KjRHi0aRtr+bW+jxrjepVACPLehLn5MfVkE1ZbB4fRH8WdknrDNKFbE1W/NVzuR+kOwBhJOH9XwsD2mJ7Cw3eEhegjKr5UM5JTlIFDFbg0KFVKfUTpkeMniyKt0rz9N/IzqHRGl1pYF55q74DNPTdkX/dFJbFmErnI5FoTXLd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687473; c=relaxed/simple;
	bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDVXItl/Bk+9UMBgPpEAJSydJswNlMFSfKF6QmhejVfAQU9TSDuCUBHgudpuPkOeitJCIt3TDN34iOU17G5x9AaFwkn5oDqPwU0A6DsW9Eisztrfm0Rb6pdoERSQMrx2YMbSutFmK5+z/bTz4wD/qrEdhJpAqo/pVZMvekQ1fi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhjpGHvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dep614XU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhjpGHvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dep614XU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqepI1016868
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=; b=UhjpGHvHufpMHFq5
	ftjDy/iEPRKD/LqaDlqNggm807xKA0JKnSyGMg8OiXCxMCapx8qxxTBs2lLA2bfT
	/tijdpjzABLT//fcENZQ5/l5u80uqM9SFkFS+jSN9dnc5f8GoO7shVNGKqUJolb5
	IjoGWDjBU22Q0/Y6Uxp0XSHqYnQyf0O8jzUI7YFAe0qmkI4boaXTHLLGFe/TDifi
	/g3L6jRfOjrfvzh1x3UI5INltYbFUYuoBgHr3C5wrvX6xUD/Y1Gyp/W7N24zBaWH
	ev5UUwzV7R0e5MF1O+rO7ued+W8f2Gxu13NWfOcMWJRDqQdiTSzUITWi0+rGWwcD
	1AXH9Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj4de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ab4b1c09e3so4252247b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687466; x=1791292266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=dep614XUQZoe0Bdawzvt5A2jpn9VPXMSaSDUGKOZMC/MFTNXOPfyXvxA6wnaoqdN1j
         20fdhvlaY+C92gCutRP1AkGjsoWg4Xj2YJnjwrMHyaeOHMuYixsYCD9A1DPLD3SHmBiD
         kWvDuv/dDtx7SGHk5qZT22P5klPQ/QZyiLtEDCrnr1D1tXp5OpLm2p1L/rojJOXYkIwt
         dN229t6dXMiNpBNb3KQ72GfzvKVAnJ5l0rclbPBRDYQZt4pxmGwc+lyNuEepUMIr6x22
         FvVyuWTYWmsjoICx2oK28XmR5styhEg8EP5gfFnFALuSTEVei4+YuRS6PBvtRnnjxXXv
         wnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687466; x=1791292266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=QSGmf7IJPARwGyDwicuzPW9K9wbAPy4OierZ8gfICq/AI3SWpMyRu1AWnP9lDKmz+j
         gvcGryuNGP+1bEVhVQSG0omLXoWNAyQ2VY4OvbH7hW7HhpqLwoVSeGsfgNnecGD4lr+P
         hp1WqytJ3wj5+Woi0ZS4IHymEzbMFXTdpO+3n/g9eG47oeXHKPIgjh9V1+5YxJ6jhgRk
         OkO7rvM6HtonEfM2uSJvMmztzkM4EmUDWr/kSEK2MBgMSx1z41+vB5Q16hpzpP2woap5
         PxxJpX05UMjSafKAlG6Bl/NfD2Q255m6YqGwzEa3dMMGfvyl6SjEsWlmtR2l+ocjyJQP
         kPsA==
X-Forwarded-Encrypted: i=1; AKwUvBxc4jDZElvaRVRd+w8TXAKFKg1Q62hjqDhGGoaynSc7yf8XJZolvGwAMinkGxe6kIEIOmaA0tx2rbXkG00N@vger.kernel.org
X-Gm-Message-State: AFq9FYJrZIYtjXQlJ6t6gelQ3uddHNL/8kUlVnSW445/EP5XOiba+f+Z
	q3tP0bpQnn1nRsMuuvHnpuOjX2bUudOe6/4fTbse0Yj+vUYIVRdmd6N9dFEyM24GxuLm0CP9STa
	KJg7krpCU3EFzTzlp7OsZmBN8E5rozdZrxfP+wHRiGFK6Wu9O2C3gvfWzai2bEVNxAXXe
X-Gm-Gg: AYBFou1hCayLAt/OBxIIxWssxhKa6grxflDCBbQjVDNHiZSZGiDz4VPKxl0NhEUPDc6
	kWL2c8nJ0gsr1mOlEzuzf+aIy34m/viATrQCwTgzJRLJj/zzH3CxNurg8cpItCfFH79CkyKA8Rq
	BrRRtJr/6biLw9dgVxvsmabjS8qv2stJBezFn4kfuKZNveLbstycYcyRNfGcFSPzQp6FOmbb8kL
	5YAXZnQpVYfHIPHjXx++vA0euUZ8VzoRbLMbmBN9oXJaqS+iwaE9Ih8MoTX4+ZzGld1AJE7KuYC
	5mn4Tse4kEexgYGldmdw7D9jHbv6vvbda2A2E5iF0r1Nhoqz69XFNbO5/hz9viDHhDRl+5qiQgd
	bQ27Me/iuFMdmSn7vnJWMy2lcMQd1OTkMUqo=
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4905087b3.3.1790687466500;
        Tue, 29 Sep 2026 06:11:06 -0700 (PDT)
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4904807b3.3.1790687465845;
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:43 +0530
Subject: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1156;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
 b=N9asyPEV5SAQjN6BZDkKDJAlJsk1cdLTDMCRKqhxEfOX3INA/f2qijBseQsvyuNTsHUs2s82X
 pzlf5i+gxKLBbLsyH5g4Fo+v6SkPB2N6y2MQgFj59r9k/9z0iOwJheh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX0oJs+jxFGI/M
 WB7pfBa6IQBqnM0XoMqq68gdpVGOPgoHAOnmZe03vivwO7a3VNT97s2lZH5n60vyD/aTC4jEKIW
 d/h5qU/QaObckYIXi3F7rtcTqZuxj7k=
X-Proofpoint-GUID: SBtWhgmsI4FA5HZGFf8vo27LDwjRRaoh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5XPdcwQbKV/l
 Z36OO/27nEUNE1zBZMqxFYHw+V8XO6sgPwh/l0N6T25IOeOpRyB1pblaPFz+Zyn1QvZZNmVOioS
 Fspy4LqayxmDWhGXItGnc4AhAcIh4cNoeGXF4+uJkzBXsEGMNF7WpU2wgyCz6H2MtdCU2NR9Osv
 nO18JQtNSCIu4RWYwx6U69VW3Y5nCxe5u8/txqAEYLmCejrVaOagiYtdrkw+bKEFF7ccfYynm/Y
 JXYZ9Wa5uMOj2+B1kyFvdGeXL/XJSXB6iBznYCDSoMubr9gSWyryre1SPmcQYRf/BYuKTHvd7x+
 etHkz7xN2iwFK53URFjeI76s+g/l6yIFemcQntPNQYJgEed1njzYZzBivawacyIBIqGstZ0H5KV
 BjQwfS1UGNwWLoOgknNtp8mSkiF1H49jMZOtZ5R8tSpUfmAcujVRZDmRBx/iKS967ahPCp7A5CG
 teEiIdmJJWO6S/ZwuUA==
X-Proofpoint-ORIG-GUID: SBtWhgmsI4FA5HZGFf8vo27LDwjRRaoh
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbb8eb cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

