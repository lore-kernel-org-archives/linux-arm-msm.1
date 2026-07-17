Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901D33A03A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321341; cv=none; b=gvq9XJOrVSOlcaQ3cl87cmxp1x8w5a93H9lTCC7N1PSQu5HdRiZJuX1lUKvsQAloRuYaf/S8LVQ/j8As1z0elwlZ+QvfhQ8X21wH/jFy2ALEUS+msdsSzU3SwTNRZy+2bKz4pfoeBrLnN2GWGnZ6Qph9ZSxzGT6YLCTNzKedF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321341; c=relaxed/simple;
	bh=rWXwTTmh5/Id1XjgN3qlHi7qoHce582Yuw3MEti55yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTRp6My7vc+X77SkQPBTF8KIKeZU6B5GSnQWUBJg69ro4B61h+CL+xB1dwKppOwbKRQ9KBulx8ezyO3F70L7MQnWIZwHnFd/NE9OrEyEvZKIvpEGEQ1ortw/Vf2SXUvepMmiTSiSr47DqcAhBMnbzJpqftU1sRHMTTPbzXNPnK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ib6PxVPT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Br6iIQGp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ib6PxVPT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Br6iIQGp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtaLa2619557
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JwmCQxui8//
	y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=; b=Ib6PxVPThSMa4RiC/ab7ehcY6Fs
	IMOYcbieq56p2dYqLlYLUU6Bwh0lcCK76EseCJtr9LWW+/ej3/hJMNFc+uSsQE8A
	9GHR63LN/LXiM2hKABrIfJz4c3/H+26+jVKz2+EfLFR9UE0wzYGLG73FnnAq8uVt
	oaeVNNOqP7VkjBm1ZPKAYv0UOHOCArj3Tz+HE1ypXkLvERo/nxDytRFJTE2nf0TJ
	BqBvmJzA12ojitxb3nDyJu4G3c+Nn0hCaoEPbg5VVESrC99IJ/j3VO0sMs8ecYDi
	w3ufA1U5I5TARSlljyKnUNoOL1N6guhittD5XJQDuoq3OXlcIh7IwlsPE5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagb7fu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:48:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so116038525ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784321338; x=1784926138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwmCQxui8//y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=;
        b=Br6iIQGpwOEtl9Jxv2KY28dvR26W5d+uxuDDS3Gyexl8Q5+NadmQwrkhKMXjoAOZfr
         V7yfMqwLKXba6Tdt7EN9r6p3PX7VzfefMh3dSHemM7uZmvwqBv7dHrjt2Hx2JjMn5sao
         8QrcJ/CTQRpE08ssQDcSqOuNKfnxRvzF3VlviLnq2vcNCp+/8D9BHC/4pd7eKW+05A4C
         7oiIivorI0gfpDqGcX6eD8tLdfQzH2XHZOImGt8TFM9YMc4Qq3NZU9G4iNygOo/tDfNn
         ISnYAIC7nS5PivH0g0lawLF7h1t7EPswhLS/ei3l6nDyAaO8qiCYs+XD8/Xw52N3Q9e4
         rJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321338; x=1784926138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwmCQxui8//y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=;
        b=AA/Vvli454M5koKJJuR5t6xik/+98RyI3GKOxpkF9d1jN3uDyoUkygRcSz8V43y80f
         nHXxZZ3ClgveneFtyowb4Fb7ZfViwgjkVEVPFaPHI4WdFx+AzdpyFyloTZiSV269g2w4
         5TRc50SI/X5Kkd2cChZtRfUP7FyaNy63rx+9HIG7Axn1lLIU32tu/flvhGiVYsJJpXg8
         iONYUDrs4bIbl1i2xIaswG+VCxX6VjLEBd9JI7J0slDCJmPJ5Rd8fGW3CkjZetL0Rkba
         /WWbIv3UnlgaExPe979yPyX8PgNK5hSzm3GCf5CaGVVB7C/qbA5VeQkqFEROaPdlxHJA
         u4Vw==
X-Gm-Message-State: AOJu0YzFG3+mfOOTZCxW8ORPxP8L9BiCxcqCX2zy/Gm1lgWn3IEdyeoA
	ukNihrI9znInfz2Pv47zC/2D7ujL66d8FJqbIBaQZx0j5vcPcq1bEtUO9pkIHx9DJ0lxTvxugoC
	2QI1pzSW5V21QcWb5EfArLczdFxjQj4XtyFTtQ7/OAA9IuprWjh1bbDdphuoOpNKk8eoeCLpcvC
	Kd
X-Gm-Gg: AfdE7ck/iYIj/elwgHBirQaAC+0qyhGxKmIxq+dv9mF3hNVGbh5Dub+bBKL5siUnvoC
	uKR9SpoaLnNlQwWmn6WGrkAEYQmHGnD2F/PghgkDDCYEq13gXsPnqa7hJX8v0qLbzoEsPJ0PSr/
	pSWe3+GiRXfiBDhyzEDe4WkkJjokIW88uDePSFSCBO4GVNy4w9WCPN+6eF0f61tpsSkW5lcVFJN
	RUmbhrU+3tOu/b1yjEUzSJlMEnrRr7vKmCdUpvMqHTKJAxMA57mfT0PvPR9ItLYLjqEAIlY6yOp
	YFaBT4gzMstNiOAjmY4+G09p1uKD9shLRCU3RnC0zlwcC7I+Da4Cf4iANnT+s8N1Sbam2hiU2Cc
	xa6zAVoUWy4MzhIoE5B2A7NfNp4esjorpmRSCIhHXJH5xsfA=
X-Received: by 2002:a17:903:41cc:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cf349b46b7mr44070085ad.36.1784321338530;
        Fri, 17 Jul 2026 13:48:58 -0700 (PDT)
X-Received: by 2002:a17:903:41cc:b0:2ca:1eef:5096 with SMTP id d9443c01a7336-2cf349b46b7mr44069765ad.36.1784321338061;
        Fri, 17 Jul 2026 13:48:58 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf49d0dea2sm1171635ad.71.2026.07.17.13.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:48:57 -0700 (PDT)
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
Subject: [PATCH v6 06/16] drm/msm: Remove redundant SIZE_MAX check
Date: Fri, 17 Jul 2026 13:48:22 -0700
Message-ID: <20260717204841.26120-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
References: <20260717204841.26120-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX9Xw4HPmhkc58
 H2eYOLqM8QjpI6B5Ho0wcp1CtKG/egAirQI8tF7//D783cGQaOCRMjgSK4gLRQIi0x4yTkudx/n
 xHtpqTP7WhZJFH5gIgiQyjNG4s6F9eGhHxCZrT15hL7+QC/8NzPoq9IPOhPdpCdyiZyQQD1auyz
 sAJWYkvgkNAb0i2cLODO7unxcJUmZzzidZh59OEBOkscSAsVVgW14Hx/ezZWXdCtLYeLXnHmyQd
 U88S/Hpu8ZfbOFDAR3/P+Gzincn/x30tVkMuP0bJXbt+du3ffrhKV26DBBIjcAyMf8BesK1u2da
 YnZDxlguILn6LFU8MSy/K9f3Sv7LG6aL7hceSAYuO4GJQsiLg4asg+kCCGDW6b/ETF3M9L2RIi2
 YwBZxaGlPtmCz86Bagg0Pr5J7TrLbLBpLXkF52MJl+a/F1o/jm8ZYdxCTvepktLkgoSY7bPHNLo
 yfHt6jRb+nO2Fdg0yiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX86WUgbpDPKJE
 JK7oYkqSPR76RC30CFyu34HCC9jPLNRsf9BTBfTEmIC5wFWBmjtFblFkBHJ2dmz+S1wQ7qJorEU
 HxrI6DLf+VXbsnvcJyU6j7z/Kkpoglg=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5a953b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8P5ZRxREb1SJoBnRwxHWCg5Zw0DwNSmu
X-Proofpoint-ORIG-GUID: 8P5ZRxREb1SJoBnRwxHWCg5Zw0DwNSmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214

kmalloc() will already fail and return NULL if passed SIZE_MAX.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index aa48ea4e7f58..040354ee16d1 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -250,11 +250,6 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 
 		sz = array_size(submit_cmd.nr_relocs,
 				sizeof(struct drm_msm_gem_submit_reloc));
-		/* check for overflow: */
-		if (sz == SIZE_MAX) {
-			ret = -ENOMEM;
-			goto out;
-		}
 		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN);
 		if (!submit->cmd[i].relocs) {
 			ret = -ENOMEM;
-- 
2.55.0

