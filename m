Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC541471254
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711721; cv=none; b=Bo9RBAEQT5nE2W0hRNSFJuU2eR0WfspV3xEhEYVm+t9pdBkQHTHHSKvirR3bK8Zo/svUkxuHLAtaoKdslyL2SM8rWMPnrOwv0B3+jQPB4tirdSzPENzru72FLNaGQ5pcau7X19n87C6pexTFwVxQCxxD/BJPE/fax2FKvPz0oeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711721; c=relaxed/simple;
	bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATp9+4GxlssHGeVC0/aB/JhHUoH3o57P1jAGHJaPG0qtljLbpk2H+7dkXB1fcCT4Db5K9bo0qlyj9Fvcuh4syso9g6pM9evzUKfE/4W67oVWi2pnq8yGbW1EvUcQGJ9MgFw7LOvaxTMwMhFBVL6RiSHBci78u/bbxBx71kJOkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M33ckUWQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JT8f8DM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M33ckUWQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JT8f8DM4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAb9O81412966
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=; b=M33ckUWQIXB4ywXs
	WHIleqAWcu+c6E6b822P7IDVX1so3WHsgOq65SWiZMRb2Av0SU6BmacjedCOfK33
	6v9SyrOWg8or4q7NcaaaDanRRFq/SO6H9zzPkv5Z1sK5XfAGYd3ljl6/ARLLEaMp
	dJubHU5GswAPQVzR+r5o8adf8rV8LzpoazOFVVUjb8z0zthCtJtQy1Qi2HxZjPes
	nBzVuNXii5T2oqNyhHBJXLuWfMn5ODUC6A8s4M8gaRZoGea9jH9lNpK8PR4u0aDL
	shdzpbX1r64K434N7TQJVSNFmIER6mf5lbWAX249q3JpnipnzD2vkoxhT3xBgryX
	fYzn0Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20638utt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:48:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84fb5376cb8so1102986b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711711; x=1787316511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=JT8f8DM4MNyjlEguhoMyNCu4M3ylw/hZOQqIGRDEXGmAmbiksSnoKvZJTawf1d0yfk
         Z4p0N8zlDdruR/0VNInzjqjahNUHvV4zzs5EuPvZeODkUBPLQEzxmc0P53hRXatHmXqu
         DJUZ+sE69hwTZkr9oRgiCLxyh9OLGhuBY175JpdeDNdc8AGCvNwJeoorYkSsBwlysTH9
         IwFCwQP+tVxt6l4//oGjofayRdWopA4gPDbn6H5GxcBTJ/VE0xqy6s38O527gYn8OTDA
         1Qeb+/O2LB8T+Mgu1/PyHhs2XBZ60FRw8/XqHh7t+Ec44T88v67/nFG5Ss+w2Hpkni1J
         pMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711711; x=1787316511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uNefNNLckWxyIKmOXXk+/sXsgQSjuxoX9EXhkald4k=;
        b=TDb+OFyX/xM/ywgwLYS+Dqb6mSCv/4NaUFFiLJ0vOoyJxzH/ebta6wF/OhPQZ4AZO4
         ++uWq/zA1BcjcneFXD633J2qamFp0g2J597lzIkMHzP3vz9GYuThX6Sb2rpa05xrACXm
         C4ZoaiOnMDf0qnQLvsutw/5/SPoGzhgF7USjELLWVoBoKPjNPvh5hacinnPknB+Eluo7
         6uV9KifcVRdJWaaUPwXco8kSMm/O92gYD1vnHp7ufZiDuWzTNttpvoAlAaxfLdxwSlMM
         W0iWYH2rgcX1AnKU1zM8A6crDataM/cWlqJv6jAbwJEM2wOIPtltkXz7wO4+tuD9STsW
         Uw6w==
X-Gm-Message-State: AOJu0YwYxbU7FlTJJqZKdq+ea/dW6CErq+vDVZ670e7It83BAdCZHYlL
	O6OUtCxz5cuUy3u3RYkPNs0CzMwk9tQgirvhZjkwXTGyMIatD7LRHb/2SJPBqqNb1fRpPAScnzd
	+0lzu7FxXDEXdsP3K6ZKeThIX1lMN6LQXtxG2VvW0sOaBdgL4jyLMMmzkQn6kiYUaNYFr
X-Gm-Gg: AR+sD12+pOOeCijURKuj4ukCthfe+sHneqKzGfu+ptrIufV00vV4sXI/75CpbfJ0JWE
	m1ovrWk5LV1qSkR++/yFaDbgcrPsfnV4MzHqsAjpYNg/tVUKdM9I0R+8xFNzTFpDGq9EUVtiBO9
	q2nxU0+vv0hNrV3i1YKzuTXHoPhKweSJjfIlZjkNP2v1jAl5jiHw9j1UxLOix/s6HBcXV9wIFcx
	rqMcGAkS5ccN9GshCTKN2X3LPA/t4DpWAE3YgOjpZJ0v3HwrhF9Vy04wG2pjU3hKf0qmNzxPEjA
	V4lUcKsLthiEsgqkaU4mmgLIT27AaXVaGCOGcqFXBAv27mlWW13e4UqoKKpZeXJDbAezL+tWVws
	PQ5JYoVjf8uvRH4xVStDJ3SFlYZWmC2yEbfUfDUIUEdE=
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587070b3a.7.1786711711125;
        Fri, 14 Aug 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:2913:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84fddf91565mr6587019b3a.7.1786711710697;
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:22 -0700
Subject: [PATCH v3 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to use
 fixed factor clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-12-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=1388;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=U6Opb8TcQbuMMqUTCWCIlKozzx86+MbPY3j42JH8zpo=;
 b=GoHKPlU3bC0W9TMzVKcDfRktV9jgV4Cilkf9AMRArxgujJcqHehLBQHiUjtBmT+6x0WWUK3+X
 /f+799d2sS7BjMswFR47ZyxQuzjkRukDxml+yp5khWw9wsZUJoCYv//
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX4Ij9TnId/ioc
 tcHLNvcGbuC17pFR9qgDhF/cZmeQDNeP6rpTOFmVGrRVJEBO36e2SC1pbENEOAOisRmlphG03kQ
 QEKe/etod1vKE3PtfUegLNgePnZExsM=
X-Authority-Analysis: v=2.4 cv=Z/Hc2nRA c=1 sm=1 tr=0 ts=6a7f0ea0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CPdYy-Otk887xBsD2wUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: i9GMRCsOxbMXXZyi0Roe4AOzmLwiGydl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX2FsDNhZu8le/
 Rj+B7+jF4X8fWPOIc6UiVTg3UCfUVCJsDCOUK5hGv1ztlipm5VGHhuA0DfQGN5eqB8Boupr2uGy
 +dvHpQMXZD2FEZmFQEigTz7qIw2eoZhWRtx+qXDSbD2w8pdcZ0+Upz2+gUiNZ7TQspu2LaKvZyF
 9I2vWXNCdlbmncAOLSOjOQlJ6Rx4itAzYCSz/pdLsTn0yEn3AIBqD4W+6VWYCT/CIOa5UcnguD6
 6yToYTMZk6AtP8KCEI+GrGYfM1h4A/Gyo9YS5NTdkQ9dHzFzT7XHRlnpGDn2XtGgPYZsGxUw772
 1F7JFnA3LCVnqyGFflRM6bE58LGIektBAFOclkREOleUk/VKCrbiLlXO9EkXtJ2X/vsefGm1wne
 kFWswjY37rYY3H1I2YN3aXv2Cs3Qadh6oaVz7+wyGJP/0uBiWTX2DqVyHoyyGKGD4lPMhu4dHXQ
 Tt0YKFflovjwOwDtLzA==
X-Proofpoint-GUID: i9GMRCsOxbMXXZyi0Roe4AOzmLwiGydl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
48 MHZ (also being the reference clock of CMN PLL) divided 2 by
analog block routing channel.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 7 ++++++-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 7410d092814e..fa537633d5f5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -85,8 +85,13 @@ &ref_48mhz_clk {
 	clock-mult = <1>;
 };
 
+/*
+ * The frequency of xo_board is fixed to 24 MHZ, which is routed
+ * from WiFi output clock 48 MHZ divided by 2.
+ */
 &xo_board {
-	clock-frequency = <24000000>;
+	clock-div = <2>;
+	clock-mult = <1>;
 };
 
 &xo_clk {
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 52d851a0dc2b..0c1ede0f73b2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
 		};
 
 		xo_board: xo-board-clk {
-			compatible = "fixed-clock";
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
 			#clock-cells = <0>;
 		};
 

-- 
2.43.0

