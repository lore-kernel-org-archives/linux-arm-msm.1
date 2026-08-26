Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117B424D59
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751970; cv=none; b=UIQWDIw84z9JjdoQSFLy7ErL5i28K8BZDmzSDwpdHnbzgw5ir9juEUiUSOoK+gDCAppeJgzTRdNgkq+POGdnWRTrjdzs0gCDb+TfczIscrUSMRD/11Az5QdPh2S7HK8MGWOIKWyx4pHqihBBQ9/+NwaGKqzuMor39AiIxZyJCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751970; c=relaxed/simple;
	bh=BbU3aeT8kDtvkKAMi736qK8ufQxuuJe55yKLxu9JT1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVRBIQXSxmaHBXOylHuzv0L29OU6QJ7G2ag1O8Cz6GbAmFOL5ISi5cP60WthyOL9AKhdmdYMlQG5Brdm3W7v/CbUZFZO/Snhkd12QmYmoHSIqd7ArLiRYCl2JMM3JADti2vonoSo7bSlcv8uwTAggMxyjppw2XGccRMJSE4mqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3apjqhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQzXptJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3apjqhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQzXptJx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCBjCT1909137
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=; b=W3apjqhxoZO5HRyy
	gYqHC/KoERrxR0zO1CGszuN0uYLt0405e149ZOqXkcWvTtGdzzmiaZwIS+YaFARj
	Jo/NvKN0vWymEcEx6bdEGFT90ce0j62/W1BZKbF09GHEiGmxl+rVAGg1EDyE3Jxs
	6IkYaDM7r3z4di9O/jsqnbOyK07Kv36TKY3fBzYXrRoJZYQ2qK2SpqUqzCBXhpTi
	OdRR4rti3NYIipCrnRb0X6jgYHjhwo6nPEJ25mg9B7hcGqrnB8wQEMxBmb3hSvtC
	KFQoA7/8FiPxCuXx42JMAGQgoVcIrnfliKhKMriP3u3mL38pvCyun/+ugE2NyHE1
	7EXW+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1sgy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 13:46:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1352526a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751964; x=1788356764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=;
        b=PQzXptJxr1XlEkLice4BvI/2lJQqnnjht8IfTEv18XgXjnLpyCvzYVfKxS8txsBop+
         IsmJQ6CoLjWmJaFrdup7uTBwIY9zF+NHir5XmcXBvR3EzBujMtfHV0rjug6M2KiRNOlB
         RL9gwQE9ehH8K+qAzRp8aVV9jKm3eUFvpVmasz6SLdVuqbTlVPUyTwAXU0M48fRGOAS0
         EV2iqrhNqhwy0iYYrKUnDvABM6kA0cdUL83ulpuRLrBpyKrLqCoQ1dfVWxAmokmbZQO+
         heuvwA6HEkccpK0GSmNfmN+M/Edfdlod6sc12NBT2Iiq2MqsNqrWZ+CNCXZzrD4n3A6S
         lDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751964; x=1788356764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvrhRhSRgFm3KRFeRtyPfPbaECnbE0fwGNji3RrKscA=;
        b=D8fl+hv3ZOdlND+DrgCU3QtmoJ+PppJ+URlma8onCekr4fvR919piNmezgHhbr7qlE
         8fwTVlsfElDGfGLxLOyrs7wuKbz1l1gbdBVKQl4B3vG38f7zSeP/zOzJ3s4gVXyyqHDg
         rMYZAgXsgemAL6vmfeqR4lUHRIMEj6XO0tp/0J5scxFcBkQPEvQe85xm8bvDqNhN8xmd
         GAoIxXPeuxJdU6HrlFs4GOQwRQToBXegr34HpgXQdiiMlD2aIP4t+qcS2FUMjlShcXhl
         yIZ9BSfhj7nRHd9gqggMyb4Y6pfhNxtuU+TMRnJZHJxKZr/xl57AcOzIpTHD0jjEvbu+
         MJNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3WqW18hg8Y/s4y6tAd3c2KZRhI63b2AbGeCsmTz25RoHkF7CO3N+jiew3GbsHBJAoYbExHpc2aTlqeDSg@vger.kernel.org
X-Gm-Message-State: AFuF++l7vqIPLzzvaCB/2djMgkv2YdWpaYMcIFuvonz1j707TEvQ9SRS
	faoudINKCsvMaDhlu4pcEgel14bZLrEgmcOv+zZf6IU9Z7Q2gXNQr4H1/LvLoFayRe3VazGKwgF
	1ppmmN8yRRkNfnZ54KWb+d5nOTqduSEgZG7UcEv5TB9yQgTQGVq4p3+o18g+9uGDsjJsL
X-Gm-Gg: AR+sD12PIDa1OOeED5M+DcE90c90X5LWDwwlWDpvc1T2XhcyxFbPSFoSqWX2kIQY21v
	13SteM1iTVGE0+A5mSO32vEQPZGnFCgxg8EdKCIQmUiCXpTUxRTOHsPlS26LXplCk7dpbnTC+db
	hgJna4ZEuO1Eb+wDTWiiSsqFvjJA39Q6afQxi2XFDz7nReSiE8eyuWJxFmZNulYlHzlzh0U9M3M
	+x45wZLUc++okYir3U5XLjBr/Q41/wT28xf0Aa34w8cjZ0bpD+Bgm7E2Wcjb6p/Wddz4k0x9B9Y
	1t4yiLY9HHc6BUndXOe2PMiE+MM1ZTHIH2Dd8kg2oJGMK4ZiLE08tr20vEsurj8OgbcA3K3grnd
	Iu5AtV/RINkBLbtUW9K2RBr3upwQ1Wll6vw==
X-Received: by 2002:a17:90b:54cb:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3966d5b7c62mr15843956a91.7.1787751964024;
        Wed, 26 Aug 2026 06:46:04 -0700 (PDT)
X-Received: by 2002:a17:90b:54cb:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3966d5b7c62mr15843827a91.7.1787751963551;
        Wed, 26 Aug 2026 06:46:03 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:02 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:43 +0530
Subject: [PATCH 1/6] dt-bindings: misc: fastrpc: Add memory-region property
 for context bank
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-1-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=1735;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=BbU3aeT8kDtvkKAMi736qK8ufQxuuJe55yKLxu9JT1o=;
 b=zF995oQ3Y0zaRNhFCXjq1tnksXYHKJozOLD4+QwP/nP+FPezLYl+3kGt9We4nGf7xCmvNvKJ/
 eUDi/vV9KwtDasgYRAh3HPzMy3qvlYEsTSuS0DS8fY88DcFZiC4U25u
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: ilNK3F6iOQyKRnXQnu2HXSDwxNbbBjql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX9cF6BVXJmE78
 UVKncTVQdYs3qgwSp5dq6TS3A25NXSuMEeIV0e9WmidpVUtC4JU094GBIe//ZPUFzAbEKTNp7Vs
 b/mpjoiE2MAogawhcVn+JKa8r0qzSoDA76vOQRqAwRKooWyWRn6OOdoJt5JQPIMEHTeicVScjtG
 3d0/T3quHbYszZ3qjSQ98KHRM0cHE4BovqdZ0WwgvuntOBWs/3vjUWdgl9pLdIKNrrQmm0IXep7
 K6O3nzhCph8BV8Ht1gJAHtSKEw6chjOGUHG7HqNZsS5yZqf1ss4IwLPQIrNEQKOucN32s13bFr0
 JhjqFeCAVySjejH0tNGsBuOc8Fn7QDY61Fd5qAwBxAkd0W+fM49PlExNQs7WpOKSq5Bj4dt0XBu
 cd7EfQKAf4yo6vZdEgM43B3dtp2t+g73wnZejOZ0/kY5ipa1M7wK+6+wdSVYDl40lMY8WOwHDtg
 rLoS0AqKJ2VnWnzkJqw==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eee1c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z90vTsduAcvSOalKQMcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: ilNK3F6iOQyKRnXQnu2HXSDwxNbbBjql
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMyBTYWx0ZWRfX9BxfSBxsPgBX
 ra1sG91mzyLH5A7mVf3wFSZjie2AQ36jvwFPh/w8Erpm+9R0oxkXfNOLumY8fxFHLnZM8dSf2YR
 AAYPr/I7yuzNoJVVtuje51Ncx/JiPuw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260113

Add an optional memory-region property to the context bank node schema.
The driver uses its presence to identify a context bank as dedicated for
extended IOVA mapping and programs the SMMU with an iommu-addresses
range to push allocations into the wider address space.

Relax #address-cells to enum: [1, 2] and #size-cells to enum: [0, 2] to
allow platforms that require 64-bit values in iommu-addresses to pass
binding validation.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index e945c8ba75e3..f9830ef37814 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -73,10 +73,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
-    const: 1
+    enum: [1, 2]
 
   "#size-cells":
-    const: 0
+    enum: [0, 2]
 
 patternProperties:
   "(compute-)?cb@[0-9]*$":
@@ -98,6 +98,14 @@ patternProperties:
         minItems: 1
         maxItems: 10
 
+      memory-region:
+        maxItems: 1
+        description:
+          Phandle to a reserved-memory node whose iommu-addresses property
+          blocks the lower IOVA range, forcing allocations into the extended
+          address space. Its presence marks this context bank as an extended
+          mapping bank.
+
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1

-- 
2.34.1

