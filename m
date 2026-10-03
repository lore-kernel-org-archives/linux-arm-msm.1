Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EA65192
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985789; cv=none; b=IiTIXTwE9XDS0TE2lQW2j8QZR2xbCH1qTuBUPqW0cd7czqquBm0/vC6vccis34LDLBB4w6QyAUnTUsKtvr69NK4WRU/LzIuJeAcQZwCCj7MbyJeojjfRkLTglFmJq0CV+khFU23F3X2DJvceOYZniuQgcuE5WyTzMJf7EbvQC/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985789; c=relaxed/simple;
	bh=IRuLvmE0+tzW0ijRMXTcaAZ1rYCTxwdRidPidjqJ/0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LiPABrKRSmcZswF2U+zVrg/RCW6R/ioCFiE8XnaLefSIj3bMOdI8ow0iHztePZeO7CmHbsLpDS8OBSdO7OotufJPIRutNUqZ0O5lDo430txw1YEB4wPKGFQhsz4oU5UVR+zP/teYIgWRs83DvYbpWMgu6S9V3ItRPOtq4spBAGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asQbKqKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVchBZ17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asQbKqKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVchBZ17"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne5gT2928174
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=; b=asQbKqKIh2o/8EDj
	losj1YeP4jpp1AzPC1XXVAvhtttxsbWvJTTxb7vCNwzzCIqvA/Yz2ZFqkUqrMTEc
	9Tx3C1ZfkGS3O25dQWovIEdooc64/0FqW5IyATVTpdtGeXnaPhrdFjwWXZsPa8EF
	xvJpJcMDNn1JzLdBPjJzeH34/MmO6EY1sNp6/n79CCDCxSoK9/Wl5w892op9yu5A
	NLQ7fvODvevJD4cQCWWEjyhORJddj5YnXf//sz2r+fGwBv9INzXUOzFwAjNtds8f
	WNogmy654UNjrfzu76dPd/N1g8gapksaCtz6d1fKR5vnCRHShcZv5OeYImQXjsGo
	rDI7xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfvsys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:03:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so25364085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985784; x=1791590584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=;
        b=KVchBZ17d5m/SzYReQFs4Dt50p9BvAHmld5kWXZaH8FLOqynu5dSYgbMr31MIe/RdB
         x6uYEmnHQ/gB8OFOg9aUE3qWIa2uXQYkdcmPAXjs8dPW8EyJpjvpALncI7MyUnYmG46b
         t3zssiZbTL+DnUAVfeuaYPcbwXYE3a4aVI4RYR14wGVGuWHvxz0NlZraOUGwR3T26W93
         qTFXu3uwLo2FMF1TFzGo02rhW1U6Jnr5ajLho6uWcvz4COXordtWfPGhxrLaEoMAjFrB
         UI+z+CsL3lJkZsSZcXHTeT6vYBGReRhUFQmAXkXoWZZhMNtSaek0SNoKepcgIdXFLpoE
         fDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985784; x=1791590584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=;
        b=ufwOXW8rvSTdhiK5t4CUEjXTR0ZyF8bF7Ffzo2Jiq6GSFsF5vgC1nqlkjiyUr8PYdR
         PZvmNNpaok8tqSzh5IuDXw5JMC1MTQ4LzB16cxWGDeMo8Wo5v+TjREfqNBAKm9jJy0Ky
         KLQXvUjYXYNUhaup/BKNghtUcZYd9Wyyh3fycQPSQ76Omou6GfbXF3mxfdZUFHk2zAIQ
         ZM0d23swKP3PtUJiGi+EZVc3Her7AHuG8EQwWP726gJCgtHaBC4aS6G4oAOXNP/gBvCP
         sG6nILWUixdSPjYq0A65Jzi7lYBBUKCqdsUVr/HRyaaK4QLkvrWUioKPzcZZEUGKAjhQ
         CLow==
X-Gm-Message-State: AFuF++n3RYBx6NqoAVbWJsN108QbfKrZgvFTqqOoPPNoWLEdgDo5ZI8u
	jWsKxNyf3/kSEyGA/nAOI+UOmsNcTubOwrSxBTbxV2DtLsB/liLTUleiP1yY+ujgJ6dPKI8yBPQ
	2DLqvcUDBtQZcCXQqFSG8BnSZ9H47bgsC7bMRX/sZ/0NkmI7kqzp4PM5slN8GEifRCohtYaM49d
	N7
X-Gm-Gg: AYBFou3EjDVIWQtysJqaRRiPtEyT1PqNELrY0AgModKOLUe4EGrEF/hdO6g0IKIECLR
	aDo/3R6DgrfWPXMpWrDKqZdJNQ9xTbWuFBxfAyH/K/PbmVWaO2+13UoK2LgTSGVyHps9yNUokJ7
	sCzR/YDDwWBIKAZ0OxI5IE+qd+CDD83+FHp/qZGLt1ZLX+a33f5fk4EFoQKFJP86gnsMV5Q/Mm5
	19/t9m6x14OowSbcCRCvK9thK+OIdF95EUgD8PG8hl2r74uZcm8gzQWa1NpZOB9iqWJzPfp07Mq
	PeefiiYdePxNFNcBEtg4SARyFZq3Nz+MBA+bMhJNmIKwlEQivMgGCrBaPhK2H3BqQOqBv5jFaeV
	dGsmY/gyJGDXVibdpqvwM5ZnnypDrCr15ITJbwIz1I0RQlT6EdCpU02HZ5KSOhQd4p9m/PdC2Nq
	/q1oZNbtU/br1c
X-Received: by 2002:a05:620a:4589:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ce7c1229cmr768036285a.11.1790985784187;
        Fri, 02 Oct 2026 17:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ce7c1229cmr768029685a.11.1790985783682;
        Fri, 02 Oct 2026 17:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:02:59 +0300
Subject: [PATCH 1/5] drm/msm/dpu: don't flush a legacy CTL after its
 interface has stopped
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-1-6a6a00917b71@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IRuLvmE0+tzW0ijRMXTcaAZ1rYCTxwdRidPidjqJ/0E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEYzaPJb1yOKg749Bbkvh+Ud1a40lcWZEygV/
 hLWhbmEXGWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGMwAKCRCLPIo+Aiko
 1R4hB/0RnbaZnho6vaxm/YNE51kBpPHAIdL5cZyK1p1F0i+SD1gw2iMxinqP9K+G34fE4eLN0se
 8b9q+vzJ4qGOMxSXVs7LBrbGZuc1fM0HlVALedgw1mMaDOhNKoFL0xmaj1StBwzrCNfRC+YOYBP
 u/m/hvCrNXjk7RC4wZLfUcFYd13VaagXGs6ZXAwtXamwmzvSZRr0RUP2BM/OgE8KTp4vWnsUxnQ
 i/JJfCBI4sr5ixtjzKauayzimLoJtI7GUkfMsX8dIknXeoqPbvmYcAhcxYayEM2UAuKtNfUxblr
 aUHrgVnlvnG4Yp8AwxkQeelgZelsKR5FtR3yPC801ELpAtco
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9LZ8F4jj0VS2fr1XxqN09dR7nuoJI0iQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX8efK3B/aXfLC
 hdMgMB3n77FMMlHBH6Gx72tiZnHU/6VRjl3NmaoK8jL5f8O9ZCNYesYqqZdKpnlffT4vJgNOsfQ
 P3npcWCJgY1AxKjynr1nUCJJnyGEgZU=
X-Proofpoint-ORIG-GUID: 9LZ8F4jj0VS2fr1XxqN09dR7nuoJI0iQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXxhYn4v+noL8C
 WvFlj4yRhjAYZKn+NjP8CLKwYXgIHMkrNMEllnZSqK8ejs2zRXgUOnDL+hKujsdF1mPT588IcC0
 20j6/Jcljiex3GwM8kSgP56s4r10IfnpgcI0zjik3YozVIYIVUVs4HyxEobQNiRDLHTOfNHCEIq
 duv7wULHZ2YaONBAT0jFOaD8vwgovr+7VMeI8Y2UFeb3cw5CaUz751Eee12PqeMTJF2vxK7qN49
 jIxv8RNWtutbjHPQMHeNBXLUKuw4i49zbxphoQp9yuuhokAFWvwqiV7IhFbXFXhYAUb/QDQxac+
 anvRgGSxzuXW2+ogw07kNd9IfiXISmTVIivKkG25SDWAxhtLj1cYAeNn2FPvd/IFUqftWkiEx4e
 6AJFH5339kA+1rE9+r3y4ExhnxAhGl3ZhVYPqGX5+Y9ZpzIhFEBdOZ6Jq9N9EsrozZIjO+AijFM
 uQq1wc6x9uI4iAAKTXA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6ac04638 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EynL1qdohFGk3j19l_wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

On DPU < 5.0 the CTL latches a flush at the next vsync of the interface
it drives.  dpu_encoder_helper_phys_cleanup() runs after the video
encoder has switched the timing engine off, and still flushes the mixers
it has just reset, so the flush is never taken: the bits stay pending in
CTL_FLUSH, where a CTL soft reset doesn't clear them either.

The next display on that CTL then waits for a flush which can't
complete.  On SDA660, going back to fbcon from a two-mixer mode leaves
the LM_1 bit pending, and every following frame of the single-mixer
mode times out:

  [dpu error]vblank timeout: 80
  [dpu error]wait for commit done returned -110

Only trigger the flush from the teardown on DPU >= 5.0.  The legacy CTL
gets its registers flushed by its next user, as downstream does, which
rewrites CTL_TOP without a flush when it stops a CTL.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..5a06a0fbc7e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2339,8 +2339,11 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.reset_intf_cfg)
 		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
 
-	ctl->ops.trigger_flush(ctl);
-	ctl->ops.trigger_start(ctl);
+	/* a legacy CTL latches its flush at the vsync of a stopped interface */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5) {
+		ctl->ops.trigger_flush(ctl);
+		ctl->ops.trigger_start(ctl);
+	}
 	ctl->ops.clear_pending_flush(ctl);
 }
 

-- 
2.47.3

