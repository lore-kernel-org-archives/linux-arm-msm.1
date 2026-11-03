Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715558;
	b=V7EVU4uds/i4hIt7Vjkpa2lTca6ThEmyv0NUEKZXNd3fz0Nw1Ntp2BrpIDp0uUENPvJe
	 do0unqE304CIUPVM9Ikf3FyeMu59B4NyRNhHXUTGRaMBPLq94yh/7iZivYfDgYL+GrEyl
	 1Dshr0Xl9qXHZeeFN7DHHZJonz7mPXc3J05RiOwy2cS8v4ZLnWmvojsIlcWNRpKH0arqR
	 uMFkDRVzvhr1dnZWzswKZav+C3D0KOYhy/DrGIJZV2vIgztAAdEisc7QZAsLS7mlQiEIS
	 SkY/M5bnHNNGMybKiHQtO2bEkFmS3DXsXkawnZTJVKjYLmwkiIpZWV+hRsjoq1Gawww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=zhLI4+fIvhraZ8PSL6Zt0n2RfJtw0zlDJm4gjAKEe39DrVb+lGoXeQejCBiphuOUGdz7
	 rwz01PYjCzHHFuFFMWlFzHeZ0s+Oq2xarXgkZR/KaikiGrXkDiK5SumNGWWlQ3VMomv4e
	 QwttXK69XvrjUXIrp/3p21Ad2gwyVTF+9Papk5eT7eNppn3A+ReMUekq1w1o+mlfxsfRm
	 JYfHeV49TQmF/w28PZUI2gKCDPiWrw4ryStEOGtviA0Bzb1mgs6MKm0Q9JAD2PTpoBq0s
	 6lYKKS9j5oNvjlZuY8ioUdZ6BhHMrC1qVP7OokgRGVi2ChSbYbwJNJukf/2+F9JffsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA9606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FA9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9uIc3657415
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=Brrp6+A8H+6CMoCP
	eHdD3BxF2jybKqgoZG2kv+4hitRr+IDBgkq4lr4oe3iTF9AcMGXb+0mbaoG4C7nl
	z/xcLyrrJEcVgXsx8RXrie/W5/lmGGDzTOuRmoA9tWHDLKdTbR0eiZ7meCM4bIxs
	EkhoPadVyHLm2Mz+/LgPRY71LaLcdne61Ey2bUFqJ3kaku2RnCiI/ZIu9d3YCoWD
	uRxB0fYdjS5+DSmnuVfE/9SOeMRUT54Me1VKLJ5kbDkzz27RzbsimCCApWoiKe/v
	kfskcF2Mk8xqkHHwYDPABLzPgmRWDIkenp7247C4CCG5g6q60jYmpoFpZ5ryqr4V
	vL8/Bg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ct409-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:19:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so3203884b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715550; x=1794320350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=QywyPK8epgqlb2xJsdwfGcifqzllIX0wp7YYus0IXswuk81TVSGIUmfbD9TepwSZQe
         HcDHbfXWeg5Z4ucG3vTGQrTOrCbf0IFL5asj5qZ1Dmz0wKcACPU7opiq2bo9OWYr+mrs
         T4t9xCchJct0zvg2kzPTzVlNpGVA7/ahBfdn2+3aqiU6FIhNbE9VWxfO48HfDaClkudI
         tNCS3a9LTxGPuZCa1/YUqBDirYe6+nSjY/mSM7mZt/AoyTSq+k2snj5vpH2goWn3pEfL
         iOZhEKAtVS9/1EtCMliCQTSsgOZV3S/6wudlwIelxULYgAYDWSaO4gdm8Z9aJk6JAint
         ccGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715550; x=1794320350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=vQ0ABxjHF29BhNr2o1c97c400z1pkwG6Ilfss0aNZVbf/X9Rfgz+SXWu483P8N0mBw
         At+vqhTrlC1052YMlrRxJ8/wodTtPbSHFxzQwKf5ScCINcAxdtu9TtcU6C+7IxRZV6rm
         w63V8qVA0FTU4394eb7GREP2ZyY56lfjwuh6T9i2IjllN7r5jaMuGYUqd9CiAwnVrdkW
         SDDhORj4B9oBqNC/t23qBD0RW87jRo2k6Mz/Jd6LJpFhiFF3RvZtdp5pnWzF7q3VvbB8
         RPNpbXPx4nmehQkGAlD6nMIHn2cVSQMyAVmkWiuZ1oqWFRmZApYp24SdLVIt0UXDJ/Y4
         aeiw==
X-Gm-Message-State: APuU4Z/H+OQsrlKpY4XeD3pZk8D33cq1jbWPS0jDVj846jC7DheHPROT
	h+Mn5TtFBhQYzoTeC3lPnGncrWq529UKurmO5DTcog3edadV47yIvANfR551WHoD818wBaihwxh
	kQ6LFGUsNmlLtKCaRYQpYau+dyaV0FFUipee57mVdJgw2LbMamu7LxTlhelnL6HC1c+mH
X-Gm-Gg: AYBFou1OyCaeBwYuFxN2Jak4g08BteFLTm14ZjMiaZXOSSCT8tA7YsrrwozEx3N6g6o
	xfgBnSpmGafap5qbp/MmFGR6FzHD4TlfZ6hnwVPR98nO2wYLql70asNaE5T81ERw/ytl8iLw6xz
	lx6Hs+xiVh9IyEaFVpTX+2gfxpLltPMe9/Xvi/Q+dRldJ6cTavl3Hczml6PnmNmxWZ2Wlw7lW5/
	v3yQ1O/iCbJ4bd2E9+CU+IE6s/gshJwtSevl0C1cOlX+fhms9NaLS1tjaFNI03P8VbTPrge9cCr
	E3LWIR/x/UWxegvPK5DE9in4b4FPhT2L5ILxMKtk6/rvp79rwXtls6mWanCK1BThAZpxOuGayRT
	0lBY9/Ix2tmMHeZbMBPwbJrBtWEc7nmmjPax33VBg2v1nehyhhowCjLY9ChLd08s+pTJY6hTomZ
	yj5HvaTo06
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710239637.37.1793715550176;
        Tue, 03 Nov 2026 06:19:10 -0800 (PST)
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710224637.37.1793715549697;
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36468be4sm1442126a12.12.2026.11.03.06.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 19:48:41 +0530
Subject: [PATCH net-next v4 1/2] dt-bindings: net: qcom,bam-dmux: Add
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
Message-Id: <20261103-qcom-bam-dmux-vmid-ext-v4-1-3690cc5ca0fd@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715537; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=4i8kfHwG77skvWIuzZ94uNVY0TqxEDO10gVtsBd/DjUH1uid7Ce4wpe8wQUTWyCJBW80Ibbl0
 AVcOPRXn5PrCFq4ooInnK0vqBPnomE3i5UvnIDa3Jzy9S4VEuLbZkYx
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9ed5f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: s55Sew37BHmk_b1TQfYfU81x7UE3FWlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX+CH8JfvYbuMs
 S1yjoKnsDwSMmzHw8wrqHSyvGEOH05a75F08Pw4uEVVPfYd5277zGiTkH7hpS/IZCOGDBR4P8Tj
 ipTtnq2roXxBH+QGq3SvpvFw6Yt2mxQ+RtxyWQP35iFXU2OOZoE8TL2B5KIzL7414rQG6HyiScK
 A6a0V9SjXXcJyHW35I1GIsYAdqR/FGywJPGb7Pzd3x4oxrI0RMFftDE6cGi95ExjN9Ti/SasElZ
 zPYUlD2uZqxb1RErxI+8538+rGk3tqiQMhBTB9KOqIKoYUWEwAvhU3oT8CrE2BtzfvlQJGQsqGT
 BVV0T/lFfKiADLa4N4+/3clJruA4YFHhBSwPvEdS3fzk/OaW9w3kH9837sFAonV1CS1yduq+1DE
 ctexZvAbxnoo/CdaU1v/E/m0q9WcWO541ZU7xn2uO6MZ8zqFzc0+n39N8cGMentQigRMDrl2nVB
 5pGcill83BGy9c3mmdg==
X-Proofpoint-GUID: s55Sew37BHmk_b1TQfYfU81x7UE3FWlV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX+hO5KDDU0nEN
 OvoTfA3Oh726fAklZpxP6bgg0TaIcpYmvFLHQwx6Mxm50ezka37PMxg9lEnFmNuktgwxAFDM2XL
 vDKRt8aRWhBflNm16jSHD8iGAtanI8s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030056

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

