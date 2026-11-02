Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657071;
	b=5D8ToEvIGWy/7eUKqkXW0bEJpHElqEQ9EiwknGjRUEojSjgpSc42c+AU3RPbFytU7xRv
	 SffgUnvgWvdaPKUeFBWLvho1jeg3W4bszc1uE1tBTlwr7tFDEpVih5e6ndtF+a2QRveaO
	 fvLEO/Vpw/+qXUlK5cgu2PQUevSIOGrq+O24KvnsckNGxu/x7k2wdMSf6W9CcuPiX01zV
	 wkiXwRz6f1RyM+aVL61zVkuOnhM4ThlO7HxrfZKB8KgA/wFbR6Eu6TXjNYsiMEDeVSw57
	 nA9VLwZGyuBNTF5WR0f5WPlCJZf5kl+hTHb7bwghrs+6i/eyl8cUGBEn2uUN8CVDhXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
	b=4F4WxSh2HjuKvgKzccdX2KMk7WEC4dZwyGnmtaWngQ2U/ogUTx/DL/IuFbzFKPFV5PyW
	 txlsE3wM4fN1pOXCEkAoaX1CDZjUovm9p4GmsSMJU3aG7KtMDLOBREIA08SQ9ivoln9s8
	 G4LEnbpl3CXZ0SLpTuIiSi4zucxiMPipAS1+n2rT0sehgA1EN8H7SbjCn2rJsZp35bmrr
	 VP8QxKirP3uWsTRQYBSLF/8PnVV7/vfzLUWWI3bdpMl28qKGO/GcEoHD+OfRDHyroxO2I
	 U5gxXqdUOQVsm6/SNTYvVuRI8lCj05DEHY2uH6FJprNjRLWMbMTMcHMv8TypQU8L0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCVkhmNj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vfLvo3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC2606D833
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EC2606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCVkhmNj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1vfLvo3
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5qE73955542
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=en+kx17O9Hv
	lGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=; b=LCVkhmNj7EOpMCgvx7D/X0eBjq3
	yfbkY2qbTlsMy5Gz56dOrdeW9SyZ5MUE7IELjLMlLk1INQdZJcfH7UtRxPftcU4p
	PaSXp6i5KsKm9MdvHsyk9Z9blpEeQk6iCUeHfTDTQYr9nASDdqYcgYphE7a+BO3d
	mwAMfrKrr0hG5QitarJwLh4yJXNDtPQ+r07s4q8OLr1JPW3t/PZzAA0a16LxZZa1
	gKYTNS38qylBPaSlTVIZesjOjU54pZc1CAzX45FlvJYIXlpRvHvMoSmInG815W/j
	I/EwsaysM9iD8QZsDCWPb1eqgokXunYdvB7ZaeVqezItFCdzETKeLNb3Ysg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rntu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so52720905ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657070; x=1794261870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=f1vfLvo33htHHj7oCkCNaXD0UqlnBFZX3sSlpr9V0fAlq2ePZ1Oqtgmr+Vm1JgGEB1
         WDzTS2+cuQDit3roKNUY1OF4In6zs7eSMsQGe506CnyMoMqbdzlwRsVOwwZQL3KN10zZ
         fY0Vmo+bhzkDpbYnuEBUggaQbh/You7vw2gmWCFPO+LYFqUSu9kTs+skW+crZ73ctmwD
         6aj8q2L9jHqQgdrjHQRuzRq5/oREXWxt+JMJRxvWRZob6NrbUASousCSV2jzoa6MUVoa
         4j4CmLUAFaRNyId7/WZ1rSy/2HpHOibv5mvh0oybKpfKy6D1Pxo+7Jsv9uC6umHqoVeL
         6lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657070; x=1794261870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=agVt5QkQypWkplH0pso+PAXBJK/h33OVPtIYLQnfbQ8CkHTwiOkFoncoatKz7TLth9
         DJjxg2G0+I7Gb+RdanJhF95q7Z8hYenA7lt3DWpXy0eY7KIZkTB5KKsb9M+Z4fJpntRA
         fIXNzNzlB0NlprewAaTaKtk7udaFXVCkNxq8XiauJ040RI5wla8x9AxceiqbAd9f35x9
         u2wKEXlsu5+U0xA76yZ5f/Obj+GJm5B1E1Ef40sMIaLEcNTxXCLU2QW3rLsD4T1Bh0xm
         2XtUsV0N9IG2t6yR/CGhz95pX4weatq6ym624DmP6QYd8W45B4kfhd7AfsVSb9V9BJXJ
         2eiw==
X-Gm-Message-State: APuU4Z/edMMVuBn4XLcruKAQJ285ItJUNhjSEzic7yD99GL9qES4i2x6
	pSflWGdqJDseJAhVYwllkULKyAYeyX2m8bykqNGZWdWA6pkTY83unRiVW794AenDCvGcYYpCO46
	IM7xEOTyC/lKZqYq27TSK+f5j6XBERNmhmoLFht07k5w7E9Zwam//I5Gbyq/wm700bMpd
X-Gm-Gg: AYBFou0Yu7iGZdriULXnJJ5aNfnt0eU5CZQZ2fCvGcNTMeGjjglBGrr36/mVHVdKC8T
	0ACcG7g7ftAPyJja68fMHs9N2DB02ae7VT2PelAS8RsTPRgiEAnGKYH3V0nRQ7SkW41wWF8VF6l
	0vxuL2d6Zh+4dKK4aka0QnwLCQCwl+Tlk02JLiCibFgDdfDueLwuOiJUn3Y4yYhBj6Oa1h6CyTA
	RqT/n/jrcssoWELUDcYirXn8SJYZPMyQNTezsLX7eLoZPqa7cip0lNrUNaz2yDjcgLXKqu8c0Hk
	slFrADSFf6zdYwlrkoKkXCMaMxugETRo5l7AXqAXdxanbG59iDKK5yEUyQ7dCuGyHA19VaGSpqH
	wDRqwq3L3A6Gk5HZUXp/rf/PAzadm7lUaMecuhICex5SndX9m++YhMCjORl6VjUQZBVcddMpxt7
	w00d5TUe+0xw+vH6JwSOJqyQ==
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr107112885ad.48.1793657069846;
        Mon, 02 Nov 2026 14:04:29 -0800 (PST)
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr107112705ad.48.1793657069391;
        Mon, 02 Nov 2026 14:04:29 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248621sm31871825ad.28.2026.11.02.14.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:28 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Mon,  2 Nov 2026 14:02:49 -0800
Message-ID: <20261102220405.30730-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXzSqkowwEYzBE
 gfC3s2OETScXbAWqEHgNEbnLvMR/Nt1LoDUlWqN25uG5Qy6oOqQYrMySDYUdDtbnuLnE+jwkoe+
 1tnPEzXBcVrb28/cIm8X7KYs3EQdQK8=
X-Proofpoint-ORIG-GUID: e1fDAkdBX1KXy0UmioDFTRFp_V7b-yII
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae908ee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: e1fDAkdBX1KXy0UmioDFTRFp_V7b-yII
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX9oQEn10wG/t9
 k/m23B3sKA9asUiit7BnBZuAombsdeLL7bZDF0y2YTIR8B7De1wBgZXMi4i62x+DPfJF5IUlFNI
 K7H+9LLu4mseEf3aVzwrScHiIHFD7Clr63kpY6gu4RcU7ZwQBKKxWGQ+xwiHZBtclhnXOKPTI8T
 fv7NV+D7b0UYXHkutE3KT7/4opzdNUqQVRLNyqlCydgSsgF43EccZS5OtQ37ZCxGsdLx16exvWF
 jt9RmVMGN4i8tFd+naLu//P6wCJ60rTCuzRamOB92AX74VbulSf4n2CQaoGHRhftn30EO7T39qF
 VQLOWY1bU532sMBC2nuLzeIeGb55y92cbZ6vB5ZRwiRG8Ft8Mu3MT5vN+oqZmjsnWwVZA0UdaxA
 92x8ZbShVe1T5xnRGmdlBTOMyGjFPMyHlnMJpeNJXS76SvOnJLd3VCRDE1S1ZQTo64q0nq93v8n
 BM4Xy9mH4R0M1EkaJaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

