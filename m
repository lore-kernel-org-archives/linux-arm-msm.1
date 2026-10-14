Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1508C409623
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993402; cv=none; b=RZk6u7jrgHVG5JRpLdwUa01a36pXTNMY/7V6RDhlwmK8ChEVZCn/SuuzaxVz4jxcOs/QU9fndnGF+fhgOQpLDK9EkUP2x6fysKaM9esZN4nB3SLCQJpIgi6sWTYFGo/cI4ydv7noZlPm5WmZGwM0Qwiq0Dx7KQiRjGEtj2czj8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993402; c=relaxed/simple;
	bh=0cSHgniriXpKHw02i0e3M7P7eWMIpRf6UznVWutKdYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkFp4Q0TpNoMNrME8bjvhsaU/IjSdO6fPS1xHgP7Y1l6PiC73WDYq78n+U4BbjZmk7m4SvgKWkj+3QzhnWxfnxqlBhDadexrp42s0kF3sh2EzHuRg9HEHiYbYhEOkia8/c7nGWeQVywHzGWRfCqSQlakKua6shKBbwt8rT2ZrZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+GHvyle; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahonGwDc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+GHvyle";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahonGwDc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbE4J301154
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=; b=h+GHvylefpaRPeNI
	tUbVlkHIluFEntsPME9GueVa9eDP6/yPdD+h1ERFnjxfsmdIYc8oBCoGt4PF9507
	rfBEIDe2u85ZoIFXtagcAg/Szet40/xjmRYSwfOnhPqEYBvpNb6pRQ1+x5ZuSuq5
	Eer/CWIwUFG0btGudZx6G4HJe9et5H8T6O/FPKgp7EYU4QjL10a1J3gb8Q5GT6WL
	wbBdkMZNkQ7Os4yGw4Syu1DBA1g+CW40J+6ka4UhZx8UxHD44qNiroFJ5b7lOd+4
	Sbvmcp3ONbQM6mYJ2FjLE/622tgVWEQCqYM5tj2sgZ2RZ6ln8lcmRQt2kkVWssbt
	m0+U/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622c8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 15:56:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so32636835ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791993398; x=1792598198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=ahonGwDcMwGpJ679ID//tm4lOZtnKDj36di3xtEWyLRF3noYnIW0BUIJlNMNJwnILr
         pcI+L05PaWTwS2c8CAV2qTMXhgaPeXH6w9DEldLcV0m8MsxGGtUVS6GfKXYuxcQDDByp
         g8WoNA1stkyP1n66gR1DjNJMK2lKssyhUzqCGy5nNdk25flAyFr7XrovrRiG4xv9dADj
         FKUjfCxbH1UKVptscak3TdJwR5K3piDZKM50rESEIhOcZvyMCdXT7VQnqnAaI0HKN4Ns
         venbHWXOXLFheagBM4P5wUAdiPHedLislawOD1xv/SuIbJy49kJ546EfXA11z5tKq8pL
         9iZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791993398; x=1792598198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8w3Lw7DKmz55PdeZYxvJqbcSrA9JDoqVHNUMY9HxG0=;
        b=TaZm93TaSuae+xNfyd32VGpzpq5Q1JOBWXRycpqzEXCS6ub9Bjlt45Wdopg7KXp/sL
         VIBqvt4VpY0TnmJUUVXJlMaZc2cMcWKzaqDfk86V1xe8WE5bi0iYa1CO39uFlu3feGRk
         j24QvzVoPzBYIIhmUhgU/Zu7H4fWYA8cLPI5uDyaZzNHxOg90NsKS/0dke+gD59bhr4o
         bOs3uOsr+S48bxjktB+rpcdAsN4MTdNH29mtQmrPp0vPJLfAUjlsIZqBfVLyauBpyn12
         BFZFLRCgVMdp7GdwRJbiS8otTurIPliXd7I79pP3I8bdi1N3yfzBvpUUIFFXq6MfXOQs
         5t2g==
X-Gm-Message-State: AFq9FYJPkY50wcpmvDPmh9sykqjkqujPJuYaaeP5GCeJj+Xi/qPzA+2H
	7NU1x5No5l4CNvXJRc+pHLD0Mq146g59nxz/6SWFY4efuQQLyvy4IMwEH7Nd9fXzb4RShk0Wp8s
	fDQPXVaRq5gSfsMDrnNrC1bkoBbSX7Hal6VlxO8+SVbvm4IS9ikKZEGK5OG+Utmd2z0dHS7D/WF
	jC
X-Gm-Gg: AYBFou34iT1y3ykLiTscvjTaJdcMtpBxfN5Grja6wJ85d/W9a92lqO7lxdzz9wglHi4
	rrFC5aNXC5dwF02U0W5Ob+3kVudE8fHlD2LngxU+2nO44d9R7AU8uSEQoQH17sqsC83V97n/BuU
	3Vbt6iSGQUiVlycgxaJ/iX4bf/F+bbEjvTSKvhrZWo3o73hs6XRO9glHX243juV6iNB1D449rxh
	kdwFYA06rk/OvlP0SAxNCATuYwS4HhSaEasijPLHEs6oKJ3K6Hb8LBQvk+k6zOC5KQOQMNxlxYO
	hfmXqjcHdLfnvMf/VqIHlzOalD2TiCYXWd+OSP+i+kxIs5ShuSr4ONAt0Wt5/q2XUmBiAxG4sqv
	W8I9AdqlxbUwjP3wwjchZ1Npsgqa1x0APWQ==
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136036405ad.19.1791993397958;
        Wed, 14 Oct 2026 08:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d4d2:b0:2e2:d8f7:9f54 with SMTP id d9443c01a7336-2e8429a648dmr136033535ad.19.1791993388546;
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm71961375ad.69.2026.10.14.08.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:56:28 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 21:26:16 +0530
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
In-Reply-To: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: zMErxe9cxr-sQqidMVdgqIHDbdylOTh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfXwQIZODz5MusM
 78IMGD75MNWKOFCRgtBIsrtblUI2rgX4rTK/AL+JYw5RnAkqoUM2dbJAyqWJ+SjQgn01vCwg8wH
 40I/YZYzjxc+EM7z6xrKydnkoB/vSblWqZi6LtX5K3oIyix7w6ndh2nfAZ1WZbp6QPlYmoZllp6
 tWp+0+7aJLaoppK318Q1MupWuioIwotLzeVkzEFA7/I4aUVwJcgDVpzI1rGDQ8o5tBsmFvGxECh
 u/+QV7wo3maitSZiNK97UV973auO6x6hbx1CmIwlUYZex1CEEFtCmTgl6YACBW6MPFl3HzoUf9c
 E0ZBa+DRsdY7f9diI1T29hfRkXUxFDx6gVHB4bb4KpKMGqMGk/1aAyjfZq4R3WgPuOz+xY4Z/1R
 8Q4jW8NyXNHgZpltdzD0GgWHZRoSyXJ9JD6sRHzxgmst3w+Hs7YZ/Xo89IOLZsj8qF3gkW9OIAq
 VHiPEuk0emTWBL3zLlw==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfa636 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=whjmla-fUz_WVyb-YBQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MyBTYWx0ZWRfX12uwP4JKVDJL
 0zcpGyQNH7mO+aIf6nXoXr+GHOun1LNS/E5JjTkxJVIbplNReg6jcFnmINFw8esNV2OwIxBTfou
 VHX1bvLajfOuPR4i0QazBdHH4Q0hBMA=
X-Proofpoint-GUID: zMErxe9cxr-sQqidMVdgqIHDbdylOTh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140063

QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
on a dedicated interrupt line separate from the existing TRP/DRP cache
ECC interrupt.

Allow an optional second interrupt in the LLCC binding, add
interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
are present when compatible is qcom,shikra-llcc.

Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 2141e5d4de63..3546cf7c2519 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -64,7 +64,17 @@ properties:
     maxItems: 18
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
+      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
+          on platforms with an LCP/SRP block such as QCM2390
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: llcc-ecc
+      - const: llcc-lcp-ecc
 
   memory-region:
     maxItems: 1
@@ -234,6 +244,20 @@ allOf:
             - const: llcc1_base
             - const: llcc_broadcast_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-llcc
+    then:
+      properties:
+        interrupts:
+          minItems: 2
+        interrupt-names:
+          minItems: 2
+      required:
+        - interrupt-names
+
   - if:
       properties:
         compatible:

-- 
2.34.1

