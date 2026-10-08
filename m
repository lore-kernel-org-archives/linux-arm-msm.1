Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE1E388E62
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480270; cv=none; b=TrbzgmrFNYxcH38QTbdINF+Gj78Js9+yOSL+krDq9/FnZm+AOx9/h1Vw/LeKrC5UpCezfgIYulPIisUFe3vj5tuIbhLciNv8c++U+/biQqZe6HCQSHOhPUncfNC2HhPedGu+SctuUhBeTskHqVXgWKlnzh9v6nDlQ2wx6tnX7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480270; c=relaxed/simple;
	bh=Ci/PS665BjdBcch+dOPxtPE8vGyH3+My6ZiyIbuOWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyVbmGxlq5uCdCOmyB8SjCWpNCgHZIv5macOXbNSlHKE/J1GJBR7Jyn9kRSnuSVTOqihd4g9NhC2UaT0XTTmjWk/TsTyWsIB1fD/Pu8kYJq3BpbTH7c7HDeOmM7S9WSgUq+eOGkElIo43EfeDih4CsLOud7e7LeoNlRYNwTfL1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NC3A8YCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLjSqgJO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NC3A8YCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLjSqgJO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698GKBkA3881404
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 17:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=; b=NC3A8YCyLUwbUwI4
	OTYH/fYsZPPA4IeWRF2Fvy6yVjVw/SARYGnqWItooJ0QN105ZZScruekYx995NCY
	uzQ7u8j5yFBaeTd/YyHTwTko1KtQkqjgoo1djga6VPf4VYtM+EyoZXq33Bcm8T7K
	sfLU3ElgJTClEZkXgUo/sOReyqusrGYIB5TkOatxAQHVbiVEimRBrW+YumK1aqqb
	+z/5wJpEeTez1xZ2mg6jXX5WL1jd3RVxI9WqUEZLFQj+6zrfhaX7qZS0sgfDfbS1
	nHShDDVhECkJoMHAf6uAumllL6G1UdkF4PVbYD/+elQ4gNPfR4T3mwXau19YwWSQ
	BEJbrg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekv8866-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 17:24:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so6562171a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480267; x=1792085067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=;
        b=jLjSqgJOzl1VipMhJvwqHADsgQ6rSUxDAObFBFANcm2g6lgzZAz2sFGRb8q19pqUSR
         VAW3QRkxw0JYGFgH88teW4y3UDvsplCOwbUdUarFT/dyA7PdNouXMufJbBH5uAKLk/2F
         Bbfn96FhmAOIDbFzwPLLbGkGZgx0WH9qFqcn+GSmCSsM9MvMghT5KG4JjSYZnaNLuTBx
         Itx/XkRqTEv/17avhNCrUgJGTlJF+xjoU16pSdp8MdAy1fsOaiMmruKndfTQCgUpQSES
         DihXX7D7ZPwQWqjLtbvRxu2kRC/QsIKvQYZyK4r/ErJBYxi7dThF/TwERTYWP2l/PVGd
         AGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480267; x=1792085067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9gMdQZVtWrLDREFa3RZVdqt7+njT5mKnVjO2LPMX90=;
        b=Q0j5lflXB5WmhTRrflcKSet/pX+IGxgVjQ8+F+c46y8T2FIwCbmf8v63t2I+j097m4
         szWHQU0WjEEtqH20Zo/v4ox6FmviNW7iAHhd9vemyOSr0QJgeMShbYH1a8iCEpKZZM14
         pjcLrqJZ15Odve9MWktLosNWUzLYM0kD0O0cA0tly3IN5OxxZb+AYn7DQZ4jtIfoyalw
         J/ueQHbakqdGrTmetJZgX+buI/4M+PvcoCmCZbs7IBD+N2DAze/F9i//a3vrqxh3OLf0
         VwzV70KNeaDhymiQksNwajfRr26BLNOYpeUciZPhymCrD5BgZCE6B12UXZNi1ZWO51P+
         A/bA==
X-Gm-Message-State: AFq9FYKLgL6I9/8rRf7g2JjW/a4WBatspgfTh26OxG6CbffSdftaBbJP
	cJGoVQGfSJ+BMMJwCt28z3RRa6OYadwpxTjCXCluYNrkA26BqjytgxFRGmUBdJbfM1+nCPSN8nN
	l69EY9qTNNMrquc63VAhQRKmQPz7WpKg7730DD0UEWg7u6LkzkcQCAPjWlQEsdlHik3A2
X-Gm-Gg: AYBFou12omb6mKQ4lNuYaQgdgG5q1J+7/G7nJneBuoajdYsh2c9Ag6Xa5d5lZsUWv7R
	n6rmElbCDHPySYGI+Z2KfCPr5vlpkAWYxABsSIxhsGaEw2h7dr4O4Zzhojjy0Te1jaHyVU/9qEG
	GHluCttOYbJ8F7W43vZIHRv11qLHZ9dmiz4GzxXhudNqws3hrku+SQ0PcxrCzgDUEbmdJZDLu+B
	D878tVEivRl030/CGcv/lhbirgD/Vx9dnV8ypFwaVdCSuhuRzp/tc1F7CgosNRUO0Fz8M/nEBYV
	mutTD2SjDmNdd8PN/SlkoBlKyzJpDsbxRjvhmwcIKUZcGRVOmSIx/mTYWe5/cYHUucxrsgZYKXM
	I7UTj/crcoKTpkcV6dda2sW7RJA==
X-Received: by 2002:a17:90b:57ef:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a8a0851600mr5697323a91.20.1791480266386;
        Thu, 08 Oct 2026 10:24:26 -0700 (PDT)
X-Received: by 2002:a17:90b:57ef:b0:3a0:a259:c67d with SMTP id 98e67ed59e1d1-3a8a0851600mr5697293a91.20.1791480265927;
        Thu, 08 Oct 2026 10:24:25 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:25 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:48 +0530
Subject: [PATCH v4 2/6] drm/msm/dpu: do not assume a merged datapath when
 validating mode clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-2-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=1410;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=Ci/PS665BjdBcch+dOPxtPE8vGyH3+My6ZiyIbuOWgM=;
 b=z8HH9Ia4oPJR2+l5VABIXCPrBwXDiAx5379BwT+dX7sr3efswNq0FhG5+k5B1GBrj9nTfgpZA
 Zb0DkZ0uih9C5ryuP63VX3vpsk9SRJtHT2G1G5I3CznmQO1mnNxbWHt
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: MDkWW19NHc-LJIQ5PysezM2sFcAChgNm
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac7d1cc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nDKeDdROtNiGmcSYc70A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX88/em8w0sxcl
 dwZHtFt8DvFEHu94O8HpAHSrL7QIgcxO+CqVI3NxNEAeG8dd5OcuvUH7LmOkEMqP9CiXfXv4zom
 OWoPpoUnCpbp21U1ryxgeQVhaZZm0fTF+jXH+G4VAs3vP+mdwbOZpL4m9TU0reywMgwabamzt/a
 55MWNZOtMSBUVy5HfEZfX196vngQCgtQgTcoBOJx0+P0llRkKlcaj1HmZgR9hTHZTVysteecikC
 oz7smS6DCePNHtCNT7WwErutXsOKvkNrFzJO/IFe17mGlLETubUAa6sNNzdi1W/WYY6zZREcyDp
 LUe8ONvZfjS2b8/tbkeXT29SRq3ZlJWIz45M1OOslcfD8NRO7n1BSSUKVUqxBRzwL6d7O0wT1BZ
 GygsPJyz70H7/G6dZiwOl20fK6ojEY262F/WgGszjYvkeGqVcGAVYRenswIRxhDMIeVtnDVj9vA
 qLloOPgAS7S1UgKztPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXz/FuivTA90Ku
 gPiaU02HnCgMNK6FnUNxdoKxlymG53jrdeE0aitRHckcAexqXJnpcB1wdcGn9mXePfPAc5a4+ty
 3PNqr+t+9iG2Pej8sjMAV0glGAwKlko=
X-Proofpoint-GUID: MDkWW19NHc-LJIQ5PysezM2sFcAChgNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

dpu_crtc_mode_valid() halves the adjusted mode clock whenever the
hardware has a 3d_mux block, assuming the mode will be driven by two
layer mixers. Modes no wider than MAX_HDISPLAY_SPLIT are driven by a
single mixer, so for those the check permits twice the pixel rate the
datapath can sustain.

Divide by the mixer count the mode will really be driven by, as reported
by dpu_crtc_num_lm_for_mode(). Split modes still get the halved rate,
single mixer modes are held to what one mixer sustains, and parts
without a 3d_mux divide by one.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0b51a4c5db57..209b25dbeb6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1631,8 +1631,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
 							    dpu_kms->perf.perf_cfg);
 
-	if (dpu_kms->catalog->caps->has_3d_merge)
-		adjusted_mode_clk /= 2;
+	adjusted_mode_clk /= dpu_crtc_num_lm_for_mode(dpu_kms, mode);
 
 	/*
 	 * The given mode, adjusted for the perf clock factor, should not exceed

-- 
2.34.1

