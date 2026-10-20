Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529274;
	b=azGTDCTMw9ilPK2Gew15907tBpzecyAdSrs3pyNSfYmGZphKdvah9udzSLmyeoyW6gQA
	 pLOPv7GWJjzdnXfUBLXk2YEdIS/K5A7kVxZJIqapDhQ8l2OY+nTuOr+4YFdBjnZACiGi3
	 OlPB+HglXzb+pl/WrsBPtbaZ2D5HDpGxAqNw1sCSmfBkGHbiXMn/3dFyIlbXhLl/oUoRu
	 1EphKLqLHNNypvchfmj88Syoc7SJ/NrNjrUvTWVlr48zHe8IsSoNwkUjRHuY+Z3JtACl1
	 3ElUqxetFUy4l8B5cMzrszZYe9SiLF7LTsfefF3tueo1oTIzAiv2vStw5mrOY/DmtFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
	b=BZTjnSsRxkaMw1aZsNJtGTOcw55k4h/QWbAEV8X1c6vTy6oxmVWgStxRID4D0I9XEo21
	 riz5xOPcQde1MG+DRNIuVY4Umgoz5YdaQbY5yMnVG5jaYV3O2bvwJ9UEriqW1+T4ci37K
	 Ffr3au4lnea6jR5nd+9E0osBUfc8/fWQtNqWiUBh47YfYxRCPPCdMOSr0+1kPN3zvgFN5
	 QDhYGJDk0i6G5Kq36I//VjwaPFM04OLdLrqKMWPhNXlRw2+OeBWHc/nOhsRMaMljRwps8
	 kJnHmGc6zdq2XDM+cvcI35wOCAOMqGqhbAR9hBUkVKsoudskv1HeDIf2/JaWOmgddcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDd7Wezt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1KQiu7a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4E606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A4E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDd7Wezt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1KQiu7a
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KGtm4L2278796
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q5GkNVNRfPw
	2zEKJCJZ4tInEwatTood77UzHJkknqQ0=; b=GDd7WeztKU3UZnBIFRu1ZuACveS
	4ewjnJv4KN+MFiQZysoLK/tX+PmITOMIx12VKCVPliRitgjuBjvViqGXkhXOOFgx
	Kx937NgaOYnMNf33EYVoceR0CvipZ6xXdQJ+u7wbok937Aq7VzCpIxsZ7wpF6ytI
	+zTGbVX/WtEOqWoHjCGIFtYRYE1nxNMNCJebfVxRw9dl/VBENlcUgmm+kczqsEnK
	V7RvZ8YR+dcNxLcUT7fR2WK9DXdX7IxuTTuaXp+dgRwOWIYUmN88mb1al9LxVCCS
	Dm36ze9r9PyFUb5G9Gx6uH9e9QoOYguzjL63WaKlNB+yQ9HX1jfA2MaHXbg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2a3tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:47:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so78385a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529273; x=1793134073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
        b=N1KQiu7agxlOWfVYL3r6ojmLkRRNL9lzVTUaH2cG3zKeev67N200amCYOtd7p6q6pK
         ZmftlERSlDPAO7EIXRywxD1YC++Fhq5Av60+OVjkAUS8K15cCzXl9ash2TsjBU0neffh
         7ZcSJetA7hHYi0mUED/RFblnmANmLIllXekrEkmHADGE1zQ8/L+k2UeKG6Ya8Dv95NqR
         K90uYtUusKmQ3DgkxIFc047l/hjg7eoRs+JYVBfn0L7EWIGt9gwz51Qeymup8LkjgWni
         ppbg+yj0blEwnybDuMy0472zCjMkRkP342RxJ0CrlmqUs2LyKaU63Nhx1dRBhSdywa9T
         YlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529273; x=1793134073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5GkNVNRfPw2zEKJCJZ4tInEwatTood77UzHJkknqQ0=;
        b=fQIWxYh7DTJiwHSw43KCHUviRWwR7VvksDJH7Oxwm2QEvCmzEgUeS7+3bYZ1JjbMwQ
         bS0VuMER4ch+PvyC03Y37ocpsHBAZDG3h3TnhegpKHusE6Wpfj5oor0zHDzLykDwjLBU
         Zq3HA6Uw4s+kGsrtajZ0nNWHVhAMW8o+YoYfHy9INHkrqxVYiRKf0M79eXiBzxhbhV3n
         sE4qtWoJ4KWt+UhG63QnTafiHew6OYFwlH/SDrovEhnBw/clDObLRKJECQhEkZrf8Yb3
         ykRSZ65/Cup3GrahCv5f5FyynTlvUOqotbBni8aNvLLdvUfJlOHduuQl4VcpoDN7zgdR
         HPpw==
X-Gm-Message-State: AFq9FYKAX7Up78zP5MAkbwYcn/jCIbGyAshblYgvZO9d1zPWBESaMxBu
	kaAWIVAwJqhZYBAaLTjm681TSMrJfU3y7ADKfNw/xqllerV9eIsqF3UKhxlXD3Vqs2nUqRAwsTV
	Yir0WmBwTTVSeIggi5iAYQmIJ/xL9nYJemEMJU0cHmWYmiOipKbEbNw330miCc/CNHfH9
X-Gm-Gg: AYBFou02T0a72yFOdpVCu7u7Ub/7rXWJVBO0vDit/0dFBW6Z0uNd4yWz8M0oE8fJ9XO
	hgBsDEzzlp5J96QKxn+uw4i29yJzeQ0E3Ta6lsvkK94JEMYuXI37rkSMsIMFvlV3sEe6nL7roX1
	kIjk7dM8jQWqgdixPvFQlH4iUhwkPxsis9AbdsDKfCAoGU6y3ZAUHV+DMDLP/6dckaMOLeiWgjE
	xQHd6YStntiGR31pLDNexFm8cJxSefn+qUCEJzAttvH8caqKGguwn9uvoFjFO13QmCNYOVyT0RY
	5xTiZFWQruP61Cy8umSI1gWzTCQS8m/5V+VJSyBZhn9YHvERIL/jH2NBENPHcwLrDc0xVCVnwgH
	6pResJt4+Zexa1NuryQb85JxNvzV6pxazQtDRbkZOt+vJrtCnyQ==
X-Received: by 2002:a17:90b:2683:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ad86d1d122mr98436a91.20.1792529272771;
        Tue, 20 Oct 2026 13:47:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2683:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3ad86d1d122mr98424a91.20.1792529272304;
        Tue, 20 Oct 2026 13:47:52 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035c42fsm1003438a91.17.2026.10.20.13.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 04/12] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Tue, 20 Oct 2026 13:46:18 -0700
Message-ID: <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: AdSzU16UOx_IfE2_wwjiM749Q94UfbKV
X-Proofpoint-ORIG-GUID: AdSzU16UOx_IfE2_wwjiM749Q94UfbKV
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7d379 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfXzZeGRb10KU2z
 lwHvsmb394KXKoQQOwsnR6Xly3854RnTwnZIDhmksfPbEjaM3aOyBY7YsxgdO1wE1ezTCW7T+Mj
 /pIt03VkP2nVe1roxCkeBg/C3f9Uhhg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX52Qi5AxK75oP
 +HsWKQOeik0D+bowxiN0k9syE1jThPBhE7VawEglDK1o/5HISyRr4sF5TMNA7QhZa5gacWU7JT0
 f/SG/ehstuiqVEPTz0miAsyk8erflvWXRN4CQF6kuumCifUEXFOIC3GFHra7mgCkQvTJZX8Ptl3
 kYyQRwYXWQ4nECWS48dhZyQ1H+jr35U+osYlloxPsHuezHZ/JRfys9F3cd2FYAHXLriwwLJabNn
 +xhImWgkZ8WlHR7qxYP0ycQTd9+nSSsCdx5CrQSAWSOWDmeGrOoiMrUyCdQFIHNLv+CDwJFTmUC
 HVnntVRgFRzERaU4AKH+rXvePW+exslfg6C1/kaStEJGPRwQLN9XwMlXQ7rYjwX7YS+gGq6x6hJ
 NtsyGti8xIa5HtMr6aCRjEr/bNBDnOTL0uq+mnf0OYj4H/W43gt0oYUutn8Q/rJ599Cvyu+2czR
 bKntE/xZWreecZzKG5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200082

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 72c84f73157a..3e22ef788f2d 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -376,6 +376,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -395,7 +396,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
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

