Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612704;
	b=H3+YYQ/ZDgQwr9TrGV8mqf765XEHBoExDyAuNmzvfPOIgH/7Bx+w4FpaOJ9ynMa2U9a/
	 lTdffJjWN84OmjBHpEIBt0HZmH+PIdFY3RxFZJvK8gkDvRtQuBsgkL6G5r6llnmCY/Wkm
	 p/8auADYE12ZSF1+eng95SDHU2rP45EaBWvHymEtgRJnJUyoaXIxk1WCx+PQ8rBlHQ+8a
	 jU8hJZDJqBH97oALMpEXoO7xUSw0YQtnZbNQbCmPjX4/L/1EN8N9UOPE4WHAj1sV8z0FI
	 XKrt/vakP7whR+AgWfhKeuSNnffGsU7hMhfTwdDCWFjCc6TAKd8nBpRswXVXHRKkokg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
	b=Y13RDEq5M26QJQhqw/onTbo83rBoWyXnOucVC+M05rGbzN43cWOBGVsVxT3V2VtO21+2
	 bdubY9QaOptn4IPhYdDAxWj/tZIt+kAhvyv9oCAIe9Ytv9CCuaTtCsIfX2ukytrssmQNA
	 xrGsY+6aBabX9SaHh7FuVGAcr8YguisN3DDZp+LPM7jeMZpeVveK3omspX+hSwRttB9qU
	 OQ8AupmT85DL4esrO0rQGNP9c5Y8R5DrYdjX5dtmwUBZctqLH/WBBgrx8FNS07F3FmlTb
	 TfPQS1QZ2YoPnfehTnlRvzR9L6h78WYGX65axeWYyjApS/2vQbw3fZUCkI7pJeL8xrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YsH/mTW8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AED606A33B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AED606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YsH/mTW8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6dhz6dN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mCxS4130803
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D0rA4mbm0Sn
	OvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=; b=YsH/mTW8Yfze59pzM5U4jIYv2AR
	BxHVjutTBhlqU+LBEjrFMFvNOZLZndmn5wfLF0IEWgYaZnnRc2s+QXSaUX0xRHJC
	LUyNVan2XKBTxTj0+gSXoU7stPJ2/fSrRY8JTiZeDoIL7O6S06vR76kdu25obYEA
	HGTJ0Ki6JLP2aTfyU/FHA9oquSZR7MHlxHMchdhIdgU0g96vOwF2TByBon7oJgZr
	0P7YXTRzC5nLQLEM0FJkHQbXDVcUNVuY8/X+9EtlxatAUJmiHwc0UEKgbEGEZCnq
	8/2mRMF++2pns8NMIrdqc2u3wsUKIa4ZT1PKh/isxQgNjsxl2jS3/hcoFyw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhs0gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so1043847e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612701; x=1796217501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=c6dhz6dN3FwuJ6WDuZdvcEA7x5ATZMTXQDkK25+dCgcWYQE+KaM1NyxDYuSrrMULLV
         ZwwMhsYJ4xb7lfZ2/4SpbxAj57UXFEzbQ6/u1wkBpUspgIXZs3/GgOkyocFgdkb4sQW1
         xGhsBqzlJ6cQEOm3hKxnWHSweZKwCdmjjuFrZSkX05Zugjl0CbA1V+lyTHb/W/97LLUL
         dtqQ8MM0x1H4XWEs8WBiUhkiakKZlONMEII7CFnxLfkkfFpl1ayJm/ghHORc8lUPyjwy
         mzBX+kt9ArcdxSXvAbVGWOVG2ZUTpxgLD9yjXvoKUfrPblGaYoCW3n/JA4Kg+5C5WAcy
         pGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612701; x=1796217501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0rA4mbm0SnOvC13pf1fD8JRZYtCZj00L/zRbkMsbxU=;
        b=X9luP2uM1SylWbN9o6JDjW4Zgm3uQwDYZ0zW++M+/i1uTsic2OpC3y7gT+uzDnJAas
         4K7djhQgIcSL+XUTrvnw3RpIvt8lg6RvSvgU9idGii3UMwF8q6Ay+sFwZyGdesSokObT
         6Kgp8Bn2lkcnKvWROy+SZsmMemx8TRH050gxJHIR8/PEHgItuvviRe4/1wyQu+USr+Ss
         1a1I9pXPU3d+KjtEWV2aHNox8M7QtTj/n2ohkPh7bb86mcMzZ1GcoLINCdBJ7cKSBA+s
         8VGMul7VAttBWGnfIeqfcgQo+lH6AXhtsQsgvzoPs3iMZJ+vG0+mfJoRnI81OmspcDPn
         TfMw==
X-Forwarded-Encrypted: i=1; AL+hErE2vdmdVs3Yi68tSX5vdlqPjhnZai+Q9XNP0EFWhT3hmaox3lvczb5SavH86GXg+MHKuZBs3ASqRsDU48sz@vger.kernel.org
X-Gm-Message-State: APuU4Z+yKjF/Q2ncGptvvYTr/AmY6OJcVEfRyE2nJfoaqmbUdedF+t5t
	drMVH5GXOlck+gncCKvSfiaEbK/jlkD9qfrNlv+K/kxUVNUhjh53CAYe8CV4beSvnfe8mxg5052
	ALRcdtrhTqkq47W2Z6PiSe/T89X3fYR+7kZyyPFSF/67CLEzz6YmolSuTG9uTTDoQDbH6
X-Gm-Gg: AZFdTZcgyoisRAZsxzwjIWHA5Abxh/5q5Yc3l8fqap1i06lwtpIKTsfjBKhJlCaMsI3
	XHn/72/NWiOxZyPwcKUtjPC7fziQ+Vw3E+T6taMc0OumFXC9/1xCCqsD66+jrKuRHQTQZOkDhnR
	KBMadtmIyz3OkaJb8sOX3MVSPXT21f0HDAnNBI9ZPBpqLXgUDWRshbJRJ7EGtu8qRV6t3MK1EPS
	QWdbOYkawTghkNCVKEOljxh2X7/IiFiOIMCqnc39zDtl9ftcP3Auy9fB3NLCPM3au225yH9OhPq
	71H4Vu3qvUyfcqxCIwYLsj93U2JJDG4z2fuxoKAt/AO05CPcrd8E/HmVwsErQzd+J/TNsWwkj4N
	0YgxEY2sDF24ltVV7DzYErXa+8wBzI5wI9hAFtl6rm5R47MirYGJUE316eCgQMPue
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557117e0c.0.1795612701291;
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
X-Received: by 2002:a05:6122:d03:b0:5e4:f6c8:b0a5 with SMTP id 71dfb90a1353d-5ee8ad0eb56mr9557053e0c.0.1795612700624;
        Wed, 25 Nov 2026 05:18:20 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:18 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: qcom: Add LPASS AUDIOCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:54 +0000
Message-ID: <20261125131757.1163466-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06e01e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=peyyOT9P35Ab0jvJzsIA:9
 a=hhpmQAJR8DioWGSBphRh:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rpXPsINqJVTmyplzcnIu68sQ02ipL_rf
X-Proofpoint-ORIG-GUID: rpXPsINqJVTmyplzcnIu68sQ02ipL_rf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX/pgjyYdcjzVj
 A+SONMeDQ+yBeU4YfweR5mFpGJpcKtswgkL8zi+0FKflCT1bSyLDNkHCtWUuvcER+tjuHvOh68b
 L2svkdQ5S6e0vSp/PBhfVaC1cCtLA38=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX/V3Fb1GWkfNF
 ugzEyGLIqBQT5h+TR9u33oOAkhQ+00vsu5Zu6PTuggg7r/yyJ59y12wFjEwGYrMSl15akOQebUP
 VOvzZ9zOfIFP1K2nJh2WRq+KLEn902yF5dsmyr9Mwt++IkHDzcds/o0N9M6e7htyLCRtqGCfNjh
 AYm/kmJL244qZA50nsV0qshuTxIcJvIfBA/2LbxWL18JHc76UfDKjQMk/KY+nB6NYDkvW/5mdbD
 Rcyg/La2uKHJknJBTYMIijD6Bw5uXXnN8hjkYMJjW2trSA1APwitr/8dvTU0F1N9T1TYBSDcW31
 oogp34MhgOiSXu0doQJfcNeKVQZQGW4beRndcjn9j7GaXxrVcocaP6DiNPxttP6dOQ6PzjZwo20
 UpydRgj6p7iHw3hFx/j8e4WFYbD0w9xZMZUziKPz0bmZDMQGB4bRyq8gZa2MIFxgflpHyIAyzc0
 c2w5WVL+SsmkSQAKe/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) Audio clock controller on Glymur
provides reset support for the SoundWire RX and WSA1..4 masters when
LPASS is under the control of Q6DSP.

The programming model is a near-exact match for the existing SC8280XP
LPASS AUDIOCC, so add the qcom,glymur-lpassaudiocc compatible to the
existing qcom,sc8280xp-lpasscc.yaml rather than creating a new file,
and add a Glymur reset-ID header for the clients.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml    |  6 ++++--
 include/dt-bindings/clock/qcom,glymur-lpasscc.h  | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index f235b4e24cc7..a25e043ab894 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -4,22 +4,24 @@
 $id: http://devicetree.org/schemas/clock/qcom,sc8280xp-lpasscc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP
+title: Qualcomm LPASS Core & Audio Clock Controller on SC8280XP and Glymur
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
   Qualcomm LPASS core and audio clock control module provides the clocks,
-  and reset on SC8280XP.
+  and reset on SC8280XP and Glymur.
 
   See also:
     include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-lpassaudiocc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

