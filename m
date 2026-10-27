Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114912;
	b=5nOjcKPp2blFL8slPctRyCEudO8GoafpgkhXBazIbKiow+a5yVfoTg1ByYTMQbN+Wt0e
	 v1yiaPek/B2ALTCYejLQ29a5FZ1HinzesfohutR27dOZhRl4IeyasntTzPCzvm1ab6XW+
	 KCm1oQ+nuvP+HspoOGfp/yBjn9b2tnqF5buVcPTk4vB8WWxfD9+MLo4hUyxWsklN7sTZn
	 xb/SLx8tTKA9s4/Rob9p7jF9lF5wgbiYjE9nb8kcNGGMDzvKiI9EgfqN7bUmCjBsqP/vF
	 kdNDESwFHCCaliDqxzkBWM3DbbU4vnJHZFPYvna00CNcHenJINOQCl801/IGXM/pqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
	b=Ohb1tFV7Zsl5IZSiLSGmAPtgJw8pape2uMWs2F9FDWazl13/jqjdVoZjc9JzKVnRRFzC
	 nYMkIT7eACit66moSlP0uVURFiZbr9ESHEMhuxk4RGyBq/hFo8EL8jGRTL+Q4DW6vMLH5
	 KqVWME6zFVEPuVQYEO2Lei7CDlXuekEG2B1Tq0HDOUm+gZ9TvyGGK31du7wgM8hUL/l4g
	 2pDDGmoFyc3lviI/KIWRW073FsRrWBFHEk5tQgRxN/4croXtorCYZ2yJDdEwDo9LMAIE5
	 rI1s9D8tM1mmJk+gq9Ps2F2SpnAPM8DCX8He0wg56QgJ098k/ovLX0S8xpdpvqr17QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwKsuVyb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQDbrwnd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1AA606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB1AA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FwKsuVyb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQDbrwnd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL8dn2242307
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PeGMG0GUYQ6
	9EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=; b=FwKsuVybaVThb9tZF1gRV74vs4p
	XCQUWrT02CBRVDYhUzZCTnA1t561OHEr7pLzZ96unT1mqDbz3r2OYCLgXdIW2dbO
	CCp4Z5wZzfUBXT3R87ZCr0Qu9npQafLCbbioXjh6FU8uJsodL7Df+Wv9pOYimJHv
	ZQ3VSyoA8ApkQgQ3/hetVg+pAjCx+VJFbjuqSIxYkd/B0wdizLTT2n0yVGT10CRM
	jpU17IevJRwg/S4HFFOYHbIYZY6ebU+x6oPDKXrNLUT9ZwGceiyPRWcP1T0W2WqD
	Mh5JKET9YqPcNcH7GI1BBDW4/6hrQ0iUa7520TTat7a6mJU/mqXdU+HM4Kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5sy9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso34259b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114909; x=1793719709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
        b=dQDbrwndShL+C172JePGo+QGjyJi2jg1TYiEMrurUY5/k5Y+CGHhoRxxrFv6Td9vzK
         vn5JuWVuAJ6BVqNYIf8opUbwQkK6SHx24fJqeZ9CJt6DlO7PxA4AQ3fV54o9t48YPhLe
         J6v1DmQNJkPMxZ8FiS8VjMLXNOOt3B2XFfN2rPpKhK2ovUWltwNpkvrBKNfvZKqDjDfx
         57TFnqCZF2jKdDYnbKB+ZRqzsdNy0EzVEOMH6HBVC6e8qx573w3HxIxeW4Frs6eIb1kL
         OJk0rSwibVewKuLCohGP/pQAKbT6ApnZMkAa5uv2L8l7ye5pu2WgURneK7U5m54aMoS6
         m6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114909; x=1793719709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PeGMG0GUYQ69EwVs+BG01KfQYxsrLdk8FD6P+7s8JTY=;
        b=Q/H0H/ycCgXAkobuuGYNIxKLt4mtj+GHoW055H1Z+uEfN/2QbJ71yXBm0tyMMP3m+s
         vl5GHB0PTO+TZS1hQbnQ72hH/0u+XoF8RE9nnSWhBenwTuwAiYcrdFyxGrF9jUGMuHsx
         G2QAr+0cRSEinp+W3LnJxW85W4gQU0Kb7Y/3CF99idjaZ0nOgwcmd7vtgL9fouH+VBsa
         4jUIjCpqKgTcC36gE9U93teoPI/gNU3B+T91NHiAi603dW+FFaUkpuaT0ndXVM4KsxUb
         +5r7IVs72vpHW4ERXtXB1LEIc/OcdVYKHlW8b/qijlKkzikbsCWEZx+IDglLK3AnjVvs
         eFrg==
X-Gm-Message-State: AFq9FYJCYuh4AuDiNMBn2gNsKAsbSTZDkoXKO0Tm+gtdMSQL5rLsxUIo
	CNNbwtUmx/SOMW11OWJxi7WIixW4CcyUibB+tTsjfGd73cEuynbfU0F3efeDlsen+bU+zr28QD9
	O/lRHH3O899fG8VYawOEsw6fGnXc4dORUQK1bVzSIukcgN7EwK4CLFOW9a8uqYNEIBtBU
X-Gm-Gg: AYBFou0yKTjy8IeE82MjYBMxGO1B3E5c8E/7rYMN20b0Plca3dJPKF1GAREPLgouUBa
	Qxz3JZKsOHPEhXpowyDF+aM8y1+RjsG0Y/gASv7eLVx5pmyN9gn4LmkwhmSGwOoOgderMsmWdXi
	50Xe4tG5gTN2tvmBdxgkAJA9pMueRU4WMCC2JBY1LZKcnwIWyhNi9y8t6AD3Vcxu5dpoxIkpgFG
	0cE1VxK5L8H8x1bRpL0TaEDgrVYKW5Z8aaIinATdVJujb5hGApIKMgAURjqKfdbOyzP6y5yUVdY
	NtfNrENFRW+RpNCYLCW3Z17n1bq7xesdh9oDISk7g90YoyzE1Nyr4l33bYT9FJAHWmwidzqHKof
	KHji2lLmOJ/VYrHgp2ANnCFuNNlZHZ9X9IOfpCvrZQ6MzkOOX
X-Received: by 2002:a05:6a00:1da5:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8a364e33a57mr7763318b3a.6.1793114909459;
        Tue, 27 Oct 2026 08:28:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da5:b0:89e:2a91:4fd1 with SMTP id d2e1a72fcca58-8a364e33a57mr7763284b3a.6.1793114908690;
        Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a5f652aasm196096b3a.17.2026.10.27.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/5] drm/msm/gem: dma_map/unmap_sgtable()
Date: Tue, 27 Oct 2026 08:28:16 -0700
Message-ID: <20261027152821.51144-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX8wk9/mPweLxh
 X5oFUx3R603bJAMQu0wAjNJv+Z6603cOUAROnvU+PFpQtiGktj7mYlX25iiuXqdh/mYjCAmxKPb
 RdzEAybQ6U5OE77QISPcqqBEz9YCx48=
X-Proofpoint-ORIG-GUID: Oi-ukYx6jdaMb7frlQv8RJG-4vSkzdPM
X-Proofpoint-GUID: Oi-ukYx6jdaMb7frlQv8RJG-4vSkzdPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX/VGnVvZunXj4
 A3tPLBt3AFcIkQJRSO4d4BZ7pii+orwlJKjllr9vzthOllENlSLt6AGEJugu0RWWCP945boVTw+
 L6lQkNu3OTDWdKRE9NQYZj0aou+TCNXo2CH+1LaRnAtoyikTV077Q95+s5tuBhNlciqhoQ6zKP0
 vUUnXgA8KgNaS181hi0vmMaRMwSaiVWemG8SS+gZkbQRQ6iZ7cmG82mIiSWTWKPepS/qK9YDwvZ
 wBvGR8dGMGEUj8byyZi97/ww2cEuUx80WZXPWyJCkZQWvFEHKHlUx1U/N/eQWwMO7EZP7PwSQm2
 V5snl3+bsNZrOrkAM8g0Krk8fqImWeWFdYKDacDcBXPhoZYs3ReVZluHf/c0yJwG6dRcqa+pXo+
 BXZV37hg5DuJS6197paSzxpLdAiJzdJsunA6JdNj+VxSSmJ8HUUuj7jbQa68HNBhhbBfddSH5dw
 +b2cN1rX0Qr0Sc+CbMw==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0c31e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270061

This should functionally be a no-op for us, since we are managing our
SMMU directly (dma_map_ops is NULL), but it populates the dma_len/
dma_address's so that we can use them for setting up pgtable mappings.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 181b9ad32672..72e3cd8bb1e7 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -219,6 +219,15 @@ static struct page **get_pages(struct drm_gem_object *obj)
 			goto error;
 		}
 
+		ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev),
+				      msm_obj->sgt,
+				      DMA_BIDIRECTIONAL,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "could not map sgtable: %d\n", ret);
+			goto error;
+		}
+
 		update_device_mem(dev->dev_private, obj->size);
 
 		/* For non-cached buffers, ensure the new pages are clean
@@ -233,6 +242,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	return msm_obj->pages;
 
 error:
+	if (!IS_ERR(msm_obj->sgt))
+		drm_prime_gem_destroy(obj, msm_obj->sgt);
 	msm_obj->sgt = NULL;
 
 	drm_gem_put_pages(obj, msm_obj->pages, false, false);
@@ -260,6 +271,11 @@ static void put_pages(struct drm_gem_object *obj)
 		if (msm_obj->flags & MSM_BO_WC)
 			sync_for_cpu(msm_obj);
 
+		dma_unmap_sgtable(drm_dev_dma_dev(obj->dev),
+				  msm_obj->sgt,
+				  DMA_BIDIRECTIONAL,
+				  DMA_ATTR_SKIP_CPU_SYNC);
+
 		sg_free_table(msm_obj->sgt);
 		kfree(msm_obj->sgt);
 		msm_obj->sgt = NULL;
-- 
2.56.0

