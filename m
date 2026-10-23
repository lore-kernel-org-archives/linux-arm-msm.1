Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797625;
	b=BEzcHtD9M6xpKJC1ws1QRNqNtWps7GIVM+jFyjD9BJhwRFKaVzqn0Ym5CvrH0vlwefag
	 oVI3VYFercyuZ4BB+M0VGPtWjEZIQnbeiGid637tqc+9P1hItdsZOoCO6A5G/plXk+Dro
	 ub1nqrdG9f+YvO1qI+HUs5oMbvDXsdLLCDyRKwd1SsreGPorOiIrxxK4J8Lco4O3JAUgN
	 ZKkKJbXMHYedNN6AyhT6zcgRMK0n1Ww7Saj6of/ysLAcPT3SeX97bUmKpH1QFpN1jRWt4
	 bZXL8j3oYM9v5IkDkzVDwrI/2tta/oOpMgI5jdmEhZGecETYP5uYRpLKjPJBuuGyJHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
	b=BSp9/ADGqmkaxg6FR0D7rTCs5wUePxzULu2d4FmK3DgRRrkZZIo9yGTT1ZN458Rq0VZ9
	 RzvGybN5D8LJbmrB1+iw3Bd2P4avOtWcQpTsjSi/8v7bzTAI0qiuWNP3Kz1r+nWWCJK8q
	 Y4pYObFIq1ThPQ6peH7KZZYudkYS3W1hFFIsV2jnp6/6YqYWZb7q+spA+UZG7+FymjtXI
	 F3hDvJwxGjZo9tSvVa3Fyj+etVOw3pwo/DNbFJHkaQus5OBmmto25vtn8gMDJIRaxWP1S
	 Y3Pz5eQ3D8B+1zsY9XeuJ2KftDy85hQJzFsytr3cAALObgr7tGr9GsadO4FP8eRFrkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9iO2Sbv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDhY7ZUp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39971606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39971606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9iO2Sbv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDhY7ZUp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuvaL3115343
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=; b=a9iO2SbvV/Fpl0MR
	jAvoH2lR8GzMp2R4EltVuOwVK/TFnV/TiFdy8llNI1CyokZXcJy2hh3lKTwzslNF
	zyiuMMmXyo+TLHil8YXvLPVXBSahytP2Plr9OI66UUCgbESFLIXc8Q3cNfRVGoAx
	FupdamU71ie8Yd67O701QUoxNaTlfd10MIAAo7bIsJlCpg9/mfbcCtr+tAj2tt0a
	7uknFwMz7Oqwtj6OARE8Nxs1rVJjld1nokFbLeZHPWVti6hqFB/IzhagKlh2u94a
	RFg3sfu9QYsqlN8govtdTqS+ebdnMfHPiZqhXcnNW/BqMuEhInfvDUf7rDl9GouI
	t0dT3A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt8uwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961d4b31bso34761896d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797623; x=1793402423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
        b=PDhY7ZUpI6QT4bB7rvjgYhX8N1Ce6DPrUDwHmoAxeXKNpr7+Zv+rDoYkFz3AfQbCyN
         9uGjDSjUKJUg4aiX8YxGnyfsz17aG6Qi0xKonjl8/yC9nyhsBguWwOVV4s3lgvXuB/Me
         OX2px991gOC2KVAOzf40zC3xH7tsYe/VwQ3UYjHPbLrSTrUir40DVyy2L0VRn6fOjUxx
         EudVNSc+HrgGDHu6BnN3vaCrXU85fvo/hlq4j8KAQQTEClmgbH+9DciEDFulFdTmwpIC
         wLFPv1moPgXeb4gEttgV2wDaQhIZOm1PYrlOxsW94Tts9qojWlY0sxTgLVh/KfIrrK35
         BL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797623; x=1793402423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5i3h6tN81K6GqWEezW10xaQvjQAFm09qTmB4BA5ppY=;
        b=SN65/Kk8v5vZvypOLUiru2vHYO4hl2c2QTM8SdES41sHEPcpyHvAhHoxPcit4sCRo/
         ysYvabW7l+amMyVCX2JHA9QCY3QMPfhbigZUVChTY1tydEOvc7A9j/NjS6apHL/Dm0f7
         quogAalu9z+56HDL1WobLPLuvp8uiwUGwckgzv43Jnh8bw3uGTEVzf+kEfkXJJmCi/YI
         zrMjUnDtb38Ocaaz6NSF790utbfJvLHAHBlQauAWYlgYU7/4HgxRbj55gtpFcJ2JFcnK
         t2A9ABaoMVjDp5RZrLyxAwo/5kqDPhFg5VaCbgNMFFxEroOI9XRYvUDh2u34JhCEeTAU
         YB9Q==
X-Gm-Message-State: AFq9FYIPTb660haRGf5uGyO8jaPWbuu4M+PR6mvinPmRomOOqqs48j8o
	J/YSgviP0tEMHJDclDjsvnClFiztEsfa7XYP3dm/0guOs2qa8i0q34QXFN4f6xsotWiJrZhJSmA
	F+v/Ypb5Ucm7+FNIL+IrV+ygfjw3EZ4PpNy9FB/9ofZJZ3jo5Hw9+G3nSl5g636FuT2bH
X-Gm-Gg: AYBFou3r+46JOVH+J9Ji2/3ZV/audftFjNy9cs11hCljjjqbKiqTzKsf1gNgaSptYJ3
	jJ9IKCmg2++TaEtSvYMY+kssTvCyvvShlr52rd3G4q9avePPFT66Py4VEeMmnnJTedcO5qCQh+y
	3JySw8QzVIQ5PSysBfPgOA90Ht831fOa08kDvFT5ApbmrVbD/XHbmzieEToHWu1ovVm1CAAiSH0
	NDnesIwxyAXxZ+TLZ/MQ/ECZi3COepPsazFoNYfIk/qRiqQ1pEFgU69HB4c+eHcqMvLU3NSYoJS
	+sVIlZlyaXw3Ht6kss4Ct6Ho64wQV6xM3z4mV51F6fdLyt2WWYxs7C4HWCp3cWafOSLDuaFPCVR
	LJTQOt9MZ12qLH0LmQG1oMExz5Cqv+T+fMKZNL7lte4LOCIJFHVz2EIKnSPcV/s2Gc+sIg+OJ+a
	ZNQbrKnN/PStr4
X-Received: by 2002:a05:620a:608a:b0:93e:5fbf:a41c with SMTP id af79cd13be357-940ef8bce10mr89611885a.16.1792797623301;
        Fri, 23 Oct 2026 16:20:23 -0700 (PDT)
X-Received: by 2002:a05:620a:608a:b0:93e:5fbf:a41c with SMTP id af79cd13be357-940ef8bce10mr89609285a.16.1792797622802;
        Fri, 23 Oct 2026 16:20:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:41 +0300
Subject: [PATCH v3 08/14] drm/msm/mdp4: unwind a failed mdp4_kms_init()
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-8-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=B/6y71z7QZD5In0hTeKTmGTBI2ihmUVSVBNm9f6oKmM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uUdaM0NnOuVLj898v2QdtaUnwFeVQRpBHcc
 XyBUaFTW+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlAAKCRCLPIo+Aiko
 1evjB/49zUKYkvnvAWGzAg3lxD20MXjvpIkl/ZfrdzJK6dOX64hvE+8udwke14BS2Cln/znh0zl
 Y2yahTL3O6VMyvkrG6wHpJfNGBpgBLLJGX4k8Mi4TvlejJ1WkkjvM2R5DFMrwcRcp8aJBd0i+oG
 YGs7QBtkYmWIC0kNb3j0bpkJmS3FelBvh6X/6tuYuchOAhM2pX/FdFBFNZTItWS6IrM2AsgzQYN
 gt4VH4XuSFBSoztU+x6ThnIgpmYBsX1ZpaYY63FpKXPjl3CQ/ak1ozdCqwhWy88Z/rvRQGDYnwk
 MskUvsmNPkSfvJ/+OeQW0B3Cx0bFi4D7ytVfgM+FE7yJoSVU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX3R7rEMTQD6lw
 BOW+3ia5fI5OI+I5+EWFxGwTzslLQekdjQm4QF61/uWEgHZKT2DcQUSduKyD+3PQds/FDHmFHYA
 jUqrfN3hr5OgLnlbE8faKO3+N9gi9Qo=
X-Proofpoint-ORIG-GUID: pZfFNczZs73lFU3L8K3QMWT_UM0Z_DZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7XN4UwGVb7JE
 YuBO675J0FmvpclKEv3SaSG1HgA4/n6e4FAJwgTt3CW8fhS9e+rfsHGkU1RI3oDIkcm+046BAw8
 kuUhlmF1u/MJAq4ewb3Fl8RxpJZEWraObzjsmFaXRrAk8ZOfmTejIJiuXQaiyEWXfimFJUe8obh
 rFEq9CXnoVO1mMAn5fUdDre5OoO/KOTGhQ3CyeKvea8Yq81FLkgbzjHNswFNGqx6hC1IDEwkHSj
 EhtoqUKDaptmgtIfdCUZFHpBiZSUqd3/tKCM7oKT1nlxphlzqV3FdzbsRem6dwUKllJ46LAi9J7
 yt52dTBIYuEsqYp5XO+Q66inKP95twsHyS3MRGJvaVTkn5IiiAJP/sXXwS4fud5uYFqC/dZStNG
 F+W54MAm0NPkWhtJXuLwZqYTvy8h/FSSTjeBjq4sZovvrhwJQNBYxzSMVUsLcOM76vSCzLAl2jb
 yVbWlN8nKKZXgG1a2YQ==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbebb8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=j6QtfvlM2Oj41uVX788A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: pZfFNczZs73lFU3L8K3QMWT_UM0Z_DZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

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
index c299fef1a400..c2172e5f9e85 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -29,9 +29,8 @@ int msm_count_mdp4(void)
 	return count;
 }
 
-static int mdp4_hw_init(struct msm_kms *kms)
+static void mdp4_hw_init(struct mdp4_kms *mdp4_kms)
 {
-	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
 	struct drm_device *dev = mdp4_kms->dev;
 	u32 dmap_cfg, vg_cfg;
 	unsigned long clk;
@@ -84,8 +83,6 @@ static int mdp4_hw_init(struct msm_kms *kms)
 		mdp4_write(mdp4_kms, REG_MDP4_RESET_STATUS, 1);
 
 	pm_runtime_put_sync(dev->dev);
-
-	return 0;
 }
 
 static void mdp4_enable_commit(struct msm_kms *kms)
@@ -132,6 +129,15 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
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
@@ -141,12 +147,7 @@ static void mdp4_destroy(struct msm_kms *kms)
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
@@ -156,7 +157,6 @@ static void mdp4_destroy(struct msm_kms *kms)
 
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
-		.hw_init         = mdp4_hw_init,
 		.irq_preinstall  = mdp4_irq_preinstall,
 		.irq_postinstall = mdp4_irq_postinstall,
 		.irq_uninstall   = mdp4_irq_uninstall,
@@ -400,7 +400,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(priv->kms));
-	struct msm_kms *kms = NULL;
+	struct msm_kms *kms = priv->kms;
 	struct drm_gpuvm *vm;
 	int ret;
 	u32 major, minor;
@@ -409,21 +409,20 @@ static int mdp4_kms_init(struct drm_device *dev)
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
 
@@ -435,7 +434,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP version: v%d.%d\n",
 			      major, minor);
 		ret = -ENXIO;
-		return ret;
+		goto err_disable_vdd;
 	}
 
 	mdp4_kms->rev = minor;
@@ -444,7 +443,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		if (!mdp4_kms->lut_clk) {
 			DRM_DEV_ERROR(dev->dev, "failed to get lut_clk\n");
 			ret = -ENODEV;
-			return ret;
+			goto err_disable_vdd;
 		}
 		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
@@ -466,7 +465,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	vm = msm_kms_init_vm(mdp4_kms->dev, NULL);
 	if (IS_ERR(vm)) {
 		ret = PTR_ERR(vm);
-		return ret;
+		goto err_disable_rpm;
 	}
 
 	kms->vm = vm;
@@ -474,7 +473,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	ret = modeset_init(mdp4_kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret);
-		return ret;
+		goto err_destroy_vm;
 	}
 
 	mdp4_kms->blank_cursor_bo = msm_gem_new(dev, SZ_16K, MSM_BO_WC | MSM_BO_SCANOUT, NULL);
@@ -482,14 +481,14 @@ static int mdp4_kms_init(struct drm_device *dev)
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
@@ -497,7 +496,23 @@ static int mdp4_kms_init(struct drm_device *dev)
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

