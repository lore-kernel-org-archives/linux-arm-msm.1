Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353D2F9D98
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789082224; cv=none; b=gUOxa7Gz7Cj8ohNL9x28hGNqdgjFSFcV1nNA2C32MdEfp6RsCR8nInakO490agrefC1AnYj2tVcP2gJxaJ+d8sR52H4UIoO2vR7VGMwDHq7zyvlQlqu+8omilLclxQEVaOCbfrfOl8oY9lMaLQtVuNh11JMydQFTSwLinoux+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789082224; c=relaxed/simple;
	bh=BTk3PCGBAvoAeGTUHw2QCk8i7VYx7TMYwqdzeJxrQ8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qAOA8yLvPRiZ3wV1hl7UcjkPuaCKV3iZ4hmsNDULnBrrzAl4FAIvpXQoTlF2O7jwtmC0pOhstm0YC/hczdmc/TMaUJcyTxEhdBtDlrPQi/X7OuvtpT9fRdUdb0Vit+w2xYTxrVNCvtVOGDOYxlj9/Wfme/6Sywv8ku/yUpV+c2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5Uzbbyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FERxaEXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5Uzbbyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FERxaEXD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ALU1Zu3280566
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+MjNgsDhMva
	2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=; b=m5UzbbyblkwHvez0OuYIrL7a6Sc
	AujQ9kgGv3dDD6uGMhZxBp31w0KorBoWUfuUN7Qr7u9g5ZyIjer45r7CHMy9LCXD
	vm2q2hj6WReEPiIWLr18Aws0UgAmh6kIObev/fgK7NZuw3BrUyYBlGEcbmQRmOJh
	Fo2os7puZZZaAPCUrGh+LcWY/Gpmfatsb63IUKPW00zpaoHZ9sv1+PiqPwvbO51t
	1hEjxnkjqf4O95XkcQDb44udgGDDXAUWq74JBkMqls/JIaKRO70N2+AlEVIpAMdU
	Cl50+m53CbIfdF3FsX6VfM9wEvxq1QamOiTOHEbXxVT3Giri4vS+NwEJ59g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxnva1bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:17:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so555872a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 16:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789082222; x=1789687022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=FERxaEXDJmdKNnYXgAdyv0FKPsWd9Ih+Dykn5JIHTRXIaCK+wWN1Q7PdsO69m99q63
         voK7ZyioMYY82JbgawGKXoGLyOZiXpYBqm8XF+TcdS2ZkrYGfzL8RGrCCveDzvXSQqEP
         bebe5yzvB+hPfP3c4r+sbKWXLnktwGbTlq2MUn/9WZ2PJ4bErjOLPy18ohNYxVKrI4ze
         FNSKGt7hkwVqSZRnypbcn0AnMFQNsc4cone6Ok/YwwqGiDzeuJjcQCh4w8X0MxkGJgy0
         6fTaaDbwu/vi+5b7GVxNR1Q8IOOH12JFP0PXmpMagz8BdRvD7wYvpuDjAHFpSdkfj0rr
         LRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789082222; x=1789687022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+MjNgsDhMva2Slm4iGEQCcjo4eVlo+darmYTizZsRqo=;
        b=oCHV2YSio7J5te1InI6Baj1xuuSoe9P2FkLobmSvlO4mYQre3ShOdVF/P5+hgCpsNo
         cI05y+MESupJJFGvRiu5idZTxmG/bYIG/JSWAiA2urksp3VO7ydy8yYrXeREei2sgaio
         QkO7hnG3ul0tgeepwtjwt+J3Xq+zRxL1/DGn1qk4/MMMONzu63EXn9DHOfOrxBw8MwPG
         5FJTc5X1fAm6KnfHiDWiJ+S0ahxca4RdPLIrxMurxgwc1AHU/l7MuTiwrHtbtdhnSXvF
         b1V1oRzGXIJ4kFEe/ZSJ+kc7drXxDlmWgXgbulXehoZThGuK1pYx4NU4A5yVZDqlHq9a
         HanQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYssQRKh1IgmpR2wANXT7AGJVZJA4kQvp93/CnblJHWTCTF42sjR0CA8eJYi+zS72g6drdY/3u4dlhfIN8@vger.kernel.org
X-Gm-Message-State: AFuF++kpDTSW23QuvSMgi72KDP913m7LnDHcAT4+/EaA4e/5rPQ3i5YT
	xFftDuXAHhN0mb9pXpsrEZy34Vm0HHvkP/qb6AnxqClAhQgsGR5nV+GuZSZFYQodx/vDncgOYcb
	1NblQXqqWspY3utsCNyeLpS0lWNgnuf0WpvDg8/WXYjNCMYbPSv25k8RKdVG0fgZ3MWqb
X-Gm-Gg: AYBFou0wZkpn2AvX/Jtz7Ci740SMwcl8TS1XN3IAkc/zZshnJuGhvUft9SS/XEwPOZD
	li6KWzWecKpa1cZnTglDO2nKPkiyEVAw6FidZzVZfMeEclK68v3Sl7HgsrFxtiH5b2ZiKeTb9Cy
	6FaHn65wH5+MyNuTCMNVh70EeZ4N/JGQfrc1yRK18OfFN6blqHv53BgDI5NTTmq+2418NFwwxVF
	NlbqEC4Uk65Flnbq4f9HyfBJ3Ufkl4vwsmzuEUUwq650xYpUghkTFK/NBFwRO9FCxyY3oP+YGjJ
	PhaKuKSo6ZbZ8a28n5653Giq39FLt3lUAui2DpUi+koZvGLyF3bKt7NHMY9urb68Fz6qmGt7JmK
	7/HRkCrEsfVtiW1VxTRL8u3TBFSeHL/AdyBdt
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593396a91.25.1789082221736;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
X-Received: by 2002:a17:90b:586f:b0:39b:66ee:a14 with SMTP id 98e67ed59e1d1-39d9c374d49mr1593327a91.25.1789082221250;
        Thu, 10 Sep 2026 16:17:01 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm1204374eec.26.2026.09.10.16.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:17:00 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: sound: qcom,lpass-va-macro: Add clock constraints for shikra
Date: Fri, 11 Sep 2026 04:46:35 +0530
Message-Id: <20260910231642.1794948-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfX41Jx7T2iWiZe
 5Y2mumDDpRB7Dubm9lZTqS+dmjAPugTAC8oLtPypdw/UpUkRQcrmvTPbSFlpCKCOzjSHEoTU5Kl
 8o5gupfTVKR/pDGR0pOSce3F5vxRPf6AvZzjqAZjXonJQ95L6r6+ARAvmrSWsKx1rxfB4G8E6qF
 Nk4uJoAtKtzcvuyHKQO0mkOnYSdtFC6dRsci6XoKkkgIw8KGilbSK5vDYsdIuUKrakfqHiCCQkd
 z/SDbUmKDCiHVumNb5itbGkHRhkp4h6hG7YRsbCR4Geu6MqvUVCLumVXx+lmTNAOx8JLVlyBckB
 LT7Dv5EFE5lX+4DmAOnbkvgEDhWO1Ftrvuwinc2mWqpWKOCXOabWC4hM58XQobuj4RsDHoPPX1N
 u62OQBNK2nuVF71EUx/AKco4VKcLrHtlF/2oKOS4m4R1619ddG4BZDmJDUurQMSCtiNqgHXAR9W
 iJaRHPMhxgTBG9v3rPg==
X-Authority-Analysis: v=2.4 cv=RsxQvymK c=1 sm=1 tr=0 ts=6aa33a6e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TQ3ku2UXUW4xEZd4FcAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _ZtAcxSbeURkb7Hai17ZtvRkWBgwQcHt
X-Proofpoint-ORIG-GUID: _ZtAcxSbeURkb7Hai17ZtvRkWBgwQcHt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDI5MyBTYWx0ZWRfXwx+l8+gQbFU8
 t3AEoz+U8NKX2M8a1jz/JFtsxPd0zTsdjYhSAxhFYyAwNylye8JFy/RrUXOQO6tzS9mFD5DyjPj
 jXQEwvxqXSdkneoql4EknH1XdegO++A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100293

Add an if/then condition for qcom,shikra-lpass-va-macro specifying
exactly 2 clocks (mclk and npl) as required by the Shikra VA macro
hardware.

For the RX macro, add qcom,shikra-lpass-rx-macro to the sc7280 clock
section as Shikra uses the same 3-clock configuration (mclk, npl, fsgen)
in ADSP-bypass mode.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml       |  1 +
 .../bindings/sound/qcom,lpass-va-macro.yaml       | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index d2f68b02566b..d0227c3114c4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -69,6 +69,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7280-lpass-rx-macro
+            - qcom,shikra-lpass-rx-macro
     then:
       properties:
         clock-names:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 23f00de82cd3..e47ccc46d3b7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -169,6 +169,21 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

