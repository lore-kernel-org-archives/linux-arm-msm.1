Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B348A4C6EF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328689; cv=none; b=dAhr5fsg0gpthdNTv/dDE//yziDCvgvyW+i2IDHA5628jhASyLTls37GBM7wcvV6+KeQHsjPv9jUgbgbSgGAXOTTZQKzM8poq8ZFDXergb7Zr7oshHHXEflajG4pIr34G9xOaknPGgvmxipkPpFkI0ivXxmK5zdF6WEX1Ka7uQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328689; c=relaxed/simple;
	bh=mcaRPD1yVE1lNbFj9arsqohiAw2BWUacERpzcyqjwvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HMRMlh7unOWidOdPr+c1MXQ0cTD5gz1cVuv18S+aPx+oCuYKLvy5ZIfB7Wi0YxzI6ksEdyfgCTx6WyAGeFt2vhCKckogqQsohuapurCPw/nL7JRfksM9MRHA0YiUyA1mdwEYxzSbitlmIyuiZoStF25u0NsDiF+KtJTO7DhEJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCoPJGGX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6gbQ3l1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCoPJGGX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6gbQ3l1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJxq2322939
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=; b=OCoPJGGX7igyFx7L
	ze7Q6ck88ijWO0zgCDWL5grpQ8CYTsRf6T8Fw5NRWY+/9gIWHYJ/oaXY25t5xj++
	/6OXmeH0tfHJDQCU86+tPCxhIoaIfCpgtXP/oxvX6eYCzE3B6CweyXVW9RjOPQVX
	Vo3c5bFb8wVOND6wQqSAA5ytnKLRydFeNx7AeOA7QpUDVQ1e4re3P7/VcK6Hdmm5
	fzi+LKp9AXuO4OL5+Z2GzmlZnB4yheVQWLjbO8BwjEfDgj8YcNMsSg3LA+GrLO3+
	Sy+/TIweQxRzI/WWeTVIB/xKfxaCMArcQ7pijkQ1KGpXp9JICZrN5kKaFQYe9zYQ
	2c8+1Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwak31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:24 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso2089136b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328684; x=1787933484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=V6gbQ3l1dkk1RtQ76g7lSI5tu5bSAHIySYpj+n2xMZEIbz2HWZxvOLoAqTid85uJV2
         hfHCqQGg4b6eyMrjxmcPa/Z9NSa1Aj65YAkgsD1IrUrSvC0NtGdyKA7lp2g8mp6zmLuf
         pOuWDXPXDpeelGk7CD4wnkaMYW4y5hbuordM0DkDQtbCV26qXpNs1xYwYNO51R2yKJyf
         qR4qrHUwIZ35s772ILEyEngCcaCT+qZ+l5fQoQMO97QPr9vUKHNT9SaVG8fZeDbHi9Lx
         DY8wWMo2zSPk1+J9whC5TpEmXYDgq4bd42oQeTTaSCaxnKfGOkpQH9demsUaVV85smsi
         RxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328684; x=1787933484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=knkJrTiDE4SRc4qBJ0Ar/hCVAjYZAE9e1hRiGXLNN2Y=;
        b=nuh1ad6djqesUDkty11iRtyMRJ13nvwLDgHBjPpOlngvOfU+Pz952XNPuuddFHHlXl
         HfGLEbVOc2qdNX+eZYag9jmnZOrvcjqnSoTy4rRGJ4x/gCrMTh2EDBj1ladLz3vmfc6x
         5nBD5IZF2uCUTrg1DMK0NDRhBBL2k84AN6MaXkJ9VTVC7IzZsnethnPUfLRH7VvsCAmj
         MATMzataITextWBQdfz18Bd0us88TGVKdTPfpfsOL+JUalK6soCxBC3XgDOZ6SR/nKkN
         L2IR0+v/IXAkhSFyXVhGut2Iwj/4m4D1IUo3yHRZxF5fBwiUX18KjY28R6+grFSC4z91
         dGYA==
X-Gm-Message-State: AOJu0YxnyIiuoQrL9E1S/bHW12zpZBoomiYnRys0Z18/PcSGGPRgy9zP
	ZzoLyn1n29aSI+oRQtfuhFJM+7tghKTPsNmGMtpe8z6JPHuQFFzhFMunOfKU26tVa9yBy4As7nK
	lN16FtDkGtGAqjo6gwYT/ZO8xlmU2gK0VO8AkhQmw3iyz0uLtPVCxBqR/W1cRfB+YNzyw
X-Gm-Gg: AR+sD11fxnOFPE3Gkk9kdS0gBiJQBKQ9fIE0dfAt4UvgNNfCVHRK+2LHlzzeDb9utby
	OOrsMoN7Akr5UqghJZ0DPeU7cD6/i+REhXad3isg8bCRfUKxl3nCKnO4HuhwuXL1QAm92dMWFsO
	OutTBOFnGaKzbcJrVdFxEROzwS1a3eJ88QXH8IIGCZSsa+nCkjMZg4H8bJd/LJwhP3HmXo8DfCe
	nK7g0wWojd+P0EOF/jZpWqwv9guh3emGS3gJCW4cFtLrWmcI3GzmrKrP2jTljk4WV5ISTl4XOUY
	/hnrgeoaUO4rcTJfPIjfcv8R1UwbZtk6Rm9+1zUVjIfYYXk7BKT/Mx41XxViE2pYdPxJiJkVM6x
	OIvc7qE+hfeB3I6vAnhCVZ1TXyUH3OtZQNyVMYZiq5fsU4DC83aWarBF581n2IXHavWSuYVNvTw
	y8UBjdlUaNk4wpWjWBE2bPQ+w=
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487867b6e.19.1787328683877;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
X-Received: by 2002:a05:6808:13ca:b0:4aa:cad:cb4d with SMTP id 5614622812f47-4b2ef40c7e8mr7487786b6e.19.1787328683448;
        Fri, 21 Aug 2026 09:11:23 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:22 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:07 +0530
Subject: [PATCH v3 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2248;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=mcaRPD1yVE1lNbFj9arsqohiAw2BWUacERpzcyqjwvI=;
 b=Hxd1KRhg3fuPoN/wzOapNCFMOpVN0UkreJGyf7jijbcGmh57K1Z7/71AU6X9faB+nSPnaT1+h
 8mT6dYe/TeVBYZ8bww9LHWpu5Jr6CksRvJkR49o+XgXXPxgcb2rDP9x
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4H+mhH8Ebqqu
 nokaWEYtz8XPPfgR4E22vc2C4E8jYwW/mia7O0XDn8f8xZS3/wuDYvj6CGxZoVeLWt4+LIxGau6
 jva1W8lIlF5/+Jbfd/8yqmwK0RI+1TI=
X-Proofpoint-ORIG-GUID: wMJdTYuaY4ph1fvxktyfJX7tQ9wUROOU
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a8878ac cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vXfy1ps2I0IJequeNBIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX9GKAUj30jMNe
 5ThiT7XI4gctRAtd9bvuOS1+u2KztEGC48OPkmjMp0yWsCC9q2KVaKqo/a2YnjzSx/62SajjJ0B
 6Rjl2uPDOFvUUNXqzvu/9J0nAACLX8/t7ZL0csVFybqL71hBH2ob+WBn9CfFUCuxxPPeMBv9eZ4
 ZTnidQ2wkgtVHLAUNcjq+4ERkmae1rSYaoIBnJkcAeSBX2qmzKgM7ljlIpboWQ/O1sn3OrjBQ4K
 Ew/ucin4A+k/4xryu9L8f6Rr36fRYM/8TbOWuh/DEdtF0zFC64poJywX0eYTLvgYjI2kv7SwFBi
 zSMaGbqNJaASvGBUAJ4DF4r8iOfgveU1/Yjx8pc60o1xXf7+ASpg7AlntQi9bCHJsJkaWaUUWjo
 s5tLJXjfllq1jypeMZD+xs+zlsj9XwQIzClSIC9mabRC8nW9sO7wBNiviCMFXhKpxNPegylhdaF
 XoLabbCWuI10sytbH0w==
X-Proofpoint-GUID: wMJdTYuaY4ph1fvxktyfJX7tQ9wUROOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Document the Qualcomm Kuno IDP board and register the "kuno"
codename in the SoC naming convention schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 Documentation/devicetree/bindings/arm/qcom.yaml     | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index e7160b63d814..179aadc86a9f 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:
diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..ca02a2f0396f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -175,6 +175,11 @@ properties:
               - qcom,kaanapali-qrd
           - const: qcom,kaanapali
 
+      - items:
+          - enum:
+              - qcom,kuno-idp
+          - const: qcom,kuno
+
       - items:
           - enum:
               - qcom,mahua-crd

-- 
2.43.0

