Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB22E7391
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713196; cv=none; b=Tgq4nzqxlIVw/45BxrtQ9lIk6HpRUVJOC3pe6EYJ6iMIoI8pQsug7WKEkfb9TwK09+dTjur8inKd4WNmoW5crIuCLMxgVF4j5T28YFjje/XGyyZDYLrCYjPk5J+JIehUGnVpf7srvq+huh6goPpwZe8J1Dk4niKaybvlH4UaTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713196; c=relaxed/simple;
	bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Er97Mk/bxSafTg+7C/RNV3qYvnQU454CHpRpPv6p0HW+9Vuzs9PFPyPz05+isI97yQelf/25dVxgtvH/2m/7iapow9utDoNpmwWaaFo3/d/HDJtY8JMFVNZfXidFm4/M8+Tw8PeldeiTC7m32LJ/i41aZmYGgm+8ZGrzcFXHVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1zOxJ9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hev7aKk/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1zOxJ9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hev7aKk/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q06lCZ3469764
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=; b=F1zOxJ9rMPnZLfEI
	9329WsDEk+PDqrJDkyh1duBhitRy9+xtgJMODZTOoawknSihk3DQDs23kyqoqxjA
	f6pouh3aI0vdbEa6cC9/4tMB8704o/4qntNT/XkOhulsSHzS15Ox0x2V9FZh25u+
	kIzf8Yt4mDmB/By6MWR8enO6zgPWTaPvMorx3VU4CQ+Rdj2qLEHlIAZP/IFsw4gc
	BGlYG4qE6u/2H6dGopNe6PK8x0Mr0dd2kTInayt4dzFASqeBw8I1Ge9gLBQqGWDa
	dH+HREqKSRfrFY55VPDAn//XBalBAZQPTXCLBW5Yy/mr2dYt2roVMuy/CfGSYUfg
	tFgPYg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9bkuay1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:59:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e6d253330so810301a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 19:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787713194; x=1788317994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=hev7aKk/8qBe8V93jvZRmrvGM9T9FxopcFjXo+qolqjKGBu+56SWUaUlWAqNlhsd3a
         a1+HRXithkw54byvhhnGd4xKZBLr9QhNfhCclfL+rOW9EscYecFU/phgQw1Honi+SCU6
         nWpGmEpTqkRzd8+K+k9TJsTVJQK82ixXv5YCiLJ3GkavG2YhcXevGQhbxedpeB+BZmJE
         Wvt3fF/NNlNNEjxaZANuee6HADCgOGd1geVYWdGIQJu9Y3qS/yLktYu8GXVYhI8MfrHp
         0hO7SpGX9nrIR9A91qpm7xAQb/bnaSa50orp7Rhhjq584aaRdtBwdVVBIeoGJzKPC0qz
         k1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787713194; x=1788317994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=k+/ls6IR2qr6CNKpuiWFWNxXZb74zwj3AeT+hKd6dgiusT0fRGMpzJmf0AF2g0m970
         2bRODMSLPRrA+LGILF67SqErH13LERN5F1rXAJHfy4BzsU0+bwyhzLw9FARsl8xihky6
         lxVn/Bq7GEzX0Mdbjg5b7wuGJITwmogezpKMLTWkMHIut2K6ulKqL20UvJwO18t4Tx9/
         OkWmR5TUdu/T6mYLwiCJsz2y2UXJw5VaCHHK4mrMoMvrohFnHxzaQqPiopuSOaagcRfG
         vipT+ZpUYoEpD6CuUZ3K7Oa1c6JOrhqBYulLC64p5yswryE0DFZiRI5D6RYvNhVSvlQI
         25Ow==
X-Forwarded-Encrypted: i=1; AHgh+RofSy2++F8E2ddm2v7CYT7vtimaLb3Vkl6GnMFx1lS89cA6wSPVV23VKoF1qsfIpqA5+B7XGPeW5GGt8+s8@vger.kernel.org
X-Gm-Message-State: AFuF++mqljLq1SZ2J4p/ebPHMszBpAHhjX4dumn7/0jhvHBc2kzQ8T3i
	EE7N09YGg9ppNauTZIHiZ0ybfiW/Jl9rg+Wy5tHPeA5HkY7ASrxVXbV7spHrp9Z6kiXaGxOTFgX
	H7FYCUbM1Wf2wEjgZDb9qGBDFvTdgZwZkuGXk0hVfRtmMDnbZzTCp5zZWdW10SQ+kpi1G
X-Gm-Gg: AR+sD13pbUrRtkTdMsnZekJsFSiiEP8JWpOmTdnKI6PhoxtPm8kKqlrWVJ6tJ4yPj0J
	zyOPs9n5ktPi/Z+0PEDzlK/HJSgn/pcE0wpOwKiXi7xwdayYZrHPJPrlMtdqDE3WRg5MjQiBh7z
	r8W9rikeTvC+IG28uA6lGktdpHFvYmumy1kJd5JgDr/wU4q2lLnQm3DiJ/H/C6Bitpc4mlVdmN9
	Hp30UUlmAaSV4aPdLL2rSyRRbF6gpo9KZdiwNifsvsCHKXeCdyKUU+Z+O42gV56X6Ni1MQZrZNu
	zWhBd3BKCSa8zMYLPf9WACQQi07EZBP4NB/TTTukKg7bycJDjIGMEqc+gBGg9F92s2zc01en/WB
	kGVGxUDNze96sWCEt0BtohuQxQi/JWyX9cTZquldlNjoCISs=
X-Received: by 2002:a17:90b:2e0f:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3964543b889mr15530113a91.0.1787713193972;
        Tue, 25 Aug 2026 19:59:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0f:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-3964543b889mr15530076a91.0.1787713193566;
        Tue, 25 Aug 2026 19:59:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20036sm5222405c88.5.2026.08.25.19.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:59:52 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:59:21 -0700
Subject: [PATCH v10 2/5] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-glymur_linkmode_0826-v10-2-56ab597d77e4@oss.qualcomm.com>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787713189; l=1201;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
 b=5fWFuGdu/SJ83HXD+pXtTrfl7H4aGf5+eAShGusv6IQuu8lVR9R+sLxg/luwE1yHo9CbvtWHM
 VlL5mftUliPC/35RFaw4uMh0YNQod8fEGa4eMUCUPXcZS7Gt+4hv12B
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: bu9SpbraQN1B32dV0akyj1DUN-fBwZR0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfX8EUB85bjEn3W
 NXXIY32dJMV0YP3XelKBq1w1IrYEF1FIE2lmoBVyixAxCqbCBGE06+lXtdhiFJPtdNJD4T6+9Nx
 fCCBVp+2pDGCodmxtWMk0qgSyFkkDT0=
X-Authority-Analysis: v=2.4 cv=TZGmcxQh c=1 sm=1 tr=0 ts=6a8e56aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QdOup1CusybIpKGx1HsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bu9SpbraQN1B32dV0akyj1DUN-fBwZR0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMiBTYWx0ZWRfXzgWZ6AGtOqQF
 Qjw/Jj0shi7tObgOY3FcI+Q8SPMrIXba/enQA3HNiXclbHUZopSiBpDP9VIagJS0llnncGgLZPi
 SaMIGcyXdaGlZ8nG85+5eVZ2GpEsVJF3wBuXkZGoOJVuBZL8KDziglC9QoJYUeeIlhshXGnOtfz
 tlEcKIoMkxjGKJ8+Y6oiFLz6ECzHETrZmRrOxB/zTyWPECTky9TTXdNLRV8gzkUfpa4z2YNU6tD
 eQmFPgL7W7GBs8xK3+3UJNndTj1OOGtMbBTCdxM8IwUQU7HPRdcf4BJN7b81AsUdBo/SvaG9hJc
 wcQW7ejZVGal9J7coJasyQDGGIrBCSJUCQXJg+U2/0I+dnA5skGzQATh+pxZE7JuHjQk/xLdgE+
 ksbH/FEx2bq5P+7hpvKe2zONfaozWWhks1KL8uFwP9uixLNH4EqznDG1/S2sRmwl1kANyVvmJiw
 QpxsSusdBHy996YrodQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260022

CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
vdda-refgen0p9/1p2 supplies for &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 44766a73b0d1..b8e3fedcdea8 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -29,6 +29,14 @@ &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

