Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657109;
	b=b1d0cWWUN1JzVNjGgrG1nOChrJKpW0RNztl2BgGXGOCL2qkTjiSDKBP7qpjQoZGURZVU
	 pBTglubdJ34rTJ14lFYUhyGBFiB5pd1KkC00ZZy6vHhHItWZT4htfNxLqCRSSQPSvQZHm
	 ZlyyLXUEveqsvntV3llz8qFIWagB1WOv6y7cLdwnYxL9nc+MDa8PJP45kgONgrsa8ygYM
	 J7E8hcFkkA8Op9p8J44w7fm9vRhkxKZPYBERssEKy3NNqsJ9Q6GyI6DpTNund6T0ioCVn
	 UplTI/+s3BF+2Ll00YBGDQzcgLlFRZq582L4xXUPaUcheITNT1m1xnQgKGhxJNa/w0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
	b=B8GTkHjZ0ZIKNt2DP78lR5lsCxz81qPaNIHMnPxbnaGziWE461mbuBEekuXSKmUq8XdU
	 jT0KP/4WDZ2D4+RR+d59ZTytFnbo8gLCHj8vuY4f/xVtV1yD2YC2zidHXsWlN7OYwjpjA
	 l0GhoNeYuz4vLiFopWBdgLtbbxVf/ORFaWUC2CP+U89NE1+GFENeXP/2u8fVJu9EVaW8D
	 JV8iWbzXzbLiyFm4lzpwXRqe64xrRuD/6uYAXfCuZFVXcX2Wbm+6fla1Lgddh8V6r2UyP
	 vsqooXEmaCHGRSCRxlNkS4qJZrE4eZS/I03XT8cOQBY6kY5fJlpHEcBQPB+z7TKMfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="XZPrJ/eF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IK/LwzQL";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4D606EE82
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C4D606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZPrJ/eF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK/LwzQL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K5wuK720129
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lD+y/1YnhCQ
	Ues59I9kPAO0opbelgLJYmff3EBA8JLE=; b=XZPrJ/eFgzTlzCNuW5jAm3Z4qFE
	CgWCBgH4Yhbmvrxc5uB9PDLOQwUyHLCnsWIUkxmafifib8ZNxGtPYhHdntkJLBZO
	NDKHeIAetioLIe1lx2MPlEkaue174Th9pk/8qifWuAEQmQVvrvEIJQRca/11HZyb
	PzFd5BAAkCO2LLCIXa5VRp90ciOUQARqglRBBNN0B1IkVvqTUBvoacCkM/Nm5dM9
	tlg+G4Wt2ErCDiOkzKYzWQJHabbaxDUq0W2g4Co4ODZ4iEMeIidx+yXw9PXLZ24u
	DUS4jPxingQJQx1riGS0lsIjhEItDvXFIvtLYAhyqVqEPlaIkFaB1PSFlUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0870nw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:05:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso4951345a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657107; x=1794261907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
        b=IK/LwzQLgadQIrB+4OGIqJ3q7BEqnIvxl2ObjGFImfTWYeDpL3aX1GV4vcoCnsemYk
         T1r4uidDgk0eqco+52mrKLHC4Qt5cWq+K3vnnynydLbG40j9lsmV3czvg/s1uluhUX/i
         jFCA7UdSNSar/eKlwTCpyson6qFY4g25iZtT6DtYnS7mp48YLYK8wE8RDi2fGJPiZa1T
         d6HjBSMRMPoIQ1D8DmfKC8donuy04k7DgGmFamBVUqgexk0XGqQqpw0wipUuBu3B0LWX
         tF+H6wtUjWvt1DtyDIf+PnJHoiTuJVJQpMhEqvjeWOnztF9MNMECJ2rxyGs8Lusag9GO
         R5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657107; x=1794261907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lD+y/1YnhCQUes59I9kPAO0opbelgLJYmff3EBA8JLE=;
        b=f7dJiec9M5DKsXLJQW98K8JvFCr9l0wJGwHp/6/ps0gKf4bx6lGiBY1lLNsTiEOuLs
         WYrC4PP92Ei13cH28cfH90zqIgOq53m46oJfr7rPAz7cw/qMEyiXBGWnuKdrxI82p+lb
         BY2iM4IB6zI9/iLl7xIeKHGyyZxUBXx1sa0h3ugAUt31bjcMQjCkHsUj83vRTvchNrZl
         B0CQspDZzliq1LiXXagB8tCZQYqh30lWVwfdkMi+3JMpJGq2hKYyX8yQKO84mXE6v6VQ
         0fCjpoDyIVkdn90HzHnTaEX3LfpHBF1Mg3dvu9qfxK6BFT7HBjq+5yoq4QG0Zf2d+ilx
         ljGA==
X-Gm-Message-State: APuU4Z93aw2OHa0bLpOXIfnfayFHn/r5nEiEXauTS/XSCPBE18FR1yoW
	ehCGgjDVT57Sw3WOzDetKIgyIuyvthvB1s8iOoaDpeYLC9MYjjWYWz7FOLqYJLE1XWQG1kuGFq0
	kTCsNkD6xsFxDJRPfDFbNQ6a/9NoC7ZpQzqeZN0jeYOidtWSwE7Nct9673/kAeDUP8u3W
X-Gm-Gg: AYBFou0/QP/H7VlvPRMhg/Mi37WwM2O4U3CAf6R3hRZxTdc8gxxsVtTpaHlNbnyNQq2
	HM2HRJV8DAiyLnOWt2r4sz5ZFN/lmtZYZzHVQ7fNpWuNv+HLSPrZRV9h+8WS0XxC7ZhZLSvyYCW
	NpCNJtBfn0FiONZwN3MgjxAJKYdSVzfLSFHupw10yz1C5vq75PJhjTQdp2D2ozjv00Mz3FFgcT+
	Lb6rpgT787Lbk/TRKgvP8R1c44PfWdj+nisQf8dQDja9KuJLrsOh4GHcFRedvF1Bs9NvhlYc/om
	XW86wTM9dtyLmjZ27FP5pO29rgslsypCQ0wb3W/zAWbZnEDiPeIdw2SD6RAVUxMos8Enh3JKTQi
	3+D3SrO5KPgTVgmrumsSGCfgkb8cGCG9mYxICAZzzirn0/jKmxkotW/HKdpK0bAl2UJU678v34c
	nLzeq1Ii5j1ZDdnKWylHMVeQ==
X-Received: by 2002:a17:90b:1a82:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ae89797489mr9555900a91.39.1793657106692;
        Mon, 02 Nov 2026 14:05:06 -0800 (PST)
X-Received: by 2002:a17:90b:1a82:b0:3ac:53e0:4ed5 with SMTP id 98e67ed59e1d1-3ae89797489mr9555861a91.39.1793657106224;
        Mon, 02 Nov 2026 14:05:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a04b8sm358654a12.21.2026.11.02.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:05 -0800 (PST)
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
Subject: [PATCH v5 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Mon,  2 Nov 2026 14:02:57 -0800
Message-ID: <20261102220405.30730-14-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX6hfO+kmnKise
 hna7KdNurGGkaFfOEDhovfpP8uoiTfNUV3l4wllzdYMWQ82yzPx6/U3w+e8Cyc9/BaIRCvrj88D
 sh2tF0KnZcQVN+dmy6k5Q8tRG+zHlag=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae90913 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Dhg23qV5XRRJQlZlKu4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXxvZ6bjd60aSo
 V9tIXlkROD/VNizpO2W+VT8U7kSa4tTjUhW1jmgGVqyGrpiuSbcaF218RgsEp9SMn+bARUhwVqB
 /O9KmF08zNUJaIDcN52wo7/YVfT0geR+MA5thyIgPG2Eu9yWfhHEC0/WghTewpA67vfYRAwnye1
 SGPE0Xihd12UXD9PKDlUG4wVWc1ZOeQ9Wm5CB2xiVLOhS2cAbawu/J9FetWTKfnEs+wjwy3TY7y
 K7CtR4PkigM931ZVSt7h8AoUJsNNB5/9/EPhHa5gww0VXEwHLvDzQR6kPAIk9evcjGcZrrBLPYW
 4AFP3mgGZ+XWwLnBiLCCJjDZfhzDTTY+MmttrIiVSNVduKsVK+ixyfalG8kmSyvUHPl1hl6gMG/
 jrqjSwDVlNSLGOKPVD7bW9tdyucSp2AMRD6XfJrPAFpti/t9JLhajLjAPSC67zfJUnn4z2h8a7c
 GELjBVX9hRhuZFKMALQ==
X-Proofpoint-ORIG-GUID: NXBNoDrNFqOVMCaA0EUkqbuiOIfitgMj
X-Proofpoint-GUID: NXBNoDrNFqOVMCaA0EUkqbuiOIfitgMj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020087

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 952c46f08d2a..0dd8444cde22 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -258,12 +258,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

