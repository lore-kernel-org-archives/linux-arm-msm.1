Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104535;
	b=RzD44Mc1Um57UZO2thqR9RXlbnb6N5zonu4yh2rfIeJC27NXz24arvcEv5t4hiIVPaon
	 ySTJcf4yzdITp6ImbnNLnAmtF5/F9zUWypJ5yLyUHTz+7kr1dNCAh0Ou6xYQnvIeVQarl
	 QKhYjWxY8xho8hdzfyj0l34kVQWDr5HinMjeV6/dfbQ/9acYgeIPYpKvDefOhc86Kl7ka
	 uayWc6mI3HuKuutEMVOepgkkJgXSW7Q3MnWhQzyOChHGLUNvVR7b/qYc2ZBKOhwRUcyuD
	 7qX7i2bDx9ByuL9DrYzOwTXxWRPaTgBx4QeGqKLqu3R/90xsLDCYHBfBYobjy45v4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
	b=WOuXKcU1ak4UXxh89EITb6bOTiQIMYwxvwq2a3Uf6Qm5fcmLvwyDXxONwU7MvzCVQeXR
	 YVC+rTmBMEqBjafpIBlNQ7YCnTSw3at8AQINRSyF/9yHV0WYGoRKG9JIJS0PHTlUNMM85
	 IN3sLlzYZFC1iXk5Oda3oPb40m5g+ua4pCBucb4+pgLr6ZOQrostZcs+j7S5aIa/Mv3Qf
	 aaChq/Bc1gBVNAvTtBV2eGd9lh5IQsvxZXZ8/qlsSe2z2no23LDk5t8duwPH86fqcQcKG
	 foxCo/zwLc1Mx+BlzC3TSY5sj+te/5jo/eyvSfk+4ISCYtiCSi0dLSk2ciwegbW/xkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="VX23Hm/A";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D860A2625
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F0D860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VX23Hm/A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3wWuJ1U
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDig433009
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=; b=VX23Hm/AGO4aelxK
	IJMOWvVlw1Edx41mxYk780SdWu+DMYYv66O7Eho0dIwCf8Cu4ek0NcLgalu0j2yg
	COYOL2RlvVR3SZJyniUqBgg2H/G2TYfZzQBHy1w1nSqKf0yc3S3RZAXYZF3cXyTy
	GOJNIAQpIgqOtL0B3PF6ED+/fBnFVedu9/4IbAgvVfV55ZF5si5IZw+ohWkf9cDh
	HOordz+58Q7EApi0Cjs/xv/UI+DgRwgZ43gdld+Idk7a0PEB5R/deATPMe0GGfUH
	F0Sdl4ChByRs/1M7XKJKOCc4m/th9xMkXb8+qjQDNShPLDRr/04bHDm/FyDTfsMw
	Sgr1Ng==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ksqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:34 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a88d53c7a6so84921817b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104533; x=1793709333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=L3wWuJ1Uhnj6x2pKj4yaDgMSxS1pl0b399jLb1/t5PUnOlSqMI1NTHn5GBedAfnVUF
         FKVD00MWhB+r9DyTB2H2HdJzfVPl7SqB5jNHRJo5ji0y6WgYkFh/Y2eA5RWgQKGLCYqY
         nvnIzsXvdML/5GK/llioB8BPdKFKF7I9yvMx7DkYHB+WC2jo/VaSzXFm0QwrjpWg968Z
         7uHFkHvw+e0nSQk5HgzsMVPx54MRbfEJKOODjK8m4ZL+aTDgYsF4E4JiRpW63W87hjgI
         b1O68LNl/wkWIC9+qwtgsJG/6MaOlEXPpe4R17bkuUn3H8FcD8YgOOzhL0v3AnWCd11E
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104533; x=1793709333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNwvMt5gjfJinQ/wSInzrkxOYi6NIM+HIlhbrr/hDqk=;
        b=y3LufF3Jzg4UFIb2IISajHsAxKn6N3+EtUJZ7kAqAmhPdG8HQyDx9kMEuJI2kZf9fF
         9fzxW0C/0pdIqhDU7jqiPAFAR0UVaCZHkntYEwrIgkux0zruqrk0bh3dVjqARdhfMkNL
         GrkSwJTlrSwyGqD8WodEdSrYLtPogf3yt5dyZZ2WlQRpM1rDdJlvka3PkGfuySqSd4ft
         KSTSFGQYwS5h60wCafEQPOUqHKUEL5WScD3Gwu+IXDfTw94Z8ykwsEcyIX0wVsEUdnAs
         Mf/0kD/lllkTm6aNonH7wSqaB06GRRS3VxDyiHovXJocbwt2HlBRHhBewdCSVJuixaUL
         pjSw==
X-Forwarded-Encrypted: i=1; AKwUvBz1A92XOEaxguIXatMcj0eNCcaoaoHdyFeNqF8I723nJ4sCsLJt5Onh19/Pz7otQx43O4vFR9ZZuSmPB8Oa@vger.kernel.org
X-Gm-Message-State: AFq9FYKqgwQodBcidsjVXhVFmJ2+CAxxMXgivCK+5uFJ3dWPZMAZNz5p
	j97MgnXXQE1y2PeAU+hDil9r+8FjVgducr1O0+ZIslppes9v18Cx1OU4/RftA6zL4f5b71tUSG3
	tbFSaK4b2l6TW+NKggDa86V/K5IntFuzLI0V0I7bShKa2SZo9C+FsgG8gwGsFcuswKsZ8
X-Gm-Gg: AYBFou0elU1kLvp7P28dRhzY+6ZrSkun8VGXLh0eYnmm/AFzpisyOj1DD8D2RvQUmRQ
	hooSTEZjhStViT/4Ql8AU4bt9vmMDVjOirwrRrYKff7zo3C1ZJk6ppNUQ8416SPrr17kQs+Dm0z
	t+YcTWDwR/izQimlTUgT6OFS8IHzQbst9BOkaufEjG3ncwva22eQh/pxjARA7Gx+5w/GB4GTjKy
	OfzTdM1o2sb4abq7r/TOtY13bqkhKyvZRXIfFqFFgZbBMw8q3pAQPgCSAJ56/20WDzgENoJoKW0
	x/VRMwy2blm4UOZW/zCw3Meg/1A/KlpyRNkTih5UPhuW2CuZrkVvUE6vaKmZxatfNinvWN8pIWR
	Kmio/htvSFM1sAQzlgg==
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735357b3.28.1793104533325;
        Tue, 27 Oct 2026 05:35:33 -0700 (PDT)
X-Received: by 2002:a05:690c:e15a:20b0:8b0:b52d:4e0e with SMTP id 00721157ae682-8b166b69836mr43735187b3.28.1793104532917;
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:32 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:20 +0530
Subject: [PATCH v5 3/4] regulator: dt-bindings: qcom,rpmh-regulator: Add
 debounce delay property
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
Message-Id: <20261027-regulator-off-on-delay-v5-3-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=2793;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=SkU7A3R3m4sw8tWJhnTvVEYAWww3+TtNojEuitZAp4s=;
 b=qJmtjaVNa8jv2KFepU0XpawCcRysOXv2cRSh64uRpTXnmJ+BmwrOq64bK4KncXlYiAxeP5i6Q
 QK9IQSOkMxwARHafhkxG/xk1uJgr3ZNPIolDb9/5OSQykY3W2WbciTQ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX76QCeP0xBmrC
 RqqyMb6NQr3XcF/cBhChz4sLfzVLuBvOWHp71ZDPdwdL4JLGc6VwtJwp6d+cNoJuwouktcEaO2K
 nRYKw4Dt5tghk7c9VeIia0gOPRMIdYs=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae09a96 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fIv7m2FGvZx8uhHzWWEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 7YnUWKPG1pTDbktkKupjTqkFE20aIeu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX1FYxMA17Igmk
 h+K+ngQJS/rlapFQrl9pL/h2fR0f9HDx1wsIjn3Uj7UCTi7dgCXXrfVNro//JY/XNF1MRjgDB3i
 0nNMorhZfdSrD254LB5cRkkNiCu8jPCXGmovzaxpE4S53yZlzsEsa2lLkaoiD0Lk3PmzzFVr7/B
 ahLmVFPAkDuvjh8T7DML8RpCOhZhEff3uVg5Yxxj0stseKyb0yTqS1NuY3wuELTX+vYjFL0U7B5
 tnN4QD2zc4lkagG5i6tWiO+BG5zTMpF2+b3KKQdUVrjZHscU30OnEjFz/CJD4j6gry3pVoGJIzy
 fXWkKdvH1IZ3dK1DlzZGYwbfljJDZ4+uypITtzFF66WZkYB7w0n1obfyOCRqo7K8neUL2AdWn9Z
 AVlmD3HXhUbvuUR862keG7qJ/ZsAX+UTFgCd3ldKgTPonT4t7Lm9rzoq+7eSV3uVLmRkq44hV/X
 KZerrpOrwwvPcXBc7YA==
X-Proofpoint-GUID: 7YnUWKPG1pTDbktkKupjTqkFE20aIeu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

Add 'qcom,regulator-off-debounce-delay-us' to describe the time to wait
for an enable vote after a disable vote, before actually sending the
disable request to RPMh.

Some consumers toggle a regulator off and back on in quick succession
as part of their normal operation, a behavior this driver has no
control over. The appropriate debounce window to absorb this varies by
which consumer(s) are wired to a given rail and how they use it, so it
is exposed as a per-regulator property rather than a fixed value.

It is placed in the qcom,rpmh-regulator binding and vendor-prefixed
because the underlying deferred-disable mechanism is specific to this
driver's RPMh command handling.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index eed2ce7fa861..a028f1a9c194 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -135,6 +135,15 @@ properties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: BOB regulator node.
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 
@@ -144,6 +153,15 @@ patternProperties:
     $ref: regulator.yaml#
     unevaluatedProperties: false
     description: smps/ldo regulator nodes(s).
+    properties:
+      qcom,regulator-off-debounce-delay-us:
+        description:
+          Time in microseconds to wait for an enable vote after a disable
+          vote, before actually disabling the regulator in hardware. This is
+          needed for consumers that may toggle a regulator off and back on
+          in quick succession as part of their normal operation, a behavior
+          this driver has no control over, so as to avoid needlessly
+          power-cycling the regulator in hardware.
     dependencies:
       regulator-allow-set-load: [ regulator-allowed-modes ]
 

-- 
2.43.0

