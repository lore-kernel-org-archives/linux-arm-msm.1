Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C2B3ADB99
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330022; cv=none; b=mg3pchu2jeBMBrjo4boEEvI3XB/8aC9raPmTJXlooesKM+uugVfVnGEdFbHnNdUXZC6wPa3BqY3Ev1h+322WmIpHeZ6lCUKMZwvV1wFXVtl7wS5Ta6GBtmmmTdixO6vsX1BsINAKzp2DQI3bNo2vvIcjLXcd5SYjneZ26b11pnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330022; c=relaxed/simple;
	bh=p4fjdac7ddmXNJzhiuD/XngfABmm4H53JDzMgBLxeDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mX7pWEhzNm2ftmb367YTaIIj+IxJmlK4/cbbQ99Hl++CAkYUjOF08VcrIvJH6/hSAH/Ks7+xQh+rFaxxwBDIH0mfpduwMRY7iNwRinnLbETDCWOpLIKhViVhy0nAXKsilOm9eIWyytrPSls3Ap0C4QgyxcnrG4plpjM5+R3lObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lmxevqzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TovieYw/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lmxevqzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TovieYw/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtQ9H2597935
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BDm6gQk+IcU
	ynEcgUraIbieG1UfSQ/0Hu9EEvI4ni5I=; b=Lmxevqzp4yA+E6T9oD1000pT/Z6
	7Ypu/uCblOOiPmtgWp3EYLJmYCU+y8wOqIX3fSGgywiP05k8LZrpf2oPY4pBNibC
	ctu7RonNYKKoM7B8w3pUOIdbUTNBAP7wvR/8E+aq2zJPhzAJDiflyjDLg/cZiHC7
	0k29ymr+tWX3YPvZCUeP8v7milO/7GHw1KkseK8sq43NYynkYS4iX+fr9yppIIKL
	ZKo8xO6yQSxSHgfIkWDrM/ebx8wE1hwio+EWox3nSj3RZIJM2gW0Ov8OzOZsCPH7
	x+r5OMgQtvfxT1mdDEH02fMsOKEBScUV36PsAbOZl0lJgj7fEJxEBhsbaBg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrp8s67p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 23:13:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so12520876a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330016; x=1784934816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDm6gQk+IcUynEcgUraIbieG1UfSQ/0Hu9EEvI4ni5I=;
        b=TovieYw/qH/tyVjRnkMLDnw4UQU8f4ZwpxSTUrouWtxC4s+hMG+e3Lyo5ilxiYdCQk
         WR4sIpfrQfCmj9wuGLzJA11nkMoYShV284rNPrQaKCyt4mHQrps0vo5l1ZDi4G/qZOGw
         /fDqu1Vy2hsRvZpl8KMG1w9t08DUPm1Sm/cxazTJTI9gkVWWHnBPidXPxuMqD4De3Jvk
         nsoyUwdZF2asgOzRItB9r+PzGL1P/ht5b5c8x1LXCv8igh/y6nF9zNsql0i/PNCfLjOW
         l/7Vv4FI1ec9pvaQO73fflhdkuIs5KQUG+2JcvGhHsJ5PLAi1zTCsWD3japMCV1bIy8z
         ENSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330016; x=1784934816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDm6gQk+IcUynEcgUraIbieG1UfSQ/0Hu9EEvI4ni5I=;
        b=LasezRlLYprhfV2FFnXBt6eL5OyAj5bByAmWGTYrHKp1/5PzhYDG6pwQBD0+Petw8m
         pNpPMwTzTqXagrkatPPiqETrNqPhS9/ThSJnHLy1UJTG4VLZ80lQjR/nsiLZDkqbxyQi
         s/WRDkQSjr5rpaPll5INPJt/m6wIb5ay1jehJpT4pG3IxhFEJAgTt2s0xCJDRtx3ACby
         x1xbfnH8zw40IeDohWRHJZIrIN5jsu694IG9jEpVIeoUsIWMM0TSeuL5O4pOhkrVbdxx
         fpr5S5DfmKq7zj9NmlaqwLGIxsxLK2PC7tLD1UffJau/05rvtAOoNh8ktoiXU1eYrGel
         6Drg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9lTnQ3CYy2AT3cTK2JtJ49bJSX+Wogw287UGWveYzPWSQiGGdI6EnVUkNZiNzW5lSPXSYIni38/Ak1hIm@vger.kernel.org
X-Gm-Message-State: AOJu0YzynpBiV++ymfzLiFzx/zHxFQJCcsRVQ/lIJckoipdDalmUWc4E
	jx8psctzIujiTgsXMUN3T9pQdR8VgRhJUajvkskOsiq/BevclHbJwrSEu+OMLw0iqZdP31+1fNm
	sIz7TbVQ9LyOgo+raWaquPT2TuygAO8b4uwmRo9QqOXezNOyiPCHxoEeEJy5aRZ5qbyLb
X-Gm-Gg: AfdE7clCsvjqYfa1/gf9UqNyohUxGTaVHBquwRhjHSyipha94joA4kbO/cuNqL/yzBM
	06Trx2yAR83MFpeXBsub+VRvyA/AOqcMDuZHyfrUvv9cpr1Vl1vSQjQkpvCtcT1dDEafSMwgs3T
	uYRMnyWPbojPcIcZReL7j9XN8oSi4fAJdkjH1utssNGRVLfriqm0rw76laf7dBCfXlnD+atPtIC
	gWHYIZyIFvyzFl41holi9zbdt6CZAFWMgBV2LgbdnFs8mfHhySrHF2cwQp8Kq4h7fetfiWxQeAk
	4sWqFO8bwSAl1bc5G29etN1XUGquZmv0vbCeKh8IFzFwMrIBg5MYyvPFW8gxzIm7yAguicoZ61n
	mkH1fMLjWkjLHJj/sdWoSEi3E82hmKq/qBWet21GWnwas5sSDUVh+OgQ=
X-Received: by 2002:a17:90a:dfcc:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38e4b24d8ddmr4871727a91.0.1784330015745;
        Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcc:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-38e4b24d8ddmr4871694a91.0.1784330015223;
        Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 3/6] media: qcom: camss: Add sa8775p C-PHY 3ph lane config
Date: Fri, 17 Jul 2026 16:13:28 -0700
Message-Id: <20260717231331.1229693-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX7mkD5fOAgldB
 /Wp5222+UrLwf2zjeF3b2U8SE+DVfeNT7kQ4X6GRoecVJwaimuaG6Tk6q9fxrKqU7W0xcusudnM
 fz8ukc73lKzi3ZLoWK9tDnfbgDrNWUA=
X-Proofpoint-ORIG-GUID: r4jVm-lUSLsPxiJV0ZypXKqzlw7K9HQk
X-Proofpoint-GUID: r4jVm-lUSLsPxiJV0ZypXKqzlw7K9HQk
X-Authority-Analysis: v=2.4 cv=fMYJG5ae c=1 sm=1 tr=0 ts=6a5ab720 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=48g1HrhYbCZA4AZiz9YA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX+8awSx1lug7E
 WeAmnk7UAsRtmR9nIbg871NG7kKc7nG969kgEkpYbgtnrGwQN4YirAyoxiVYQXrwdFKk3xVrawd
 M8WNE3AabiRRgxtMTa7SfWew3Ajuwh44OPhOkJJtjPjVL0uxV5mmooXTQWQlor9BfRwzV4XMMbD
 qG1vuLRnNhGdITPXXIG+ovFKw7/5FEPLqZV3lSRjPSCNeDz/0xvDjnqPTmeIVRaLt/F+K3JkxQd
 Nwe2LrmrZ/zj7TdLoS0VOjvqq+/YYaJt2bcXkQZgKji2GHy2gMc9es1LFn1PK8dmlos78d+pxRv
 HJ0fSuP2nedJuKC4mqWDnzgCzacjiXdluz/ptAeNTmiJputRcRiytUcyrHbQjfVE8oHIP2K1xA2
 JQKrbqODM55pd6tBY4Ia1lB1VD3uCIKWvUOoAzPtZfOY0t9COfPPXt1wHjkwLME3RMTfDCBelpW
 c8AR7lImzXL3u1s+pGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170238

From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

Add the lane_regs_sa8775p_3ph[] register table for the
sa8775p Gen3 CSIPHY at 1.5 Gsps, and select it in csiphy_lanes_enable() for
CAMSS_8775P when the endpoint is configured for C-PHY, falling back to the
existing sa8775p D-PHY table otherwise.

Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 111 +++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 11b7a236e607..8f1e70ad2b7d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -56,6 +56,12 @@
 	(0x0300 + ((n) * 0x4))
 #define CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(n) \
 	(0x0500 + ((n) * 0x4))
+#define CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(n) \
+	(0x0900 + ((n) * 0x4))
+#define CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(n) \
+	(0x0A00 + ((n) * 0x4))
+#define CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(n) \
+	(0x0B00 + ((n) * 0x4))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -152,6 +158,101 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN3 3PH sa8775p 1.5Gsps */
+/* 3 entries: 3 lanes (C-PHY) */
+static const struct
+csiphy_lane_regs lane_regs_sa8775p_3ph[] = {
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(34), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(35), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(36), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(9),  0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(34), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(35), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(36), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(6),  0x3E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(9),  0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(17), 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(25), 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(55), 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(34), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(35), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(36), 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(6),  0x3E, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(9),  0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(17), 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(25), 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(55), 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(33), 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(32), 0x61, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(44), 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(33), 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(32), 0x61, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(44), 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(33), 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(32), 0x61, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(44), 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x24, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x24, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x24, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.0 2PH */
 /* 5 entries: clock + 4 lanes */
 static const struct
@@ -1315,7 +1416,6 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		}
 		break;
 	case CAMSS_8300:
-	case CAMSS_8775P:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_DPHY) {
 			regs->lane_regs = &lane_regs_sa8775p[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
@@ -1324,6 +1424,15 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 			regs->lane_array_size = 0;
 		}
 		break;
+	case CAMSS_8775P:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = &lane_regs_sa8775p_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p_3ph);
+		} else {
+			regs->lane_regs = &lane_regs_sa8775p[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		}
+		break;
 	default:
 		break;
 	}
-- 
2.34.1

