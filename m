Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286546;
	b=DUbnDbFs02uCLLQcPMOzbnOv6SIJC+JK7FGS7M2KLyU1JY6DZMe1vm1DGNcmI3Sd0PuL
	 Sde9sLdY072M6oB0BW5ouX3fZ8kOtXIWis63VKeTP3YWt4E9I51W/hLefDgKPRK1L5npA
	 Mlf3UH3wHvnGQziq7NMZ/6YUuaWXxaULic5nR8ic2Saoa4hMODjQwQkA0nfu5piSX/Q2m
	 f2kzwvY1IuNXXOk4uB0NK8FykNJimGcXMkMGsTBRy8Hekh/EIDi+YYuNqZI1mkEBYwciY
	 CEOmMYYM2pkvLNfQEEO92vUFZdg0DtkMvG//plCeo/KFnx3FiEp5WvXxx1DdOWPwL1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
	b=djFtxeD6GtdqZjTjn4SGF2dyf7++Jue2+TSTP0bn8Hz/UvUbZUFteZlRZp4n2W9AZTkz
	 qHNDXYaD0RcbLGL9CviWRhO5fg4OCClhdMIvBqC6VAGUXXemQSR7+fv8IHrQYDd/sbA0F
	 47Xn2fAthPwaw9WtZkUFo6HjPByfqG//srau0Kd+MJcLJ/KbZNaRCONB4aqdBqxTHtjxV
	 lyjzoF7dyRGgY6wYIKCtsh9v5BOlJ6rG73X/NRd21F61s66qbfVp/2iKNunGEoPaJ3oIN
	 DeL4twFrwTkmpwCbHMgK3emvr5rPFxY6WQko38K0BvUI7Lmh1JfrkXiIr57YDh1x+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzSWdh5x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhWEwtI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E79606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E79606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzSWdh5x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhWEwtI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6iR1957677
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=; b=XzSWdh5x8phoUSbJ
	Q1JndPHV1IvO/YsY8U6xT3UDNpxqoBZgh8xpKb2E6+buJ2MG/xTuKgETbnQWUJTY
	DPw0bV7XEDoXPArIVpEcmJVX4th9F+WjZfw9UHHTrBoz2YnmnkjPL34DRCcxwV2Z
	XT8ioBymRDBhM0/So6IYERrFvkLC4Vm5XhtFikOh61Z7a/CaY7hQMmqlF+2sSaVM
	L4bi9fukZNkJpqQdH8PfnhgqmBshr0fNrXaxM4WIaNuD2xQii2gaxFniqRaTVV8N
	OVWkhsnmoBAPbHNv6TDnHFE+ALtdmGcenr6Ej7KGE5RCJ/Q18Ssbv9czE0RPQWGg
	yIW5og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydknhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:55:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso377394285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286544; x=1794891344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=iwhWEwtIGoGulaaPp7viz9JgHu9irTLDI88dmPGiwLzELZnWfCdAVQrfT0l0eYWje5
         b4O33HwsQ361XOCoFlBBjS7a8tfyWFOLy/oV9Y4gJySFd4MkSJ+uKx+awbBwhz2eFT3Z
         tR1sS9dWTykQ+kxU6jyh3d3JPxxpGqw1mFQyqG4xHd06/3J5jEPs92AIG7N+6/6Ljfc5
         +HZWrLTnqqd0Zun3JW3h9AEO7LCph4vUFtL/6f0nbaWHLbW4lqjZYeQPA7d2KhVRVSiV
         NJLCZLnYiEiQkStb3Z23nNDW6oypxqPDkaOGXfa88SjVQOvAfT+YRaHeeIMAbYIqZKuQ
         v62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286544; x=1794891344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=k/b0I2vINRJgxq/hZdFONpAyDaG0HVrQxoU+RaV9nHHqPFTRnqy5cFBYHsWBLotnJm
         iwNhc8+yxDAfcZPlcchWSo+uZCmaHG4++RRoSCoziuZpUM+HWZEe6x6bSJuM9KgGFPHJ
         W+p+zVJyULmMjF2XSN3B5f59MMUDFUvXD8c1pxbCXIqQFXcnoVr9LNfLxbC37MG9FKX9
         bM71wjs0NKEflWuGxuwrqoL4bCSxAyvEm/ppyDZVSLNSRe4jnFSMvAC8HTFQsf4MkRSy
         ppMbXIUZDYzq1sK0ifRf/NKuWjIcOjnA98Kwz6xAApCAP7ZQ0JpqweLp2QPjED/y9Ybo
         fPhg==
X-Gm-Message-State: APuU4Z/fB3dUGRr6yAVJsqbvQHZ4lpjYKaKUYMbLxK2+P/1wh55DqNRH
	SkFg6qlHIB/T3wkp4CDpIW+G+as7nyOsOdX4+Cozp6/VWEE4fR0g5VqkCYzkTxo1tkxc8N2Hdlx
	M3gTF+rORWvOnd56B8OgyR5YhCBYaSMs7ug8a19ZjyAiwUhUyU4+tVeP1ZWJuitxR3JtA
X-Gm-Gg: AYBFou1uA8gj6gGT5q5K0BF2ruRICy/BH3oV2dKpR0VHyLf9Lc0owGdBY0XxKatygvj
	eUxVPzGjsZNlpYhIwj0s60/ev1LIHwd2KBICi8HmO2jaiiK0Bul2zpl6Y6Gt3iAQyEnjp9K5+1T
	sUz99DxzxRNEgfAq1HRfA6Nkr8yHAuKAKJok8wUshpE7Q3LHxr2aYWGQRH8fk1hKN2DqiRgF4d5
	M+9DF8srhsZ0WuQvsUjp/BqTzb7m+FG20ZOmxx3gLe+nR7YX7GEpBBTyikpz4hpGieF2PR4yBoH
	Ha1heuox34GPUvozTYqN5R6Oxomu1ZzCkue7bf86Qfvl2GtVTPJg3jRddAQ77Qx24rL9gKIdG4x
	BwD+5VtEoTe9k/gZMOzPlB/xJ9y0PEougMYMQv7+7SykjnP3tpUJHjDFhVXdwMLiwTOG5aBQZ2K
	sAyyV0ikIZd8Ygzq8JDZ4JMf5sh3TD6OV0KaV3
X-Received: by 2002:a05:620a:1d0b:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-9479f1cd114mr240621085a.10.1794286544194;
        Mon, 09 Nov 2026 20:55:44 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-9479f1cd114mr240619285a.10.1794286543702;
        Mon, 09 Nov 2026 20:55:43 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:35 +0800
Subject: [PATCH v8 14/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
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
Message-Id: <20261110-msm-dp-mst-v8-14-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kSG1AwjhdD6UXXB/LAoKM+KcPZ/iXxLYW1hElXuN5Nc=;
 b=1Ahcc+eArGXWKK2CYbauZTCiZtd9bFfI6sItHoIq65yoqCvQ9mfGCoCrQeVFNLgJuKNWpVsCW
 PJy5zw+3G1uB3vk13q6TkD4K+aY3gUEiJW1Dvu9X8fj5+CwTAmVwwwn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX7PdPVjZL0EVQ
 3Pt4RbGEUk2hzx07ulbH+/9BOBRKhn6GCBc68dxk431HiAH5lbZNxTtMcMf0BPSHNaLSs/TTrd/
 tjkNWeV8i18TmRqjcjMH0WdkyFMMFtc=
X-Proofpoint-GUID: TfHC9erS70rbaJfeXciObMmk5RUKVpbB
X-Proofpoint-ORIG-GUID: TfHC9erS70rbaJfeXciObMmk5RUKVpbB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX2w1IWIhN6GY7
 F1/kXB9l1vLermkQ8bKaMTh3bEZ22DZkbTioP2YmM8wBPJIEJj8CXACGefIQP0vbbhCCzx11dqW
 FmFjmHJoVnVoej65lhe8+16dBV1HLy31fhNFbmXpCj8krPKL47zATW6gHOLSuap+R7n8H5Fv1hX
 O8iJy4ejDH3zu4fsX9pwnJRFISuvhBdyu9T7ebkpgtN6TAcqA5QivrTKrSFjUdsBkx0+WLi0QeS
 jW5c7yMgDyYC2ARy198o5TvwFxzG6/3LiLK0Fg6q8v1KcT0Arc5ruCUvS4IbtOigNySdVN3kS+0
 R6M2LJTl9QXTfh9m735o/+CvHH4b351X4LywJKL4el+ZwlRY4QArMCWbO3Pj8EvmYN9vnxH2tz9
 0j0LHRtJdg/5j8UewasdpGtNYLqYMoe6gvWZ02cF4Jq3gGc3p08+kdgpBjDPVkQVvkN55R7N7VL
 eMb4Ckzy7L20Rn6uU4Q==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2a3d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..5e1c98371181 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1435,15 +1435,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2672,8 +2673,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

