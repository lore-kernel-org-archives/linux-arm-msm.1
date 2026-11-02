Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657068;
	b=uPFJ/MGpOlPlsXHOGDNPXNCuBCIJCbm+qhk5ezNPZH2AjthOoK8s6Kvw4XQhAg4deWcA
	 gn50lD0+KG2x4ua0H6yeUiPVCxXlFlUwnF/Wo+tT+0a3C9PLPeM5yR7X4GbKVTcKYC0Cr
	 ItdgJ/z29+aqK8BvyF6wxe752sxoFSyMneedlBzmk/DY39qfMqZxnMwxKw9WWUjkAL+dN
	 x8wg52sPhAds0sU9AjTzcF8KyhDp/WLVFf+DPW5f7JEB4FqW/dn/N1Xuc+73RjGvFQhdI
	 WhWkMIEKiAcSlzG+89jwHIEDAyM55dY4cBD0G0O8+2dCSJg158ASkwOwPs0vCDMslIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
	b=wK8SoFZw9gAybZJxFBoflEIERk+03Mq3nVdB7MjyBlCKTQuaZj3WsZPKVOVfm9wuI2AQ
	 wLzB4XyiVGUmoPfU61I74w2qS48/J2ktim5u7SeAllwrb6uyAM1MzqoVCbK0ruEFCeGap
	 F0EAyXd+W5mFP9ln9S5+W8LHozJrnU4Ur06cFqAQLQH+D0fEVwkcI0xedv22hMhAvkQx1
	 IbtD9fNs1z1O5Qnu60QwlVoCFfyDc9U/JACPR1VP3PqIecgt0u/UeYs5Uwj/L6kqxEV78
	 Ukv7mq4bbmQXVCMrbjsohphPc8U6LePZlQT7w3ow4JosxdA6rQDzahFTxYVdP4agdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkmAvFQB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCdYQQ2O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E8606D80A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2E8606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkmAvFQB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCdYQQ2O
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6JFv166313
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UVX7b6ntdrV
	+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=; b=QkmAvFQBgUfjfXijqq/A5REgF6Y
	jC9bbnv1NTlDXxqSq2C0Wq15r6gzGRQStGF0ZWFegV08bMzKigcGapXV9BUrGr9I
	2DMkVScXZ8XWFYCOqlcpHCn+WLj4OWjxGkiVTHfBN+jidTDf16MuvgU1uXVWP4bT
	0w5Jk4wp/ruk8vCeOa6gtl0mgnt9P6Qvktxy+BgUh187OIRZCdMktGTsV090pKdu
	EyRdet7RYIFIyZKZP9vLg54fyBhX9M1uoQOsTbvagQ4eXr18zSiodfALG8XiCTCL
	fao6uLW9+vk3vg48FMLrIZlkZ70p0ZQrNN+JsBR/HGOyM2I1E1Lajt3D0Iw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrk4gn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so57581a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657066; x=1794261866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
        b=JCdYQQ2OBf7Z31HsJ0eHMm35Pv175iChZsctKnDiDsjTX4p986bkQZT38/aFPdae0K
         HYOoxkir9k0GyLhZmai/7k5qo2Dy1zyQ1t1wHFkGLo9Pt/0GzeDVcX7ugLCT9F7DjJZw
         X2o/Pi7hu1ZiJWANqpgrRCLj9d4+QX++KydyHjnrNKEC7z/gEC/iC5+eC8dN87tQzlRu
         HuCoQEMngtXvFOK7iSr0k/qv657kOAx5pID9m1R44Dpq2bG9NMDvXV/y79ZaVyH38z56
         Mww8ABkgtQ97IiAKY/VrT9qMBGVIkiycbxbJNoylWD/MW2jdLaR3EpUst0aW7GecKQPk
         mRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657066; x=1794261866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
        b=dXH9W5lM9xwot5VQRkgYX876PCJoGG4SPbXXfU++qzz/7V0wfQDsHEZ0NA+Tcr7EzW
         o6RK88y68LNbUaYuOLYXHsX9hSg54nyVy4kXPA1tmhsFSevgLYyXj+XMJKl5GNV5kNRF
         LPz94Y3E8ADNTTb+Fb7bTf6kxtopxsqfVCT5XsXjGRDJSi1QO7RBkjSMaIz8LRhp6ooY
         CP2qzDgp0eKIGE7bhbrjRiOrmESHY+OnTqUUwlIwYi1YgopfYDjb52yCNHVYF7xpZDuQ
         VT+yWnASEQsaTvSQzMYQQZOqSdhmDniyxklKCAd/Js9s9GuLmcp9GpmsLVCtJYv5FW0+
         gE4g==
X-Gm-Message-State: APuU4Z9o7fK/oX7MD792/7G6Lp1LkmMD4AhYFodOx1GyQNfPTasi6mk6
	WOQVh4khcLm/9OugA8CG4qVP2ckKIEfezEdgu9ygv9XB6SlkIKRkNrwvQVWT+fGW7LX9S3rZDVq
	mMQUnr+CBTE0pgmNIUNPtAzM90Lc2aATYfnHBo/Zv9HVK5NozI22Vty2I7Y/ha3CCNPuR
X-Gm-Gg: AYBFou2NH5RoBItCutdPRcIWLMZy97IPhAwlZYEIzI6X0HNpBCLC+EcasX7HOZErFc9
	Z4KLG4xh2TBwR6Q5LYxcGgK16Tx0Yf+2q756zfK0t8MfGN7TuDCeGaQ+HUXqc6iUE6IwqVPzhhv
	PdKv0GedoOSlvtjrdi9+x5Zydh1CfE1lc8MDCom2Zf0m8gEWHI+pFvbEVrLqeDcA6ve/9bjauR5
	m3wJDcy8M/8dGZ6P892T9v6gmgpI8hHHTZu1ZgSpdSI9tKNyIDuiST9LME9jVIFukpB1YDzZs2H
	h/UZ4l3evEROWrAn/hFimuY7LcOKYObIoBRUFqi7mexVqvpyKy8HlHw8SvrxFxigeSDeN9HJaew
	dGrOjopCwd9BqAsuJchKlhGe9+/jtDQje6YMLwA7xH38GgTEajBnupUvKP5DcdhXlajPLYvZe1k
	xC2hQYABN2YPnUxYsywE31Lg==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr6338410a91.26.1793657066448;
        Mon, 02 Nov 2026 14:04:26 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr6338379a91.26.1793657065968;
        Mon, 02 Nov 2026 14:04:25 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm953756a91.8.2026.11.02.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:25 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Mon,  2 Nov 2026 14:02:47 -0800
Message-ID: <20261102220405.30730-4-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae908eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: CmxJrE0H1s3RRppQJx-LVDxFieoOta1Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7+g+qCksIxf6
 4uPtjoyMZcm7amXJV+TfklZaaUgWdiUsp3zhZti6yRbd6L9dXFZFbgsFsgqdPt1Qpsf8UK7Li+Z
 FE2E3GVWYTQP8kFpyaFPqVYayymVKnY=
X-Proofpoint-ORIG-GUID: CmxJrE0H1s3RRppQJx-LVDxFieoOta1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXymCNSocumbFn
 EcGXhFeGUSevu6rb4EuUy3M/Ec2mUfrTwjGdhTDRf2dC43hleQLzKX2pSEdgKMNBAdnsoalGK5p
 LqSMBXJ4KYOSfSlzgUrnBh3+wvja7pR05li58HkiXd4RuKyuQZ7oilWoAH7tT5sU9Kgbhxs9mod
 A0ppTmK89iX8mFm2BNwV7yJZ6e6t8iXD3/cVGR+pOR1a1a24MGMhd2aVlaJA/HM4JdyuXTFgV8c
 /HvTcA4n7//azcq+GKgV7LoGTlTPw0gyOpOfbdaqp5GNIl80MCkYJrGBExVsnXMCz0D88KDdmAV
 CihtZyNctrOEjZ6+v2GMQxcTdFptsniqFU4C43iSKDcrkMj7JbiIf5otu4CG7CeGvfk01+CGR6p
 UDBy/FUdCio3emACU/hfgfgQ9C4xMAC5qxhQ5pGMrzaG0YGP5wz7D4nNEn+t99zTknXH3FDRE8C
 g4CmtZoxT1yCWHXbImg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020087

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 46e2b921f4ff..83c0fe39a44e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -349,6 +349,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index afb115c3d7eb..f2b635497811 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,13 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 val;
-
-	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
 	if (a6xx_gpu->cached_aperture == val)
 		return;
@@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, val);
+
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_acquire_raw(gpu,
+		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
+		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
+		&flags);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

