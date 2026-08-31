Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441563E00A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164379; cv=none; b=QtdYaNPw20R4YB7GxnNG7ebRRL03kGGFGishEwcogr6MQDmcxsY+KMqfakOvE59OEfoTBy1cuLLNaPZJaihgbvcCOy39yp+S8ztS1nE6RAyD+mkQVKGoXCoxyjHkAyBqZLHIsRm6AH1IcjEfgzsNQLm5iWsAV/YPWArj28TmdvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164379; c=relaxed/simple;
	bh=xQT+vbjgJJMddsLQ5y+pc+pr1hM+97dd6In2F3g2ICU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNkY6wrHSDZ6LJYYP1HZkCJJOaPtfDYcYbK1l1rO3Iz+pbC8/0l1nKosmX1QjsoTBT++oWUQAujQ4sEYQhgIdIoJ1HRTNtl/7Bcy/xqYxiYJxhTr5WLnWm88zzAgrKFF0ULtXVMIhBcORV8rdvPfJUXEUCjrzcRcdwtH1epEmqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOlq7p6C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdSw3L20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOlq7p6C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdSw3L20"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNX14081787
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPCeXMnw2NJcXbfvM21WwjBfap9NqrHZ9SMjrJ9a+iY=; b=VOlq7p6CIbnqSIyr
	nwtmPuvhElLDK8/42k2G4QdvPTT6+8IUjmCU9ADp94Y/dLOI1gwixc7Gkwfj9ymo
	tcmSgWR/g4CpmTHGRx+RFXxf8geUwxNTGLjq03g+Y0Wz3EpdHpZCG2NHeD8+kxjk
	TKwfSAF0ETJfhfZ9C3mA892FlR1XDww65pd64dE7Qrq3cCr+tzt5op8lOSKSgQ/w
	+aezavW78RgM6/BYM6RyAduIAa2/Rhe1urinnrW26ei73jTBKI4q6tmvBSLQoM7F
	b3786y4DPBEho++SEo9/DeHxB/fXm5taMHQHJchJxQdtKW57DcbAEXAKr0qg5qwr
	aml55w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1nea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:19:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so772716885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164375; x=1788769175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPCeXMnw2NJcXbfvM21WwjBfap9NqrHZ9SMjrJ9a+iY=;
        b=NdSw3L20LUnepeayysmNz0cvZOnVhh5sTmzsxJyxI5StFhDOmB41sYeZium3kIH/Sw
         jL/KMeyPuotT3dIER8hf81CIpEteSB4Xs/s6M4eOQBx8Dd134t4KuSMu+3qGM8POXomW
         G4qOuDmp/OUDwhUSHMjpLOk6ci65y3DMqAhbXQF/qHXJdz4RDcH8SKzds+FPHrDSU9EY
         GBB6YgZngHKQo+HWC/4SvKkaK7xwqZ8wgmZObbHolmNhXYuz+hlKb4KBCB4dG3iHaRWW
         yobtfbspgDtvzWmwVvx+4fyNyA3eWLXeFqF2bKEAjYJ7lphZsCm+gBve+Sv6Spauv76F
         4JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164375; x=1788769175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPCeXMnw2NJcXbfvM21WwjBfap9NqrHZ9SMjrJ9a+iY=;
        b=Rv487kskWvL6gHo1agfr3iOwxvBf4oASJIQGXI87HW4aFGVYrRCE59YisCYlisQ5TR
         f8C3ydBZyv47P9viTURH49DZ+irfUPpI9ZOwYlsiNeu2xKMYAhbhsOmqofMgq0fTabcs
         ZWe8p/ZN8bLMnpD+61EK86UTDDENN8a35ukWsGXG0pRUhmnQWjXw8CezBqA2oCVa8hiw
         cC7J84LNs3Ha1gIs3Jq6gnLna3Gdq4CjvRl6inkn32+pg3Ae/luHJcMkygr1gZQtwUTN
         mRvYDPePI9c/5PHpdU2WRAJosjTaJQq9rXkDz1ErkNFX2l7gTQqNjPBDUlVZ6NxlV1q9
         L5WA==
X-Gm-Message-State: AFuF++k3elmcHVygJEuH++LxEPfntmrxlCuUHS5QIhSG0KHyIavj4oCK
	LMs5Tok3zPsJqErLlhzjlq7y7QBAupXzP/c/LPSZYBY3SvH7EIghHvs58+yuQqMVApttKXyaxOC
	0Eu0Yu4tFnzRD0OuhMETjDNvFUzCG1qT7DiYYA3FnnTcY2SeW08HYIAuxnVTzW7AWtK/C
X-Gm-Gg: AR+sD11dwaziSVjxGkL2NrGdbdmw8QNqDbOlqiik/FPojSrHnw1FlW+GEucsaewPwms
	FApuVmyyRAeSgGNAW3sL951VrnXHrhPAxilEKtHene+KDFw/Ls/cSHWTjfrG2OivfFOdUAD/KyF
	OjYZT95vhMka6LRWybOwF9NOGrInlbBjZr+226YTkzrvFAnN93t6L4h7VwScOQS7xbrNRk4EMBn
	gEaNJ5nhi/9+M3KXaRuZ9vkSxmW1+uR9admdHQo+UEmq9QnvhaqftxT94BYqOuhUSR18ej8Yl7j
	g7WeaOqRmHspBVXQ4PXybjWB0us3m5X6HBgIDYlwY41Dx35er71+dsuSc+sGtiUVUA4LqiRtPGJ
	3ZxDl28AzbF0AgiSe+zHyV9PODpYSzeMiDRw5keFx37szW3IE0UAlDHzPk7SRZ6E=
X-Received: by 2002:a05:620a:45a9:b0:938:fca0:cb54 with SMTP id af79cd13be357-93913996c05mr2427173385a.40.1788164375567;
        Mon, 31 Aug 2026 01:19:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a9:b0:938:fca0:cb54 with SMTP id af79cd13be357-93913996c05mr2427170485a.40.1788164375130;
        Mon, 31 Aug 2026 01:19:35 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:34 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:39 +0800
Subject: [PATCH v6 22/29] drm/msm/dpu: add per-stream MST encoders
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-22-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=5897;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=xQT+vbjgJJMddsLQ5y+pc+pr1hM+97dd6In2F3g2ICU=;
 b=n2lt27MLpS+yw6X0SsgY+ko9lqYC5SswbreVbllOdiGTMXoxP8dNxFQN7MCfY+62DBzAmm9hu
 Yiot1iZMhovBw3zhd8vZANTLnu6/Zybbam7CJA/lzmt7t7yfDbCMq82
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a953918 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aoVTMipVTiCx4Xnk7jUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX6Cb47Y5/b8Fl
 gEm0Qur7svBf4qZ3tlgQnnmHsr9AcvZWbWr7x4kHwWkb06NJ0jrYoRy6J0hlE5Qojuj4bHWF3X2
 PVkj2JR5n4ucjdQfX3K1KIRlk/S9sRvGROo/TauZIzjw0/acgEDthmYuBNs5FHnLW5bF943JOJ+
 hNYq1Lp8I2HZR7UcNlPT+WlsIvdI/UrfVN7rdSesqzpx4oT2VrErZ1iWJAwtg+Le8Es0EUNDlOr
 8CtYNQzDldqTTJ+322gh4Ua1iWBdD/FJKLfadSZH3ybiYD4swu6mff9CFo6JW90Fu9AQVQlZ0Of
 8e+Lcdnz8WIAUxND5u2tSlSXYpUV3mivNr/CeKr2OZBTAbQtvUMMBzf2dctY+2R9C4UwhSFYjnX
 kO+CAB7a9rchYbXY1DdaYMFtTu7kOAqEXs+1hmdB3QkSeHhOxlnk8FyXSSe/fVbXWpLz3RA0rFM
 4/vpPi29opY3WdYTxAA==
X-Proofpoint-ORIG-GUID: h5UWpNgUq_4YS17ubomqCY9w4Lskh0lo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX0yX/vyJwNlFB
 OJGig/QnMWhyo+/fQjAvQrY59ZKnvf3JSGFhW10lWawe9FoB3BIVhByNPf4Fo4LiLn73Ii0pKHH
 IXTa4iYGosEQSmUKO9bpEOxPGXOiUl0=
X-Proofpoint-GUID: h5UWpNgUq_4YS17ubomqCY9w4Lskh0lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

Unlike SST, where a DP controller is represented by a single encoder,
MST requires an encoder instance for each stream.

Create one DRM encoder per MST stream, associate it with a stream ID,
and initialize it with MST-specific encoder helper callbacks.

This establishes the per-stream encoder infrastructure required for DP
MST support.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 15 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c         | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 ++
 drivers/gpu/drm/msm/msm_drv.h               |  9 +++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 004d5fc460a8..533109b4365c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2744,6 +2744,24 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
 };
 
+static void dpu_encoder_mst_atomic_enable(struct drm_encoder *enc,
+				      struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_enable(enc, state);
+}
+
+static void dpu_encoder_mst_atomic_disable(struct drm_encoder *enc,
+				       struct drm_atomic_commit *state)
+{
+	dpu_encoder_virt_atomic_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs dpu_mst_encoder_helper_funcs = {
+	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
+	.atomic_enable   = dpu_encoder_mst_atomic_enable,
+	.atomic_disable  = dpu_encoder_mst_atomic_disable,
+};
+
 static const struct drm_encoder_funcs dpu_encoder_funcs = {
 	.debugfs_init = dpu_encoder_debugfs_init,
 };
@@ -2769,7 +2787,10 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	if (IS_ERR(dpu_enc))
 		return ERR_CAST(dpu_enc);
 
-	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
+	if (drm_enc_mode == DRM_MODE_ENCODER_DPMST)
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_mst_encoder_helper_funcs);
+	else
+		drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
 
 	spin_lock_init(&dpu_enc->enc_spinlock);
 	dpu_enc->enabled = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 66cabac0a726..d6182cec06d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -688,6 +688,21 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				return rc;
 			}
 		}
+
+		for (int stream_id = 0; stream_cnt > 1 && stream_id < stream_cnt; stream_id++) {
+			info.stream_id = stream_id;
+			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+			if (IS_ERR(encoder)) {
+				DPU_ERROR("encoder init failed for dp mst display\n");
+				return PTR_ERR(encoder);
+			}
+
+			rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], stream_id, encoder);
+			if (rc) {
+				DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+				return rc;
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 94a717ba7c82..93536b6936cb 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -145,6 +145,26 @@ static int msm_dp_mst_encoder_stream_id(struct msm_dp_mst *mst,
 	return -1;
 }
 
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+
+	dp_panel = msm_dp_display_get_panel(dp_display, stream_id);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", stream_id);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[stream_id].enc = encoder;
+	mst->mst_encoders[stream_id].stream_id = stream_id;
+	mst->mst_encoders[stream_id].dp_panel = dp_panel;
+
+	return 0;
+}
+
 static struct drm_encoder *
 msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_commit *state)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index e54d49cf3499..89f73b1db2e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -8,5 +8,7 @@
 #include "dp_display.h"
 
 int msm_dp_mst_mgr_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #endif /* _DP_MST_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8e98f7eb8724..6c6a1546478d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -359,6 +359,8 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, unsigned int stream_id,
+			      struct drm_encoder *encoder);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -401,6 +403,13 @@ static inline int msm_dp_mst_register(struct msm_dp *dp_display)
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display,
+					    unsigned int stream_id,
+					    struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4

-- 
2.43.0

