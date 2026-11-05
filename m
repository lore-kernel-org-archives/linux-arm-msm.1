Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896926;
	b=Hr9GDN4cNgEsz1rBy/lZAa5qn7Lu1h4JsnnM2GaMfzRwzuJjSAQcQuuXrdUxqiMo+0V0
	 TnjKt4Z/toIpYPaEfW64uqBSPywghGXM/n55s84QkbbBNwb1yvXI/LltwgFEYdkRPZILo
	 K5maQPxob2Vt2E830Hlu7igyLvgNf1mUW77cNsuw/N7AeDJOq+sqwjJQwP9Quq3BWRRCT
	 SmXsaVQPWR+qYlliKhmG5mjdJxFvh0YM8/j1orZzdkhReifqcYbCaXh3jbummuxRxneUN
	 f6Vt2kQ9CR7do2pClJsMHg80GgENkOz/EQj54bMkF7d4g1nP+EcdsHLDmTvzRLqYTsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
	b=aoZNnG0DpyJnsrE8aslB7C5MUcBkoIthFJh/oAQomjDMF1R2NegTo2s0/vCK3f8HLXKZ
	 a9ynyDJB2yukyZfzUpHJo4gz1pVFpUnAdiwVtAFCL2Ns459nzJXuibAaRwy6aoJ+9rO2w
	 TyuLt3nDlDgNNX8buuSF8v7Eg0QQc8TDfoQdBfDoWEwnRO1pvwdlTxtuKyBXL1qZnETsR
	 PLQDBZYJzWXPADJ4NUb0VhpFyHVqkFTL0aFZdYzoYOHi+wSHYD0UvV9ZKlU9sf4VkhoU8
	 M0f54dR5F6YxFuaRydw1MbEuE0TPivEwxdyi3I21iBE6lvRWVV2KxMy0qyYZHJfRW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KP+35F22;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAFbkewY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A62606D825
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9A62606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KP+35F22;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TAFbkewY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQJWs2004738
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4WiKxk7FBKJ
	GDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=; b=KP+35F22f3H+NrnpEZ1Wc3CTglY
	tt+8r2EyzyG8kgWUSnr36HWvL1o5DGfvTAN2U6V5Wd/1Z/zhCe1EES4VvQ6zgtyN
	W0ldRUaQkzzdcl7v0EPl3Ddo8Q/APlwuILMYPSh/+k7noiG323XEkLZyBp0GcXCr
	6oYZaNbQAbIa9wLEt6sWj2i2y50JvLJ2Ww2cZlcvM7xMKrQSW6wDYtD6Db08ZdPa
	T+yh01c7PQPGA0h9aGytNxoby/kDDXeLgiC7aEZ1m8ozkIO5r3XbmEmLDmLjAVZq
	izUgIM4O7QzqmV5hcfn+4U9GnVPwH4IoDF3iq1ZCp5ibmgg03L7J6p5E9Ww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1pxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:42:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so2062300b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896924; x=1794501724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
        b=TAFbkewYtSAJz4Ny/I3Hvi1LQEztq88KHKAPn/BizfAbvyde0mWsreQerPZKJghatI
         9V7tw7dRxidWko8oPl4Eyf9QhF6cXlh2Sdm7gyUhZhg7NE3KKxP1ZCUOGbZ0DkaAJ8P3
         my3crGWlXdsKrzo+IAJ0gIE8bxgOJtas6T691bBjdFOMsR106WEvjBNQXSoKH/Re5yyt
         jXFQh2yZMbLT5/GH7opFLmxu49mOD8gc0bv5KECTSbtEYJC+bHIH5R9MUmMddp29CkY3
         EAkw6G1XMPLoG3DgUZeSHJ/GLSLLdFqsCgTOLAVKeFW0MeGvJWkVU8y1UHRmqFts8twh
         ypcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896924; x=1794501724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WiKxk7FBKJGDyVAt5L76xpX5rI7VNgOJo3nrJ4+COQ=;
        b=UV7nesj6e6Oj5ILWWQf+TGCgtY8ZGXFNEqnabrdZsNjfEBZLYCTnvJuSBGA1SuBYvH
         125Bza4qARO1VvWya1/Fd6zFe3otW3X6JJRJexBmYCphTBmGWuFYbjWEs+MSfnUgiYny
         tx9NoaKSUXiN4mXK4wgdy+MVUns6J2lu0kLGZ5IK2WCg+y/kA+Wc3zbYPs1Cs3sKCkQQ
         /AzAQkHR3bYMcMyRcsKDnEcSNxWJmKIQWSwJNaDMYIbJCYYiBC7Z/JeNxVuX8KPnfksx
         rbnfbzRqp+wWz5PR7Ubm70K+q2Jy5B+AcMGIP0Q2mu7W+wqYJqju2AN1gazJDcmVx9ij
         PwUQ==
X-Gm-Message-State: APuU4Z/j+OxovwwPGx7JTW8I5LAn99f5pafiLEQipe+pkpqKbhj2ejuY
	mOhpT/+VpOrbciQZqkw/i9yz5FJ2QQw/Go1jdrVSL9CgkDYc6J3VGi2ngkmrVx4j7CfVwXyi9eh
	wONSgg5CFHK+0XGt2jQIF+fAAlfLZqGBk1ES0TNRWR4XRnG6n2qfWeNgb5C2vaRgNcYsY
X-Gm-Gg: AYBFou1Wo7DQzDtMmNV9y9Ia+B2f3uHghEcFDJ6FCHtexD0SStn5kr+qe8vWnoKWMd0
	NNDNGbleEAM/pBS+CNf+GVzRT0bB7wxtx1vWiaOmWbZVZ63Xm2FXXRYFsAOO5TqlxJfmz9Lnpng
	FdGRIbAz3SpCjOxa+jAgFiuHehdyrlZ5dOWHh8KfO+36IEOqoFfMxLYUU2cewe70R+WKsNKiqDw
	VGIuTF/BRtlkPeyOGVpTuSihkXoRqzvlslFepToM6y5R7hLAfjWEP9NOrV2x89I5RxdQ225dPcG
	F+jo3TwnuntF9pYNskSimPJ2u6pzpgo2pcDnf94IWumBoMHzT0gIHT5dK/S7gnLNL2+HoGDC8jp
	TBTJIT594UHeVKot0AvCjj58oNA/89Suw2XRyLhqnu+QlHEOHrReVvsoEgotq1qszsIj1VvBmmB
	Zi9anAFX5ch8F4vu8TFrRAIOMjF51GsxtoI8nVn1WJ09CjC+hA5OjIIRqhm6K3
X-Received: by 2002:a05:6a00:3990:b0:89e:db8c:7a39 with SMTP id d2e1a72fcca58-8a9bd6d8c91mr16175010b3a.30.1793896924480;
        Thu, 05 Nov 2026 08:42:04 -0800 (PST)
X-Received: by 2002:a05:6a00:3990:b0:89e:db8c:7a39 with SMTP id d2e1a72fcca58-8a9bd6d8c91mr16174992b3a.30.1793896924026;
        Thu, 05 Nov 2026 08:42:04 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918d8sm2233004b3a.22.2026.11.05.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:03 -0800 (PST)
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
Subject: [PATCH v6 1/6] drm/msm: Hold runpm ref in set_sysprof()
Date: Thu,  5 Nov 2026 08:41:48 -0800
Message-ID: <20261105164158.23263-2-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX7x1QLRkFeHCp
 iQrixlxQ+C0SV/bUZ024IQ6rDX/bJmevTul7+5ryPQGqOkzYBSmnrHJg5wP9gTybzlkLRJo9O2J
 FgBwUFw3wpeNmHKre98qo/wLzOqKlW4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX2G04cfn8uMNJ
 +YorM33d6Uv19TiKr0kSrdULm/vQl7z+ESGUUCHDrfge1ek6L8bpapzeR9JsmQrlKHps+E/ehPH
 2YfLXYGFOaHA9qt6ZJR5VFMYOtmpYqzwmaUquCe/lN1CT/HfYAMqu9Vq8fATJwPa7o1VSm0EreL
 GnXyqF1SEw7PCaelqvP7cln2358e5QFkjKnpiQNL4lbxswUznRD9p8jMaMmeJMBw+VC23GGVxHs
 bxOP7BHqxMOWU+V/0c+SZQtcfhxwCRxsVF1IljbNz2bFrlmqjelp4ZmG3dp/evfLogdY3kbPHFF
 TFCnR0nVPYM3v1gxnzxruiflGqYrLwGDH1B7ExjgwdcGgcuWMPwpnEo60JGXl4OAcrbC0gFbXW/
 KkDw6R+swNm0qnzulRuvWlMZwcUY07r+0v5Cyy6FsBjac/RYA9vVtaRAsDKUQhNTOJWsutGBjXU
 N5U9tg09kMpBh/SpsXg==
X-Proofpoint-ORIG-GUID: QlbKj9VyvMBvsTxTXnTRLMyEKJSvJGH9
X-Proofpoint-GUID: QlbKj9VyvMBvsTxTXnTRLMyEKJSvJGH9
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecb1dd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=TtZx0lvJKI4lzRINSrcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

We should be holding a runpm ref when we try to set/clear GMU OOB
requests.  Apparently we'd been getting autosuspend lucky before.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index dc89573881c4..cd59daa02bf9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -377,7 +377,7 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	 * It is not possible to set sysprof param to non-zero if gpu
 	 * is not initialized:
 	 */
-	if (priv->gpu)
+	if (priv->gpu && ctx->sysprof)
 		msm_context_set_sysprof(ctx, priv->gpu, 0);
 
 	context_close(ctx);
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 8d550d281704..4d744604f436 100644
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

