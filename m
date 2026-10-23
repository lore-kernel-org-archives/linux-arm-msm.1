Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797942;
	b=gBcfTVUWF2M1gfDOBNKzyO5zjbszrtKeaCQuYtgCRBaSWTe6VClPYPzOGw4YrcHy4/FD
	 jvLl26Tu6STmofdpsacs67R7uaPLrbBn+Hszb6+SgGnX5gl/prR+VpKQGsX3cLDVgqIni
	 thwEr3RCP+x+L94WjnVSmn7kDYA1onbgZlZdLWmGrkWkTzurH1t8C2r1hjbrhFXGp6ULo
	 VuCL5LGpTk5lG97VWNeUR0sxh0CPXg+2afg16X44afQRTa+m+rU/ciyfJGxgVIVsvOOek
	 svFqFpv6BLVQFKew0biiHlpw3D0u/tN728PdhJm8c7PprmbNcbliIYjt2KMngx/6P5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797942;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
	b=VcfSKV9XRdKC1PYbE3aUOq0nOirMF0GR+mDkJC3ztn1fFNQXSLf3rodTdFlzJWyMETeB
	 1FQA6Im5wT6bh7l1Jvk/OgNplHmtPbr473rwTX5NP1zdIIO0X3af5/7x9Fw9pJaagioqs
	 dazrkaLBSd3uI2Yz6u3UjR2/wj8l/7nXtKlJiSugCBQXFUacZ7VVsj3RC/bMHovmNn4sh
	 QPRsQySlp7YAaVcr8FCVZITMQNaIyITzTxV6uaejuFU00scO2L2d7W/PGosJh7WHhdkpM
	 b01J7qvK69OIzFMZX+41CK0tHOxchLJbQIAMtqUEjkZDOpKMVjAM2q3KHLgnuEFIEdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAMUadzW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5JtdAnO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C4606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8C4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VAMUadzW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5JtdAnO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvBgB371942
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=; b=VAMUadzW8QYqrGu9
	7KnooXbqalCmP3vcFXzD/4gl0+5Ne261n64gcBT2WC1Rf3gnHzn7egpyYCnHPdFr
	ITPMIQvlNPLWb8K/SDtZh8cvpY+MizbVFBXuQG77I/WTnHGji7qysQIaK28ObyTl
	JdrqLGozTY7gwGOZel6YnoEWk4cewM6QS1djafInqcws9RQyVfw/+ilqm32ZGfz8
	gLGONR7HK94qqJDz4zxq6U4ySoocqKXM4olF+79Lr05M0s97Wes+HuvaMKNW4Sg6
	X/uMvW++GS7f4rYHrfeaaMfMJIRvscUMHOawC8jpbwgyRUJ/6wsvazh8bEHx/56v
	OA0KkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89c26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so302966985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797940; x=1793402740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=F5JtdAnOch2Kvn1eUID2amG5BZ1eKY3j1VXuEHFYnqmwr9HVUDXmOGVWeNK6S2Dbic
         kmC5huR81GXQdjMWl08hwq5PP5JICjMAtplu6I3ct6lj2Qg13siV5j6xAxyeIRE2w/nH
         2rijGoWWP4OYVnsoBp1rCNMrzBCFgT4vnPQKV/sNbK8nemsWHPis341nut7Mpbl7Tbea
         Yh/t4Qx2DPYI7UDWM+MufH4VsRN/UdwLf2jkCUNgwU6rJYwW5eWfQJrm6TQAYFbCvBKG
         IjhOofsc2x6CT78fwFxdcKubGc5f07NyqCasD1TALJZEi/wKVbohS/nUmxfc8ar4Izmr
         k2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797940; x=1793402740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzYthhdeMcdRou8ifqNIfMhlH/HIK3Ow9DgwfN8Um40=;
        b=c1nj/MqNXcwo4UyTnNdHjqNFaEFghrCE5vVvXdV5e4VWwAS6BnhMp6C2GsERfvu5ws
         nml+woWJwGtwtHdZnfQ54aYJUxklir/K2cxTHEMjZd0lzyyZXDfs/WH6SgSsAPZOee6D
         Vz5o3flx3QB4vqQWGlFuXwbjoaZFQEjRbKGS2+8xHOGuWUf4xCuiE1MrPENQlLeAJiVF
         8sKoPU0PeC0N9iwrhOHpXJBphJguVNAuAlJLi+x/dZW9l4WJJz2jaxlOhSfGYf894CPI
         zZr+Ank39A5lIpbrwtQBmkAQryQuENrszXoh3/E+fpTg2/5QH3Zc3rAVKvYeIGztUo40
         2sTQ==
X-Gm-Message-State: AFq9FYK8C9PqrOYxujLF0BiCr8cvUVX1kpkvamyCMH2OwjvKrKA2cJf8
	k7iKWVWhHh7z1O+QYw91qPKpPGNSqsIpto6ZBJUK4YzCfCSQnlO2Gs0XuMu560PHO1M2zsyduNk
	+mqY7QyWXfOt/uEe/49VUUXsE61usOO9s9Gw8vW1rL/5DBBwRfDRwdX+6mpiFCmdp8/WbYCpaxj
	Uw
X-Gm-Gg: AYBFou3m1swvEojO/xy+wRvacsZJVZdLm2KxCSwsY23mQBov4SuPl3l5a/wVTeD7u9d
	Ry44S2ES29yqnWbp2cBqX/uf8nJX2AhNEvmz8ZI3PEsOp+M+OeIT8zIBChP2GcgUkT1/3CQog9m
	41sWtyqH7DMbYhgvmmreXATM1JY+IlVX6m08UFpCPN8ybGKyL3g04vCwAsKwgA3i8ckOkffrkhg
	T5LtztepcGUdN/nL/e1ZdPmfbnvz5DGNPUrj/ro1bpxuUJdivGPwM9hEMBM9IwFBcvIQEX0Xksl
	BHxQ87PGbSUS79Vc0nFT5OQkaNxaiCJjqCAcw4x9PlHuOys4NV1qt6AXlnwrx9o8M/w8TXYNXH2
	XI4tTaPk2wkvufAx53s7xuPJiPc5jZ/jJS1ZQvULnJN9LJPACig4zIn7nSNnMKjMiHY0e/dvDLz
	BcMj1ziNsqYPp8
X-Received: by 2002:a05:620a:45a7:b0:93c:6e1d:96af with SMTP id af79cd13be357-940ef96e35fmr83466585a.49.1792797939724;
        Fri, 23 Oct 2026 16:25:39 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:93c:6e1d:96af with SMTP id af79cd13be357-940ef96e35fmr83463285a.49.1792797939152;
        Fri, 23 Oct 2026 16:25:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:22 +0300
Subject: [PATCH v5 01/10] drm/msm: serialise framebuffer pin state
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-fd-kms-fix-smmu-v5-1-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pamYy0cN7nsNt1AdJwY6+IG+Gt3DwvWS5HicK2xuXmI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zlx5d+BC4E/Dn58V2ZAbiHRmaYLqNSXz+YP
 6gqgHdn6W+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs5QAKCRCLPIo+Aiko
 1daPB/9opOYYqJncg0k4w6fjr/EYYKDQfIYLXhPJ4RaR7SSBnrC1r8P6mu+1aUaGbnzB5cTuWRG
 nI2f/05zRx2rqqKiyABRqxOh+HxRDgi55dZqQe+GIwWRuls/ZY4avwoz+UzwBgOb2jPA80pqjHq
 WMevVMtnVznsFQsO68WMAug+GjEMcX6QWIa8YVZuY0NmjeiUZmY+cj1RWWQCIIW8cI7nHMawLYb
 uSKjw0peTf3L362ITK7PyV1rcJ0U7iARC28m6KMOez587EJkqjTgvWhstDwd49L8qmWKO4Wr77Q
 DGsF5g/kzyQqyVcCUTuZ6W7sAkZTvNmJJPeB2jRCEIqvvs++
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX9hBz9Dp2/aJj
 8/BEXsAvA2NqP/EKtx74Km9r2boXaTxEhiSBPqwDMxGlun08GAXodlai4sLzViawxac15MQwwyI
 WJSNuw0Wl2dh+tTawDRHnN6xgKDIvmc=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbecf4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=xgb_odkXjkZCwJ4aViYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/oNGMcggYQoR
 U1pCXWrW65p2kwpZX5BhePLBnydJkjf0LYw754YOj6iIcz/yPFcF6klTvuhiC5wI6qvKelmhn5E
 q3xGA81O2GZp8W4w4dQRiXLJ/4+XN8NZKYrhhkPg3yTUS0OR8AnZsxlFeix5EF5ZqlSsKLwK9+4
 mnUBSY70vCTVaeNrw/c6JbWue9cHpSn/3Au0dgJ9Nu/snOEZE6/tiQ+Kgiad+kKZoMqDRdN5wcN
 biwfkaM3335jydNy5nUyjD6L2gXZJcEyRQBBRzLMOZZqI9TZrYok5/zqEBuRUVpM7jE/yM3bw/R
 n1dnAy5FW+Xt9B0ouhYg1cLdbfS4FzKSC/3WVJzK6LkEKH41eSEB2SCeHf9tFlCnRMzsOcVKhO4
 GJOfTmymqyrBHL+aoraBSS+MOSLZWXaai0lyqU0408pawQ1VeLcgENQuIcPZWAfo3KJW6RgqIkl
 loo7K+lBZH+4lxLsPCA==
X-Proofpoint-GUID: _r--SyqIzBuOd-ASCJACWPw3BDCMD17P
X-Proofpoint-ORIG-GUID: _r--SyqIzBuOd-ASCJACWPw3BDCMD17P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

prepare_count, iova[] and the pins they describe are updated locklessly,
but drm_atomic_helper_commit() prepares a new state in parallel with the
completion of the previous one -- stall_checks() only stalls on the second
previous commit.  Commit N+1's ->prepare_fb() thus runs while commit N is
in ->cleanup_fb(), and for a double-buffered flip that is the same
framebuffer:

  cleanup: prepare_count 1 -> 0
  prepare: prepare_count 0 -> 1, pins, stores iova[]
  cleanup: memset(iova, 0)

leaving the plane programmed with a NULL base address:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
      iova=0x00000100, fsynr=0x3e0023, cbfrsynra=0x1c00, cb=11

The opposite order is broken too since commit 8ac37c88f991 ("drm/msm:
Refcount framebuffer pins"): a prepare which finds the count non-zero
returns at once, assuming iova[] is populated.

Both callbacks may sleep, so a mutex will do.  drm_framebuffer_init()
adds the framebuffer to the object idr, from where userspace can reach it
before msm_framebuffer_init() returns, so take the private state out of
its way and initialise it first.

Fixes: 8ac37c88f991 ("drm/msm: Refcount framebuffer pins")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 60c108d35d2a..a38e5b3a1d1e 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -22,9 +22,12 @@ struct msm_framebuffer {
 	/* Count of # of attached planes which need dirtyfb: */
 	refcount_t dirtyfb;
 
+	/* Protects the pin state below: */
+	struct mutex lock;
+
 	/* Framebuffer per-plane address, if pinned, else zero: */
 	uint64_t iova[DRM_FORMAT_MAX_PLANES];
-	atomic_t prepare_count;
+	unsigned int prepare_count;
 };
 #define to_msm_framebuffer(x) container_of(x, struct msm_framebuffer, base)
 
@@ -45,9 +48,17 @@ static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
 					 clips, num_clips);
 }
 
+static void msm_framebuffer_destroy(struct drm_framebuffer *fb)
+{
+	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
+
+	mutex_destroy(&msm_fb->lock);
+	drm_gem_fb_destroy(fb);
+}
+
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
-	.destroy = drm_gem_fb_destroy,
+	.destroy = msm_framebuffer_destroy,
 	.dirty = msm_framebuffer_dirtyfb,
 };
 
@@ -81,7 +92,9 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+	guard(mutex)(&msm_fb->lock);
+
+	if (msm_fb->prepare_count++)
 		return 0;
 
 	for (i = 0; i < n; i++) {
@@ -106,7 +119,9 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
-	if (atomic_dec_return(&msm_fb->prepare_count))
+	guard(mutex)(&msm_fb->lock);
+
+	if (--msm_fb->prepare_count)
 		return;
 
 	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
@@ -199,14 +214,15 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 
 	drm_helper_mode_fill_fb_struct(dev, fb, info, mode_cmd);
 
+	refcount_set(&msm_fb->dirtyfb, 1);
+	mutex_init(&msm_fb->lock);
+
 	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "framebuffer init failed: %d\n", ret);
 		goto fail;
 	}
 
-	refcount_set(&msm_fb->dirtyfb, 1);
-
 	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;

-- 
2.47.3

