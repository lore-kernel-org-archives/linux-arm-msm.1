Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561798;
	b=ryN6jCIfa2cVYliKNKWPnF3yw16J6HL7yRhzIV/K9LbdCpT1VMIfGP0JEt2F63xbgRom
	 WRE++V4xQKSAOkTHWjbzcIoNRpanyLUPlJI9wz3bbzyKEPC+RJnYeZ9gwvZFLM0cJmGnV
	 vpRy7xZq34r5J7AAE+59P6OlBtO/Yq9YtMfH3PySrXrBSCwRjEOhFhevZG6dzlNrwY23h
	 rotUF8t4KoxRA72sLYbZfuixnlz8Hsp7DLfQmGZmwtNLK9K0tOdbmI/faTkQ9PcfFo4/l
	 SeQixeHnotiRCMTOaxhgD8XrxBNgIonnpL0ir/AHviICztLA8VpAWZImq2xbLOP6aKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
	b=QUCEDDer4fgHXqElgx8wjpOZR1YpknKI4uX1NVofR2opKHENaOgeE6sjfpYkmWyU92SN
	 +zmuIReam+ecs3ctMrajqTAI/JWPJcMiR/RHUIvOkbJGzVHuTpiL/jJlQb+3dVB/sc3KA
	 UtmO1G7aTRkMR5YvPVPZW/Lx4Og5p66KJm/FkFb7RtAnjaNxzVnM6z/+5fP310BagdAPH
	 cArvpQe2ppJkzDA0VsiP6RXNeoT2xfYdPk6vyLvcGViBGJxHRAtc5LHkOAjeo1dI5a28L
	 rHm9H/jWt6qh6Dya6tJVgT+mQ1WbzNwvVQfR49KEVIKRWgZoRZagPrP21jNYbUAmc/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gp2eiVGg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C7B606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C7B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUPXRecU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gp2eiVGg
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j7jX2411465
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DVD8d4W+YFzudkPLzaR7+6
	xOk4Zd0pVxOH27B8rVB1Q=; b=SUPXRecUCl4EaIO8e30o/xA+RFO9NZeneH/2Bt
	xSt73f2V97jHbY18bdCaFaanptJsXznqY4/Q346Ibckr3IdKAkJLC0GR5tgXjwMS
	YPzFbz/Fo0dDVZk0fqt3b8uXtAtLQXvDc6nQDN3DG6I0+NcWGQ+0Yp9EBnj95+XO
	6sTjRmUCOFJUpphTRmjREHQ037MX6TqrRwJAuqacBY+DZo/Po5KNyvMYCT9uBJU5
	2ynWlqJAnOgcRfhJbhCgyxl1NObES00W4E/vXCaax7NgzXV7UrBbPPaTQeS98MmK
	dvNneblNBOHmIWwc7PQzgOithcBbB+w0DYPVh99S8VccUiAA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvbnnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:49:57 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so578339c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561796; x=1793166596; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=gp2eiVGgvt7qRny3mf/5+w1sMA0+5qQno7fYMnGBf+ruh/OVb7wn+fL2yG9eKeXulh
         58BHUQl3jiZrgGqIaBFXztABM02ginvFURAG7B11mVmUSKktid2zFQtkZ8J7XL6d++eC
         sJbZlQgWKz2A693hsvMQsYb4GShePq2wEDgD+6+jpErzLLIiCh+dfzT2XpBZKPcL98cK
         OibVgAqOMNbOdp4Q9zYkAAH+v4+F+1Xu/U3Y5+z8akFQu0Vq9dQPajHXiKqrQ7Tc8OI9
         BjgLASxXrXhdiE0gdROgFDqbruj/0KCc3WtAoJrz6DvtOKw4F2nuP/rH2QdhZ5tF/H6v
         glSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561796; x=1793166596;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DVD8d4W+YFzudkPLzaR7+6xOk4Zd0pVxOH27B8rVB1Q=;
        b=oBqTeIexKoc2umdPio20OfGGPRyuXnAcr9aCdRiZ/9gifVM3oq5B7M8R6RRfZzQm4b
         xMG2ORBvC5VjEhdgMkPoEaChtMYi+hM1G47dB63PSqsQKkWWIkcVT7f34lHctPFUX16A
         DnEvN2zRJPXheSnGNnwLu1BB5DoYv0lAIyDXYfrlFWuWJv3cobHOnNE9NzqZZhq4Uzg3
         WKws0lAibq9ABQzMVlJqeffXaFAyKjok8vzPwxdVNAsJYlZa7LoHxgk/7LqY16jOxYKt
         XRzyerdQ2FxRUxL4OpCaVSkLS3DL3yGo+mfKZIde9Oiyie1sC9iGME8TUr9cNBtXpX3u
         iu8g==
X-Gm-Message-State: AFq9FYI4mUBscabHpbxLmm13bX8Z6pq6MPxJv2q4jR3r29I0/6nMd1+7
	kjrufx8FEFniAWFKyrUSF8TpXhYo1dGX7WHXyxUByZZOmS5SS8KOAtxlZgndtpWTtRcBns3sBSR
	wghC4k130aynFpLRoS7uHmBqREAjzz6e1gbbKTWMOSvwaKWesO+CLYYgvJpHmA61LTS6X
X-Gm-Gg: AYBFou2i/TYWLqTiByaF7T0vi3DcU98ha3beMflI7J/mjwn8VRE5enq/7OKqIN2eaAI
	v8cvt4+E3vx4+NzZvERU1c00bqmaVX8lm1p5LE0bg67d0UvnJECvQgAq57qFb/nQhm9RMZFS45g
	iaFHutwR3eWShWDJIoWsvjO8IidWQbfBJVaGUgV41a+4mcn7E0peOf/mhJ6RzlXUX/x7JhIF2C/
	SXYcbGAqIQsynOEA2EaIPM5KqCyGHFytauo7HcEcTY/yrXzuZU7GQZdSwpsDMiEokvtEfkRu5DL
	t4ZPmH0PHAj/mur9YtFnFIitNnp7pLKXpckUEF8LLezPlhW7vCSmYZAexuaGBLqh4pmBaXPRHxD
	4gC83Uwi42DyPdXFfmhjjzEtThEmHdoLAk9TXkpix2039DO3YyIJqz7+Bcxqdld/bUoAo7cgm13
	mz/FzU95ROXZe4qEUaVMSsRmaK26odkA==
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440613c88.46.1792561796389;
        Tue, 20 Oct 2026 22:49:56 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:10b0:165:55e2:2d69 with SMTP id a92af1059eb24-190a7380f2cmr1440593c88.46.1792561795812;
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm3656464c88.11.2026.10.20.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 22:49:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:44 +0530
Subject: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 IPQ5210, IPQ5424 and IPQ9650
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
Message-Id: <20261021-ice-v2-1-3dfa8f343ceb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHdS2GoC/1WOMQ6DMAxFr4I8NygOiAJT71ExBDDFUiElCYgKc
 fcGmLpYepb/89/AkWVyUEYbWFrYsRkDqFsETa/HFwluA4OSKkOJmeCGBGGb1zqRaZpkEC4/ljp
 eT8uzutjSNAeZv5ZQa0eiMcPAvoxGWr24hErCEejZeWO/Z4sFz8TfwwUFilQWeY3FXXUJPoxz8
 TTr9+GMw4Bq3/cfEASndM4AAAA=
X-Change-ID: 20261016-ice-e1d8ba304436
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXweeUkhbnCW7F
 oBrR41fUGcWkuMICsfyOk2IAayq4strPects40PwYMWKc8+AZSnKqvNbJRvuucCb5zq6d582C8R
 n0WdTNL1KJL/NrWpcDwX2AHo4P1YIXyvTuHzYDycACBpaHHQDsh21f/oa0iMw1NAKrJT84BsUL0
 3S97+KQXbS62P80n00p76bhgU98puTKg959y7eBiBJqHyKLRkTN2vskMSXanReBOyYvHrs5AdMs
 DOj0FBirHyLBgrovinMGyoGxIICs+OsQOY+mYtyOII+JsBJ2vt5HBBzTJK/U8m2lNRvNf4hEGtA
 hlJImyxToQaDfd1MAWQbYu7UZxIDNSdeFXgahPnRYUuANuuNXluOXkbGjnAewBuSQW3rKVbF1Hh
 WGTYbORi1srQm3Ux5eDbe2/vBIkqmq7jIUpZJ2BJOqJX7c54EspfXAvmceBSi0Xifi+hbE6W2Ht
 Ar0nWDY+AMsxGAPnUmA==
X-Proofpoint-ORIG-GUID: 2670ASE25bz6B-uM8PM8l5g9QN9yGwhF
X-Proofpoint-GUID: 2670ASE25bz6B-uM8PM8l5g9QN9yGwhF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX3/qRD1KuUFv9
 TLpo1nTrstOAO/gGZhw/5UJqoa+FA6ikhbBgiOrIhCeHhpNxoW2XTAIQqoAudDnRaJQfV2bDT8F
 gaKPD76ljhFUgg7MWlSr4wbrfr43beI=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad85285 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xq4CliCqeop8EqABAtsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210022

Document the Inline Crypto Engine compatibles for the Qualcomm IPQ5210,
IPQ5424 and IPQ9650 SoCs.

Separate the power-domains requirement from the two-clock requirement.
IPQ5210/IPQ5424/IPQ9650 require two clocks but intentionally do not require
power-domains because they have no RPM.

Preserve the existing requirements for other platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Fix sort order in the !power-domains block
- Pick R-b Krzysztof
- Link to v1: https://lore.kernel.org/r/20261016-ice-v1-1-4098b1972f31@oss.qualcomm.com
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 27 +++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..b98c4c6b77f0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -15,6 +15,9 @@ properties:
       - enum:
           - qcom,eliza-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
+          - qcom,ipq5210-inline-crypto-engine
+          - qcom,ipq5424-inline-crypto-engine
+          - qcom,ipq9650-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
@@ -81,7 +84,6 @@ allOf:
 
     then:
       required:
-        - power-domains
         - clock-names
       properties:
         clocks:
@@ -89,6 +91,29 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,ipq5210-inline-crypto-engine
+                - qcom,ipq5424-inline-crypto-engine
+                - qcom,ipq9650-inline-crypto-engine
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
+
+    then:
+      required:
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,sm8550-gcc.h>

---
base-commit: aff5f30d65bddca7e5eb635119057688e6c04135
change-id: 20261016-ice-e1d8ba304436

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

