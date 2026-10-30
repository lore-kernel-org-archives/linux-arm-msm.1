Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395188;
	b=vnwkd6z/45vsefFR0N3blytt/sQIA9tT7/7kA/qVzm4wD6kBpJxvjCPkyJCnPrX4fcC8
	 x2qs3OBojMVd7SBUKLJPB5ZJrieLCv1jTZz+Yko+5a82324y0uFro8ejqEIDf0KAGXyEa
	 qrWaLvQeuPhGDxwjiWgUWY+u8SY69tH81epIOlWyO/ePv1ia0tQaXcn1F89xQx0uRck5Q
	 S35ssgAi1sFyZcVP1Q5+L7XSWybg9jn+UoBDLXoS9gTryc9HtN3O5oXwmSGXwEDSzB6ld
	 iVqwoUuXKwm24j31wOG3jqVsInsnm/VPaX96AIEhqz+qHSX/K49/hT4h0aH1Q8xPu1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
	b=kIiVEBmvHSYcPzb2QVa6dj93hZhymw64MhSb7xOPjDQjuEwsl3SPff7dL02MvsTtTrrH
	 NlYlQixEDV3y4B1K4L6ZiWK6EgDPtLpj57wzr5nGkuYyUMcrmUV/DpBPa2U7Gk31IO7vC
	 bJuy4EDU6k8WLYp8qi0AWkdcaS7K82Byp16py1qvpmGv2ctSdm1DRAoqFyVAHb5DJKupB
	 X+PT+0O6j6Z3OEXGuu1NeDHWpczdsx99DxGKD0eBtXi1NfnNKUSXnXyIJ+91fXR5nUDv0
	 gIIA7GAGYTxVgbLkxrXq8gNNyz1O4QhSi5fMfgCehZV5tcmoktFIvr54CZ++IbBi/gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JW2Y/oK5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CswBJWPt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3B60A3808
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA3B60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JW2Y/oK5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CswBJWPt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULCWcj239250
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=evggxsHhN2a
	TRopkjxRADAhNYxlfnJlOA46wMGwegEE=; b=JW2Y/oK5HibHJP3bOd0oQuPvvPp
	JHiwzxsd9Za4rLwLwyUjvAQJx0bQ2++SUuPE4VeG6B2JP5xncZRS9+E2BkqRXpMN
	53YLXcz5gv/eLLAYRDDTap4ylUT7CPoc5YuqyiDf5AliLquEpnKa4N1iYlG9D5CE
	AjAojaGNjwOoyN9c30rmOuRE95ud8HAMJnuE9ps8RtLQRhA+OOc8MsXd7oudE8UU
	GUKnMgF1jEwf0f1lWD/HObs2Xxaor/TaLQyXcK1tbvidLsPYp83wdkFETzyVsqVK
	hucFrdi8v+M5UPyxz934b5jHXaEobG8mGBfzToxKvbT0/Tyc0/J2v3179PA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x001b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6532dbd7bso736981a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395186; x=1793999986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
        b=CswBJWPtLeN+shHzV6TInLugBObGvLW6j1qz3kU1tXsANBSXhHqHyZPuSSeLi9Xro9
         6LJfFdRkhcN+3yr14pxYst27XKsKgr4XljsAcuZvHYEoE+6qGVtdh8AgBliGHa1beyGa
         8iaVKYOkFhRDowPhpDp1YHhyARYRJocc+QECl59AN4VTaDOpIZs8jFmmLklQ36z+GNqd
         DOU7OkXi/jyD35Bfvt3EqtGcCLcoWKcQBB29UpWy4Fbf1zHlGwi8I1rGR6nJgeHtAEPn
         ZuKAD6fvdKVIkOKWtbOz73t085F5640vQd0EOuEnaYdST2k8F0qiOCd9yLalhfRAEygH
         q/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395186; x=1793999986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
        b=EP6mnA5IjR3Un4AvGcwu3z0urY3CVE0OkwOjjlxlT/C72QDjPg2bNpgjLw6g/8AqRZ
         AXREfRdyKkU3UNrVjI0dnwMMet0q9Y+x/ikKCbZv5T6IrLlXPLIb0utSTcfCaueAM0j8
         NJMiXf15m8JjUR7NMBHWS3fImgN4bGPZDuq+REWC1OsRmb/+1vjcceBjEhiUysfUZBQb
         RYMmnqE3BmLv8ONYqCtpIWMF0e+Ck3SPdN6rzSL0jqsPGEreQBdR0ajSpQZloPxeJliB
         xdOUGl+PdhGGqO3xnWyebs4IG8ZPS83VgZLCME+z5Mdy1Tw5oiMIXxylE3zqx1K1eocD
         2M0Q==
X-Gm-Message-State: AFq9FYLucou646hnp5d1kiWB2EHJR5FNUOpRrkzKUH1AZ+mRfA5Sbhrp
	RA0gCSbm74bYJTNHUkEvdMbyW0N7SXZCGPm73fgOd1olH0RP7D9jXksfJ9L7Hs3KEWJtsvrDco/
	UEYcKQA/RP/qS9iMe4jk4HB+UMok5K8j27KD/l7QwKjyGv+tM3iGVVGPaqjek36vo0kAe
X-Gm-Gg: AYBFou2KtHfKD291mXoKFSXfSGTlJXEp0vESgGI78uI2rCQ+02BzBTPpVQcP0LonFiy
	dSSTTbIZmxIYMhPjppcETKAkCnVwQ1bYWmRhKswqVxX7j+2meBCZTZvovBZvLIEr+4AJKi9uevd
	/2C2S7XjiNFL3xEOPhJbU1fQrgvfrlPNSxDmK8F5F34ouRQxv819HwkfHTn1Jm63dBX3H74Psmr
	k2rsL78UdqSbz82y6TMH+KKKQeeXMt+JYkJ3idzTVSF0VaZt0EgJ4+VzrGh+l5ZgPi5XnQEHCA0
	ydSx1pb8Nv5MgXHQjBMM4jLO69cPyCguumXrR6AOinXFF0yqgN98jwbqcsTNKSMO5gsGsrWlMt6
	Esf/yBD9D7F0D2iP7DuFB3kIPIEUYEzvxRUp1Tf+QgsO1pwSh50xUWeUZIJBOR3O9c5kJJwKOvq
	DOIO0KcJnpHwlIUQ2PsU4fN8w=
X-Received: by 2002:a05:6a20:e20f:b0:3e2:ae03:b299 with SMTP id adf61e73a8af0-3e928f72ab7mr3093708637.34.1793395186433;
        Fri, 30 Oct 2026 14:19:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:e20f:b0:3e2:ae03:b299 with SMTP id adf61e73a8af0-3e928f72ab7mr3093677637.34.1793395185999;
        Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9638149sm414566b3a.20.2026.10.30.14.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 06/19] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Fri, 30 Oct 2026 14:18:08 -0700
Message-ID: <20261030211928.45761-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXyjsQsQiiZxGA
 JGSF+26HDUbUiDJk9qx7Cr1SHsR/VJ2CtGNo+B1rTFe8kKP4eUtjyD1EqIBzGqgXb+gLD8I9FLm
 2A6iB3rmr3cynbtTpf8ZgUmlGipYYek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX6eYQcfgh76zf
 SkyeJQr5b9dzuQKgx5bHjfXXyv9IWtPLSAyjG0tnxquMOJPy9N6GcAqbjQnaSGsnRXLgHQHRu6e
 SgUaf6GFZol2K9k6xORiw+HfuLiiW6mzui2IHjPYYkr27/xAgDbluH0cGyMjR3pgdkqEyiCRuYs
 GnKxlF8WgzqaqpXEULnrTEcJcJ7pFlQa+mWNy6jS39KIJsdiVOc6CIzuUj8DxY/lWZLswSlKajy
 Fc/v9SaGREFjdvsihMESnNXK8SyNsaLt0fAUFZ1B4HeYcjmRihbeLetXPOa/i9kDIPRFFegUYT7
 yQTzMFYBgsuk2F4obzxr9qmarx1Yk1aUHsCiyIzymcb7men1oSl+PuBtPMvQhRTCqGmMFy4wSNp
 Z5zJe89OSfDzmpZiz6n/xce8JkaqEg==
X-Proofpoint-GUID: Cz-z5iP8CFQKi3x6hxdF5Ex-plU47gKw
X-Authority-Analysis: v=2.4 cv=FcSiV5+6 c=1 sm=1 tr=0 ts=6ae509f3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Cz-z5iP8CFQKi3x6hxdF5Ex-plU47gKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

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
index 8e91edf16ec2..795c16d88f45 100644
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

