Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C8C381E86
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723789; cv=none; b=grNfmvZd2I0Ki1zMRY4CCnVfSLIvZ20wbuCOmVHTWwG518AvpGCxyyNdtZs7wuQsrPIIl9qlA3Lj/tw7kNX7OgcQOkCUBInXTVFs7/ID/TSmvpD5svMEhzJHVogCZlyXdCVkZ7/wSeYhMMk1iFJk+G1V4qPlqj+AbxlEUpPObjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723789; c=relaxed/simple;
	bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiiDoRs85Axy9xmcDcgktNg8hVq8ngjwVD/5Rm0ryILPvvwdN+kLda+ED2Y1G8Y6FhE0LvKPJxLANgg5de9ybJxJmaJRMDNDuGhEZPRscuSTRQeHzCcy4mq1rMxURDVhpbcDOSTrt8KDOYdLfD6M9CtEZGXaI9xytAin4OmPbqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBARF+Oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O4l0IMBt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBARF+Oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O4l0IMBt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85nLN3983614
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=; b=EBARF+OohtdkvH0/
	6FVcC8J4B/B6H+NIsAKPT9+weH7K4LEyuetgi2X7HhD9NMMHCzY+2EC29drkyeAh
	slmmcmKnuwwIH8Nkcqr4tCWtLH8F3m5UpOxL62HdaS6JBE7wmCME6PeKzbaM2tIn
	oHDhyBk73BIStOLAPudliSfiTx+5m/t+BP2hE2VyiPo4FIl9bTPrPvgy4MeghuuO
	4u+3TLsG+ZtZQKia39ozN91n8Ikt81dtBmck8/W2p3FXZDqRx4sGdwU3WNSpi3gx
	EqbCR6C6bn5t37e5dHPrLsI1Yoa1YWI3IU7PXIPsndkERlDCYYLBJLYcMcWW0QvR
	0IEsHA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7casb6bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 13:03:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-358856e5105so6355499eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723785; x=1792328585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=O4l0IMBtn+lpGLxvaPYDFWtzj6BeY4otHcEmf8K9CW5obCN/QevwqqzSX/K0y8tO/+
         dJyyEgAZeWO1XgSATgBA0oPrRZg+0ygg4hyKhsO1k7NzWNi1fDLLkGf3wvvmGHZRgHzH
         OTQhrBAY1w3nEIwTcFHDKd4Jieem4tmwKpvi0ha8XFU39NDKolPFV8XywqVVmze9ZLQV
         7LrsF8JrBbipjeT6ohKpHQTc4hg7gQA5WoOuitz5O7OEU0D5owTXt/egKJ+GXze78HLW
         kToL3I3t5e2iglHedUMyP99332dmMuQfBeb/Nc/6HoyQlMxT7XQKaRXTMcW9M/IzmBsV
         WSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723785; x=1792328585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=v/RADtG72V6lbaScEQmm9usu36n77wHvO/ZTOTZm+6QRtW115kU/BGiKrwKRDznT0M
         mvwjvJZD8ktzzXx+1asDeltUJXU2lUuNmPfFZCvv6rezPYYjIzBnr+6oMH1SjJQnpb3T
         OZ9PlIuNGNKfFq4VNtpcUNoYM2jyKCvjSYUsm8jR+CxZarTmwBRxHvWM+07Nfb/PjnlY
         K2cc+rgJ9EnvCnWIPRRWEHuzVgk7a5qI3YQ6yfQdypm7XrwBrvyr7Kid1kxWPKMINuKL
         rAUeb3ffch7Ex8HsYg+iFMLo0fCg8zI5e2Dkko5pshQKwPa6dmw9ebZHk57/S2usqcaM
         s8XQ==
X-Forwarded-Encrypted: i=1; AKwUvByl6v/Lu9s4KdulI92p+//Ss98tCw10rqPIokS8YXHuLEZqlCCQg8iex4wRRP4Q8l8vz7enAkyNaDw/62Mm@vger.kernel.org
X-Gm-Message-State: AFq9FYLCTrb7iam2gfmVx7MJ+crv6ek4A5nlNTV/1AqMges0wBKqdhKx
	Ryx75mqFlVXhwqHIOwEsn5fDvMdRwq61/ROsqL4/DfRGsXTCS5tmdUGtIL+OschT3OPsHa/8OZi
	ueuETjtrF8Z/RqaIAFfhv1KizOSNxAvapyq//QHbEuTnBTL4AZJCGfVt+DBjGY0h4X96F
X-Gm-Gg: AYBFou2hML747d2d7ZYvF2PiiYfSDSN7rXc9a7840s9W8LzZgNlUWQ/UgKoXrt0yNWb
	ijZ7dSPtJ8X0hjiC1bOfaW/7If3FFClwG2J8Z/clP+6AxA1msnJii5f44uyC87oxBy5iEoARJf9
	XbbxkFJUqmruj638gtDP13pm0KBxen9EHkExV4SQpmtl4WNqraltQUpsi0AO4ScSln5U5rAY1Qb
	vIaN9rqZeI5JKt+xZYbDt0ahvg+ocldCIFscHJvP3WFgEOtYCaUY470b/bPS75Qx+Sf7hUYK2W8
	vV2f6uf3WZAEJ9BfGJ2YDQLdVRGL9faonlZ6ncr1vBDu/1zdsUS89dvCzKRv1k0fJEDeqcJ0miO
	JjbpnGtDVbu9iC9tzRYZ0YAS2xULIlfTSPm7APJj1z0g=
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273176eec.9.1791723785149;
        Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273127eec.9.1791723784477;
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:07 -0700
Subject: [PATCH net-next v2 01/11] dt-bindings: net: qcom,ipq9574-ppe:
 Split EDMA reset into sys and apb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-1-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=2245;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
 b=6b5djGaOjwahzdPW9P/w6Kwygh/n+EiZYc1i1zSI2qquUhZSTrt9L/g7M0Yv0ClR7iRM+2n1j
 ZE9bX+nsMEoBnnGeXHyw+xqbJYGk8xayaD80qXg8Y4l/PavFFajj33u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX+IQJjvIHktmC
 JOvYD6qEbV5Xv0brW4JcOW/K4t56uFZXCn9HkbyvRf1fHim37KHcaaP5LwayLXpIZ/OC9x8iCqT
 2o9LOCwVebZmyPmjdngQg4ot9X5N24c=
X-Proofpoint-ORIG-GUID: U--uRm-4ZGOw0iFfv0Mfnq1IF9_K3BbR
X-Proofpoint-GUID: U--uRm-4ZGOw0iFfv0Mfnq1IF9_K3BbR
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6acb890a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0cszTrF_nvGlpc-19gIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX6WUL7vozgzfM
 DKnunyAXWQDDOfdhrdye9AXz3hewrKXundGlXqnd5+XITz8hZEvPIYjWCTe7JdgLGANvo+kJi4v
 JX5GkzOCqKa5IB5xXK9LfxVzyjUkxPHdm7Clnp4INc1uCaopoY6daMIEP/lUWDUX/t+Og4gWPqo
 hxOCnZmZvMgWMx0uUNQ+llV0rGghT55MkR676kdTQJS1HZcvRhgwJMLDhZVx8pVFqQnZuGZDiNe
 1SNOnOyjPtsFW8iJkBxDJzxJMrLZsysoU4wzUILB8U5Y2gS91V0GY32iLZICsX+fZhtXI2PoGn3
 qNG+y+r7iCUxVNlYIOWaJIy7HO82oCXbFaufUl+kACd9ryrc38KAHASFH6+LHXRRCrLD2FfkTZw
 rgo6mZW/qD5KVFfeQT8Ewt0tvz2rImmnOgychZV7QbQiIBZq+GZpDu4rIxCi8Ujv5RTU8yOEJvT
 +6ChEnmwz3gUetT20Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110051

The EDMA reset is described in the binding as a single reset, but the
hardware has two separate EDMA resets, the system reset and the APB reset.
The reset used in the example is a combined reset that covers both of them.

Describe the EDMA resets as two separate entries named "sys" and "apb", in
the same way as the EDMA clocks, and update the example accordingly.

The EDMA driver has not been merged upstream yet, and no in-tree device
tree uses the ethernet-dma node, so there is no existing user of this
binding and it is safe to update it without breaking the ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml        | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index 6d0b21a10732..c899f4b56945 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -144,8 +144,14 @@ properties:
           - const: apb
 
       resets:
-        maxItems: 1
-        description: EDMA reset
+        items:
+          - description: EDMA system reset
+          - description: EDMA APB reset
+
+      reset-names:
+        items:
+          - const: sys
+          - const: apb
 
       interrupts:
         minItems: 65
@@ -170,6 +176,7 @@ properties:
       - clocks
       - clock-names
       - resets
+      - reset-names
       - interrupts
       - interrupt-names
 
@@ -273,7 +280,10 @@ examples:
                      <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
             clock-names = "sys",
                           "apb";
-            resets = <&nsscc EDMA_HW_RESET>;
+            resets = <&nsscc PPE_EDMA_ARES>,
+                     <&nsscc PPE_EDMA_CFG_ARES>;
+            reset-names = "sys",
+                          "apb";
             interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.43.0

