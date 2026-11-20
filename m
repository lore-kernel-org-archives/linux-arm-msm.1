Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165191;
	b=QaePbtSQ7YJSt9wH4J4h+S22AELe7Gn4xjVlBJX6hC7dAdSASlTsvb3O/lleisPzOe9s
	 EQFoe852UMaxRy/+2Htz9E1ycNFOSzBuChWhvEMxmW1Gv6iYvbFO0Bvgcw6Ecgen2QEnc
	 rlb0nYTcmTJi3FfrjibhtChJjoeapmlNjdiQbNhbSDqiN30ZOSB9Wv9I280wqeMjcqpN9
	 tQTqbG+NajL2f0yQnH3TGBUXK/yxfUQD8zr+mg47unv+K3MtOqVMi2TCl9umapkc1uJ6T
	 cnj+mGpkadbONbgeQ4oHe+r5TC6pLk4P4zSDrfh224KMXhxXavQIchoNOxmCsZscqiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
	b=xi4RqwA7XfXwfjMC9W7zDi30V+vUPqtzWwRgKI88ItnuXXjhKFEW/xrSG6bdvEHXmP1e
	 fyNJ2YFQGpzFtrE8416hxwVoxo4wmuI4kT1TF2IXqrCYF2FQAc3KT6NJ2CUAEfbfbj9sH
	 xED3kOxXBtSJOsxZDufpGxrEPw6qi8DwZREnpXT4PA4MqfCuz9+RxxIoC3C8QfsRlyUGG
	 PF9FjKiteiOV8kIhEAxbSsH542gPe3tBT8BHcxzOQXAzeUv0hUgqz21x+I4lUW6egMNUV
	 Eub5wH91aZQp31eYt10DQ3hBLYGyNhMTpeTXrC5wwMRhfa8PcMsInoSaNjrRDKSdJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A1B60A3825
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A1B60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RswzydCV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSiAsk+Q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK8oc59803786
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=; b=RswzydCVwpRN0aTB
	hKXywHrnYYcvTSCB/seaXPvfoeM5J8GcZpTrzQrVMQvt3hSdrMXM5ZhGDyzCTVp3
	K1Aqh713GmyPhl867lXvmCQkn5RGuzFTmQz8QFkH7oKLMuLgHQMsNC3Kpji9wahm
	OZUKjKoa6uovVnGXZMCrmIJa9j7tUOMrKEPj7GTp4X4b3RFfA8kKT2dUQ2mhCPAQ
	9zMhy+tbsBArlQ3+jBJDVOf2dQ+M2p+qBks7y4TWnaYEeVzKN8x+g86r6MUi0BeV
	DwzsM800pbIZKxqVkZycHIqUpwgomPozrdxl1XIcwJrgFQ2BtyHxyI/W9jU7K7J8
	uE2Opg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjt87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:43 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1886335c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165182; x=1795769982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=cSiAsk+QRq/Gfs1mAGfjoPbiSjUgl46pyDp2J30Eqjjn1Xk0JRjf6e6eDk93RJydJ9
         GoHL+SSfn9bUtIAa7/KujYx5UMjCh9B2DEHK6G2lfRNKph89OwqE3yCvKuAihFSeABl3
         oLEmeLnw2CDm+ZqWRzFgP9KDmGcYPKoNsIiPyaCvvYOfNIX4bNepy8+IcIZk4rrSMQUu
         Dq0jzEmZ9HT6mNJtSVnDVAn+/nPb4Zrgoqs4Gms/2XA1uIqsyMkJcW7/kfvUGWHMv/5w
         4jEUEzL1OhdPtCCCavyY6sXzxjL/jZEO5xZzshomrE8kSm/oivZEcx3LovQVc4pDzKzZ
         hdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165182; x=1795769982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXyAoUsl8S1Ght8aHRrrA8siQBsgi/pQkX09ttPQ2/E=;
        b=W5QbHzxhgD54tAhVM3XzgsgcnaixpgBU4ru51EyIW8KMmJol2Vn7gw0QNW7PM9oZ/S
         +x64hFFqHA/1D8vgVUnfdPTkeJB+Tq2e19BB3Fso9pNYCABfUXj7lqxizbQ5rrX5qNF0
         PLoZfKbSSrAkijfa7mo8CpM70ve2eD8WB7YiQg1QhxTmc54TAHfOgClzm1wUUFJx72FN
         G/S39VbAtnJkIhZY2LAUyO3jWDozhQxm3DI08PW80KELv6FDwtqTuF78D8Z+v9roK5Cb
         m3sxHZvz9Z/dV8gzXtTIpA5hhqQJmLl/ci13PDXlvPTPGbEtdSAndENB6AsKEhNiW25x
         XEIg==
X-Gm-Message-State: APuU4Z89osZuQwl1PIZdy1mVkFSqeq9jnP+qxe+4N77eKHca0DIBUfEw
	7oXLE2mHbsCv5u8t0mpS6n+LMYZ0tZyXBwuFx50f1Xw1S3ejsh12pR25Y61Zqo2w84MvVKZJwkV
	dzYrcs0un4Joi0RdFk9mSwAM/hejXvzgpgLTzaip5OMpihB+0xeQ01MrR50784Y3vv62wQOUJFe
	we
X-Gm-Gg: AYBFou09hFrDqt5C+UD83U+RDlXYT2IWkj6XpXyOWJjPMjazTBYGXfV1yMmoUIMlIqL
	v1DjvbprYu25mLYC6ckcsNYMB78kGTV42JKm02t7XP+yAySc+/NLP0PoreNJeeTogom8Ate1Rxm
	TBe43ViS8VsHe5Nbb1aZR3BKqNVv08V8fu9oBqhCj7dyQAr4F6+X4CFO+hiCXF3/uPCgdEuc+/t
	r7nn0eAVS2fvDJy82YANn9l07uWAmEFHz7ie/srcmkRQMEBIhTz/gCvojld1zH9XAVyO5y8YN3l
	wlzqwBrk7AJHDKLZGQuZW24xjQK3GIhm1JV1JH2wonszETREvwEx/WdDgS5MKc3N2TPx7uHLlqe
	jhhHKDL6JDh3pJ1blDEV8Urw/JV2k4yWFBWXDzCqLwIvlni2WOzOn2QrRJ8IzPCoOWGkVg2e1O1
	9xJQZ3crQf2fb31lCOJnxzrKOMQe2r2N98hZoyJT+BLUAM11QIHtCW4fNPcdI0dhTATvOw3l6r1
	dg4qmg4d2s=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130562c88.38.1795165182294;
        Fri, 20 Nov 2026 00:59:42 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr2130538c88.38.1795165181856;
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:41 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:09 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: ipq9650: Add RDP488 NAND variant
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ipq9650_various_devices-v1-4-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX6whMM4KIyFbv
 uq3Y/9zV25hn4MCfYUnZGazCElT9425rB37JRHF+Gj9sES6j8vG8XFdfXg+0Cw1Dr65FOBc/ouW
 0AtiKj+Ds3mzQ93EeRBXgmkl26KZsP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfX2JP+JKSIM/0a
 eKXO69jgncv6gPBoTm1h/NVw7/6L8HTXpa2p2f93wkGhAHFvJEjZKy+pRXhKIYbuNlHhVEBQOfv
 KQHfk0TKAuvE0lukP/F+UsQVpQWTPSeIXcpUoDgOa89mtRHZ/jRTonc0JxW1ZCA+shiYikzg03w
 3NN/gfWk/mEFuy1vFIc1YOkBJVIV43Rscrr/krL0Bv3GfF26ckAJ6vfr2rbS3KA1u8Q2tg6G3cr
 XmKmvf8imk/W2cxs2DFu9RFJ0F8Le7GELd8AmmpwKaUPYCw2tugDiN9WABwzUD4vB0VYpV+gKUX
 Oeeyq/O20C8oyV3TyHopq8POXb5ZZwErFK2Zfsx6OdI8JAPhDd+yN5bazqImmofBqTdwPoGMOd3
 9TS4kso8wJsy2/qsZDuTcDw6do/iLLQeSPmsyPSUMwTSPPoJ2mLXRqazNCnW5gt3mvTl/gftnsW
 SgYmDZPb0LaWA2XCmvQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b000bff cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yQIfAQVsIWg_aQGHYmsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: snfn4wrfC1dYdY-Ysg3AVv_7IVCj3-PP
X-Proofpoint-GUID: snfn4wrfC1dYdY-Ysg3AVv_7IVCj3-PP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

Add the RDP488 NAND variant DT file, include it in the Makefile,
and enable the QPIC node.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  2 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..f3d3de3a1f7b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -60,7 +60,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb ipq9650-rdp488-nand.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-eea.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
new file mode 100644
index 000000000000..fe592e04551c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650-rdp488-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (NAND)";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+};
+
+&qpic_nand {
+	status = "okay";
+};

-- 
2.34.1

