Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF503FBB4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096290; cv=none; b=oVFjZ2Tr4hv/AOtIXVkjRoHtMOi31WWBpBgtZuMluiiCgYjgrm76Rkbk6nroh9Cgd53L4HKhQop0deIZPN1mXHgtzda1qUia8D6qPdsEjUGVL/64AGm49aKkPS0Jedm248w8xT6fH6NW4s+pCLJouLkYOCPt0Bk/aNoD6qZnzIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096290; c=relaxed/simple;
	bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nX+izwbTBnQOYOtCqnHqT1wXDaNUvqJVhwt17w/6wJnfAN0DQjWFlDQX+1z0hVQIBiq+foQgmT2/vhnKBcbu3xN847C6rSbywaMX05XQWVEyRQJZjaLKs9BUnfGugpPw7SHEod5IDP1tI0HW8vlJIe4BtObXKUCiZcPiFUSuKSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0V3jUV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dm3gO2Qu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0V3jUV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dm3gO2Qu"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6779EOiL1064630
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=; b=V0V3jUV5Wgr+52zP
	ed54POrbscVsZyD9gsOxScA0a/lqUbRML9GFbl0XHnRO4D5gl3plhCjQTwEFaGcV
	GY/yWozJaViIVhwvc4hXqv9PE2oV3g8xyRuK93CJS8hWTVg7RyORDLTAxZpkgOxH
	nz7Ee6ZoVC6SVqN+EpUjODwkLD30SM/8msveSPisL5+IWn+09m5te5SqnBtcCnQn
	4BZ9FPUU0QtVOUXoeBbLW6AQKtvIyNmNnCg8CEq3wgWk25WWxpVt8vqaa7Wtol9U
	HEm2XIw/1ONQIn6SCRU9n+niZtL/ZGigt8ZWc58lZrkmSFb8I3MtY2tQ3XNijaPS
	Dp+osQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb04b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:51:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848544a8496so3616024b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096286; x=1786701086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=dm3gO2QulWX1HJsz/xX4yzfgy9UFEDBAzkOuQoh9ngXrMEqTPT2dGzrzRwMQoa8w4M
         K/2F2oY0dztMV1mgutlWYqqZa+iljujFZGMKIdpkdzPH3rALn4dGZosIq2IJw1Oe5Ho9
         eFs52NJuHo28SUruezMFQgAyswHfWrJOaP6L6gkrwzzE+w5J78dszM/u8ZRferzR7heE
         kfCFWK4Rlp/ueLdH2uxRnmPsXJgLRzN9NEc7XGIZGCiJBWOdvlVmoJkc4p70tS0l4ydm
         +zmrslLoi11LawkwsQ7P/Zfp3OfEd9C9ApEaYfRtOcHi5V15RWJuULYFSiduauY2g6S4
         kj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096286; x=1786701086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmhTlsH9IlSEOdBu8T9ac4bE+ZN/wrQucNg8DtCyyyI=;
        b=CqevgfOhrynP+xZ8P/hn5ScdRXlCv7Mmy7orllmMpdh/No1XKsklpYT8pKNPFRtZMZ
         ypDiWjZzPFfSLTCq2lKqaXMxVcrIkCv3PHkjIIky84XtZqF6cIfTbpxQtS6bugxrFFqJ
         NcFEY6PjLnXPlXEc2z0y8eekWnhlC4Abt5RURzVFZ78CLqXbqC7ALayQmhmiTKqG8Wtt
         339t8m2Xp5lsDLsS/visphksav7R0fu6WjC40WknTgIbvNozw5owayofdWqieJTsPAux
         UnoT6MoXj5Tm3YDTp7j72sgz4jhpyppUwDq7RmeZtUrR4QzxSQqGsKEuu7zzBgWMeKaw
         E6cg==
X-Forwarded-Encrypted: i=1; AHgh+RoP76er+24wukZrd1kFU59nVJAKQfgBi9TNE29n3DVf1lcQXS6dZUFd3BRAsI6kuGWKk2L8i2dFYfIcB9ZL@vger.kernel.org
X-Gm-Message-State: AOJu0YysddE70B0Tcg6vBtpxMYAKqasvg7GzaiAGMX5y8RY6WISXpE39
	TK4tQQSiO6WHnQGhTf+4whJobMmLdkmyP8xMtPL5AHqKtohZF1viKxPddQlbcn40qh1Cuu0jMVU
	ryZ8cc562pJaXP1Por7uPdYlZGBW389cqmxu8fM4zJxOL/gXBvO3fMqCgDUhON9WAM2it
X-Gm-Gg: AR+sD12rXwanydjq3HAWB84fuVgilt4TQAjm5LeXvKBUyHZ2+WW0u01hIPlOxfeOTHQ
	QDaZ+wL5+jB08XdQCdabYz745Vocn+rOfxrtQBuIBeZu1ssmIaeC9gpVzJTNkW2kgiY+tnQVjVz
	LqF7Eo2cr/SkvszsOlvPxgc9zLUSEjrN4JpHT+0P+cHgSJ8HSrLp3IRQFtW2nahkln3DEqkTfq8
	Wol34YMkwV//rZpQ/XvKOvljHivL9N5V5696go3MjHpEWJjsT+Qvy2AvNGXPj/H5mmxCLfgFMz5
	5R9jYZ/SWXxGkxklxTtN5mPSsRVZjSudpNZwR0aKMYcFbLvdJLsvtGYG/PF7fz8bAsSLGj16Xzq
	KOTDXpv6hakDf+h/ttr96mErW1007YXHNeNQKhcoUtMCLYSI=
X-Received: by 2002:a05:6a00:10cd:b0:848:8445:6956 with SMTP id d2e1a72fcca58-84f4fe9f90emr8430212b3a.18.1786096286227;
        Fri, 07 Aug 2026 02:51:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:10cd:b0:848:8445:6956 with SMTP id d2e1a72fcca58-84f4fe9f90emr8430189b3a.18.1786096285823;
        Fri, 07 Aug 2026 02:51:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:25 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:13 -0700
Subject: [PATCH v9 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-4-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=1201;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=xfSeMIln++UVhRK65VIx8sgrep0LonxwAM+JGGCbE8s=;
 b=xbyLKWpl51FuOlCPGi+JKtVv0RFxgfKtfffeutIKs+gFwmCplAjYi7HAoqDBksiX+56T4UV1+
 qanA3BWmJW0BwDHTgzCogepMUUgzb+EqZIk3RwtycHjuJglV5UPWyxB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX/HYrYvo539Bx
 eYamre2G9oelhEagv0jL4N0Uyr9lLL2mnUAKSIcVIsmWmLdyJmm4c6uik9zriHrC5Qv/mzSQCUi
 M0pOSSPuYzUnMnujp+NeUvP9K4cJuPjTFlHB3pgbe/k6c7vcfQUhthWLYOdU2gaJeqLVmpglHcE
 XNs9+HzwS3ZdORciFQ4XdvgkyOV8dTSexNXg4fL65q8jnfjMEnpw5QZDGdyIS2rVDVxl4jFDCVR
 UlksG/O0L82MzKhkG+yvNDJh+if7dNioanQxwx/s4yfDAkiGoNrTYL2DIc2pqPzG/8SlQst+SqT
 NKfUWH1dJ7n/VBVKZHk+vuzBrZO2S5YAfbaYStOfSnucBGH9V1DXgJmuu1f/7eb7tiaIx99ojUJ
 XVv51T8IdzVYuwtXgBuhdJ83Nl6jBgxCUmNRuLKOvkneQBQeYciK7s9vTlBAo3dsRmgi7Tq5UZ5
 VBb0JDlxnPLWFjta0XQ==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a75aa9e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QdOup1CusybIpKGx1HsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX2pHzl/4mi2IU
 tKCEACJWxs8f3y/lY8zdzgf0dmV597Figx7pALe+nYBt7vccJxOy8LLSmbz+izDO2IH85cGpJbC
 1dfy7oBXiMg8b3rbMOmdHNyFVHx5AgI=
X-Proofpoint-ORIG-GUID: f1pOQeGHVscBkDVpnWO5PwsAFtpp4Q10
X-Proofpoint-GUID: f1pOQeGHVscBkDVpnWO5PwsAFtpp4Q10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070074

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

