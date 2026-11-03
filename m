Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747946;
	b=fBHa0f8Whnizj1/PVHutg6xzdG82uOf1geNxDJ7qMXsITB4qdR8zyZ9LlDDlaSXWheT+
	 RvvjLkzqeg/ltGRY6H1E132hQDNAjyNMIFM+fduKM/PO1vIqUwHoN+qruvYh/o571ZHq/
	 BIxx0FG2J89NHqR3vmugCTf78FaTvu92MGMXTh64L0iMiMHKk0VzRiaAMGEIJVyzO7DM7
	 ozy/nEnzLronNTY/iw/zkCCecffyR0ji45ig8AX8ZEK8DNtO+1sR87SpkvptDvPybyHv1
	 sCpGRGR8HkV9N6Yl/sLcTs9mSZ/8PbwITd27aWpzO195JHoXhUPDQAbt2v1cH+2VTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
	b=pb8/YQZ9D5PnPEPutj+PM2p/b7/7TeCheSFB5+ZNo8MUZIcWgbPtZF2wrdNylc8TcN59
	 i1MsHxxV8thLl9oillNSxQQZtjN5vDHxZUNl0R14uVjKeRmoVFhVmPPALAKVqa+YzbAyJ
	 Eeys/WWoMloXBotwa0ZYKwrBlyVuCSmz3HpG1DiQ3v3CQcg4yXOdBfYsQ6NLvi6/xVPuU
	 fGMTZkAnSjALNXdVW8JCrJMANscdkIBbHH/FehG8wUPBLLP9UaQU5Lj9iloPShMOphYUl
	 gGHksb8ltOV9Op2CS7FMZ4XSEVC3jv5I94oV6XskzqszKKwPu1dVKYkyala56ioJflg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9TAGBP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kbu/IQqd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23B606D823
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B23B606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9TAGBP6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbu/IQqd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKptj3065603
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9R7AOWcFK2O
	6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=; b=T9TAGBP6FqUzBkYa2zuGXHBxadu
	1kuEq+X98ZVvrnGIbtfcoszOzUZPFMbmeOJaGBf8wWP3v0JC1qP9UqBglfqN2OVF
	diqLSGAIYxECWQ73tjgcevAnbsSdy/8/aiViGCbjq1B7redz+lOWK8b+EZmh2i7C
	ATHFeImO5Ty+SaX+NjltOPRzETNZqAU2lqCP3RGZiuh1dRmm+jKkD6rAtYeUVjD2
	TqDbMVKEtXeiPMY9P0DwBzrqM9eTthfikjHtPCfboUm617akvDeBpqwXWomAWGlZ
	v9x2C+Uehzzk9F/q17wWL0TkSaEgl16k03xCd3ZLjfPjeh3psvTMDMPkEhg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bt7g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:19:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so202226b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747945; x=1794352745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=kbu/IQqd8OSiWvBm42fEZa/eqGqg/HC28rrPRgYQMs549IRhRZQWxB5SH4gNJEhocM
         SubdBUPpDXrDd5bVYmw3j38CXMDBQ2xBOnSaHzigfyHQwtq/8h0ik4/3p7Ah8NwqRB61
         SF0VsbhYlifQ+IXM2+J5zoN5/L5iobhGBrR6hrpoyIZkqv2uTdya2LgyoxX8Wg6kCV8i
         nPfQEyP95/XBF0gBcqAqCsd6XDkSVAkTSv/LQOHQh84THR4FovzbPnW7X34AUvPdXoki
         sqfKz8FLKzY8zE037Zc00YEFnumNoZF9+VwvFJZ0DAOecAyo5vIwkA9a8iY5U7caDv5k
         BNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747945; x=1794352745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=SQyqh9hxLWChB1xqQBVJDqsZLlLqyi2GjlfGW8e7OJ6ECroCK1AwMpnCOA0fIWQhID
         rQeKML9ZYOVnWaXemMC93wS+Uog1PNPn/Oa4blCz9uXpHBWAcaGvWyI1zt1bjHJpiD42
         E4g3X6bSfDfqPe6WpKUuw61Ua6eA0pYlL7J6C2Z/Rk34WAeS57KtjeOgDnU1Z8EUVZyg
         Mf1WgaTJwV+HrCrlY5m5ZURvl6hbYZ9gvPjMyWwv0tao2vPTF/tGSAizrqGXN7sbOfGU
         lsAf72MemvpTwFbGwCBLiKVn/kBmtnBWWX8FJYnBlCaZt/uMlbnNQ+37S+/Bqp1e48NZ
         3bmA==
X-Gm-Message-State: APuU4Z+I17TjqN00diyZlO+TCxX8FnoJCt7qzxEkw77/aiAaBThUEN9w
	7HQ+jqJ8S6dfRBBnPRoSpCBDSmKrtB/mh70HUSw3XdgzolF7ahsc1zhAHW5vEXS9DfctFhLkusp
	O3BypkC31n+dkbQOwwAhb+X+ilw1alKrInmzNjg76X3MiEM05qqfifyqjESk7SmYyW7rA
X-Gm-Gg: AYBFou398s9+5UvR492DfKdaZVHGs/YafQbm3uWtMUeNQULO3n9BuhxmMf1dQ2N5xud
	mmSBL3bWUe74T8j6MJNbmSjj/n7+Qbj+swvaArzLvNvzUXBKvAILaRx6hEyGpilvvyYiTzfjP6S
	wY8c8tGkEZelUsB7AaQvp8dGYnwAKas6IW3Ce+CS31ITt3fnDBKh+T3Jb2nTTBd/6FSPydCCDGC
	4l82pIdxBnjvXOIA/CwaD814ZykV9M6O2ifhTsftNbBWH6VVZs4U29bVmsV+qPJwPrYcZlAEDC9
	avIGwM92Jf2LnmQSpu1kYZkD1t7IkSrEcL04L6kPfyLOCptPejJAuwq7xdU7twtjr4f5Mx/8G8j
	aV6L2+EGDqVRgIt+/rENMhnJxE/zlWfGJ9+6A2gf3fkKQ9YZVs2oWPp7QK7fBol9TltN5wuO1tq
	IZWXYFR8Arjhx2peJbQhc4Dv6PBj8LmLjC2w5K5wYTmj+oMyvkMkAPLXSbYw==
X-Received: by 2002:a05:6a00:2d96:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8a9bc8321d9mr11305832b3a.31.1793747944900;
        Tue, 03 Nov 2026 15:19:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2d96:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8a9bc8321d9mr11305804b3a.31.1793747944436;
        Tue, 03 Nov 2026 15:19:04 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bd3ad6fsm146353b3a.55.2026.11.03.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:03 -0800 (PST)
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
Subject: [PATCH v4 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Tue,  3 Nov 2026 15:18:44 -0800
Message-ID: <20261103231850.17493-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX5t6LBXIbKYIa
 0HXQ+bRsqqWSNk9fByhe235c3/v8BHsVpSNjUAA6Oycl5Pa/HeHLZBXO+aI1UKgB92bXoI98beO
 DQVzxt+6PUjVDjKYs4Ua8mR7teqNZ88=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea6be9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: bgPNFUwr29Q0TR65LvWrJ8dr0HVQ3aFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX73PGL9Hl1GeQ
 DjsJQFRLbe3ejQYarBftuMNpMY2pp6B2lXAxIpKRQ6Hvuk5V8cKi1+rfJL5rXLmPTwRdTdJ/9wQ
 35R/ejCul92RvJhc9yWzFg22XO8ilX1a63A0ZblOPPnImAnAOCL6pR/JgBQB2ZB88tRJfELn700
 8Dt36Atq28haWxrB09iESMBkt2DewNLnXf6N+ORzbGLOfJ7z/GWv1BzNqIrQnmYkuuq/Bvuu6+r
 AGJ7Gac4VABHfP0sszJ3nZd0q9U6SGoAfX/gxLOdD94OjIPPlIJePXyaqWPVtGFDUVtyR7beAER
 b+lfxiaIWwGPzIHlWXMzoJ9lldkwiF+0R17Nc+a6qA8Zs8GK/lrmaLnSoy1aRIf6KIDtLdV9rms
 raEiP4OF+NvHk+MvAtWi1wlvjzGgcOdvdsk3nDDBNIFg0LAiT1SQG/m/kCwRQ0GSJtP8xb7eut9
 J8djUS6+2qVY9dPon1g==
X-Proofpoint-GUID: bgPNFUwr29Q0TR65LvWrJ8dr0HVQ3aFv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..aa59b28a3392 100644
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
+	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
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

