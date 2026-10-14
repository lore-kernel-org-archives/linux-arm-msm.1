Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E3457E71
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960084; cv=none; b=lfvBB5qt8/o1J6vB/XuVCNkxdTUwbaZZw92D8CMqp0apqGUNSXrrchB11YOGb/EzOFHyEJrLMEPzJ32DEugTyFARjojUGrtBzOTJvSNREhSbKKRPNgdb4xfBKLku6iElm0z/QYNR5/WyBjvgVWylTB/zkJwBy9jrbEtIkgFI7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960084; c=relaxed/simple;
	bh=IUYtuubMhhcN1ZF6PNMCch5PozFrAL2XyBYbmMT89QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAXBp1s+DvQrsC/0Spboua5aRSoMJaV61Zf5svyTvQtEMLJTDQ65QdJ/T9CPRgPw1TsP7ZnR8Cptqu5EUTeOvvDFl3ENEBltzzhlqBJC8k8mvUhUGPy/dM5z368cxBFJdRRyx/zqEio9T7rERecBbs9R2YN2cS2av+nNG1zPp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pU71pD2R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WQszTfyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pU71pD2R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WQszTfyt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E1KTRr3018226
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6Ps/u3Sf1Zs
	xovH3oOjCRJifXEv1rKPvAC83aBceATE=; b=pU71pD2R9FOq/dDRpkIqCJeMP3R
	I//bh7lZbQPLm/JjKt832au5NJ1einmbZSxO3/P0nNc5oVQU185ktQXmTgLQR+fU
	j670BJ5Oh50aH7MOxXVPeMKmFV7AJ+fm/+yVPOLyK89e6Livrta7DdLhEL35UYQo
	gYRTOXuEQr8RHWaXqqygm87m+yqJPlBRlN5VUKZDeg0QPkeszztdskIq2lr4sIQZ
	nYKEH/5tkyl4296j3Q4YQG4jg8te0uleZRcZNJ9XvrOIUlOgfQQyEPDgPKImd2fz
	KdDy9bx4sW1YWcTRNCllEg3P2xQGCbiA+cLy+SS0mP6wJun+fWlAb989AOQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b2ucw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887faaedb46so220445b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960081; x=1792564881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=WQszTfytCeFto/YUm6Gy0ToBsoqwXLgZLl6GRBoZaDIEBVLzOtVicBcOUCcPotMLki
         T6tFd9afrqa9g/lwLk8VfUUfFJ2blnLQD8JDtyLmrgT1asELARdPxxnprenJVMkllTW6
         BKGTTJnT68oH6u1PxGXCyJtr9JoD8D7SMf7N08+TXldrs78mv89yPYpl1EU7Ye58hliO
         mJhogmao9GjLA9QIES+1XFRtU43bZqfkdb34lQZivuFIlIzCFRQrRkhljFTZeyW2lOYR
         BRmMSHSjD+Esp7xQtH6vww43cqznbBQesIJ8OwZWWtq6M0ho3zR2E5DurLybXMW/meJ1
         OkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960081; x=1792564881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ps/u3Sf1ZsxovH3oOjCRJifXEv1rKPvAC83aBceATE=;
        b=RvmZRRr3xBkzgc6GpI/jDQamqeJFsJ2/BQAWAWePGqhdLwOBYWjYfhXYdkeK0exhKJ
         VhhLQ8OL/Ku/hZRR6y3rHBKfhuGutSC3mX3ESzGMnSZ39g1iJQV5KQxtrBoARS6lALlg
         dEaoUFyeu7PMWupmrB9U+dG9QeLOUK9MeZM2dOgN+r9K6cv08qykd6HuKkDIC+Q0+nsv
         l/V+pmKKMyXYD0QzIIJyVU1hOv5j4PIe33R/XCuxvL0vmjBSVfvC4h3nQO9Lq+xwCgXz
         Lsb6OP8VeuNaEKjWyVk+RnmARXHGBcMt0NhRn0zEqJ8DPbIErbVkKxWmWt35zCyjwQZi
         wX9g==
X-Forwarded-Encrypted: i=1; AKwUvBzOOsEYrjebyurBcA3QhGDCa2qFNHuybwBLjXCHETQV36ZB3teKeLFvlC9r1YwjA7cw8ENi1KFBNdF7WwJ5@vger.kernel.org
X-Gm-Message-State: AFq9FYLUapaOrSti3jZiTP/Aw3OkUG/i2dItvKX4fIR6p43pMiljrHwf
	se1MLVjBdT4hbPoHoqS7Lmrjf7S+/Ez7OQ2a43T8iTQCvjjGh4c9/RrCk0/jw0M5OQdIZu3FFc/
	2wlbx8MO2F/gME+RrIUz8Sg+5fc4G1V/M58XXWZsxLQOiGCgqt7+8FNh+XysWI51AKgQr
X-Gm-Gg: AYBFou3B525PQntofYIC/i4mcjM36qsqNqB3XcuDZO+mhvHXrlvkDYiCZ+ktZoYf3E7
	EvOkKscVBL6HASiypXLnLd9bjdAAVd3wjluLZhdg7OT5h4EsRzekmCgF22vDIK5sdh1Mx3XgTZY
	WR25GLO+8T/CP+KmRPvm6Mm9dhke+JXJ4VDAjtgRzNG7iJ7YYUjLT2dEg/tqqZ80zcgjneW0vKe
	N+9Gebtmfn7bGouHbeFJGzi8pNk9sxMHaVgxS7sjAW/cUOgkg4TCvPlXiSQswaz+LuL+3QTBeVx
	2zUkxPooPtFGGMHTj0fnCdGH3QhvVSqJSTNIDzAbPxZeQ3t5HYT5LkfbLvGn1J0584sdMntZuIt
	igdMOI8laoaTBR43HoQWHFIyvq8qm2U66jFaRzdE5DSShz2cHYXyBoLPLVAk=
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638256b3a.29.1791960081472;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2283:b0:887:3fca:835d with SMTP id d2e1a72fcca58-897c78ddeecmr13638234b3a.29.1791960081073;
        Tue, 13 Oct 2026 23:41:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/7] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Wed, 14 Oct 2026 14:39:49 +0800
Message-ID: <20261014063953.549379-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf2412 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pTKKwl7rlpcWqDfdxRsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: kqKILLq9eiCn3cCVpuYu9cZdB_8gVvwZ
X-Proofpoint-ORIG-GUID: kqKILLq9eiCn3cCVpuYu9cZdB_8gVvwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXxpPKmKxLw/wp
 nSSb1n+sOlV9wzhfaL0iMxwLy7dieEPcThLrbbZlkmF9N26oKXloxAmMmULR7PNhi4t/ZdgnMr2
 oxZUsJFAEm+Dqf0uJVDP6UQzvGV9D1n5M7mGSq2ipDlPHkpmkWL1YfDCA9fAWWry1ASMPD/GDOM
 iiJCBsLIoDq9aEKIumE25LqOOeUKQQ3rR9Nr/24glBVsSjrff0YtjQo2ewiVZm9VWWg6BFHbicJ
 rbDlL43DRIiTtg3J2KoZ3KJUwR1h3Z0mSBsk1znoUtCoGayhfE7G7bGijTSq14TFuDvmpddeX3Z
 DojGOT7zpvkHuGB9Dcg5BgY+cDijZSu/KvEuX0kxek3lkIKfaKfWoOazoWBLj/a5iRWGQ6ZoZ5O
 4OvnhtyQuHhS8yI9xN2jVItwtNVPs37t5mQBa4grtXW+VAJd2HTXokDh79Wps6qqP+nzElSnX+v
 BqJsWWjXMlf0HrFFXMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX139M72QCc6o0
 RxQM0x1OwM37AGBjh1tsOg6p4TDu9f89RhC5U4j5P0jp4DYYZ46xWL2i3Bz3X5xF2j5gElj/W+h
 SYKWdEODYZHkjLtyqWUXbFRwhXhd0n4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 1fb276e498c5..dfbbaf94a7ae 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1874,6 +1874,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

