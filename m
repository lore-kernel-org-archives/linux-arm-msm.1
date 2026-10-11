Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3C93BCD1E
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700638; cv=none; b=FR4+Mt6wI8Hn5Ws8MQeBrQq4ul6QRXmBYufLbaSBJWK1hAe2LcrJk/1yEhCuZ5TVFIxj110wUIRqcnNx5IWq09dySTVbAzDFj9Rvc5bi4RQK98ItL2qRMArJMWZodGe/cYOsMJT9KHQNgIoBcUj8whYdv0YwjWqQEWFa6QPPTpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700638; c=relaxed/simple;
	bh=GG2J4fso33oIoTZfD3Mzrb1HVRo/ufiE9ZlJtC7lK7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uz1Jib2mg8nZ7H791HoB8Mx9fmCuo1t+oWn/y+euHaF0w3Du3YvVXxPRrbyYaN5N/4dtt6aXNNFQ+/nGdziJEUTAHIgy2VDgSpIr7gx3CWzPEXtB1CVo4kqOpPdI3VUzl+rS5yrTDoMrA4/idKF3ZoFhIjbZQvgteDaWFAo8blw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajeoGkG7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4JOhj5C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajeoGkG7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4JOhj5C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B50UMc3005249
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Rnc1OvV3U/gwC+BGfdFIj9X0
	ZgV2oXUIAGTErZwS/rQ=; b=ajeoGkG72+UszQfqRQjwKJvpTzVW/N+uTk+L0ykb
	N0OeWNHPAzLGMFLydcu/nl0Wx5qecgAHaTagMRuhn1OgjXr4UaiFkJS/tZd/36ju
	saSnqUbLo/EfXnikVWyRioLyYLulomrn5+mXRW2C42hs0oDMZ4ItmGqmoBaK6TOx
	QXkJVm4BfzVCeCbvEuIVQasEcqljMuop9N4B1VOCS1UXLOcZ0btyYtAaR/fCYV1u
	s+Koc3BNmPx5hFNUqvNo3ATPis06z56ZSshoO9nVZTMMPHSz7wcZQvRh+KJ+HLYm
	qmn0yPFZ995V6OCDl1tfLYTtSaT4nV9zKmSZZLCKgqRa2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cc6an82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 06:37:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1943388eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 23:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791700629; x=1792305429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rnc1OvV3U/gwC+BGfdFIj9X0ZgV2oXUIAGTErZwS/rQ=;
        b=i4JOhj5CDzNVB5rEDg8WQr7ICpA2ANdmQ//68Q7g2eFZ70bkCbXAqhdq1TR3AcOZ/p
         qbUtOjJVtqoy48ptUNL3Ii4U3R96f02D3QCxrCnYuymcnQfSCDN/jiaQIDjun4oXTavL
         76z0lt3tDu036ullPp7U/waHv86Ca4mcvna8pri36pD6JC96P23kNeA7ggn8YNF7JXqo
         BoDrp2BqmS7acxCueHKuqjqqyjmTeTtLCZp1w3o1pQjj+85XicUJCYvb8raryYXoKAyh
         qJfYI0RF88CCbtHbvhDOC47a0aqa476bo9Bc66mMLjcQMN5UipaTQ5sGLzEDxkobFdem
         jTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700629; x=1792305429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rnc1OvV3U/gwC+BGfdFIj9X0ZgV2oXUIAGTErZwS/rQ=;
        b=N23MarkDW4ajPOS3kl8oAgrEcrhAUJbqscIK9JfCzP0HBDCT6iUHYTVl2mTS4+bF9e
         8f1xtihv+YW7ZvputYS7+FOqgjLMoTHVWTHANbJumQR7ZV+QgJo/qEpRX6XNgZtuCUpX
         +Tbt5gdvEkiHR9+4PAPPcsd+yeg5EzFpFvfxq/BCCcuOfukBuFqCL6Jgxod5PSfm5A3P
         NhlX5Cmm1Hg4Bq62IZiwAz7zyN1qakUQqs1B2XiJfIc0Gm7dTD4NbnmqIGxtxW0tvig3
         v77JZJ/Mvd7h5gKbc+nj3Sxh+ip8xTLSHuPeIjp54E86hys+xxJgCtS6vKMssv/uuBNr
         EYrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsKT4JTNNnvrjt3w97JkxaBWB+z7JUIYfb449ic5H2KetmfLOH8GH6yRi/M3dFx0uU8M4t4RRML0eCDh7c@vger.kernel.org
X-Gm-Message-State: AFq9FYJfXGcFWDrbtoArvNy5J0f3erEMjz453HlE4hZfIO+0+9Gg0Vvu
	56D/+95D/txLJPqYO6Bbh2HNFsYs0YLaleYMvtJJGvQjMqrWCMmL40Wropxdf817eqWqTbZDjDT
	JFrDDQ2Re1WFjWv/VaMx0u/s3F2KDXs4A2bdz6xCb+EpfKTPvFtWMFyOYqMJQkiyf5Dh7
X-Gm-Gg: AYBFou0IsP0lNhUkQ/5Aj0yFkRJRo2T4gM8KHIWyP1oBQLWtjLxgFh5WRufZ57DAEuv
	6fnbUGdHLKWI0UltM3TamOofWG8uVA/NjmsGw6HYRaiE7Ay0owZinvF56oNuLYWoZxfLa5oRn6m
	2XerH/B2m2ejGBPg+XtOAkKhko5LLRlhKj3VIrFM0UzZK+1Xnkra2hfCuWmXOdCL7kS3zJGk4SI
	o5NKL3PZLJsG3bDfEv40PzEW+lnZCHnh19eA8SEEWi/0jObEfX0VlBZ5rtgNEwfp6yvuC2od3ku
	81WH5+afA00iuHRdiulXxWxv2zev+If8gYojH5hj4peJyYrf20mRz/uovLx7Lb5ZNQYVLDkBhtI
	N8ZDpzQecUkvYagyQIjcG9gvGF1FEeGhf35HtWXXY6A==
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr9337658eec.23.1791700628203;
        Sat, 10 Oct 2026 23:37:08 -0700 (PDT)
X-Received: by 2002:a05:7300:d18b:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3537e0bdfe0mr9337612eec.23.1791700627378;
        Sat, 10 Oct 2026 23:37:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm20811159eec.30.2026.10.10.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:37:07 -0700 (PDT)
Date: Sun, 11 Oct 2026 14:36:58 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] drm/msm: Support for GPU in Nord
Message-ID: <assuimpZe3J5E2rs@QCOM-aGQu4IUr3Y>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-GUID: vkA6rsDxWi6Vy14kntrS5cUGJDedSAMu
X-Authority-Analysis: v=2.4 cv=XdQcX455 c=1 sm=1 tr=0 ts=6acb2e95 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7srVW7kWV-eK-ianrkkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX23Saon8h2YLD
 Ethf1OL/gqCCWJmOPVdqhz1+TPAdpZvkmDbQJz4BiSie+PtQJO7kRf9Emu9fhwOja9HJwD/fkD7
 EMc0Cb6iW39ge89aJIaDmr8SPGJIAQ3nK37GbgQw08f3P3OS5msRIhRfWr6PmffxE1wCToKQ4P7
 bj3uMQN4iiTY4NmbYWhaDHA61oeQcjp6s5T8fKp3DjuDKq0sr485xsbdfJP+SUQq62bHaW3ZtWn
 NTJYBGhPkC0JdVVPlEt+SD2qwenVmrMFxqn4mej21k4WUgvh1hkbsDdJNGRKIaMGSNwlqwqmNYO
 OePt+JhrJMeKjjar1iCpgBIHOxWHqHrKNPXF+52i0vVO0v8OtbCOoccQpURpJ/D8bdPgPUVcaFc
 Deon5SK22IfQ6eb80H30NFG4fOAyfGbMNfx6kPcf4FAfjz+/bvpMcRhllCdXdAjhpprKeH6NiVA
 XVvecYaA1qkPqLf9hkQ==
X-Proofpoint-ORIG-GUID: vkA6rsDxWi6Vy14kntrS5cUGJDedSAMu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAyNiBTYWx0ZWRfX1p9WXNjsadTQ
 N0BrybrkdJXCg4CAUNlPmxOPMRF5Cy3R4mwIkUULvqnR33Sl/qrCIKCx4JKDlJEQl22GZBP5/Wb
 2Aog0ib8bRciBpjsH8VNN0ALW1kDuMc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110026

On Fri, Oct 09, 2026 at 02:36:34AM +0530, Akhil P Oommen wrote:
> Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> This series adds support for the A753 GPU. A735 support will come later
> in a separate series.
> 
> The driver and dt-bindings patches are for Rob Clark and the devicetree
> bits are for Bjorn to pick up.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Aastha Pandey (1):
>       arm64: dts: qcom: nord: Add GPU cooling
> 
> Shivam Rawat (4):
>       drm/msm/a6xx: Add Adreno 753 support
>       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
>       arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU nodes
>       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

I tested it on RRD board (against next-20261009). While kmscube seems
running fine, I saw the following errors.

root@qcom-armv8a:~# kmscube
[   30.192468] adreno 3d00000.gpu: [drm:adreno_zap_shader_load [msm]] *ERROR* Unable to authorize the image
[   30.192503] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -22
[   30.202644] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0

Are they relevant? Or am I missing something?

Shawn
