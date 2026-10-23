Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797635;
	b=lA86Z4l2ZNdxGV3mbVPz0+2inTG6xcNuTHx+wTBs9pBc6S8lW7hldTQsfBj78TsIkuVT
	 Q5Wn9cVMHr3CglyorJQ+zTYWVNCzN61YcrWx3LrJRCK14JjhsYnPSVvkEX6QQwzJPs7QE
	 G9r4mUxtrlpVcSrZwlTAloZpYQgIvUyMOHle75b1yIKDZMtQuC15NNl9t6yBhbiZpP+G4
	 OqeVT2TDmngj1LruHANF/NAlQa8FpGM8rnlkcLucca5ysJ6Keel80oxGyB1PKlcOWXsIl
	 0lls55mLLaV/H2XG30XJVuAVQfzmCZDMEEGYDcFUnf2xY3OETtbdxKxmCb2q4w+fM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797635;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
	b=Tgf5kRnccGQapK2WcPFv0QI+lPy6H7VInp7AgwOQOdkzohN9EBgd5H3kMg/gkRIFiSbr
	 aU5HEJUOIDPwxR2cpKXV0RNadC9k9a7i9EdOvixKfAO39QzYKASSxRUQOurZCe8ibAXrS
	 6mMZdjCfJJIJ2mn2HxlrGLa9CKPdIGHzpsY1slfEea5dFrzYuIMBt0I1ldBpGM444ZMp9
	 +VOfcrvK2MSNWWXzyJSVUumNWW69NnUNh1Lj52julvzLGoWl7OaGZOjP09RVSjTQHogcX
	 e/ZSYGrXUQSlBobmdogQ1loNwWSACxgF/CNegpBz7zqsQIKli9P5NhO50b885GSEVpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kh4dMs1z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZuPtUGe7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F5606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 834F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kh4dMs1z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZuPtUGe7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv1UH3982646
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=; b=Kh4dMs1zmYjhuW6p
	sSbZp9cQgJM6bbX4p1fLHPrJtQTjxOK8qYHZTdfIYn3LkzeMm7Mcf27XzDzZFb4g
	S70/vhZi9KhJd1rCsOXLeWBWt1VJn3Y2Rlw+DC25MZxceDVuPxC7Z4wsHM19teBU
	mS4vOrMFIc69ixVSRd90T6Lxi/r0DTelYAG7poMgwHpXO6unKxEHJ0JtdhDR0sOp
	GUVpJF5VqEAcFJHrX8hc/142lVo3/3gulZg4cU7VrKoPZPc48F6mN7lj352OlYk1
	zboJrR6YY8sSzbP2TxmluLU4aZelPK2BesQ4fm/4d5SnKFsf8GmDcmBR6jDsIMzi
	E5sdRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart1cys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:20:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so316557585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797633; x=1793402433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=ZuPtUGe7E2pQeIUSXChbaAQpekItU86tFQKyWsygHiUyeDhbTltgugL79FE7347A7D
         m4v8b8YZqXj/b9eRifloNeApSGFOKuTH/AjMm8AMy577CWd4N6uCpVU5pCJG2VnTK1F7
         vE5CVIXevAOf5YVBM36PnBoOsCFbucQFmfxafkPy3EY0TzbtkkDSt7IHDEs0FNe8fQEs
         YP/rd1L0WhXgZJGXJ9vrPqaF4Vu8Odt8LmyH4jEaifsDcNFFgCq/OfYOsJ3MYDxwCMsr
         LQRoEmj398I6bNOk/2q8KdDmo3bdfLVmNtWbyZh9NWgUSaXxhwJtMcno4ATu07dVtdCh
         r2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797633; x=1793402433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHN0xNuoeyIHKTV1AFeaVEsWSbzhZXzn9ubdzSnUtM8=;
        b=im2/lcw31XavrH+uzcGX0aaqRoaS3h3L6RHcV3zPkU+uhhvjdTApPt178b1rFOiO5t
         cwJT8TVMmIkdbLnW/0jaSsIvh5gB1lnwAoO6ju8Q6bE/JD/AbL3FaX1S+t5iChYg60P2
         dRtHJrB6F8GN07XqeuyR9i0l9lhGcQoVWEv+ORQ0V9q6tz9zZevqDQWzMWciVwd42p7S
         6YzgfkpTEO5KqDAtXEGrzHW8oszxKhOYdBVbs87XGylETiECy18fNaLCDQeK5L1m91C8
         oJdcWsE80yQro+m3jTmtJAeWrI4FnX+RM80IF82JzxoEPx6ptsO5HHH7qk4t760NxPAp
         IqSQ==
X-Gm-Message-State: AFq9FYI0mpwG473QLqOxYGCBou5FnQgnm3a6l3xdRhIIDHbBTswvETtX
	7OVXGtKlYRj1GEIN7BgTdUmGhd9X3foqWHyQKrHWS0a9FrntlEMbFPMfzWcvQuLs703b5KHipfi
	V7KBZDO5d0TpqzgzvbhlI6R4eEKSNVmqKGYGq/LDlioWy/Bo+whR85qQCEpikqgQEBTTmAVOGI0
	hI
X-Gm-Gg: AYBFou3qi4vW1msK/svKNiMswdQ/gB9TTQaCPpgVV2hPlLf8zAKj7GM9YCh3Typork2
	xH3h1v9v9f/M9c0+DSAZ/niRHKTxc7pWpclGInbipq5psOcbGXi4rVRSqMwnaDqsp48QbW2XR7Y
	rD8BXeI26MQirYZjx57LQV2wjxt6C0yMDSJY+uv4qJtUDqXScNffkzXTTKfLTEotras38goiRbU
	A4HyvmCVlN8Y2NE2K7Dge9PPbKywYxiP1anMs0UH2kf3cppp9irhro+eDK1juN3BCAGhE4tih7x
	zI1pz6gPAEp/KNSO5Nkhp/cm9+vKN5mdkfsycaYnNq3nmtJmkbHpHhqAPjhQ0DzcymAY3JEJBpg
	isvqo0CK/7Gd1v/+ZNmxKDhy9Ykmbn4rlDMzQulxasRyGfZEtHGEb3R1S3pVbx2+tfFC4g/8TLk
	DuRSr2WtUvbxOt
X-Received: by 2002:a05:620a:400a:b0:93e:66db:69b9 with SMTP id af79cd13be357-940ef9727d2mr83268985a.55.1792797632619;
        Fri, 23 Oct 2026 16:20:32 -0700 (PDT)
X-Received: by 2002:a05:620a:400a:b0:93e:66db:69b9 with SMTP id af79cd13be357-940ef9727d2mr83265585a.55.1792797632128;
        Fri, 23 Oct 2026 16:20:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:44 +0300
Subject: [PATCH v3 11/14] drm/msm/dpu: clean up the self-refresh helpers on
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-11-66a30120a5ea@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7Um4Zh4cOtsynGFkbo/mRPO0qZY+PJocyHznMzNkZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uWjGtrz2xJsjk/AKcyyVz4BvaRFGZntwWMx
 U+SmgJEifSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrlgAKCRCLPIo+Aiko
 1Qv3B/4vDAzTKH4or8FdWIFi2eL4ti0qrqm2sHPiWQRi4gcGYjcD2ig951J40wzGrQk1do1aXwN
 YLMtLK8xUwnwMVCWG3X1aQsi8tKC+6u6PW/rWDXurVIPwauoGxx8c1CUEFnRW+3Hc25Nlm/d6v+
 gAxLcq9k7xSqevWrMHw4OcopSaIjth3oMdCb8/8MxNg1swnXNw8xe8Pt0Vf16P3y9y612cZ0xdh
 IMMe4MYl6C6QnqEjgrr9dDPfz6bVgSOX50jKt8Qd5QIVk0yWwNBDrLCUOr/y7wF6Cc7wcujx29n
 iy4wQlhuCl+6EyxBBexlAPfvZjro4s+56lGeYO9g3vWflppb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX6EyLFSahjFK1
 lubgMeVTAf1caG1qGNiZlsfeN0/puL/9qkKaR72N2x6W+5P+NzgS32NtzwZp1pk7wI6mtTEuqC5
 R7euDcMzgzWhR9FY5cgKHeESGmnWhzeJiDD0GXYgkpA3YHOzqc4emULTAEo8rgZiv3TfffbN70/
 UptJv0YfBmSChyptv8e8gpjWJpZFhEkvMohAkHKT7V0Ja65YhQ+CYiv7dqPE84MA2g43c1+ajMR
 OV2SZA22HFZxjngQ3vipZUCCssgUiYTjxGE2aRZXFYxxi9lRy5ne7YQ0yU27IfefMqcKqssd/2m
 66qDcE5r18Is0WjEwqne9ODQmxe4nYqgCdi7BX+tOqBAGLGqso3RNdj18fdp4gSGJZGgWIWwhtz
 Y8mddn5B8+q3hUI7qwEs9YyOmEhJiNrczIQfiU5SyvouBqJbToWNlFknwnloLRhyhrLXc41QfT3
 skBxoaMm6fQv0226lLQ==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adbebc1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=r-hXt3OJkovplFG2WMgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXxRY2Q0C5xi2J
 MQLLbL6D3Xox669TLvHrwkYl+V2h/CpgWa5l+INLAw5QkNHpB9bYYTSyaL/RZmyMbym1X/rxVF/
 kuKgJy5A8WqfjrfmXz/SxrN81VRJPlM=
X-Proofpoint-ORIG-GUID: F5Pfjdhpuqal3hv1Qd-yo9V4RVGYtT94
X-Proofpoint-GUID: F5Pfjdhpuqal3hv1Qd-yo9V4RVGYtT94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

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

