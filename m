Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769521;
	b=vQx4tbAs+HYwL7JKz+wN+WY1dJXRz+lxwjKuzPere5bgVLY0xENDXzScVtpg1s+xR+fm
	 /AY08fMixZzdKzKoPgSHFg7GTh3OH16A1LLJOtfIknXyd5RHJzI60WkYjKaOCy7hWFNXv
	 V2+D56bV8Vb2mfoa4FfA89D57pNlv7asC+Lf92gLPWaFp49kAwbV63TNihI/vD5HLqToj
	 yyNj96lvoiIu2NbDRv01F/NUe4JWDqqEJHcCa1iEUmszPFikOtiaTEAGcSupl8+xWreD7
	 D2nHD5IJVgYfg2lso18mozenuKT6RLqez1q9geEwuWx7p7/3not02Z5ewo6XtxXkZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
	b=tS2bR0LoztruLJGtf21ddTuB5UxF9hu6QbKNXMgItrE9xjBr14bDWsiuBWch4Gtkk7qz
	 wv1FkZ2qTAzPIi8e4kQb62n8WzApCyHAekEINqbNuqUhABBkBfd0JNW9pCsqRbaJ9c8sA
	 NGEt6IUbsPFQxs4YhLBGeEmo7XH2gH4BZ+lWsR0OM5mLEqTprFVytKUs8gPB/2tEgVHsu
	 MVxCv7cJcYLQzyuGKBYBrLo5LnEGcDyUfquUkflmgaRg3nPb7xhpgLi1ItzrMBAmL9lgw
	 taztG5JpJR1DdIfRxW5RZpOhUggGiadnMsXGeLKDM0MRFztwD+yyd5GlEGYNsSArUKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vi7sK0WN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeR6mWaU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1D60A2617
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB1D60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vi7sK0WN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FeR6mWaU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6oth2676498
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=; b=Vi7sK0WNtWQdHzsy
	Gets4YpsMR84/FWJuUEyRU/MYOZJxghldPvauQ+WmZIWC5q85FlIJSD3a3iPewcV
	qVY1gahd0vS4HkQXPXyOYLyT+kanyWz4AU5nyfzlKD49HwPaMH8WTSreHBxes85v
	bvMRMv/4k1rwvdsZViZcIDOHq5QJnfiNJltnbMPtkMPQEYwVLdjAIuZWTomcGSJV
	5luLdqVUsQHoYb/zpC7yz6cJ+5i1+C5Jxe33SGvdpeckf+hiJ4/nusDx2fUBWQby
	QH9YcpWagByyQkeViOvvliOoC75ehXZtbju/KfvS4FwZvcUXsa9SSjgy/pfINOPu
	U8d03g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahvrkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c1a2c3b118so899603137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769519; x=1793374319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
        b=FeR6mWaUj0c7ACbBvUUbbpmoLqkdn349vBIOHYGyqsZh/xUamr7BVJEsGuQ2YxRGI4
         qp0/0SoBn9kjyKK0InYxWc6qePG58t4BYjo20omp6KSbGeP4N3FoJTulgMMT8hCvM0Ff
         nofqtFi3DvjAjUS+9DPM6e0svjbqHCCGo9pSUi5QakgrMKTT+UZdREpFkEDbmgzhAeHD
         3u3uaVe4jUC3LSr1V5YNl2trGWWf1hWcuedJ8Ta42tqX92+FDu5TGkiMc3N/i+xV8MJu
         vjB2VQSXM9KaEdhmsb5EaXNW4brYGmuArgfBfx0jjfJEmaL8QoYcGQKhgF3a6yAPYldd
         3uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769519; x=1793374319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZunG5yy6pTO2DbkEtv1VKnSC8oT+62cq2lapmplUqo=;
        b=Xc5aILSdXofHX1HdyFi1qUZNCFGpOUxmNct75cgMv+/vm2UZCKrg2UaBOC1PcjVIuh
         p7/vfPrVhfhojk/GEExIDHXzZbUW3r5OyRhkv1GjeZ4tW1d1akye0vlyxC0ZkoYWY9Ky
         ZcBnG+rNPvi+RtC+WjKHy+w04qKnjNTXtO4jt0QU1hDHO3baThepqrcxAemLxjgprJ1V
         E2C1AP30Rd6KduXSR1tJMI5Lo7QwuOVIne47R0Bmt92/CsW4y/x+SkEylcXU4q0vzfyO
         QX7lLnNjHVHbVehKc9WG8e2s1p5QPnLwjnfhh3hgeASAFJy62PDylV2ysmokVryv2NEl
         lEeg==
X-Gm-Message-State: AFq9FYKeQ8vRww1ks/o5hfQygzw/AJ/nZrqAeLLib8VdDJs5rE6IseEz
	C60dYaB4kFpTflszqew6MUmXG2DwHW9T+I2w6DLJbOvHh+VcIzDeTW8EeyM6faQYt+RRdKtcBNg
	EZ6SL03ehabzKro1osZZLC+VOmIPwKWZWeJIqYESZVp4P5TxNUvPisKZ/FG4ZfX5AssVf
X-Gm-Gg: AYBFou3142zR6zv3k59uPxmwtT0orkGj3DSnNPkJ2k6ml4vY6CBzOCM48kmw+YMJ2TX
	WYZuRKs8Ms1lP7iDSvI8EGWz14iWyvbLkHqxEoHn+0Uqxkh8VUE/mmKYtc/FDpNzoQu/TUlkRcv
	z7tIySQFLnKwvCOGIVyW3jtYbJBnJBGxi8lO/Gk1xT1IgxMiw1tg9aoGw/BKb2bcR7hojA74mEL
	O6I7bJghlvnFFhaGs1bdITcnpsINW24b5EFek+/l+OVdEaYIqF8Ctc+ByeBHUmElGKyC/jgTP+n
	6ib2SMBdjGxMK321BGBGmtYgJowvv+2euyZ6aBXuDsdooOTyFENZceIasQmt5ypSGPwVm4uitx0
	yRHvP1LCRqclTOtX/5r+HvCadQpV9f9fzIYR5I9oW9xq2Lqd9u9vw8orX/x9SuCQe5s/y/G7+/p
	hh+8n3AtSG028l
X-Received: by 2002:a05:6102:570d:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7ccc31aac14mr1052333137.11.1792769519463;
        Fri, 23 Oct 2026 08:31:59 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7ccc31aac14mr1052302137.11.1792769518924;
        Fri, 23 Oct 2026 08:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:23 +0300
Subject: [PATCH v2 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-8-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5971;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pQFgWanoVOPU1SD9eoh1kwmHhNTamyaQG3R5/Cs4y3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233WRwV1Nx7UujDseXGQBGM8nNMWB3vz2nTgE
 4ZCtfQXErWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91gAKCRCLPIo+Aiko
 1QFAB/9iOnE5dtT4rUrAk5VrFsyu38++IvedCVNLH08Ap8cOOOrtfOaz71QP1J32M6kZa8tBl+m
 2YclTWgKFCVTMP4WfliUamp99N+eSBwqvIucwakg5XS7gitbR5z4ESK6NwYTMafdp57JShh90/J
 42iVIjf12UiKK+m2dz+ivg8qYu9JRcrATXu6adxZSw3p3KWyowJ1eQS1ZY2yyreT+6dL5G0mcFg
 gjirvdVOO1/CrOs3T2F3cPLkK3zz4kyCnjJ3b4FJ8uFWUixDJ9crwcI5ATh7d3O1vVLRqcxflJC
 0Pw+DHa/Hmm9AP48J48TS52+i9oMZkp1y3uOkWmLBTHqT+Y3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXwH6lVZjGDFHX
 viQwKJ8c+uid3yMBWtASab9CKuEl624UNw0AT/cCRDt+DrFXaLkvhuKUFr5vQfibWSZIlJPOIui
 jWds08lReAez9k9LTtfuoPYV9R/WFzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzM1EzOrITmD6
 y++c2gEXpdoLfinamcNZ41XkpTPbRB9BuLTfK0oaPZBrU0MHqR9iW/0R+oj8isXYrRD05mIyJJf
 uneHurtbphsthSqRDTP75zTMqbZTZfDNL5jnirzgGi92eybuzG878RHZA8RezWrV6cgPg85oF2x
 H0pFWdy08I5A6zsH5t+AttkcjMn5Eu4TA9FLxqOSg/xnyh7xdtvJaqGACuIwdmK/dfiOGey9Djt
 77Ood84RP1HtaAFJ7YYATOFa7X5K6ckVi739zH8I2T//pDKlvq55X3gP0wQoh7WkGElKoL4ZEiO
 DDHIMzsUJJu9jthI3xI8OqILANV2+I552Vdptg5S/Y92fVoeSzf8ZuaPfHibnqfKdH00rydWra+
 SPj4hh36wrj96B3Fpo6zVhamSW8J6NA2FFgzowgQIB0kXxXfGy3KgbT1cRfN0x7mPVN05HycN0I
 QYFVEaXTGveBsV8qA+A==
X-Proofpoint-GUID: h1RK3n1TmPORrlLe_TDkGuWnLkxxm93Z
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb7df0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: h1RK3n1TmPORrlLe_TDkGuWnLkxxm93Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

mdp4_kms_init() returns straight away when one of its steps fails and
lets the ->destroy() callback, which the caller runs afterwards, clean
up. mdp4_destroy() however dereferences mdp4_kms->dev, which is only set
after mdp_kms_init() has succeeded, so a failure there turns into a NULL
pointer dereference. It also leaves the vdd regulator enabled.

Set mdp4_kms->dev before anything can fail, undo the steps which have
completed, in the reverse order, and tell the caller not to run
->destroy() after a failed init. Fold the hardware setup, which can't
fail, into mdp4_kms_init().

Fixes: 93c125e4ea98 ("drm/msm: don't tear down KMS twice when KMS init fails")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 61 ++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9b1d1982e683..cc6f202aa011 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -15,9 +15,8 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -70,8 +69,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -118,6 +115,15 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
 	}
 }
 
+static void mdp4_destroy_vm(struct msm_kms *kms)
+{
+	struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
+
+	mmu->funcs->detach(mmu);
+	drm_gpuvm_put(kms->vm);
+	kms->vm = NULL;
+}
+
 static void mdp4_destroy(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -127,12 +133,7 @@ static void mdp4_destroy(struct msm_kms *kms)
 		msm_gem_unpin_iova(mdp4_kms->blank_cursor_bo, kms->vm);
 	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
 
-	if (kms->vm) {
-		struct msm_mmu *mmu = to_msm_vm(kms->vm)->mmu;
-
-		mmu->funcs->detach(mmu);
-		drm_gpuvm_put(kms->vm);
-	}
+	mdp4_destroy_vm(kms);
 
 	if (mdp4_kms->rpm_enabled)
 		pm_runtime_disable(dev);
@@ -142,7 +143,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -386,7 +386,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms = priv->kms;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -395,21 +395,20 @@ static int mdp4_kms_init(struct drm_device *dev)
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	max_clk = 266667000;
 
+	kms->init_unwinds = true;
+	mdp4_kms->dev = dev;
+
 	ret = mdp_kms_init(&mdp4_kms->base, &kms_funcs);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "failed to init kms\n");
 		return ret;
 	}
 
-	kms = priv->kms;
-
-	mdp4_kms->dev = dev;
-
 	if (mdp4_kms->vdd) {
 		ret = regulator_enable(mdp4_kms->vdd);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to enable regulator vdd: %d\n", ret);
-			return ret;
+			goto err_kms_destroy;
 		}
 	}
 
@@ -421,7 +420,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -430,7 +429,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -452,7 +451,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -460,7 +459,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -468,14 +467,14 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mdp4_kms->blank_cursor_bo);
 		DRM_DEV_ERROR(dev->dev, "could not allocate blank-cursor bo: %d\n", ret);
 		mdp4_kms->blank_cursor_bo = NULL;
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	ret = msm_gem_get_and_pin_iova(mdp4_kms->blank_cursor_bo, kms->vm,
 			&mdp4_kms->blank_cursor_iova);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "could not pin blank-cursor bo: %d\n", ret);
-		return ret;
+		goto err_put_cursor;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -483,7 +482,23 @@ static int mdp4_kms_init(struct drm_device *dev)
 	dev->mode_config.max_width = 2048;
 	dev->mode_config.max_height = 2048;
 
+	mdp4_hw_init(mdp4_kms);
+
 	return 0;
+
+err_put_cursor:
+	drm_gem_object_put(mdp4_kms->blank_cursor_bo);
+err_destroy_vm:
+	mdp4_destroy_vm(kms);
+err_disable_rpm:
+	pm_runtime_disable(dev->dev);
+err_disable_vdd:
+	if (mdp4_kms->vdd)
+		regulator_disable(mdp4_kms->vdd);
+err_kms_destroy:
+	mdp_kms_destroy(&mdp4_kms->base);
+
+	return ret;
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {

-- 
2.47.3

