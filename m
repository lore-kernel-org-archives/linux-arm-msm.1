Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA113F44C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656122; cv=none; b=DVJkNT2dvEKD3cqGEmpAgkzPgBA8vJM4IelVlPPCThSMyQVXHZc1sJgJae406AfwcLrSKOhcC00W9A1NpaesEZWt37iBZPSuXYX7O6COTJ3PfmbTGWPzw1ghIg8ukjrmgbbNU1qwoueY/tgusCSC2wLs6TYxhh3ozRCSrIqAGDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656122; c=relaxed/simple;
	bh=2WHp6E6UvESdA7e8Ig6s/rlLlhgWELEP8B79xKxaQpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1XlLaMcnH4VadcdgO+iI5CREkfxXd3EckktR3kg1KXjB2evqnSUqLurhLy08X/hxu5ydRSK+h9eUJuQpC9eiOx08c+sFiO7i4XfD6LrkRk8DX2iMJfj/bSXSSdC/pUbCsnyIZfFdLGMOXJZ+9F501/fIHproz79SuFxyqKvjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QldwBsbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Py3tLnho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QldwBsbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Py3tLnho"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47UbM2775297
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=; b=QldwBsbKXBs2hZlC
	SxtxMDzP67Vm5+9P730PvE2bIQhDjqbYe1kwVSAyg0qK2XoUnC58uHi0p3v6vN8Q
	7h+yF3GTgXLT5DYXgKv/pXXKytbjRXrMivp6+/FwD5aOtcyv7BaG9PVIlx5P7rO2
	6Z0M0tSiNHE0Kb0mmDoNiHYjbA5KJOPfnK0xZJ8wK2OF6ZW0ACUM0/HN+ZaYdn6k
	Z6tRFj2ctz55L+qEnV7NQ4Cjv9HzbVThvlmMZw780lce6VUiDBI0uk95P/Z4WZL7
	RWmSTjfIFdspKQ/IsK4okk6nY5DMJKFIxZZVqsGqHpjpmWcbyYe/FwXWXBjX3x+2
	d3v7jg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw224dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 04:28:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91786abb5abso6347036d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 21:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656119; x=1791260919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=;
        b=Py3tLnhojaBeglPUXdatj6a9iszP0uGp/5qUk1nqcSSPntv+pBnC7tfkA1XV3Rx0AI
         QNhfSoi1bnDSBhMY0CV9YKfn3oz+qRo3O++U6aXYhWe+fUrxDNN120j7fbhniWyUqSnI
         1XeQNYrjAYxuPjCGSzAoRmjnzivFnjAVhv358rNPRWceQDZdFUODpjdNu03GujN94dcZ
         fQ0JNizaODsJmM3V9vBO6q3TvxqyHaYcFUOaFjcwSnDmtl8+q3ICv8fwUIJ07X1qDuft
         zY21GlOZKB8KKfP9o4j+DfdF18jlsdhngS9gcK0cU6SSN1LlpcPMf8aqAvXo+c3dHXzR
         Mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656119; x=1791260919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=;
        b=jYHDghnoaWGiQztRAX/1berpYAhKMQ8FLO/xkhqGoECAXMSrDU9fztcmRW76Y/DrP1
         0/m2v0bJxFrwtPLqEwiczZtS3kHKgd+b7D86Yx0y/M/Jquty5QIiEoFE7zXNHnTpcpmh
         qANdkEYE1tM7DM+ljgm9p1puMW5VYo828A3ofwrQkyrsnDTYzaz1v4CrVTbY0w/kBHUL
         dyoKjah7iWkMgw813n/HnZIMn6uWn8tX7o/t2dtwHT4YjtAWCimS6KAto0WPiHuIzhaz
         ESbbz+d+/3qjwP1VQFWNy/UFgAHLbbs5lcRhBBlLuCE3/2+zXQKNaLVWVm25qPMbmL2N
         X3MA==
X-Gm-Message-State: AFq9FYKba5L2ER3LaHe+CrDA/1+GFwpSs91YS1k3Sa8jsfEJZUu2viEM
	oGI6l8eZ2wjyj7X7YVJovZbE2rzF7bK+VZ4dVJ4d3yuDRwgfcCvsGCTPnZpGhd3U428d1ukifvi
	//Thjx5qHGkoplrWC8E87x1P2HepvswFEC0PKCJg9PkBINIvcuXT/sFTozm7ooiK0Jif5
X-Gm-Gg: AYBFou09zrVqApqAZvuAy/gD8K4il973t7bCQrdAo/6zSSRLAyLdlk0WpURcsMWyg4S
	tYv2KEiu2LLmifwqiAj+OfYUMS0oKRSGHLgahyxDcNRT35gG+/eRz40J6caNqZrLhO5aQNAuvsy
	1vSFz8M2AaAmO9FK7klWArA8sDVi0c//iRqsqREebXXwvtXNG1sh0s2Kxiq3QOxw1IOBhmWiUty
	Ay3vyH+jnOnpbyY9EpNPFtqDz+usv3RoL3x6xwc4C96c2pyscTc+psT+QPdDFHyt1j/mxWQTNUr
	/Sk5dXQgRzi5x++bJzhx/Nr5sQEHmJTC7MC0Ir1CRkMOaoUJzr5pIY33yAHPe2dN6YW6WFOP9Ah
	q3hmvMPaM52LETUha4WWslh39o8nv+CRmFb1LrYbvIFDOPtYtpoEVAYLTf+SEVXI=
X-Received: by 2002:a05:6214:459b:b0:917:8d49:6c7c with SMTP id 6a1803df08f44-9178d496ddamr2990876d6.46.1790656119171;
        Mon, 28 Sep 2026 21:28:39 -0700 (PDT)
X-Received: by 2002:a05:6214:459b:b0:917:8d49:6c7c with SMTP id 6a1803df08f44-9178d496ddamr2990576d6.46.1790656118695;
        Mon, 28 Sep 2026 21:28:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:38 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:52 +0800
Subject: [PATCH v7 28/35] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-28-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=3337;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=2WHp6E6UvESdA7e8Ig6s/rlLlhgWELEP8B79xKxaQpA=;
 b=9kqodMK9gej/xEASxTZeg8YusSLAl+3+lV+PTCAXF6M+K7dTYM/3ZsFb9VLUgeqoNr7eITh/X
 hi6sFSkx/fmAWRJ8AgO62FkJ+gy1rEEvvqCAo6OcEI0ndspLFQYGYjp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb3e78 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4sZfb9nuRpGxnN46JfR66OHFowyQ5ifu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX/qyO1ikabW8c
 ixiuj1XjQCdCVuFM5Qo2Ho/MaaQB9buj+kekimFvAYSr8sWP03g1bBjydq25hQh/frLrQh797pX
 Ufbg2ZfIHiz+vvU0Nz/ShT6MzQeRmUo60PEyc0Moy8pRiV6isL0s5P4N1Tq0vVX7TDNeVShulGR
 CTCG2U2bBJkSbXEeq75VRMnQu8wKhh6gsOvX1HVykWvGjozFlKLktANPCzVGAISIyONF9k1Opx0
 Qz9pDjA3c56bCQnnZTH+jkBydFMdwSPbLfU3I7PH7CiFO5M7IeEfxOU3Jwq79ragoXy192xCKMQ
 BpfMVq4JNYJrpwrY87Sal7FG6vHlXLKSmlPxPlPHzOmD9V47MB+cjvzI2091kLEYuPJ0mg6hq1R
 t9ojbpD2pSEeu8HCpnrFuUduldGzoaukdPkktH5eK/Q8sJqduHyJoEq8zvhvnCQYCARGNozz1Zr
 zHW27qiGKNnwl6CzezQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX2Oh0nK2Xv8h1
 gJsuoe/XyVs+9q/AWwMFFcqgXyCIwnW6hMOo8d1ljhrF11SF96dAOPuXxGpvNrqhRRoFydAwbkL
 TpfWDeQJT28s7XtJfIS0+t/Mw0t1vvE=
X-Proofpoint-GUID: 4sZfb9nuRpGxnN46JfR66OHFowyQ5ifu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290017

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..e70e5088cfe5 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9d67425fecee..6d8a6779b4b3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -211,6 +211,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..33ab30300e16 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0

