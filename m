Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972686;
	b=pfolTqMCgtCqDgc5AfL62ApvP2otHKnBFd5pxtZCiisGNoIvsexLHFVViP1kLStQqhol
	 1ZgJOScue6XyrdTeyOjb1E2bgyxAHKkgVK3CI4Qlm74TnBfGU+e9dc0Okm3vl3TSb2WbZ
	 3MUqQIQFavoxcn8n3SfSOsAE2u+mx/JdesIM/AjHI0APM8NIzkimBv/Rkh2rUt4aY/4Gm
	 iPKWBcn8uN4vPih0/RVXfjChMJR31BpHYNjFc7IYHxtNNOl2et9JlsoJSUe0KgL8zRe8B
	 yT5JbaesPQv4yMcAQvMS5A7gwQukV4/CDwzonTdIaVnYu1kQNzHFq5CUBU5ljoABceQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
	b=2NxBKCakQ+0u1EnzdZDw+68vZ8d7u7EJiykORVQkAbnJQ2XhTkDMIX/t64zCgTBJsLuE
	 6ZTqKUp5GqvdMFfnTj61bxRl9kV7/sbFazpG+Hlo37ZLGUM7t/tBuAhofj6pbBoQeY7DA
	 LnFE09A2etsxlLM0F2Ky5EHFbCRWt44HTQlKIDrXvkLw+g9qpKy/AAFh9YDCdtkjnxBD9
	 em9aYi3yrenuG2UXymiW7HZtPnvfFKttMciSxxb7LHmWu/+Yojjn/f6aSZOl5HNhHNIsH
	 Q9yXGVwRFeDtmSVzjl3nywwTNCsMlnK1NaBkPpjVuEiAbVhg0L7q4N6vPTcmlj/MRzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF9606D816
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AF9606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GBZFvIQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDXug8j2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APBrB444198
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=; b=GBZFvIQTGt0yxwew
	VfjJMKC3DWQx1y5HV8xDitYh8SRUZi9Pn1fpydibyFVtI2IqNBQfXH1dXIBmjcku
	hMOREk61sIunKEnxGLoLN8TQjHMXhefPF/9owEwxlCPR/KS7Re7XSj2fHNKlMzsU
	3Ysd+MWT1jXNdpEC1Q58tZCbmcBhH7YfJLe2+uWb30ynIf8VaWMd1UYqLuHo2bJO
	YbJoha7rvUYiQseoBx/kBFyffCpO9tL3NIPq2fWv8RfiUUAwrPCPYNl3MSjrSonT
	ZR4fKfsy1AOCONSQFs12AlKwzlj5LiLD49zAfuK9mkWMQBw/84ovrFC9l7fcP+HK
	eewsfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u1g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:44:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so155197985a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972684; x=1794577484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=hDXug8j2X/I4oITO5Xh+cdongdUf8XlXy9n7FuLucoxh8j8ryaqFjJMd1FfWFYCOij
         UQ87gqCVmSqq7YAd+SZHX2nkBIIVjxKr6WzhEXAyZdPXDhvE8KDZJthxPkqHJQ9UNiSf
         f5IXkHTwSvB8Hey2NAhnJuM77Q+MFXEkTuuS3a3mh4QtyC5Y8MOoj+4HtADTQLAbDocd
         ZTNVgM5FP+8P0bb9YOQmkdFLsKn7ewdPWsQauBqrGtZtsB0wgBnCZmxf7FGi72aaUf33
         N332qf/mQ6dgE/AFae+J3VnP9kp2YExa9ccayFUzPbFWwsx9GI89b9GMK554QCEvbz9G
         MT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972684; x=1794577484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xvpV7huPZOlel7iSSvUNNhoLboYoj8TboGt9Ixyle+o=;
        b=vYVYbFWQeBJzcAGFg4MM15zsemm2o/ZVLgOd3iefb29jIbDlXpBADd5kXy5gQ9YDeI
         z5QsUpcPnkwbBUdiUTdzoMI9S/tWkGcEN4/T869oaXhmnJ91t1uR1jq/u+pl++1OelCv
         br2XqEGL6Im1xWRmjHy91tDDEXRK+I286g0UmcDo7G0DE4na0e6xBGNZe9AqzJWr2G7S
         B8gXYfXkS+x5AIBgkXCYx25vc3udO92NjSds6yXVVOYW57CvxlfW8Lk0o+Z0+poukX8z
         IKU5ozji4Awzd4i7wREjemGoxBsQFdpU10CsuaWeRuvi+bshCGCMzh1tfS5Fbl6c9eqW
         suAw==
X-Gm-Message-State: APuU4Z/7Zox5zXfzrlEvqCzKPIVuipT0KqihXj3T3UnqjcvRntupIW3G
	B/a/ZlwngTjRPNMQ0QRAvF5SBpQY/WH9GPqxEWv4ujNRAWrjcAcEn5HbJqaW06huXq5um4m8BON
	sfHQlnXKUkA6V91sFCRCt4rCgk2jMDXIFmv91HANGfNGH/IPRB4LdT753GC1ZlKDse4Z+
X-Gm-Gg: AYBFou2FO7GLxnrX/YtavZk8t2OFKNNhkPnuOUXWiO4q4q6UeEBubPbWxEioDyMsQTO
	rRUfYQ5ZziBfhcOGmc7eG7OSixfZtaUTA2Jy9NwBbXxSbPs/RDpCt+HoUi/8ZO9/aEjG35XdSyu
	AkDYNriCWGgy5BxY0h63rjFqydLOPuUol8Ol5hxK2reY3nab/nTpVjYzGq2NH7eg/ppKWWSqhht
	1jGHvDhcDTBA3/NzVBLHODJWysBkBbgVdouV5hMoj6eAhCPCczrCjenLCFZUNJpBIYO80SJEad9
	+gunx2YT9/5mJqf83BpCoocYCiFnYr25WGv64ldyihVYIJ61WJzNItF6EaBOEfirW2lwKoDnONA
	LM2Pf7HYqdk2pkLfDl1or2bPT8eTxK0msbWmuAOYEoJsqAWNmqpBJGit91AMxarOOCA0u+zZ64z
	vVN8TEdM0J0y59PmAgbun84+MagnjZaFZKop9zgH0CfB1oePuJ0YJUYrePoGYhBQ==
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352009185a.58.1793972684192;
        Fri, 06 Nov 2026 05:44:44 -0800 (PST)
X-Received: by 2002:a05:620a:318c:b0:945:ca23:e00 with SMTP id af79cd13be357-945f35dbf68mr352004485a.58.1793972683453;
        Fri, 06 Nov 2026 05:44:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:10 +0200
Subject: [PATCH v2 4/8] drm/msm: check UBWC framebuffers against their
 layout
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
Message-Id: <20261106-ubwc-format-docs-v2-4-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm1xmEojRhtbHd26chPgyY5e9DYUB3anpavp
 sGYE9QRf6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZtQAKCRCLPIo+Aiko
 1aybCACWYFM2oDjJ4iQ8s/DVtvJt4yeL6Z+vXT5ZTRIExu9PNK25Kr5AIqBHZMkgiJkyTgutTPj
 8birGSMAO+r6KJCGQcbAzr2ElX46/NVd9PubPCl1CbCHcAIZy9dP6Jn7n0y+8RvJhh/1Rj2Os3p
 ztKl58J7/xel36mG1SW3pVq3cBk0IsjpjsVRFDSPSHiz3gPrz/LEBMtItmvBl5Ha8NisCdBUdWM
 kljD7wThly8rGkRBS0iPRhbm3WoI81lYl3BgKyQXolQ2LnfmT4IybHXZVc17b3kDlTskbmZJjBN
 kEkpUolW95vQmhIt2vNiHa/kwm+uvPcjzIQsZ5OPVFKcJnVn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX5sk8iN29xx8r
 lykEEpkOewEem8n9+B/yGMWmEHlXx1iMD6sZ4fqvTUosEsMxO5syCw79T9uVkkZE49t07QTwS7G
 XDFhVsTvMc9uea3kyNfVR5uFdinOauI=
X-Proofpoint-GUID: Ce7ihvGf6rrKNuVox8cdiGRC-JV7V3cC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX2oMFgg5sPE9X
 ieUm8r5iCH7Yy2tJ87pLimUX3uHCyel4OOlDRDE1tFqcwfMFl5wSs8IL3U0Wlhv+TPO8NyJghl7
 oXSAfsvVC00Nn9n2qBQ7UYYiaDFt8Oxa5CluGR1fXbNWrhMFUMhn9y3FjsCPtn2NOnca2miBcQu
 PDkh3begFt6dptwsGtebIH81RCII8HTU2ZoJB1ay3S+k5uGfjiVu/6TKdWBGXzQfrJEqfjXQ7GZ
 bq0iy80NaVUUMzQi5OZNLL/4LWGduMsiDK33xjPL2o4IIM3h7qSiIxVtWRDPmb2BoctlmQR9QgQ
 sBJ3YsieUSHqwERX9VepPu1ic/RQYQhVVtNrY7c1xsigvgQDtrAwfXkQWnl+8zBrFVxrFW0Auuw
 RzFzNPt1Yup2sLGAPn+2ectH0c72tzxUYQAza6zQ3RX/hk9SIRK6bZP04XpcEHp931p6roz8JeC
 xKa+VXwODUSnTybtKgg==
X-Proofpoint-ORIG-GUID: Ce7ihvGf6rrKNuVox8cdiGRC-JV7V3cC
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aedd9cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gedFiD_-BdM4RCKrvjUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

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

