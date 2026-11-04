Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810195;
	b=I03yIzaVL/Fu36EodUab4yc4fq4IX2e99giAsHOF/rk1iaohFscIK+fryD/U/kr2R8V7
	 VKu7Yp5kdfS9c9FTs5DdCLtdx1e7sKOcGD2LWylHltw4BuEU+C/JjSzn4vYJXvkXurdz/
	 9BcMoWBOOY+vSO8YoEEK+mxe9lsMFD3Ey4Zh2RCOD+Kl8ZSPl+iUR2uFQNSgFcYSUfcAK
	 vyvDM3nM+HguHIQnj3/sV+EV75w17hw0cgRCbShuWvca5Kmxur7L91k4iIl73wJxmZzxD
	 b2vbqhVm8hH9HUBnvSdXvl++B/t/41C/32w3TF7eE+SIqeTaMIBkvMC/v1qjyEti+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810195;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
	b=ErVXDNkrT8AgQeWTkdxkW9gJWkkD8jEChyDwAoCK0HE/aiYCSG94FqcADFKIsg+YZqiH
	 lXN0zS5/vttjw4KW5QCVOfCdrcLr5sWnd5AJOQYvHZLPzAdL623PXqm28qD2AoXGHuN1J
	 7MK+LPSy/aNzXqenyRlDQhwXVqIqA0pidbZnkMMqWctUG6SGW7VcXWyQy21p8CeY4Ag+D
	 1g20lPanhHTnaSnw2GQ4gWrRYzjhtQ07/nTM3XIMRIdvVbQ5frqGQIe2RByuDcd2ukA2y
	 jRgBRI6n3uOpn/TyWW0PjXq+dIvt2x9BedIJYbZfnLEgoWlMvRwGnBKdV4OCguoXy4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP7Bpvk2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1Fxh9BF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41318606D806
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41318606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jP7Bpvk2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1Fxh9BF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FisxX2210748
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=; b=jP7Bpvk2XgpNT4vZ
	wIu0A6jDZUDNWqV9TJQ8/ScmE1SrzWCJEGMCkuPhZnUqqsnCH9/iRSZD9q5YD4p6
	2Vpsk8ooOl69g0EgjS2Y+hjxj4T9rOOUseg+DLHyG/DX9dOTtMtHdcQvsuoXYloq
	JH1CqLReCHPzY91KBWamyNdGMBKqpjfC11XZaoySD+73+gAVlEoO0xK0hHMtlWOn
	2JzP8JXCcPuYvRA+BmNfR5Mub0pRSOjj+G6UiQG05qpO6fBfXnml/O4Tqp75LC3c
	0swoYMt143rBOTWficYoFvLw7MjhFcKimYBOTpvhBorJRW2gs9It53MmGaxIe0Mx
	v0vljg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdrjcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:36:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7a26f892so20579866d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793810193; x=1794414993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=R1Fxh9BFBxjYG+cGBh9Ci7XZyRE4xGG5SYefBvnIhQRfDJBhVI28tw4Rr7A8qDUHWK
         yU6iSNEz6alyCjw9wh5POMEiiVVO/lyhW16/mtdCptm2Mu1S3yibolFeIWftSzNjQ/53
         uxHy8stjRdrhaY4OTjGUn5VwV/6eYqjzqO0hfV5clkan5MPDQNXF9AEmQVX5PcRdKjNY
         Z+OE8PWWWyxjgoV6mP14vuypcDNLCCHP0hDxB8IKSVUhyS5qPK8CCNmTOrLR6D/Ix0o7
         eqV7b0cfHM4iRMG9G7VDoOJhFMZMcixDrY5CpSVIqi08stTz35ObfC3HDUR4pbtp07hU
         nIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810193; x=1794414993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=hFU0NUdVu0Lxhb/1gy87TuoAZAFu4HrfP69NEXZWw1Q/xxosxWwV1XR65kfy1jN0J/
         WCsb9qXftCYAahHYjm7skCxSaLCNvcLNsqrBDc61u7uJIYsQYttvhhJuSXEcBLC70umu
         505igeEzGCR7cX7ogCQk1UlAedJ0w8PC9dnJyjXbfjxeRfPVR58UODkj1hMKBoYC1FwK
         BkzKSPs/wTgL2Y23mRkKGmzoXPXCcnC2gohJg9COAdBzkzYYVwgP3xjObKmUYb8BOT+J
         KnXcHa1PujX1nMiY0jkEYcxKkTPKnQ9zSQDmrytYd7UJk0iiauBgG4Q2Dmc7oZUcmSxN
         5sKg==
X-Gm-Message-State: APuU4Z/eL6Jin3weWjLvsPYfg2Syu8rtrotASI/2FzHTAJtiIgRFdOhf
	5fe8mQllp6AHTWeIdKVApCbyJqpBZKeU/flMvK+WKZ77/yFwxotj1WVeRG4qqbXqTjdl1QNNw5u
	oRr1ned+4u82XwfUAggqLZpeYHEyNaxmXK1f4FsndgziAgD4xPlgkhCB8nM3kcRGlLzO4
X-Gm-Gg: AYBFou2kcW7gAvRA08BjIUHrN0uOnDQWDM5x0PNAhmXC94XZwn4w18Fty/MFMNmInSc
	bSM9hqqFUcfafb+dUZIST6bLa+mUa8gb/m/6lFN5PTg8OzlZKF8mA0Yj3/b+FBhsO5Shrunq594
	5vevqIBy7OlRnGGhsR2ZdSx4af1D70FdTgDXWVyVr+qTAJa6iorNMtICkgq6IqbHEtJ/NI3A2Pk
	4dblpdXkHckaBp0BL2p+obZNwYgwBcUEiWgNEfRgz9ZwpKRq/Tbcp7Bn58dM86bdGuVQKvU6dVG
	lOgHIljH7P/kXO8rZ0cMFg2+T3VPI9s37Cb/VBqmTbtnNpYOXRoga0M2se5vU2ZnG14N0w6sL02
	Y6B1Lhe9ZL8juWlRKBG/zvf2PM+7AeBKQ3LGSeY+v+OmdZ9hORDHtdFXKK4m/FkKmrbUDbO4OXN
	JFpDOwVEVRC9Gx08euP/V8Lj6yRnKhrJmxcwy3+LbKoXbU1vsp6MpoPCZVxDDv0Q==
X-Received: by 2002:a05:620a:8907:b0:939:6de6:9518 with SMTP id af79cd13be357-944216ed973mr2970785685a.47.1793810193209;
        Wed, 04 Nov 2026 08:36:33 -0800 (PST)
X-Received: by 2002:a05:620a:8907:b0:939:6de6:9518 with SMTP id af79cd13be357-944216ed973mr2970777785a.47.1793810192681;
        Wed, 04 Nov 2026 08:36:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bed64sm5267191fa.7.2026.11.04.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:36:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 18:36:07 +0200
Subject: [PATCH 3/7] drm/msm: check UBWC framebuffers against their layout
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
Message-Id: <20261104-ubwc-format-docs-v1-3-389044012b4e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6xPvBKvXF4Oj5ER3IOirKs4PSww1szDN0iEI4yJmcYk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq618AE2Tl00L/YEMEv4dxHfGBuWN+CB2e3ikuQ
 fxCGeK05k2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCautfAAAKCRCLPIo+Aiko
 1ZbGCACaqv83336QYPjXUNoQwg1h/nFN+er0jSNcAhRx0s4e+WhQ4CzrIeqAWFtjDW8qffyGZ02
 WcJZGlgtO3VFacOiOh2FvGRAqQD3hC81B3RCr3eytSr8iiClpa1FdxLKRsVCf6NOpWepX3AYs0X
 EK8Hk0P25tnrX6GqMSgvnT9GITrMrWb8+xeP7iJ+ahScIHeWR61RwSkw5ubkev2DLlVAnzvWqzw
 yDmGVCtKGJucVDgAaIrg1HUYE+tbIfSMcHsIA50UzgH+CB9F1OpxqmaYQbB1ynGIqVReY7OFrR1
 Jx1if8K+frhXX184L5mOE4GVxGcg+27mcchUFj1F8YSfgrV9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX2u0J1owPW7P4
 3ts4gzwPa9HAyBor8b7/5JXU3soT0OzhtoLs54TFjlKyJB98dJMBg9EPttLjjveTMA77vUu+oEg
 HnjhFwEidh+OVgZ+okHQh6jf9jrgUug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NiBTYWx0ZWRfX0dzcs0+fR/Ny
 ZlGUUOIJtaui9U39BfBRTo9m3mOZ1zSIWii35x6kqcJAU52InKjzMYL+XHP5Gvq9K7yNOx969gh
 LETAKQZxY4gtFKRcSFlP7qyjZnY+lUqRq+ti+9NuRGUEkcCdsA2CBWBVwCFCJgJjHTjJ54kyyY1
 SgGfODwiR8PET/sJnsBR4W8LzQZpy4WYqxXoTOtWRD33qAkghpiQfmbxPdmPriscIxa3BxvIDze
 ryL7a8HeJx0pvppQ6A1kAMgyDBdJTFmg/jHCI1B+nkpXVCngAEp57nCjojUwICR4GgwjC7GoYBB
 ceqmmej3hBHlDm+w/bnzJitodJc9YPYkYFx8D4j+oOACg1NZo/e7mZn1+tui/Lw0Ey9tvTbcKGm
 3gdlwQJQbegFv992Vosxd30xgvH5j5QfZbUz4khkYZoyWSTiWx0+84iGBW2BZYZw7YdF8gu2K88
 BQQwbJN5GvTroucSVmQ==
X-Proofpoint-ORIG-GUID: cQD2jg2DMrzxIl4WGKCbsgTdv_C8Lk3E
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aeb5f12 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gedFiD_-BdM4RCKrvjUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: cQD2jg2DMrzxIl4WGKCbsgTdv_C8Lk3E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040066

msm_framebuffer_init() checks every framebuffer plane as a linear one:
(height - 1) * pitch + width * cpp + offset must fit into the buffer.
For UBWC this has nothing to do with the memory the DPU fetches.  The
metadata and the scanline padding are not accounted for, so a 1080p NV12
framebuffer whose buffer is 15872 bytes short of the UBWC layout is
accepted and the DPU reads past its end.  The CbCr planes are checked
where the DPU does not look: it always fetches them after the Y data in
the first buffer, ignoring handles[1], offsets[1] and pitches[1], and
userspace relies on that (turnip reports offset 0 for both planes).  The
pitches are not checked at all, as the DPU replaces them with its own.

Compute the UBWC layout instead: require the first pitch to match it,
the CbCr plane to be in the first buffer, and check that the metadata
and data of all planes fit into it.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 1e236416e15f..dd24aa7a5ee8 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "disp/mdp_format.h"
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "msm_gem.h"
@@ -146,6 +147,7 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 	struct msm_framebuffer *msm_fb = NULL;
 	struct drm_framebuffer *fb;
 	const struct msm_format *format;
+	u32 ubwc_pitch[4], ubwc_size[4];
 	int ret, i, n;
 
 	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%p4cc)\n",
@@ -177,14 +179,41 @@ msm_framebuffer_init(struct drm_device *dev, const struct drm_format_info *info,
 		goto fail;
 	}
 
+	if (format->fetch_mode == MDP_FETCH_UBWC)
+		mdp_format_ubwc_plane_sizes(format, mode_cmd->width,
+					    mode_cmd->height, ubwc_pitch,
+					    ubwc_size);
+
 	for (i = 0; i < n; i++) {
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
-		unsigned int min_size;
-
-		min_size = (height - 1) * mode_cmd->pitches[i]
-			 + width * info->cpp[i]
-			 + mode_cmd->offsets[i];
+		u64 min_size;
+
+		if (format->fetch_mode == MDP_FETCH_UBWC) {
+			/*
+			 * The CbCr planes follow the Y data in the first buffer,
+			 * offsets[1] and pitches[1] are not used.
+			 */
+			if (i > 0) {
+				if (bos[i] != bos[0]) {
+					ret = UERR(EINVAL, dev,
+						   "plane %d not in the first buffer", i);
+					goto fail;
+				}
+				min_size = 0;
+			} else if (mode_cmd->pitches[0] != ubwc_pitch[0]) {
+				ret = UERR(EINVAL, dev, "pitch %u, expected %u",
+					   mode_cmd->pitches[0], ubwc_pitch[0]);
+				goto fail;
+			} else {
+				min_size = (u64)mode_cmd->offsets[0] + ubwc_size[0] +
+					   ubwc_size[1] + ubwc_size[2] + ubwc_size[3];
+			}
+		} else {
+			min_size = (height - 1) * mode_cmd->pitches[i]
+				 + width * info->cpp[i]
+				 + mode_cmd->offsets[i];
+		}
 
 		if (bos[i]->size < min_size) {
 			ret = UERR(EINVAL, dev, "plane %d too small", i);

-- 
2.47.3

