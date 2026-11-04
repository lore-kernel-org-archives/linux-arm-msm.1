Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810194;
	b=lv3A8sYncJK5DV/W8AUOaSPgd3JueAzfgy4D+hxyr1leNLlXdn8qIzi3wySmefhPQmBc
	 BJrci7MeUJRkT7S/gINFZVaCalNBsIz2bKBW7wsnFNd0AeMUXaNsf/uA1nbYg5Zl+0fUC
	 w08lQoBvILL1CIzw4Gvlk8wwbNIUVWNSmMevWQNF7qyxk6vKbm2XpDtE7f8fvrhA3dA/H
	 vRb3RDK6MelvQ3qRwiOeMk2mnpH/Cip0o/DwRFE3UiZjlXuYsWrzsOl1HzRIzjG/7QffD
	 M/Rl/D9k9wuihNCKZ1tIVxjqLUlki3lSRMSLtt4/ShZBcwbET96JYdoSj9khzGcEHew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
	b=iYzJ0QKezHTh/uBguQnoVKhe60GRLYljKN2538BOk9zTU2WzuYz9kwOYZ2QEORe9YJ7k
	 kEF2flRh0/V7R7C4ful+j5PnkIoDkwX4mYccecfr8mMOsM9N9bAOZFzKx+wq+Y7qOQrPT
	 LjyQob5lE1ePmBx/zaWeFc/x7i+jLc8yMZ+YZGa0hj9IsmK+ElZRADnD/ppViYeJ/Kc0g
	 UrGSqU9SA1sPeXqkFUZqMcyow/qGBiMvHkvTfexjusM+/qKVXp9yWdqRF5Ri4TlR/FyOi
	 UpLfG8IC17YvTD3XpOlKgzorlSdLgoXyzjUFZMNB1Zm0z5MEHr9f1O6dh+5KpBRZUJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAED606D835
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAED606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UPinxDa4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yptl6ZB8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjAEL3208829
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=; b=UPinxDa4Nt2UZpDl
	TulAVH8nVYovHQv8fzAwCsFuXWeZMNZBhUR08kP3gZo0c0P7cyhzuhQLLTk+nZeU
	yiZ1LwoNHZJvHqa74xHsBXe8QCAMRcuGRJrK3uY82QAya+vCtBk9bYpBXTBGKmRG
	UJqnQCcJIQ02x8mF6aj4WSd8c3gPbSRBJNmbeWqiEQp0Eg3I4ZAn3yxPAX0Fn+oK
	3N8JeOsyhJqlbOrG/0G3o2mfYzxqJHmqC47MhKpPIemBzSuC4w9B8db6YIIUQiQx
	8UnXCThSmdBDFj/kazThMI+FfKOqbSJ1STJQkW9IcpMM4N6KSwqD3OU7RuBG2wdE
	cfVasw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0j87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:36:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so140928385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810192; x=1794414992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=Yptl6ZB8cZpRJli8EqKpUemjXR9ou+Qk1/ebLnrtTxG8c5w9ZgrXp+Fm0QVBdxOItf
         X6wITRKqm4QVxyIORl1Qh9jl06HL9XO62Jn/kgT1ZtwUuwMB9Ra3I9G5lIv4vaEe4ZBO
         CLaN1hkFGdlqu/uMwY5FjUkQKUJnmvDh8VANpHh5j5VmfT8Vca0Qq/IKe9ysM2HMVZAJ
         kawkNsroO/9trdvWyQZomR11HOKNHdGOzaDAyRZQoSGzlbWuHSZ+iZS5v2nzV8V1ugZa
         emDNxMPWAKnVIBXhcfr+0p2yKNjLi4B58ofhrsFrqF+vmv3OcUgtVCHXZAcL0FvHYb+u
         o8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810192; x=1794414992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztO2IiT8NvGrwJF6z2M1nRCSIyICFIk6z+9M0AD7JmA=;
        b=WApJ8Pf9pFn2DgSarvgPRJ+IaqRuEjybKJye2/0Uub1udozvxwivraz2preBaLm4jV
         OSh2EglmP0xMN+ibuR3JRifxFPC80PSJkXX5j9SM4Xk5vC94STBurJs3B/5s28q+wIuv
         GJ8eSrfS7OArJkUuKFarnnUOLmuuZlC3lxq4IEUdqJfpRJoSAgKt/TQQ0Ji74WVGxaSf
         m5fpFYIx8Qj6udkkPw1dI0a224EboPypgfuWTGON0NXNOHIBw3OJyxU02396Fy3udHIi
         AjVZ04Tf8moeppO2HEDlK5mX3Vwnq7OWT0XyxfN/FmAWs5T+aswRrcx+0mObHTVXkOOY
         8ipQ==
X-Gm-Message-State: APuU4Z+ZjhDqSVsCVPxlxJDn7vlG8MVupzOnJNeTHXCFGB+iIWCRL8db
	0457Ps7edaKYeO7qqQYxOkYCjzoFa6yHWIZfOUXt7mOmwjklSRZh7eshl9hMTSDXrrUj8yzYjnn
	akVvC4tXoy6VY5GJ+uhBPfDjUNHBoZeM6fgr0OP4j8MednY7qC8zh0Pgo5xmfZTrYu3bT
X-Gm-Gg: AYBFou3drMGwesz85U4CUetM7lEwtVYU6bCn72AVZu2p+nZOhQ/5ILHbVcLovnEBeHC
	mcDVvifiOLAxfO4DJ+zjpGlP+KcvUTuiWddPUz/kCLSuZHqnZfA8Qyf1SGrCuFI0zFjtAJ1QDIZ
	fMQuYkbmaOH8giRKSdk7PF+ujogxPO//1tVYeLtFUXDaL3s93LypZDFAvJqNzva8RAX1kjOy38f
	GH15Sv7+idixwiJl9RmFBCnhzgBTTmtZICkxeBv/6hmKtVJTpNtMBd0qUiLZRDt42OWgc2Y/1Q+
	gXZPZJKFmpoAJv5F2n4iVn4nUriJSlYexMnnBxZS1MOCpvTGpxMDfQl1HyT4EoJ1skJ7UgMhydy
	1binIGWCQ46SE5sclwYTMXyPB2kkH9k7EctdnYK/Li1FImTq9cQ+oX8QGTosbJ/+O/T+1Zoy6DY
	rWiXbusfCYMvp3y7jaDNHckYLG7EB/C7u5v7dTmvPdJqvOMrlYKQPGEq0VooNKwA==
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr449885a.13.1793810191956;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
X-Received: by 2002:a05:620a:1a0a:b0:93c:65e3:df81 with SMTP id af79cd13be357-945e16a6ebdmr438885a.13.1793810191159;
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:06 +0200
Subject: [PATCH 2/7] drm/msm: move the UBWC plane size calculation out of
 DPU
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
Message-Id: <20261104-ubwc-format-docs-v1-2-389044012b4e@oss.qualcomm.com>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
In-Reply-To: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8736;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AmdZZg62etbzqZIgQV9PfBSP69nkwN0xIASVNbPOxK8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq617+1qF+R24xmUAxP2TrQLUwrFxFuOgmulHi4
 q+hyZuqzDOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaute/gAKCRCLPIo+Aiko
 1VhKB/407uGmM/srEr7Xg12peHhJqPs7IvflofwSqDUSAHpCjEkv2nnWGoXqOXZ7YKXL8m3F1gS
 bAxd4PsxhqbAAjs174xGvVx/IS3Vpx0soEM04oSGvToWxLM2T8AAkjDF2rV+f/jrbgIhQiMNiLa
 zVXlTtX7U/BTu2WmHVdo6HykTJR5BgcL7C/CI/oExjTg1MQgiGJ4J/ZbcZbm8T98WGTbsYPXA6v
 92EsAOO5xaC2FjUU5rgsA7Ukjyy5APjya8pPCklsW2TidqrfZm8CcW0ctR5w73TSkIj9k/FmGy8
 v2N1w8DQHcmyh9+4gSrp3YZ/UU1+ZR/zYI44q65GSHvqy8OU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfXz9Jk3AhsG0Oe
 87Q47HM/JAmSI3XuF7FNbCwVkWq4gQOyedHiscja5Yrhzzc2p0gaWCMxP35DOiMUCqJvPCfszjk
 j7oiGPIN4K6yFzFZ54kOim6zrBwMgcEI1nHl6G0RFXHka6tsGcyxhnns3M0UhAifSQg0ryZM2zm
 02FQmBpI9Rr/VZ1gYZF634AyBtkx+xc7IPeLDEbFeJPA2JIwxPrsdnVaNqtlcoIIgWgUaJAdPhY
 pmYCqJR8WLaX4PlC6OoIqv/bLyvSRZnm0w76sjnfXKYRnhxAU51/MFZ0FLG0qnfbG/k66OKaK6y
 IHcwSyca4G6hdEiFxXG+2Nw7RqFKlVHYejv8/tNatrJ2TRRQPg1DdxE4HGa8CCOZpJ/QjsiINOw
 KbYHzr91CRqfw/TKI1E6lbR9A8rCAXXSJ0l49ZXWPFBrZeQLKgxy5zEoQ285WaSk8QEegOPtfSd
 o63gMNoKj0tLqxlts/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX1jQvBNaB6oMr
 gGGVhSTvmLSzCKiV3no1pv04/I0Q3nnytWhf0QORt3fsJjmVnDLInlPg7gTtlhv4mmj48ufS7+l
 doUunv6Zwz2X8S1yjSVaarT02MVMr6s=
X-Proofpoint-ORIG-GUID: P4UnS136GZ9ZFOqU9Ks_BITnSap5YUok
X-Proofpoint-GUID: P4UnS136GZ9ZFOqU9Ks_BITnSap5YUok
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb5f11 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iK4Z-rw_lK1HlppuerAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040066

The layout of a UBWC framebuffer is only known to the DPU, which computes
it from the framebuffer at atomic check time.  msm_framebuffer_init()
cannot check such a framebuffer against its layout, so it applies the
linear size check instead, which neither matches what the DPU fetches
nor what userspace allocates.

Move the calculation next to mdp_get_format() and make it take the
format and the image size instead of the framebuffer, so that it can be
used before the framebuffer is created.  No functional change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c |  84 ++---------------------
 drivers/gpu/drm/msm/disp/mdp_format.c       | 100 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |   3 +
 3 files changed, 107 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index a8e9a69834af..06903325e7e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -10,8 +10,6 @@
 #include "dpu_kms.h"
 #include "dpu_formats.h"
 
-#define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
@@ -58,87 +56,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		struct drm_framebuffer *fb,
 		struct dpu_hw_fmt_layout *layout)
 {
-	bool meta = MSM_FORMAT_IS_UBWC(fmt);
-
-	if (MSM_FORMAT_IS_YUV(fmt)) {
-		unsigned int stride, y_sclines, uv_sclines;
-		unsigned int y_tile_width, y_tile_height;
-		unsigned int y_meta_stride, y_meta_scanlines;
-		unsigned int uv_meta_stride, uv_meta_scanlines;
-
-		if (MSM_FORMAT_IS_DX(fmt)) {
-			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
-				/* can't use round_up() here because 192 is NPoT */
-				stride = roundup(fb->width, 192);
-				stride = round_up(stride * 4 / 3, 256);
-				y_tile_width = 48;
-			} else {
-				stride = round_up(fb->width * 2, 256);
-				y_tile_width = 32;
-			}
-
-			y_sclines = round_up(fb->height, 16);
-			uv_sclines = round_up((fb->height+1)>>1, 16);
-			y_tile_height = 4;
-		} else {
-			stride = round_up(fb->width, 128);
-			y_tile_width = 32;
-
-			y_sclines = round_up(fb->height, 32);
-			uv_sclines = round_up((fb->height+1)>>1, 32);
-			y_tile_height = 8;
-		}
-
-		layout->plane_pitch[0] = stride;
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		layout->plane_pitch[1] = stride;
-		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
-			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
-		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
+	mdp_format_ubwc_plane_sizes(fmt, fb->width, fb->height,
+				    layout->plane_pitch, layout->plane_size);
 
-		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
-		y_meta_scanlines = round_up(y_meta_scanlines, 16);
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
-		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
-
-		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
-		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
-		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
-			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	} else {
-		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
-
-		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
-		rgb_scanlines = round_up(fb->height, 16);
-		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-
-		if (!meta)
-			return 0;
-
-		/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	/* RGB metadata is fetched through SRC2, SRC1 stays unused */
+	if (!MSM_FORMAT_IS_YUV(fmt) && MSM_FORMAT_IS_UBWC(fmt))
 		layout->num_planes += 1;
 
-		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
-		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
-
-		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
-		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
-
-		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
-			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 33da569eae5e..c0121d709110 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -650,6 +650,106 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 	return NULL;
 }
 
+#define MSM_UBWC_PLANE_SIZE_ALIGNMENT	4096
+
+/**
+ * mdp_format_ubwc_plane_sizes - compute the layout of a UBWC or tiled buffer
+ * @fmt: format, which must use MDP_FETCH_UBWC
+ * @width: image width
+ * @height: image height
+ * @pitch: per-plane pitches
+ * @size: per-plane sizes
+ *
+ * Plane indices follow the hardware: 0 is the Y or RGB data, 1 the CbCr data,
+ * 2 the Y or RGB metadata and 3 the CbCr metadata.  Planes not used by the
+ * format are set to zero.
+ */
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4])
+{
+	bool meta = MSM_FORMAT_IS_UBWC(fmt);
+
+	memset(pitch, 0, 4 * sizeof(*pitch));
+	memset(size, 0, 4 * sizeof(*size));
+
+	if (MSM_FORMAT_IS_YUV(fmt)) {
+		unsigned int stride, y_sclines, uv_sclines;
+		unsigned int y_tile_width, y_tile_height;
+		unsigned int y_meta_stride, y_meta_scanlines;
+		unsigned int uv_meta_stride, uv_meta_scanlines;
+
+		if (MSM_FORMAT_IS_DX(fmt)) {
+			if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
+				/* can't use round_up() here because 192 is NPoT */
+				stride = roundup(width, 192);
+				stride = round_up(stride * 4 / 3, 256);
+				y_tile_width = 48;
+			} else {
+				stride = round_up(width * 2, 256);
+				y_tile_width = 32;
+			}
+
+			y_sclines = round_up(height, 16);
+			uv_sclines = round_up((height + 1) >> 1, 16);
+			y_tile_height = 4;
+		} else {
+			stride = round_up(width, 128);
+			y_tile_width = 32;
+
+			y_sclines = round_up(height, 32);
+			uv_sclines = round_up((height + 1) >> 1, 32);
+			y_tile_height = 8;
+		}
+
+		pitch[0] = stride;
+		size[0] = round_up(pitch[0] * y_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		pitch[1] = stride;
+		size[1] = round_up(pitch[1] * uv_sclines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		y_meta_stride = DIV_ROUND_UP(width, y_tile_width);
+		pitch[2] = round_up(y_meta_stride, 64);
+
+		y_meta_scanlines = DIV_ROUND_UP(height, y_tile_height);
+		y_meta_scanlines = round_up(y_meta_scanlines, 16);
+		size[2] = round_up(pitch[2] * y_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		uv_meta_stride = DIV_ROUND_UP((width + 1) >> 1, y_tile_width / 2);
+		pitch[3] = round_up(uv_meta_stride, 64);
+
+		uv_meta_scanlines = DIV_ROUND_UP((height + 1) >> 1, y_tile_height);
+		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
+		size[3] = round_up(pitch[3] * uv_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	} else {
+		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
+
+		pitch[0] = round_up(width * fmt->bpp, 256);
+		rgb_scanlines = round_up(height, 16);
+		size[0] = round_up(pitch[0] * rgb_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+
+		if (!meta)
+			return;
+
+		rgb_meta_stride = DIV_ROUND_UP(width, 16);
+		pitch[2] = round_up(rgb_meta_stride, 64);
+
+		rgb_meta_scanlines = DIV_ROUND_UP(height, 4);
+		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
+
+		size[2] = round_up(pitch[2] * rgb_meta_scanlines,
+				   MSM_UBWC_PLANE_SIZE_ALIGNMENT);
+	}
+}
+
 struct csc_cfg *mdp_get_default_csc_cfg(enum csc_type type)
 {
 	if (WARN_ON(type >= CSC_MAX))
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2840e8a5052d..02fde07eb6f6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -204,6 +204,9 @@ struct msm_drm_private {
 };
 
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
+void mdp_format_ubwc_plane_sizes(const struct msm_format *fmt,
+				 unsigned int width, unsigned int height,
+				 u32 pitch[4], u32 size[4]);
 
 struct msm_pending_timer;
 

-- 
2.47.3

