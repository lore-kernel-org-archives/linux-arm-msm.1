Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747944;
	b=I9QqDn9iwgMai78u/HwD0zaXHyNt3oqpToEV9BOhwCcSLI8JItwvFiZTBIZGL72p05wm
	 YgAe2dCfe2gfBVdKEvxZl+5BdOw4Q0KESf5rOKvWwxS6TCbPnczv287X5XZtxeDFtHnCl
	 enbpdhfaqC6sits/vCJxafE53gVDBGkYx+camFfgHVfEpyyy+ZKDgAOlv3rRzHu4T5XMS
	 YCd4Z2vDuZ6h7myYG9YHxIqL/J4J9/L+hqK8zDnNyrkmZGSEoz12mXL1aG2elERlFsvNz
	 heVcnMvdiTqtw+JFx3XnX2fk5FDCAWwx5LqLoZzFuBlcESI3qwSc5Zj5cWauWUc95Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
	b=gC9wz7y47Bf85c74BtzhXcoQSq5UL9G9x8AYP/XeizVhcXqwFBL0rBAOIgRMTy7pEnMe
	 S4kKDYj6L6hLKX7Ixlm3+sa2AOOCbDg1q7nZckF51vavE+8PrUvZp4cIxPdgxCXX9gtfG
	 BOkgmKlL2Ik6xpp3GJLn+FhZNqAV7w06lN/lMXATyXVUO3lRCBIC9BQdDk3Jm7YXeglws
	 ILxQT1pUnF9rg4CKhj6Bw1Z7AamvKwxNqXURnMkjjPf03U/UjWbbL3H7WzIp0UwToP5xu
	 xUFiOud0zduLrZhVOEqX6eEerbEaYsF5WT1CJyCjZcBqyfwys88sibele2Jf6+DHlSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyY2rMRs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QX8tHCS/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62961606A33B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 23:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62961606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eyY2rMRs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QX8tHCS/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKlew2395511
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 23:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UUiqxGBqlqk
	yCyP/zaZbA61tDabtLvEYu68IDkN9RnE=; b=eyY2rMRsHR+6K+KS2DA9pqAm79T
	QYEZkWpfV8Bp7J6OfSwwJWCQ1mN6w0cPm17EnEqiHiJDY5VmLljBwLe1s/Ov5JvI
	8M5pnabqhGkW97h7lgR8EDZJbB3rYpOcPrM5uc+b0qbOtlHNsMUPselLrEsl2ulW
	2O6Jth7TI8I6ZbbNeImELx0NF6f+IQPrKVWqsnGHzyrijuzYuNLIhuWhCjLJKa+2
	pOcLwLfUB/xNjoMAKJFdt3dGZIy23D1zQxrEiX3VPaGbk+eZKDxlHjSffw9bl9EE
	2NGlyb9Bl886Wk6cZcN+wWT98sBRl17XDEJYYVIN6SdkJWtp+BIWVgnj+FQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd1vmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:18:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so8371225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747937; x=1794352737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
        b=QX8tHCS/wixXT0D/MdERHy2cYoXNOOd7w6GQuYNmXzUKAtB266EMiF3PtTzg8pF8jx
         UHE1Iy1SDGinxEJGTVicupkEBC0EJfI/VwNxfvatsVLHTdcxXXm5sBvWOfIFKlA1mLBA
         4q0yk+itMQWdf7Qs6A//q7iKFYeL9ReaFAAy0cuH/szlq0nftJV+S+zm38lSjQvj4uWV
         oiRWToFa4gldP+G30nZgheRJX9eTf3fq30LGoUJj2/wUsucBO4/g5J5ts0vmhX2FJMY0
         UDrMROxA1/RQU1snaQZ8xeHbihRlZoQBjLmjumokaKcuFBo4qJUMIpWgRup/3/U54R0N
         70KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747937; x=1794352737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UUiqxGBqlqkyCyP/zaZbA61tDabtLvEYu68IDkN9RnE=;
        b=HPGXXNP0sxD8b4YJiOkdENikTvLm3FGeg2B9IDC9S3bdxda0fyUhv1iT4u0QlEEN2A
         o1syqBrUQDr7QxGGtrgrLgGgFohEcAy/CGgjWB7RZ31UJaC+jLVUgrOGNOlOEEdB+7Z+
         bweldRY1/px2jnRGRLmhkafGoVj0aFqXvlfijO+Ixfd7kWCsAj4mu+C51T7mpfIKb93r
         UPGS4Ar2DegYbRODwMt+sZ+ANQX5OETqsmmhM42mkMnrwbsOTSkgmv+YRatd0dAWvOB8
         W8fyfGAu/dH65ml50/8tiH/NXgNIY0GDscms56g/KpWYx4B1k5+GhuoP6UAszOsq7j6f
         OWGw==
X-Gm-Message-State: APuU4Z/j6MxbIqUtpnju3+d0yUT74WvBdwct+UfRvJ3/WfboGE/n8LQ3
	gQRT2pzegQbixsAna+Abwl3PALnwqlQ2SjGaEm7UUQDVHgEuJvnsh7qTMhQ/vX/nSfWQRTpe1bu
	hzas/WCfTGhOxpbI0bA9NFqNr0cbkGL0z74p2XF/sulh2peYgO4qtG5zFH1KlAduY4vr9
X-Gm-Gg: AYBFou1aMwiP3MddlLUQPQ+QgxrfwfTU6kilUGtLMzzgXtwmhG4wk+imkanY9nB8hQI
	mm6fqBgKIJx4RGmA+E9+/Eo6NPUVjAxLUk9XcFEBpOKDWK51nn+uvDc6wtX/XHovz2R1mvqQTSv
	SpsIo5AJriTaobgwu/wWQzsjNSAv31OgTazzPLc5znOUBeNbm7579XKxdf6go4l/mI3UcHFdUAF
	586Qhyt+Z2onp09pJ4xphzhgdcNMWbKMkk4bJiPqhTMCDymwUYQRZBc9v6ezVbH7ZtiUpyhM18I
	w6QG8r3tjWLM7v7AUD2kxqF+DI0YbTYNjJ5q/QZ9YE5pUrqYqF6vecNhBNsqLw6wxXyTAR17teZ
	X/UGn7TAkjdtpzGJ9T/IXU/QZjb9k2wmU8z0HB4rAsGPuW8xFGLx0RQewgw4rhGqJhgMC64ie72
	xzbzaOoi95b9gyDchQPR+kuM7jxcnIPGWGmlQA5h33VKT25X9oE1VGWWEWYw==
X-Received: by 2002:a17:903:324c:b0:2e9:5876:17f1 with SMTP id d9443c01a7336-2eb364c41f8mr95274155ad.23.1793747937372;
        Tue, 03 Nov 2026 15:18:57 -0800 (PST)
X-Received: by 2002:a17:903:324c:b0:2e9:5876:17f1 with SMTP id d9443c01a7336-2eb364c41f8mr95273965ad.23.1793747936806;
        Tue, 03 Nov 2026 15:18:56 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm358665ad.21.2026.11.03.15.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:18:56 -0800 (PST)
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
Subject: [PATCH v4 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Tue,  3 Nov 2026 15:18:40 -0800
Message-ID: <20261103231850.17493-2-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea6be2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 1VOgtN_ld7CVjtJOIq6ueMwH6TwJO9Dk
X-Proofpoint-ORIG-GUID: 1VOgtN_ld7CVjtJOIq6ueMwH6TwJO9Dk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfXyGPYjouJcgQ1
 hVaNcAMhSXl/E5t0Lpv3sv/C2qKPqLqTUamxwZoNYtWQ6rp+rhtg4C3RxY/iMURvxjclqP5U2uQ
 vUKnkcSCJKFxomYrps8/wIf/7SiGXQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX8JclmDU8O67R
 Rv1FZwsCNvkQBYcBOaCHlRBKJqxsPiMdgNEi+xaDKTEUotbJ3fwAox6YSicKPsb9/ga1rcG3UCi
 ZkrOMggO6539h0tmpp2LZvu0JaHK4lFrgD4WmV+TQXk4iVRfDeOHKejp1BT7gvCEskAFcHiGPq5
 3EafIS+X1p8OApmGqSc2hWoO3GUbSBoMY/qLN+k0rSVx3UpjqTC0e9/WImyI7ZGgtE8VXw6+DFJ
 bO3hcAlDFwKL4To9bCpHSwWUTw/YoFe827b19ESwQbypwXnY6VlA7Q2vOt8M+FlkN4PHdf9hfol
 yum+WONPJJCr0U3S2c+PEPhIxfjidpEgb02mJK2jKf6SZNnecHdUJcRWtgIr4lCYHjjskw9MXtc
 erZMZIWaDv8PEkFmj8i7lai8Rh/6R57wzpMFFLPJsVGhKWyo8BkMLnievV46WrpPVOnE4Tw4u5o
 2Emk7e4gygsGj6UjeIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030092

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

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

