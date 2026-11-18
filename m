Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016262;
	b=DWMRO9admohAvT0pudWUZ8Cv0D6ebjA9uEzXcwhs4od2Tq3PLFyNGxg6wpiXMa/0mz3L
	 kfCNZ0sZC0zSAzcC7CkkMBno8s+Q9cM8/uEbuS8WWZo+obieqQ3kkFnTkUFlJZBWc3LCa
	 mjhUydojslqZoBeasZzQGkTUQMqCBnkRSbL8Ev6yqYlCNVLZIl1XyIS9LOp2bP/MwJSS0
	 is47VqlA/w7xAJEby6ZXIpnSQJTS26151PpFN8TGHu0v7mQnFISrUAG+/YA+swvhVNJxa
	 qQKEde79C9DcpwugAe13fHPLLN/SZq2m/2RKMIxDRfb+dpvN76+u7qvAI849Y5d28QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
	b=hNQA0H0PaOD6Za/gLDfWavvsvMlPMxp5c8fKIUSzXyniNvZmYDppa8KrC+utDeS6qLmd
	 W6anH99Jxibi4z1WRaOGYf2MM53i/2ZmRLtS+MB1OHYscLA8yXEo7DzdyEVaJszkgt2QM
	 zFLw7xsE/baUpK/dA0ut+BBlD6u93kXvU5vm9W74kEgn0nlxXqaFs87QlG1Psn5zlJXJy
	 sCudUZyJaDOJ6c1BK7hSnVvXzsawe5vRk/XHLKkGwIx/jiQcfVOAR8O7pnu9+8VgK17ws
	 gkucQ4H7WxeVLSUbtoWY+JsVhaP3wDkrItFTPFX7lzzxhx4sZzQFjq5PX8qTwgqXh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A0460A260B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A0460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KfRL8sS5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aZlTd3q4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ0bJ632594
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=; b=KfRL8sS5IZ+OjOs4
	TZHe0MV8TxPr68/KxQ9Fx8zNCRxxKK8GKf2DgLnpNWOK52KAYJAU6acCkOzxtA9E
	BrsKDIECMvChbaV4hAc8QTeqwrtOKIJMqEqLYoLfCOOfOTqe6uBQgTIkO8FjjPTC
	+/aheGUe5sOwpkdpCb4fgjI6yDQyeTwHhKSW4Z2g3iLTg1jH9pGjEQZJDYtEhxvc
	Tl4kKusuMc5hFOfn4g4M9Vcr/nNYBmsrIB6RHqDRKwri9HEK40cL8Evz6ihDhmpQ
	niFGfVIQsckzEjpUpgfIJwY3aQ5Nl1bxvLS+JmRLjxWw+VNdtnAcxkBpRwGTmOOA
	SrQ1vQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8upy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:37:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211d51dcefso9189136d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016261; x=1795621061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=aZlTd3q4poE2nf8TykIMnneScvQI9RRgwB1UUbg0IfHSEkAYwkfJFUQ63M2hzyuivm
         YkGwrpcevRF2vwJOuss74OVjtdhIrficlFGuYJ0r6mP9DM3WQO8SpiLbZTFR3+vJUtQv
         JJX2quXQIc2eCZjyHA9lkkE+WrnN9OG1AR1k0/XhKZj++/Kn2kcj5yB4lyb5+pWDOPnx
         rlZXx+TXVuYD/c+fJ2neSOCWGGxEpNo/ugsQPWgi2JnNuUfmNCOx4KRD3wJQBjShMy84
         gXBKJ6ITMAw0ahb3mOZ8ynwJMR7B8EGXW9YMDnsoX45lOoepS7EZVewKFjcFNybLtIFp
         WUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016261; x=1795621061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJkbB3FhXUMPR62keBUlYHp9EIPXtxtR7jVp2sBzSBc=;
        b=taKA1LN2ZRNflCCCUSgHo6vZ65FqO4xBiN+1f7prqBqH6H6jicorvWxL03DGfniMDU
         SpSf4Tkyw6U8N1BqXMUjnx8EJAWxFfvS8bTdIZ9vAVU7A3sQD/uMN0EFUxfB3sMwqBgW
         ZkiQ3O5IzAhe3vErhemFFK0DGaxrhjkRA4gYk5HOKBrpKSxT0iahW3ZkeTJQgmQmDBni
         pG4XdXZckoNcG/uS/N3atYvA2qxCULQG1qOlfYzlkLSMbka8g5PDJsorgzqdWXrZfNox
         6bpkT2WFYHtG4pCnGQedvEAuK5IDSMi0nqt9wOyuyM4RV5L+ZpqhBtS1624PQJ2sy+60
         cA6g==
X-Gm-Message-State: APuU4Z/hdaWy3q4flf+Lr4sG+dhWRZA5KvwACLqzIYs7o5dLo9BcPuNx
	tm9Zpqtca+ef+DtiyJSjhe4yjFStHMZWctO6zhbOAys7KVDBmDW/6jeRX0MwdS39iRHsibEPaoq
	jhl1u7Xh/R1bRp2slrionDOj5BtK3H3I7HUvMLZSSxi8Opgu10LisxPvwq1XTFH72vkkq
X-Gm-Gg: AZFdTZc0IN3grigS8BjXcFANJEZCEhuFf8V7MCFinXlZ5MofzbtGYpQmGWzhLbElpXC
	B+3dywQsLEfS7zRkQ9stZMY3tq1beiGAS3Q1UMFRdpgkywqZ61nie8VTtxadnu6Ez0yXCezll0Q
	rpo5q+QfarTxPNQGpCI5V3Bw7SNNZq09qmvfatX1wXH4bl8IJC+Ax+09P5XK/wnqASOttQLxCgz
	pNGrfTB40WUQvrx+PHrOm5Wgi5OalYRnnlbvd02ych4VZ5s/NxbrhKjguCkggDql3vjHAU5xbvL
	7EfR0H6zz1UPQWShLpqja3oBue3vcap0uglFiFl47W0YP7IH4nBnVoTaR7HBHyGYNz45X2S02PC
	hrHc4Hsb+NHBgsIBFkT3m5Zot0LKPW48+hiYLvKSvbRKK1jlhU5ttRnszLc/7xg3iyurVEMYzXd
	UxizluBpYk8DR/itv2ohVRBLJr54YvDcXMc2U2oO6Hx1AuBK8ldmWqAhOJFW9P
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46836016d6.33.1795016260307;
        Wed, 18 Nov 2026 07:37:40 -0800 (PST)
X-Received: by 2002:a05:6214:29cb:b0:91e:cb6c:a50f with SMTP id 6a1803df08f44-92114f234cemr46835356d6.33.1795016259652;
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:39 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:42 +0530
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
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
Message-Id: <20261118-oob-support-glymur-v3-1-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=5948;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=cZMcIPHFZ84uL85xAk/uCt5uCJGvCEH/OmSxr9GzoNU=;
 b=rpUnAsQDGdDWgUfoQhaEw7chvjRaMPTlVNVQZe/K3/j1O7XhBeN3ijwnKIwc34Vkq76uoL9uc
 ru7JEgomn4qCTX/OT8Rb8eauV4/HF/Sb2cD7KTH2P03viI1STVApc9Z
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdc645 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PECRw3tLk34I9mwI6-AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: plr5whpZX66ysD69OjF29slSy0TFRS3C
X-Proofpoint-ORIG-GUID: plr5whpZX66ysD69OjF29slSy0TFRS3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX9qsJY4VOcTyV
 VwtcfQp8cx588gH3fIHmU4eVoWeTuylkM1njqSxCZAjsNW1k9G+/rhSqnE1S6ayCjzJFCJIbdZd
 lcZOP2RRRBQJfaF45Oek1qOpuJ/sqg6m4yVioKKgkrDmq0+nZ1NWafjNxjrRbSGbCX9Bxf9iI9K
 X4nnlatkEQw4AmcNAXGsXLhoeksL0fRxf7WcTh9ZDH0wbYjkKaVm/glxGJmOMKDJxkGCXqs6+XR
 93YqmlGFanJGwR0QA9lhThp67oVja4uZavDN5wJeqW13YElR33NS8gmmmFwCPyy7SSPURf1fUhV
 QArXwjRBe2sv7H3SQCZT3nIYw0v3Z0ZgkzxH0QO0klDHYaVPo9v0z8gDFZ4FLwGCS8hNl35yU/t
 KFloI310Czw+oOgJC7weXcJvmjcLyB4O7e4zHncBsRf8g7xDD4AhwHN3s0pGgqwOtCx8Kb8rnah
 LucAJivncFGVs0UDPRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX8Kl3S/VtYEzD
 u9tqKzBGzFXzTVIpSBK2zkUijsDSy9z0Ok+L5p2OvlJ8gw/71itd2rKoD768JlQtUHNxEOehUyB
 9SZJcoEoNdPM/o3VnbobIfpmKyjDW+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180062

Document the Glymur OOBMSS PAS node with its secure GLink edge,
shared-memory signaling, firmware carveouts, and power resources.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
new file mode 100644
index 000000000000..3aa96d2262f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
+
+maintainers:
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description: |
+  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
+  processors running Zephyr, managed together as one remoteproc instance.
+  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
+  processor. The OOB-Non-Secure processor is an auxiliary processor that
+  depends on the primary processor and cannot function independently.
+
+  The primary processor runs the primary image, while the auxiliary
+  processor runs the secondary image. Each processor has its own DTB.
+  The two images and their DTBs have separate PAS identifiers for
+  authentication and dedicated reserved-memory carveouts.
+
+  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
+  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
+  boot, shutdown, handover and ping/pong signaling, as well as fatal error
+  notifications. The subsystem exposes a secure GLink edge to the host,
+  with doorbell interrupts provided by the Inter-Processor Communication
+  Controller (IPCC).
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-oobmss-pas
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+      - description: Pong interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+      - const: pong
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  memory-region:
+    items:
+      - description: Secure firmware carveout
+      - description: Secure device tree carveout
+      - description: Non-secure firmware carveout
+      - description: Non-secure device tree carveout
+
+  firmware-name:
+    items:
+      - description: Secure firmware
+      - description: Secure device tree firmware
+      - description: Non-secure firmware
+      - description: Non-secure device tree firmware
+
+  qcom,smem-states:
+    minItems: 2
+    description: States used by the AP to signal OOBMSS
+
+  qcom,smem-state-names:
+    minItems: 2
+    description: The names of the state bits used for SMP2P output
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - power-domain-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    remoteproc@1f000000 {
+        compatible = "qcom,glymur-oobmss-pas";
+        reg = <0x1f000000 0x30000>;
+
+        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "cx", "mx";
+
+        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
+                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
+        firmware-name = "qcom/glymur/oobmss_tee.mbn",
+                        "qcom/glymur/oobmss_qc_dtb.mbn",
+                        "qcom/glymur/oobmss_ns.mbn",
+                        "qcom/glymur/oobmss_oem_dtb.mbn";
+        qcom,smem-states = <&smp2p_oobmss_out 1>,
+                           <&smp2p_oobmss_out 8>;
+        qcom,smem-state-names = "stop", "ping";
+
+        glink-edge {
+            interrupts-extended = <&ipcc 56
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+            label = "oobmss";
+            qcom,remote-pid = <20>;
+        };
+
+    };

-- 
2.34.1

