Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343661;
	b=BGwLwkOikjdPEOF4JhBs/HR8kI/nUP4kAwEf8AvULBgh68JxsX/uCPMFlDR2xOYAGpkY
	 YdpYc1IrSzFFg3bGpTvM5xqMwQmeUVugoLb1zT1KdN3BeGJ1D4xsvg/qAFqlugEIEegqZ
	 cFl9tSVg3h4SK+UYczBX4zUvqnOf3YbYP2OG8HF3pshq2gPbKvYcibC0VY4iOlFmLVf1j
	 Ncy/c5dQ3KS99Qe1CtZ0OPHAJ8mCFZXNROAfXJBATr7+MSoWKkCXwgS1ZIl6FqamJ9xZg
	 yjf7vqiNSdvG2B1pUYdwehneMEuFOIFcuGvzFTADNG3GrosFrJGj7lH6yt499pjY8dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
	b=zmT/RqTq+HuUv/Q2tjrY1DrMT9MXnyzoXSlHGmOLsbvDFIP+3lfAlqM9iTN9LJ/WvEiV
	 0OvuXl+Cjy1Bm9VzPIwtMCsfPBHFtzdlVr7uaX1gRbg1uLtO8widkvsogLDOxMcdi4ked
	 TkAp+iSixzTLYS+c4gCdmStBeGXAEQiUy3nqdLhIwwXDvrtYxgtGqS6RzVcv1qqcs0Xdx
	 LQbEy9ewJKHtGRxZoZd9fwjcOpRCa4yViMNZVrL1zxn8yF6IjkNMQTLrxGV3KegMUCMZI
	 cHIXLe3qjKZokPY2Rdgmwwn7UbzpbZcpLKvWxiV9VyzYHESwUlXlY5zEHclg1yGWHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cM+MsNCq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzsOpfZk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EAB606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EAB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cM+MsNCq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MzsOpfZk
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAIp0pA669477
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24Be
	yhdVmt3o=; b=cM+MsNCq59akQglTLxUZMR+ZNAXqoOuWeiS0DxJsrOW4utoRxP/
	WJDwu/hr6BykVKNtSywPkl/sAsOFKnOukWcv/E5w88c6P0422nKL37NGZ+aAji6J
	xwsJNNAJ09youM9HNFPDz7GArFwsv8vaZ54joAyUGBhIuGzShpsdNPKu+oxr97rg
	MGF1vQJNCZzI2QI684/piK3d9iyNz8DB910K3NVAPN0Xj2skzIRQA39p4br1rlWU
	33fxh9QABXPbR+/vtSMP7ptEENVd/zUepugxCBt8VEr6B74/MGokP7HuguikZwiU
	Io0sL8M2dWpMUGisBkQtCDMCiFTf0eFZF1w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pv9p9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:47:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb2437d752so36613495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794343658; x=1794948458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
        b=MzsOpfZkiXUsMKl/NNFgEZJqsumV9j4OF7GI7/fL59R+F0ZM+Lk9IOgbyNN+5J4+Lx
         EDMRZjntDqGDD+k/WgZ3jYKFQvLK7UTH5ZWIauOIrfrBcrynsftD/He5bbAucRQxc2jm
         Np0XbqaN6dptvMfc7w4qhXBBPdJwh9D+9Rs1geuUqHZt6zjvMPDiF4BVBP5dB90dTS7z
         vmEvzu8/NdC8x3uFRarqewANoJMhBZEjToz29/LQEIe8Y+iiI1gxiZ38DXD0LEl56h7z
         UdEAc9QvR4SlxWE/JIcl66Lo0IS7+9X2TbaiENdD3spPMlTQeV9UxA0+lhXNY7gYcir/
         wkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343658; x=1794948458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNCvYFJ2RnXoRwOEMSxfDnhAjWKMNDO24BeyhdVmt3o=;
        b=VBgV/By6N199T6ba89cnP9hifxPWtN7SAwVot9l1C2jjqgU+3rxcTuDBiTIqElPkjK
         /fihY07pb7fnHf7AQr34DT4vZv/dldGdizHVB7uQHsOI2I6ONSgQRwOSHQkHisYrIRoc
         MMyNov2BnuEy56otFY4UBdc5mhsJ6CNZyVSlx1sv+iZNe2OaiggnFKDLj4cqncaKH3/e
         SXvRuCe9V2NzDPHprtvdawYd/+XsQs6TTZcVzvUYzezAt9JJvdMVjRlX54gv0yiciN1Z
         B6e+IwMavvI4ZCU/42DRXUGHQZ8XIqDQmlLoTm0zEKK5rvy2Exk+gJfUTRrnh/VubVQm
         30yw==
X-Gm-Message-State: APuU4Z8hcSyB79tNqPa38rAS7SUqoF5uF3W34s6pblU2IIyPIuiWgKuO
	qh3QgTf4PGER4gPmPW081/y5/izyZxqZL58H68ECW2p76uehKvXS1vyhyvFENWAC6JZrxQKC/ag
	kDFtjE211jIKbpBNmaHCNISWm79MGa6xQRBCxIWwhjX08N7XQwx9RjGQ7d5dwro9Dp4Pp
X-Gm-Gg: AYBFou3Y00nrIqfx+TF+D7UUnlOP2Vq6fOLSCOhJb18XqO5QY2A6IYmrjixf6ZJr0A0
	IO1um+Vi8pqKdtdlr28FL8lYK008iXu8es6Y7hemmp7T2k7GtZauSzgQ0uILsgXZNXlXEjyYF1i
	liiwuViHWd8oAS0ATf+7XM7MRF/b6cxnzDoJA+zb1mhWzaK5KBDf7U847I1AS32H8lrdEatlHpW
	QymX2B0NBs8HnJFtKGJL0cwsOLYLDI7ZE0Uc+UALzS3a7OPNZ3irHr22Da9oZ4XC0reWCd7AjUF
	EtQp4E7ycSnMJqhk2s3jg+u0K7szzmtg6DSODb2ZCUOijbK+FZe2VzZZdeEhCcnLthTyh2MS0vE
	Y74SfkN5MDGkqXCjYVK/kT5HrGoBR4UImmpt8gq0z8yPI0sH9pJkKSYsN2xYoKCIndH5bO21NEl
	Itl5s0rwjPfJUwileQt+zblViS9Md5cq4BYvufElJELsjXtZncca8lJ2bkuNtG6A==
X-Received: by 2002:a17:902:fd87:b0:2e9:5ed2:c39d with SMTP id d9443c01a7336-2edd79bf74cmr3474965ad.36.1794343658488;
        Tue, 10 Nov 2026 12:47:38 -0800 (PST)
X-Received: by 2002:a17:902:fd87:b0:2e9:5ed2:c39d with SMTP id d9443c01a7336-2edd79bf74cmr3474695ad.36.1794343658008;
        Tue, 10 Nov 2026 12:47:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm12824535ad.71.2026.11.10.12.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:47:37 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a8xx: More nonctx list updates
Date: Tue, 10 Nov 2026 12:47:32 -0800
Message-ID: <20261110204732.531432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af382eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dKKpEi-vj6lmmWfvBBYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 6LydkLYG7abfgIFPwCgXQURiMXLZLahg
X-Proofpoint-GUID: 6LydkLYG7abfgIFPwCgXQURiMXLZLahg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfX8GY1E/zrN0fk
 KxmXDq2QDMiLf15QhbyM7o85pueRLa/ymLYe96puwFbHA8O2luwpBETn8YYRYNHALrNx9E67BGD
 MiMR84KecJwAJ+yEhScxqg9sSLEZGak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4MiBTYWx0ZWRfXxAxF/nlaAAPj
 xVAUGT/vxyrRwSPpInsrHfxerDn3hZCkVswYN/pxAEboRzm+4/UDRZQ8UuZdu9xeA99pwldaxKb
 K5Yd4bFmK4FVtau2uSqTqIJFaV10Y5BH9p1N9Z04ywKlCfgZf+5zJI8SY9HIxkaBBFdoRPnZsH7
 KDUSp41DVaD8/WVFx+WelsKlE4y9qU3+aVYUSq1K/yxAICX0S4gK7aEYmbRfoHvgF6s5ODwjy6N
 9xwfS05mUSZl3NuFCp2+mV04iHSDjt44xKpeaIf5XduD4AyHAr3dZgqqFazkkEYLAT7RQpWkqrI
 xA3UA2GeZAoBdwP05FfR57tga/hewJdETluupvWMqp7deoqmH5tdegrLD3w8FERGlkKmYatiQ+q
 LQJDY0eZ+zUxAId7WtoeQTdX65dUviVtmpTO6MXVpazOgKaHXSovzRVYSuuK69FdH8RM4LuifZ8
 JgGrQagJMRERFswzBIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100082

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 510c2f6017db..0c6dde3cbea9 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -282,6 +282,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
@@ -595,13 +596,15 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	/* Disable Dead Draw Merge scheme on RB-HLSQ */
-	{ REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_PERFCTR_CNTL, BIT(0), BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
@@ -611,11 +614,11 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
 	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
 	/* Disable mode_switch optimization in UMAS */
-	{ REG_A6XX_SP_CHICKEN_BITS, BIT(24) | BIT(26), BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(26), BIT(PIPE_NONE) },
 	/* Disable LPAC large-LM mode */
 	{ REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
 	/* Disable PS out of order retire */
-	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c20800, BIT(PIPE_NONE) },
 	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
 	/* Disable SP2TP info attribute */
 	{ REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
-- 
2.56.0

