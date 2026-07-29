Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33544411A1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340625; cv=none; b=dXVFVVGygDekAexVd8FlQ21PiAUxD0feghIAoHQb9woenYXkUZl6Dgf4CFUv0iNqE4KZfe49MjnfD1I6j9/V6GsX+dDQraxODHt8Wv0ImMf50nIb38HXtuf4c9vpA6RFHhKRunaROP+aB8m5SYhBQ7N59tTPxuevJ36IxWdCo5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340625; c=relaxed/simple;
	bh=rWXwTTmh5/Id1XjgN3qlHi7qoHce582Yuw3MEti55yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qr6dfMNoTIMShOX9QQrw0vRneTLYrI+YPogJ1Xh15ni3zhCHKCft3r1x0Rriazj6mPdH2sMh/N9FpfFkXLi+USamySVig1+hpORXtfAogTF7agJN/MLWuSzf8PGCtqR86AmmZUwx9HM6l74zAun/vkAMpuN1qw6cj8q0CY8PEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTgZdahd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnG5PUU0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTgZdahd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnG5PUU0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2wPv2397314
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JwmCQxui8//
	y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=; b=CTgZdahd0vmOteMwuWCKSb/bg3Z
	Ap5eARGGU7HbUCqYCbccymAOJSQvzUqTrYBfTNiJZ78lCb9UG9XJwmom8tH7a/Tz
	5YsG69Zer/E3Nhbk4fh7kHfKLReYAflQip1HIr7Ne2g0joL7o1HpzqzDK5bDWPoE
	jcbBrSR3njXERuE/GK3ad1R+EHSdZ9d/g5rSBJLnjH6gnMHkU88ZZcWBzmQMucnA
	4QfkJikK1LenLYeoTyEUtrO0/KfPK4NayQanPBWG6Lx8VFrNQvScaBM1V/XOK5Fq
	BJUNC1+Kuvg79s+iozGWou/NarchO6upf+cpwUjj0ahYbrQEoDsZL9pQvIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgr69anb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso18809285ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340621; x=1785945421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwmCQxui8//y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=;
        b=fnG5PUU09gFymRAQWHx/9oa10USbcH6Pv+eNDkNrFnHysH0Vvu3xK8QPvfR9/LgQ1c
         tlLYwB+nZcdZJsX233azL8Oxz1jK4n7+cHNAKNpiyu/u4isHXyp+2zUk9tYgiyFOF8Dr
         mjLAz3A97UKuWT30P0jCmixNH840NSvFfB4HaIgi/WTHv1uYFhYmPlX2ZsY4dz6nbae4
         4sayE7TqPKljaa1KBrXVrpcEt09pUd0JBGXQCyY9KzeNt7z/+j9nNLycx+gcqMYk0dpz
         j4it4xbOgB9EnCVwNnUMlX1puoLXWoN3Qly/0/WYsrHNSxvHj/s6NMKs4GeCDR/utjUh
         SUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340621; x=1785945421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwmCQxui8//y9OuoPvnSLIPSYLXC2fHhEyhJF+VayoY=;
        b=VX46qLPTjwmlBGYSIu3rB02axxvwsEAf4oVKShyyolV/A8YgL8L5bUbksAdUX+XouG
         ox9NnkUctsSbxcQfRJ/UIUOmVTaktyZzDrWYVyj6vQ0KasIQ/IaYgIZKD4CnN9NJuGw9
         30rENFBMz1l8Ls2kyt/hpm5D0Rj5lV9RxXcUDrr43rGRXh02oG+OIA5fCLUPz8M8+yFf
         lcQtho11MtPZ+E080yhSPFubpgz+zZ4ZlMAPJUo8Jqr57KQ4lpAVSgnp+2Kx5/nQ4luD
         akM33NkMjA/SSJ3BrnvsnxosaCsoa40YR2rMkF+LdCNgfdDcIWI9QrHBjjKBkvOw+/nV
         ihYg==
X-Gm-Message-State: AOJu0Ywf1C4ZPwXTVunSFTIoHgE1YVYOuyJH4n1YdmswqenYa489orJx
	weIKBnusbQgKnGNL6wa+BXfoNuqZulSq3fx1I/XF1rk1d7iROSLHZ7vEONbZJr5LhrhcnLBJN7n
	kio3I8TxWACAx5REdwv3DRusTKYqM66t86v7iM82pr5pQng3vbb++QnBPeOUhLUpK6654
X-Gm-Gg: AR+sD12Q4EfyfvTkT7xpfPI9eVs0TgRsaCb1CawtaerdjhUPOCazRRWCarRoTr1EtMq
	8ngbiCJvY/Rc4F1OuQL06ALJFTxD5GtJ07D9ElA/5wcUAbk/+O/2RRWRrBlr8Xt1n6lkwyDMvar
	EFSk3blqwUaNx3uH8ohG1EHSlpZCWKUNLv46zpXYFeXBLi+7eJENg6/d4xHcMX0f46f6GiNP4ll
	k1jrcbscfSvwa3bYKWsnzePVwaqVtMhHl/2xOkYSLsna0O9ImvkLWV9SBEWiTehrsQoQFA2/n7V
	XQ4J5aRgWdMKCHRXtcE9IWs9A9U6U9r3WgJTN2GOI/IIlvv+41UY46soY8vo5wsbJZAsKyd1KMf
	nXahUSX/iGsgo0a07+KNhzmIRoNjL6wrTmAbRpy2hoZArD1s=
X-Received: by 2002:a17:902:d550:b0:2cc:aa38:4df3 with SMTP id d9443c01a7336-2d015af4dcemr87591855ad.13.1785340620863;
        Wed, 29 Jul 2026 08:57:00 -0700 (PDT)
X-Received: by 2002:a17:902:d550:b0:2cc:aa38:4df3 with SMTP id d9443c01a7336-2d015af4dcemr87591525ad.13.1785340620481;
        Wed, 29 Jul 2026 08:57:00 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a48858sm13719045ad.30.2026.07.29.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:00 -0700 (PDT)
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
Subject: [PATCH v7 06/17] drm/msm: Remove redundant SIZE_MAX check
Date: Wed, 29 Jul 2026 08:55:43 -0700
Message-ID: <20260729155609.20190-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXw5BwQ1hUwO3C
 iiS449WQ0BhIZ1FkT9TGY2NzFqO92nGqXBkdL4fzf8oSRKd7QlbxisJAR/V4PwwG778lRlocaok
 7VqRjzroJedb4s4lpbPgZpmJcv+VR2Ped6mHBJlSFeXRmUvx2kWTidJmLSKpG0m4AhUZ0jBdXUI
 Vj3reOQgrklMLwnwy4pN0r+EnS7xfaqwvsMvg/bJ6Nh7CM6amt7fQDc9hKszppl24HqzB15zoFU
 e0PApmfRyncuVlffiyKhO6WPJo5lKmFEPeuLFseQkF43vFcqKVh/S3Jq1a+P3NmL2M8zIYZMf6u
 T/3CtUObHK/oFL4T4b3T2giBso8zqrNzMKL8hNHqszj1dC6mNr1vj8IAu+Cltc+wnsCLAiy01Ur
 I5WJa9rimQhkaVRGcHvLOEqXWgG7CuKfmSW/6ss/6BeS13xKgB8TSRllEFaFhufOEHi1oL5tVOM
 JG6tlIHbhnRBetFXGkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfX8Wqi4xclnLJQ
 uX7HFin/8Wb684jWXyMctdoxdcyQytvpWCrTIjHhdD1maz/CryBHJrSTXia6tC7j0ddSHhCi4/+
 jD8tFzJH52mz0R2uhC2VoknOPlWvhoM=
X-Authority-Analysis: v=2.4 cv=Cv2PtH4D c=1 sm=1 tr=0 ts=6a6a22cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=eWlSUfSnBrBg5eVjM6UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 25V6qIyczeSudI65phOucnb6-dbPGKmk
X-Proofpoint-GUID: 25V6qIyczeSudI65phOucnb6-dbPGKmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

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

