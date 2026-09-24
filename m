Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0904A3D3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284526; cv=none; b=l1PiqyTjRO0Q0kHr2D4sXpNFtclCiDf8Zgww5PuTu4Tt1J8Z0QbUrWGGVrIW1HRNXZhBSd1yi8UPqUHdJxObQU0JefKyuCA0El1DxY8cDi17JyM/Mk5uXGXs2HsR0dQCrfSmRw7yACtQ2d/9JkfPwyDMtI6kv1XcDVTUyyBhexk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284526; c=relaxed/simple;
	bh=NMfZqugoEO/0q2ugQAcHFhaYmO19tdYtxAa9pCn1gGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ob53pcYehf8nJXoOm0/9UkD+8Vex1ERCjeVuQZMRKpPphRCOWQXRHIz0MTpBqW6UkxJVlbKm1usSVX/GhhamKJpd+lx5h+6Ku84gsuhReIcAaGZIr/p/DkCk7qmu259yGdSB/WeM2XnVe790sCmOEqFZ78Lp1+/24lDZ9Z0ewd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m84GtUdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGX7mT2B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m84GtUdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGX7mT2B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdiiD2996408
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=; b=m84GtUdNnS3RSDz/
	2LcMPv/qnjHMd6nCe0Plp7P940I5ry01S6tnXMgIIZ4JgijUaB/F9l51/yvhErmL
	6jhZ6DvMjzIPuynDPZzho6V0mFZHBxQpeE93Kc7VqcxQhlyiIoyvQRi972OYZDcK
	VJJYrvTqULfeZB1kkJDlZXcVxgh4v/tQynmIq0hCMrqzY/LXXADTNJ5Fk/ofg6X1
	x5CRNCKDYbgnyhH84AwZPVpa3T7v1glpL2QDk7UtFrq0q9CXcUhewX3O1visyfMf
	A0MRxn2Wlv3wnnHkdGv2/dz/q3vwLF49FCE3uIrR6hQcwuj98I0I9ymPjcSrIAxW
	VV2Tmw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw46522uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so603188eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284517; x=1790889317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=EGX7mT2BvBM+UXgiKgeZFwWo/iHbkTcRTY/kW+XUu5KSEH4epWH0qKeH1ZWzSlY9WT
         HvUmi/cB6YUdBZpELmP7ZnYsejGnJT9Hii9sw4p61M/ECNOWMzvvoozJvUy9ThTGDZRC
         jWfZWfVyrf4fRaXvIEV97ZTtiyd7aNz8XbJonc2fchQAOGwpOk+8FUHPqJCTAeFoU95B
         7GvNU939nB+ploqx/8iAF1CAFqky7X+wu/0AQW4gl8M+Jr7HnM866948mSEHngC8vxHp
         kGG89k2DlszClPEmlXNuWtCnq0SCshKAC/tQXrnrk49dCX1zrCzkuIbuvAOD1XAHwHEz
         8l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284517; x=1790889317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGkBawBsWkDYfJFvup28CeJU80F1RrPvHMm0I/iA3OE=;
        b=Ck+CC3ISJbZS4sNUnwBQqSCfGNxPPN9IP/TA9/E+rtzfyvE6OyrOwCnC6ZBshamAiy
         WDxpVL1/zOOWkxu2uzznNDfHHX3vvwI1ZOBBgg5ieyR2P1xcORy0iBavopZTtXtFPZd1
         lrEJVXNLUrboPNQEUZQpA2sOtw5Mvehk4FMqWsJRa830CAIS8+tnNJw6+yWgPYl9u+md
         IgN+TiaVtTVYPnsFDYlGP/aYazCHkrLxiZSgOzQbaw2jgpyWdvq7OOcSVrJQ8gL8WAWX
         TMwWdLx4w3FsCNIZb1+iCUgO5AiaeHAtarmLEC9di3EHJL41xRjeFnTMmU6BYUDNf2kQ
         KOVw==
X-Forwarded-Encrypted: i=1; AKwUvBxj13m2yMeSkqIuVT5wucy8xZR7ugHRjHNXI5XE6GPsNClLxIRgKMkt0qSl2keb/WTnCkAPCHNr73gyR8PB@vger.kernel.org
X-Gm-Message-State: AFuF++n/KBlp+3fj/dyUsooJQgDhgjataxQPepjBieBM94Z6ttH8r9Wf
	0/Rl3bw+ykXcWpiWMRByyaVwGUY9wo1EntRkmrRmKieD3wdB68Ym6e5BPyfnhsktGkgL//pWCAC
	iqYrLt4+sdZRSmZs8ZmUoYmUpazkydFRHLwWbFqu780bibkRCGjR98bbKSMuW78nH01rMACe5Fz
	Hd
X-Gm-Gg: AYBFou2szzIm8HG2b57k/Qb/ag5tw9E4Yy366PY0yzA6ygxAWcuYAxejrcDOG2D6/OC
	Go06pgM+hRmW0M+y6V4guAqoz6kUzgT29Smh3Pcjh4tGJTOXnmouGiSBeAY2Rpn5auMGCFpdqNX
	lyPa187iD7J/kz+EKd8LdqoQnUKBCMppgofrdGgNgZ7/mA1pNm0f8yx2STAa6zgkp2lno1NW8V7
	l5bYbX0x8RXUVez9J7fumQLcvIgYCH/PI0SBXnLNzbrquQw8gXQv7qnADo3MAEFYVvE2yIqTIrU
	ILkgBbYOhF1RRqUpeCU+WPOf3FUxHUnt7WoYuUEOIqDRRJGYFuAEj9xbjq8n2UiHICTn3CG4gTt
	l1ByDbokvhC0YnBaWRIDcrGc=
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637774c88.21.1790284516714;
        Thu, 24 Sep 2026 14:15:16 -0700 (PDT)
X-Received: by 2002:a05:701b:280f:b0:143:7330:7fbc with SMTP id a92af1059eb24-14503fb7d58mr2637727c88.21.1790284515607;
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:15 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:33 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=927;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dqFAneSd4zL7363Qe2/8VcryWwTx+SO9Kj4pOL4oJBY=;
 b=Vebdhc0T+mrn5mzFGJiB8rbqLfgC1XngpTlhfJp4Xocf8bgEq3CCYSI3kLNcd7cYnxbcdvSi0
 6T9GY23MvQZBL0DnKWA447FGx116TyNTUJWbfajiYPcvipqc2JR7efQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab592e5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: qCEXJoZrVrfujkz8RBfQC7wlgnY6HeNu
X-Proofpoint-GUID: qCEXJoZrVrfujkz8RBfQC7wlgnY6HeNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX2y/uPQgtBWPQ
 glkOJKFQ4RMavVodcgkV7ssRdHg//0mlm9DWaVE7gN1KpuFdxz7icshxg/+VhPv/WoOZsen3l3m
 l5olEzMm9P11tzfQy6zOfET25LI4rV8YOX4Py+xPkBB0j2xRHjo7VVwOF7b9ODlUHLdEYxC0lwz
 CWAjognsSGfPxjC0QzJ/ZvRhXUjAfAeXiih3tDYkeFf6mlW5kP+SERWO8yvTLaaYcES/Z0WsnH7
 I8a2Zn9E/yXzWI1COKfTrHu6LSd/FTKYIrbvbLYtcqUyg+HKiC7G71NBT6/WmGURGWA8Mh3bcyH
 yL6J2JqqLWcroJHaT5TWPm3BVQAeVcvwDtylvzFloS/WHWl7dGoSYvu3+M2yrp86lQoPTek9FaQ
 B7Gliwfh7iKJjpcIo88dg+Vz6zYnjyiooYRquwZhYEEHXMTroeNg1S6gK1zDXGVw6zHSNauV9jb
 Za+h1EpT5DAhr6kGgUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX/2bt0AbUifCw
 t2El5Z2sYiLG/3uZeHzk8IiBot/mb+hZQ3nd2uurpY0UxMCE5+VArtUEyvYevXibV9YrX0NjuPM
 GJkRs2v+T/SG1cGbPKqr9Al8dBEJN+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

The Glymur's GMU compatible was set to the wrong string
qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.

Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..29c62118cec5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4286,7 +4286,7 @@ gxclkctl: clock-controller@3d64000 {
 		};
 
 		gmu: gmu@3d6c000 {
-			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+			compatible = "qcom,adreno-gmu-x290.1", "qcom,adreno-gmu";
 
 			reg = <0x0 0x03d6c000 0x0 0x32000>;
 			reg-names = "gmu";

-- 
2.55.0

