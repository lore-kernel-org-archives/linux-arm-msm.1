Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6CA2E62A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987447; cv=none; b=chFWJF+tXUzvgxYC4kGno6ZNgrFACIJNQTpHbfTmT824x/vNRDsdAGM2XBPlBb/LmjqQl1jXmX8gHWMAE3Og9rxqZBokKprEyJf1DalFqDZFqHloIbyknEiYeOc4hg+6HRqUxJ5xt+nzP13xzoYH9CkMqzgDNJAVoiemljEt0Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987447; c=relaxed/simple;
	bh=qDC/1kRYej0W7VGTHQU6LFLcQkIBjfcgW4nJJgJo66A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IalEQRYd0IAXmVRqgBPCLg4AvnUwrhc1WCKPc808Bd++IzfzcYXuxbXHWz01vQOhVYA095yjmR74JKv6UPpj7bBId+2QbV0Sjj1KevvDR6/v+Ks1SvKtDH+O+qeOvyPaVidVNLuZ3eNhHqkCaEwWN2spSASSrXvc/52B0D+ivC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MTnh8c7H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASMgbpBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MTnh8c7H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASMgbpBV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeLOM3337864
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzjg01sXsoPCXE0wHWdIrN/dgfnVbFdqvxoenT1ojpY=; b=MTnh8c7HFYCdHLef
	4RmKM7b/fKOYx3maTPELlv8MqsZf8xg4otf4S5/YkbeIIB1MmuvBBayY4YMihaUY
	WCv3pPniqbrtQmh+yYUT19ErZe663Kc9buZm/alBTVMExDgqIa2Jo9Bp3DD9Cdg0
	12wz1+iG7Shb0P6nKvswgdleaj8Lf9I6O4OJTm874Bf2jKwqurEhMhNFWbttLpS6
	G7gqrRVJ011YeVZ39JjwdrGt9eOYSUFFnCZrEazWyLAmpVMYO7dejb/AUSitj+7H
	3UL4zgIvvNoHHOkTdWj3R08YzhexOrXLRoJWRA1kqcjM+yFsSFWTzcELQiRU6NVL
	H57euw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj033bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91961d4b31bso572976d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987444; x=1791592244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzjg01sXsoPCXE0wHWdIrN/dgfnVbFdqvxoenT1ojpY=;
        b=ASMgbpBVa+NjU5ndHyjRxfjXPUZW6XuRQv9TDlZcOzscOiCM16WQkghdSJdzsQbZm2
         2T0C2h2AIj9xnd1JugbEIUZUH0yGCcJBV31D1Du6TLdiQ1AWvc16/msFbLA2cm4PP8xy
         M6A2X+9KuR4hmYLpyburAxujsQpTIA3KvHSnR0okpN3YvwcMGL0neQrnrRifOlgpK/sA
         ACNps0TUsNlMmHVT6UgktyQO2iMMkVjYDLrHN6SitgkZ+6o/Vfw7hsqNJu2TO+JrEI9q
         zR9SQF+Tl47+JyeTc0ZBS2/B4e8K7P5X44xsHGYtZ4sfQrNPq+8qvG/nSUzJHY+s86Gq
         yh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987444; x=1791592244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzjg01sXsoPCXE0wHWdIrN/dgfnVbFdqvxoenT1ojpY=;
        b=etL4VZ1oMgxtKVIFAeGfl1SeReR1EhzMZZlqy3OPECWlRC2avhKy9ABgnS36n+Xv+L
         LBfZA3GZcDuukVevESnA/mSYM9NvMAEyLGEpWl5JLVUFL0L8ziJKZDr+2Pw24stlYgV4
         En2v7CYTw7gvDSCJBUwB6JdyGnHZOlDNE9kL1xTvJpsKD3iV4EB/dRsWxMUHEdfT+uDu
         TB/w+9f1V4aDWRGpDdVk76YODgy2tJZ43KY9H7fdtsXNeIN690ZKUSDGyr8KWvUDFG7P
         xqrVCxhjj44vDf47HtKdYr6n0Lk+ROlF6SfNd6fzHGgqE0I2d2UaFmQacWW8KYUV8Y9C
         XD5g==
X-Gm-Message-State: AFuF++lWKp4mZ+DSWwXE3D68tqmxOIZFkAgym+zZRt+XxI6TxCjxm80U
	kaMb7WM3xaRd4YytwLieZe5Exzl58RYFGU3nG0MH2gnmaBFrEuAtFOgvUjpNVspeEW/cez2NV8c
	DA7OCUr0q9YS9h2DKE2SRd2Y1IznmsUXaU99vakfdcDIuPzi01qBBWShFJoewhK4ZULhs
X-Gm-Gg: AYBFou1pRUANk4GG6L2xxN/zc4S6fy/Z1kH99aIaPb30x9XgC+1gTQ6xfVVauw6mS4N
	TeZzfwZel3cszgrsHTXeTIuXrQfE7+esnc9qwoXvjL79uJZPfiAN2t+AS3HlUk7Q4MqtSLD8JTA
	wi28L3eB4FTo99Q41+AZb/0eJc76I2CeROCcfiWd774y0BvFvuzro0JSdwUvcFhT7S44O6035BN
	nGWpOuIBeJWMapldirI7/CY55Vb49+uCTGwCLRyGbmCIq+NRV716lZogLL8cHWPkv4J9k9HxIh+
	KfafSi2Puhyq3T/4G7tNwJq1ohjWmC/cVcjrFH0pIuy0g/Bff947t+zbApe2wyrYhb2zRBhRf8M
	gtOzQUiRLaHLRZy6LpVz9I0ZZ44h/oGVwhqbusZviJhjBGNWV8V0rIFT66Kd6vaEpKaFfC5MnWB
	cpnEevYTYc+KrU
X-Received: by 2002:a05:620a:63c6:b0:93b:d79e:18fc with SMTP id af79cd13be357-93cf19d9c9amr774729185a.63.1790987443794;
        Fri, 02 Oct 2026 17:30:43 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93b:d79e:18fc with SMTP id af79cd13be357-93cf19d9c9amr774724085a.63.1790987443099;
        Fri, 02 Oct 2026 17:30:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:21 +0300
Subject: [PATCH v4 06/10] drm/msm/dpu: clear the CDM block left by a
 previous reservation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-6-2a44d4d8ac77@oss.qualcomm.com>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
In-Reply-To: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qDC/1kRYej0W7VGTHQU6LFLcQkIBjfcgW4nJJgJo66A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyexXbZPcj2WkXmdKFhlNCY+LoLA1/Qrgh5l
 /wRsNz84FSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1TG3CACiUyiWNJ27fRieqtZ5gqVLddU9hRWY04Ge4EcUVyP4o/6epwiUq8efwp/WK0DPgMLb7zd
 8fbIl/Kz/g7zBxFT/s3OsZrX9K85Chyf5TEhyot7V30EEHWTbCP//rzAj4+RrKKA2oy3f0uTGO3
 RGf6eKOUBgBpnq7ReNbjajwh9hSvniPIKhYyS36ff23brrbkGdl3cYpnobahx2buNQsnhHJkgzh
 UMxNC9ztYCQy0csWcuiFg75jLoI6uisjBzUFKFyy9Qg76DJKzWfa862vevfV9OMPZavC9N8MvDr
 afvTdxX5DX+bB1L9LBo8lWWb0R67MMgz7m1dvhJ+XCcBk+u6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX7aJWGW98JbZz
 5aQp9t+SwqGmDMOZna+Bvdnst7Vdfz6XucxCjvusutI7t+E04EsjDjRyHHKJXDFGt7armutd/J8
 THClQ6yWV1Fz3sQkieDbTggMHI2FCH8=
X-Proofpoint-GUID: 6LsVM_0hitcvOnj9QTe8LsigQK8chDHF
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac04cb4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lW-OXhpROnvg2TLzoksA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwkU8JO4H4ZMl
 mNLsf4WA/EaF02Edov0YFMss/eC4SuZ7Vr4ymjPWBLxCaco/UJ5FMkljJ7UhN1kmYDCM/NTsIWp
 EMY2FzCMvk+icbROuFcn1Wa3VkkDRZQTLJ3oHzJ8KknjjcaQqgZBtaaKVLcYtp9KGoM4bU1Fcwl
 JG6hmnOm6OFfqGLrZEpKY+4CWCPzBkBYWndlvTTeDbnpnA8WS+4utu5zd9doA2Tjn13/DGPxC1P
 T5J2FqTO1WfwKIEHUlcE6UfAow8+TdiLMiUy8oT8+CRs7Tn8Q3Ah88thjh3fm94FeU2X7AmrUyu
 51JKM+J3fxptMPw1MDL2EYjdBu9cU1SFi8C0KFmQ+4qxS7ztOjPmeCKjfvjTY5WPcD+1LU/8N0y
 osCjAHiKM0y67EZCwdmCp8VDcI/JrA09q9zvKIpgJcIDWiy4x9pFD5rz4shunS9jqZA/9ZBT8U1
 s/SviwwZbtE1VJ4vAwA==
X-Proofpoint-ORIG-GUID: 6LsVM_0hitcvOnj9QTe8LsigQK8chDHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

dpu_encoder_virt_atomic_mode_set() only updates cur_master->hw_cdm for a
writeback with a job or for DP, so a modeset of a writeback without a job
keeps the CDM of the previous reservation, which the crtc may no longer
own.  dpu_encoder_helper_phys_cleanup() later unbinds that CDM from its
pingpong and flushes it, changing a block which may by then belong to
another display.

Store NULL when no CDM is assigned.

Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f06b52579740..6129b01c35e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1160,6 +1160,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_cdm = NULL;
 	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
@@ -1231,14 +1232,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	dpu_enc->dsc_mask = dsc_mask;
 
 	if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
-	    dpu_enc->disp_info.intf_type == INTF_DP) {
-		struct dpu_hw_blk *hw_cdm = NULL;
-
+	    dpu_enc->disp_info.intf_type == INTF_DP)
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 					      drm_enc->crtc, DPU_HW_BLK_CDM,
 					      &hw_cdm, 1);
-		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
-	}
+
+	dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 
 	/*
 	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not

-- 
2.47.3

