Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896933;
	b=unOgITjJXFocnMNex2KHdrCB6yAxM+AMN24geZ5woxht12W4BzojKT9hROkRNY77o8pG
	 mQp478jM0jlsOiPh+pbvCnv2L2iMadLW9Ui78BwhIP8WGX78rN7KIadJ+DKduBDeyeoDf
	 HAS5odnJFOjOvELW7660+XqSkBFqaLrX3Riw2oC/cQSD6+cvXO2FDSElpY9bFk9HDBvmF
	 9BPnvWdD0Rh17ymtDIYjvlTMs1u7Wk3xmMwRdeINLWmHmjr66V4lHyEZWQvWAgFRX3yNE
	 Sa9MNTgbBCDN5AohkGhaVpTP+dS2OebxB0yB8tD1Hw63MFNYOFS+NjITZ3fyLQOaP5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
	b=13X705NDppAZo0QWGYygYGCwPIhWfyKs9UW7jL8jL08D/NX8/blp4T0eCHhYP+5UVgDr
	 V+Tzxe+maT0sGkFsEOTMrm90mb5dFZ6RSUXUVRyhwMNali5Ditl9W40c6sLyWz0TsJqPj
	 MulQ0z5XY7XepjC8XdFMPjl7PejTiOt7iSUud/5TI4/e9GWoZkxz/A2fFHSgIHe0sXJpQ
	 i23Q705HxCSAqojUvieGOKfGL+sc0YsYkt220sWWrDUc5JbE7mKg4u2OJzlc3RArTI2ws
	 7brK4JI58Y134Yo+jF5yZVHkGVZUO6avCGHJzHm4ou/dI13CLB/soWn0tFFgSOPTQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa4ezJoo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftH31mN5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C8606EE84
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60C8606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa4ezJoo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ftH31mN5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQFmD2004485
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h1E34adikNa
	Ie65XlAHTCNCokzVVPjH+sMqHX//xLDE=; b=Fa4ezJoofXYv4uwrpbYcnxjMvVU
	TUmebyWvk6cx+TREqzIKnFIMyhSZJ5tq8xf0CHoMus/ND4DG+EJB/qV/kuo2ncXa
	vAPcTQLtXXfKViNrmJklKJKacPStrxmqBvos81TSKuw7OMjEqQNaPwRoQKzTuGOb
	PKRYLlYBkPIPsTUo6zpeYKQjxP6/I2h38QANjgoSzEYWJGOcdapRZ3d0dd9gLL/X
	Mmk7uCPxh3tP0XaQuoMmIf8dd7J8XrP911CEYxRTd7SvrEcLUqQKc1Ar81I7VDSg
	+IP7YMAuaSvEOKoIz6Z1Evu6Ydru+tohtFhOouLTQYlJqLe8v1mubbA510g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1py0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso615516a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896932; x=1794501732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
        b=ftH31mN5+T1fVek6kpNzXkiRpJRLmApcorb5U8RId82gKkC5Rwv1nSGCtEiaEoxHuQ
         VE0fQ/3s7IpO49+IzoY9aeSof8p8jEi0C3WdRMt9Lgt1LXuDD6h2KvpPmbzMwUxR0SV2
         o+b2F3vD5IYk3I744xH6k3HTVtbQVKfAPDaXLC+P0+MhI2GqMpGTGu3kO3DfSQVacfXr
         nEovGLW9tQH2YP0j8XCS20kfqcLbInZnqs47aHREpuJLvGYxj/qoxYrfk5EOVQvBrUxg
         X997QBwUFQwmCPjTc3RNnirOhLlL5z23NeyTxa1T8q11VuQByveqQP8M/4+A6aStsj3n
         7gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896932; x=1794501732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
        b=0oSD/KUEmlXbnbK17HI4WX9tefsHUQaxk1fnes1NU8WWlNWRQuA9he9dWpoC0NpUCa
         VNQDL9cppZlWKJIckbnGweuoRiZ72iKl3fPCOk/EiliKYkBF57GwAmKu3cSmOy29MhVc
         PW1BWqI6zKoBBG2GnjujU1eGHhyiovj+9tPQQNY4NRgVYsUw26Vs5Xncu47+8aEgdciq
         Hk3XMoq/3XaAEg1dczOVwArn47eEPc+yMuLq6a0+VCQVBioCj1Q/kNQdboIL3YYliy59
         6P/NtjcaD35XbwJc4XNaZw/B376gkJvBVtIcMw3hO5tE7VFu0ur7/t1yHa+R2UNmX6aA
         8oMA==
X-Gm-Message-State: APuU4Z9cH8Sm3g+/e58b9p7qkGrcX+FUDhnc9FGRm3ChgUBM8PEway0S
	dRRFvvRz4umBW6JWZqBntJDByxJh6AaD7YjYT457DDfbrEIlkx/5lsisWmOcRl7y+BzWo/maPo6
	mUxKbIPoS8QpfKr10aapyLdaPg5HGNf+qAPNkLqqDlWs9G9Vioe5j292ORIBwTOZLcfpn
X-Gm-Gg: AYBFou2/CQ/dyj1KxN1+B8Fa/5w4lZbSasJIsEHFCWJtRf7x+gxwH2Ej39Zq/ZIGf1o
	35fL6YCZu8/rodPGjLhfQNlK5VlGqr7fcGFMoInKVxtMDJ/SldGKVcB2QcXA9uEXWXAL1ZcEv5c
	XvpXr9ui6F5MAeNdXLLJl3iaJCmgF76tKXJLN50D2eUQ3ZYzq5lEV/EtGdT35/lZpG6Ajslv9uS
	QFlDD3VFscUE14Zz/f+4mWE/kvXpu/9TEtfAXgDYfyrtEHxNDFmL1a8X/FR/ApoJfpgCZT52fxr
	TzzWqVphzW6tweB7TBGFa77NiWSddkriGmIKP41v0aMg7RjQv+QwdP+E4CpTcOWoaJfxTjvnp6t
	avFi3vuPuWP0+GB3MO+pfTgdD00aEv0MNdPY7etzOj+TZTTiFUbcNin+r0njk1xUA8Q+OVeH+WG
	nlqXzlFlYyJGRxbHTapCnjE0PExSGepFvxlXOxCH+3PXr+n5JFdq79IX5c5owO
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1869215a91.43.1793896931104;
        Thu, 05 Nov 2026 08:42:11 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1869182a91.43.1793896930563;
        Thu, 05 Nov 2026 08:42:10 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm5088572a91.1.2026.11.05.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Thu,  5 Nov 2026 08:41:52 -0800
Message-ID: <20261105164158.23263-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX0C7CJQTuoxe6
 7ifVJmwm8pc1O420PKKz+JJHIbiPYJ4vUWn7Wy5JyNkFmzb1v+nrThC+Tb8LExpQFEgu45YAKfJ
 U+YEfvm2ApiphzQN8DtWtafh7C+mZyk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX7Nyw2NvUVik6
 +xjuYBWShqs88mudTYrBLq0SR8MzpI0/JQgkwiPkOdht5XjheQ/B54617VuxWeZYIr1semEKXL1
 Dw/GXEeyXfLtZNVfp3zwGdzKbKNCNh/LbkKuFTRTVIcIr6OO0YCEj8EEiaxd9i+rgB2dF5+k6Qv
 kfTyRoTd3ytA8H4XHHvzUWFUxtQNhTc1iodIsgso0DLClOoNWAfYwRc6xJ2JzrdJD4EUvPfK1TY
 RvAkdPEXGDRpG95mvbaRZZRcXWIg1bHdhjXI1E5iQbJ0hbMsTd9i3FJBRGoxpfwGQgaT3G6oqRy
 VXRCw/ja+X3HJgGpYi1JE5ysfuh3awdAl6Qp+7kgE43bo+XytQid6IeYYKjNngLAkv8uAEPUIV0
 W6UiNyp/0SLWn7l28ocAvUtnoVeGM/UsztbvDBUIxi/T/cu8fK3dERc1mK7mCy6EX5spogvYQNX
 3Jmsc1ABZsOGyTwjKoA==
X-Proofpoint-ORIG-GUID: c_lRbah7t7L6ZXNG4h4zzhU0GZCFeKYP
X-Proofpoint-GUID: c_lRbah7t7L6ZXNG4h4zzhU0GZCFeKYP
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecb1e4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

Use scoped_guard/etc to simplify the error paths.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d05307bfa123..98f67b7aab66 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	struct drm_device *dev = inode->i_private;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
 	int ret;
 
 	if (!gpu || !gpu->funcs->gpu_state_get)
 		return -ENODEV;
 
-	show_priv = kmalloc_obj(*show_priv);
+	struct msm_gpu_show_priv *show_priv __free(kfree)
+		= kmalloc_obj(*show_priv);
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
+	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
+		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+			msm_gpu_hw_init(gpu);
+			show_priv->state = gpu->funcs->gpu_state_get(gpu);
+		}
+	}
 
 	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
+		return PTR_ERR(show_priv->state);
 	}
 
 	show_priv->dev = dev;
 
 	ret = single_open(file, msm_gpu_show, show_priv);
 	if (ret)
-		goto free_priv;
+		return ret;
 
-	return 0;
+	retain_and_null_ptr(show_priv);
 
-free_priv:
-	kfree(show_priv);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations msm_gpu_fops = {
-- 
2.56.0

