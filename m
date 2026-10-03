Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60C31A5BAE
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985796; cv=none; b=ub/zHxzM5X0YLlImtd8EQfeKFXr2KVFl82yZwfdRkvafOAUebn9XGXdJz0cKJ77/MXYUtcoWjTQLgXsT4BiblvFmI+uXBz4naWJjswd2XNCpvzX+ix2f2NKfApilQUT9pW26eJJSaAvgA5dJYCTNyZgXPTPP+TaHotgrUqJbByQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985796; c=relaxed/simple;
	bh=x2U68697ySuHlAjEIAMBnxsSwSjU9Y4ak2l+lWJyMrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DadeKHg1vEPCzxP29Z1GUiRDhxGQMEx3HiBKlpz85G70DpOypCY+Aybj4Oj9OcLW1Yh9vY39LrYoTkTcsBC/QzyYrdOvP7jOfiGLF4z9KVo6UbAs3Kbm99xameBCOVukyUO3PMi+na2Yz4lk2tT3oKznYUpWTHc6MBCO7HKHGUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4rCdvbc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YG+ga9GM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4rCdvbc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YG+ga9GM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeSGm2309846
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=; b=R4rCdvbc4C7Yb5Iv
	b2bwv1nfYfvAqtDvQexaGnq1EZXe5S+laS6w0OxBYLM4fsdVklgFebKq/0z6oaCi
	xX3V0i/ImOCnFNZPXaVegu1EVa3Vj43S/aj0sZEF1QoqtqdBfl29HpfzzAF9WmbJ
	fVkaMvdwupR+n/eGBd/z6xP7Ub74cBfwu2SRyc6Oc0HMj7To2Roj+794nb4BHAzc
	Dc2eG/21f7JzBVi2cs42rkxOOlEWxZMBfHqerInfboGIYs6piv+8yJjD7zSVPqE2
	EUHHWuJ9kG2miye6rhJO4Aotk0aKtQdH306l8hOHDcJ0QhtDuLfSF31kBlAdBm6Y
	j8RiYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3da0ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:03:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso408830385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985789; x=1791590589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=;
        b=YG+ga9GMl17fnAsMqSS82czYNbVG8r95bY3cRDjWu9HZHLZ5VBLA0Qj8GEvO+nuun+
         ymeYRvlbVktdnzuJ5ZBq0ZlxTOfegQ3Xe8cLSgqRqUpy9kMVnHu2pB7DfPJGpUyWT6hT
         VaDEQOa5/jqvA9vjs0Yd8KwF3iK9GnwIbQy5OW4AuHj4PVVlsJveziGqTX5eeSU0rEz7
         SMYUSA+NI8dxe8scWKDCJG52lKBMcsUhnAGeQSVdC97TFC/tK5mztoE7emnsSKXphCg2
         SA5wuwI7bMAz35q+JgwRAWFhdoJBEROrbfByF/zSsh4TFDmrFGYOseaNrq9MeMa0Dutb
         tVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985789; x=1791590589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44NLFpPE8ZdO6HqDLmJN/0Wy5T0B4W+VTtDVgGOjxNo=;
        b=XfH26D/GXL713/NGLAspxRfuBrpuvgMwodNXwdmznWik7VITzlsKWPA83MSrfZJ+Wu
         CGVzKnxGi6A3q6a3CE/Zb52srrqEIXSbyaHZps5zt41Ob2WAl4d2C3pYQftM9ccF7qL8
         Fa+RRw0Tyc3+/9g4d1qqIW/IGPYv2T3Pcqgx0v0aLXsIkGR9Y92gMFSUdh3T3a34MrXj
         uajHpCBE0WvfewcDNSIjGAv69PPVq4ZCNcNbqPJrHkqTNVktPalIXeuKz4/1UOWbzpCa
         lmixVNhHFD/ZkImylwegpna7K+kfgwamZYqspHt78Zos7WVIEqMQfGooVm4LSox0T+qM
         NJsg==
X-Gm-Message-State: AFuF++kXLBAUPd0vdbxAE/qCb36ZhOYBQRes3ZNKSLAuJ67AwIKSHuV6
	hftoTt4f1u0OypifUUBSr5PzlR+cPRq7IY4wA7Ps9B3oQ03EeHMfLIRWwY6MrMCOq90hdhBT2EZ
	cOpWXsgKEoQzSfC34bug+W0MhPwmvaezq8EKs67vgHkcl+K5xBmp+6fNz36J/BbvUwq1U+9ft7f
	gY
X-Gm-Gg: AYBFou2cuHdQ/DkvMsOCHuHQrVfgl1pzwVnUGhnrnln13FaXL3ZAqSXGyWTDHm5+Tqb
	GyR9Di8enIziqLbJbo/Uouhd1ooxNXjgm3i7MwfKl3yjbbq5hEslIL4CLcyA+kaHTKvmsg+1nrh
	l0KnNSaOyeDXN1cqpBkKJsH3VJ3DmSSSwv51hHhVL7B9A2b+g0Fm4jxnyIMZgLBVVTrKkgFsAsu
	ntHloVQw4wkecp87r4FgyroCrsiKLCAXQETzVRKIjepyyXchZGMvYIJJuuPs0RXKobscFuXpGWr
	8pCtaBVRVZCH3ySyO9OL2EPpE2z/NcqxqlsuQiTe60qv4sqmAFquZSTJxLPwUqy37MIzzQXuBXZ
	XehYGwL5Nwk4qEvJn3IWLLME94dNQRaT3Iy0kzQW9QwdmxK7XfZtr6MHQC/bu+rmrCnyj40SVDw
	rqTdboSUA3uFAe
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1632719785a.34.1790985788837;
        Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7088:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93cb5c4dd5fmr1632714385a.34.1790985788333;
        Fri, 02 Oct 2026 17:03:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:03:02 +0300
Subject: [PATCH 4/5] drm/msm/dpu: enable 3D merge when there are more
 mixers than interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-4-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2U68697ySuHlAjEIAMBnxsSwSjU9Y4ak2l+lWJyMrA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEY0VnOP7gP6vJRj9JrS41FbONPrVB8m4RBsN
 YmBs9IPgTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGNAAKCRCLPIo+Aiko
 1azrB/9+sqJG86unJ4o4I/jwihLrJHUZTelcwVaI2Kn76A6cvnyROTz8lp7SwIhP6Fd0hNsqFWQ
 x3z1lu4veKJRYwEXVin2mVq/LNZuqrTGELwb9X6Vd7ZAW8CpZ6BZwJIRdvH3WVX9odSehTzTrzh
 PqJGQWDiyVvSVULJf3H2YvALOGAr8w4MLdfofKUszR9RPQXGc6qMsK9Tbq2D2RLPcmaxcd/QItp
 rExEOstnNoMxaGtYnBMdMLOTe6/IHZtH70SPKk6ho1c1gafK66dCRE0mPdMowMAbQaTb3yetSR0
 z5bwX6BUHN10INw91MfBQ33QHTEakEMT4bglFtCekYn2OcGT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GInK93P-YFlBCXW9PB31yn9qrqFkVq9f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX41WkbnpFVOvf
 KhEklqrGkOXurBIx81b5EwkDSP8CaCV6clc8y+UsqcTU/wVw6U3XhqnhHrl/rCP4O97AjyJFam/
 jofkYCKlZMPivHhRgBK2CqcwKBpW8Dw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX/xoGEzHro1Tt
 Bl1l80zSe/OFGUYcsWIHtSHY/T2MUxkfejUKxKsm/P132yOV76ztbjR4+E0dmw5eW+fENN0b1Nt
 hds3+S5+8sBxB8zVCr/f3vZuyMEZ0BZcOo95Lpgf+Sza8GjUkH3oCIiUPalgbsK4ObO1axduLhh
 nsi4zgj8ZCyDoLHieZHPbAgh+aXko3pRaaD/01yiflLl3KMZCQr5TskQ+Y11jT2SmO1q9wBbB/G
 AY8O98yXAIFynK7/zA/YUzAg0xUowLo1SYY7EKyDnoThHaO0L0lJM639W4n+OjwBfs456tTCPyB
 5oyXnCSOmSDJ6OlUeQmP3xJgdCE2Yh1o0WWJJw5brDyJEWngOX6K5KuGFtoEs/9F+HwOmIJYM2d
 kplLSaZycnOyRBNw/bu/PuebvbFLk5vsJhcgR7/xEQoBpR/aVouhxhVm5lrMNHIOoEdE1qKGett
 SlY2IqrhCD4T31rkQVw==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6ac0463e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-SFlj5aAlSBlHhkUAg8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GInK93P-YFlBCXW9PB31yn9qrqFkVq9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

dpu_encoder_helper_get_3d_blend_mode() enables the 3D merge only for a
solo physical encoder driven by two mixers. This covers all the current
topologies, but not four mixers driving two interfaces without DSC:
each interface is then fed by a pair of mixers, which has to be merged
too, while the physical encoders have the master and slave roles. The
3D mux would stay disabled and each interface would output the data of
a single mixer.

Enable the 3D merge whenever there are more mixers than interfaces,
unless the DSC merge is used. Nothing changes for the existing
topologies.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 61b22d949454..d24e39597f2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -294,15 +294,16 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_crtc_state *dpu_cstate;
+	unsigned int num_intf;
 
 	if (!phys_enc || phys_enc->enable_state == DPU_ENC_DISABLING)
 		return BLEND_3D_NONE;
 
 	dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);
+	num_intf = phys_enc->split_role == ENC_ROLE_SOLO ? 1 : 2;
 
 	/* Use merge_3d unless DSC MERGE topology is used */
-	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	if (dpu_cstate->num_mixers > num_intf &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 

-- 
2.47.3

