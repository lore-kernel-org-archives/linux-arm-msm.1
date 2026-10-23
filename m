Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797621;
	b=i5viUAEwFnVh7tv99lnWl33jxYyYeOmEIaxjFgXuTGLYubfn3b213vvofcOJ4S23hrnc
	 IVQ4va8hVIRODkubJ7alo9STseFethKHhOwVLxbCtGQzGQBddW98EHxYWkQUJTwAR9k/l
	 kFZvv4NqLaigq0ecVXi+ywFLmgTwOAo5yQC1vNaroY3jYyXBbXUMRn9LXiYMBrvxM3jij
	 MPA303Noij7y9bibnOtVJSZH60kZh3B2pX70fS+1L2YC5HLafg+xG2wWJ81APsVKTawLy
	 XlVZShD7zjOyRxRvIUHCrcylMQAPqQzvwyGQ6zJiWQeS1wuNy0hLjrOvTmHesmPRxeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
	b=XZ32kt4qxrMH0UOCEGU97mrL+6vU4WjBzxvYRcLFhZsRCeAeXJAY3UPGoMBhuPEB2ffu
	 dE9GQGbKbWcm/0pDSpsjadcDKBw+zJ709lE6BgKOk0dEnWUbCWgMKH8UusmPLbPy4mwBn
	 JeCjLWkv+2RRmW2ZtwNji3sAm6COHKHwVGLXokFXr5R8rQpNu/HS17slyYDvFZSbjyn/w
	 eBh+ZS9DwE2LVjPF97DjsaSmywHPWxb9/87rulePGxrU0ogiEePQKN9GeUdSUihmflclh
	 N7Q63YQENj3DYLE1P/9nLTKWN2NjBuh8MHW0hzHVL5/uO9xsPCrKFV3ivFf6ji69kxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGA4Rqmi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Je9xtqnr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BEF606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BEF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AGA4Rqmi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Je9xtqnr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv4Sg3982726
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=; b=AGA4RqmiTNsm1iS4
	bsxrJ+GgMuy6yLb8KIVQwB72T6w3B1VfSJwYcoQ/MWbK2QS61JJ9fj8MMHONSnyU
	AZJhZEHXKQ/Rpgx5g77z7degkURdy5thgW6BeXqnpeghltDlO8pMP9E2oUcrUhHW
	Rj/FuZ1m6exY9mJ6/j1nMXcAg9afdtRM3myTw3CY4hR0/Jrg2PzCoQGtZU3IRjpv
	YuBbXF/5PeDTkLgVzDm1F0eoWDcgTaBO8kZyi4jDeLe7X7Y6z7B1ZVY/r0KmYLHc
	3L29uht+TFJLng0cNcqWO05+njoK8nc71YmiQePEzma7XXyK4VOT3HqCCrr2CoPK
	GD3YZw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1cxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so290603585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797620; x=1793402420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=Je9xtqnr40Xjy06Fbz7fjrYlkMCC73aISjuhvDWOG6nMOBP1Q89yoEcTPad5qCPjav
         TDxKzOd1jJOruF/sLD+b5/s/4oEQbvtkZFltdkd543YGIZwvr/TznyoTBZ73pnNGM2C0
         H292IafTytmGOLjecfjZZl8tXl3UFfrG/mY0PGFHjZINA9/1OYgU7Os2geG91D7rFZrB
         epfyo1mPTja6RTN/1n4LHRuerqceVOulc4xSpPcM/QkOttmM3p5F7JaqZpLAF3UAWpGa
         F+fh/1OotU03NRwMNzUtjQH501K2+AhpRZtgfebnoqhPNN/e1FTNlapGiy092bWdVTT1
         7kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797620; x=1793402420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=k/92zVoEb9uXBgIGMUAUsV59X9uEIwk6XYlyo3kC7m1Ty24xo4Km30qLWlNmCIyv9d
         HBmHbw4xLy0V9uzgQhdjFfnmVUjI5rhFI3lzVO1xrVd/NCxNdX4EB9iJSaBtt3XIS+Qe
         zBoKxFJwlpdbA8uJDSpuzagcgF2OCjTsOLsicTFtwVd0eLQOGg64lfYeOXwJAr4badTl
         z/mY4z/H9Th6amItrKE59AU0hW5UIbVzHj2H8DU7s/mXozcryoo37UP6f4KfxaMtlU5Y
         sjj2kmleMTN1MxH73ke2bIVtP08qkBGb65VlSiNa1kdu3lGEB7MV6osSuT/SsOQT7GnS
         nOpQ==
X-Gm-Message-State: AFq9FYLtW/+G624FQWYY2Cj1PmUJvmpIuqD6PVG6x4z+cPdRmjwkLFCy
	LQPr2JydthetpOUfPxYydqO2aTSAKjYzvp1c3wsVeszzEiKke9u9+xrrdzTxow9Ojr0NDNMIL8R
	f2g0Ge4ToXInFagHs56uDBVuheKGhPZY522olqmRLeLGoVZ2u3eIboWkITe9SPmEVhB2v
X-Gm-Gg: AYBFou1tvF26RW62aYPCpwAOMKMA6hDIC9cxSCldekQoQl+lXPBja6ZfonAsxPqEfzB
	4cAj3eEjNZZX6KaOBSoEglOMhxAnKEyCBfjI8zzxNwXRMez8AMzTJVXkL+/Db/Kj8SYdKUB3KRz
	waynKumLAth1mr4kW77+fjrtkkTSWS1t4qE+pAZM2jdu8luihCrbpd7LfPpteEA9CNCJc+v/+d6
	EIDhan+A9DUajYsWwDZDLlFUiHlzDr50Y/3p+ieaKDIlYwXX1GEOOaaEto3LIbo4/fsJBMnpHn9
	uGhnfvAblSBSi9ZsrzKOXNLJiaklIP790yK6R8Ikvn2XfLiJdZ6pJ1B2PFAnRDeF7Nr0/sArhlk
	cZdWFG6Sgb96/vg4VAUE3TlwK4DSj2gAbqTGH3FuVvNKHHixUbpHRf1pLQFLTzXGxpjBWdNTBDm
	fIJ6OQx5YQJUiA
X-Received: by 2002:a05:620a:4628:b0:93f:2ec5:7e1e with SMTP id af79cd13be357-940ef9322d4mr94121885a.65.1792797619594;
        Fri, 23 Oct 2026 16:20:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4628:b0:93f:2ec5:7e1e with SMTP id af79cd13be357-940ef9322d4mr94117785a.65.1792797619096;
        Fri, 23 Oct 2026 16:20:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:40 +0300
Subject: [PATCH v3 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-msm-kms-destroy-fixes-v3-7-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=opQ+Hay17WlVMklcY1kZq3cMOOsRo3ASKSUfJonVxsQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uTAxaJ9ToYBaS3tBcK/CiOnSJBkEzedlgXm
 N29faEu1XuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrkwAKCRCLPIo+Aiko
 1VmSB/sH0k/jc18bOj8XnRvDZZ0ai/kVj6c9174VdVZi5yuymIMM5HCmTC8/DTNTMRLpGUwDuuu
 mcyoz/fwICXQzneuwi+CGuImyhBg5o4GHzZfKwlrjSR+TUytDZIS8z4NdJ40C/AbWfkelOy/B87
 kQ/Cw1q0FpV6IyrltqyQWZszCwdB4CKV/dvBMVYmKX+pvUdo4Ss56B4kks7LDpQ0czTxhsc+iko
 zERHcFMVntKR/2WEaQiHYpiQjZk2GYYasjmX5Pqq5He0GEL+/sIgr+/CliW7wwMMODn4hmYT0QO
 lG3x2eHBXrmi4/w4PryG873n904ivV9zxT0fiLLga+/fuki3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzeKqS93tFqzq
 A9/lUoA9mvBOpwdFVj1Elu52ycDbTLFTxhoU55yw3j2ef4aKM/vDyCNLobdYIhUYvWl4d9U9xqt
 Pz685FN3y6XeTRc5SuhEro5MjMBVRwEAcQWtNhBGUav6AtVa4kqEGPclR4e1v9GXd3/ySLfjXw5
 FXOwMYoQGbmqnbp425v2cjIP2uxybe6jBHOFD4b8WEOKgiOWJ0xvreeO1SsnZgSzTl+86mKNG3s
 hLz6L3xdFMP74rkJHXJzjKxv8sxsXuLJyZYm0xMIq9RbpNk9KbR1ComS7lqPOlR611xZO15GoK8
 p/f7v8FP2n9Ug7baD6+HMS9jnhYV9DmZfE2ofHZqzLLU3wId2bNnGnkMfHenMi8lyIpSA/5HGqv
 PgW8hx/mGK2dilLUvzqTnVEqPN7XGQlpOoKWkB/lmdyXIzyUckUAr8H9s837qDSHemAnIwp+n5b
 gjjy3DTmfIxBgdaCJLw==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbebb4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX65jzI7fT+WG+
 XNWs/Ht5uZ4NbE/IJ4EEGWgoe8jH/idkQlY7+sUC0pDlrhCbptVjAwNwsv7KUeC1xlCG3ZyFKYH
 Mw+zegTz2Uhri0qRcL4mWxK2NGz0InU=
X-Proofpoint-ORIG-GUID: W6bS-trZOWzfcmLazg4TyHF1Jir1ZNGC
X-Proofpoint-GUID: W6bS-trZOWzfcmLazg4TyHF1Jir1ZNGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 45 ++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 085c23820f46..30af8ef51e4c 100644
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
@@ -198,24 +195,26 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
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
+	kms->vm = NULL;
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
@@ -506,6 +505,8 @@ static int mdp5_kms_init(struct drm_device *dev)
 	struct drm_gpuvm *vm;
 	int i, ret;
 
+	kms->init_unwinds = true;
+
 	ret = mdp5_init(to_platform_device(dev->dev), dev);
 	if (ret)
 		return ret;
@@ -517,7 +518,7 @@ static int mdp5_kms_init(struct drm_device *dev)
 	ret = mdp_kms_init(&mdp5_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(&pdev->dev, "failed to init kms\n");
-		return ret;
+		goto err_mdp5_destroy;
 	}
 
 	config = mdp5_cfg_get_config(mdp5_kms->cfg);
@@ -538,19 +539,18 @@ static int mdp5_kms_init(struct drm_device *dev)
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
@@ -561,7 +561,18 @@ static int mdp5_kms_init(struct drm_device *dev)
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

