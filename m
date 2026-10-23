Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769526;
	b=VdZABGPgVapsmFNm+EQeRG82nDoH+gOrhPan5L0RcKeWPKUgZpeWU3/EzlPDHitA+jyY
	 YarubmF7tGwVxRs6Pu5gztk09t+LELs0DLaTdVqX1vV7o+jLXyoNC0dS8cVGX7snoXi8Z
	 yabxXm1kgrpdCykTkk0ypbcBQ8TXEsCn2KCrZ2C5ZSR5Z0CdNiHWSA0ddkQBZaF0IRc8c
	 Iw7upv9lQaTrv1OEnBaQWJPhAoFcN4cJ5gCyaclT4qOPzijQ27tX3EnSzgGupGq1s4Mgq
	 p4vWi72aTRkb+7+dE9cdlZ9X7qruaxt1vh1LbbVg750tNaaHXHJ6EghoZx6LLSxd8aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
	b=OPuyS4e/fzKuMLLTGL1ZAYu+tRYLdAb4uEoCCSPb0UOgWBI2SRkNHcZUeGurFyt8PaCw
	 z3QOgPaaPO/azfxK1AQo+QRcpPmrgbixs0M3FXJ9rEfQkOLQZsY2VBGaJOcDGVHnLM1S2
	 kJiuxoOGrYlI1eWVTJwxGVu7001bqK2chv18z5qfaQ84Jb+W3yL5b/6DusOLybU8RLUPr
	 ZFGYeXg0I65gFavmqqC5WTtnFFq7ezWMGbC+yZHLu9Li5JyzRca0zYSrSonpRCvRK3h3L
	 u7Ixk8pQ0psuTxvDCa1MGpwHUYnmvwR2+09FEdTLHqw4KmlkB32QDlXwgvAmWS4tP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1sDswPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTMIO6Qp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626B60A380F
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B626B60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1sDswPR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RTMIO6Qp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6EAf1955234
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=; b=X1sDswPRvWoxklsQ
	sMbFRQXSzQ626ji/o6HmiEmTpXl31Wv2H0UxWZlZd2BpCvFeu0obZ0vzngr+A8MH
	su9ZdjfTsF8uUA/gQAUUTn15Z3s60NoEU0xu3mwRSiLXS1prtknqiaIy7HLGbZKx
	GlWQ3aDJytx5lxX+EQ2EZjJ2aTz2E3ur23d0Iv90crnXLMcDlL4zScGCuvTJ3baR
	6eLQM+1QLkEwYRqkqk4dGQLboHa/FyHWBsAUFYM/U18DRxbVmA6uRnJJcORKFOi9
	wdQwy+ohc/s7YddsGkpGCvzSxqNiMHymZycyW5RCEPTMF4IalpY8AT/OMwsY0HPg
	lobn6g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 15:32:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso236163241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769524; x=1793374324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=RTMIO6QpM8rh3ZwFMsxMxNWzAoXlSFHwHf08S4br3tJeqV9IiOuInnt/Zyow5pXTkH
         5YUeFXntQ+jvRg6vja8Ai7t5FKtvQnRVnaeuoYlWejnK4jArOKyD9rnhEGGhLD9seaNx
         ZnPLMN5AsgbDwDzwzxpeVjTN/C/Nc5mIiC8jOTKd/OhZTBj7x9KrFjSNkt7RO5J2JnRv
         eVws/dfBmmUMfTF3Vksy+4NaJkdZetWt1ocQ7NH79NeWov9lJtSaL7dzv7iY2Mronv87
         42Oj3E5UXNh+ZY41E3W/uBF11/AHu2s2sOoglEo7R7GQw1Rn5zCLS/3Cyp4k7Y1LdMgQ
         mTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769524; x=1793374324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=lL+6T1pKPo4elckmTyaSDfXLZJ7QVBwhnt2s1yh1L34up8gNFEQ4iKA7krpo/ieTJH
         b3/D2kQSBYtINF6ddTdpP5naFZMiv3OGp/vq46wBNbzIE/Em88s/v8OLFbxu74QU37Vi
         vniW5BIfCbdjwLB0Xw3aQfQN1kNHonReigVMGR88X6ypJxoWOOD34LFlTTplaVCLABX1
         EeBAe9dQqW0fcwCHoXnrj5ij77UeCo8taMhHFbh3TWCxkY1BAwshOMel6HQX3v2E+gtG
         rRCyFhHsAWPJII1cDBtwo9UFF5Kabn9NigrwOPY8XGUDvfnzRNSUwRZ6tKhoQD8d0wrZ
         cX4A==
X-Gm-Message-State: AFq9FYJqgcGcx2m/KzSas31oz2r7/e+AofnuCpAg8ZZP9i7QtfR1tZYG
	Do/LdBoXJNDNAl6knPHfisknqOxg3fS8oGYhZdEZoah3+g84oWbXJTasYcsAcK2mdjSJ+Aae+mW
	13fN+A/pVM+d7MU3IToMxO8nReN1hEmoRKTvtzIFUbNwoj4VZO0+lnVdc6IYrI0rXGV2XjQiEMI
	fS
X-Gm-Gg: AYBFou27cnqcp/B2F+0kzpRHLSAcZG0xkhf+rlwfm2R/1VALfw641h5D4FQalT//fZY
	HJJxD1MPxYDZFP+qWmYzdxdLtfljnp38aMLiFiIDallRpNQXXp4LvL5024o77FxTxIMWltA4K2C
	GSE+NGRnNuoBVHlGj4cl8wd8v/kweTKKSHxcvq+KX4tZSEG9jkRx0Z+d84zbDl5EDymYc3aX/PQ
	ZzZ0//DhFWZ3WQpx7KIGvAzpXuzeN2g/ICXaWnWoX5WCvFWXGQNT+DDfJaisoIm4O14fY2YSShd
	2p9GenWIws7D4vqnwbGGi9X/dm0M3Wn/PaK4x1s0V2+/i1wsy/X+P9phrF7IvyldvanVm490LcA
	O1wNudZJ4/H58HEDzAOEqkBxPHPDv2tPBgGm9LFwnL2Ha/hf2HFmJQqBmKLy2oNwBD9kiw/o11N
	ZwAYQ4gYGHQsmb
X-Received: by 2002:a05:6102:3f8f:b0:7cc:2cd0:e74f with SMTP id ada2fe7eead31-7ccc331edcdmr1088013137.30.1792769524003;
        Fri, 23 Oct 2026 08:32:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:7cc:2cd0:e74f with SMTP id ada2fe7eead31-7ccc331edcdmr1087972137.30.1792769523376;
        Fri, 23 Oct 2026 08:32:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:32:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:26 +0300
Subject: [PATCH v2 11/14] drm/msm/dpu: clean up the self-refresh helpers on
 teardown
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-11-83727c122de7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7Um4Zh4cOtsynGFkbo/mRPO0qZY+PJocyHznMzNkZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233ZHl4pBqK6GM2pkabWqcafnfptjGyjUp5nt
 wQ7oVrPkn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt92QAKCRCLPIo+Aiko
 1T9uCACEyuDjbPE5Sh7CmbTxW9KCKHATXRdnYKFmXrAh13+g/Sr2SZghghJN/nbNrXcrhOFudX0
 Q5Pg3v7iYALaUcqQMbFdc3pACqHZx3y9F8hl2dzqbSFCncnn3+4p5FeSDmfNzeFhfBUoBceIbA/
 JhDCiTUyQ7i5721hb4tu6RWQrwfloqy4S9dcDuYvHORzqelHWXIojdFWh3mW0lxLXnEaDCs9PAO
 dtaewrdH50LZDPnyNlC0kDbMDijjt57etpNNp9XYbhf1T0CgrkrZcLtX1UMsVIFX0+sNlJjdgZS
 dSL2X4xeSL7nJxW5oQsS2F/t1wH6WLJnFdQhgVUnxQTS20B6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXzChPc+CVoAXt
 L+N+by8r5rnRY99MrXgN/XohN7kxbbYHFy9aCbv7aVt0h3ZNhWMa4j1HX4tw31MdhIRHIspdAVL
 8YeODGQfMIl1jm+uXYJEMjbV1uBIXfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX8Wn+r28YpW73
 iM0FohlOXUEY6+1YsOwCrirmJ3XJITKiH0DQGnAyJ8bzgAzjQicYQfhNigs+0bDHCA5p3xJvpcG
 3KEfq175Nus/RrnjWvjTA82s98GuGhWScf4hjXo0UOkSnV00rjm7b/VkLa1hXrfoqWjT1GzZtgn
 8CAGe6bTybtJHcA6pnd1XxG9nZre6zwbvuYloZ7IdxC80r3hUTyBjqcABKmpwUUuInpvKACrnZ1
 rgme8d7JeVLALhLTTSD26rF59bXUfeJ7t8dMkqAQyLk9nVl5ey9aX6X7o+7AsigVzxkl83S5cJT
 CEogzHwRYzktZ5LYgXTREwIZZFuzKyYRht2EDtm2DP9qOV0cRPCvKfShU1ITHppCNE0DFM4pQo5
 FVt8ucsGFxo6+ai4UIX7uovY2lqFAZoMEA8WIqaoV29iv2glsZc8792603FLCnzrQ1cZJskVnQa
 Bf8Ll6ZTIVv65klRjFg==
X-Proofpoint-ORIG-GUID: hJlDyA4klbTuw7YfAp50tkhwgBmVMwLG
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7df4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=r-hXt3OJkovplFG2WMgA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: hJlDyA4klbTuw7YfAp50tkhwgBmVMwLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

Unbinding the display driver on MSM8996 with DPU oopses about a second
later:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000870
  pc : drm_atomic_commit_alloc+0x10/0x9c
  lr : drm_self_refresh_helper_entry_work+0x5c/0x1dc

dpu_crtc_init() sets up the self-refresh helper for each CRTC, but
nothing ever calls drm_self_refresh_helper_cleanup(). Every modeset
commit, including the one which shuts the display down on unbind, queues
the delayed entry work of the helper, which then runs after the CRTC
and the DRM device have been freed, and its data is leaked.

Clean the helpers up when tearing down the DPU hardware, which cancels
the pending work while the KMS is still intact. Doing it from a managed
action instead would not be enough: the DRM device, and its managed
resources with it, outlives the unbind as long as userspace holds it
open.

Fixes: 1122697810e5 ("drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 65ba8fa697e9..934ba47b2dae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
@@ -885,8 +886,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	return 0;
 }
 
+static void dpu_kms_self_refresh_cleanup(struct dpu_kms *dpu_kms)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dpu_kms->dev)
+		drm_self_refresh_helper_cleanup(crtc);
+}
+
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
+	dpu_kms_self_refresh_cleanup(dpu_kms);
+
 	dpu_kms->hw_intr = NULL;
 
 	/* safe to call these more than once during shutdown */

-- 
2.47.3

