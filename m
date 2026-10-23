Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769520;
	b=CNl9x9NTlPh3eZSr+ULkJytmxNiJS60uy5UxsvSU6NXtdIV/jq/eEoJywCpkUT3Ygjcy
	 uXyj1UfYdm2iEkK/iRMH9WrfB5vzHPE5IsVxzyD8wZPFHFjmT3a4Y0H6O7rem6RFlZ5ti
	 UALdcHuqvK4ELztG8u4PEUEXBjc+pMDmtf4FpOetHnZvJN8GZi/iGuk7ubRGRBsZZWXRp
	 1pRhzsWyKp6cDPFIBGGDkG8TnMM57mHAjkudE9dtQtaOuPEKlUT3EQiZpLJvo7kPAOXbQ
	 7vHlBUIw6lYd5V+Qcxl4d7B182T8fIz4JvYA0bagWL+GvxYpCS+wrVu3nV+eon+17Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
	b=Ti5If3xwSd5kUN0xfNpFqNrh1eI2oavbMDGGc6ppW3qj8E53E571hgGj2Tkq4RJL6/G2
	 /gbg044LnRp3n57HSMc4PKoN0v/1f1CTw7BLuouw7BHVdlbrExGTgh3yBaI7jSGy7LIB3
	 GZBa9A1lMF0qMgAk1p0fQ3YFHSGgZ7oKCSJa2GXKRJPF3Cb5FBEBPy42dPddtl6MHDUxl
	 F3fEA5ietMOZPDBI1lABKie+3F2N7lCd557J6zXyl4Ft7m0Ynj08+hVQ80MPKzaGWhrAv
	 nN1MoJZLX0cB9jiVZXRttd+iQBLqQfIarYy3DBfRJKlG/qSYdJ90eNZ8ROUAQ5tW9Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWiNU7XQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="SeE/37ev";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AF6606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AF6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XWiNU7XQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SeE/37ev
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6I1B3557685
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=; b=XWiNU7XQDnB7y/wO
	KLSMw33O9DccCqhyTp1l1enBJDx6Pdj1ty9cFhX2Pklo76XCPN2TIT/WxPydz5bN
	bIXa9HkzDy+uob9QMVv1yZdYhLNS5eyt2Kc0gS5WDyFneqPLQsiQAyGO9ZTKV4nS
	Z6jFmGGWXveI6JRwX9WGjByA9jbzo19ljsxysztw1E9zHh5h0dvgDgAbmGpNF1oH
	93sWA8uvO/NvqDXlyXfUYkbP/yF8BOdXGeoDzJiCiIpIpGh2h17IvlhWLB62onA1
	Dz1TCnVnrUTnvPmaUPi3oHW92ILcIHMc3uR2KStzV/jG9TIh7esjF+vdt5D2HPn3
	M0C/Tg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjcbkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:31:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so186107241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769518; x=1793374318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=SeE/37evhoOkTfn1QwT/ffREp0nY0nFgurjYI35Cr+aTo56QLFoXpfiZb5IR6FV3Ch
         t/c/l9Su5ojPXcIoBsQ0nH0/wkO9bzil3vD63nJAiAVUM0QaaPCNivZ39LJKnSfIlMxC
         D/PLvWjlQgqa8n97G0U7d90LatKRo0UAhkEeLbVRt+Lay2f6wlwioqILmqQTFy1/4Wbz
         Fxh96z4egujb2Da339h1x/YozuBB5qivYkh6WEQRJ/GIebx2xLQakmNcogJTk/1DT/ZR
         X3ZuzvJKghVQdZS7u1ecJVb6AEP9Db2vhkZ3NJUry8v6/2QSzFNXvcIeyBaMlZNvDYDo
         pxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769518; x=1793374318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bouo2TwdZYWtrlod8zFDy+axmmNowG1vvoPhame7Qco=;
        b=Wf9wn6Te+JNTFZy7i56K3wUOC2IqRXhBTv4HrAtsiQNgDL7fHgvcn6X9yx/mbKp5oo
         f3NXDU756Nmdg4B4FYaUBzEjtxdwPPQ3fdpiBiEoY46C2clZYgHJxC1YCFGiHw10fC3j
         LOeyAxyNmAWw79XhsyapaCEL2Ga3xjBW1lwYhqvqoVZSKZRAIm5dgJeT1l28LweNhc0H
         vP3iwXmUiwvhqs+PaJA4xqObmDtflraoG+M5Q2HMYAXGIQfSaIecCw6tLhE+IP7eeAHm
         EG3Ox7nWXrC7C/IYQCJZsRtsw30Czitn4x0Pjj+L20cKyBnihnGWoclaeozlooIGGyjw
         iplQ==
X-Gm-Message-State: AFq9FYJj1xms25HVjTH/zb8TStQlFT1Fg/3RJNErwBTKHXQk4du7sLCc
	nXlhTEaCrCPhkDPX50iDeGn13XHkiG9TJNvJWHifFXpSyAJEMwAktdr/qTZByMPrtFroPopC4wr
	m6x31Bx1e33sQq3kZ2re5etFC+mvI9xr3nYQk0Q11Bguf7ILyGmJGvwtQITwm108cJK7c
X-Gm-Gg: AYBFou30giZOMOVZBokXdCy9Lezyb315ovXiEldxz+wreLL9sofy5bWvL1eHiKrZuup
	lYmWRFWfKb3bV2JIEW6FXn6y48FosM2sV4XN4KE3mt2fmLVOPYSugkR7kbO8u12nr0aXercEYC2
	H4gkpIZ6r3ZgPUY+WNhDD6sGpRth0sSzjJqlzccdXW28/+PY4dgCctFqpIA4Q0XpAdO89mKLzzz
	sTi7YzH4qmQlHyBa0gwk21wn5C1vSXY2J9Oh014TAGzLUJiDKe/rwHktGZyMS/HqAxzlR6ftc/Q
	gAZv7keQmIUTpmbqdXz1e4E6YGhnKGFyaZMu8/HfrGTp2MaR9oxBTy0FmdJ7V6k3dGo9xlOAm9k
	6tCrV33V1TDBy2lW4Veb0l+jcnizV0RI+zwqbNmKIHuKXBC+zRybjY0lFyByl7GtA2lyM7EHgh0
	LfOXGr6haxq9Ye
X-Received: by 2002:a05:6102:2b9c:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7ccc334af2amr900583137.23.1792769517882;
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
X-Received: by 2002:a05:6102:2b9c:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7ccc334af2amr900547137.23.1792769517232;
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:22 +0300
Subject: [PATCH v2 07/14] drm/msm/mdp5: unwind a failed mdp5_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-7-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233VQDsPdiHby8Y8BcS3wc3WMLWc/zB4nE4D7
 TG3L/oCIUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91QAKCRCLPIo+Aiko
 1RsUB/kBw944ZdwyYPTkROO0CRtxWx+DAfMoWeRVvb+lZUAovbL3gKVO7f9Fe86GgFlC0UXLTyj
 MvZ5uUAYQb4zk0JLcAfrHDTOpSajg/WBaE2bYiuS0c7fRp/B7d41n0VQ80ygNB6ZLcHvgQToXdB
 kFTwZXvkRJn5z7JUzetbLpTZqE1GymwVj/HbBrcz+6cE1zncMOHNm2+EB+fviHBWWCu+nImD5k3
 ObSXK7iiAiXJM11OIONbf5eRaWMgPnW0uYNdqMT3H71AFXQPfkTDcOy8iiPd3Kx0DVJzs6b4wCJ
 Ec9jRKMVQBXYU7k1NUk+cfYZacl6cP59CrqitvNDeHLh2/N2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ohDcpCG0pxIKl8ch2_iv4SaLs1TgcYz1
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb7dee cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MU5U8ZpPrSxGNErEH5sA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwjpxDt7jj6zQ
 Gb335PRdzm8Sv/gZ6Sz9bjVdrns+WySXHwvuOg1tSRn3WySAQ9u5YL0624ubZg9V8k6PJg6WOnZ
 kvl0zxNfshN/VLq+kqaGnwZemLy4Z+E=
X-Proofpoint-ORIG-GUID: ohDcpCG0pxIKl8ch2_iv4SaLs1TgcYz1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX1RYIavxrtgJS
 nKAM4iWjl/W3GoWY7zwVOlKLcC79hvr01/pJ40yrjoIpYcu9DbU75nSZFQRdD13F93jwSyqoSYS
 iEZK5rviHz+uhbJynn+4Nql49KIKGLFTSpkIb61PcbaJ5qB74GC9GwoTRGz2FUV6G5du2wtHLaO
 mVfa/0kdIUQ2DsKDBhtr8xGbuX3KZDQSlJRxxl3N47UT1ZbZFZWiKQIPo24HNIkZ4fs7qsy2RTX
 yGKQJe2v7EL27zoLL0rBbSaUEAT1qbz6PuOWohgPy+1XnHx5urBpHhexYzYqigCOMUgN5iDsVpI
 S4EeMUpBS0xFbXSf4tjlzOxIyKRUZ49YPF3a1YPLJ6kXZJ8gKhWY3yeLDe+f+Qh9G05JtZyP0mA
 pK268es+weeiI934psz0AqtnmwKFwcfg0yMUHIv945ctISXpPkCQQhJh6tXf0UzhfWt2jsqYari
 +VuK5UTgCC5MoLJI2Mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

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

