Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968409;
	b=c5lS9q07Na65idISLJd/OJDtnsFMu3MveOkNVMXFIS9nH4ALZny1hM++61eLGTpusZk8
	 uqS4AK3etRLueUNpLQ25tOb7LbkHQytgYey3mIKLVT2iLkvJyDQmgfSb0tQ0di8cUAxix
	 t0JvYluXIiiNI5AMhO5c8IQIKdBqxLpLKT2wYK6P69/CGQXdWaHK8zObzWUJUjV9NxV4Q
	 2ll60h4P9t69wzdD1LtCvjLcScFfW9HVYOONVWgvAYOw0HJF21gq0ZvOkMFl2P8NhlgI5
	 k8dRWnMQ1GxKi9wyd4BxvgXK+JnMMs8oqHvai5suTJPMoH1OePdkwuBtgG/kOiFmwHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
	b=ZDd3wGPbigEDLAq1gJOWCS+Znjk1IFhSAa0mUslUzKjj0cmIyGlVEb9f5M8bKlmh3V2g
	 x3tOGbOI1wek/uh/2MHUEP4yaHGJXHOQ8LMihHBlpY+PtAV06JMqem3jlwPE2SB0MjHMV
	 t1ChnxM1h/6tB7R8yzT4hYBObXJEBvqn/YRDV+PDt0XjhJhw2k8Bo3DJYxPN2Kmqftarp
	 hdkyfEtZzIfz3k2wX4iJ3aGpCm8ZNOJo17PSN1mgwat2y5gAsqJO3udVfRpFn5DqEp3fl
	 oCBMaJyeIuNQJHxKgo6w2vcqMYlx2zy1tVc/QPk1+Jg+NziCVqedDA0oqEZJ78PYfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98102606A334
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 12:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98102606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fu3AmKKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxCCIg2I
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6AP8mo3129210
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 12:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=; b=Fu3AmKKcEYz/xx1l
	IoH2xAcg3CddEvzgqhaeRcMq7G4D2vpA3MO5xK5BU17vfbJsnOFJM/inoG9qGC55
	T+6kjTulZessePNg0CvMBDkjaCdipYQV5qq5ERh/oHbnKtLBdRpASuJ97tMzkzZt
	0uL5VdVi4liyPQN4V+qrR51Fe10ncGhoP2aDnWLQ6I+n39xMaC7rKjQ24MHPeTPD
	WXM+Euj4mA1SPbAK8lC+LC+gKXmPRahM8YkghucdpFACXx2YCqQHFr4vaCGgF1oY
	RdkssO+soMRt/AyhYgcT5YGpOO7s7p9L47FUPON+2dVcY3DsrS04pYwvIK9PESeF
	qcnUuA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9jqnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 12:33:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so946426eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 04:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793968407; x=1794573207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=hxCCIg2I8Hy5Pg6aUXOPc8LmjCpe3corpgQHAPiMfZ9WXXgno4Rkvc7FUmrW/10zFA
         VNLCBkFsAZK+15QhOdfq6/6L2a2GItNDeL2g3nx874IJqfEJg/MhR0AoKK00yJdbjRWM
         h8oSVr0QFn+59EYoDbU5H6R/ocybrfx1E1zRCe8YhphHQR64B4AaBymo16Cnl4igZO9q
         lCo3/WoxlaAeYj4IDg0kS9rwe7VF3bv7A1urody3yhuANzz+CTOg4blFlvVF9ttUWuRS
         OIsLTbyNCGQaGCcw9+RahbO5lVGxBEik57gFpkOyK5UOu6E0ZRbit0ps3vxDOU3WkIAl
         dyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968407; x=1794573207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd+LMuLRpSZRXGXb/dAiAaa0M5UscL/xiRD2H7enQYI=;
        b=RpzYxwECJWMWUKaU+wOFQ6HMQIhidEFoEjuyCnofdK13nL9JNsq9/0Emt32QQxn7V4
         arB9rY3277lXJ6WyafWzQnq+GySh1fLtT2skvEK7sLgZqVSsD1tQdXAZWjdbrMCC8T/S
         vle0P9I3ElUVewE+hkvdghSuLbCknB9AhF2QE9huR5LdUIvlroKMVE1Z5gU1dTy7STfh
         j12PpA2423VVJ58bWjbJAWPIa78Jb+Hub0v3Gu4NLcbztGfCglHJ7+lkrWqruAaPHsPD
         R6jiRwUb87WG390lefgTerGrrBbHSPcHfLfjHi25i+CfJGDZYLvRHzK5J4m0yVeC9PIF
         RxHA==
X-Forwarded-Encrypted: i=1; AL+hErE2ej6yTUXyOHt1IypnTcRVQmrvEt9advebKZw/xFoPIIr1SlBKfFsEbPFfmQ9MeSGq1tkVZq0c8Qzyq5nP@vger.kernel.org
X-Gm-Message-State: APuU4Z+lG9npgp6a47fkELF6FhXKwjvsZfuUSwMerwHWsEXGwO5hXUmF
	ZF4bSQqMHzU3Ob+iGPjXpunoWth/1Ab7DBXlHzWbno6PIQ/DifmQlU8UIsZ8ZHlTfjJdmjuB7Mk
	6uESdlz2OV91+s44SHntachxWGQU3RmJv1cGl79Ao/NvyvK+YJjdyXEdsnEHsV9v0wLSK
X-Gm-Gg: AYBFou1pZPxznf6u5Px22UsSvqvbiFFQBmP6x5zUhUvkj71axmYydoUUVwFQ6HdZ2/g
	D8UK7rs7mou4xvGu5Gv3MW1GtFFwXl9xRpafWPmeeTlpQaq3OkwpnEr86qsQAMpqTihxI8mhFwM
	h4DicrRLIwUSawEZLl5GvTHd+BFGOTXu7vE0rxycBo+vwBcukL1z01DWNuTe15kK8ehenPw5MJ9
	I0WwYM9+li+5/Et6JlnCbHeKexFKD1G8epyBUTRhPSKuxD4ez5pSuuBPqZ77FiOnSF70a3AOZD1
	cmhXE78kLEe50iZIcBDyUdaQMeIbT79WpZNzWrQZ5qmtUtQhy7vFWjVkTuDSKhgUb6xN84zxUwa
	T9Dq51gDNfsDtYAtJxb5cMcUK74/LL6id5vMYAfI2DRZAIV8YXNtMrmiAAy/+VhQuFDIdBnxncB
	SJ8p9XkeLJ
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148767eec.27.1793968407106;
        Fri, 06 Nov 2026 04:33:27 -0800 (PST)
X-Received: by 2002:a05:7300:c7cc:b0:36a:1f8:a589 with SMTP id 5a478bee46e88-36f76c17cd0mr3148723eec.27.1793968406370;
        Fri, 06 Nov 2026 04:33:26 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6514804eec.23.2026.11.06.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:33:25 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 18:03:00 +0530
Subject: [PATCH v6 v6 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
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
Message-Id: <20261106-add_shikra_support-v6-1-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
In-Reply-To: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793968394; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=vsQiZmFC+ZXQTQ0lUOQFxllYT5f/JYtRbkSGpdjvRBg=;
 b=HLz9BdEh8/qiFIXkZbf4Rj8A9mKmTNbB1Veg+lgSeibcOithsRhztMi2M3t+GlrkvkExNtV38
 VDP4iSOR2CTBnRVk9uaySFlblpxYUjmG0Fsypf3vkNUzUoI186SfDwS
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: MeC7Ah3L-nq6WFygmF2tAsg0eY7fPenT
X-Proofpoint-GUID: MeC7Ah3L-nq6WFygmF2tAsg0eY7fPenT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX0s2smSY6a0tF
 YninruZSzl0oSF3ALntjR542CVHYkHeONPyEj6MS7Xj8fI289ZY+3QVQJB2HF69XyKBh4eS+Ksl
 IjLw3K/fH5LvOgUH2WW+3bNI27nVoXo=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedc917 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0OSBTYWx0ZWRfX99jUEcXk0KJB
 Oe1zhpcNJwxDYsjZxnMlD4Pem2Ye7QsGAFpccF14fHUOQehr9LFJ2YD83FO3/MiOrK/hFtpO+ED
 LVrPQFQA7KoeQReqaZWSaGvs1PPNT9PkA6WyKDVZks6oO/3dZKeNDh7UWhxF6Bd6NOidBDwa8Wg
 6FMKG3R4rAF+GTotniRY9LW3iPQiHi3U/nlq6wMZH9wUY/vNQZ7i5mHg9O8ow/xuTAfRERGzdDT
 OSFyrKm+fj+A5YIFp5LtxghieW57lkWRndDHAiMAs3nIUH4Vg/KnBsH3Hx6vXtddQCjcw+yVzNt
 VymR2mIWpaPA1YZg4+VE3Ew/pB6KoF3HvDi4P3gXEJYs8mcm1000+/7/h4hiyPU2K93CFZexFQR
 1IHIeCb6UI5H7eayNrnL+aVDvgd1wadskUe0nRO+XrQkgkiNLT4n77ZOVssSawdaS5JZzjK87YN
 +AvfsrhegSmnZZreGVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060049

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6e34..db63a75f108a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,21 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbdad37..683ebf702ba8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

