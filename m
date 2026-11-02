Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657074;
	b=znUV6KvAajb2c8lkT0mQYCjye9hUUMhXDBFYQGO/wznQONbm+47ObPreGDWqw/136bKL
	 j0zxRbup/Jg2m7I3NiwiWMr6HhkvIna5fl5QnQGKOXCfFH/gigSTdkiYys7XXnphwJjSj
	 fzUFWp4198AbbAUs2TsertVPMVrTyUyTYQU+v7Msa2a7VTdV+e2uC/s/s2gVUlLZ29ANA
	 h4z4IIURMN1fAvN8avQjAFyTyF70QJuk71PpQmESsweK6VcE2oJdHlcPEM8bF+EK9BXF9
	 bEFfHSKX7FtSFrrngPyuqYAtmyPLWlMHkQLki3Dby1d7x8EjXF0jrX2dZpaRueoOhjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
	b=Vo5Qo+Y1emP5SMhRlkRWe6ByzvkOcPxAseukmib1mcMAUFr1Tt9BQd0bCTtTRgByKmZC
	 L0FqT4V9w5Y+qOCvrjB4DRgmwpTvZVXWFDCMnIQwZscOtbO0U1Tww2dmg8c9F6BGGRGzK
	 xmRAmSh9zQ6iuKasVjSs3g3Lw/3GTPztQm6S0m+yAaghGgwghqiB9K9eNnLFOCvbHECgr
	 HURv7K+O65HnQsYdkfLOtkq3dThnmeDTwwcdg5Ya+tx6Y/oZE0n9iLUERS9dVmJAPxTEc
	 rS8NjUYnhr9ovwu4onvpaa7gw5d0loRdJ29I2Yf6DEk8rec5Wrpxj8WkDeRT2DBzD4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3vt6U8H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wl6GJHOa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156F606D810
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9156F606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3vt6U8H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wl6GJHOa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6EGB166120
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7iwNbSoHb/p
	clbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=; b=U3vt6U8Hpxaew0pjCKdmIopp8+Y
	jlIZNIX5Qg4I8Rls0iF/euhoEFTs/FmFPg9lqyXZPsTdp0KqObEhp+zJGdzLOXtR
	BYkxJwCwcq+DVVfLtMdXWK4KDOVzxb5RnJnaOYX5zEDq70eidltHtXBonKp8T2yH
	oG5aIXy+DSGqbx6CDE6PB9et+M53gaBfHjqUwW93Z3W6L5t52EP1hYgdCpSq+cB6
	vTFS6LvtrX1yRDCEElYuIjm7/UUh/1ASdbYRJN08+XS2+9MpwDN1G2lf/gwRfkF9
	vw2mvz+doEGGYl41j30F+7gFYwTAfYjcAmUT8eNc4Xs0XYzJkFZjQlgRAUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrk4h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea63087d79so32637095ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657072; x=1794261872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
        b=Wl6GJHOa+wUPL9B0mzXlNO/0qEggVsUPZB4VeEwILbv5vnNKlGVJ9uIquLeru8lJ/v
         Z/oSRyFGHY/X1TlFfiVWe8S6n5HjQp14eEtBoffoYfjU6po2oyPQqae7UYUkCNNenOeY
         11zkLpVd8fqR8jwk02YMpx+NqnRBl8Q/9TV4vgjDQ20o7x8ezK1PAT0lZ4Qxqj1bH8pH
         htJSqzVwtfbAfTe6AxPQ++CjA9+ORcpQAwT3LdDz3qqaZA3Fwfd9KmtciMK6jsHurA7P
         FnqjteMNJkNDWMvvhQuWi2UqtsZN1dHIXMFxWkw/V2fsQXmDnF0e0msk8cbWd72/7tmB
         P7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657072; x=1794261872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iwNbSoHb/pclbGXpf3RwdIP2L7rr7UMQVm34GUYTjc=;
        b=nJ9fFu+ALLf1C024X13nodz6Wblnuqm6Zev4NpkeRZYe4H7U94/Ink+BskfjcT3W3e
         5ED2W6Ns32ERBt40g2CSEhpaQC9BYBPZu0shVm1oVm6N24iDg3SlrTQ0Y6Wa58/EC+CK
         59PAiDt4NZkDZK13QEBozZhDnP8/ydzevNesUXGib2muUB35uu5DrC9hboiZZfKNiYMY
         blLSX1W0a26mxpMYmijY4JZnbTXcs7kluMX7HmPKu4ub8og/AozrH0aUOAghI4Lq6kT/
         t4t4E+/zvq28FBlfXB9kdDOd0sv3M25eQnsqJ8bYIXwCR49Bf66kATh80lqV7MN7HIcL
         D0cg==
X-Gm-Message-State: APuU4Z+U7fq7be3QxQW2sQuhZg7R+mzMk9qn6x5etkR1qNkLkGkLQaez
	AvdxboePrxMg5XddDd+tQBjd4gHG7ak2DcEEqpZ+YYRwLAdV43AATpBY9Tbhg/SAQrWh6XSbxTH
	Zlybdxcxrq3Zr2l/quu3fbAb3jwrD8sUL9Orx/erbDmsozXvlFAPWlj+OnR4yIZBQieD2
X-Gm-Gg: AYBFou3pHjC/1/DNpRMbUvtZEaT59mJaWYJQfRV07zWDcXqvWFPmIS6vF0lm7dOgGAd
	gz8kVLqLAs/tjbE8xMVNymgQ0769p9GiokbQY+5ZkVbdiU40dIqSNKHdjfaVtvu89BqI+uTMsSU
	OJPDQrlA+DovFMIZTMpjZsV/NX0mUy464QHN/I/6JH0G3dO3+vKYLRt+pLrK6uVbZxIijETsVpK
	11P02RyPZgAf6M4sNdgnBdUWg4BT1XK3JTFSxWSXWf3iG5sUUe2ZO0AB6XD1SeYoLY9ypMR/MnE
	/XWzaBsKFh2bV4+waLezwayfY+125mOpMJsU9CFH94uyJqyCDJpT1rDXe1IAb9owAl9HUxDAo1u
	7vipkrac4eheoB6rxMT7wFrzIccq/PbHXsPmf1GwmjI+MdCcmbPGIZcH++NJNH3KbMim4O0AlRa
	OY6Z6icpS19CrfMBU/szv6Cl4=
X-Received: by 2002:a17:902:cccc:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb364a0091mr102594325ad.31.1793657072085;
        Mon, 02 Nov 2026 14:04:32 -0800 (PST)
X-Received: by 2002:a17:902:cccc:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb364a0091mr102594175ad.31.1793657071621;
        Mon, 02 Nov 2026 14:04:31 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3928104asm32390475ad.53.2026.11.02.14.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:30 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 06/15] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Mon,  2 Nov 2026 14:02:50 -0800
Message-ID: <20261102220405.30730-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae908f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Ra207UZfT6zjLt7im8i1d9jOoXOD45ss
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX3qQODJCpf6QT
 RZNiGbkHZSe3JL4HwI+wQHimHzygZcTuBu3ldgCysABV3dKLJkr6OFTWp8GcSCWr+CXXVEhBYjY
 q8Ety+1zQ07dDrv90uGzYQmzwpfErLQ=
X-Proofpoint-ORIG-GUID: Ra207UZfT6zjLt7im8i1d9jOoXOD45ss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX/v8gmG509zR4
 BkylX9KvzWOXNTUxSEQF2VvR0vEw6/QnLQcFQHo3iPKxsUSnWv0qTxroWZ0QVKWnMui4epivmgG
 NhXdToF4adNkYD9UzeRExNRV1y2LnsrrZxT3pDuo/op9Xy8JTKMzU+8NptjhAisawoFtiop3BkO
 UisSU7yhdeK9zKBgnxnovlV9WGOFu6Wk9O7GpHSxbQ8StsePbpiSaX9vZTpZM7GzLPJ6oh7Lb3Y
 FZpEvz5pY1oVBs2ymECCsvYlO80rK2979VW2Kt0LICryIQPsZUL3MFr23vSgxYZ4lU0PM/IPiLV
 jSPS5LU/DNF87gMYmYZ/Ui9QiW64iE2V/sjTKsgdQJq6Yw4hTk22P6otebqSWgwXhy1IsWv4l+e
 Len8+2qT4YjNggwK271ga4HasVm4U2aJn4rxt9WDIp6c4AVPHfvCW1GkM1nymnJLl76Iz/fp9eG
 Bzfm6V4/Z1tMe+mvAng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020087

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6b299bf1000f..59546fc636cd 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

