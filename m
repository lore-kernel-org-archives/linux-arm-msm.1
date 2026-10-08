Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249464BD346
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471119; cv=none; b=K19d9eS8cUydp1XxmDeAVgnEIFZW0sECssusatkwZQiu5F/CVDc5zLJ15u+XTLL6e2VFagjpy8do7cBAUgP7uWSTBQTU9TciczkLNk60vNS46AemmGDs6mnGnc9EOTWoqOHbR7rc0pUdbMq6hbEl6vqrxXVEUHdU7syKpGb+dQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471119; c=relaxed/simple;
	bh=4ejXIHXllm/OX7toaawMvjc9fLMF06Wvz+3UPeI3Nfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fC/MBnxyRpJzJONWQL4Ntr6wqCW2XAVxR4i6jNgSTsRAckXXLCv4h8LGNMbjzhSUAyc87wurqIqFLqJwXQFwrqe8HFsar7jfDcK88dessSfb6RqRAGhcO0rXzuVS9asWdyBA3MJBVWzyCrUzo1ut210sJgT9+VvDTzy3Wjt2ffw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+trr0U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQKNfogD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+trr0U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQKNfogD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVI8U2299432
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 14:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=; b=d+trr0U48J1ceIBI
	sbH/u7BnmaaXMuyqqnIrEtMudn/2iGiqQlxC8DRPlrWBq13xIvaTkXAeIgJQyyjd
	mO/eixiI7lmRCM3Axvs8Pn7VjHU/GxCa1pbPPnuClAIGr+HJr+b8ISTXLyY7QNw8
	6xqhMWJQMuHpfFjl6xhbgJ4gWYroCw6REJKsFFra33zpuiqSMjkw5vDzC1Ls+HlO
	D8FY/QfQpI8Ya6BHUjIbhcg1XE3SA/jV3Ns3t1n1TYKhKUlAdyy7MYeX5zQdqTkE
	7u9PhHDXLo0DmnLnYjVz4KYgOdoRMumMvFvZ8hP8akG/VDse8iyF8XjdkOGATNXp
	vdkuUw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2ucq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:51:46 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-895241d7405so75861107b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471105; x=1792075905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=;
        b=CQKNfogDOT0+8vgTXK7zlfikX5Is+Sf3zEJj8bEPlQnIqBN7/FOkVjEiwNN+243NKZ
         g6zBPEc88M09Rp4oml2ZNlHpH8cimLtocgVYWxxCff7w89E88RWrULsR9igh1EQpmzrA
         M62HeJcGUfymFQTqcPtWRz2PA7OsQFbA5KmZZQaCSdqxCKRX5ixRn3dbZX487e2VRnvB
         pJtmeYy3A59GMUPganC/FAetYR0u9NW4bGeR7ErfgdJStIC9LLvdqkdXFLimSM/FKyJc
         DIKkz1hUIszIZGilvqezHZ5uSlgXqMnj/FQZAQa/eY08U6s65XZ95rNMBD5c7SR6oCK5
         s1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471105; x=1792075905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=;
        b=R851S80dYGXPmQxVatX7O0cEJQsTqaA5o109Tjp+lHhlSBjR5XWzmg3roK1qwbK0yO
         K1ciHWAEl/BgDfkAdJCs1TAxkRijLnogW1AgF+98cveQtXACmzfBuR6eYXpmppT07aWW
         HLJ3AFDLWZig0txhV3UPAamptq2v920oq1gQqHiBm6Vo+IRfBKZnSBicDzuQzGioK0Xq
         X+eZSX2ASJlKpnrlhYsYFmuQKC+ugpyavrybVuuAMbesJLtOVZF9fv4wgi3Y6tZpMZ/4
         39EH7NUBEPK6mNAf6KzYX6S3eQgU+a5G0CP4/SkQSjfPWjeKlLgHcNSF6T4FcjKX4ohd
         FKfQ==
X-Forwarded-Encrypted: i=1; AKwUvByJb3G9q6ZFgE+W9reFk0m9zlC0Au8fs/d2DYWnZtV94skgkl16JxpQKgqjGd4Fxm8kVpVETpQvkIqDGM+L@vger.kernel.org
X-Gm-Message-State: AFq9FYKEuhwLLspp6AGyNcr9pGV5JZP7R4wfXFva5RbfcmhoXFUZkCLa
	GXyWkW2alh4Wc4uSV/AFHN+v9Xi2ogikGHVsAa2ztUJEOS6r+UkicUjLiF5zx+kcMhJJ/eo2CYh
	3y+D3a7U/jfgctEpmsxu8IzH4r0Di6EueSrwdjoY3K24h19obH9aRgUq1zYhcHK/XZA0I
X-Gm-Gg: AYBFou2KKGBOrBkK5WNdcMWfy/IpgSPHS9ydzJPFtrDEi/23PghsMsUXYaitbJIWJaU
	+3Ud76gL3nPrtBlHai1yObpLORVl+2Oeu9f+o1+CobISKKxyu998bb2M7yoqlOuftQgl5wZsI/N
	MYg6ouIw8EtVo80rEERMd869pQGLPUo5jkp74oMaMtTKn4UukZd0YOGqKJ63rcWomnhXMrjsnTB
	iLabdSprCJnxwCGpUKJTheU4U07a+sXOi6rQ+KjsDy/0PuJgst8WpAPI2ZzU+56FUMyZrCWAmkW
	fYL8klfItdjV0hS1/IL5pJySTZzswcn0CQPNLU7KVHJPeUUvhGGkowwy/KhHolZSQ5iJPvvmaIx
	U1OixcOG1BLgAtcXRcg0AWakLAQoWofAr3GjtzTb4OHc=
X-Received: by 2002:a05:690c:4902:b0:866:7724:3bcd with SMTP id 00721157ae682-8b05b01cd14mr39157417b3.16.1791471105001;
        Thu, 08 Oct 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:690c:4902:b0:866:7724:3bcd with SMTP id 00721157ae682-8b05b01cd14mr39157097b3.16.1791471104208;
        Thu, 08 Oct 2026 07:51:44 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:43 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:35 -0700
Subject: [PATCH net-next 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=5017;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=4ejXIHXllm/OX7toaawMvjc9fLMF06Wvz+3UPeI3Nfs=;
 b=L1EmTXZqUYIEviKnSUJ5xS6ppzQFL+i8pPyCv4ceiHPry+wkpyFsjyroR8d4yQHm0JMNe8Ls0
 B0+V2ALB2R2DMPhBFO74PZ5az02oFHCSix/DSKQjPlWanVZJIfaCfrH
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX76uyBF4QXqVR
 zramIIb4/JCr+Qyv5wlET5GmNuKIz/7qsWubufPHZJYA8XUWMNUd34Y8tQUXELYW5wRHQ1zdONl
 B51ANZSuKFASydsM9NNLEtf3jXSCqDQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX7ls1Etg3GzEM
 +LqISOHOe8h7zVcVCPBmTMR3uM5bv2FhFTUO7Tl62zyPubz9zer1HVwlmzmAoHp6HTOX+tXBzIN
 k6VmRXBc/6EVWbhTHKn9Iq91dGkFa6BxF+JypmkrdlfQFlMUSSkEOKCTQDuCoRz6ca7Q1M5I+Up
 dnyzDPEXYw8zu+dzvEnXlfvb1nfz3JW2eUrHXeO7mqfPlhi0lPiTRrPy1qcw4Wvg/62jmuWPL7/
 mDbbrnWgXNP/Vm/Nlhk/VuYeQ6HKSh/i5gU4WS5q1ga4b7C1ag7q+4uTVzf3BkQbO1AfvA7CjAs
 JhFao9i+gVC91ZJVU79NrFmn55fPZSbpw4q8isXz6v38wVzC35veJiJCXkMTqERm1tKPvCJXR6B
 GApxCag11Q0mMnc6fgYMLG8mjeKaB10aipbOW8mX/DYaQ3GT+1fd7wert4TGeC5OqzIEYGo8JDn
 uuE/ZrzsevF5WuKW4Mw==
X-Proofpoint-ORIG-GUID: CoQn8VclJVgf53I5lDbyBKgxyxt_ERzE
X-Proofpoint-GUID: CoQn8VclJVgf53I5lDbyBKgxyxt_ERzE
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac7ae02 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=88jBO_RzNVI78HEcs5sA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

IPQ5424 integrates the same PPE switch core as IPQ9574, but requires a
different, smaller set of interconnect paths, and has only 3 front panel
ports plus the EDMA FIFO interface, without the EIP FIFO.

Add the IPQ5424 compatible, describe the interconnect paths of each SoC,
and limit the Ethernet ports of IPQ5424 to ports 1-3.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 87 +++++++++++++++++-----
 1 file changed, 70 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index c899f4b56945..e5d218fc5d82 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -74,9 +74,14 @@ description: |
     +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
      (clock) +-------------------------------------+ +-------+ +-------+
 
+  The IPQ5424 PPE reuses the same switch core, but wires up only 3
+  front panel ports (GMAC0-2) and the single EDMA FIFO interface; it
+  has no EIP FIFO and no ports 4-6.
+
 properties:
   compatible:
     enum:
+      - qcom,ipq5424-ppe
       - qcom,ipq9574-ppe
 
   reg:
@@ -105,24 +110,16 @@ properties:
     description: PPE switch miscellaneous interrupt
 
   interconnects:
-    items:
-      - description: Bus interconnect path leading to PPE switch core function
-      - description: Bus interconnect path leading to PPE register access
-      - description: Bus interconnect path leading to QoS generation
-      - description: Bus interconnect path leading to timeout reference
-      - description: Bus interconnect path leading to NSS NOC from memory NOC
-      - description: Bus interconnect path leading to memory NOC from NSS NOC
-      - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
+    minItems: 5
+    maxItems: 7
+    description:
+      The number of interconnect paths depends on compatible, 5 paths for
+      qcom,ipq5424-ppe and 7 paths for qcom,ipq9574-ppe, enumerated in the
+      allOf conditionals below.
 
   interconnect-names:
-    items:
-      - const: ppe
-      - const: ppe_cfg
-      - const: qos_gen
-      - const: timeout_ref
-      - const: nssnoc_memnoc
-      - const: memnoc_nssnoc
-      - const: memnoc_nssnoc_1
+    minItems: 5
+    maxItems: 7
 
   ethernet-dma:
     type: object
@@ -182,7 +179,7 @@ properties:
 
   ethernet-ports:
     patternProperties:
-      "^ethernet-port@[1-6]+$":
+      "^ethernet-port@[1-6]$":
         type: object
         unevaluatedProperties: false
         $ref: ethernet-switch-port.yaml#
@@ -236,6 +233,62 @@ required:
 
 allOf:
   - $ref: ethernet-switch.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9574-ppe
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: Bus interconnect path leading to PPE switch core function
+            - description: Bus interconnect path leading to PPE register access
+            - description: Bus interconnect path leading to QoS generation
+            - description: Bus interconnect path leading to timeout reference
+            - description: Bus interconnect path leading to NSS NOC from memory NOC
+            - description: Bus interconnect path leading to memory NOC from NSS NOC
+            - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
+
+        interconnect-names:
+          items:
+            - const: ppe
+            - const: ppe_cfg
+            - const: qos_gen
+            - const: timeout_ref
+            - const: nssnoc_memnoc
+            - const: memnoc_nssnoc
+            - const: memnoc_nssnoc_1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5424-ppe
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: Bus interconnect path leading to PPE switch core function
+            - description: Bus interconnect path leading to PPE register access
+            - description: Bus interconnect path leading to CE AXI
+            - description: Bus interconnect path leading to CE APB
+            - description: Bus interconnect path leading to NSS CSR access
+
+        interconnect-names:
+          items:
+            - const: ppe
+            - const: ppe_cfg
+            - const: nssnoc_ce_axi
+            - const: nssnoc_ce_apb
+            - const: nssnoc_nss_csr
+
+        ethernet-ports:
+          patternProperties:
+            "^ethernet-port@[1-3]$":
+              properties:
+                reg:
+                  maximum: 3
+            "^ethernet-port@[4-6]$": false
 
 unevaluatedProperties: false
 

-- 
2.43.0

