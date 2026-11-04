Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801030;
	b=MiBreWWtSXWqDM6rx4Zqk3NHLm+L/lSiDxzurTr5DD8wtbNSYkDFx1uE3G8YX+Yvtf/w
	 JjbGXI/q8kywlj+MjJAqWDVMvf1jP4zNQo5ksyuae2xhi/J7ZioxcRkGoo7a3OKzLLxOg
	 dB0bog2Z8x+YHq2Peg0NDdy9MO1bDubDtYo5fZCNGej6ZAeXgwE42ifYur4utBrY3UY5v
	 CZt0wluRIz6tOpgtIUfsvSEz518CLdZhIym7IFpB6E/Am0IbWaLv6YTDHCqO5IbRdVJ01
	 d4mgi+qBNWEGeeGHdU4uF4a7UOhv5eHrq6m0QlU4IR++PCTHYjCT16YU1TP44FSRkLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
	b=D6jkf10QjMuCvYWUGBLSzp21or3tVmH4hUGHx67kHxrKQdeRnI4jWzhXy05Z3+RUknd9
	 EzJ/ajjJ0rwvzfCgNwTEA6IYxeWr+pXqK0Nay3ZBVec7GF2DNuk3ZmkhjqJHTlZT2W3Cj
	 Sp4d68kunhLE0XxWkgEvu258xUssemtMWQO1QMtXbmd+iuo9oD+OmVSn8P2EiYwyjz8jt
	 Rp5Uu7DFWQlGIAR2Cr4T8Hzo0MKGUV1l7MqQ9kyi3LMy1cJMCtEMVdtNUlEk47yMq0D7L
	 RgNcwMHIVMyfJWN31y3sUURgP212ZBAgP29Ie6O0V+T6RsukyF3cIbSaUcKSfdadQng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNINtf+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk7jzkrT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B80606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 14:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B80606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNINtf+A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kk7jzkrT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaHvu120092
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 14:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=; b=oNINtf+A+usx6+bN
	JotwXt0lFfw2lXT9PK7AoaqTgXexbUk9AqIcMSIMvbf0PzHbhdxyIBIpMQJFjMv6
	+V0dbn+COKQZG01jfYb5grh4mrdXTATeixj+TO5oSsf7zKDyGWs3VvWSD1Sp80KU
	6jtOKa8SkipHtbv/yKDyfQZOvg9jG8Og+NPBCd3FfzyCAi7Qph4g0Hruif+vmjJl
	DEQ5SE9kIHvFUB46QY0r3l5HAK+lIQEC+c1SfRXs/mu7Xy0XvIt/8GsU2cCUeln0
	xnPV4KCO9+/UIZ7JSnUpxp9aUqZFtl0oVP2ZVTLXNDmkO5jDyEE3RLLaDTDRcaKt
	HG5MIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aanr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 14:03:49 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1663753eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801029; x=1794405829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
        b=kk7jzkrTd++x+fLkULDXLNommMNG1KC41lWH+JJwsrgxP5AygywGU0hAS9K/nWlu9S
         dCnbXWsoLZJlsMsXik5jq9uG6OV2D9yIzPltwOZJ23D2+H0sLXTimwtGVCvQwlS0UTYn
         Lg3ECEb4cnpZfcevYyY4pD+0haBjOhuWMSp2kquEYEKFyVBq640thNOr4Adcpb3aKaMN
         WfgvQQkDd0HPtIMQYggs5IBsUf8uHmxIIbVyiLZ+nv649tBkMqG+LrSsQpiiNse3bO57
         HuK6xYUWET9/U2v43IppWUeuftjFvfdNkoSIs9sQwOyZpDlFy1zeUfl9QJE3dooI24Z3
         FKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801029; x=1794405829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zCBgm6ZXPjAvHIIdvGuEOlxxCQAFX1FznH+2XnoNhc=;
        b=jSbuTFnV8WHN2kp7M75J9HLHfiCj7SGljaiXET81VMG79UpVL4XR5C0BH4R2aJDu+o
         X18aIKvPNTt/qVB50xBNkzWXoeFgMOEMBx4O2EJCU6pLP3jq8ARIHsgHX0K6x+ioJHLS
         ItQ+UuPQ+EaL9ZdVh2JiUWGviZbbjskLwzKtjUbnbvKBR5aylLi/a/5U97T+EMEm8sMJ
         JxNQGeIpYpfCq+602/F+VQAB9nvF7X4G44qngCWX7VszSGoRIS5MPWJOBDMrW7GjZwEu
         Tzv2YcNCTYPzEFDJzAnVKvAZvK956ogAuLQ7BoDejGlzbW1OmrAw8w/qRXYPmKYexQSL
         OOoA==
X-Gm-Message-State: APuU4Z+bTaYeBjIm4qfs8Jd2pmA0W+L4dpAUec57UVgVFdzIXSTX+/Q+
	d87qQZ/HsxWZ5i+iHi41upyt0Ez/ygY71q5L/QZUxY0zwdFUQwHpCKr1Ng1Fmi2fI5r3VfgGCT+
	tQyADcQjv3GmFELGq5R4Y4TREIRTlHGR71/G2znMVeLpCnlBT+8xMQ0OXtWZggWuFu+eB
X-Gm-Gg: AYBFou2wGkA032XT8aFbgcAcKhgoF1gg8EYyQC0ulgQFqUmajcH0EaIAXLV/rg2o5Zu
	t8X911hueMQlYPEurjiYEGW2HhzACaiRc1AQELtY27boQzgfyXEwfjjGCBziCla3aQOLEghZPcQ
	PcP1MtzKSbAlcxT5RunOmEWaWUJ7Iq5c4aA+dqpNoF1HA9Cy2Z6KcqqBwkFJUlBHms21hPpXRK7
	rFQUB+y/hLMF2kjKrtO1AAAtgGGUJ6ZTaQt+ZsWdTVVp7r6NZ8ZMg3gvgiUG5JMNIrbFrWLTwMO
	IUFNp8TNOTsUDzWCVjfBIdQO160W/Ge2f5BUOvKFEV1ScsFCdIbdgkSZdS6RYokhQTKAHlZZ1FM
	HlBElKHf9+LP8thDMhLD50W8QArO5Sz3tF5ncbU91v/33BlZmngYG0R1ReMft90ct
X-Received: by 2002:a05:7022:158a:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1acd02973dcmr25494831c88.30.1793801028394;
        Wed, 04 Nov 2026 06:03:48 -0800 (PST)
X-Received: by 2002:a05:7022:158a:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1acd02973dcmr25494776c88.30.1793801027525;
        Wed, 04 Nov 2026 06:03:47 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm10195570c88.15.2026.11.04.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:03:47 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 19:33:30 +0530
Subject: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
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
Message-Id: <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
In-Reply-To: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801016; l=4025;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Mkvg2QZy1nYHDBab5egxAvVxkkQ0+7XNBqgQC5oUCvA=;
 b=lM2sld5KcyNQU574qia1sJkhnHXnY+gJ7wwH2m2geLN+Y9EQwC6NJI391Hq9wrjjxn4pgTmbG
 1r+h9l0XmQDC7WoJ/1J2PEmaOQYgDWdWVI7mrMzSg2DIDLDOW7ApfR0
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+gpkGlrpHTQ0
 dCcuqVCNh8B/H4rTRTZbihCT/fVQveQVJ+6UxOxwEJQ2gBD75+DXPE47hP/KTtfHyBa9ghE0p02
 DYAkzYUO8ygjN7+wUM/aEMn+lgGogXM=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b45 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hA1A6weoOJfvvjuqJi0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: gmfuEcQ0SneTInDzkgV3rFlC7lxQ28Qw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXxAYnnPDZaIwI
 ewyqD2t7m271x7nKCwIKQHBnKIWbTtJBQvpBUe8KKQBwCx0ckBrFM02+DxUWYnDnSt/9cEMtX1/
 NhLMo2GCfYKnoeMyCLCIwDJ4TKOYYHUM7PWWRyU5ql31USMjpPPo1XlJR708Hr61sMYVNMKTp8i
 GMjq7tF/tHeA3sGjhsuaS7553TFMH71qy/XowgY/8Xb1GJTr3zyIBYGK5jxmRGdey11NnlNtV9T
 hv6x8r1lJcTUPzsTKTd/sVqgUta/oeN8kRW4vMPvMwf92Y0FFltD0x3Rlfa3HNHyq2XO299atT+
 qmQXfeFb1ft6Aqg0v8B26QPCCXOEUW3fKgaDvDJTH+0oq+NXPAoVSPa5bismR94W2hDU+ghDEMd
 OMnaH5He100BoZQdGY6pUfP9FA+dBpLmVuu/vq5qh1S3e4FTcJWVI+7XcEV5pJsl11bih4SFSlj
 /bK7l5MqSl+FovO1MwQ==
X-Proofpoint-ORIG-GUID: gmfuEcQ0SneTInDzkgV3rFlC7lxQ28Qw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

The `iommus` property constraint in qcom,pas-common.yaml is too
restrictive with `maxItems: 1`, preventing SoCs that require multiple
IOMMU entries from being properly described.

Remove `iommus` constraint from qcom,pas-common.yaml and add it to
SoC-specific binding files that have EL2 support and require IOMMU
configuration:

- qcom,sa8775p-pas.yaml: Add `iommus: maxItems: 1` for all sa8775p
  and qcs8300 remoteproc compatibles (lemans-el2, monaco-el2)

- qcom,sm8150-pas.yaml: Add `iommus: maxItems: 1` for qcs615
  remoteproc compatibles (talos-el2)

- qcom,sm8550-pas.yaml: Add `iommus: maxItems: 1` for x1e80100
  remoteproc compatibles (x1-el2)

This allows each SoC to define its own IOMMU requirements while
maintaining backward compatibility.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml      |  3 ---
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml     |  6 ++++++
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml      | 12 ++++++++++++
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml      | 12 ++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..4662fe4cff62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -32,9 +32,6 @@ properties:
     minItems: 5
     maxItems: 6
 
-  iommus:
-    maxItems: 1
-
   power-domains:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..711c2f723b17 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -106,6 +106,8 @@ allOf:
           items:
             - const: lcx
             - const: lmx
+        iommus:
+          maxItems: 1
 
   - if:
       properties:
@@ -126,6 +128,8 @@ allOf:
             - const: cx
             - const: mxc
             - const: nsp
+        iommus:
+          maxItems: 1
 
   - if:
       properties:
@@ -144,6 +148,8 @@ allOf:
           items:
             - const: cx
             - const: mxc
+        iommus:
+          maxItems: 1
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..e643e44a4739 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -178,6 +178,18 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-adsp-pas
+              - qcom,qcs615-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..dd81ecdb8dc4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -317,6 +317,18 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-adsp-pas
+              - qcom,x1e80100-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

