Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6041A54F
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692744; cv=none; b=mRdg9ld4tyG7eqJNx996JMItj8ogoH8rbJ/P+TkfQDJndKc5XwN4W1ROvhNrI0g3rKz89VhjcZx0hyWBfFAjBPcGDQ4ZjHP+537owifMestW2GXqxlexZ0J7TpfRwHEuUR0ND+jA6hQpslrcRNHyPeaugHwwUZTKHL9tcRQ3PMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692744; c=relaxed/simple;
	bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIAIs3mG2D1Dm4Hthqr3aHhUhNgJUHM8zTyMzRJdPfQSzGwswCrte1dL0/e+Lt59c/sS7pcd7JK0azp0nLmdV5VQ/8ERGUbLm0ChCBg3/F+/2YjVlaEjKpF31C32zRLCXQOgn5YZ/NpI70ENAoC5Ru5YEKDYFY77vNplFedjazI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqyQF3qY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAjN6eP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqyQF3qY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAjN6eP7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QZEc669320
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=; b=ZqyQF3qYsoI0iga1
	P0dUrddoNGW/Ab0986gmxFI6kCZjk9D4aTCdcl93gkZ2gOTsEG6zttj+vk3n3sHB
	yUvoH3WK4ACmQpd0rPzTZ49Sq1QiErQrMef5rdf9kgWxLaNU2+lb/iJezrienF7i
	i8g503thezTB+pMyNyqOu3rcpyv+IFNrNZrbpjVstKQp0oDTBsaaB9yL/mFzalz6
	C8V9gcQnN1b7BIZl4McYrwLCnDa47eZgfZwEtiBoImeoOqnJQuCnuoDybPbU9FMo
	09GAHagxNwe4H5BATQW0FFiMJ+VQJ2l0JFX2lUGIoh+Cvz4VCKD2uMmkBKbIllAn
	85WIJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uua2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so11322305ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692731; x=1787297531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=cAjN6eP7HclKsxLak5T7jSOnwNKyoTm56R1GMF9aaJQzDIlFlrrmYHjUXa6hFoRhaZ
         116ZvfHRNj9TLVyle1pNF2WXoDWkGToE6vJbBGCKF3fqHDRlVpviUgF4ZztHN1JuBEeD
         JZfS5OBBySFR2vvCBbGnUNRrjqRsyEzhAXS2P85Z/J7qHUaaKjgG9XdWC3y0ohK7iix8
         fJ1wppo4VkyjuLR/qhuYQLn2a+ctYNGdgKzEauocUq64O/CXObeELg9QuMOXarvNG0J0
         1HenLHd2F+2laE5MVxZXJ/nV5pmJtIYV+HiNcVTjHraONTOKNXp95cPDjLdGneKYAsdK
         spFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692731; x=1787297531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sx6lBFvEGNhy/q5sHRGfQDQiM//S9qhbvL0j8qSm5v4=;
        b=LyMhweMhfMWZXch8UE4M4Oa565Ocwkx5xwT7C2GCqOmU9Kw9wQeUWVwk0Mhl7m475i
         1DBGlfuUen3CIh3tr3WWj0lx+RyUAxOaMdlDVuC6tRsGf10FAu//xklEdVMztyzVT0RO
         pJ2owpoCdqsI9E3QbE/F737kdosK5V5r0zfgonD852ljnr3frz7AaFRs9Dt+VTiWU3J6
         voOpcBBNlJWQhSSzDlkvlVTzn//8q3K6Sd/7hzhiGCKm2+iZnNruJzwfRlpPdI+qWxLJ
         bvdasDTsVn6XpyClfMgAjhCMB2DP/+KVGXAPUuWuryco5phUzlJv3oTuNOZJ1EWwRiwO
         ALZA==
X-Gm-Message-State: AOJu0YwTXG+wLILt/zRChQJiUpTWGkyqBaLOFCFCCidGIYQq/yWQQck/
	gfHoD9ZnOrTj+w9LsGEHv9qVUhr+YmeA1I0I+IXV0MiNmE8fSxOBycYGjcEGoRybX3TJt+JsiUF
	YU42KwbBZR0YvFS4+t3U8Wwb2f1ew1Cq7v+oOfsIp2NOQltzYv5NIQv0//JjJoW9aMHQB
X-Gm-Gg: AR+sD12/3DFl2L0gzyRT4UuE3J3puFoVCJqTmfzXOQsnI2A2DPjIwCgwXDPNb0OaJ2r
	uwpjhKzEGbyTNaZJKnPbpij8tf77y1uGZlgNvEIcgR42cXo7vMlLM3FoQFCzhpTQD1DvGJ3SE++
	t4pKZpK0WmTKqhZRvMBiQEEKEq1HvAN+1EId88Jgz7oNaBLGnAdnojqVdEljSt6nYVC4CppKaBO
	n/qeuUjbhZMNsnLXzx6U8t6Weyf3Zy3k8IDTD0N0EOS5SqDTPbn8b0ZPrTBA2bmHBFxZWMP+II5
	eamW9tfb1jdUJm89pAPIFBTbjf5qxq6MC+ypAoxiHsOokbT3pr6+JSOidv0ciTi5S8d+DRaruBB
	Pzy6hzChjRvsBQa8zB/ulk0/bW2idC/keXo9vzpGpOfUDVSzdo1Gm2fTBXD6tyq03LPlLLmnKjP
	tlFMSKnp5cWMmuyUtd0vI/xW0=
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47931025ad.14.1786692731582;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c0f:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d3b0eec2f6mr47930065ad.14.1786692731101;
        Fri, 14 Aug 2026 00:32:11 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:10 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:32 +0530
Subject: [PATCH v2 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-1-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=973;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=gHxGYWhnicYORaElGwhsc1d3PMvje3as8cNJCACI2hM=;
 b=I0K2b/N6iz/Hf/cAEZCNxofz9Q4I9Wd0lnRLDoR4xw7gpjXX9Y5mTLDuaUuwduG/xIi8+eCO4
 Fhxl4TnLyFUAy1u4Qn15sFvcwtEhWmOFc2g9+d78zMwYmEfpYDN52DO
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 82fjtIX5sAu3NEfNyBAuQUJnyacYDJBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXyC8eccs49wcs
 bM3LY3eaS/d9XK2XjF27THsPsxugai93A2RDWDA33/3RZjsuBdMlDEeVpLedfebYX0hGySW3TgO
 F6cXDQFGned8q2PIqgirxMKcFpUzB5092Tdr91V2+mwT9KmKssa0HkFtuR4fDuGuadcTsspOP05
 5G/oMh3C3W0VwVyY5QWTsWBiycAY6Oui6AN1+hm/RCRxqClFkbv5+ILSWEdr/oAxtuB71L5qOAy
 IsBTFRQx7KOCKNKxDgaEGFayrPc47QXPAhAKdAIAI66makMm+l2nV4AWlAYGVuRI2woKH0tIfgg
 ctQ8tq/lMdGbtM4B8RNmtTc/iOO3dRG5/NBuOyqqQ+cK8AOro1ZJJa2ADPvCt9rf5+1cccfMwRo
 De6mRWTY8uSzK8/hOFC2H12G6wWbgdWd7hyCkb5jUZt+Q/tFVMqE0sULBA7z5yxjQ5QxnH+TjYe
 1OZ3LqyMbrOkOfgRgsQ==
X-Proofpoint-ORIG-GUID: 82fjtIX5sAu3NEfNyBAuQUJnyacYDJBj
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec47c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6t05LGSwh5SlIrDCal4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX5rG6iunDDgMz
 aozn7HyOD6t84A6k6Rxl7PYlfnDC56+V+BZMWo5zrIlt4iIi6jglYtowVuLczTVWySX7qv/oSfD
 qrj53Ccu+LK5/lFMTOIi7KMv/uWxz2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

