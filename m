Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797959;
	b=of6+64Ms7L8ICNCoZKq1nUxV0xC6eY7NxJQZhFcpvwT8x0YbtV+TbPGcbmsaJ/ufYSXU
	 6NnWwTse5Kfmhv1d1UW3CFVtPGcSuJsEcp8ndG0/7+ZH7B0Ffd3+gwG3IukQurP4OCule
	 3X9TITS9Sr8L/rmYk1vGpcTQFcR8CfQk9q2rCeKqK96vvdDXmXaRo1opBecFrjdXbDodj
	 8x7yTxHeoNPKUFJybWcefXdJtc90/iTA0l54JCtOY3++slsBLS8i1x26aSLovzDM7M2yo
	 EoQeVf9JToo+V3AS9OG8yC3smu0ZeELTMCgPTj7y/Euxt49DFWIsL1M27LoNFMuZQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
	b=XvhiQm/wGDovP43ynCf9sli8ImMC5N6OWxjMCxYgan9eU6DKmaZU/bkD0r1sPX1E9mxE
	 V/Ze+hlMLkwgI8uHTnMpmlSkYTOy6A7e2FNadR0ILKW4M+H6oNQbr6lNsLWPsepq/tmY+
	 51N8YK0hg4Vz4VyQsc6ct2L83gk3jaCN7rhT7IguOqulqKUpg8CRmAjFF/hanOGNaOKm6
	 cr1VbpGxTcbJh0JbI9G3JOc4qlFKq0iEixyVXYSgiOLHCMJre/Sn965Hi5W28h4RYLOg6
	 q0Ufw3mP9LdnwnimWiFiw6UyYqaLTYufYJOz0Wpi0/NlVDly6TrbEGnZxjBrPgJ9yDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAk2+frR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9+m5JoC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458E2606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 458E2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bAk2+frR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h9+m5JoC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv9pY3683591
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=; b=bAk2+frRzCzBfsE1
	hMaJ+IpdT/5f5XliI6eVQhn6SG+FLituzh8uC/JD918Xw3is+TAf0Sw5qt2/b2Ge
	n8KdB3IUFusV7yqQhKUGHFmTzUMHCZfwezoTV7OF2JvGi1IpXLBE36PFsWLZqgOj
	uX6IYhe2KkgJ2A1WEUoUI2vxpX0g9T3BoxsukB0YeU1OC8DQAoou3LXy9dHLp2Xn
	RNPCo/tNp0J2Ts+kybtAUFcOv+qjty5GOA2LnnlHrioQbF9d7eF48kUlYVxWPOl/
	QhjxkmkP42SYcYMN69kvw3dhLc4fr1w4rG9cRgool0Fc6mJvz+FpFU9UFewuCSfF
	Kmw/zA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so94979985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797958; x=1793402758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
        b=h9+m5JoC6U6C4o5lc9a0Dk56S0fBTurzmBu3qURUGQdl6AHxsLZUx/VUbRvv8cJkDe
         H93b0dyuPiklbpNEmX5C6NNNz8JPnSH/WzOFjyvqB2nWKixDEYczP0/McAg7Yo712tEx
         sdwBwtGq7ds9PmzhaW+BPSL4P9/KB3Wnyp8DjtnIzfkN2NVYEJLsGsTFOYDDKFxc128i
         Xy8H+7+IPnKD4KAp+BO+tmhQ75lP5vaZ2eIR979gQvckLweouIX/SVxS271cO/ppbLSq
         FX78iFLviYNR1fhkG7h+QUhAv4atam2gmKMS45DCOQEcTeO2shiPTcY214u3lyObc4hj
         IqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797958; x=1793402758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rez6lWrCXKWNd1C4fPh4T1jC+3Mob3goTs0GLfBz0nM=;
        b=oJs087AvfzajsnUN895RRcFibLvCP5VpWnkI1mCLUllxIW9AmPsreD8twJBhE6wZxZ
         xp/wcEUmhdq6y2f8H1dwegNYtVXeDkUBT88GV0dMRKGmxvARPKcHMTLDG7YJ4aVoJ0ez
         TGcrzwT3PgqGV31qOyTB06mXPEv6MsewCEID8MaD5XroqdapUP+jxKIlm9Due+YI66+F
         2FFH8dQ7Da1ao3iKuBkO2rTmkStpHcEt657bsiC2i2RMlVri0mEwIhiNRIkEFzwMf+9Y
         H05GN9kCC2vMnJGHxoXmNeiYv+hjP4TRuwmElZmSs8slz1K28bLI8ILCcTK8XUIJgI/Q
         VMmQ==
X-Gm-Message-State: AFq9FYL1j4H1++wquQcDT8tD9pbid/+xXLdTqTNpKjUoOt7vX1SC2fgA
	oTOU0mZfu/jLwMb4sShOySvykuCabVUfETgY2+dXXID6YQll1kXIgOdSX5bCxo4tMcTxYF7D62X
	buXTk0H8C4fXjeyOoYCcaF+ZUNroV5Kyq5zZs4Kcg9Rm09sE4En9emzz9HGaXxG3nH0mu
X-Gm-Gg: AYBFou3cKErgmDCK+acAHWd5V+wSkdzlbwSdYjrFMScOXUhsEchDSOnMgdX5hvwQ33f
	6iQKlL5eOQ29Sa/F9NQv4VL/fY6bGzFgFAkYu/63w2JMvRHv6syItQG1aKqxXawr+5Pjw6Veoj+
	oJsLX+/DfJ8n+li6fIlPvV8ZZNK+KCD/tWX9nZYh4aoCebp1FOJmZOIzkzqoqfax7W99s7btVHj
	go4e/MWwQOiNae1nfmV47i5f1oPe/YK7MTyS3/3ANC593lttd+t2+YE+x2NO7Kc/p9sM45MnypR
	Pn9wKD53mCbIGyvIxVckxKyxK1eqaXlQJKYeJzf/8pKa7jIkeE1SmQ8hfs5m1muftt2pvJff3yV
	2ZWQ8SrZ7hC9dTG0N0Yp36sVlsuWTrAiUi6J6WGf0BYyqp3HV/0l2xTia2VhL2URR7B9e+cSslH
	DytTIimtjaHnQJ
X-Received: by 2002:a05:620a:4398:b0:93e:5e2c:8bf2 with SMTP id af79cd13be357-940ef8be9aemr96327985a.21.1792797957609;
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:93e:5e2c:8bf2 with SMTP id af79cd13be357-940ef8be9aemr96324985a.21.1792797957119;
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:29 +0300
Subject: [PATCH v5 08/10] drm/msm/dpu: clear the DSC blocks left by a
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-8-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=udqMWUS3ZNDRZgnWIleo7N3VNOY49EUuFnGmacwENkc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zrqQD/+e3M3SNpy7jUSpforrUk+5ANjdaB4
 Xy/clql5JOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs6wAKCRCLPIo+Aiko
 1XpMB/9bNxciSLAV7RUK/wQL/hZFMaf51A3NbiaVgVEajV6jG3zFj1WArwoAqAk4fEpAc59XRcI
 Rl9vXq3y9rjlqxJD9OlRS3DoGFwligsF7bw6IV9gqfblJZSOhKn4otYSab3O3AmSxqMgGtzWB0r
 ikTl3TXPsxa9DErWd4VNAVBjbUiK2XSDN1vmfuI3uURzKa25TStB2hXZJhSk1jy1yHdc5ajyIyf
 4PtrgpJQHCtQuwUpj1yB2vfREWMB24Aihx5D/l9DSb3f6+oyKincx2qdkpbTc4oqqMH/i07Valf
 IXV6pCGUHb8/buTwa1Xy2LD0RoaJTcq74Ds6yc5zBuXwrGYm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXwjAbUi1etWO6
 wSFlsmwde3mB/uvMKewEOSv8HJNDm/KLAtgB79zOMmjdqKw7enb53x3OA568q/p2GG7CIPyYe9c
 Hpi6ImJVWdpUSnFtfUkScV1m8sq/cM7tnkcRCBBLNEPPSFcAiujQdvADj8KuXPXSXr1knlh588z
 7h8QH9Mgu+QFpVM8nq/ZQAbOVMCxa1m0NPxNb2G5PkvtzzGBSDuFLr45iR4qv383+ijMqRaY5pP
 4IkxQwNwiBU5CCczbs/yOdh0kdNbPhD5TQzQ/ZgJ6WIcRwCiPSSWRVVgvd/gShK4fm74j+OTr1m
 fqSB4oPHB9vzRWSD7pBsxyFMXhoHi/18xwf4fSGCod+vGKFpTc/7S7wIBttUmII5ed2TsqPQwah
 R59TabaoKx4iIVlPlqFkdwHuQ1ou+emo2Q+M6yLFd57sCbiyCyFNPWhmnb/MQI2cRFet9HLmHcb
 KM1xiwyxsjGA+LQ43eQ==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbed06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mN6KdvlfDCua2x_U6QQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: axT4UArz3BnmKeAgCxiSpAw1UCAQ2ofj
X-Proofpoint-ORIG-GUID: axT4UArz3BnmKeAgCxiSpAw1UCAQ2ofj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX08AeZEzPhedY
 Qet+s4Eio7iRGwIcJshkXI5noNWZHN31tBTGqIf6cbhU0kLo/gXtRtEiUzvhtazIuK8++x+F0X0
 XQYvMeX5b4CMGewu8tr57QxHtFiqrHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
blocks of the new reservation, but only the first num_dsc entries.  The
array is never cleared, so an encoder which once drove two DSC blocks
keeps pointing at the second one after it has been given a topology with
a single DSC.

dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
array and compares them against the number of interfaces, so the leftover
pointer makes it report DSC merge for a topology which has none, and
dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
block that is really used.

Assign NULL when the new reservation has no block for the slot.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b337f197d3f5..419e0c6e8ef1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1224,9 +1224,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
-	for (i = 0; i < num_dsc; i++) {
-		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
+		if (dpu_enc->hw_dsc[i])
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;

-- 
2.47.3

