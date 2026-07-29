Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5023E762A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340631; cv=none; b=rL6mqP2wMuQ2x18JDRKzJ9emn/MnTmNA++NKbj9d3K2A66afoX2sDK9iQSOVHiu84A7FR85m/TnRTku9sjSh1bC2IL1bcaZoO8nEiZo3VgSIV8lH4yyEuPLdy8uSDGfOXGZ7V/Xlk8nmnDZh8ab5H1xCIgh/BHnN83cv5qHa0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340631; c=relaxed/simple;
	bh=/44549ZR9rmU9stCTzJ1LxhK6+SRqSOKEj1GR/fTo6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aAjb38l+TxZ81lEOtCGHwoFZU6doKtKnL0lPVDS+6DkuJAyjXUDlkFRDx8jOEN1kl1IPthIj921LhL1/Paf4CNpJ7oifB8j3ers7hKQN2WvkiIBUb7VNiFR7lWJaOSdRrROZ2XuE+Yivccxr22yOst84IPTJvx9akbPXNmeZg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUurCzJf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqmwPtLI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUurCzJf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqmwPtLI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3JDQ1963441
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+vxaHAH1d7u
	WRj+vRMqPMMyCu77C7ZHnpa7ie4VJLtE=; b=YUurCzJfQJ8tzbHZopcXBmX6lbf
	dZPtHQzqOSAEwf7UKQC6EpeOh088W/UDcX55S92F2CulQ7n9RZ/tF51az0Cand1c
	qeZB0VW88mcPI7Me4W3/qMtLwalr6KuM1y16kEdlju7uxD8/tnofAAzF1J3PDnI6
	C8MGGfSsPpI48F/32JbTWpcUOqMsNAuhkG+213Nnvg2Bo/PbphkqjtHzgACVSRQ6
	Om+DNvSpyGTdHUPKH82AgOBLtIctGa6Yt8bMOMAnVCFT14+kVl+MtiKipo+o50l0
	GITBd5HiQVoZesvHDY7heYV01AmcDuYX8nSezk2DihzkiU3jGXhgJ9N8sRA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgy919cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so108025ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340627; x=1785945427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vxaHAH1d7uWRj+vRMqPMMyCu77C7ZHnpa7ie4VJLtE=;
        b=DqmwPtLIs//BWZm0sOMOhIBgpg35CZ2SCOc917ldqNPgeBVU3YTG05Wh2JreW6FrX+
         xYTMcyXuEf8O7bCk0c3wSzbdnK/QVz06VAMb5ErIHRKxGB7ImoFzBQ18g8zywQwqar+b
         ZMmQT3WjebsDBPy4xrxV70hmJRAqJYuKis3maxrtxUPlWE0ZD3K0tzpKXT6qoLzE9Kez
         ly7tzzVLTZLfz2er1k3NRtFEXByYXbn0Ljyag92bpoZ3fNUuRiZL2B6fDj01VH3Mry+F
         GFguyE/MY41T0z6G6U8oRWy0E2n0o3NmzsiWxX7k7V2nvta21q7H/cma3teFziwI7lhC
         tMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340627; x=1785945427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vxaHAH1d7uWRj+vRMqPMMyCu77C7ZHnpa7ie4VJLtE=;
        b=ZMvRSo0X+UZT7wxEbIwjBE8yj/OSd8uF+X3yjjEI/AF6boVbOh62k7h4yL7RlbmeIt
         pB3p3jDrdJZq6EPidSPKJbpXKjdLGA3JTJ1g4jdxZUCQg7Ok2+0d8p0bwUpe74vi9Quw
         3eZRRS7Ddv5bJXB76d9i6v8HMmxlgoBc1c/zA7ZdlAatB4nmWY1BfXPvpyHUphmHuTpe
         Ou2exJt4Iq6EvDG5bkC7ijAzSBWNrvWvei4C8OaLROjOGrJQWacrAT3Tn6n9cLCyRpZu
         MoVWhjmAW0T7nWTvyrQwpP6JHEzaJwq5VCdUJC50e56x8Kk1uNwZJ4Tp8CQcuQdNjfOy
         B8ig==
X-Gm-Message-State: AOJu0YwWL8swGXZwsiGOzklf0v9JSu6KbAXAp7vzpcACQbpCkCIniexc
	a+D0Z/JJz8k0SWVutC6QhWmyP33WfhRrXNS6cuIWdSS+Vm2ELASaFXx+3K84CYDqo8snn3qyifD
	0ByNYmgq4wiiM58RaVnvVWij7m4SuLMuthn/5yaYEL8QQD52p9NXVMnm1hZ6wxVrckAiz
X-Gm-Gg: AR+sD12nQo5c0FlmXU6nVEAkrFQZ18ncXMXvfXhJqMw+e1/0v7GPUhgsj8vIRRFommA
	dgda/yc8bwBsMgRstrZU/LkwT6hQaP7L9zOOdYxSvkcNI2HIoVnMYHBdKG6v5DXddbJjnPTMQiE
	KwwkjKSQGgM5+v05gucSLVcc/NbygV5MlxLBcZqm4g8lmtavw3KSMGYoYE3b+2qRvn6aAg0Y5ck
	py/Al++U7p2aEA7UUhvENT6C/QbjCyY01i2dBHu2rjcIukJ0YGTucom+3EN+AtqKaMVOis1OsMv
	DvwKnqbGznqOpdslh3NfCaGYYR6bYDpU3mN9X+7iS9uIp5YqQPylE1FJLccIDXyX7YShx1OP1nG
	C0CNTNhMjTQRR9xjUH2kSQQcEeBOnYJivM505beSE2WgWMzk=
X-Received: by 2002:a17:903:26c8:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2d02676518dmr31347275ad.22.1785340627077;
        Wed, 29 Jul 2026 08:57:07 -0700 (PDT)
X-Received: by 2002:a17:903:26c8:b0:2cf:461a:3863 with SMTP id d9443c01a7336-2d02676518dmr31346935ad.22.1785340626645;
        Wed, 29 Jul 2026 08:57:06 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm13546035ad.72.2026.07.29.08.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 10/17] drm/msm/gem: Remove useless locking in GEM import
Date: Wed, 29 Jul 2026 08:55:47 -0700
Message-ID: <20260729155609.20190-11-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
References: <20260729155609.20190-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX2twtfqOT9u0E
 UqGi8gWsRv+S482ge3rmgikkmI4oRTYyZx6ZzTGAv4P4HQQpEj266RAE6dd9p2ZX/AN8CA68r76
 0tVxhXEwmgJ9zv2FToUXsIVx55i0wQk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX+13RQrQD33Qb
 bZV4Bx2Bxw1S5g0eYyLLB//5FmweRLii39T7OoMaUcQEHk/OJlYMDRY8oRaIMc7A8tYsGkas7Pu
 HyOMUHOMu78W48HRD2AAqYJbfHpnoSjGsn4mRqqawDgIx0fsAyxxY86Wru3dRR0p9vy6r+ZX0Q2
 jsOrB8CG11HYMJIed/rpOhCt36HFbShYclkAr66DB3LdNJ5s5Sl0C5q4mwdRw/qn+KF9T5DTEUe
 7cY7loZQwn8mhAenkJiuK787BkrD9U50xmgkY+YEVweIFtfQy+W3HxXqSwZdzUT6IkJWG0DTRuj
 KlL4BcQOxIl8fhcC0mNBN0LBNm9cqHib/wpPVK/sl4VmBcgXYu6Zx8SSxZXsSVkhIDe4YE6C6iQ
 pld0mcPWQe9lnkiXeB47u/t1lU553b0wzY3oDGfPbcWFTy3E2FJU1uk2TUjsjHeTHV79V74Pu1W
 OsKB1XcEvuBrgbLAzCQ==
X-Authority-Analysis: v=2.4 cv=LtKiDHdc c=1 sm=1 tr=0 ts=6a6a22d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: FVHlRVcGtpkbl-aZ_kSCcbzM2KG7P2aL
X-Proofpoint-ORIG-GUID: FVHlRVcGtpkbl-aZ_kSCcbzM2KG7P2aL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

The locking has changed a few times over the years, and this extra
locking was the mistake of evolution.  Harmless but useless.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 74c3728f45bd..cc45392691e5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1310,22 +1310,17 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	npages = size / PAGE_SIZE;
 
 	msm_obj = to_msm_bo(obj);
-	msm_gem_lock(obj);
 	msm_obj->pages = kvmalloc_objs(struct page *, npages);
 	if (!msm_obj->pages) {
-		msm_gem_unlock(obj);
 		ret = -ENOMEM;
 		goto fail;
 	}
 
 	ret = drm_prime_sg_to_page_array(sgt, msm_obj->pages, npages);
 	if (ret) {
-		msm_gem_unlock(obj);
 		goto fail;
 	}
 
-	msm_gem_unlock(obj);
-
 	drm_gem_lru_move_tail(&priv->lru.pinned, obj);
 
 	mutex_lock(&priv->obj_lock);
-- 
2.55.0

