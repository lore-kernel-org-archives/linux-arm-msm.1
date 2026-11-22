Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372918;
	b=d2qzwZqxMRVb1fOIZScsOt/uwkjoTsbYDKYw3SHuqZT4HXIP4ZLfEJj7VbL3DFVgv1MF
	 Jm2RZyfavuwhCYfOD0wOq5bVXG4CQeJKzN2F+dBQRzS+xekopnfnnR2BML0gbAR096mO6
	 8EEufyPf6NznOY3oLqJUtMCv0mY4obiqqxPnXS25BROSRcWeHwDOmIibrSITnxi8/YhRM
	 fn2NN2sqa6dWWfNsC3efeEzmXwkBZlPBQ33aidz3qkjHc2+xxzya/6B0IZ+iyrTPU4tuX
	 A7XV4OdKxzsuX3YENqT4+IAPOMC/A8Cm4SAnqabOf/QmDonvy+r4+D4I1ZZmIoQJmvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
	b=4E5KERjUIuJs4vnAh5d2WX8B5+1xA5OnmYLZTS5slLiqt0OhBQeh2TAVtrVhlprMZYT4
	 BpHzC4Uo8ztd4xwjnnVngmLJmVt7/CVYgCbHOt9gPQm43GZ2qkR0YqF+BNtpxxmd//9PZ
	 dwCYV36ZGfoh8pZd4NpiBwHQOuDiVpVu7gaNuwxM7nYnENmDs4wmDtnu1H3F/92alpnKJ
	 BmS/ZmPFjfOp+mor3XWh0OAq+x7nEC8saM9/YxG/rkFObLo6vK5m2pEdygwQM+0pVIBcm
	 viCz4YD75AfgQUB4YO7E2mAHEYQHcsLkO84eRWLaCKEhjuYOxnEKLHq9kaqofJ0t/3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AD606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fl03wzcd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a09W8RZY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVCVi3010177
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=; b=fl03wzcdsKXmSpCo
	y84g8v2TR0/Mh03bwzbnmQzowhDCRbjOWHEwzffPt7gLS99yhZPOZXqbbmnD4U//
	3N6wVbWqaisBQ54diLJ8jHAq9RImZqmAXkIPR1y7GDAkYstA/df4Pda6W6tey93i
	M22K8NooXyFo3eYRu6FXHBbaKlIFzjluNG/ygJzuMSiy8IU711CymN6u6UEFXW+l
	n23ZfI3fZcKWNjkRDlZkE5gY4wIxdiIc/DTydbVlP+mguw9ksd9r31jUkZT3X79g
	qvWvUYwwfjZ1PC0ElP/1J7KN4PlykDZpPUctNK2945ob1mmMIT233X9HrY+CKiO6
	bNd0wg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34ka3vm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:41:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so1187354eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372916; x=1795977716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=a09W8RZY4OfSdY7KWaeQ1C8kHmXx6dhHhW9TVaHTH7t2L9sruFAPONPlRS4B3SclSb
         uqqHgIVVphiNB76U1M+g255gKaSi9Qpvck9nikHRirtM2Ll/AvMB3any6oQnfyc1S8Fp
         ej54cQCKNIz39aUbHULFjlqWEKGskyUO8j8Xg3X2OM4urTVJ8Phs9OKnzzk9v+aI9TEe
         Hbfz/PyfhIP7364Wz2UwD2VTCFLuQ4ysf1QK53EOGJs365Evs+4G3lG8WhBogJkN72F1
         BDX9VoDXa0zVmGF2wGI4U7mNuIwfxozK6zk9AmZTs72B9g8uMKZsDtN9u6hIxlUAb3Wm
         tX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372916; x=1795977716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2XFWY4jdO5UuPDaIInCP72F8EFVWk3NjCq6GU4tVhPo=;
        b=glum29hYrDj+ifbQFcbTEpH/xrCOL0P/D7vCLO/XB8YDgBByo2Mo2owmJrLDTeMxvN
         BtBlX/Jx5dFduwtMfZjHc2OX9AsvUDqakRsivAp0xL+D2VK8zqS6hk1lZIxqdKG1rRxs
         MBj/cXHnR7JP7KFvcuHnDQMM7GJUcKrugYzmd/D/ZWpEIrW4fJQd+0KzfAQAyMc6hZdP
         MM9nh/C04iooLtBrl6MB3Myac4QEESb0g0A/bSSw+HdkNBvCoR3f8uZAPHDIz8hGmVHc
         GnB2soxJfCKPu6Ctn6NrCwewg9+UPLN0TOKXZDYviWqfX20d3Tx9j2TowExDA0VT/JBf
         F6lA==
X-Forwarded-Encrypted: i=1; AL+hErEWa9fAYqXpf3JbfbxPAB+LPIv2YyJSdIznpPbxQNSus4nGdViubTwy2HUu87EXhospP8YjLZkki+CLy2ZN@vger.kernel.org
X-Gm-Message-State: APuU4Z89xgRCUbWQQackjSo5HJT3y11r92sli+Lb/ijWRFdVIu4BkYqp
	HMk7c6JzneTSfBfc/3rBLCatB2rDSO202Zmx9KePIrRjIR7Z2GSF4JpX7ROJ6BwCvt+tUG8EwXi
	DtA5DkOeNk3/HSauF/7LHu4FLS92XlJW8mKeVRqs7czY7vngxYix7zlrLwqo3HSQeYKxz
X-Gm-Gg: AZFdTZdenFZSvzLVoThGwxoqkbQqV4E0EehtX6odVx9oiEY0k46J0U2+ztQociYL3+y
	ILlLX11lMxGVXW59Y+a6kYQrGPilmtEMdXB5J8MRzDfePzrgZjlbdvyXY76Qcx/zEiZSj0yEvMq
	CRw4PJmdy0QoGbSTlF/WCy1M8udGQfM8lFHVtjzci4UYyTha0sUIo5/2Wbwx70HQWVG54IxaN9F
	eA5Smdpamv/JkXdk/VrDE8+ir5C19FsYwYd6k2JWURHxhkm6rNWYkE0arOxuUzFKmGha/iSRCce
	BgnmpBzx4pnBZmO5fZVNKvpxr0vu55LhYjjd7Br9LJUIOSErwtGI9cMEr/4g7/fYOi5hgS122Kw
	xXPEyhF7GFu8iyxxA7pdv24KoIVDMYGgLpgPWCct7Li58dZxhlvhQL5/krAHQjrWs/40DLcJR2C
	Pi48yxQAS2fQ==
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790878eec.9.1795372915940;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
X-Received: by 2002:a05:693c:408b:b0:377:82e:2d79 with SMTP id 5a478bee46e88-384b39896edmr11790852eec.9.1795372915402;
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:41:55 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:31 +0530
Subject: [PATCH v7 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
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
Message-Id: <20261123-add_shikra_support-v7-1-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2759;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4jOzxtuU5ygIp69d58T7Dv1/GR5OCYEOzG57LLRiCco=;
 b=83a/W9j+Od4snkQzvpFWFW9xErO/qyOciCt8jhSE+fjVoo6fiyNKo4ElyHYvXlPsQ4sXVai8f
 KkQoiBkhN9sAHd8OK9g4mgvZmKi7Yf4f9Pq5tdAYYpZN7cjPYNT+U1W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7J4gcYW13H8i
 ES+Cy3U6E+MzQDb+9yNiVIAefrXLRQzj+Zm34CkyOGf0H1lpk24PH3H1AAivFCT8cRUFF7J3qJn
 lRRufwB6dDZfrEDZH7rboPK+QOulxhgEct54mgqU/l3VrTpULwCqbFTmnKQuqp3CJ0NFRaic56J
 i27VKfB0KJiPaMTsE7w+l9GaUQ1Blh5pqUabumDM5D0dnuq4RyavFOzUrpB+PuIXb6EHmrjY9zc
 X8dlD7OhoygWgyibbXtN/8x3J9IgmiSsl4vxRmkwuKb8p/ayJGBQHYTB8drBK300iMq6JUDwvJR
 WrlvLvWBHEZs++c/K6tX02cqsUZV8nRgAJAhJIaidRMq84BN1/0TR/FehHPlajmFzfP1l8i552d
 xr8pnfWcn/CbLpU99Da6BrHf51hFy4ENlIbxJgLUmm01WQWE+iARXpwgrNBswB2+6IuA6Y8rrxI
 H6ENX+7oMg4NUVD+xcw==
X-Authority-Analysis: v=2.4 cv=RJEmjIi+ c=1 sm=1 tr=0 ts=6b033774 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: lecGs7ElVVlcjdYIBy__yKTADGArLAlB
X-Proofpoint-ORIG-GUID: lecGs7ElVVlcjdYIBy__yKTADGArLAlB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX8Gcrc5VbJf/I
 LhqIvuxfCR6BQnAIpT8AsjV+0qslZtn9HQJzUjRjR2oDsInI78ElBAT8zExEv9p1FYUNLYibK1i
 yBR6FoNLZpwobPT5ZzofasylKYSILvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.0, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 67a4a9536d06..5ecec8d0b9db 100644
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
@@ -142,6 +143,21 @@ allOf:
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
index a5466e61b0b1..eeefe2171c57 100644
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
@@ -171,6 +172,22 @@ allOf:
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

