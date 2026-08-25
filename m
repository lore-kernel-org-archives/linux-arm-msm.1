Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D637DE8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683248; cv=none; b=kWBQMow2FL8V2C8JqVgiMk6m6LHguZULaL153HB6Re54fP5s5D+zaeE2adIMyvxWVfALZrNrs6ChVn+gmB3Lgqk+Ck/rughvW0raowuyhInhH+LD5IvyZmSxDO5xIwgVUz2eIDaV7qPbZ3u/Y6t5NbzLHPk2CFHonWzqvWoPxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683248; c=relaxed/simple;
	bh=VpLeI1weNXJ08CxiM0YnVaXdUGET0/3JYvolTB/ZhUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5Qrhxo3vRSk4KomU1V97VZoPgzgBIXFPMmd+KbvwyNVkGpjvgXrw59hOeaD7/TSyIBE3MppmuLnlNI7szbGhQnIUqNtzGPAujrxd5VlBAMuIBucpTbqIv92VbEukSHR1g7SOuDAaUulripew4cJAwtvWTTC3xD+9QtTgWlj/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phC+XQzS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHV18eAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phC+XQzS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHV18eAe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdPAm2446288
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=; b=phC+XQzSRufiFNX5
	dB6OaknIe/kBPCkutk1Eoosyoq4769J7pwJj8GWQXuLZn+rtcX1fBaNuXICyfwb1
	OTFOUOMui63ZijSg5IWYsrdzukITA4veGZT+hXEj5v2Y0ebmQ3I5hwg7TiJDNGyB
	z+alAFHkblpS5qEI+pZII1kG47F9tVG6lDPqcg/srWxyJ6NT0revKmPnLP0w8ic6
	uJzcvIuwzxUo28D8zw4QsSROyFW6BGbhzVgkdIGCyGnssZJW6V2IJ9yEKBteWF9W
	xTXy+tTn42S9hdO5gQ8lK5mkZ+MBlFxUC20HqHU9vR8Gh/skpHyRXwSBibx2D6uQ
	8BdyMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcerb8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 18:40:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so1924715ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 11:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787683243; x=1788288043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=;
        b=MHV18eAeabV/YueXllzYawqgKWovJ8aSyJ4oxr0W68lUwqwCZXk2jPn7e35BrazJZe
         DDHT7XusqxfVwxMXPlVP+wzL8LBDcEOGfL2hjD590XMM+15xHIMNwJqHhk2FRPcrmHRe
         qBGEAPs2xw3/ZRZtr1qQpkJbMZnK3zqrRWboPA0+5Bb2/2qDZCug5R+KDTVCMdIyT7ZT
         sz5wG6BBZzFMDLIMqKhjIdYyjPLctrn58p0PBkmF47W2dCaFiGqSD7F3QfO61pEvci/1
         PGkw/n14ipvBzLe40QoyZe3QhvvvNq8i8gc8P1tzBH4dktazAgdadwWqaJjTdZAq4lv2
         cTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683243; x=1788288043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BMacg1lqDbZQnAIg1w4xJBMDzMgeAPUHcKeTyyZMqU=;
        b=fEyBCweZqHERPIEFxXKBuQdIDNXogR/ODuyScZOMNE2qXi11ehJLFmgEwkMi1+D2Vh
         fNfMc6S9AF+/HfWkb0LbUQDKtYeLFZ6hZRR3g3SzqLrqCsOONeimZCXHeggVnGCiXuM1
         c3vAoPz1+choMkZ0iRspJTIZc22Apx4HBWj+/4wzII03fq2K8UoQ0JtHs+9StzkyLh/u
         UwQgqm8dQpBBYlkrtoFBj27TEpkqyU0G7c3JHmPUuwBZ3BCg2w4nIjyxR8Sn+MCKqLAt
         X9V8P+tW94ZTHoC/C1ShJ5m4megix1LUQpyWSkleRJxUasq36ZNPOizK4Tw+zvYMbPq5
         XvlA==
X-Forwarded-Encrypted: i=1; AHgh+RrVt8z9Z5xfTVg96zw/4Rtnp1pa46p6kVUq7QqSpTxsFUSlXbAMmUikb1cRsG6SdwXC8ubqjpTL72NFRTJx@vger.kernel.org
X-Gm-Message-State: AFuF++kjnYvH/dYcbM0VK5L0gSRzzdliR5H8Qo14T0NeJXgF8N+Zdv2t
	81hYwFZZvTRcovVC/yIIuhdQxYr80KmbhcpdxjeDAuQnBXHW8bOrOJFC47sHKqyKCAERuelNc7j
	kMuqY9ZoFZE1nS3Dc1NOjk1Zl2VlYAzYhTsBPBF7v2tYIH7LPRCjaX1dlLQ1oQZnBCIjZ
X-Gm-Gg: AR+sD11OAe0CjzSm7yWX6j+0r7o39On299E3Y+PXAHTaqwJTWzTwfKZr5hGl0dHOxk4
	Zudi2/Eg4OxVnuCyhk/RF+TcgRTa6woHLEaW3Voffj2Iu+S/Q7t1Z4jOrqeYFxR3dmHcXRdQVDj
	bmHr3BF1NZfNquJgc1z6guKKSEyDZf4URkBQkPQqlGln5Ci9p+2BqlvZq4YVxVQsk2RT5WKjRob
	juBvAJYi2E0tVD3GAeJorRuuMrvYx1wnziVQcN4ZSpYYNRK0bP9haMhKqFuFzXipi8+DVsBxhH0
	hyzQFfWLq09WVWDmL7/6xk9KZn275v591t2hr7hozQtSvEGSMWl3R3JVY1I72Fls8fxK8rAz7iU
	NyymkZogLFXVpSeeKOy1Q7VIklCR3
X-Received: by 2002:a17:902:d54e:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d707aa4b9dmr6005245ad.5.1787683241603;
        Tue, 25 Aug 2026 11:40:41 -0700 (PDT)
X-Received: by 2002:a17:902:d54e:b0:2c0:b6c7:227e with SMTP id d9443c01a7336-2d707aa4b9dmr6003815ad.5.1787683240972;
        Tue, 25 Aug 2026 11:40:40 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm256117eec.8.2026.08.25.11.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:40:40 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 00:10:12 +0530
Subject: [PATCH v2 1/3] dt-bindings: sound: qcom,q6apm-dai: add stage-2
 (SCM/VMID) access model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-a2a-shikra-vmid-v5-v2-1-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8de1ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=v26nnA4qrlwCZKXH8T8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX4WAJbTgxXIU5
 JaPFN/pnMZPddVTUA8vz+UunOSjqz/6VJpP6goSLf8x9kPzL6jD4wnZ5vl0/3wkwuvv8RhBVOIt
 lnV+qPO9DxWtmK9GSTscjbv+CkXQckI=
X-Proofpoint-ORIG-GUID: oahez8Eu_xZgkP5eGlDSYURNsUGZyi9h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1OCBTYWx0ZWRfX5CRcgHIBXuYh
 9PdLUooe7QabWTC/a1Prd+LBsOoRPrwglMlidV7BDYnYk+5dODAFxzfHr9Ym/9jlqDtwwiyW0/l
 J7p/GD61BfCh/K2bLGKiWw21ILEpRDoNM64e4KgC+twSwjOSkclvvb/iBKA/rYAB3vr64Aj183y
 HQFXNwNwWe8Dwa33IuMrzv1MQv03rVXxr+Eui/DLo4cW8Z2ghw+ESR5D2N7VbHZZqwNT8gVX7x0
 PRg0glnTGUhQuVmO3SZkznHci6kRmb1COj2lP5HXmgYq2gfAVHxyghZWrXLKi6aHQKPDRQYG1UY
 iP6sw1MTTEZoeL9EEl7ZY5DAbMrvfy+tHNiM9PUvtgjqIwbCZKC8M3B4kEUDfG4+C7nd7C52iln
 koUWIfszAAu1eXTKv0U4QmMpjLEramWnXfWM1iIeNUGCtLhBoxrLHYSNN0V9+wHZoMFGxz/rwrz
 MpxNCYcKxeucCnMtWEQ==
X-Proofpoint-GUID: oahez8Eu_xZgkP5eGlDSYURNsUGZyi9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250158

The APM DAIs expose PCM buffers that the backing DSP must be able to
reach. On existing targets the DSP runs in a stage-1 context and the
buffers are described to the SMMU via the iommus property.

On platforms such as Qualcomm Shikra, where audio is served by the modem
DSP (mDSP) rather than the ADSP, the DSP runs in a stage-2 protected
context and cannot use the SMMU. The buffers are reachable only after
hypervisor (SCM) memory assignment to the fixed set of consumer Virtual
Machine IDs (VMIDs) that own that protected context. Describe those
consumers with a new qcom,vmids property.

The two access models are mutually exclusive: a node carries either
iommus (stage-1/SMMU) or qcom,vmids (stage-2/SCM), expressed with a
oneOf constraint. iommus is therefore no longer unconditionally required.
SCM assignment replaces the buffer's current owners with the supplied
destination set, so the driver always adds HLOS to that set itself to
retain host access; HLOS must not be listed in qcom,vmids.

When qcom,vmids is present the PCM buffers must reside in reserved-memory
carveouts that are SCM-assigned to the consumer VMIDs. Add an optional
memory-region property listing those carveouts. The first entry is the
control-path buffer and subsequent entries are data-path buffers.
memory-region is only meaningful alongside qcom,vmids, enforced via
dependentRequired.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml  | 72 +++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..d9a6bc4a14f2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -10,7 +10,15 @@ maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APM DAIs in DSP
+  This binding describes the Qualcomm APM DAIs in DSP.
+
+  The DSP that runs the APM must be able to reach the PCM buffers. On
+  existing targets the DSP runs in a stage-1 context and the buffers are
+  described to the SMMU via iommus. On targets whose APM DSP runs in a
+  stage-2 protected context that cannot use the SMMU, the buffers are
+  reachable only after hypervisor (SCM) memory assignment to the fixed
+  set of consumer VMIDs that own that protected context, described by
+  qcom,vmids. The two access models are mutually exclusive.
 
 properties:
   compatible:
@@ -20,9 +28,42 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    description:
+      Reserved-memory carveouts (shared-dma-pool, no-map) that hold the
+      PCM buffers and must be SCM-assigned to the VMIDs in qcom,vmids.
+      The first entry is the control-path buffer; the second entry is
+      the data-path buffer. Only used together with qcom,vmids.
+    minItems: 1
+    maxItems: 2
+
+  qcom,vmids:
+    description:
+      Virtual Machine IDs (VMIDs) of the processors that consume the PCM
+      buffers and therefore must be granted access through SCM memory
+      assignment. Required on targets whose APM DSP runs in a stage-2
+      protected context and cannot use the SMMU; mutually exclusive with
+      iommus. SCM assignment replaces the buffer's current owners with the
+      supplied set, so the driver always adds HLOS to the destination list
+      itself to retain host access; HLOS must not be listed here. All
+      listed VMIDs and HLOS receive read-write access.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+    uniqueItems: true
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - qcom,vmids
+
+dependentRequired:
+  memory-region:
+    - qcom,vmids
 
 additionalProperties: false
 
@@ -32,3 +73,30 @@ examples:
         compatible = "qcom,q6apm-dais";
         iommus = <&apps_smmu 0x1801 0x0>;
     };
+  - |
+    #include <dt-bindings/firmware/qcom,scm.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        audio_heap_mem: audio-heap@a1000000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0xa1000000 0x0 0x100000>;
+            no-map;
+        };
+
+        audio_mdsp_carveout_mem: audio-carveout@a1100000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0xa1100000 0x0 0x400000>;
+            no-map;
+        };
+    };
+
+    dais {
+        compatible = "qcom,q6apm-dais";
+        /* index 0: control path, index 1: data path */
+        memory-region = <&audio_heap_mem>, <&audio_mdsp_carveout_mem>;
+        qcom,vmids = <QCOM_SCM_VMID_LPASS QCOM_SCM_VMID_MSS_MSA>;
+    };

-- 
2.34.1

