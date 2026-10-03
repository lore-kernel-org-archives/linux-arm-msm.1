Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7350E232395
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987442; cv=none; b=kapZ/rsaF2T4/qQY9b/2ga2IsgiD52aWczqUW7n+MJyberCEVZP3UGjjpHUaGzzyLkxXtz+Frm8MyJap3lot8BlUNxHvtJcc7WvwuZ97q0f+pMd8NLgOdRm8t84hPQtxfB/9vvGdEDlSsy0lfnEeLhvAZNYcnLvEUNFgE7IQ8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987442; c=relaxed/simple;
	bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6HGKpmcNgGlT8bOaEMaSHjQ4OWDEsWc0KeJ5sb5Y8YVEMz5oJVDr6UA+7vgYUSnC3FZwows2mz0Qsd1DnWUR4kMenS16p/UQ2HF97J23u3iPSY1GyEdZpkIA7dVZXX6WKa2WJacgDSMR3Bvf1xWDBn26RVjNnM9GnA3VDdtfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNC5KUgg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVSgB548; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNC5KUgg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVSgB548"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeG2K1504018
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=; b=CNC5KUgg3fx7A0Z7
	+hHpEBvxYuCPWD+0hPdq+4nISUSuTRsjpFas9BZtvfpGvEaMqzAtFb5lV/N6DX8j
	COg2iDsemtuFfteOTUYypEs2u7UBJ6RLEzm5cnEmpyL1SO9N1Ju3sRSeKhMAJl6B
	X2jkUntbbgVN4HEDPFQ9obq0CV4cAk0FQqRC65nb+zfIRfaUzee5Hz5W7ZQS8Zas
	T/JDl+gvZg3ZdM8nM+9Nhsv8QjhEbgC7A+z0FyWkfYw3TkjVglMLA1Jsy+PF6s4G
	J7lmE0+yxEyyNv6HJSh19MeZrNydzCQPUoGYEQCmjt3XbImtNg914TL4oUH+06Q0
	yxE/6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2n2rrd2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so20543885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987435; x=1791592235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=iVSgB548vev1IcEic7yca7r8J6fcve5gPWu2AS7AeOInafl0SuOKG0ukbw/Wb/Ele9
         8ASepQfayVj+KRMOkSpqpWBisfjglGFPU2lrgf60y0c0OSqv38soHTs28yfnBhdQOXrr
         X/NTfnDUim476HmOGZhtAA6X+ssv7VineYler6wTGjkrhNgy3WqM82H7+OFx8wxCmdlh
         QJ6i/1adP9hRkgcCl7prCu2d07tZPGCaoDVvl6MBG7WYOZbkRlxZHz88NQh+UBrwnywp
         V1XJ0xSjlE9t+rTBBQIspcVSRHQ11s/TbiXMICap1iLqkuQog916bWP0omN5epL9iYWL
         G1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987435; x=1791592235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LAeqwoWtFqbSPLKUF9sSDQ0qIlLUHbHNTMbGdBh9Qk=;
        b=LcvlW+htvM1FT/g7SW6ysw+h0U2s/EjIpz0XKOHCJ45M1tFwg88gH7oKlVpZzWpSsJ
         oCAvG+gvJOsZCPjlgAiuchRN/YEZ5sXTPxkQajmV8Onw6Mn9uvpgjLIgRL3hfweebVKZ
         ChY6OHzJIENar2RH88xbgf3xN+6E6Jp1vNuF3d9ie50y9VzAwlnWUPXrABdxqtrg8uWy
         pIy1P4URWVyG+EVSpUUAmr4jdZvb8NEy+TNWxtfkYOwBHzbQAmxwrgKPx4B6ub3sQykb
         9/AkXqVbSDQM2BfVxanDej0JmcRyDRHZxjwLJukxthtm4sFa7yvgj4E72x3lXhW9eDFx
         UrhA==
X-Gm-Message-State: AFuF++mm8Ha9fR8fdO64bYv4u7Tkp9C1GLxLyyKqMk595OR+BrVmjYHT
	qltvceZ3ewXaELhJT41Isd4W4B4WDw1x49cqI7UlBqkxFNxLG5rdnN7UsAnJ9enCPRVa/KrjST8
	fiPLGCQbTH8eMI7KbNaGh/pS+wRK+aocwSNfo1gbcl81uvN9bJpuIle0mVTiZZEEfSNKA
X-Gm-Gg: AYBFou2shtp7KZgTXqOwEFAZIb2H3hVgidO+IoKLoRxrh+5DghIhGbYE0pNkzCxPeTU
	pCfqKz7zn2TquQMLa1ffsusHumD8F9i3braLSeazHDLrBTDnYMy+vZGnZQjCqyr5ej5sKVX6JlQ
	J8wLRa+M+tfHWRYlydCvdGxbyK2/oP8BWS9k6VJJRhjZ1SJKUbORMqrUOj518FBSVZWtZMcUj1z
	hXNID9ZC1u88m1BJ5BXgR0xR8D4w0dBX1TzfyKu4Q2eauuQavgUQxEu3RMFKbLDvt7C3NNWYD32
	/Fbwd3ys97gB27TdfqKQ6ugLG3Gw0SbvkScGBwvrZg6kH01k8xvicbSi1rH0D2ZcFJQwriE0wyJ
	9QefRczmLKWGzozkFroVZy8FxGGK5ckO0p7zgJoADTnK5LwflZQm5+8gpcG5Awp1ytUxogU/d0R
	ySJiA7i2CVDAbD
X-Received: by 2002:a05:620a:7017:b0:93c:6e1d:96af with SMTP id af79cd13be357-93cf18b5676mr821633485a.49.1790987435177;
        Fri, 02 Oct 2026 17:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:93c:6e1d:96af with SMTP id af79cd13be357-93cf18b5676mr821627985a.49.1790987434697;
        Fri, 02 Oct 2026 17:30:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7957d0sm1133979e87.31.2026.10.02.17.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:30:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:30:19 +0300
Subject: [PATCH v4 04/10] drm/msm/mdp5: flush the interface before starting
 the timing engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-fd-kms-fix-smmu-v4-4-2a44d4d8ac77@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GGiCoTigCncSjQExhHlehqh6DW7zeUi0eG81bX9nqSY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEydEynMF+CREcOokKOoCJr7eUmaLWS9JqE6d
 CaNTF0/C52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBMnQAKCRCLPIo+Aiko
 1bsBB/9Usie+QA+ncwjkvmJl7/35DiD3s+wpkPAZT3Sbw3UIiyVxWeJoKeY1D/G2GNtFJu9FrjU
 EAUnso4T3Q9s9V9yKkJg0jhjIG2MUzP7kBo/V9LvPLSWoc2el1kVOMj4+H/LSLxCxP+zbbMPds/
 P7ZAWBh3T+tMLYYNEyPmNTUOo1bUGghVikMSsecG5yIRRyqZuim+GkFdUjLfwdZFPR20pPBdp80
 mwXYk03hTNAy+0Bx3jbadpTGpoVf19cLc5MuwJgpdHkGD2QUUu8Uw/qT81z8FJZEA0NecXA+9Sc
 yvqJKMcz4XJP6quXt5VYbNcyOHuJDks3ud/PZVp9+a6fFVzP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d/VgWhjE c=1 sm=1 tr=0 ts=6ac04cac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=H8EOZ7U-Vh7qnyOv3DwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: X1BR0D5DasjBnvy0GHgbK33Nq7TNV-1_
X-Proofpoint-GUID: X1BR0D5DasjBnvy0GHgbK33Nq7TNV-1_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX2wWrWKHJTtji
 8SQYgJ5Mgn02ILFo2tKDoYIc8y7FtB6/+GK2H3bRtTcXsDwp+b9WTELRYuQWmIkJv4IlnL0nxgr
 MCEijH2L3WY75ahbVGgSWuxOb3qSQOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX2xzyz30ImAhY
 lzwXreic6nxuXXfqqIpO6Rn1QEiPC+Zn7FqdKiKtqi1iBQRTMMnEZp9vW6hXheqIZXk8N42Hny1
 iwjtZoQmI629J00REtxMmGgF5jBwukJbRbR9xsQkHH0pqPXQsYdRmFEeyiaVKPva5KFqUcqEAXx
 tZhRfGP2gbZODuGuzl7CgCs5DjjAUI0AmocZ0jAAPGu9kjv3tPC1Q1dmECJslrgQISwtv3WviSt
 hPqzMrbYrpy0oPYba2WycYOuqvdxi/Xo39KHZOLyVu0/1QMidLe39Jv6Sl5JuFEu+StRQDfOWai
 jsZ2ZQON/18vstTHR/D/Gc+WGm19PGfAqzPCx/jR+lui8+BQicqn7DrmORtqiEs8XSqP9vGrDEN
 X5suVA6pvkXZiLr7MFyo3oJNkp6+ZPc8u1aovYvLAWZ/LnRcb2LvuiJEWM6QObQ+QM5DcRB+2qL
 5VvDDWeVQ7wRVbVSdLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030001

Disabling a CRTC and then enabling it again can produce an SMMU fault on
MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
after kms_atomic:

  arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00

The faulting address is inside the framebuffer that was scanned out
before the disable, which has been released since. The pipes keep that
address latched (CURRENT_SRC0_ADDR still points to the released buffer)
because the plane removal flushed after the timing engine stopped never
takes effect. On the next enable the pipes are programmed and flushed
before the encoder is enabled, but that flush doesn't include the
interface: the encoder enables the timing engine first and only then
flushes the INTF. The first frame is fetched with the latched pipe
configuration, from the released buffer.

Flush the interface before enabling the timing engine, the order used by
both the DPU driver and the downstream mdss driver. With the INTF flush
pending, the whole pending flush takes effect when the timing engine
starts and the first frame is fetched with the new configuration.

Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index eaba3b2d73b5..e9eb1db92775 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -164,10 +164,11 @@ static void mdp5_vid_encoder_enable(struct drm_encoder *encoder)
 	if (WARN_ON(mdp5_encoder->enabled))
 		return;
 
+	/* the pipes fetch the first frame with stale addresses otherwise */
+	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 	spin_lock_irqsave(&mdp5_encoder->intf_lock, flags);
 	mdp5_write(mdp5_kms, REG_MDP5_INTF_TIMING_ENGINE_EN(intfn), 1);
 	spin_unlock_irqrestore(&mdp5_encoder->intf_lock, flags);
-	mdp5_ctl_commit(ctl, pipeline, mdp_ctl_flush_mask_encoder(intf), true);
 
 	mdp5_ctl_set_encoder_state(ctl, pipeline, true);
 

-- 
2.47.3

