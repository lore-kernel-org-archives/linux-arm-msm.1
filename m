Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564807;
	b=zPHz+jSOaH4/0tmvC7YVMIxycZr3pC7zi2CV0csOwUctwn4XDuK7vvERwDph4Fu3TeXL
	 rbGSmeGqqNUKy5SQVDa2tD82jWmNCytFpQSXEbFNOX34gC3ILQ7skTCiG8ta+uZQkjTei
	 LhEHVdJUeE4Zf7g/EsKliq2nAD7fEtSSbb2tIqrUUVGMmezt+D7FBZkZaI4hcUNoAwv6O
	 xeoONrZFPx68BAbrSmRKaqCZArz2cX8YNHSIEBsFOYPSwc1wvl+yvHarhFh0QPXx8H0iP
	 boacF5xbNi2CZfGj/Uufi6BMkoZZ/gBr/cKrjQuKaYrKCCVbVkmVSFAawvWHFisb1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
	b=il+QhDWDtONlRszagB5Ddn/zDQhfhtyKcFJFrtp54QQdMy0c0hS7LERuKnqgvohFd+CA
	 LgQGKLBS+bP7cQbYaGP7eTUx7cEur/eXXED3wru2KtZPYt+cku8LjsZcdBfunu1nhJGLx
	 w9lBbRY99mmKwmU4uWd+dcjFJA3S4uJmObRATkfSmc/z12AG2ghalq+fPeOQaTmdO4lMZ
	 XuflknP0nySJWoB56CiydiQhbtQe+HaPPDhzetMolU6DsiuJO7masBAo0/mkgnRu0Spc4
	 9URVkEjvKZyfGRjoINA5rAsx29DAlxQKJWUwfIUm8114gj0l1N6WtK+yArEnbF0+1dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97F606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD97F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j5SI248254
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=; b=GzQVn2af4SZ+1aG9
	YDNcPFj+QGm+2SeTuamJD9faEAL/7Qw4q7ddHKcXIFx2VCq4vQqu++2AKhn6gcHz
	HI0zgrwsPZTfPDdJmiYy1/xdfMhM3aMmZaipiPQMUZbIbclaAO3NkEnL8OUmHpZ3
	pXY3TcwW7/eFoDoJXeutKtMkD9NIpdjgQubDuMXqYSXGEwTTWdftjoW0v7/Zv1UD
	WQKMTyy1UczWCsHq4kY4se/4vyCblm6FppDfEQSQyNy7ny/VcB0NwQCyUiVWPgq9
	8URlvStwZuNqdio3TuJo+DitlsoLRF35DcU7pcF4pXg9iHy8AXe3EvoTe3MmR8IR
	9rPIDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjce6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so197365a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564805; x=1793169605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=FsQluqQlUeMEkHAWlgJXuDZKemNUyHyJcq/5NYZ/64Jx2muUJ/PUe3rcTLxbCyGIpy
         kV87oFtH7trN9M9OE8ug/1lMz0MycDmoqnemTBm774fcte0/XoA4RKCOu/o+0dj798vX
         nZohtbeIrrL+LQbzTszv4Zqk09EoZfLxokrYZFKWE8T/8RH8MaxgiN1ST1AdxvCAnyAJ
         HiSUR6iZFKTYcT4YkSQGxGV2ntsvua68xesJhVebTVBMY54SHsKP+9EqtV9h1+WfB400
         /7WMNl3/fmsfEXWaEJimZ3PBCUYNlf2YARnx659SM2YKrWOvwHB5oTGCZIJ6I7wPzs7i
         DMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564805; x=1793169605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=dahtkW39SkA35C/CFUOq8z5yzFDZL8UNgmkAPmGhfyiHIknTW4Iz2FMZM/dn6LhGLB
         WYU6dRVM6VF7lwyEtjsDn3fQIX2dsMOJBYrITQigFTcn5CR8zHPUXDXBQJYQbe2WrrxL
         8BY4qcjg3MBl+nXxQW/e9VjMVTuNmrb7z06xmgYJZw8kqS8IQqYxj1kJsWdC1V9xUM7W
         qP0ejUBu9/WDeTnHn5mlwsnQxGx4EvW9Zda6Tn8V1EMDmhAoSU7QiU8DfjaZve6fvI6E
         5bkg+Y4zuQTjMxl0JKACWyoP0II7FHep6vamwncJ6SxzjH+1Cfh0cPZyj8LrhOZTlPrH
         L5pA==
X-Gm-Message-State: AFq9FYItnasxrJViwVP6Ge+HEG/BhWmGQ6SwKDmrYNF3/cIDkJ6vIEX2
	zDwgTbNz8Xt9ygg4ftCysy6FuA0IxZt7Fv+ZQOufLo0HTA5/CP3I3+bMPsb9Oyjo0QgCy65j7xn
	S8DGeJw1qg33s2bw/Cw23iaPRJQLLM2gKUgfMKQBsinDjFM7nRiJOGM+X7P4vCSyE9kJw1q2QP0
	p+
X-Gm-Gg: AYBFou0DxFqVqGy4FMj1bTW3NKqNUzxKxKsyLMdZ3UvUq/M1Rydgngh5q3FjGVJkYJn
	VtoFubAY2lwWcGmSxg9KpkkJuwLB7pgGNX//s+fdLU2aK/X417ZIBA5pXbi7uAOzcZrDre1jlMY
	k7A/rEQWPqQh0ed4GOLqeNQ9eX/bAqGCkW7s6RHw4mfI0lbPLRIHL/d0Xh7txppruOEXVcuHpXs
	AtNCH5ON//QeNarr5de602vgU9JI6P71gobGuJYiu4RiNelo3xbGnx44Md3hHG4eT3JOYSxASdd
	HZrmz6bPTvanH3Rw6HCzfb3Su/L+Om+Pejbl21Z2+SQgHI1MuVBnZof6XIMHk0rYQQNK8s9rl91
	nLDqa4JNwT/S+Lx4G/vvdV3+i3rpZee1icSc=
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880860a91.26.1792564804613;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880851a91.26.1792564804142;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:40:03 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:09:43 +0530
Subject: [PATCH net-next v3 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
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
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-1-cedd1f681102@oss.qualcomm.com>
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
In-Reply-To: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=2584;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=+H88cOWbCsr1Tojb6ZNHvvkjVXxKmA9tV/JYivC1jLI=;
 b=jvqnU06bPNXWGokvta/iNg5fJLjcazoX8uHlm/aUb/z/8bSBNChDA7YL3K1sf7iMBoDvfgFk4
 V3alficaPAhDo9Al8/f3faCfBrepXb06z+NeHUJUwuRMx7KtAcwJSqO
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXz3cXlhvgyQ37
 GUPG63vitQqbEQTE/xNJC4tQzdsfHHmA4uXOxHSJm0DX20SJ38u8G1MZoJUbh8EUmzmr/yCybxM
 mxP+2NEeIXrTnnJLtxCJ4A9MOsCQIP8LR85SRH+xZWm0GlH+K0Dku47xaQxY791+WoeE6GYWUm8
 Jf8eErA/GQgehipu6zc4i+0aWjaRxjL+BFZ1YxknTD4DUMkyVKFURwe1X/6+tPIIo5AmafsjEWF
 MBrt9KQdLxYQDslOPpZOlc2Hv2feARkSJ/s1mZ/lfnImRvJk0aOnSYp9BF47Pv9p4/U+VooaQ0o
 6zTp2TN+Cu6PmOWhZSDhfFGJdFqUzCGi1C0UM44bQxUISv1r/hAYl0EDpWxca9R4VwXvJcZRfV2
 GJ3eRDXcaitTSgIHAc/5rRNmW2Ho8AeKl5xNFg5ZeLUEuET6ZJbpuzeLGC4PZlr3V7Yjq7F90Lo
 JO4tUtfZDi8FVWEObyg==
X-Proofpoint-GUID: b27tGW596HCcqG6cU4pK_uL51S-s6UKW
X-Proofpoint-ORIG-GUID: b27tGW596HCcqG6cU4pK_uL51S-s6UKW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXwOLxAKKONJrs
 KC9eSEy8FA2jHomAxNoXSBum47T2M6wexikApq2fb8noVNWMggMSc8b/Cnm2ZY0zoq0vJ9QUu6D
 MzZW2wvrBC1zdQbmUZjK1ChRO7gWlr4=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad85e45 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

