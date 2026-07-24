Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7310C3B27DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879304; cv=none; b=cBmtpKAs4+NrSTuEXUaQBoslj/IGoPqI3pt09hYUTqzscpPeqp2Wg6Q20YKEvBRgvGEdUne6eVI02iQgEnzjbsGlIH0rCjDz2dQRNcpcx32P0kp74tqLt88d9fKcdKbeGW300J54gWpPTSBqZIkfm0Ck9Us64PqSW6mxO9QZdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879304; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZueKOEzbVvLf1S6mAeUDPl5GBcFngSjjAqv03E8qABylU8wH65mvrt4G+wkXiQBdHUMN9Pv/amisIB6RsO5qgSUp91hZz/EAB2mQx8kWitAJEHoLTMLaxMJVAkRgzJmehIhJMXriUCxuWpp7AvpC3/IXtIElQ4IC/nQrCv2nuKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPDv5Ihq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSq+IU1o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPDv5Ihq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSq+IU1o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lEon3139548
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=BPDv5IhqRz24VEPV
	Z8D6jAwAVmRHskvEeR/zbjVpWAQMrMnl3/Kkv8GctaRTnGvYHQ6dt8BYUULR1MoJ
	W07bj/3/zZIgIgptMdTzszxj5RpbOpOW1AR1bLrxRkNciJWTH/jPOYprT9Wv3q2g
	5xL1dLWxsLG07V1vqzH8Fm4BBlO9XMa59QASARgfSANvSaTa29eTnIlStzcAPROH
	DD54wOIEKRinSmXwz6KoUYA2RdZpPEmLJLGhH9UqXMuMXqFqUoQMkVJkTdPxlBmr
	0+cbuXDyzsLCAtYPEbjy81y+gAKFIy5XwdIpqqwDYSpAbzIzFc7PO4lWSqIZthyd
	5dllEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3eg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso1209081cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879300; x=1785484100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=RSq+IU1o6q6ydOcrtpn0eY0WB1B/DYKHW8MUWZieOiQQfCudhJYNtHUUJog6Q+NShy
         eklljUUHibhYVxAD03IV3WZqHE6dfs1O+An7Lb4j/4bsKkS6G96FYFRR+NfkUlW2iRbN
         VDVkFypLQ8jBWZxO/zKZL13g4G436qeQ47WYZ5cHazZpEF6BZUE3tsx6hl/xme34YYWp
         sEN2IHUopg3uSL3i4xkJ9xNey1EtGH+ZeoESDMh4fuBpu3NrxJFlW97bBs3H+dGqYcyM
         XoOr624BvdlLn3AmxHjepqF3lFMxZhewudqzkPCwzTgDIgrV1yqWBZ/Wk0Mj22BOQKRt
         rwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879300; x=1785484100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=onzkcoyUd/0M2wjfCd3kDcw5ik0xHFjy6seeGco7t19AoHAxgkFFUqc+C846pUlU25
         RWX8yVMjOQHWPKyLTmvIO0UNxij52V7iWZXlmVbmw3NvOALW5p9PX6YWRXhKx3j44KyU
         KeghKUabrvOEfWjSOFTKdctNL0qEjuogBqIsECUv7Vpb2v1CH99jnW6ZzWNwRBbtc2eX
         2R/l93pz50E2GWWwU6Dl768GS2gTluqQxAYG0No3DgoC9xG61TiVcFwBTMMGaybB/GU2
         Rj0tDYmE7h1me3qdE8OUx6+a56E89oywTRDQqYUtrHXV+534mwJm13CrABbYgIQY+0//
         SYmA==
X-Forwarded-Encrypted: i=1; AHgh+RrCCDwsxG5Gpbj9q6YMtZE1cjbt0t2kvQ8d2Fob1Lxhe+zYM8wbdgUrtIzA2kXyA0pxPf+aWAzuFFiKhVXV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/YGvWQQJC+jqzEmtoojttNxPsTqgU5rPyFEAPODvmEzOsoG2
	5qvFEfRgv5V8CRIOg81PnJKx9xClO6/VT+wtvpf1huOJrJWVy72GgCideNaPJN5svOu4MyoC0xF
	0bveXWdJoIjtRkQQhCeeWiEwcv346Hy98P+W2fioZsf3RBJ+Qa1JokmLXIWuxiwl76ugSgBgmOZ
	P8Chw=
X-Gm-Gg: AR+sD11pWjBfhjQX+j5cBcCQx0d7zVWyboNUTS+HvPnrHt1xI/Su0A2PNjn4FSrZuBW
	rvI23g048OLY8TelipUP0W8Otl0iFE9TKT5zvhQLyTNZ+A6AtV53xMsdpGpOfW2+BKQIsJM19pR
	nQKRiU/mj86WwFYirlKxKpE3g/XXfyXp44moXuBNBcpKog4fv78WoM4F8EZ7bTHM8Cr3whnpKkf
	hrdarA0uDx433m890fREyXg84zU/mITqXP8QpsbOItHw9IFl69bNHntn5Maa6UMuqKKGrMCNtaL
	2V1zfMKH2ks127zwKuhMJOfaI+ap8jR0tZbPWHjTtC/DYcjfXVYeU80jEEcbyuE5ACHbGuKuYBb
	0q52DanU06xNUlP4wmQDs+UJE3fWBEYFv+Ltor9Wu9N/PsJYCjQpU8kaLuBDThabLCnEv6GxcUU
	SH0BjC3uOSJ8I/OeB8h1KpIPZIpFZeeaHu+nGdtORuQWig9x4s+Q==
X-Received: by 2002:ac8:594f:0:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5283dfd4f37mr63032251cf.86.1784879300147;
        Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
X-Received: by 2002:ac8:594f:0:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5283dfd4f37mr63032151cf.86.1784879299708;
        Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:15 +0200
Subject: [PATCH v7 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-1-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX9JnY0g8Up1pq
 nMWc23qdt36HreHgiX8f3cWi/zqK1OsMF3no+VgMxuKtSNSunfmVUr6zLxBhVLvMeGsV+ZEUFik
 RiU4bHp+VMrlubFJtCCY4g7ihL1/i1vdqRAOEISSYqSBt0KbVx2LTSaVYcCIKA9rVW2hS9nLkph
 xiFQCdKDGZbGhTp3Bwx82pc7SVRfvP2HEs+RjDfMN9HsLL8m7EuiXn41ZYwf71bYGnedAJlfMXH
 Nrg+Ht0cLkB7UULd5snQgnqZrplvsXMJUWV80Jz3V66P0ZzgAbL4unCuZk9n27MQzjDSRUysfGZ
 uxQyW5wOij24nZIQwrN8yseIGYWBRTVh76HrVlNXsrPAMkgy+p6djsp185pLZCXmUvbLFGzTErX
 xytClZczDU0+I2STK/KhQZh3am2cXAN3QeDk5b0rBSOUZ0D3eYt+CT+SlZ2rA9nNpj4BhNj1vTV
 I904oz7HqOdztj7Mr3Q==
X-Proofpoint-ORIG-GUID: zxKy2cTMsM7jH4kzu2BdQ_k7R6JK9XpZ
X-Proofpoint-GUID: zxKy2cTMsM7jH4kzu2BdQ_k7R6JK9XpZ
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a6318c5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX8aClt59Fi55A
 qbVIz5aclPwQMBLRIhae1jU8mUHJKB1EXB/xHV9wIxMsMNTqrN2HjyPIux8kPzN4KkeCTqF31+m
 L6vm2jkUU+2tm/ZGO/XwHvJUiIeuOBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1

