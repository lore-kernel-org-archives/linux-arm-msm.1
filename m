Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A4385D84
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273548; cv=none; b=rsjDX8mN1FtDL5NLOvzrljjDA09n94i2DfvLbn4ZoL/nN9QY3Ul1aft+WFRl30BTMSZ07gDzLpC0m/tXlaxJ1dQQ9x5bYyYKtzv/pWRfkVi2Pn/bUQIT2Px5flZcRX+pUUv810GFZUO8mELKmKPTpiScCctPvRLab1q/t59sJn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273548; c=relaxed/simple;
	bh=H2fkpda4QTDXLjTbUXq9Hwo6C3IDYqfckLGQqzPvBUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BspXyWYHjWWBZzZ6zG5/9cJ/cTkpAftzr17aWcRPMHLvfmBDmqFFJVGtRc2Rp+Vok2CyzHFsZE409LmzTdf2E0ccZVV51X7VMjqy5vM9N1RPmA1cuVKvSwvSw/vKsBcxnk7+47cca5PIKGCq8vzC7CPOxw+AKUDF++O+vwcuRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahfIn769; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9ZI8Cmd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahfIn769";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9ZI8Cmd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cHHo2098532
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=; b=ahfIn769zSllGEhh
	u/lPblN1sd6MCbITTLZK0gGRHLSBZZ6TVyQZRalrius+Kmh49Y14pFzJz+64o71H
	WFAFtAPTy/wVOxvKSdXRdlslgy26x7NMrCextFSesvCmjCQQzDUuPOWWUosWxNNI
	gicFzdbDhKvADzLSaLsHG6C4zOCnRguDwEBrVD+RbqDmGErasELe5FQDHq2vPpAG
	CSFgvlotpT8AIl70/OMpUi55BpzAPSWnXwBZf2dkYr9WizkUwkevbDTN1ffSADFI
	qt0V4SyQTGga+TCTMdXB+6JaXbMITVl7U5tFRjiLBQuQXcZ04hOBdx9At4uF3u+Q
	KLnqrQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6jk4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso80557355ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273538; x=1784878338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=T9ZI8Cmd7mRIgObPn4dtQztQIYN7vYJdhNXzj0ZQlH9UYNV6gYdtjbhL6terNwAvde
         4Vvk4UWfU+42ybewpnUI//bkMdit27m9sVIv4uZlhaZVaSNXgnPVqpcJziQLCk7jq1uP
         kuV5I0uzPgT9tHp4j9oT5T4C8lN+R38fNumiTde+n0T18djjlqBjO2s/eRHPBfJxDhUV
         j3vK+cUfCvjprTJE6LGSXPeArawYFMfnf6X3GnXKukZLFgLgS8XYldbrQf92CJSQ8hS1
         3wx7GYD1AY89MpkU0bMkjRtb+ghPgm/w2YMVrvZ7YeWPnldbDB+t+QKoinE0Xf/+ZpmY
         1vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273538; x=1784878338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePg30Dj860EoigB8zsOGgFL9B06gE/0H9SqHIRAB5OM=;
        b=Kb0NSQ3rdUSmSIfcUAgQBHCWOvtntoUcNfjwYTWnDOsxatLBetRJIum70uHXE2pLBJ
         1vGXRHaXXuTqgxeGz2M7oBZ/EPzigiIIt0nG9woIS0YrtUCWxKCjxxwB98xCPspOycqp
         RUxmlWQye5iRHSttFCuzufYTuZ38JTwcAMP7eS7z2VRGNMYwKpURnkNcqYGFbQxqckns
         N6V4QMFP/d/Rh8RVg8ZwwEjCAaVjpoYIizxhnDk6TkVm1wAran3A9nPoPB9K7I+o176O
         lA8RuUE7WouEVYUqsZ05iXiN/Q/97nYsS0698zCjR1baxL4MhF841cE59IVdt2uKEDA7
         fAqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9tNC5ZjMvPrizxm6g+c4ofGt5Jf360ei6S4/lmxbRJbaLo4Q9c9W/lbtJEXlC5g98bim993uO6JXJdUGu@vger.kernel.org
X-Gm-Message-State: AOJu0YzIu94ecQdg/KOjAvDKAnkzMfucbCRvPVyKXw8oN40Rn4zPddCw
	SwcSSxYPG27T+Rl15lyg6ajuo5MOchqprPt1ESyEpbRsiTVC70nOYCwwIvpuC2jO6x2V2mzwBzO
	e9Zz6KHYXLWrKyy/QiQJYX58TPpaMBoQ1TrqzTEek+nmDPnPcfH4GqHCJBdlukjDJX20t
X-Gm-Gg: AfdE7cn/lPnFONdwSvx9X9Tzc81ui6aJQyHjWZKlGubQzNCllZi6GnXEf09/zJkM7ix
	4xEXZIPZSv33O4itsnf9jcehBrNugS7OckWU9kS/PS2ZOBBbNRuplRfej3uvgB+HYRMqG7cvRwY
	rSGOI6w9ceDYH3+QkU5fjVvvjCPorp48qERHOz6z0jFvV/QcZbgLVLDe20udN1V818/3YqrKlF9
	kT8cCERfhGdGpI4Pjlpp+hSR2bmcVojKKn5Dca8IKLFfSz+rhp4IJx9U64mEnvdXzoWHwVk7fCI
	4N0lL7kKO1vF9FsVkEIEdLtP+ARwe+DkYeC+j925K8S5QyZm0+mdbTwfynnvRbT+mh2ih7IUJRD
	t1D+/7wXqDcthDB0YrNDvbkI8
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15268215ad.43.1784273537952;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
X-Received: by 2002:a17:903:2f85:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2cf349f4878mr15267965ad.43.1784273537506;
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:17 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:47 +0530
Subject: [PATCH v8 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-3-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX/8gA/ssMrAwV
 pJk9ZxjPU6FwWcZwL8ZkdLMpaZySKRDjEN9TESNLJ9r8eBwMEb/4J7/SSC21qdIQGTMziFNZcKT
 FUJta2T35QMC9Im5GrPl8ikXi9AtCenS5ofp3/yIEmO70bzy+wL/lQU0dPzrGs9cyXDoIUlpBAs
 9tBf1O3hSpXYFugSrgvuoXFmC/NEls3w+WDPutd3kx1crK9EVCRElnTU8YdtDujTWTRcfYQH30Y
 cykVkRTDsY4541PowJ/CxTQMPYOdj3s7crPwCIQVJR1tJXd9Uk2zoN9dKDm2k0FEioSSltvpvEJ
 qgp2RZ1qlO0mlOX+eJ3JGC+MjUPXS8im6NLBIitzq31vDGrjOh5DGOe4h8HZeDUaMBDu5Yzxsyw
 wd9i5y1UpxV8WvpLDM1LjsSeSyQ0MiD7QUoKl1+oilUgqFNoWbynV2C6AuT9ceeJ0rpnoPsXyH9
 yHioWGQgRC4yYHCmAAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXxLaZ1SnSjOAL
 qGNX3JdtCXka1U47RYKc6oT2W9MSUtYjoxTusqTmueFlGlNA8lAkFpCIf761a4fZW4r74GGM5z1
 wilkEFDvntXoqPFLKZYW/sYCt3dtCK4=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59da82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ShYNch8TMVysSlz_CDOQ37-FVVNPC-fo
X-Proofpoint-ORIG-GUID: ShYNch8TMVysSlz_CDOQ37-FVVNPC-fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c92329889538f0d79f7af436898e3ee278e361c..7c42d6c89829e4bf5a2ade64018623e49623462c 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1892,6 +1892,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -1971,6 +1976,11 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

