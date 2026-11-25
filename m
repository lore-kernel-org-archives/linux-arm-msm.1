Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594876;
	b=rzWb9i8XOcpSeSNml435qRHISSM1JnNHHehdjKeOpuPVbXgojMum3D8OTkfeVKEirvBe
	 W2DubNhID7cC0svAl1+0KQ4vfThDGGDcbGOg42ck5NAVe0W741o6Nv19OAy2Kue6S83bQ
	 v0ZwEt2lzQLCLZzZ7vEkf5ehisjO84mZwQxjbCoRvZuzI3tbnaX54ZMyuTBXzdMxtwxwK
	 wqFEQqowrao238d5VfZDNadI4teo04bBA+zLWaTEE62PvUWNol55ARPedpkJN6no/4U0r
	 SRxpuy55t492QdaV7YM07en3TQK3QoSEOgySPQXOMbUdBCEeeH0RSHhKKWdVXSbg4hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
	b=rA2tx5KV9NhOiyiCAd0pPc15t/3XuxWEe9QGJBTyNGiVe9D/gui4i8P9sF9KhylhpPls
	 x+MxC1lxT4jVVb68giHXMoYhidNQf8ngFAPfwmeu9hMM7ZcqJr8Z9TlXnkP4On8czjo+0
	 P+5ZZJYMy7oir8hIQj5BbveSPjwvpsdpkn5BAK6ThrYIMCyJyzxcdtzrvp5qeyXE5jEaH
	 HJwC3sqQ9cSO/c0GYPopeSAoAfiFnjmqK6AcsVObigew+eELNceXtNT1yFykrD0BnvqRj
	 s3DMNxsQlxBTAmuQl+eFwQJQmS8mqMtCMSrsrkrNnNvrInlC85Ykzg6/c3z8VA9VwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94656606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94656606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jhadZxEY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LM8ULXLg
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68cLC3142871
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YX/v4KdXjY
	ZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=; b=jhadZxEYV5CI5SSNpOiSzAglWkt
	k6r+va+QbFtvudZ4jbDFQzErTX+DemKvZoV9CdAMYepUDrclUwECiU2JSLmyPLzW
	mjoCJwsJHcIQfMcX0svpRWDHklXdwIfUNDocNcnKTUgiRZy21e2YrvfWT3jwp/PK
	lBFuCrDfl07SDEMNnHHkewX89UKfvEyzZFRkQ28Aow4hXmvIJ4bIzEyuYCetHkG+
	KTwYRB1aFNykjUKwm/MKklUL8nvGN1ba+hA7AuI9DqJRUeooiSCX5emPc6oxFdw3
	5MG4ObHz1b+Lw7sSgQH3gmiz4PLzPoHdagE+9fCSjGiw50lUGh7wQPKigSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29qkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f074b87307so30942935ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594873; x=1796199673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=LM8ULXLgAq+/urlUzCvyZ2yXuScxbIImKze0fNmrAnkyBOOorfZpvL+OZACOICRLiL
         S16yMk1H1wQs1hfb66VrjsdAzE171R1nVeShsfT1ZIGGzjjP84n4h3QGU2+lBvIXp7Hh
         exTrV8YeZf1gRxBgo0Zy3RyWa+foKFJOVF6DBhGy0ss3JPdyKGkHIk6XMAW7YkWZqDxe
         iSUyKETDcNjTQb/lspBacaSn2uFzuoOtjpOmAoZ17iuZ8QBAurHr7piT0PxpGmXvqczw
         xjp4c65JpYKT6iS4k4xlCcNKWJkXug5s4XmKwdGVpz6uoijFx+lqkbavlrcIxwfsrTnc
         74FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594873; x=1796199673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YX/v4KdXjYZAmZtmxLqFGtH9rrK2M2eIocX0pxXwag=;
        b=TRJnOp0Xp6DxLyNJug+XdMtHD0U9MxsjLGA0SqIAoZ7e8kN2eIFtu8m9Uc95tVpXqY
         564UO8N3vVIeSApOaRILjgSeo+ZUjdVkW/F7Uxm0uunkKs2fc6kH35GapknpwcR+bPWQ
         YbRNW1e8rVi3Sa+qxXo7a7XHACRo0FMYZlqSh7Mb9zc1mZ6Bc7DrswSzlrh/t0pfDdi9
         IcbxgtRYGRODrAheAzRn1fpPwIagh1bfPk6GmTVXyOMVty162jNZ8YY1Ek3UWNgo8OxT
         p1WLUlaVGPwdaOSLbGLvdwjX0xhiX/0gESXOG2HqSsQLHuuG0mvWYj8Ksrywug2a8wxa
         mf8g==
X-Gm-Message-State: APuU4Z+M0uLDupQc/c4gYnOcoYq/+EseETbNABHqTQIgWVoj+9rCNcCk
	8W8Av47g36b3VCSn/oDeAIEYTLOOexPk4wq2qRphZSVvlsoF6wK5+AIaLLnYqAtOIT7kASNfEUZ
	5kD8yLyq/4hstf0NXq3IW049A0/gUOcj4QynrckutugnONM+CyWqchH00ndI7S4LvM77K
X-Gm-Gg: AZFdTZdiydKkRQlMDSbeZOlWFhmQrcBEu0uAW86oMCCRCIP54jjdQbGpSUkli2nuGcH
	K8G8Qj+mBeUBSATp+/GadfCB28JLUg40A0eWArt2XYP0Qa0Cpl68v73RwqPV0T3SCKjLBqPdSE8
	PfNq4huDPZ9WpLh0285m8vNVYrpJRFrNoSGq6XzTOWcxD2Hv79CzN21vEb586qQPr7/Yu3ezUNb
	V7OKOHPrlqEhD0xMsdBZTTBbnHLXZDMa3mKKcXWdHsOF+RTZKEiiT3ogaTxLZrT8RCr/GMu+vB8
	Q6TM2xC6u2XJ7p7Cqlb1rQOK9Y1D+LXDu9tPW2R2C7Uq93PS60i8IqwLmeaJjCh1uUzJ6plHlmJ
	wzguLgJ8Te6vwUJ/U4y9d6NvjWsK34qvzFirR5zEKhk50hNhcm+BfoIucuEUjoJT4uzVu+hIs5r
	e1KGa/o5Oy
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225685015ad.17.1795594872629;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
X-Received: by 2002:a17:903:19d0:b0:2eb:3522:99f9 with SMTP id d9443c01a7336-2f03f15664cmr225684625ad.17.1795594872169;
        Wed, 25 Nov 2026 00:21:12 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:11 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 1/3] arm64: dts: qcom: lemans-evk: Move SD card support to overlay
Date: Wed, 25 Nov 2026 13:50:53 +0530
Message-Id: <20261125082055.488583-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069a79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1d3nOwRa87lU75lj35AA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Pcaz0IxBytVQQ6NhAItKmK3g2k-exvor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX25kwcTqs5Eec
 eRmo4jNSbsrDQznOAbIqWLgJARQgnjZVRvXBMuB0dRu9JV98xg6j/onpwiUo9rVMkJOwZwlG6GF
 xbzP6JgaOWyniga2vu7Y6pP7tYhNYbP+lqTRVFHKWU/oHSZutYAh41UdLzg1QTw2k/ONkZDR7qe
 KqIIEds1ZFEP0lkgFnJFAirKNQuhFzcxBc8ygDK0+SGaGWiCKhQRzMeEpEBsC3LKX0nWFeTUtnV
 p/+k0Z7hABnKauV2+ImB+OnLyFGZfvKRckbMzDgZff7JMbkAxa0RFO3x/KUl+qV852eU1FydEOW
 2+dxtf0HRNk4kO/9dxmQeEdWe2W2smyJKJBBJEk1zaa+4JYQIS4kg8HbDEn4O4YJe7fpQPmYgNk
 AhuKJL5lfmAQSrW7Z5jmWYVHFWvg6W/At3Ls4ZTz+pHiXe4sqlUG0SkCBe4MB1gFbza6s+ZWMPp
 VYdM6DOYPsT2RTBCcCA==
X-Proofpoint-ORIG-GUID: Pcaz0IxBytVQQ6NhAItKmK3g2k-exvor
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX4D8iU7oghKOW
 VTtjMqAYKt7JF6heZL4StmnyTFp9B0HuEIUcfbaednjCDpbba4+KG08cQzPqDFTVa4pxrxJa9O9
 Teb/q4q5ndvaI1GC8orhpdZV6fqScpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250033

The lemans EVK board supports either eMMC or SD-card, but only one can
be active at a time.

Move the SDHC node for SD card into a dedicated device tree overlay.
This decoupling allows the storage medium to be selected dynamically by
applying the appropriate overlay for either SD card or eMMC support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  3 +++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 ------------
 3 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..fb894ff002c6 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -67,6 +67,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-xiaomi-nezha-cn.dtb kaanapali-xiaomi-nezha-
 dtb-$(CONFIG_ARCH_QCOM)	+= kalambo-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
 
+lemans-evk-sd-card-dtbs := lemans-evk.dtb lemans-evk-sd-card.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-sd-card.dtb
+
 lemans-evk-camera-csi1-imx577-dtbs	:= lemans-evk.dtb lemans-evk-camera-csi1-imx577.dtbo
 lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
new file mode 100644
index 000000000000..007ab6347349
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&sdhc {
+	vmmc-supply = <&vmmc_sdc>;
+	vqmmc-supply = <&vreg_sdc>;
+
+	pinctrl-0 = <&sdc_default>, <&sd_cd>;
+	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
+	no-mmc;
+	no-sdio;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 603a3fa18994..05a6e0c27538 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -962,22 +962,6 @@ &remoteproc_gpdsp1 {
 	status = "okay";
 };
 
-&sdhc {
-	vmmc-supply = <&vmmc_sdc>;
-	vqmmc-supply = <&vreg_sdc>;
-
-	pinctrl-0 = <&sdc_default>, <&sd_cd>;
-	pinctrl-1 = <&sdc_sleep>, <&sd_cd>;
-	pinctrl-names = "default", "sleep";
-
-	bus-width = <4>;
-	cd-gpios = <&tlmm 36 GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-
-	status = "okay";
-};
-
 &serdes0 {
 	vdda-0p9-supply = <&vreg_l4a>;
 	vdda-1p2-supply = <&vreg_l1c>;
-- 
2.34.1

