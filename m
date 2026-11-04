Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815179;
	b=0JkrsUqlQtFqSYeXPFr+XrDXjcwbc1uZfsiXSn4KSXlXu4Xt4mJ4Q6knHcPM3WPp42JS
	 qFWzANuS1UWfu2SzFx2RFugP44ni2CQgbsj3NwBjPWB7TjM0eabiRvbOTByx/pG0hGZUe
	 kF8LJCEZG6PfeG33zyfcqRR5/6ZpvVppD0rTm67eeITBYknQRHoJzTLsq0fdWPFKD83yA
	 GHCoQTHyiFaHYF/QVoaNeGVbffwZIkbG0Kr/vqByoe7tLrxiTJPS7/+8yIHP0mdFzQugz
	 E1a40+bjQ8HZkCCjcUceDl++H6RjPOhxOwz9mlCOISAqFDssVg3B6t4mi6tMxfCkmhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
	b=G6Jw6kxlWgPcLk7zywC3ZUcW4ftde5lY88/ireK6Gllx9qVQaCQNlKdiL8z9WeAVOdiT
	 5gf6oLjf3yNaH2eW4KXPbbO/mRrLReBhPa7xvOO0uddJMPMZsFfhONd+0YGpwIAuAbjmF
	 nN/0TbplWEftA00TT9yG0nZ9TOzgN6WpMIpg6GrRSCIbm+JK6OE0lA7FIkntpDTLgEsUI
	 k6jyfTNBx+cerr8n2QXLNBjvM2P4xM9ufdU914+Kv6UUNvalAPH7cD3O/I+L6w2f3iqzU
	 Kg7tT9ZCY49ctn+bw+tFQ2CbecY9cYaJjmRaUeZNdHu/ZFakfJtwWqo+0qNAg1lymmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFqTjSC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAQ3HHzO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F9606B213
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 17:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3F9606B213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFqTjSC3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAQ3HHzO
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjEA42828839
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 17:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+i5Jiewm+Dk
	Vb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=; b=mFqTjSC3EfzL0D+BBHsZ/xS3C3R
	MyBf+Gbm/lURutPDtpss513t51WgdkY6ShTmm8/KDhGbO3bGQdLok3Je7tpN/66z
	zO10kFCEVVLCutLV1+bafOGgAFTy9EBJY1OGCe8WkJAyLdyd94Gz9yR+asOw3kA3
	38aeyKcHqX4Tg8V40h0lNkpvyeh5mulPioME0Q7gAzU1/EgYztiI4H0pqLRvT/xM
	038BAkzyCY7/NJgOBQ+AaVElN5lFW37spnmnJxkDKJh/3dFVj5JAKsJSv4YDQo6b
	a/PcwDMmz6Am6JpkBTqlSs8gtaqUloVNThqHIC8d+UXFpe90jBBll0qngpA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284t1tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 17:59:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so13324265ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 09:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815177; x=1794419977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
        b=IAQ3HHzOSHHhi2taDtqeEA0hFbey7s8ssA0WatDMbRlLACxfxaj4qai7VaJTnMOnN5
         1xfcRCLb5p7p1slRiMoaS3ihfyxn9xhiPg50psolYSg1pGzmFyhmEspe/NMFsyChHVYp
         d2KQgZ3iXJSfBj8/ldgqm/2nmxmUQInzmw0Uzc1fwOTr6S3itquH5szmWZFhTs2+d+qX
         VJkJ8TAoV9w6kDYimL/a9VpNv2bX2ge/Qqb625cm4eQvqO05NFGzgk7fkppGv3kkXFJl
         v9PtIT7FzDecoFT0JFp670AfcauHCQ7ofkE3SBz3nMFpp/DD3na59nJVcZ+shu5dx3eE
         rLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815177; x=1794419977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+i5Jiewm+DkVb+ElU+YnwS7BEOGG9HPyqCVLkTEmd1k=;
        b=BeXTDbs6Bug97xiAa2hQ4BISEzXJ17dP/4cbu3pgMcJMhBdeZqsofEg4/zQult1+Hf
         HGe+sVkWnW9L6wgiNcRi9xAVaI8UCFR28t0BZgY0T8Ij+Rbkl71UJ10BPGqxlBxG3uTo
         LzQeQ0acogvAFvkIprp7MGPDTl2WNaqUXCecSZBBSK+m9584pSWvHKgPOnFtx7L0a7SA
         RRnC4Q3XBnpCzzVw5+3RMb5GXNhYMWFwVeI8WIN+JaxuJfHF3O5P2IFb07G5jInI9cYD
         Jm/e65cUEFDodPW1j5pXoZBZNSp3xhLyA5KK8+6Ue9dccN0TsnKQeG+o1GebpkHQLyiV
         dGfw==
X-Gm-Message-State: APuU4Z/AM17VmT8d3AqapbX6vjtjaQxfqNc5kIZsPRJkHkUcMxQmIKX8
	1dEzgyvEc/I58fpOllsN1fQm/wgJwPB0w+OYmrQk6af6zw0ZX62xsuG3BXtX6wvHcCq4xL93Y3K
	d+hc0y6NeEC+UW8VhXjX9ReRe9D7SjBEVreVtqhZqHwyFCN2MZMgdohQ2/HNafNH0ParM
X-Gm-Gg: AYBFou2lwnTl6wfMDJRXkr+q9Qv2d1BtGN2pm77YEF3Ed8LuMBcW3EP1Eky2Yuu3w6Q
	TDl47PGpQjypVNAJLuSDU3q28c1jCTM65Fj0fvhfvhxzmocDJh85K93Ws/vqjt4YGCNX3oK0ij7
	/NUb+P3NC0e9Mkks+lCoTgGKUadLgwF79Nl0VLkJSiE9jb6sehMERgsVXA0QZp1ZtBQq18bFLju
	hnHZz5qI/pAhV1OmMbuBFxdZ+A2BJIYyqip01zVlZcUq5GAg5F7cRh5DD/Dazf5rM4YEws2xvGX
	Vekg634XB4Ub0MzQVbEw0rULL0m5RaxHBVfGm3o+mC3FCgC+aK/2ofiBYIeI5fb8KR10mD7b72Q
	QV7+6GS2zQmjnlmWIPt5jWX3sUaP/lfXhldeIBzE1HUL9n6xij1bNrpmM03m+PfCmR0rgc3A2qy
	3YZczHXEt464Qs79NAGzX1aN62Lq+1FUSDVCR5SOy4qcq7LK8e4YKEb6r3MQ4=
X-Received: by 2002:a05:6a20:7f82:b0:3e3:1013:466b with SMTP id adf61e73a8af0-3e928a79de8mr16140204637.64.1793815176632;
        Wed, 04 Nov 2026 09:59:36 -0800 (PST)
X-Received: by 2002:a05:6a20:7f82:b0:3e3:1013:466b with SMTP id adf61e73a8af0-3e928a79de8mr16140190637.64.1793815176183;
        Wed, 04 Nov 2026 09:59:36 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46443e37sm1465823a12.1.2026.11.04.09.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:35 -0800 (PST)
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
Subject: [PATCH v5 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Wed,  4 Nov 2026 09:59:21 -0800
Message-ID: <20261104175931.28475-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb7289 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bVDlrb6bOVpe_wxYco_pdbuRv6AN1xmf
X-Proofpoint-GUID: bVDlrb6bOVpe_wxYco_pdbuRv6AN1xmf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXz24RILA2DJef
 9uhAszKuqgSjppMePOxPZEaT3FGsuMAyyyby5srmV8HWWr542IqwkRN8TjyqiENiHgOcNBGnEAf
 L0cC78o03S+LYK58SKEtO6cONf94BP+9ME1OhwZaSYCFEGtR5km18nCV1Mj3x1NDnwpw9/ebkdm
 cwXrf9Dza54Qd9VC//nVbvgOIG90UOWE/oeA6YQPu6eeUdClz8TBOFkBpt0DQLrT3y9+X+8XKz7
 cKi0OGpdPENyTlsn0M1Cg40Az3pUM/X6UPvsw6PuTKz4A7w6z71SwuYBIdEps5p8N8GAXa2uU1P
 B9KiuunsKgHWa9biJ/xRwOW2K+iYMD2OJDE/tMWEl6L8/LC2IV5QEJVvc6Bt4PoHcxF2GM4vUH8
 UprQWDh7XxjsqHeqVfhOybHbUQ1uYpt9Ak4Z0SE6n8VatGG/niQ/yzSQorC5pr0Tt4fXmsoWkiu
 +iINCoONAOKBNl7X0KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfXz8egQl7sKnCi
 3Jyjw2yaUHQIkF3EVASZEdbjgpjME/Mz8dViyC0qBYGnNd0QBf573vKUCNnYnImK+/sCKoqz/4H
 mTwoNWUdQ2KiEU3QxONVK4XYXffPFNw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040071

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4b2798efd9da..7fe273bf74d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -362,7 +362,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
-	if (priv->gpu)
+	if (priv->gpu && ctx->sysprof)
 		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..e3e7c401fa5c 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -9,6 +9,7 @@
 
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof)
 {
+	guard(pm_runtime_active)(&gpu->pdev->dev);
 	guard(rwsem_write)(&ctx->ctxlock);
 
 	/*
@@ -21,7 +22,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	default:
 		return UERR(EINVAL, gpu->dev, "Invalid sysprof: %d", sysprof);
 	case 2:
-		pm_runtime_get_sync(&gpu->pdev->dev);
+		pm_runtime_get(&gpu->pdev->dev);
 		fallthrough;
 	case 1:
 		refcount_inc(&gpu->sysprof_active);
-- 
2.56.0

