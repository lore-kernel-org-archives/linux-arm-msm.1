Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612704;
	b=ZbGjhzoRwfxGYCRg0yAv/l+g9tYb4SMCIoGVneDxdmDwbJrwZJ4RwBF4IQvGIfk9xu26
	 Qk09rQ12AsHwIZq7ZmVxupteGp9bCCUML1Sb62qa8/RsENcnHwJ58E5VMuvXVToBl1zgW
	 9zgRdYIUv3nX0Gi+Ae2SNm6oi2D5JRv2cSeQcIEWVowZT95Xfs7ioSAnUjuFpJPsDl0oB
	 bBCI1lF0SHeRynurijiOu+XF/jRTTPf640tbK/j7QRJ9tlogjS/9AOMhcr65iPELDCfGS
	 Vs9o6tLo0irmj9o5//MpSiRg/D3TAVY6y6dW4jhAfuG1wC1LTJgGSbIxZNiWN2PLrJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612704;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
	b=fiqTIuufvaXjqlZnGo/ZOcMtikfafXCiOjRtM94hsj/S7trlfoI3xvLgd+ClgdZY4Y/4
	 Et6Yr93RB05gvnRVJUA69jyyr3vKgj0GzROkL0QK0YUivr8NZZDlu01kfKWgH6Hcsnt8e
	 4FjXE3O6DLKoOFcM/4TWTvqhkPLcyaAxTV7fQ/Jvx7KrIgWM+SrLKKM/x2OgEoF/FHgSU
	 plYcxvE1Zwr0zl5LaYHGU7i7640Ac+aL2c7DaO/lRD19SB7YBcsLWhmeK5HnM2ggcDdPV
	 m1IaEpEhAVleniKqeceOjxEbJ1Cejd9RDbFezs+iMIyWnmVhWBlnuf4prhbEKUWtETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A5606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNso2356523
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HI7aISuqjbP
	WHF0PdzqR/2jami8T0DRVhsGnTdgpivk=; b=ErYnkSnDc7f97tbGOc8/ua+RavC
	BuGi55Il0FnifFEqK6TzDd16wy3HycBJMX5EXrtDh9LWeL/2Q1IF3gPiDmZUxHOU
	1wBdmrTlqrXQUcp3aZlfwswpM7PsPGcZWHlXHDW3Ge0N6QAQPtcA9eHVEqp1Njdq
	qPopGSFaA3/mBAfDr19rZbYamkOYFTqQwRVa0u0hlFvgYKcV+7+/taK6ibhqw1Nc
	JHEsAzAjJvXOu11BH4oicWRoGDwP8TIAuLB/s0t34SD/X3rNr3xe/Q9F1PewefCS
	wSygIo/wGMmVWDSckSrgVaKylOJMUCdw3vtsnoK8UY4isx8hBEDg52L+fUg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6apng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so2661665241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612703; x=1796217503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=Gw7d4+bUfH/kor9HeSg/jHEaJDTVTfGEb7yCbNWQ+Mol0uwwHlpnf11xEch92VtWGz
         aIW5XbgTOxnyDzmYwC7A+NCpZrnUc2VMwqKpqJ9Yjtx7gfEKQx13iqQeNpczZhNJRNol
         Q00a0feGNNi6QLLam/rd3yZoDSgWjIuFTjcx54opRm9cZt+DpXvBEpcevpnP9KcLkqIH
         uBTuWKolCM72hxNdtBTv4Pi+aRDA+umf9yVd+7XHnKDf51HTN9Q5CJcARxS2MC/znJyp
         x5xBiqORkYmHEcht18YesSPDFw//8pey426AMVddYKPTWgEeewYhND8YIw2SOrnBihiM
         kElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612703; x=1796217503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=GbYR9y60Z0on2jYKEBjL/FkAYP6lVwxB7JSc7XvNrwbJi59O2398mvjDBYkENE03OT
         GaBW9htRp+6R4mbo0D6OoqmQSzxKHJrbfCFOHzNmhF3g6uAA2/BgqDRwdzIk9UXU7iLO
         nBpxXNklCu6/NS+Girzvk2dq7jP4HsLyRPdkam79Xm9BH4HkqDtnOsuufD+PLUfKoL1+
         WtofncnVzrxp/WsUt/Ef8ETYiDFVrVcQaxbTem30CfYB1oBSCtl4Ouqsa9TjCLYE2boK
         4tbwSFZGKfx+XXBsl8bOQvOl/eDyuWYQOJfh7myrPCdg25ldvwRSuKiE0mu8g0tmNUag
         kVoQ==
X-Forwarded-Encrypted: i=1; AL+hErGWcMpvmXG6bEmT52O/SciQGL6uayIqREYE2v8OjbyrnwZNpILn73tL9C0QP9R/nGDYs0BBd5GrX0LZFwXm@vger.kernel.org
X-Gm-Message-State: APuU4Z+0DL4LdPIhWtnc5/MSRGInqy4cfRk/ltFhxZ5P2pYM2uPIIufg
	G9w5YbCLtks9GnE8226OayW+9KANzo5HaW5yxFrUeJ+LeyUTmdMPpNLoXXsUQxl7eVi5tJ0Ggis
	6o3WqEgMWfp2fcHA5cVEEkEY1GpzzhtN5Cn/7TJJtkZq5bClUQYawAH+EfvS+rFMPqhWC
X-Gm-Gg: AZFdTZeNOKXrF6EH6MEB3+x0toU3RNKOKdBeT/CcRq1Bvlhm1Q2HJ3zkvpQQemsmqt8
	n7YXpAF5rkMYSnABxMGQYiCDvJGl1MnTtJ5XDtKZCXiWgkRmHvLO8I4t1z/u4icQ6Gdf5yo34wb
	yrklQxC51g1Q5ssP57xH90BKEKdzEzxKo9KvxFmbVxmrzdm2KJl9KFfdEdnXfigtkWPt8xqhD4M
	Q59QtNFV7bauL+RHhdZXuX31gLEs7jKx+F/49Mc6DF//UVeZ4woEpkWJ0eUXdI5n7AoNeofIwXl
	YOzuZG6O6XQZjH+6bPYNLDuRXk6fUT3Viqu14d/N0Sov6lOn+C5t6o9QKimRowR2tF7ZXl7KTOl
	1jqAm3SHRaJAXoVjFS9xruE+RfOQl+Rur6cq7qIyBCL0LeQ0BMYPAfIzdHgI0ILbn
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257283e0c.1.1795612702657;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257217e0c.1.1795612702105;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:55 +0000
Message-ID: <20261125131757.1163466-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Xh6nUdCnrmyStQxEdIgMsE0t6ZQUab49
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8r7+nfnBJ5Bl
 9WgTs28FxJRwSvSk4PDMscaABn5sPV2l6sBZFJhsZCG6I++pY8P3Q8Hcj82YQ7A8RxMhqb2uq7/
 sZnbPdG1AQUXAkJ6SocaIkw9CGx0D5c=
X-Proofpoint-GUID: Xh6nUdCnrmyStQxEdIgMsE0t6ZQUab49
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06e01f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uR8O5Y6ZOet9NXHzM84A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX4a02lvAQCJOI
 I4cqrMCLDMbMoYFdgVCO/k/XaCUIgr1tnwDZpBlQVBoFV9dh0Dha6L4H0N0Pem80IceeMJLqcaC
 PR44aROaQ7Au3AGjBu+Cd/87QFL4IVxnIWn7oc9KLhbs0i2YRzj8HO5EZRJdj3loW/y8XWTSA6w
 3a8Vft1hgnykpIlIywtCIguWCnA8sGtWDsseE79SUZ86LZUAs/mqpAQljsInBtBKXn7lnudCPK4
 PgkdKZn75Ozil338/cRUA5JSZuvnt3TJ5MNvh0SndIUUYdErTnch+u0UIxxARsCJYKZtHOljYQV
 qBKL857TJ11PCzeI7GMv3H6aSQS8e9nCyqtTgn0Ep3HKMfZy1UeD0o7bMxzBkPEnKRMBxSRV647
 Am/L4MY1yopUdu8cpBlAOnq6wCIl/WdgymhDmUEV3rQDenKUm4zOQVr+hsDz7IFd8Vs44LXEnAi
 3fGp/ktldIbxSIFO6mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

