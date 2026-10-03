Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362712DB78B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987246; cv=none; b=nJxERT4YOR2znKLK7UCoFPivyRHDNyfi8iOxf5QCS6SbriQwra1WxE8axyu4r2Gp0FOBdpjrd+uf8SfXyrbiTG1jytXOdPqGYT5hT3BjS0OmF55XUJFf0JDi/BL4hv3UbbbUKUQ+Ron5Aj0vt3KAw4APuMMuwAhjCN93AyYTDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987246; c=relaxed/simple;
	bh=IFWL5o3N81bntEjvnmwlorbJQICmB+ZJO+BqKeM8HXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VW4bnnJ5NwJjgmJPC3sZK8J/ol+QiMkDGNI6li0T5po0kKI4/CogHTi5GEqOMySyduBdcnUmiRm70xjyabBeIM9T6uqHgVThsuOWGkoy5/Rt/W6cRDJcU0XkSzJScBeyZtTfloc2qNe93p+RSl83uh7bLDV+KIg+4/y9XN1/mPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVQUptdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWt6uyHb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVQUptdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWt6uyHb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeG1r1504018
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=; b=BVQUptdVQjnSpGR3
	+kUWU5nihTeH6yXI322fiqgxqEwMsf3LrkMVBe3X15uZ++/A+/s3ma8TMgjSTtl+
	OnZ+zAuiYtU2JjuQfKCStkYzrREt6UzPblMQwG6IgaCr0d7FoZ66z5bklZdwj5ba
	CfNwl25hDiu3A/V0dxcyrjfHkj/jSvHcpj/Yq32jl0BWFtfhqjZqmzpvo3D6RM3o
	3LBG/s+g44iYH0nH/y8xZZaQ04vXC80jd7egf7iL2FmJyky1UKh7HpAr1ZnTHGEV
	vmJE7jog2njRuWCDmXgOiZausoVEHriAI+gtm2Su9aqKCt51J0NOwjO+sXurUVMn
	Osne0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rrcrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:27:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so19995485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987243; x=1791592043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=;
        b=DWt6uyHbG25vZ+ne5jZZOxrJxn7zdVb7iRmL6bKQL4X/B65S5+3fHhZ3sSSKWiyQ6O
         canYTQnmh1JwTjABavV3QeXvqG8Iaqoa4aV+wxwLwVYZh8FFCFGzTTHFPNSVstjNe4CZ
         JyGmPw4DoP2eD7Y3mPa8RBcgB7acfKg9yTBzFxmXblfNF8Tqw9H3jGK78mRLWiKJ3loT
         mbE3KeTzOufEIfV7KtJHvUupVC4MJa2Hb3mm5msOHrrcix6DprE/mWY7+q1UubOBtkZ9
         370Q/XC3FFA7J2fEKpghaUJxxCGTAiqdGxsOrY22iKgp9oEYJD8C75wFjE81edgu6yGR
         +VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987243; x=1791592043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ogsS/jQqQGNaZU14R1Zy5X9gpKci6CxSdzR0pKxji9U=;
        b=aoRkS3aGhPSVrzGXt39vvDPhyTZweA/GNq+Wa498tknSW+NFG7gZQ911b9JGA+tVk2
         azYOaiR7tz7FIjnPGLlWn3e1xwa4wza3ExjdN5cx4Mp+jHOMLyuRCNmYImD0mgzM5Fn+
         S27sNuYhLWsrYN/GaI6RRLFqvr7kuGId8vpS7nasTvrt9nl9dZiwDTE7X9MPqzxoDZQk
         0fmNMslL1M9asaZa06Rb9iQX16QuSU9vHY0UBVeoU5ZzZt7ep+QaBfdX/7SAmWFOE92X
         kfaPwGci3vhZDWGEhG/E+us7FD88UfSc4i8jyV/rByfck8Uw9AXp+sjWohXwG7/gV3o1
         eXMA==
X-Gm-Message-State: AFuF++nE3L8JN8b3FVeiVwevwhclgHsZm5u7ijjBFR7488w/z+UgbnzV
	gQoHbHSVjisToCTgTGOYDY4IQoAee+tx2YLUSQV99FW822w4p6thbG1wTYxBG3RCHciXXEDDqSX
	LlqVDwtggX+WcNW17POWfot19lf3Bre7S3izdTM6yRPhI0HOOrfjNzmatu7S0wFEtK0t9
X-Gm-Gg: AYBFou03wzQH57bnL+IIcrWQub3EeNwcVQrcKJ2U89S9nhbz8g2rS+4kMRRSLzzgHy4
	ElM9ngmFcdYTGolIeTVJBbNvGOMynE7jF4IzA9SvCgDmN5wR2XAECc5QGxjTEXB2NNqPrimVhLN
	othIvNSwmivzj3FrCTssSuHOAwBkctKbOtKVW4NlOA688CyUr5sjJ5cPCDCjPHFkausGpygK2TO
	Qg++2jeH1hvp6jPKAdx7wRZzvwveHWowfw/J47msjLAyTrhAT2r+30LmOFokAK924/L9tW5+nu8
	MLsWIcwjhfmDkivZjjT6cJXvEYzi4BQLH6xmlezYnengvU3Fgk2XXZuqJgHyZW2eKn7J///B1KZ
	5fpwm8TSMB7Rvxf548RxyzroHsio/PDibzVBhxJDB1N0jRt1Addq7VtHj4XUILyrVI4qMLKN7r5
	dcd75hC0PpGcxL
X-Received: by 2002:a05:620a:8905:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93e50ff4d21mr192194485a.25.1790987243379;
        Fri, 02 Oct 2026 17:27:23 -0700 (PDT)
X-Received: by 2002:a05:620a:8905:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93e50ff4d21mr192191085a.25.1790987242879;
        Fri, 02 Oct 2026 17:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:13 +0300
Subject: [PATCH 05/11] drm/msm/mdp5: unwind a failed mdp5_kms_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-5-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4294;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IFWL5o3N81bntEjvnmwlorbJQICmB+ZJO+BqKeM8HXE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvgaymGG3Y9A8ghiW2JNHulGYyoIHagrR+OF
 sq+UkPHsN2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL4AAKCRCLPIo+Aiko
 1U6wB/49mib2gRdKTNw8FYBBcTErHEA21B68qChnh22n3nTSotEFsaD00sQDaEQ4lj7Ua8lNB61
 QKsaX1eZxLjHolz+2xylPjO90iq9/j1RqypyxOxGtya2duz3CYZ8sF6XfucOwKKnXcJ8azX0Uib
 3sBv+RvTnUkayX3Y+0OXt+r1BuiK9hPEDIP3RN+PAILIUfO227bQDLnx9AN0j5zhZO8dGXyjDF0
 r2lau3v7+l9ItKAf+Y8PjKOjt9yvy7kpFLG7sFANGhxyZtZaN+rM8ikUYUg/pqxy+fQbcr3OE1X
 naUZUd/5+G5/XhDcmS6wrgOja/79nR7AbSGhrJWzomMj5SR2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac04bec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: gl2y2H6SsBmxOQAeM7GSkxA8JuRK7F1q
X-Proofpoint-GUID: gl2y2H6SsBmxOQAeM7GSkxA8JuRK7F1q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXySZeAUtNCZwM
 CerB0kNCN6IrbNYiECmHIVW/jhQe8Zje9VqEoJJDhzKzs4z2PS3PPURAoPT9sWAjpGtjcC2uWUT
 0mPUBkN2BtXMFBjKvkixLgO/IfA8lvM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXziaepKDFezMb
 3I8KpQ4l1G9+WoFDDtwNGV3GwPcI01W/BKBQogHtFkOawxyHoNBIpLkiW7dECsEYFKCarTa+cn5
 A1037exv2jypCBs/GZJANIolVH16VVfpu4xPZNuDKMEFZcurjxcQMyZsXH02plnXYEcn3EbVtjw
 5EUJgbqRILsu2muh+RrVxZ76Frd1+fXzYy++6fEk7C12539BO6Vb+id+OzhiO91iIPy6Ni5IBrF
 W1HDN5aGnjW9AHoWOpNJYopBYAKDIVx4uL2AD6NGJONIZ0E/AJrQwNBi6PwGo0KhVeKsNqP19P6
 CFuuQlC6WcYyxHJWOvcnLbXhhH3+0s7Qw+mI0+5ZCcONtZYyIodAGDh9rezMpSdxcgjRPemob5L
 r+NPuVFVuGlrINPGdbfWa34ZeniW4epVLslraIx+Qdb/cm/RfXoe6IsDQFRLcqmIt6TnbVIkhTd
 8Idc3ihxfAufF+ViL4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030001

mdp5_kms_init() returns straight away when one of its later steps fails,
leaving behind the kms, the runtime PM reference taken around the address
space setup and the address space itself, and lets the ->destroy()
callback, which the caller runs afterwards, clean up. When mdp5_init()
fails, however, it has already run mdp5_destroy() itself, and ->destroy()
runs it a second time: the global state object is finalised twice.

Undo the steps which have completed, in the reverse order, drop the
runtime PM reference on the error path as well, and tell the caller not
to run ->destroy() after a failed init. Fold the hardware setup, which
can't fail, into mdp5_kms_init().

Fixes: 8d58ef346f30 ("drm/msm/mdp5: Add global state as a private atomic object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 44 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3934cd060b27..8fc8cdcf7d8c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -19,9 +19,8 @@
 #include "msm_mmu.h"
 #include "mdp5_kms.h"
 
-static int mdp5_hw_init(struct msm_kms *kms)
+static void mdp5_hw_init(struct mdp5_kms *mdp5_kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	struct device *dev = &mdp5_kms->pdev->dev;
 	unsigned long flags;
 
@@ -58,8 +57,6 @@ static int mdp5_hw_init(struct msm_kms *kms)
 	mdp5_ctlm_hw_reset(mdp5_kms->ctlm);
 
 	pm_runtime_put_sync(dev);
-
-	return 0;
 }
 
 /* Global/shared object state funcs */
@@ -198,24 +195,25 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
-static void mdp5_kms_destroy(struct msm_kms *kms)
+static void mdp5_kms_destroy_vm(struct msm_kms *kms)
 {
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+}
 
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+static void mdp5_kms_destroy(struct msm_kms *kms)
+{
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 
+	mdp5_kms_destroy_vm(kms);
 	mdp_kms_destroy(&mdp5_kms->base);
 	mdp5_destroy(mdp5_kms);
 }
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp5_hw_init,
 		.irq_preinstall  = mdp5_irq_preinstall,
 		.irq_postinstall = mdp5_irq_postinstall,
 		.irq_uninstall   = mdp5_irq_uninstall,
@@ -506,6 +504,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +517,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +538,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	mdelay(16);
 
 	vm = msm_kms_init_vm(mdp5_kms->dev, pdev->dev.parent);
+	pm_runtime_put_sync(&pdev->dev);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_kms_destroy;
 	}
 
 	kms->vm = vm;
 
-	pm_runtime_put_sync(&pdev->dev);
-
 	ret = modeset_init(mdp5_kms);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -561,7 +560,18 @@ static int mdp5_kms_init(struct drm_device *dev)
 	dev->max_vblank_count = 0; /* max_vblank_count is set on each CRTC */
 	dev->vblank_disable_immediate = true;
 
+	mdp5_hw_init(mdp5_kms);
+
 	return 0;
+
+err_destroy_vm:
+	mdp5_kms_destroy_vm(kms);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp5_kms->base);
+err_mdp5_destroy:
+	mdp5_destroy(mdp5_kms);
+
+	return ret;
 }
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)

-- 
2.47.3

