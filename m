Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FB3AAF42
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434093; cv=none; b=JTrCH8XyTcm5VB/cVppbUiVf3T28e+Egj96MHhP5+088KAAnUOTWTeDk8RbywvFXM0YB+GEM9aWG7rvmDoYRDdSD1HemawwMt3iPbmd2xX2El1xQnDjARZvdHpEszGly4DUOD+Q3l9LNGlkorWk3F0Hc1OyI0KfowoPfjFG44uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434093; c=relaxed/simple;
	bh=3MohiFJRk7R/WUpguwJ0RoRbuy1k8TNuGFgJUfVj4ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8OopMrcSJ1GMjVEk/hft61VHZD+Cd8VPlBwhdmADV34lJ4TiWGZA9IDZTIThnsR3KIiiO/AimhFluAaP8eCdJeneqIHq762jOHWG5/Yns9EWUkvfrpDD/jEVDDMbUn+8zEa9/e/JvzvbQWEfnGENtl0Tl7OZQvTA3TMTY6tl/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2qMrdOj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQkz0Msf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2qMrdOj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQkz0Msf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UHhCXZ1995345
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=; b=f2qMrdOjnZco1mVv
	BY2+zwXdMPjh8UCH3TqbRatdDXhsRx8mPFiPxW0mpuA/k+y309EhgDqtX64ZGX6i
	FkXjnPaJLe4GuYSRLe2X1DFYhWtmjfwBkSWGu34+Hx3QBsOkkIfsjijVPqHZDQHf
	mJaKl5q8vwk4HmrJiKDjY6TD7Jiz06y7KLNh2o29XJvTnguU0avGya/XpPlwePrP
	30idazc2wzKDiQewU0JTuYIZ+B2G/kHHh5gWveHYvxpes6zkCpMOrBnFqrKDKvP9
	ihDTZBNX4A4t4AbvkEipV4Glo5Sg/DbQPKHtYjepHA6pg5fuzHVV5x2zAg9UyyJQ
	mgPDnA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frb8tg1wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:54:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab041eced3so89624a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434090; x=1786038890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=BQkz0MsfWAr3cM0Wx2gZL6n0TAYCcCcQ8KbRS4J+rpbeNcrU93LIFIa0SfGI7wnA+n
         aIsjAPahvhs+uEMT7nMvtPgXrsv/JFJA0uic3wi/nc6bA6tSewJoTzSCNqwicOSdEEgm
         kWZpxmztdkZpiGXeYHs18vzY252Ddvx75oZCmWUoJIsTce5SxJGU6Uu33A99prFPQrTr
         M9ejDhX23UtBUEwylUejcSRAmBiSDiPowfBb0aJV6HxcVWA2PDB7iFGZqhrFaYWI5Ds0
         0x/MA/nb0pQWTiM9lC1KXaX7xhotb5IbkCeV5iPSWed1sA58JWAymzpEpAVSa4L7kmua
         rKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434090; x=1786038890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8b33FVeKQ9T2e/rU+WrSlOpsIVAOIk5Xr3oABwt1L0c=;
        b=HY6nA4Lkx4tkXh/7PmWnPTRgc0PK8fJ5yTsVTqjpDGtw1za4C8RB2qYWXq5vzSnEL9
         e1UX21zpPWQixc9tSHxEsIdDqpF0+kgOL6Vn5afrSGqqLahU5KVdfQYUfIgVNGsgqGET
         im+JdAIT3Ieltizwom2AUPq5G08c/dUPDjCLVO8P8HVJ5aIEGNTxFdqyW2Vqj7LNyyx3
         bZLi/NsHnSH0W7aJ5xreTcdfHvtspa5NVL3jVVDjd1xxG7t5+0i1dDE028rxNjw5j6+7
         xd1671ulruQ+MIynqoFq42deC0nQzz5sOjqLRwng11wRBfeGr2xqqg1KRH3Ex3U4z6w+
         ANHA==
X-Forwarded-Encrypted: i=1; AHgh+RpRjOXeOKZCIExTyCRJOUISKnTezUCsQo/h0YlBMuX/0XVAPwK+6iXSrYnnyUneEcdA/re4ASTurrCdkBbs@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwFkp5+YnkrojuH1F4DxypTWcSrFKZFy2Fk8Xu30+ubdIm1VX
	0NsozlKwUan5u0K8+6mHhE8MOq8qMIM0rLISTeaFLCqrPZDCvDj+qfThh50OcGgjgHuhMu7QSAp
	96NiNkMGlwEnwmCf4OjawlU3qpEme9Nz8ghReSBnhVWx98OZboNmbI1Lsm1b9uA1pnptmCp7GYY
	NG
X-Gm-Gg: AR+sD11Q3zE0/rf8ueqj51lUgqVS0hpjrw91XSpmenrpp3ae7TuUe9EJYNfdwg33aUi
	7SOz/GsEcN/6DSN8pbW83TFbeEFBc3YhIvLpaXOPa1VSqpvBMIZpWpORCe96qv9gHc02oXscEDU
	ptrLh596+vLQSkqYBT7xoe9ugnjyjPpkrH2TmevFxD5U5LgAdNiLxuxebCET52MhjSXza3Tc7sY
	kDREW5cE9x99BiMYE6aV5f2RrwY3pp2yS/b5e3TuE8fwEgGYrH10514QaQpHpp7tprZSknmCNf6
	FWghrMuhCXYypp8WOVNEsb3s4RmVC8uvOl5/SQLbQJODu29m1eJct9L0UvHivcllR8QP9xSeZa1
	bvVluhamr2GhU5sqfRf1QSnx5
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688108637.11.1785434089876;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3c90067a725mr3688086637.11.1785434089454;
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:34 +0530
Subject: [PATCH v4 1/5] dt-bindings: clock: qcom-rpmhcc: Add RPMH clock
 controller for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-1-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: p6GWwtS-_85KWadGywXLfXIFtGpdOhW7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX3Q+L4JnfBnlk
 a9Ri0iaLXXxTobK5xBXx5Z0dcK4HExUq2S3ybISpYI5H9keAi1Q7pjH56ppJ1/4Mclx5QHGP8wX
 TePE/MF0ynEMFeMAx3pSb6X6FpPn/AHICrgf4hJejvjQcRjy1MK1i2TvuRqH4yZJt9/GvOY3G+h
 TIaFGv2pJW9ps6uW8U2g2HHVsCQRyyZ6RtBgpGYjP32n0mRPsPqUjOnusctggjU6oUtaf2yMWd8
 TK5RWul8oY0jLTh2f9MEEZwe+lJehVcYXGm38aIgad4Imo2e51B1u/JTuwgIS4tC5rt8zlM/Aj1
 30/r5wkOSSX7ZEo2MkGDFV9/hHcepUv6507ou/6a0XCkVn6Tl8BxuDPElBosH8J4zQM3QXVKSdm
 5pIe5x+h4cc0gEA71RJlJgJWkxu4Xb6AovAyHtps4oYoIgYlAsh/uPCOgXcHl0XKM6CJO33RTss
 lEtBr40t+cWGDD7AJLQ==
X-Proofpoint-ORIG-GUID: p6GWwtS-_85KWadGywXLfXIFtGpdOhW7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX+sqUx1PqHptI
 cuJu7hZPYpyXB7OX8wE1D/3lehK9fiuYj+u0xaLAcOJUDOIeEYtwr9b9g2p6WhfkFAnBrBg0Qnp
 I4DkGUW5We//mLgIJ8VyJAK/mlgjUDU=
X-Authority-Analysis: v=2.4 cv=Y8rIdBeN c=1 sm=1 tr=0 ts=6a6b8fea cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=OozyDhJeiyY2DhU_uTUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Document the RPMH clock controller for the Qualcomm Maili SoC.

Maili SoC is a derivative of the Hawi SoC and the rpmh clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi rpmhcc driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     | 65 ++++++++++++----------
 1 file changed, 35 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index d344b33860429527246484560823074f52a9159d..2b446aca5207c9cc2922635b0539f2d2f926ea0a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -16,36 +16,41 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,eliza-rpmh-clk
-      - qcom,glymur-rpmh-clk
-      - qcom,hawi-rpmh-clk
-      - qcom,kaanapali-rpmh-clk
-      - qcom,milos-rpmh-clk
-      - qcom,nord-rpmh-clk
-      - qcom,qcs615-rpmh-clk
-      - qcom,qdu1000-rpmh-clk
-      - qcom,sa8775p-rpmh-clk
-      - qcom,sar2130p-rpmh-clk
-      - qcom,sc7180-rpmh-clk
-      - qcom,sc7280-rpmh-clk
-      - qcom,sc8180x-rpmh-clk
-      - qcom,sc8280xp-rpmh-clk
-      - qcom,sdm670-rpmh-clk
-      - qcom,sdm845-rpmh-clk
-      - qcom,sdx55-rpmh-clk
-      - qcom,sdx65-rpmh-clk
-      - qcom,sdx75-rpmh-clk
-      - qcom,sm4450-rpmh-clk
-      - qcom,sm6350-rpmh-clk
-      - qcom,sm8150-rpmh-clk
-      - qcom,sm8250-rpmh-clk
-      - qcom,sm8350-rpmh-clk
-      - qcom,sm8450-rpmh-clk
-      - qcom,sm8550-rpmh-clk
-      - qcom,sm8650-rpmh-clk
-      - qcom,sm8750-rpmh-clk
-      - qcom,x1e80100-rpmh-clk
+    oneOf:
+      - enum:
+          - qcom,eliza-rpmh-clk
+          - qcom,glymur-rpmh-clk
+          - qcom,hawi-rpmh-clk
+          - qcom,kaanapali-rpmh-clk
+          - qcom,milos-rpmh-clk
+          - qcom,nord-rpmh-clk
+          - qcom,qcs615-rpmh-clk
+          - qcom,qdu1000-rpmh-clk
+          - qcom,sa8775p-rpmh-clk
+          - qcom,sar2130p-rpmh-clk
+          - qcom,sc7180-rpmh-clk
+          - qcom,sc7280-rpmh-clk
+          - qcom,sc8180x-rpmh-clk
+          - qcom,sc8280xp-rpmh-clk
+          - qcom,sdm670-rpmh-clk
+          - qcom,sdm845-rpmh-clk
+          - qcom,sdx55-rpmh-clk
+          - qcom,sdx65-rpmh-clk
+          - qcom,sdx75-rpmh-clk
+          - qcom,sm4450-rpmh-clk
+          - qcom,sm6350-rpmh-clk
+          - qcom,sm8150-rpmh-clk
+          - qcom,sm8250-rpmh-clk
+          - qcom,sm8350-rpmh-clk
+          - qcom,sm8450-rpmh-clk
+          - qcom,sm8550-rpmh-clk
+          - qcom,sm8650-rpmh-clk
+          - qcom,sm8750-rpmh-clk
+          - qcom,x1e80100-rpmh-clk
+      - items:
+          - enum:
+              - qcom,maili-rpmh-clk
+          - const: qcom,hawi-rpmh-clk
 
   clocks:
     maxItems: 1

-- 
2.34.1

