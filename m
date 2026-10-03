Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E426A0A7
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987443; cv=none; b=WKqMvZx3w6jFNWjIOFuarVJEyKJzUHWYnKGEIReqQP9iKG5qIXRRZGFpbU/+qr/R5nDRsjg0nCuu+3VrFE6TeBbior0veAQJ56g91v7nPZsfxy9L2mcJ9Cs62bhYVZDVKmPpIhZb3IO9GbzrFcLsRvLLpA9E2v1yNMrtbBbERZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987443; c=relaxed/simple;
	bh=7+lwU5rXGQZC4vRul2fWqdbsN1B1VCF9Ap1oW/StXpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrmRzrodl0xk9eXCoRowCqsT1+LiYIuoWUiQlqUf2MbiljjG3VQ9CW+bomg/t3LdhGW0Ey2XWb5wcQIEPNoOe0SAiBr/MDTH2ZjnhDIeBJLEaMxEsxijETLw3sy8T3zgBTBRPyTvrpdWnLEJpm8Ms8oK4w9OklZy8iN8XNXHobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+ejAjoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRsrC892; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+ejAjoc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRsrC892"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NdwkA3883819
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHO1R0BGEddeIvFPLIyMAV9UF/O1N3RpMgj2RHjLQ04=; b=Y+ejAjocicWrPsHy
	rdMq8xkt4a/8XiuBzZEv1alTpLzGw8gADqRj2L0O4VDPztWeG/pZXrpjRKxHq2SP
	0yPfF7Y50PTmpjSQ+Bv6VCmhI8//wbab4jJALMQryGMtX8BRsymhNTEu6j4z7UN8
	1Z6TcD3F32GsKPle+jkTeEyyCOGs2MImzGlxeLr8mWRN5N5j/lJR7Szw/AnNx/yQ
	HVMWVDZGShyABxQnoW5GNBaVj9seaLnTCkeHOXE9kSqno/a9fC/umJgdDaxFIAIG
	QIChBlT+MuDL1BAPZdpfZiRctFAKpyqQ8mngnMMv5gWgUNdqVeHnL6cVlKtlmbpd
	9mICNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp40ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca4a2b9c4so27035185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987437; x=1791592237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHO1R0BGEddeIvFPLIyMAV9UF/O1N3RpMgj2RHjLQ04=;
        b=QRsrC892rSiefHVOL+oy1lHmfwZgzizwHOZAA6E5UqE9viesayMGjGWrOkdnykHukv
         witql6yuh2+YNTqe3EF0gla8jqkd3jfiw5BmYHukEDDtNrMv8JVo9xAZxkoncIEilEwp
         Hda2k4hwfDDOG2cRj6f//URpnkHT3b+Nrqr+Y0dyxnR4+kVNyRBpzzNEXjuHbun5cKr8
         aoJPMenAcBbF8s7A2/UahRF3rxjRHi01ujcZwft4quffVzFukL8Z9KlvOORdAv0FdFln
         RONwWecgQS/wUyIB4FWC0UWyr0sSRFlU0Jz8Ag1WoiqioWjMQUD55A0CMPV1YLdQ4NQk
         6axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987437; x=1791592237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHO1R0BGEddeIvFPLIyMAV9UF/O1N3RpMgj2RHjLQ04=;
        b=ZbTSGC+jljsqKKzueGgwNuKBI5GLNIDocmcy9dwUEYqMZxSdpSzOLeegKvWqssDdK+
         I2g0mafC++hfM1hoyVYYnrM+Q8jV3hnUJuXFfUxhGvarBKrWeDYvIs5SfYIJ7t2tFCDq
         djw0OUfSUljSJAwftBeekRmCkh2LDI/wL2OSCOacc4R9O3Xe13/KsptWqaR/5TVWfud5
         +gi5/RfCtICcBTXkXUgd40k/lG+zTPUbXfCnwIMOkZkiomre+40+cN1hjZGoLCYcA+SM
         1gTXwKlLImr48EblqTHxAR8uOBS1l3Nq8NfQgAtxHh17qiy9Zbdwcg3ew9CujqzCpNJx
         yV8Q==
X-Gm-Message-State: AFuF++mLBxJC7cPj14A1KQLdc9iVJ0CoxQEW3WioxWN34tZyCy14b9JE
	Q0qYfg9ezcRrj42FEDL4PDYLWk2saEGH5zzzLxX99ppYYZG2UhRY0eZkA5Zl3L+Ig41dyqkZLjG
	K+J0rgh2qY9249eN5V595cQe1Pvtxel9dxrwZXH8k9xe2SyoZtFilQOmBsRF/EARc+PrL
X-Gm-Gg: AYBFou0g7Wk6rtjfxwtXltZ2OcmF5KbyByoa6u1W9rr/Iz+GU0esIMTlwlU6GK84J9P
	Nwm8A5oGVLPgsSUZidqiVy00nSoH2RqRBMtN2JMdFvFjgZcblBPdM3wt6fQMGRCWS6I/FOT0j4G
	i+JJl8LCQzVZhwAUpKQdLznwm/DAGuYmXD2naAadcNNOfHcuHguG9L8fQ7kUi70Eo+J2mJE3cCe
	b+7i4RNpYwtbip4+NclsSwpryF8zy6g767BOui8Ysj3OBHveK3bvP47mFkzTSgA+Ko9Qa9FNW9d
	njGvQt18RNArfpqVaIEh5gNSFrE7trwvIR8eezsGmm9+UxvPVdsrVtU8T/Y71cIREOJEsxl5FdD
	1hsZZFkSK/mAhXayep1gQBr4wcqn/Ri4ueh7IdYnlfxbGQYigqinPahgBVnk45jpHyci+vtBFS7
	Ubn31XVjoYXngl
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr210356685a.30.1790987436606;
        Fri, 02 Oct 2026 17:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:93a:2e8:5afa with SMTP id af79cd13be357-93e50feb9ccmr210352785a.30.1790987436133;
        Fri, 02 Oct 2026 17:30:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:20 +0300
Subject: [PATCH v4 05/10] drm/msm/dpu: clear the CWB blocks left by a
 previous reservation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-5-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7+lwU5rXGQZC4vRul2fWqdbsN1B1VCF9Ap1oW/StXpI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEye/r3W5tyhm7AAlUZKHkHPqB9uxUnur430b
 2CyoTie4ICJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMngAKCRCLPIo+Aiko
 1RRzB/47TJrjfGg1sBHCy1T3RHniccw8kMnCzrpeVi3Tw/bAp6/3+KwwAuXxcYMTE6aZG4X4Pcr
 Ff+QML+svqKaTqGb8caZstZDQoQOfNjtyKifmkh5MsMreuN2hyaUYZCc1x3pMdNujbld1v28LPI
 8fWz6GeReaiNxnWUT8IXAFZUHee1rDQ0C12lxk8s+jbYZN+WJCF1TX0ikwI70J4a8JDqvD4p6Kr
 lgBS4kWfbIK/RaSiPmEzxyX1/ZBrlWzpeYzDyANcpU69F9y0VS7vrWZBwOrrO4a5XZJVRfXk+Nj
 IFnfA0IYQPkQxrL/pdtVSJcE11aUvm6QDpFYks0ZPJ8Izfgj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04cad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=00kiT5jbeo-7mEmJU9cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 7iCqVXpw7DAqicLwDwszmsrUbyk06b6W
X-Proofpoint-ORIG-GUID: 7iCqVXpw7DAqicLwDwszmsrUbyk06b6W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX7QJ37NTVshz/
 //s2PcsO6/1z+9jyY3NvXsgrf175cNqnsMhCqXjwcXGmvt5c2mCLiOlk3eQ0DaZkVr+OPMPvjL6
 NiHZ4iphpvADSavnW7GlcVqQBwTaQLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX/b3+pRRyzIlt
 QakGeWvdt8V0fFZazJjd1ugCScEElv92q82bYrleH/AQ7OZvZ03R1pWz0NBaH/KICId5PWhFk6v
 jK2DoyWyxSWDTQYFa5jP4rctQvDOyT5h0ho/73tAIvNMvlbIftS8vqmU85UWWuO98TLS3dJrWL9
 pBwMh35EiUcdNIfDoLnuQ/25uPiahRiiLdIq9Nw3Y+ubjzi8oktvFO+xrlhjhOFZqnZsI5jN9z7
 scyA6X3VGbMqu9MoAcWoJxBQYbZ8wNWpIByxQ7ETxNht73naXxT+cVm/y6oNuTAjdSWsIkQTrUY
 hSU6PxJ3DbtNchIpRQf/lujzxnSpW+goEb1zdDKXPhNCSi+KXdBN1i2GAlZV28uZzOzg6wpn83e
 eVnaCkjCDr3enStFxujUDbghe8Mio6AYrrzff6t0XzgzupPgzcsFuMlTwrB3fD4Z4mjhlCoGfJO
 dKQS6io0mJutjXaeWzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

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
index 1f20695f81e3..f06b52579740 100644
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

