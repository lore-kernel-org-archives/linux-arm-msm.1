Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797961;
	b=J85L2LaFkzX88cZnhyzB3duqdYBqe+Q+zfuo5/e7MJJik9QMbaWRM1BHyzm1iZXFkJIZ
	 s6MCHUzl5rytdFdRU2Q2IC3viPO7FbuN7tLDl9m28RLG8Wz0jdIBkq/c9kexmQQMgXEX2
	 XI/aUnC68mvl96xHS0YmgpGUJaH4OR/jQuq5vCv6u7Gf7lw/qGaH5g6dXjm01SwXreNgD
	 pD9CsPdsJBsRnFZWAlUBNt8byerfS/9dFCnne7fa4PZxX95HL+5RoBqeZJG1Z0vCMvq8l
	 NBbnyCuNQvhNefLBRCe/G1YBiYVuAx58K+2Au+dbSMfAOJgtzT5p2F3XrHjRDiIshPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
	b=a4CPpSGo++WuCFlcaHHHg5a780JDrJFRpbwhnedvuLrOcr/SnmEF3G/2Larv6AsHSwWZ
	 pBNch0Xea9Hosn6vEBamJ0euhKaYJ8wPEDHKXG5RGwiRfavBc3tgYg8ce0vNSTMOYLdah
	 OLoz0V+cbf6vNa3z1QvLJEFjXwx2pZtRR7APxEY11PxBeTQg8U43YSESw876mPVE3NGsK
	 gIG7lEQSJKl8/2gJ5iYKDUrWFaCE3xgYm3r32QYDp5an9TYYuDHOEuQXrWaz77COW92XX
	 RZszou5bat22DI5j3NrqiRxWpsODenYYfZWfJBnFcbEwN9iG18O3FsW9DksPN1KE1zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwSeRmgt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9gfBBDv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D618560A2624
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D618560A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwSeRmgt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R9gfBBDv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv7Nc3683561
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=; b=UwSeRmgtwNOqjfVO
	GiR+S6sh4hZp+84uwuxNbQYyvZzqMT4kAdKt0mHjRSgUkrGImKNRujhBnVf9vXwR
	Y2usPVwMYa3iuFraoIz7IO9oqwfszcLRfRuLnUDbKOFjQs92FhtyXxH3t0vg883g
	8L3y6QHoAMsfvpBNTcwS7X9EhDwf5raG+9yppbLZTfTdecd0izOaTLf5up6T3yci
	q6OpNUaX14UkTAtogijoBrH6NwMeM0q+G6Jhh3XRAmqPYkiVXW9C7FsQVzC4d3Hc
	XJDu+66j06XcbQ03z5sHmMxEO/umMT1SxQTq0ZnsoDTMICuaMppfWRscWH0QxXtv
	5klpNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sbmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 23:25:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso423799985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797959; x=1793402759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
        b=R9gfBBDvbG9zwUOoJc/qxMnAz62k0kVBgI3beq4j4LWGSz34nJGygVwxkHIxtiN4Oy
         buFrZPM0ctke6dT2JWIAPf0tDaWs2DCsyv6dyF9yCrmHHoActpgJwUiK0Vzyn7QddmT0
         KaQ/sfnhCQfLhtXQLXQwx/CnpLEmauK8BijpLOjTw6kql/eJD7WblvmQQmzVvubhu66D
         T91axnkPrN900Y5qfc4CeWXLnOHDHcDJeQ1ljtH+XLcrYb89XQEk7y1U6D4hZ5Lt7e5a
         UvzVx9SfReNtByoSu+wy/oA3AHhTFvhXqd/KUkI3xOw05fj30/ol3EZrKjFafduqPgkm
         glcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797959; x=1793402759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vr9bnjvssuxLuebxRpgYzgVNkR8qsjc3gztXQ+KxGZk=;
        b=BsCI8wtO91wRKkt8apW8Ww2cLg2Dizis18orYItov4mowQb9flReIIseM+2yJuzrzO
         f2D5mEQrHpAZPBknOFCA3ELe7y8mm5MxNnWueHTsKsjMJrh1lKOiAI7/DatuaXY5MLK3
         oRLSwLJxIUVdoi6NTCRvEfbT7t5Ok1vvczYZoFgglF3rZ24fd3K+uGPaCyt5uFXNTNJd
         Po8zlRVbPVhtLXmPHh9CTCWfWhz8hsrSVAY+QahiN2X0s0F4UO4w3dmOQc6Uk7bBDGs6
         2ksyYqpvVPuwNbv8d1iWaShB44/lQkEgoVWk06dIWqQ+ytwtOF63N+QBUr9JQt8x6yTo
         0VRg==
X-Gm-Message-State: AFq9FYKpBt4rNVhhhpNgXtK3WAqRLtUyKQ/eoFUN4ii2trRd0+49UoFF
	PBZDyiuT6l143qLGn+tVkcbz8qfj3nGr4ThF9kUYuJgPhUJXnAFRHguv8iHewVimgZ/80DGA9dt
	P9IJ8Liky3YCbSJxf8lX/qV/7RSPHPNBtQwtma9B1zs4ogE/ii1GIXbhTNp7Z20tKutDN
X-Gm-Gg: AYBFou244EqjTOK6vdMI+B3rPJyf0NH3iQl/Yr6OXHik+75VYId1GuwKu0W60aFZhK6
	j46IuY+ALtRs6AfDzb3Nfowm/GJLbM2CzIlhKCpIX8hkcOmZ5DlXRtt42oOVaKAwMYR/jB4ghXb
	CIfoLYaCz3fVRyedjDd7AWyKrJ60hM6UXWC+soJm5q+oGP2agWM6sCmlEeDmYZe+ehX43cNQcuq
	gUb++1+lR9fkH/RfS3q9r2kBl34Cws6bkoj6v4F3tbexMEnByrS3VJsBpo6iGXbtEEim4/kA375
	+o0uyip1lWTwZEmabjAHDaW+mgMAxr7ZpmIa58NLy7FeHZLE4TrQ52TW9mVd3gBDwkpycbIDh+O
	ydEP8WRcL7fcMMC34PeYxJFGnbSNOBK06ucJ+FtJoFfLctlJ+SaU/AlU+EBR4vVN0AyUckeZ9RO
	UWhLB1NhgSWcsF
X-Received: by 2002:a05:620a:1a05:b0:93f:654e:ddb9 with SMTP id af79cd13be357-940ef8c8221mr79127885a.33.1792797959214;
        Fri, 23 Oct 2026 16:25:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93f:654e:ddb9 with SMTP id af79cd13be357-940ef8c8221mr79123785a.33.1792797958612;
        Fri, 23 Oct 2026 16:25:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9ea71sm60217e87.81.2026.10.23.16.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:25:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:25:30 +0300
Subject: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
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
Message-Id: <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmmDSBsrWozVVAMrvE0HZ4zhksCA/ZTlUzPFojWOt4M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+zs7aVMXMNMacRC3La7G4bkZNjPurn4a0QHh
 Q2bqXB584WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvs7AAKCRCLPIo+Aiko
 1QhLB/47Zr7O4aS6TGk/MYk7J9s9T6XTg7p9uMYvN0PlI+TPqwO3Y3R8qgn8tT9S0MnhKBgt5e2
 6QGTcsa+Wce/jlM7XXbW9gwHRrBlPJjm/OcTEtsaJHErJrKEG46c/vSa6SrK6noN8AJYvTBJ0+L
 YWHW864NrVy6qtMrZ/0Hr/XBni3jJLIVUxOc/axT3fpUSX35oor0L3ySoh+aHOrRLxEuoRcura1
 F90iDK2swsRdeGinoDFJ7//QUSIJDldBK/COucy+pCKKfJ4zf2+5P1GIGAExaehjJm/06cFPhCQ
 8juZQG7ZFTZpcfB4N8i70xvxuF1P7kClhXrx3jIlKvnzxv+J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX4ggaML2+BS3d
 BLC93iLRzriUOVoE37r9JsQoQVAvFyy8cFDhsQMZn53qI0oIGPmhCvfg9Q3wQfSIdzvo44BeGPM
 miHN2RE5DjEPJ0jqlpswPiqSUuzBbwP0PoQ8Hjk6abFA2N+sfYL4/9tcPf/5lFU8gLdgTI4SMyl
 /pUUKwqLafhaJtLqi2BiCimsFeyPdXoYBeta/DPrnkV8mGvj7Wh3GBsPIWgBPkDoYl4i4m4GSsj
 wmNG0Cz25jJKWaTj4SGPv20IjMjE8YyAEWYSjZ4Bpz3tMHZyiV6sCvPlVLz8jkMD0v5YN2oPj/U
 Zpvlgw88E6lF7mTQVfHsO5UxhDzHtvIdXwn+FhC7Lgon5Wf+Daz9Ux+7DuxMiOHRc+fKYuE3gQF
 3akxOlaeBUu7VUpjg4RvcsS/i7o3/C0IcWIv/gYjhNUS7kQ3bFfREI29iKkQt7EZkI4COUd0x+b
 BWgYjFLTVKoWDMDmqSg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbed07 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=A1gMwnIAOo8MrSanVxoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ITkrS-1MO_iNxwS1mJNGtvg9o7wVjXCo
X-Proofpoint-ORIG-GUID: ITkrS-1MO_iNxwS1mJNGtvg9o7wVjXCo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfX/hj5IeThmbm+
 leFbHPVcynKM86lKujq5aQCIcWbWoRNJf9ebA/TFtFF1HrHYJscGNf7hW3YKbKxoD9nUx960+hE
 jVSmlh3nMGN1E6Yx+Nx6+8EWMyvIlRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230092

Running kms_plane@pixel-format-source-clamping causes SMMU faults
(fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
updating, so the test times out waiting for a CRC and the pipe is still
fetching the framebuffers released when the runner kills it.

dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
connectors_changed.  A colour management update therefore re-reserves and
can get a different CTL: cstate->mixers[].lm_ctl points at the new one
while phys->hw_ctl still points at the old, so the flush mask is
accumulated on one and triggered on the other.  CTL_FLUSH is written with
zero, so the pipe is not reprogrammed again until the next modeset.

Reassign only when the encoder is reprogrammed too.  Enabling colour
management still needs a modeset, as that is when DSPPs join the topology,
so ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
msm_atomic_check() hack, which forced a modeset both ways, ignored
GAMMA_LUT and overrode allow_modeset behind userspace's back.

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_atomic.c         | 17 +----------------
 2 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2ff0dab33710..048800227ad3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1489,6 +1489,26 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 	return 0;
 }
 
+static bool dpu_crtc_needs_dspp(const struct drm_crtc_state *crtc_state)
+{
+	return crtc_state->ctm || crtc_state->gamma_lut;
+}
+
+static bool dpu_crtc_has_dspp(const struct drm_crtc_state *crtc_state)
+{
+	const struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
+	unsigned int i;
+
+	if (!cstate->num_mixers)
+		return false;
+
+	for (i = 0; i < cstate->num_mixers; i++)
+		if (!cstate->mixers[i].hw_dspp)
+			return false;
+
+	return true;
+}
+
 /**
  * dpu_crtc_check_mode_changed: check if full modeset is required
  * @old_crtc_state:	Previous CRTC state
@@ -1506,6 +1526,11 @@ int dpu_crtc_check_mode_changed(struct drm_crtc_state *old_crtc_state,
 
 	DRM_DEBUG_ATOMIC("%d\n", crtc->base.id);
 
+	/* DSPPs are only reserved during a modeset */
+	if (dpu_crtc_needs_dspp(new_crtc_state) &&
+	    !dpu_crtc_has_dspp(old_crtc_state))
+		new_crtc_state->mode_changed = true;
+
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, new_crtc_state->encoder_mask) {
 		if (dpu_encoder_needs_modeset(drm_enc, new_crtc_state->state))
@@ -1535,8 +1560,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
 
 	/* don't reallocate resources if only ACTIVE has beeen changed */
-	if (crtc_state->mode_changed || crtc_state->connectors_changed ||
-	    crtc_state->color_mgmt_changed) {
+	if (crtc_state->mode_changed || crtc_state->connectors_changed) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index c26b0c7acdfa..db583cee7f98 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -186,22 +186,7 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_kms *kms = priv->kms;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct drm_crtc *crtc;
-	int i, ret = 0;
-
-	/*
-	 * FIXME: stop setting allow_modeset and move this check to the DPU
-	 * driver.
-	 */
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
-				      new_crtc_state, i) {
-		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
-		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
-			new_crtc_state->mode_changed = true;
-			state->allow_modeset = true;
-		}
-	}
+	int ret = 0;
 
 	if (kms && kms->funcs && kms->funcs->check_mode_changed)
 		ret = kms->funcs->check_mode_changed(kms, state);

-- 
2.47.3

