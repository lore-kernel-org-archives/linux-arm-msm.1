Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9B29993F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987456; cv=none; b=S/vLudyop9gljUP5NJqT4soBsybP0P26jvbiZTE848/oo+bPL59/6nTgqWPwkep6wPMsvueRJQ+T2cR3uqj+ZyAxgBGU7BRrtRbDD38nSr3WcT1SEVVn/YyyfwzCOyrTieAOE1wjy9CqFDXC7AA9i4ZlyVxlYfd+lxZJOmYYOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987456; c=relaxed/simple;
	bh=Tcm1wwjFUx6qr560GHqjRbA//0DsF7WwB3VWVPjtYn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRoLYNJANCq/Xit34eFwUvcQbiOFiwV+o9K5m5+o5lPWD8jL82ULcAwb2rUGN66ZY9em2BSTDRLF2a3wAgNDvh0XidOFSyUMwkNkF3HsJcLiypzx6WMm/a7OmHzFK+pQdUvgxL4F6iUZ2Wa6G0F2sl3pj8nAR61u4xseLdolLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mrW99CZF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=apGkXz1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mrW99CZF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="apGkXz1g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne2HD1956290
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=; b=mrW99CZFoTtWEbva
	ASB9L6EE7QSfHG/biXyu7a8cz+yORecTwEvGWfLwpRxiZ+VO5/qKZsk4NW0VeSU+
	zyPKTJ4FA4//2OAahM9oxuuCof6aF6Nhj1pCGjL2FOqLTAhLS7lpt7NCBrw1KGJF
	grVRXWRc5r58jay+WApPoCYfQeDks2WDDgTZF+wPTGeHwXz8QSqAC0sCC2PSrzj0
	ENi/1EjaUUY+1kfgp1twV494gRhbCkOAUzC4sAXHKZfFcYrhw54Z7NTEGN3cUcXq
	cE7Gx+eoAcUFp48OrwAcJCjYKbfHDl4VpQToz7Ppb84wmgDmE70kmJa715CUfZ9j
	lr2CEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2j0ks44e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a3f673221so32683685a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987450; x=1791592250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=;
        b=apGkXz1gP80/71J6CGNFoA0C2ekAyI4rVSR9q2j91EgGfJVjHp1eASoxn5PWE8payW
         cM5fJDGWDJphh7E3jbv6DpZDvZnBxlVdnUkU55XE2j5UB5EgsZapszs8CynRgdJlSZXe
         LGOg+J7YuJzva/uXTr9GYyWjgx8Ka9mmrN9vuoQOa/IEQI46uUBKAodaRg/KoJdGwaHt
         r03uO4o2ozugiVvKCW6my4HBFhJgpjBNjRgNVn29Yhs0ZEVpor+a58nGd4kqSTLDMDGC
         niU9SqmKUrd378lK9dxzDAp27I+/wVKQnH1YB5RVYmx14C6CRhBGJ/X6Yg2ruUwQEEH/
         aRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987450; x=1791592250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHOhCOzc/mfTLMETVqcNmf3tHPYnwjCQ14Z/p/+aNzc=;
        b=m0YcYPfCmZ365hXQQmsQrGdXFIMvS1u47FkWI1H5TKC1shl/pCAxTGl/VasahynB6S
         cL8/xAD62vvGHFDvx/+5i0IqLeYJ6I32slXd0hiQfJ++MsEZ+BIrcdCYJHE/PR1TWAME
         SZDSb39p28UnOSN0zujtvcarT86jlWw/ufc/F0hR3mipUZdCcc/kI4kQv/4MHxfJhqEE
         BzUOu1YOMjJPOJdvB4tMVqR39efShbh2WQ7+QgK6V4FUsmcMCNEFkcLtOTEJEgr17PRh
         ZEfmzPg9nn46dHxDxuIXWRaao2MCjgGGlablI3j6iwreWe7bEXMazYzQ3awiIsxvjPRu
         Lihw==
X-Gm-Message-State: AFuF++m08hVJtrmfHcKsq+Lcyk/UcHtm7F4yUncMeM93///E8XB/ouLo
	t9EzUZ/K98H7eDexHdnhjpOkLYPzDogW4hdMTFfIcZKqGPeEzXK4uRhBVDEgh/RM0n/nsA8HDWm
	0abohbywLbTjae+IYzxJJQCQw7Jd2am/2e4Rh78tYuxkkrJvwuaAIoiicKJY3pyWuNm4/
X-Gm-Gg: AYBFou2xjy6X7axyx1qhWDYZbesxgqgVDAdc1aVZpWyamA55gE2JEQWfgGejnpFYxxm
	zu/tmxf5Zreq7PaRWE558XeZGZWWOXc3rxuJo+NG5ATzK2wZ+8f7c41qosAhPwumFVXs9LV5pQ+
	+ORTfXwR2nX2GFn21brJOCIihxjmF9RoASOCzF/Lm8gaQ9b/zioK+Wfws4yfHpr4W8dlmMIu1B2
	71j4nd+34154YAa7AehdKTUSEjGomTFelriQ5ZLmrFbtWu37oqa0hj8r3jdOew2dQJvOq5vyauI
	gNTA8otb1/UGUOB1Bh2dQCAtTLheOGWIXL97IOTkd2dbnZCavXEAfNcmmsV1XO5kBKOFDits4lH
	DQ61Nmz24grorppwZU2Wc9hJbtcvVaWptDWemiPcgk0Cx9V65fInZIALimCoo/VhvOJBh7VTU9S
	rX9tveMqo9/+xf
X-Received: by 2002:a05:620a:370e:b0:92e:45e4:c6e with SMTP id af79cd13be357-93ce7c126a2mr814747085a.22.1790987450501;
        Fri, 02 Oct 2026 17:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92e:45e4:c6e with SMTP id af79cd13be357-93ce7c126a2mr814742185a.22.1790987449819;
        Fri, 02 Oct 2026 17:30:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:23 +0300
Subject: [PATCH v4 08/10] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-8-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tcm1wwjFUx6qr560GHqjRbA//0DsF7WwB3VWVPjtYn0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEyeHM3qodO1Z4dWypShC9HlO1P5tnDPFr6/S
 c53ThRUNNKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1SPpB/47Q77z17jpxRb0zyfwxmrG21V9owc/wpGMXOjNrvrBp73o7zHvOh9yD5inwpjcIrd9ewJ
 jqqE/akhDolwoF//pVDm1CB0RkCP0Rxzf/++W06MnXJfjmKr/8gzRStduh0a5cpJ+BF3XLfJxVd
 Up9uDma0k/ldJxYyIu6H21VVuwKeJIFbSxQNBe3yTGxIPxxDLx6hk62fiAOyWwbZeGhsCuqkIdc
 mEVxbyuw9ym0Y1z4o0M4XjJpecjmUSeKYr49h7xJtJewkTMHZKAqH20eIBOS+MW5BbH+PkifPzA
 PWQ7csibinNcvqdoZ+SQ2tWQl8XY8/B9Jc+iRed5eLqg39ld
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXyePlwm1dcIk2
 NqPuRYCWYTLEfntZI/aK54Ke4F+1xtYOMHtrlJAsLdMkwFkdhWdSnzHdVj4i9VONf13R+ulVeC0
 hEl/8Dn8iAl1zjRitBNOsi9OC4rtrolFCsl7pVFouwCMZcjzn6vQ5ul17BuswJwFznSpTB3tggp
 S1pVFMdNlQEQuVAv17kulGPg7jaKND9q65fDRP3wC1R4iYM6RvK0HoeJDRWVgltGQBdKrRaC+7c
 Oxy6C10UxR3szmkG4EBvNsLIpaXYOORC4bUMkv8MbRM+N7TOAIFCTpZ2DAmce8lm72Y3r9Wcz5T
 CUwkdyBzr2HaL1QF1UsaZvneZpOW0WLXWdOLDFCjvj3VpB/aOWo4ZpX5YsnLQLSx1R/2o1xKRo6
 ld/sR3f+ngsA6YdLqae5HD5xV5yArmTXoBVohUyf8Yd6obyd5yqDnZbdvg+3NOGVRctUlCMkmm0
 61sio673K44MJAwJvVg==
X-Proofpoint-GUID: V7t_YYKHbBL4E6QhEL0zPdzWm2D5HAhj
X-Authority-Analysis: v=2.4 cv=Z8B5j3RA c=1 sm=1 tr=0 ts=6ac04cbb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mN6KdvlfDCua2x_U6QQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfXwNOiIWUMOIO1
 YrBdePgTrwu2kjIyAiLP88jccEhSBqF2773fE0ouIx7wx01NZ8mslKXWu0F3IIBGWkyzRndpkcJ
 N9m/MayXLIwtniHDKBGa8Eva/OE0ak4=
X-Proofpoint-ORIG-GUID: V7t_YYKHbBL4E6QhEL0zPdzWm2D5HAhj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

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
index 6129b01c35e6..c9ea303a4b2f 100644
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

