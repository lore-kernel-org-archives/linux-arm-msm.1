Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6540BCB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800339; cv=none; b=NzVz6WBy9rKV4zG7cbrGHQd3GTFrK/SJHvZ0gxyySU41subWrRwSZiEOz/h0h8kvYEN4AUmhzLJC3B4tdIpoCv2RAr7M6E3K8V739q58mW+TFk4nDugUGLXHzW5gtte52QgZZzDLeU63YREpNRdtR0SPByrEWFCVvW5GI1s7q3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800339; c=relaxed/simple;
	bh=tFjBQeSwNPpemccFfW4O6nejCPixfNCYpDKMS0D8dxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pwqqGSsSVuYniuA9z8RZZHG70xjb1dQ6uyou4TicIfq1/y+CnREY1GHNMUytVGIchEPNvKc3U8uTUunaLLKQzPM6TJw8Hq1d5MXNzVQqA4mGUtBeZUkwqIhOYGZ+5/pKMfGOvAhPLDtDZdOlvxofTNZaSaODoS/ufi8mt7iQWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH+bjiul; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egUtK0f8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH+bjiul";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egUtK0f8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWED467146
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yi7hVAqdx5+cG+NkT2CBYz
	PFi9Gmuq4cd1/cykcXE/U=; b=NH+bjiulBcwR3zHDKxyh5us7xEuY1NOrn4qoeb
	ZKdaMm1tsuKKsbfFQtj3UbZZxU22uAK3M6jrVDRFXUBgFVNrDlBWiEdGDgH8JL58
	mXi1qroFRlAp0Ho/jTir5X/V4JZlCpQMf4LZV3HQlAnxSw8VMYDIJqXFmPTZZCw2
	OCv/GeJNqbvOmdSmUQULjnnZ9w1x57Bio79UDx0zq3LUq2nIGT22YRFjayjr5t4s
	+k0+U5eQffcMubdUzvLxSi0NI3IvXUIJnScIHvK7NuHcFWgcyZ6mJZJMiUJysuES
	R0vZ8nV1lka34gYhuSAupnZdqJUbvURmD1THfoCnZkJ2Lmcg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xuep4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:52:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso12692481cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784800336; x=1785405136; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yi7hVAqdx5+cG+NkT2CBYzPFi9Gmuq4cd1/cykcXE/U=;
        b=egUtK0f8OH9B9epSpENaGwRolKY7g0EUo9+eY69aICcP1rZw5tERkvOSPpOM+M3i1g
         PBo4QX4Q4QERoYrBKuJHaI4IcvZb47LJ+aKkMXGXZwvY66ihsosuDw1BNWjPJyLL9B1Y
         seuaUxtxqyrYLJNhv4zs7PX52kmWjKNde6OWBIeEvNWPkuHteneteWoXSNf7v8sl8J7D
         jJELt62nGos/pyZPcJx22AEPj/K6Fh28fWRG/dIL/ra3sQai4pJFlnzMt1dEa/oroeKs
         ChwhuGmawgsD/22Wab83T1zwvOdDEq+DERkFNotwq2ZsG0rg+mu9O4hsX9TLr8JCWGu/
         J7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800336; x=1785405136;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Yi7hVAqdx5+cG+NkT2CBYzPFi9Gmuq4cd1/cykcXE/U=;
        b=G51e6EqrBDdT3KZLcYvfaCdwvzrRhfGGLtderdjOxhmqc6l/H24vLBrGZAG0BNPiFP
         sbI6vRTLVIA+BFzMO9AewNxZD33dwx0F3BrhQsmhvN+w+s8e3Rlr2y5hDDPrW9ullZl1
         si1HCoGQ4vaw6XeKZFSIC6Diz32Fj0gcIUIXf6GqdEaw4APjO6hz5Z13sA3VyhIuwYlC
         yt92vackBm3n/0ujRiQNbD8aSFUlDq+5qWxk2vj3ns135bbjfBYBLwQ9tVzUPUv9uUTy
         xyfETWotLipEd/gvQhe8aYltwkdz5sbNV6ClSwd5nu9PcbNuQnSovjdsFd00MdWUd2bf
         pHXw==
X-Gm-Message-State: AOJu0YzKRgeQAcDvt8X8XYXfawCOAOcX3So72rUw8KZdPBuEwIFP6kYa
	ykobTDN6TNbCkSXszxr1zAB3egzCVJrtIjb6kx5D/dHG9Dg1Pt1K5HOZb0J5uy08tG57mXTq1Wz
	udaevV/3k34pka0X7JUcvbErNKa6vFHb7xZ4Uy1bRx6eqai/gvyNcaiVkLuHP8lNLhijl
X-Gm-Gg: AR+sD1395h3ChJ1YJq4I8+BjAcaMAREHMS3y53K915LKJzwP6B+8PCmGwAd+X/sWtGW
	16rfKMYPhS4pOpakbQeqn2UEy5zuh454hpNSxLcKiffdF9qDrvZfySWtAID2GtnberiTAjHLnXg
	KuNlN4GarUhiztJaEJpkNexy30XVFgsbr3yiHj0I/DJsAMtSJULHivDZxtiT01M7u/fdTvTEG56
	BXJttHQBgBdITBBhuuIrdzGZ4uk3fhuoIreX/EIhQNnwlRkWfseoD4bKuLictB670VLR146IcmW
	AN8zJ25IOQR9MT+MJNZfuWLRQbcrWhHtun3mF2Ptz/HzlQcnvTg2xLnzfZSch9yiEfaz10snDZQ
	aEi98UZolBUQ2ZfzZjPRxR+OGpuRTUMGAgPTnUdfmCI2moH9wKgEg44BcXnl/IHIOtJXqcEVm6/
	cfzOaLTvyxx5FqVQ==
X-Received: by 2002:ac8:5d91:0:b0:51c:7b12:5fcd with SMTP id d75a77b69052e-5283dfe4310mr21417061cf.73.1784800335876;
        Thu, 23 Jul 2026 02:52:15 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:51c:7b12:5fcd with SMTP id d75a77b69052e-5283dfe4310mr21416851cf.73.1784800335303;
        Thu, 23 Jul 2026 02:52:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a7f6sm914182e87.18.2026.07.23.02.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:52:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:52:12 +0300
Subject: [PATCH] drm/msm: don't tear down KMS twice when KMS init fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-msm-fix-crash-v1-1-78fb4721c2d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEzkYWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3dziXN20zArd5KLE4gxdi2RDYyMjgxRLEzNTJaCegqJUoCTYvOh
 YCL+4NCkrNbkEZIhSbS0Abd07NXEAAAA=
X-Change-ID: 20260723-msm-fix-crash-8c13220d9465
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5923;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tFjBQeSwNPpemccFfW4O6nejCPixfNCYpDKMS0D8dxU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYeRNmz9PZbpb99urpycMGW2Buxz0S/wLzzb3Z
 07Ea8i6WxSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamHkTQAKCRCLPIo+Aiko
 1fbzB/9Ll7BeCLzI1pD/AZGi9hqZK75TI9ni3LjjE62J2gAeZ23SkfEFspKyOav3dLPsV7pCKRO
 w2YEkDV3fI4GKKnJoKpU0NV95U8MWPXc9SaxcC2PEDHjxSS3b4bmwMYO82zHHqaRU7RpGO3hPm3
 kJTkewm0G1hwNHGpYUhag6OuPpBwfrQaoEVys0Na8R25t6cLDIZ3pDsAVnVz92C5/yt3ca3Zr6Q
 ZHviG1X8WEJrD8T6tSxFxHOxUAx7RJanis7VJX09bVN8b0jCGVjuM+ffC6Ii6g2n81F36wbmrk+
 o5AutjdLZIJwg3blsx5lOljBoTg1l8EtoHQtDPz97TDfAn2C
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gbxxEUCFSLFr5xzLM_ZfbZA1cNz08wg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX+KxA/G9loCSd
 z2B+T79k0MNw+M99Z0JkfLmIq910nXvC7aj9iVHjZO37ZtjaJDLUxB7GIR96V9+a+dWU+TdVkAC
 GC7UHhTYTPs+P+SSKKYzd4BYMSSWOvE=
X-Proofpoint-GUID: gbxxEUCFSLFr5xzLM_ZfbZA1cNz08wg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NyBTYWx0ZWRfX2LFv1Aev2DPD
 A0BRwPuXDodr9AWIWHcu3NlMO0jSCSixj3j6+QIoMff2inOCJ0IjKp2ereiaN4atSJmxF0I8S5w
 mnq/CKGiSuNkuacBLOWLqa1AK9eCLzpX1zzZ2XYxx4SkD7osisbUzF7lRsojVfYEjckOq6VKEsf
 H5O6ap+cN83T5bKzk1MCQ02ZdwSQaeuyE4pxVCoCtFABgburOBzvefDYIso1A/fvWqWtOj/ju5k
 TnA+/tmhwPcs6VcbqUy6KwzrjhoWxRzJhkWOhjTcthLspw50SA7Dsg4JdG64TjxdxBymez1DYj1
 XQihO75URREUfkpN5rMJovP4PPYIO/ZioxSB0J7qNBlYYEIV283fg+io57DuKi9vfqP9t4214hD
 mruc4YcHGvFCU+JrdPzHWJSMVsTwjcxub70NB9jDoG0bEmiACXzgkG/OA7yogtkmptx/O3NWOFO
 pBG4iMDN3klLIPUSIqA==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61e451 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hHd2ON2UwJ03A3v6ol4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230097

When priv->kms_init() (mdp4_kms_init() / mdp5_kms_init()) fails partway
through, both display drivers already tear their KMS state down via
mdp4_destroy() / mdp5_kms_destroy() before returning the error. The
common error path in msm_drm_init() then runs msm_drm_uninit() ->
msm_drm_kms_uninit(), which tries to destroy the very same KMS a second
time, which causes a use-after-free crash.

Bring MDP4/MDP5 in line with the DPU driver whose dpu_kms_init() doesn't
perform error cleanup on the failure. Let the common path own the
cleanup, instead of freeing the KMS from their error paths.

The crash trace for the reference:

  __lock_acquire from lock_acquire (kernel/locking/lockdep.c:5906 kernel/locking/lockdep.c:5863)
  lock_acquire from touch_wq_lockdep_map (kernel/workqueue.c:4094 (discriminator 1))
  touch_wq_lockdep_map from __flush_workqueue (kernel/workqueue.c:4136)
  __flush_workqueue from msm_drm_kms_uninit (drivers/gpu/drm/msm/msm_kms.c:243 (discriminator 33))
  msm_drm_kms_uninit from msm_drm_uninit (drivers/gpu/drm/msm/msm_drv.c:93)
  msm_drm_uninit from msm_drm_init (drivers/gpu/drm/msm/msm_drv.c:184)
  msm_drm_init from try_to_bring_up_aggregate_device (drivers/base/component.c:249 drivers/base/component.c:227)
  try_to_bring_up_aggregate_device from __component_add (drivers/base/component.c:269 drivers/base/component.c:748)
  __component_add from dsi_host_attach (drivers/gpu/drm/msm/dsi/dsi_host.c:1739)
  dsi_host_attach from mipi_dsi_attach (drivers/gpu/drm/drm_mipi_dsi.c:383)
  mipi_dsi_attach from sharp_nt_panel_probe (drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c:247)

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 22 ++++++++--------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 2 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 7726edb0d4ed..6ae49f94fea7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -398,7 +398,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
-		goto fail;
+		return ret;
 	}
 
 	kms = priv->kms;
@@ -409,7 +409,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			goto fail;
+			return ret;
 		}
 	}
 
@@ -421,7 +421,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		goto fail;
+		return ret;
 	}
 
 	mdp4_kms->rev = minor;
@@ -430,7 +430,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			goto fail;
+			return ret;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -452,7 +452,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		goto fail;
+		return ret;
 	}
 
 	kms->vm = vm;
@@ -460,7 +460,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT);
@@ -468,14 +468,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		goto fail;
+		return ret;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -484,12 +484,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_height = 2048;
 
 	return 0;
-
-fail:
-	if (kms)
-		mdp4_destroy(kms);
-
-	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0a004ab9fc85..3934cd060b27 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -517,7 +517,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		goto fail;
+		return ret;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -540,7 +540,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		goto fail;
+		return ret;
 	}
 
 	kms->vm = vm;
@@ -550,7 +550,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		goto fail;
+		return ret;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -562,11 +562,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->vblank_disable_immediate = true;
 
 	return 0;
-fail:
-	if (kms)
-		mdp5_kms_destroy(kms);
-
-	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260723-msm-fix-crash-8c13220d9465

Best regards,
--  
With best wishes
Dmitry

