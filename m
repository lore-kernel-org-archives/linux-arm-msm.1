Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964FB4848B2
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450905; cv=none; b=kMAj9pGUsBvmT/330HkLFAaVUtlWnd0v6dK2hCyuGOU2xJaWbU9zfuNYqMLPfiQuwd5N5xIJVHfr7k0A8HiSzgrEZ4Q+S7zv4Yc1kI6oQnxNDBBB/DTljBCAp5NhQkxc5LBhVHcIg/1ovWGRTOMIkn1e463sJ0I7uYnLf39X+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450905; c=relaxed/simple;
	bh=YeE2Wi2BUMtF7zA5tzrBr0/JR/oQEMbTew1TtJW2Z/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi2gGx8yVZihF22WdIM7oIOJ8giXK0Q+mBQWMX+u+x67X3UJLKVzUJB24LnrGaZ6vsrSbMnyhNZDWCz70XTjHYZm3t5zm8yIeUWzKsuJyRYL4IDD+lj0EeynRY6o2PEGQqmtalK1acnFuN1BWOke9qodrMiukmCd1zIPxI0qFP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEqh2Hjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LT8u0FRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEqh2Hjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LT8u0FRk"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K5jh1341817
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 09:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=; b=OEqh2HjvmrZI1S4C
	uW5eo6a5iIYMBp6WPLjz+QTs0xeo+4Z/vrkLEpdmx+VKcB9FbMcG3P2bXHs6KTbK
	6c8wZnj+07T0os4dyUGr60pOE2Pd43Dpq39ihUmxWK4LTq4KJuuaWg9jE6yV6ajQ
	vSdOA11Im9V/phrD/TkigHxQ+xcGG3fqGj5S1XtIBoizikxdnhTp8W4YAhwTkon+
	v/pilv1nRo+Noy3EWSxnBUpaJudBUqMgR3vMnGosqOpgt7JVoy3A9KxLiBhBIXWl
	K7TsiesciwymtSi3xdG7I/ZjRrJyATkXXFouolQKs0qxUnQwVSMGVqXoOWseta3q
	bYDBZg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2t4a6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 09:14:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5345230eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450897; x=1792055697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=;
        b=LT8u0FRkbU8qAo2McipRDcbUS7dPIAHbVexFUnV0ZA6rjzXaDF9QCDYuviPS4pqV2j
         JHejA5vcTJfSLzKnQq9zhrT/jyw4A7u6va7wbUbBg4p+ix9g+0+ejHvvF4m5ag7SXHYZ
         uY0sh2GuPwwCyQoWqQQtk+EmcPKzHH9XZekQEQgb74Dd/xWWo36/zd9O6Y51P5Py5/x3
         m0RWqqfpPJYhPdZUpUgl3lWC3YrMgEVn0HEiVoyZKXvKCt9W04slwKZABopuo6/ke4JS
         J0OJRFY9hlmFjkzaXlA8t93UQ/9x+Z70q18QX5oi/mgLciCWRW9cPBJyYxMHKu4bvYZI
         ArcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450897; x=1792055697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=;
        b=DoQvpfWKcKR0a0vRRm7m80ilT6NkXDYdZNoh4v4zYJrlM+nwTsi0yoQd78+Jp1HHnS
         pvhyHWdHTHpb9T7HYv2aH0NkqRdvsbeqrIeN649+8d5nPu+yz+C4I4r4GE3He4DRuLne
         Gk/TG2DnGTU4JW/TPEB0Z4vxxM3NCjKp94yogiC4kbo1ceP92DrnQLhOqcgEq1FyYXAx
         m1xeIGLbgpce3i8tS07iZgWX+3XPwa8+NusIZyBtHdUu3dASXN9Us73I0cJ35F2uMubL
         LwbaaIt2aPMehMq1PCcTvqK8VgBivGw/QEPDk7308MeWggKOVgFtFIa2T2Bfq3pERZXE
         uzlQ==
X-Gm-Message-State: AFuF++ktj6HSslTWsmZrPREP5WXF32XEFmZawBzmat9eJ3hwowZ9Y4rv
	kwsy/Ac8Ksj6Ssep/8UkeBeLXTuxV+AnD9hOB5iiAUNllU5ObozGkLE+lUrIv+lMFQ16f/af8kL
	A+oPnl4rjT2licU2gYv8uB/fWuNPnsvd378n3aDoRhmMKFlfAStzozIrsSzpAPdpnZN8J
X-Gm-Gg: AYBFou01uTwz/1iNXSOVr4P2wQ5/ANE680e7sb8jG9ICFP+bSDsTBAktpQpF/Ks0i8B
	8PjdWH8npVmmRH0uhvKcxxprwyXd0wP6cr48iGnntD7Pdx3xqADSdzqR+24vSQAZz7FZunOOgKe
	JHjTss0/rsJX1OTsa7M/CegOoVKWcNliGNLU0kKC8XMK13WN7pZiWzCow9BKpXPuYMBy4/UqFL9
	G9aP/wMKXKRYXkGg6cgsk995E7IllD6Bp4Fw/gRfAfXbe9MQzUPpYM0TkOd4p9aptaHdXDWcRAe
	FZWT0ZpNN6IKZGDX1OBVomkNGNgFNHPi7QwexDNuaIgCbPfDODRfrdggIJkjJRQnu2qntypVg9x
	fvLWhjgFjA/plI9b3NfemtRkw5+0pKJUCMbwd6yksaN45woWR6wplTPhlMNGo0MjKWTxn1QK4mK
	kd4Lf8hOTTm45Kvr5HsNF4uPc+hz80
X-Received: by 2002:a05:7022:150e:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-1620665f626mr6023213c88.26.1791450896898;
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
X-Received: by 2002:a05:7022:150e:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-1620665f626mr6023176c88.26.1791450896338;
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:26 +0530
Subject: [PATCH v6 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-6-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX3vZ3HtCV9Ygt
 A66nNCAUiquFwqitb2UUGQjOnYVZ6HRr18aHeXu3XNZEdyVphpEpx9juPWMxo4HNFxZM057hGeJ
 +IIfiYOCox6TvUgVXAGEHBXSmpp8Mi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX2lbsxf+Uz0Zu
 7kAv8sx6Yz+6tdIjHtvnYcIXHmKiK8RxYDKuiOdNYCeepgOb21px1NI+jHEY1c2j7xcwtsw8xNl
 nnPmX5vvtffr1CI3w/PgJj60hmxrR8R3Tpt6LeHYWVHrmm3pwfUlHWIk+gps1Xgi1+RdA3B8dzt
 Y7qRJNTzLGfbMSJfLmJhIT1RcE3ieZD5XJNpx26VhuEsDpScGvDebZCet/4fsU8xjvs/eKPu4Jo
 d37Q6JmqxQciR+/XjJHEVJyKsFrotyeV/UUUCiAA6C9tVaBJemO+IFN7TopOwPtpJWKC2BxRxwF
 c55JInG4TLpYBCpfFomsxdNbRZgGXuk4gNw26DqvF+X/xR3w2G1EHttk005r9wMt6ZOCFNofUAp
 r9i+DeEzD4JnGXuwOvzUNitc69vWkj6ZGcu+ELsu636y89GDcxoHaUGEcCQ6ZbQqDHQ5cc44Eb7
 j9mB+tuGR82PFLLCLAw==
X-Proofpoint-ORIG-GUID: wVJSKiVCJw5QO4l-6g__n6QxXICr1xCm
X-Proofpoint-GUID: wVJSKiVCJw5QO4l-6g__n6QxXICr1xCm
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac75f11 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 331589a9c1ff..bc9502328738 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -416,9 +416,11 @@ uart1: serial@1a84000 {
 		sdhc: mmc@7804000 {
 			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x07804000 0x0 0x1000>,
-			      <0x0 0x07805000 0x0 0x1000>;
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
 			reg-names = "hc",
-				    "cqhci";
+				    "cqhci",
+				    "ice";
 
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -427,11 +429,16 @@ sdhc: mmc@7804000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
+				 <&xo_board>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface",
 				      "core",
-				      "xo";
+				      "xo",
+				      "ice";
 			non-removable;
+			assigned-clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			assigned-clock-rates = <300000000>;
+			supports-cqe;
 
 			status = "disabled";
 		};

-- 
2.34.1

