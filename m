Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F9407CCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568579; cv=none; b=a+9tjvaSjeeNG8yofisbD6+tXdCTg2w4tn5B9KfzaTHwxwskjTsE3GGMXZogFRofHpv88bjeW+yYQ5AXq4J3pEaeM2C0FH1XodgdQFG1cRa3ZB/9E5tZGy8uiQhD/Dy9lJ/WadZ2Dvi1O5QWp/Do6xafHIgsdF4KAXIp9KeVyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568579; c=relaxed/simple;
	bh=rNneJT7obxjP1X1Bry3YcWYR3YdUEBRbf48fYw9g3dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHou87ptPTL4+ffOeJhnfbr3pAGX0/o+O+f6Bj/sx8D+dGhM+BTCveYBQFoVNsLXOYyBtApTOJ65kSX7Zda3DGCN71L5s9L7l5rdzp3/9xe6adsIZYC2VuiZLZvgUT7jKDCbETrB4Cpul/oxBhJASRRVTowy1/ZwjhE+4lTCN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdx2D6s0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Inc8Oscy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdx2D6s0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Inc8Oscy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O991B32448505
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=; b=gdx2D6s0AgHa5gpJ
	FHt2e9cLpJa1eT8hIKmdS+MDHfoMZIjr8CLDRpGio+Pd3Ll8PlAW0OyEoUHRiei+
	JCZ8/lockj8DVQLZJax+LF6fd8nX2FJ21LNKC6d4cK7IXTL+kAGIybN22q2ADahH
	GdpPj3X2NJAjJ48YogqCwHd5yC/yxqpykq176471Th71dvlAwjAsAi+Cgap5uIdt
	VrWODHROI+espcLui9/DtlLunliiiVr9yvHRTazucN0NV8RugL/f4hs9Zsa6sRI6
	wSQ03FoeaQenz/YW7GuEI0jUj8d3dFHrX3kGbqwYciQc3Yg+/T7JMJc8NGK6Lyvq
	qtijKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0pt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:49:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso3327668a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787568576; x=1788173376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=;
        b=Inc8OscyZgqBuTxhZXbM3wIZ7B9hq+lTs1nDvN3srXlH8IA8zmY1HY/QINZsfIVi0x
         2wtzyaurfyve1bIlW/AfpA/pU5V0osNl+iGXTLQ9grbvXfAX4IxnXfsp5hrghCNjaW3t
         LfQuvsD5qrA2ie5kWSwMIjLSVzaUt743rsX+KvCqqqM+2gXqBpb3JqKcWKw2/5ziJcbt
         OvJ9CET8nQfgIQC0KqvqcheNGAPg+ImYJpccNet2ETZaUUfZH9iM6OrzB+3hpYOiGlea
         GIf2lIlM1iI2OJxbKAS4DKjZtHPNkeVYhi80TYRat5mpFuAX6ZAV9G1lzC3SemLogk4m
         XQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787568576; x=1788173376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7WU/VM3Bj2X/8OfKuOyPEmSZ4TMRuASXVohpmslL+1w=;
        b=bS4ZMZIXNkI7q6RGSekcmHzcA0ETXnQMKCbq4D9Z5QvbW00AVZs0E1Hjzj3xXkzqPe
         F7LXSCD9LMKouHjV+9jyglzVMBa9KizXOa6ZioKcFGkZVL+pRK4vx94vxxglFqHN5rHW
         mEwSK2HLGJCy+BsyfOfZqsf8o3lx+VrI1vIyi6XSQfWsTi5RQIIgclIVzy+ttIqgMGEu
         kSa4WPCaYAr9f8E2/qyQ57gwaItltFZNydqRzK3YZjtJx/ckkAnaNZBhlIPDA4+WfHUR
         sw/R3zMUfaRUOZwXEq3k2EcckasFcAF1lJRTw2E4jA0uDf3CtSojaYkpKfzJ1iDgTilQ
         HiBQ==
X-Gm-Message-State: AFuF++krDRh+kl9umOyVRldJ/UEWj703EZMCHFBr3QlHDlfltFlPKell
	XtLT89LGWWJ1onyl+vmOgx8tztHLskvG/uaeADmgRrt52PrzRA0l2Uu+JkkR4CpuvXIkK9trq4v
	eEwO+tCNt/qOxv+OOR1diN3zms4LPOD1qE3asl8noyixYM+XzOZcBy6GtuieojE3h3qvc
X-Gm-Gg: AR+sD136DLtB9mLaZzSlXhZfRc6ZAe22aMSTzBO0yJQmic9be0yfyMyZw+QCUo9eIf3
	wSqzfHMQma33/K4vQRwm2utKjNIOxmpYL21uisZSA+lyfK9h+Xunf/YSq032BsroSdhIfrQDwpG
	34VzIobWn+urcF3kNrcwU0YG8iCr4vEMmi9iBZl8XU79TwhtK7fsFHEc0H0m14lrH6GA1QmE/hX
	remPznyZ05eAxJsQaSekfacQ6JRLmVSavZ2r2V9V/DxLV1cdsIGoh+zfbJdAj2MyQj4LGooTE1+
	kKAnkRL4+9tJewO58BjXj16MNKv2RPFFc4xiPP5q30pa6f52hUFfeUCh0K0mg7YeNkgEWxwJfG8
	ZbsiQRy0EvXju8DpB55kHGovDTDPVv5hgVA==
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-395c35f0a79mr46724258a91.14.1787568576108;
        Mon, 24 Aug 2026 03:49:36 -0700 (PDT)
X-Received: by 2002:a17:90b:57e5:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-395c35f0a79mr46724212a91.14.1787568575679;
        Mon, 24 Aug 2026 03:49:35 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c91ce453sm4125829a91.4.2026.08.24.03.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:49:35 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:07 +0530
Subject: [PATCH v3 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-dup-sessions-v3-3-4b019def4e0b@oss.qualcomm.com>
References: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
In-Reply-To: <20260824-dup-sessions-v3-0-4b019def4e0b@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787568554; l=1158;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=rNneJT7obxjP1X1Bry3YcWYR3YdUEBRbf48fYw9g3dc=;
 b=UajvJt99Ve5CBv8s1vmGRXSwD6/pIsPjTMZPuuM5ulxQajMLTGSypjoe2PoSZ7onOB+az7WrS
 x86SR5EPYqECTHubX3g4BkIT9Df/XGR35WVFvO9m33LzsxoEblQ2/2F
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfX/2i/tfYPmVkN
 9jTQQ3S6ALHG7TUdq8pwMG4zb0TaSnIHapT5KwQe58Fbdfhm6RwQ4Zv8rbm1yLavb7yfimMfDe2
 KDnqEGTL7P801E90DRZAYJbng+SVo7GCpfNen1xZLPvye4nXc/YvHMhx3J9dAlWC0vxTNlGLUjO
 r1m7UuOs+cogK5Qu8rI+1FKXppPHTUsPimUD1oEse9o/7IO0SEEc4gqPhanNOffDOV/hlYVz6uA
 FAPhxaKh24HQJx5mBaXcxLcSdUGtmtRMKZbVn/jxFp9q3M7e1paxAGje73jwHGWs/slsdpnklMS
 +5keVUhvGhtYfQW0tca6aOp/qzdP9DA3nUFcvA0Dulk3zEsHXGe+PgLnGesfoUCC1PdpjyWml5r
 T1pGrrcJOMEoHTyhkN93cd8gXuhSMNXswfLdb3ca4BUPnnYxANLQKW3uBGRGKfPPn9SGaW8M6sK
 fjq9knjZAYel1L+sGoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5MCBTYWx0ZWRfXxFGKNSpfAT9h
 Q/83VqUQQ3LwkLHZrScHbl8Q3N+uWKWUEqTEx11+BfcWGR6otwFb3e42loUZ2xjRDTnpLJk+jPk
 umjtwyXnaMCMqrD4qqi4bTYP9mkmf6w=
X-Proofpoint-GUID: ECXMneqoNv4eKuLoiS8k1cGs2qWlzqUL
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c21c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ECXMneqoNv4eKuLoiS8k1cGs2qWlzqUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240090

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..683989c468cf 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -96,8 +96,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1

