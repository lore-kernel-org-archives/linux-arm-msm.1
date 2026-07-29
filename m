Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEF4963D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340637; cv=none; b=uXjGsxfzB/GPXpFaoL6mLnJplGy1Dimrxnm+gUBzWNWxExM4395VrpgtMunW8cpykKRr2Z/k/DHSNEN6PU+jFI9v0ZaTOgAJ6Ky2gXMB8yU7tljn2qoUtiF4fBBYZAZjKnCCcOv9EH8Agd2TqRVRV1o941KTYs6CB93A/v6/Nb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340637; c=relaxed/simple;
	bh=YFCARu1iDAQemSo9hHRVwGO0Zi1LAiupPz1rAzpgHvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgC8zoV7so2kcrzwq9g1Uu4c9QI8tbPaGGyiU1lcGtFimD0tVbhD0dH6UQLHZyXmGVj/kBgBrekuBXr+rXwLJn9QZ0UATW8B7x7WP6Z1QdcwVJyuz+fFfc1/nhoB02kTr7cg00ZeuL/xBPBShPZGUjo2pHmBScZl0FTNYnCfVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDbDCgOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyAl9dpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDbDCgOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyAl9dpQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF37i53343206
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QToEERHB/YX
	j06omeVD4G3Qa5rVxfi5IbCI988AYdmc=; b=RDbDCgOUmHwGk3nNfzvBwVjdu1c
	T1f8qh/c04cVKZbKjexPmUkU9BvSuNjZl/95c4OXocn2EHqeashGBG+8lRsETOuv
	ePBVo4L2OpjGFWs1Yry/HOSdPtwGMILSr0iVCvf1+21hyfO5SiugNMzH68FHRJGH
	nwZosLbTpnNIVXuyBGrIbwkBoUoR2RkcjyFI+PnV0MTBj4Af1bmV+8jMmUj1L5Vj
	o5Kz3Tzd0wv1FrN9OEUbFPSn9cmMGxvjl+9S+m+W6HTlz+NK8CqAqG5vyHpDLLA0
	sTjw5J+HIi1r4EaWXjKmeYN/nPHfvi+T6fxjlGk46TG7ROZ3Egmb3CuA75Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh3ms6ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:57:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848662cd2a1so1302218b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340632; x=1785945432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QToEERHB/YXj06omeVD4G3Qa5rVxfi5IbCI988AYdmc=;
        b=IyAl9dpQu87i+9Mzrt6ClTe2Lf8ZwYIH+UUFrc+dus8K/XXLZHsY9rYSRiXFFnnTkZ
         IN0Bjz20kWtUAxpE2seU8d98lLFeoBrlavGyIMFhqdRaXzEQYLpwFSIiWK2JccBUw7dq
         svw90drxlA4G+s+LF4ykl3heMYnXq9gTN2RSMJesJfGm+oosQ5gH0BOeptJ6LmniePWx
         I8T4b/+vUeanMqJoN+iHsCfndpTkog/IMyrogZ7psAaeyh9Dc6hR/mP00avOl0pBbaET
         Ow0RsEYWSXH1FZEEpnC3m2GRu8GT/hl04CEH+2+BAPo5cOTN5rmZtgvrFecMGJQ2qvdO
         WMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340632; x=1785945432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QToEERHB/YXj06omeVD4G3Qa5rVxfi5IbCI988AYdmc=;
        b=a6U6CCIZs2H7k8Id/vRkfR1sLY1G/4V34phF3m08Gdxm0uR4PAjtjXXvxVSFsQUFBS
         I/WiPJtw9yjKsWSO0AI7gWw41mSzF7sOBsxd0ezbSLwL3i0Or2ZFnBOnlDVdUk3abrmW
         PEEAH4GOMA6eUaPoAvc8USZ+sdbQKLi4tnC0EwoAdkX+fkoS+CtO2aL9gYlfbDZ4/HqN
         m6hixheFXDlihndi9Of33spGb8HJrkNAu4fLEjbV5is2B7/TH75YLkF8/DNQKAImM8fH
         XTaFQFWrw9i6CcPDwled/OiZR5oODJjOdXGJ0iHu+AcpaIqj/NW0kRZB5IWq7jormgN/
         t0AA==
X-Gm-Message-State: AOJu0YxCJxCrfCL7IWTCbblAd2Cks5gaVlBY0f7hxaTwTVYNFIv3dCLO
	2NFMEBket4El2gfgbbZmzC0HAPXwwupJl5QNqU9QkT/b6tVe7qn9muwWomcPdUbQORb58e4DtI3
	tpNqgqtxLkqRITnjsMfr0ngLFkZxiL/+bHVVwUGx7kYS2ABj6+JBl35+vwkDdgkC3fdrc
X-Gm-Gg: AR+sD11MwIeQGNQ5+Mq62zpg0NHA5Snw6tpc1rD2/qgAR0jai00GDNNoAuYYh3z80kg
	I6FJLH92+nGBou2s3sad7Q9HOMBrtSP8Mvd56Jm0jd5JelIKLC7jMe1yGzDQEZLikfBIQAyK0oJ
	EcLXlfvz11C/W+PwkqyjgzweGfxYxyh4iTvJTFnsEmuI7kIdgH49FjQzxkDnk0ZS6ynCIJPKA5V
	pS7l4O0ylTIueI4OlxdQIRBMRIzAGSys3OWpIkCkGRpZFmdW9UZQK69QvAaH8aFQ5qlrkdc5mZg
	jxUyhvy7gQU/PnPa2LpkU3cPfc/T9VICXuEF/v321+WKsExY8ExRjzKvheuI23+kLsIYBr1aCkZ
	wqHWkXZmhk/ILg2E0ygUpik1NgeZOxT2IMGw0DRxnN2zqQsY=
X-Received: by 2002:a05:6a00:39a8:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84e933e8275mr7336334b3a.37.1785340632560;
        Wed, 29 Jul 2026 08:57:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a8:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84e933e8275mr7336308b3a.37.1785340632131;
        Wed, 29 Jul 2026 08:57:12 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdba929728sm1055763a12.29.2026.07.29.08.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:57:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 13/17] drm/msm/gem: Validate lazy VM in GEM_NEW
Date: Wed, 29 Jul 2026 08:55:50 -0700
Message-ID: <20260729155609.20190-14-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXzAIFUAhBxQVK
 oWnDBTmylEP0ec/um5oh38wfm1r3TYicQxjiD1coTeptP2K/EP8u/u91QOlV9g6qOuOwUtW3Ls8
 bbnw2L3ycHyipttaKbdGBEJj80pBf8I07JqW47C27pyzZ3jA8O3kyuRlz62DPxU6y7dJYsvhtJZ
 ysSYRHHgWTi2RGP+voc6uhUXxfLXLvf+YeY04jdWkefgl6q4RYU4V7Gd7Kp8yYIeUmkl2zp5oOr
 MWL++w3NI2jM2TNA0/jCNUGN64Pe/s3Z5TMwpmNHhwEbVdxoblnxa8RwsRi82B0b210Kq8paDZo
 MLa25aZ2Q2PV0AI3COsD5Ow69ZyunXwMYp6Nr0Nuwo3/WYJQORDRaEPJevhZKUr5qE4+hQDLaJB
 ELy+zyXiVqp4Vmy2AB6oziIsaRD8KGPNVuY1dmntSJFPRB9uKjZsSh88FnFNooS5rhC9guhKBQk
 9cqTiAM9DYhsOqmtkRg==
X-Authority-Analysis: v=2.4 cv=F49nsKhN c=1 sm=1 tr=0 ts=6a6a22d9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VGCgC6sU4evaG-_1UnEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: z9yc8r9cfzI4arMG3gW4h0L-kKvB2lI-
X-Proofpoint-ORIG-GUID: z9yc8r9cfzI4arMG3gW4h0L-kKvB2lI-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXzs1gVhQtXusr
 vyHFlCSX6AIz/seVyZUOs+iCtMTqUpEQEh9J6PehIvRALHSAiFnIf2Bucyu8c/LOKCuHPbLUY1m
 137gDjfhm5mt2GwckjTwVeOcHoiFvpE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127

Otherwise creating a _NO_SHARE BO before any BOs are mapped could cause
a NPE.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 535c6e1acb3c..de4e60e28a71 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1140,9 +1140,13 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	int ret;
 
 	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_drm_private *priv = dev->dev_private;
 		struct msm_context *ctx = file->driver_priv;
 		struct drm_gpuvm *vm = msm_context_vm(dev, ctx);
 
+		if (!priv->gpu || !vm)
+			return UERR(EINVAL, dev, "not supported with shared VM");
+
 		r_obj = drm_gpuvm_resv_obj(vm);
 	}
 
-- 
2.55.0

