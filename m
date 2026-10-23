Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797952;
	b=AVt7LSGquhq+SGELqIvkuoVxD/hSDLKK2rlY4gI56mQjZUoazWuernHMr2nK129ODS/8
	 7pYD1NV9U6TSFnvQEHVKlIV+TUGoCbPziHiigRIcBQ3hR0hZrgRgF5tw67ueEh5NExupI
	 FZm0h4XmQDenxi96KB1NbaFUnRQaoOrD57lBmVcljgmbkxTfW23EGqMvEIWzIv6n8+uVe
	 nDwTj6INHcRyOys5PnJJ+h3FRAa6WzbxraORNq4UqRu+P7OB14NuXL5Fp0D3MOTvvdBYi
	 IdhnfOabjxZGrXmdjcmSDI0FvShqzmkMw7xC2T+X5JaUKWj0T90sEpCIvIb6ubmd8IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
	b=znHZEaQBQ1Xz1q+jqql+CPM0D1g6blvN9P7NJATQ3Yy0x0dwUkjV+nXr79AgIfYaGHw4
	 xA2Wp95H0yqzkxhsogcJyGESyUVSkiSvIFq7L2tilGRZ58IzYwe3VRAG837O7HTNjgF2w
	 CBJqyrmPmlWH/xq4e+Tpr6OUoCp/r2razDvSap1MK+n3sVTWJQ7i0YVJAOdb2SPHXFJwT
	 7Cc2JD/wf9eTIEzhZ1WplksPwzMVXZd190CnJ2n29dYXQ6K0t49MH7FPxA7SiKhD+Iib3
	 qF5byeNuM/6mue6+BiEc6mi9Dtuxq0uOXQXfRiTrkX5Y9tOhIl5O766MGTcz4v2qH3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjWxWVq5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6aia4Ot;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE660A2609
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACE660A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjWxWVq5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I6aia4Ot
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv92O296939
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=; b=OjWxWVq5sZXvXfdv
	X/RtLBmcID+sZj75zetAGs7GWnr8JW0NS1lTaxU/pEMJOhn7+H1aSwrr75LrQaC7
	gmvsZTZHb9IwnR/LJK7wddikL9JSCwRGD1u/ct7fQiX1ooTH6BGDVxnoa3UjqLLc
	jsqlt51H35iUNFBVU4qjVxBmoKUuFPxSQuqoMYhZGAo3BtNGbhZoCtlbc1J+bFN8
	OG/KyzbhuxI0H5wKJjr+NugpF4BDo88jFK15om27Wo+wYglspzGoEHGv/wrxeP7V
	BH6VD8hm1NBQrdJloaAb4h1AhsYBC2pbLzX/iaR21g//AXmRixexldrGxcdU/cZs
	WXMgxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgaruhcj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so317102885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797950; x=1793402750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
        b=I6aia4OtKOAm8gOttHmln+jazbkhSdBu23wSWafhHowWcaTu1qI8ojcAbKBk/QcI3V
         KbimTXnt5lPn/uwV4lWSTq9K/qBVjNg1OFFuEmDBHtgtgiWZjbnsGgAUK1sz0mqFxFtQ
         5kfiFYw3NNz6wVH4YVWlULEKnXXfA7D8TXuI4RtzBfZtD/q5Z+JGxhLJoUJh27t2yZsV
         5dO1kTKOWC6HnH39WiPbLeTpNnaLqLAThl6keY/94PJxxYAyzkMukXsbKUHYPT1PWFcA
         xgCFSdI5Bv56rYObamGtytMoeNIHMnJ2gF45hWGd2DP3WiRaCTn4MUBRZgAFu5uaNzST
         SEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797950; x=1793402750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7EDIi+tNkUmEr6tJ9z3I4I6TwuiM0qEzoqHgAUC25o=;
        b=1aE8ZYCP2zF4mE+1mQ+0zsDwThNnfDy0CIfpRsTbu9A+1g5zqaAPMXcQb4tvMUMw03
         RmDeODTlSo0wgwGye8MJJO1ZDL1HUCClGksJ6iSXMjye+g8vquQ07gZka1PUqRS1+6uD
         Vd2KzGdtWFUc4SDb6RGkORTAMiOtF6O2+ST3fSxYqX8giOwe7ycRJfDuh6o1ERiBZbbm
         0NxfP2/ed95UPZrTZAaTHd2AOzBDR+hRs3hD0pEbVVfR1zahQRqTQC1ErMDr7VprQ4Zh
         hVosUcgIdwZxwNBvDXkH+v0wiInmsJqrDhwwevRD7QiV7Zm4ZGYoXY3o1tZWIUPYLRYV
         fHhw==
X-Gm-Message-State: AFq9FYKlPQZczEKAsjLZBnBTQ2nfWPFog40hUsjxl4Qp7OD1frPw4/J7
	rINxbmny6e4V5ClMj7xsBKyJVrdPdkgK1HoKrBaS+I25mnaZci0OBfOQI1PSbtncDxhR66/2enp
	mXhtFaka9sT9aYNWEZ/plJuaQxWtCN1+WTT2AEVxWZoNqZBcyXTAHYqlPowajflFHkjFD
X-Gm-Gg: AYBFou05GeUnXr89dKSARG7N36g+p9bYJf8hC4xIsdmj49oK70Y6MhRXcWOByRrh3GW
	lMLAmSIoNOeA18erSBTuddiTddrqiTcDNJiw4KHlibjT2YmKGL74IybOBWqgiRD5gaXYdbg1650
	6cXSzzw7xFXAjgfGUNARHpKZTKNS2FWRQkp+9SWRGCoTxhkOIM4gRqVvMUdiHxlux29voeNqjcq
	cCTFv32G2gChT9K3SQTYiQfO+OrLdeaCD508/zzykhX3yk2zBDWv1itmsnH4ISLc5oidNvaYM/I
	lHfk49J+rRaGz3WZaSmC0kGfejBEpzYz+tVLA+nYsD/AdhQnmdBS6A39XQ3xaAQ5c949zrOoFa5
	rtNkOflI1kjWkMlAt6g9w9lXXgvw6avC5JQwwU+ASG3kVtqSCCiRdTA9Nl3ci/eRzFnbn6E+zUg
	VmEaMQYCepE7Th
X-Received: by 2002:a05:620a:3910:b0:93e:c12c:f12e with SMTP id af79cd13be357-940ef9b19f5mr80356385a.73.1792797950406;
        Fri, 23 Oct 2026 16:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3910:b0:93e:c12c:f12e with SMTP id af79cd13be357-940ef9b19f5mr80353685a.73.1792797949899;
        Fri, 23 Oct 2026 16:25:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:26 +0300
Subject: [PATCH v5 05/10] drm/msm/dpu: clear the CWB blocks left by a
 previous reservation
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-5-a5b0b284aead@oss.qualcomm.com>
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xs/CwFXdBTjsc3qfr5DTpttfpNCZgIxVn86qi7QYupI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zpIlwuhppzIxkagYZyU4H9WCxeEJ4vvij6F
 pdj5FaoneKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6QAKCRCLPIo+Aiko
 1cixB/0QMpbpIymUJNF9EEhko2ZwTHssN5EYk+Zo+aMBPRGQtCgOnBpZtiSlP8U2vOWXcCjtg+W
 bMA6UVbdeUsNjC4i4DKoSlJ2t1ao6Cueh9Pv7sBax4n6+l0vPWFZ6kfXy73rtSfoRPI7FPcpo5b
 VO4Jh5IAuTr2lKyhLs/mNjPnogcyQ4i/e3OT6468Cfah+0TCSP+8JSMEJV0OglYIb1R9flI0hhG
 3FugHYeYcWuvBPEt+mg/rMdY6jH0ayBDYVg9k5OPhw9GgWECdTqemRGaXWVOktLlSwirLmE61j1
 zG3BYcYb8F9buzfzVeRxgRBlo9MKeYiGhR0n4/K90vnPMUKW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX7bhJmvhXNRXG
 02nWZaslTKOUPqPtL2Sv6jd1P4AerXfTSAEF0FXeXqmwAZdmj76+vL78iszozv1KPt0KHhtvVw+
 ZCpPvlnv8s36P1m5ir73TK7Qr5TPN0Q=
X-Proofpoint-GUID: dcr90tfZcVIAA7p3FmeLnMMyoUO2myLH
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adbecff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=00kiT5jbeo-7mEmJU9cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dcr90tfZcVIAA7p3FmeLnMMyoUO2myLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX2YrtvXCK0a6V
 bvL4I+zoKuMd7rJCx6uncCy+D0YW8JLecRaluFG7+1HncAE7mY8g2z5WtbTPTYCmu4UFigcmhDH
 MiRqusaI9o7UeGV4AYQ7Jh9X6Y9RsLwdJeCdvYJ/U/dfbYBMk8dXdfwWMuTJNbjUtpFBKzxot/Z
 j3Juj3OpB1WrRIva5kz5iWSZGhh0OOIpJMKeZOCDBXhuGNU4GVhfJGreAtuRtaKCG4ivl87+l+4
 d2bd8gbvEctPydKQ/TP7HGZf/A4kerVpjHAtLTu6J+dBBStlqhNpmhrrIwbtkWMbHrnvxcLB1t2
 dNoCreWbjOsmfozqJOneP+IpeJkGCmooIO/FdtxNaflXA1eMPVhpMgbUPSh89oPX1+OjjtGZouB
 3vvMqLBvw7LUxoyw0YtDKyz9ItTcKH74Rp4spyt2I0GXpuFaGa1jI7C1GYqOV2onk1bV2RUejcg
 I+eEh+I+XSRRODnafOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() only writes the first num_cwb entries
of dpu_enc->hw_cwb[], and not at all when the encoder is not the
writeback of a clone, so a modeset which drops the clone, or reserves
fewer CWB blocks, keeps the pointers from the previous reservation.
dpu_encoder_helper_phys_setup_cwb() then walks every non-NULL entry: it
programs a CWB mux the crtc no longer owns, and looks its pingpong up past
the pingpongs actually assigned, in the uninitialised part of rt_pp_list[].

Store NULL for the entries which have no CWB block, as is done for the
pingpongs.

Fixes: 5008375443ed ("drm/msm/dpu: Reserve resources for CWB")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..8fcd0b4e266c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1205,9 +1205,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 						       ARRAY_SIZE(hw_pp));
 	}
 
-	for (i = 0; i < num_cwb; i++) {
-		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
-		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
+	for (i = 0; i < MAX_CWB_PER_ENC; i++) {
+		dpu_enc->hw_cwb[i] = i < num_cwb ? to_dpu_hw_cwb(hw_cwb[i]) : NULL;
+		if (dpu_enc->hw_cwb[i])
+			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
 	}
 
 	dpu_enc->cwb_mask = cwb_mask;

-- 
2.47.3

