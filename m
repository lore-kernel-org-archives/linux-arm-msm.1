Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AC5733E
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379393; cv=none; b=fbY0f3B0QwEdk8aBkpNfHi7s1wxq2VhzQCJRe9tqIJtVVCx7txP6HkZGo5upCfeeruY4mTRtRt1PBjNF+gMMijA3a/mPQoA9nerb0oZYGa2tQY6uWPkGboN9is14mHM4X/gWCLCetmxDfm31IkOfz3sU9uxzkIoZsp7AEnDGqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379393; c=relaxed/simple;
	bh=g0E4F8674D2m6OtmzWH25tEnm3jJCsC0/R8WR+XNFKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEh5/2dWJaETUhoz7H8nsLsz7WRVLUI2VtTGl0gjflAI7fkipPtBvgViFmFhUX0KS6ofCUGfnSuT4cqNQTOIyiOkeg+hL3xjMNzws0BxXKMA7utBkB1ecVaEJY0Fsj5fn/vA0kKfovG1m/vgmtQQbrYSRgs3xCaJyMVzKDiwxZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzDwSa62; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffqxt1Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzDwSa62";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffqxt1Ne"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAIY2h503993
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=; b=AzDwSa62HnHSNjBa
	ttJLsu9binLSHD9L75vOud7QS797BdPVkaQtBNUMBUuBli+nLy1r61qGNKrWWtnU
	/6BKApcUA51NQOJxBElUwi1MtbRQzg3qS8oVale53chtjjUU8FZ6E/C218vewURR
	BoFR82Pj/ewot03TGahXtkVnjMDlqPFzQfBmp0FlROZ631xtzQJ7YQj/L+u6oRse
	Im/2n5Y9DRjhVRk+cdgrsOrpil7IMZPJAt1O/rlLWMkU9+er/BODFVKUBQp0P+qY
	ZOsbnRLPt5FxhGCmb0N9nEJRxUWjDHQFAwzWPGNlukOfqX0IAKfpPAuMVZMwKmQ1
	cYi25g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c68sdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so13172008a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379390; x=1784984190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=ffqxt1NeONI4IPoS9nlbqhekQRr67S0mBjfSpBr+QVHXoFu62sDwhYCfd6vOrr9mLy
         N3pEjZhrCqbX38z684LZ6gf8F2f+o9we4EvQN8jHYVnmj7+22lG1SpcUJEL4PWIxyrEa
         FsAjachkAVO/FhiocFSIzI9Q+But/Zilj6sUkV5qjdyfuUJWpWG8u1hBtBO1C9A2p+Ds
         3P3BqMQ2jmco9LwBU+2PNsvRLUwGcFMWTj+FYuZQtoy5IDyfda6sssEg9e8/kJ0oC9/6
         cPFc92uiwZ0cCIHGJ8gjDQdQE8LLEO1mTjy64c9DLzft0v7N8bkiixZ9Yvl9lyqwLKQz
         /Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379390; x=1784984190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxFIKcsRQTXS8HxFCAZb+qVsqo4wG4SsyGlor4rl0rY=;
        b=BUAdRrdjdW8KvIkJCVMa/enAod632pf5h7dGYwmzAXsVwsi+VjHRrdOeSDmrKTFI1A
         /NLuP21Qi9+gehRH/817VBlguphq1yyCw8KIzVP5Va2jdJg8uhA5cbM+snncEcfOPfCV
         SV0+TIQQs9/05ZXb/HpBkapsGhMW/3P6bMKFjQ6cWMq/6+ILNSfp9ItK1m+MNGo972m9
         /+5NTSYqjyvN0lKTKbt8rfn/XwSuoMOFUE9ybSeC0f+b2Dj0TIIXQR49dfrlenFo6n/E
         mdyCqsyrdPSa71xjs/5iRJPs8vnBMMdikeHXeEGPpHhFAHzZqXSwqBPn8OxPVRDH9mTO
         WuJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrfh9as8MZz1tyVSsmX2J4O2Ko7OZcBQSDmDkIN7lYGhojVuU5yrYzkh60cK5Kbt+PupTVyIcttXnwmsWA6@vger.kernel.org
X-Gm-Message-State: AOJu0YzXnHh3V76fVwVKeY7ejlPctE+xB8aKXNJ3YvWvBHmDX0TYf48m
	pUTCowZ2smTmRYM3epu8DJ/v7DNiVMZnRYMTaGQl5AAAVmYiJ8qVoRgB/qKW5Vaavda0M8vNMgd
	g6plD8mv/VFq6bpKZ0w6dPcXuJ6W94jCyx3QgW0VESwK4SAfae90fGSohRXnUjpK6i/50
X-Gm-Gg: AfdE7cnqkqBpa2uK4bXX3t8d1sy6wX4qLUtKjZ6RrNAqcZlh7H/mclUF/2Tsd36hQRs
	5GSc4WE6056id85joQb9UktSlmMFoz96lOGwjX/9cUVt/o7nGCGPFLvbvGf51FVTG5BxHsS0PcO
	w2jQa1b3S2FG99kuZJvCkRCVthtuIic4wTixFDYGRzWsoHPrjgkTvoqXh4aJ7zHaD0R9M1dyhbp
	k7as7msj/ZLJ28HtiE0nwMKvmPhFKhCbd0hoqtdZUiH3JvkdbSOozAG4CPQ8R6bA8bPCJEYY+ZG
	7cLpc8W3pDMkMcjQpZAi/skJQfF1d8LxFGuZNj8g7WkOcTsezrNcHxpm/jbFnfH1WAAPWA5WyOq
	bbSw6FOb5UvffhF9yEgBMdqRgLGC2jJ8=
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949649a91.23.1784379390442;
        Sat, 18 Jul 2026 05:56:30 -0700 (PDT)
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b21 with SMTP id 98e67ed59e1d1-38e679f4c4amr949619a91.23.1784379389982;
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:29 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:08 +0530
Subject: [PATCH v6 01/16] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 missing power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-1-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: OKM20hwg1r5RRUgnbPynqL5zuZaXdZKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX9Cc+bWMWMdqW
 NKQuADBpTv5qOPKuZ1FYHRQzFYuvuaDj9N3HxSm1Eofs/b35CnfBNa+etWt058oyscB4ubTMC78
 Z610Qs7Kn99UhJHh5uo5EIE+OFF2NX06XZYacAUw039kfH4o59CEjnODFVanhyVFMcR1vYPqIK/
 LmnFC/1abaNLewkOWIfdbyRtTSh1ZYbjIcQNfD7g9ypVy8dEDIxviohu0X9vfcbKIIIuJyGIYlS
 wzK4ShrCrgOVuSjLUwDD4puxsCn1qIo8L4RmdtUdd3iG0TS+76queSdDgeMfL7OT+dxdvv8XPiB
 mxDrfACNIaSclGdhMZjh5thryoyGxvhlprXCLFCXTdo1qc4HZ4WCq/UzIdGUYvRmN4kaYA2b6Yo
 XriKU0YM/v38HR+X+AKAhAEGWEJv79d9TLX/LKUB/O3Q6bbW7SPFbtdU4E0YvcJlWN7oipnwVLB
 P3oIeJKN0HmhPwCVulA==
X-Proofpoint-ORIG-GUID: OKM20hwg1r5RRUgnbPynqL5zuZaXdZKx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX5B8SYpvtTy3b
 YSV0Eqh9R0aovDep1FbBewYIwxUT7obGAji4sLnOm4ZVXKiw0vahslIWR9fXkcY7P1HgZ1vaECg
 WmkDwpbS/VCSpLk8tCIFAYat8NVFVk8=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5b77ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=v1ZIPYeosOrn89kA6pEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Add the missing power-domains property to associate DISPCC with RPMPD_CX.
This is to ensure the genpd performance state votes on the GDSC to get
propagated to the CX rail and to avoid the rail under-voltage conditions.
This change breaks ABI, as the power-domains property is marked as
required.

Fixes: 85cedb4e0c9d ("dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a533b45eec2d8e7b866c3436bfe6f80fcd714fb..e9c2326adfd285444257b96f5adc68e27213281f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -37,10 +37,15 @@ properties:
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -53,6 +58,7 @@ examples:
     #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
     #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@5f00000 {
             compatible = "qcom,qcm2290-dispcc";
             reg = <0x5f00000 0x20000>;
@@ -68,6 +74,7 @@ examples:
                           "gcc_disp_gpll0_div_clk_src",
                           "dsi0_phy_pll_out_byteclk",
                           "dsi0_phy_pll_out_dsiclk";
+            power-domains = <&rpmpd RPMPD_VDDCX>;
             #clock-cells = <1>;
             #reset-cells = <1>;
             #power-domain-cells = <1>;

-- 
2.34.1

