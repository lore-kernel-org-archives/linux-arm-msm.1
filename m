Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180899;
	b=rLCTTsq0so4HqnKqremNf6XXpNh8LT2jPKpUfi+/p2XKlPVU4ORDbJfUez9xFvHeoAE8
	 XogItmeOgOeA5uVU7PYaBPpxLHgQMzL9AM2QlyXxmYy1tMkZEYK24BYUf/0r1t2AfiESO
	 ZX+BsAF/0f7vwReGD59OwoisA2DCACpg7S1ojQHs4GvRkFFeeA7R3gobqaKMykEssD6SO
	 y7dfJaBKduZbgDOQmYBz5CPCNg1MGsQ17H7IOZ2gt8yYe6s0ZoKoiRiQbGjnJ7fKBHwwT
	 9+bqiW8FWmqK5ouDWSL32X1MA3Cg5Kk5EDu+TsTpiWIdzZExd9luDn4htOsyZLXbgFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180899;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
	b=TYFEyr7yig2kMCleAQ6URM1HnTxenIoYaE2cB/KSiH0QnEDn80iEzX0L+Qg0i6qPkmgo
	 16CkzgpHCcL1LWKZmabCbWMq9T6Utg7WSQ0loJL/fYj+m780Gr/2twVskpey5qgVXWRYw
	 IAf2B8RuCfK+R/7Jcw9c+Sp0JF3iDv8YWhkSKHZsMq7CBcl7fvlaure6ad8fUTuMmIyRb
	 oM2exEkEshxBOnXmesL8MlDULr4ImNJrwJMJK6M+6yZDIkEJMGuyOswsJZ9/dfdSnJyMm
	 CVL33dvx3FQyQL1cfZDawa41k1IucTW9PU7hYneZ2JYy9J63TCDlQ+aQ2cmQwm5EiNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLqY5v+P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10165606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10165606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfsTI96N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLqY5v+P
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkCJH3987461
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=; b=lfsTI96NcRfym0qx
	Ewn7J8yRv5lN+EMvbcDSaMPlD79smUlb0JsvejSWU1cxZGYZQPkWo65wAkzIs1D1
	xKoVsjFE4le4RADHwA6KvZ9Zb/eGPtAel9CyvR1mwphr7PuY66NzKNVnDEwyrQ2S
	lEtSxeUyZpFvI/DtpzNWlhmEiSh0KfnOu//G1F/BLE/qvJR5muNFYssKvoFQ1d4+
	PXu7QiKN2so0hiNvMU385u/AXqfI5D/HkqRebioYUcHbZ70qxGSumvfyNMwfaJD0
	ZkiU8vh7xPRgagQLFyGWJB4MFcC2dydhwRvBJ7qCtq89EVlydFDuKAFblwbwKwlA
	tOk2gA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81mpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:21:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1124477eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180897; x=1795785697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=RLqY5v+PFCJL1GkAxOClAljxH8xlU5Y9zCAOJ3Qpd74Z2EKCfYnMR1kHQOML2GoPOD
         t7+jkJxIGvLYCEm7BupSDIvuxH6ZniXmpAZCAki300WyNhRFPbmHnq51qycdS4PvnyLQ
         /SQE4+LFTsML2c6mdjoTayll/VYLejF/gIkvM2UPx8dUcrUnNvCe2yJARNs5hLT13yYn
         eq1uuVMuivOce8kxGU1FgWfnG6rCllb4JAy/N2mXKJhTOqPKwHYiAhSLtaCGwRcgMZAi
         8C3mu5le/Az83YIR4YkhlR2fB5kIzFv5clJPTb8p7SQxnsfQNwJ9oF7KlB4f2rP5YEOC
         SNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180897; x=1795785697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7LwLRULKcQe/z7/3kJXU+8smxZd9XIfQ+akY1ynBOeA=;
        b=CHsNzbWftXiHIr8iWg7cJ/ZKBzSSQOjlZHeNJRGwBHvVfw2jyEneJyrYGW5k9WXwd8
         s0zUBcmOrxzO+g94SXtGNbEkyeA6IdI3EOq1Mhlvg8MJmIcsFpoaX6s8xsxZjiiGL3ks
         e5Uo/RcZ0SqQ4k2Q8TdLxu7+l+pA+B55uXfSAWDxTi/Gd0d+pLzznKZIktf12Zzo6dS3
         GIC12n5OlTfYyHyreetYmsqHW/LNV+fLXiGpbtzb9En6jzEVbzjbtg7/LDa6GiUDJ6he
         /gQuQisz1s47nLv2suUDbaCK6RWRudQOOD8iYwDK3gjwEyL5k/C+jGLTRcF9GTFFOQ/h
         cVRw==
X-Gm-Message-State: APuU4Z/hCVnB7/ykGmnmdYGQdScL1gs3DVqKxsUDhn1+vODWn21sNFeu
	bE293tAWWXQEH2UowrM9O5hUacUSBCz46qdBqt2sQVlqOyoSSEf1aimECG42K8boM1wH5+yb+xd
	TVo+kzj4lvDXZqBYgUsgmOp8NT9yASUMBTA+iIWxv44GvQe8BDbHoiJMn/V/cTZm4MsRg
X-Gm-Gg: AYBFou0qQwzCyI+TsfDcwoGEUEZ4bKkEBtDgn2iujSU6+91Ph+1MVrlJpbj6R15SRSW
	kGS6Wt0zaaAcjIQVLp5utBo25FveI5HCLDeg4z4YNGN72O8iaKTxV6OO8kC193zCXEwfZaGZQw9
	sA1kkDTOCzrmlFblO6ts06apXpSuwwLT3mJs4udpDBmn011afQAie9dXcTTMM6PN0N6HcqdFFrG
	6+SMW/i0ol1waknihgwaDSgX8wc6bklVAjVrt9wiba5nFsMtADhxBZfkQ0jdXyh4t2yrC8JhFx9
	7MzVWN/xJgo2NKCifS8DSK94o9dUEXOHumK49WHgyZ4L/i+V1lwCmdFxAwb7FVDak0iEfX12+Ev
	BfXf6SebDmjq87N+nZmsq+QdWZxJ5H9A2U6KlVnP3gtgzbuBQgY8nOUMvb8S+dGjU
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009491c88.16.1795180897498;
        Fri, 20 Nov 2026 05:21:37 -0800 (PST)
X-Received: by 2002:a05:701b:4193:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-1b55689a0fcmr3009452c88.16.1795180896843;
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:36 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:50 +0530
Subject: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Message-Id: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OnlGB0lHwx5DBBI0YdWS06WaZEWTOr+RBHGa82co62U=;
 b=mc1Vfk3i7aEY4zzE2pKuvjFl/03FLuO2BqaPMz5KkwZdee5r8qe58VxKx/y12U2T+2v5CtvSx
 Ztss9gKJkR7Ag+5kMMq3xwyHUxHgcALmfGpPFe8NCjeGlTL8ezMb9Ga
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX9/KXSI/1zX9G
 aDa8bfHBk7D0AOc8WKX93FsOgjUHgpIg5AtXbi+hgZ5nPBf49+sZug88P0xPzTN5LebKBpmd0Qb
 Piz4LGoWAu/s9uPkro1s47RnPOaVL6a3byXczGh1um+EEGdxw8Sw1/fwrr8HPJFMvEK9zUjmR0u
 EJKgf9QKXkSL+LtKEPx53+7uWF4d0/QXdowUxDWmoke9gwYr+km30Y9FpseFBf+OPJWk6jbyC0G
 pziHGi56wFW1+iVjx5GbU0tMPH+ZKAHpub4F+snGqSXFU8oPfUQUqbvWQfSAVofAHTYRVBTJsp6
 1K462la9/yF2ClNsTmDReEW2GyVA6m8cL7x8C9bOYdphOq+M7VZvJVkcv4SXOY/P9hhJrAuC/CH
 YuiZrvSw3xbiuOSWmVNVSmDEKQLa1pb5O3HOKhXNq/AH+XEaOoHxtWmE1eiGY5GHy7tu1w1AkUM
 MCVL8E23zIQfcR7vq+A==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004962 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BudFWd5Wdpf3J2bc0pcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2-KX7o_ywYMcx1I-z6brtbBm137PUK6b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX2Yt+MkzIe+uk
 GLOB81iIR5oTIgesEKT9tq4UJ7M1B9L9ObyulQpE6n0cPZaVuExU6gizQeKBwPKfxVFEs1OS2BO
 hzBKBApckrL7F+9TPbg1EvsVvgFxpYE=
X-Proofpoint-GUID: 2-KX7o_ywYMcx1I-z6brtbBm137PUK6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

The number of IOMMU streams used by a remote processor is not necessarily
limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
and MPSS does not use any. The existing single-entry limit therefore cannot
describe the LPAICP firmware streams.

Increase the maximum number of iommus entries to three and constrain it per
compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
one for qcom,shikra-cdsp-pas, and disallow the property for
qcom,shikra-mpss-pas.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 74f83b7ce08d..3b827f2aadb4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -92,7 +92,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
 required:
   - compatible
@@ -125,6 +126,25 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-mpss-pas
+    then:
+      properties:
+        iommus: false
+
   - if:
       properties:
         compatible:
@@ -140,6 +160,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          minItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

