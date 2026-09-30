Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C64EA39A
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779966; cv=none; b=F2OAl1ZN8HocO/A73NLcf7c891m6ZeC5R8gLIrtw5R8uv0MzjmtHSnAkSQwMavmji3kdBfTEdnY3LEHXH5GGwn6RUlPh3UhhNm73L2aUjBrCaJXaKgXTdh+VDnkAQazZ0a0oJqY7u4QzVVxrzkHmTafENu05wPO6aLEt/F1opEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779966; c=relaxed/simple;
	bh=5GJGXU8fsHQt/qFopLvzw/9Pem+53Rp3DL4C9MNnYlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOvjEqEP+nUBqKcqeU3x1YNRyN0p8dOn5kuBuKcUTplCwl6eloC+TWndAH/vP9oIFleXFGHCwxN13RHM1G5FVyFUuUYlTdGqlF1usmDJfeTKVgUmUV+uWGr5+JAsA/V+y8aD3iwLrIWXcTv/vn+Hmt5opB6Jyx4k2aXUT+ltPx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLWuNrds; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnV2QqU1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLWuNrds";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnV2QqU1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE07xn3520425
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=quF3R874oc+
	nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=; b=iLWuNrdsLj6wcg2qoSsJPCDsBML
	jbKsI+ZMr93owVlWQ8RjqIvwOX7EolPr8zeRNSFWNWArisnvp5RewanbQ1bfN2sQ
	yxh//x8e+UzLMaPZmqnJWwPZ9RumtuBjlibPB0Pxhppy3hsucWsjcCjU41v1DAM8
	rU7nmYDu+UxIrJLAVcaH/5eUqvdezSnS+ybiiaKEPWzzFaAoPihPrJoQbpMIWpsd
	gxq3Qm8GB3O9JnWHIuNn0QFuiMipv7ySI/RX800CXpoHgymTr3j/EKE/EeeIR5yr
	zLE98yWnXqTwR8bGK+AyoJZ8U8HxIHGf/IqqU/y1/FA+6f/86y33DUgUIpA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hy25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so6677554eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779947; x=1791384747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=hnV2QqU1ampvHl7gKS5wSyWZsM3Jn7QHeUZK6VhpdDSwCGa4mJOosVIFsajF+YoauI
         SbY2u2uos2iLOk4yNAdKKYivvBFQ5o93Es9SnFO5R/q6vZhUtvi76ND34pBSdOLP/s23
         ZmQ6iVeyqB5sDvFGf2qhim5uHkOsQUsCAhnql2cXJHFcI+nlyHhLONPe29FyKIroLGee
         mYjx2wPywR70hcY6WUwB6J99v3jLbgIJ2YGbBbORv/nSxNxz0XVrpRoevdcEDPJxT8ly
         aRXZgk6xO1gYi1zXRaQFt+3cf9n7KPrmgoy8j0W9YTjSKZfcItY2KNb4oE3aLEFjPQkH
         dTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779947; x=1791384747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=quF3R874oc+nzE7gwS/oZ4MN3r+xqKntIK58vfepnss=;
        b=fcC1GW4lq+K02K5IbP2fH0ZwngD4CtyfMjrSVT86FKU5Wfdnh1cFJcmmvU5yiv+l+e
         PXLqAtf3FTd2KJrhqnJi5kouR5ERGz6dQKF0RO3Z6etEd6oR2VtlUsIepz45pDGgVcyY
         jh7jGx1y+6XRfqgb/RW39KXNzWW5QpHHCmwmD3HLCJUw/RwRTYGXtps4781uFDnV8mjy
         yVllouQeJyNseN7E7fQOIVqXIDhNrgTDtVn0P4C4sOHgR5Dxuag9IPH3xxGjbOH4abZX
         9arVHV3ltfRQ3o2Ofyv/rHBeKou1VeRqNDDts67CW9jeyop7Wz2pvrmUaOerpRf05HPc
         Yfaw==
X-Forwarded-Encrypted: i=1; AKwUvBxc14Zes+wb3rrSXCg0RnBARkoYDmzfvs+Hk2S1CEfFNqzH0Luzl+MvepYsL2XisNqszEkX/ff5JhzU72R7@vger.kernel.org
X-Gm-Message-State: AFq9FYK2jhEtPCJw+JIALMkE/5LpZilCsUBe2keLjWCF69GCARBBCwiA
	0XczvdhgWtHzGkLRyIKLIRUA/6pTwXayhK56aiUgRMlTRRsFigIRmgMp9DagqBZj8qQSZN9DZDo
	h5Z+6rL9XXLGVi67M9TVL7QVTzYJuzfbJQB8NCOdnLaNKhsXLGTsDklMxamiKQFa9F86f
X-Gm-Gg: AYBFou1Qp4uCW4VzZHmjLIs8kMw/2N5TQiPXAVV+H6wqO0LyXKfQWEE23+vohsYE/Gu
	Aq8gCH5YpND8czzzLYgl5yObZu5H5fgDv4bLg5CT4yR7JbghEkF/gPlgx0u5FgjqN2lha9Xqq1/
	Fp1AdpwZIvVsvs5n2Yr6cnZ53zddfv6m5H0Sp05+diMLNTv7F0VjBE7Wzg3QaJajTQhx6gHHmIQ
	L5KC9H4lQRLAFRnNKUp3qqVfC1yVT284CB3uZ1aWbCSsa3K4H7KSqT6Kt3yoMKzI/Ytw3vwlyOm
	46pgJ9Cp89x04w90FycTdNDp1wwn3WT7XaWM2YWhFTetSlXSv4cucDhu8fRFEFaF6VdNYPAJAE3
	s5LLYVRywWJZrd3lU3xMk+ImZEOA+0dKPBrQ9szBGEgpJLl/U7Q7YLQs=
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890763eec.7.1790779946345;
        Wed, 30 Sep 2026 07:52:26 -0700 (PDT)
X-Received: by 2002:a05:7301:9a81:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-34cdc0cd8dfmr1890729eec.7.1790779945736;
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: hawi: Add QPaCE DT node
Date: Wed, 30 Sep 2026 07:52:15 -0700
Message-Id: <20260930145215.3380977-7-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXzz72Hs4i40HO
 JnRW85K9C6OIEWr4QpgAexCvRvnZNsOgvFwQTpbztaN/eC2b0M1oHf80jsO9XGyft/TsfvKcIOZ
 NjKlJs6UL7AdMokdohez+dNJxO6QCF8=
X-Proofpoint-GUID: xkAknzpBSALQgudtBrGpYg_1NaNhlP1j
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd222b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=caZMlNoC1EqYFQpew0QA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX84YdVIAY4qIs
 so+LS8R9SwwE6qvSWxPhgA7ZvCpKd9Eo1Ys+g8YFNpDD/WVCvnKQK6UGA2pA2jVBVSRay/zz6kZ
 MygeePG388Wd3TD/gDi4uaXi5mXYXuaQsp3GenyxYpr11f8kZgUmDtFsOEUYbTQdVWdfrvr3oKl
 Jgq/2cJ8mV3XtiinGk3HDQ5vxzvQMdp0Lyc38VU9+S+W8/S+IWQAtlV2NRG9m7jG0xwYtOwLvZl
 sYDl09t7yoKzIzwxxvFd+34lTC4joOvx2yGSoQGxUmsaIjEkyCTVsR8Z/4QmpF2+1hlJZR5EcNJ
 8Qe525nQuqNqzVwhx80KJEKIlZMqbXWx+AC6m55Dp9dBmLt2gFjQjs6adLPCfuhAUZZNpsgc6Ve
 oY9LYO1zFHm8BHMEqhaf63HPqOKbtLICim6vR41vg02NQtnDLFk3P3ntWcIUHPb05iMKmO3MZkW
 P7iuRCmIM5DRD3otfgw==
X-Proofpoint-ORIG-GUID: xkAknzpBSALQgudtBrGpYg_1NaNhlP1j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300059

Add the device-tree node for the Qualcomm Page Compression Engine on
the Hawi platform.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 6b0a0ff0faa4..283a5acfa073 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -5677,6 +5677,23 @@ llclpi_noc: interconnect@31310000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		qpace: compression@31400000 {
+			compatible = "qcom,hawi-qpace";
+			reg = <0x0 0x31400000 0x0 0x80000>;
+			iommus = <&apps_smmu 0x1c20 0x13>,
+				 <&apps_smmu 0x1c24 0x13>,
+				 <&apps_smmu 0x1c28 0x13>,
+				 <&apps_smmu 0x1c2c 0x13>;
+			dma-coherent;
+			interconnects = <&gem_noc MASTER_QPACE QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qpace-mem";
+			interrupts = <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring-and-bus-err",
+					  "urgent";
+		};
+
 		system-cache-controller@31800000 {
 			compatible = "qcom,hawi-llcc";
 			reg = <0x0 0x31800000 0x0 0x200000>,
