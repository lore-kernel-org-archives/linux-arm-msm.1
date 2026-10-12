Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B047045A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798567; cv=none; b=AJ0h0NRJzIQ+vMudZempvNitPHZAXPoPfEfYmO+xpKU57XN/45a9CeUO6ZTS9Xhl/fWLSMEzgRJQTAd0VyVyVMmAWaH7BcNxKAHSzlFgwX53Vt3lXjk2ZAb7eJGC4JW7VbFzzaAjIU5qehgP1oSW6fdtT89jq96OILXdR2bvd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798567; c=relaxed/simple;
	bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILIxGLwuF/kqOIJqXLpyftoF7RQAYg8odiTkOEUQLc4pzmHhjNbSr3xvmu3m2IEPzogeChGwRs67IPz83ECeQPZf2pFB/KGMqYXAUW1GNS3rOFaixWtpEaXLLf1h7BLp6pYmCXTMGvdH4T/r+lqB++PvaLTn/amYovQm/am5XvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtayOct7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihi4XcLz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtayOct7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihi4XcLz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KiJD1192801
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WIS
	F23hsLQk=; b=LtayOct7YJMGuwRhZVCkinpNhCvzxLipEalzIqtg5dvIqE/Bs0c
	+wpmGmrQSnPrPn8WRZo7RFgkRKpwXE/TXJBW9ZBNukv/cjOozfRfxZImu652nK4x
	sAAjP4Tm00wq6pfcegpsOFDLGI+rFUCnzK2yt2Qy1+0Z80WwVbznjqOTKgoc8ZJL
	oV/XjX5X8DSoG03nx22A/Ud2+MJH86utI9kfndKG/HDe/AbGTRJazlL1Tp1+MeFY
	L0pNTxerxHkIoJ5hoCOytqr4yqY/BRkSnJiqXgm4utB8eEB3SHc0YnfvBHUf7dW1
	AVE/eVgHSVqeWpY2v+e1Ma6Hzvje6GIpoQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4edtsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:49:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-919879b09b7so45937956d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798561; x=1792403361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=ihi4XcLzWoC6M+SgVidbFx7QMsn+J1gIcA8efJsx9zgSBqRX35ZU49b+6zrfE9G+Yk
         HTqpEAd+r0cuMT9ZrlwG7FNEwcM7ILRFz3OGzlI742YlulculdPcjfN+S6sL03fFotc5
         vcT9nDxhCsDMZHqf1LmCDtFpNo1PzYrOW7roOGW9vr5p/6nOkipBbGjiTjS331ZQkKUL
         yzF3qRYreCvQcM58nM88P90PFAHsuYFa6llhmVQ4NpvVASpwUfoggRj32Uev9yENhVGQ
         iDttyzxRkGRbGgs5SxS/XHnjf1T3XrX0uHUmiLF42IZDc5jnZxMaTrNtknIEqS1nKXDw
         fKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798561; x=1792403361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZjGkZ8ZHV4WDuLpmW6lz4tk3ITtCil1WISF23hsLQk=;
        b=iZCSgobvAVQkOPm8E0HsQjuIFrzzwkMu8FxVpyzDYjtTcSHcnj5vlF5XTdqhYWypZY
         UCDleaK9NdkP5PFyWKCXabsE1FBRkdAVjimZJJJVFT34WA93MjZ4k50IV0lLveyIxRXe
         Ieo/eCtlBBhlXiI9E4M/LUeyKvWaReoDK8kUqPp7sWS6cMOq86gUaiGm+cm3iuUSma5G
         7irJNIpbASJm/aiYwTlAC1e8k30h9qAtxCCeD87jM+9b1860s9xwvJBF7LQ7T5DZmg8J
         YBa7LIfn0+Iwyq9Y3tp9HnMBYSXezNCDBzh/9PrvKHbyahTKxtbUGAHq2KvYvoY0YRYA
         MtHg==
X-Forwarded-Encrypted: i=1; AKwUvBxLxvGfIJu1IAXW0HHKHM98iyEx6kG8vLe/74ndFwSeMqp2AuLPkHeZwDxTpw8vxbSNAitl8it0LPrbg94m@vger.kernel.org
X-Gm-Message-State: AFq9FYLSiE2Via/ToMA1j8zdkV4LXWbSDClGiGnuT4i6jbGjrHx++VCb
	Y6ZTZjBeZ8tjStri72/zUkCjgPqOSMOLgGsZerxeVmrLmeiW0Ud3PT/VtRtbrkV/W0dxYrAo56f
	lhjkw8JT72lYJ1Gnztcaq3xzNfjH+NorEviywPKVz++ZzaJ7wfDH5b6Fzxannu3hkQC3H
X-Gm-Gg: AYBFou0/qVkzIKTCNetfTTVEjOursHn5pA3QTM4TGdIeJ3LB2Q3flvzpjVs4uuxNb2x
	WUmConarSUjQhLU5PUOKli4JIZ4OKwz06Fm75G9YK/vf5cICI9IjKxM0CsA8oXesdtfabupJYKP
	Lyy5N5Xb+5XXkC2tRLE3rYjI1x7U+Zz7zmD2gEYjuA3tjWxH6sZuVJbrth3NbKIE7V2aYjVdntO
	JhS62ew1qSUrdsjOf7/AFz7X1s0Ne64BzDCKy3hAmjuxyRhEtRlP+kGYhpEIglnQjg8AAZIdMDj
	YUaOlQwkvV64fOFLH0pkjPxDa3PFUwY/Tg60WOzZDiv//kGaCD6AebrlObNWn0F26QT7/irbg6b
	ThsT1FM+Ww4QqqIM=
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539956985a.9.1791798561098;
        Mon, 12 Oct 2026 02:49:21 -0700 (PDT)
X-Received: by 2002:a05:620a:c50:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-93ebd0df5abmr1539954085a.9.1791798560508;
        Mon, 12 Oct 2026 02:49:20 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm243381415e9.5.2026.10.12.02.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:49:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: qcom: Fixup sorting of Eliza SoM entries
Date: Mon, 12 Oct 2026 11:48:44 +0200
Message-ID: <20261012094843.66537-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V/3IA31vPqsXG2097rTKWi5nwgyBwftt9ccti3G8bUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqzKz7jMMTDHh4wHsjQVbqjEGmiKi/z3hR1c8ba
 RjfY0DK5LuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasys+wAKCRDBN2bmhouD
 18woEACNQ1EHH0AHlHsxMw4Fm5fWzxJ6Z2IaD2UDW9TzcjZW9KGTfbitPMZjTVrk097fNbKTcwQ
 bjnmIqK03BfqRp1P35Tw8qE9kNA2juQbOy8wlvrah1bEoxUUGaT+8ayPDAU1rkouwgLKzrAb23W
 Xt+I/jSc0dHctoV0Lapyf4yxcIQ/NYs/4bRybUgsNAPSFpEOgajC8Bs7lgdTZqeKargYczalI39
 sZ0DLL5qKa5/v1P/v9yb15w7fWGhr2hytVdmEx4RooyE4vq5DWwbKc8Ofto7lRLsiaFKRZHi4zK
 Eg5m62B3INVVFnCP7G9zn8HXw6kC69VFWEdCk0mqHffUH+iSFollLteuuZH8zMaA9VuYPwW5Qh4
 L1zOe79tPnvYMcTkvcuJXywvd6jAqu36XSPPw4wj92OTvqcIZjrvQEknmh6s2gEMetz5GuXCK6i
 F234R6gbQqgI2ViEOO9VjNYJ1LlvTE861ykoWZ1bUwMQpK5WRvgsuokYpvKwdKyizr75SP08NCn
 Zziabm7ru/BdtxYZ2r/E00YEzlP+776lMTmsvdTSf44fcJQG4rCKtrvmG6UTrbvTIbPXbu3BZbq
 E3jbt+II1U0Wm4pdQm22exKBDyXGM5W+h4MLAuuZhExi0Vqv5NVqZvckHv+a4iGYCgSfXrHG2Is lJaSIodwOUeAv6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX5mJyAkl+8fmH
 VitR9W6jeOW5nRxi6r1c5qKGdEjw3DBmoJExO/sPtYGu3DhfyWXaqcLL01qXIHGsod3FCgJfb7T
 YJmamhrO/cn5rLpJfDXMlJ8+NR2aEYzDQaRvFymIvzxGoaVMOmkBfeH8OSHGjsRvVu8OzgGPKAN
 A3F5L4ksUzPPNTDC0qu+c4FYnYAhI0kDHVuEVRqBlfJGIpamDRQoq3WqufArTrgxUMzF3Z+jy84
 sIb46JRzAP63/AjzIfkXOXalWPGVbItyqSGE1K5EarbllfA+0cP4Ix5sRYtuubMu6iJ9UuBQ1M4
 u8TMU9zSIZ8UqdcKovmtnmMsiw27kpSL1k52vL5GgoEiM1LIzl60TcO670g/6cv42FvMxUnJHfh
 XPt/9AZNwvAWxbeOE9kqtVXgcXOSalakskeHfOhnu4F1b4cz+4/zJkC8ANDMP7GXd3kX1VTRR7F
 Oj4JX1QJy1zBG+g1aMQ==
X-Proofpoint-ORIG-GUID: q3rtimJjei6-jupuWlDQL-4R7JBKc7s7
X-Proofpoint-GUID: q3rtimJjei6-jupuWlDQL-4R7JBKc7s7
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6accad22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=EASxALMklSPAlHyK5eoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOCBTYWx0ZWRfX6HW7fu1fkwHv
 f/aOxho+dpNUFzoep67Ci9pu8DANdlNeG8PuHbZYghNcEPH8VrqXDiy9RJJ0xpx/LnqskGy9hgE
 1wChbVEDRGGuXvd5MTReDgcnd8vv+RU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120038

Commit be9222a4f92c ("dt-bindings: arm: qcom: Document Eliza CQS SoM and
its EVK board") when applying patch from the list, placed the entries
not in alphabetically sorted position of fallback entry (the list had
correct placement).  Fix sorting, so the code will be more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f28645b0088e..1fc8c03e4401 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -55,11 +55,6 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
-      - items:
-          - const: qcom,eliza-cqs-evk
-          - const: qcom,eliza-cqs-som
-          - const: qcom,eliza
-
       - items:
           - enum:
               - sony,karin_windy
@@ -79,6 +74,11 @@ properties:
           - const: qcom,apq8096sg
           - const: qcom,apq8096
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp
-- 
2.53.0

