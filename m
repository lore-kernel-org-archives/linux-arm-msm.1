Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA2942AFA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234170; cv=none; b=l1vV0sh7btA/c/3D+JRjC3aD3K1WzM9BGu5FJ/vLPVqar9s8fUMt0H219JSS+XGj3Mlk9qpVHlXOjTgzekyOynX1Cb/qnLdGj8Av1tlaLFYG1ok0fbcmzPU05raAIsusyamm7sy3g9GqEZjVY/K4IZNcw38ZHNlon8U+qAL17vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234170; c=relaxed/simple;
	bh=nh2+kNLn2Vl0YimiFzcscodcZxyMDV+yOeRvY1eg5ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJ4/VoZrNUTtXzgnJd/yAM7kFz6Zemz7PvHrdfmKrTv8QO9fMbS1p34VrlqMaSpNWYB34OLW3k8AX1ERJFVimtqMfUwi4cPwO07teNDcuSl2doGGXfKODIymrj2JOryHANYJVMcvD0yto9iROqVHon8U54VgoSTJ01EWg3qorcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6DVw3Vy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQWHHu68; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6DVw3Vy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQWHHu68"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82KNr3295358
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z788nYiu2HLdFhRfZEP+hSwajDMxayhxM5i9UjJG2QM=; b=h6DVw3Vyp6PF6c9P
	npKWxg4heoyO9CifxkQgx+YwOA0NznY/BdD2yYb7g3wlPbnT0wNBXtkDFU/ox59P
	g49dIlteIxqMPzcoH0SrgXjx1IOjGFxpGWo/JdHg9sLem4ukgd+KCS87jqYqXJyp
	N2pjqe2SfmsCtCGsH8cfyCqk9q/F+qXtAVQ9asz9LIYOFfSbvU/YFWieYg+JjxZP
	LTpbYKTwPvkZrO/MQt8AkLmWlV/Wsyt9RM2cQSyvqTxD+26H2fnBxJ8OlfD2ur+3
	PkO+gSNqtXJSEaV9yVqp0ZFdxs2x7gGzf8TqCTrIiaI/HjlJpfbSRyScA9ePsWBR
	ODkHdw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp5ks3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:22:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ea75996387so87953906d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785234167; x=1785838967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z788nYiu2HLdFhRfZEP+hSwajDMxayhxM5i9UjJG2QM=;
        b=BQWHHu68xil5aQcq201CKHkg0XgHWt7i8I6VdMOX895jkbFp6z3vuxM5Gcbh7kBqlV
         iaq9F4EtY/DSI9kmcnJaIbMK0LgTkiXgs8uD5JuFsJ//a7z5lsIEFF3SZwiudOgpYisK
         27QVCkpASJjgsAeH5ve49DZuTdKCRUna0+ahx/GaucjTQlt+UPESSNZwbAAa9SNk5PqF
         fP59Ory4MDK4SEjW8Eu0n8h5Ra/pcac9LxRlfWZeWktHbYcC1it/Ex/puSfIHjmRhwf8
         HjfJp+hjA/frUthYLu0AVqVMMU1BnU3jaBxtcbL8DOoJS2ughxDrXmgag1NcrwSlzbPD
         rp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785234167; x=1785838967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z788nYiu2HLdFhRfZEP+hSwajDMxayhxM5i9UjJG2QM=;
        b=oWboT5YWkNoyxgd0HyV6xEnYHRcec8v1KaGCJssLl6x+cbjrqp48godiKhUcsWyX5b
         mvYaZVOCsAk6jEGxJpxHDC1uDbhrxaw5ELoh7o7TDEetyq+RNhPBS669TqIH76PWZ/DH
         DDLHr4IAZadCPFlta1dwO2RoZ8ARaCSQ3fkUSZZ3VOW0yPb2SJ0kk87zqjf2RDLNDLSp
         CGvFKyJho+CBCP7SQWd6VnU8jX9nVXPU4StzXaTDiYOd4vtcBHEasDqAYAabryft11en
         W7/IcMqo2DvMlKKj3Qls6hMFV/+L62KY1uyymupTNV3LvhPBpTHkpWStvg17D8++he7a
         KOBQ==
X-Gm-Message-State: AOJu0YxvYcqg1XP0+eS+YydNgSGPmOZUwJPWfdZ8bK45ZYhrkVb/eMYl
	ymA7wHto6mtrVUGZGC/R7cfXx6KB7hcS2a19OGvR9tEiWZ/aNkdHaCqFj/8zCFGxKQBN1OX1ZhG
	3HOkDqZ3EdoO3RgjmpY2vhxzYR2xj0OcYOVYLT3xODjMswhHaSJ+CgEIXZ0fdGaUS80hx
X-Gm-Gg: AR+sD10BTpOsbNIRU/pbLPw+JndokVs9HnhrvDxMxaEbCK46XvZD9znr0NV/sGtrSRr
	grjNIz5uEfM88fi0IQUHZeU4egUZ9xefSDV8Kn8sjhi9rdErK2DpP/bvkVmhzcl1inHT3DkSISK
	XOlYwgjfLPE5PyCwqxQzjYX+3qQa2e+mme8/ZzpCTiHOXPx25nBeJbO5S89H5q5UlzrL0/8luUq
	Kj0uZ8l1kNZiibtmZ81waRPSE7/7J7AdSYgSdJsVWUOWsbleDJ6RifKTUN/0vk/S5gVUup07sxD
	FR/T7YlQ2o9jWem6yfeDji33A6LJHsP/Fkwzsfbvf3rcezgDucGeF1SfOBeubjWio4Abaf1kIsM
	zp+6RkLuvm92ORMM4XJuSBoXei9m9KppB33ambajp77ZQtFWPg4JyjQsnwSsW9JI=
X-Received: by 2002:a05:6214:4984:b0:8ef:cb5b:6de3 with SMTP id 6a1803df08f44-9081700485fmr15792636d6.29.1785234167444;
        Tue, 28 Jul 2026 03:22:47 -0700 (PDT)
X-Received: by 2002:a05:6214:4984:b0:8ef:cb5b:6de3 with SMTP id 6a1803df08f44-9081700485fmr15792436d6.29.1785234167075;
        Tue, 28 Jul 2026 03:22:47 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e869ba73sm84791396d6.25.2026.07.28.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:22:46 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:21:43 +0800
Subject: [PATCH v9 14/14] drm/msm/dp: pass panel to display enable/disable
 helpers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-dp_mstclean-v9-14-f7779fce10f4@oss.qualcomm.com>
References: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
In-Reply-To: <20260728-dp_mstclean-v9-0-f7779fce10f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785234095; l=3579;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=nh2+kNLn2Vl0YimiFzcscodcZxyMDV+yOeRvY1eg5ZY=;
 b=vkly1nbRCoVTFo4zj2O+gkpXzL7xe0O9DRyIM62cqVFCAUX0K1SiGsvBKcmg29YHxr2AWv3zZ
 Wk3RcmvzuKjA8IS3Preg07HA4Hde3X6SQU6E9kupvNTk16K90WVsPM5
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX4p4kci2SDn4N
 649GKOh0Bv2UIcHtyIPVG37rnDeROShP0FfpOEngPq0ZEtFv4FlTYvhJKLrhzxUVHp467pQYgDa
 TgPnDbDS2zoQa3qvZT3WhZw2kbCtRaY=
X-Authority-Analysis: v=2.4 cv=XuDK/1F9 c=1 sm=1 tr=0 ts=6a6882f8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7Bdkmk_NF71dONvui9QA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5MSBTYWx0ZWRfX37cXPaV0lwXY
 /6O7mVeJ9oWN+12BmIg9e2gGlxEE0rIomCVmELV0VpgUSEcxik7t5dJ4Y53BTtu2jA4zlOFOjV7
 pUIbnRIzrLotwXjW7BN7n8cZQpPx+6Sa9Alsc8kUN8GEiQRH4tzGrCnXE9LBYlmlKVnmQ1es34q
 JxMwrTpBTYL4kcOvjYIQAAHSecwM71VY4gKBCnzZpB9hpxfsRuCa8ysfXviQzOJYkdt4Edg7EZr
 oN8zfxlV4OVIfyjYqlVFluIpJajOiZPZJavdSFsPE5JVmT+WEvwmVGiicyT9aQxMoVyfOqs8xIB
 OAAq8tD/DTrIPl60c37lwY8RwOjmhG4sLNCL8VUdndDALctxUfDUB8qMkOoQOqgIS0ff2Fx4g5K
 kn/P5feflYYkyra2ybP+ZxZm1dcNANq8qMuSeJ9vet0tLlPlxVgkLGGudAAuASODK1LkrohqLnD
 iWJDwyLMo0gjZ8wCjLg==
X-Proofpoint-ORIG-GUID: uZX-iC4o9yzXXZVQ7ldSNr04J0OATfcE
X-Proofpoint-GUID: uZX-iC4o9yzXXZVQ7ldSNr04J0OATfcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280091

Pass struct msm_dp_panel to the display enable/disable helpers to make
them easier to reuse for MST stream handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 88ca263010c6..8a2366e28eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -652,7 +652,8 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -663,7 +664,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -709,22 +710,23 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_panel_disable_vsc_sdp(dp->panel);
+	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
 
 	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0)
-		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
 
-	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	msm_dp_ctrl_off_link(dp->ctrl, msm_dp_panel);
 
 	if (dp->link->sink_count == 0)
 		/* re-init the PHY so that we can listen to Dongle disconnect */
@@ -739,7 +741,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 }
 
 /**
- * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_dp_display_mode_valid - callback to determine if specified mode is valid
  * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
@@ -1441,14 +1443,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 		return;
 	}
 
-	rc = msm_dp_display_enable(dp);
+	rc = msm_dp_display_enable(dp, dp->panel);
 	if (rc)
 		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
 	rc = msm_dp_display_post_enable(msm_dp_display);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp);
+		msm_dp_display_disable(dp, dp->panel);
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1483,7 +1485,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
 
 	msm_dp_display_unprepare(msm_dp_display);
 }

-- 
2.43.0

