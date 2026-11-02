Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629637;
	b=Zh+/xD8pBSCzr+gwoDgNJYg/M3XZXut/pcGWm72iRJAb2WOcZ5Y5aGv5laaKBZCkiQK+
	 vuX60ia6ViRUGXiw2X5KSJ8lslBbwut8rd+xV2/dio44Tn4uKtZkBA33oYPFfRUA2FQ95
	 BoG1ZSs3/qdWWyG+qxK5fy3xLzA6Cm5/Uv9nhALTmxdTMK0Gx3FqUxvsu4WmiSQcftzC6
	 HHdo9TiGEIundxVIwIoKjN43EYkwoapqDNTjPIcg+MVl4RNAs6I7HgHdtr4XwHnRKq/Qp
	 Ex//s/cQvi77O4ffKjQR7Gr1kxkzMahvw5aEte3LPzjgo0Lwk90NvAGAmhGEQ+FvqBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
	b=WcQiCcAGjMN9W9M5QvGB4rTeol5XmcYLt/9JfLPigA7KgpIHl2+RH0IJhNf7HnQ89m+z
	 q2gz4vIjkDwjlSsRGS+YnV+jjaZCrOXXCfF7x7zslWF2D/Q3SOKxVLtucYpUNmU9oycsW
	 7NZW0GWFBs++8EN/ROGK3tTryy1loCH+0GIZ3psn5CSd2USPdg006XHEiId5SJYS9KA8t
	 E86xSkfSILIIvK9euxod2f6sMR3AeUJOZbZqWKg0kGhiMfkQAJOgqqJiHwpF2zc+7394w
	 vaeoLvPZ7bl0v47PdspBChPuuatIXYvm3hVV/aFPnVBj059ssHuTR/bWrksBDwN7neQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lejKQmqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PYFZyU/4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404160A5BE2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2404160A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lejKQmqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYFZyU/4
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpHTl4069976
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=; b=le
	jKQmqGwQP6CJxqQJ/4fG9AAw3mSod/NgYwm7RK3UIEyXk+z/xXX6OXL4S19UhWco
	oV+EhLgcfkB0pZ4KMvF/6Kelt4BfdjwFZaJRP5v0oRb83w1iu0m5yHHmIQA+UWaR
	DhhgwpvVQV2qWsBlh1he2QjWfHaPduvsxfRK+sYUbB865yOswBeeaAeFYnya7eep
	kfGesPqEekAJal5fHnoDzCbPT9e9NdZelrVaonqvYk/z2tzKrTrfJPDYvbi+qn3R
	WHVuTIOR+xjuW/jZrTFDOv2IDQS91ZB8cKANe9mXk2jLZTtaT5v8A+iR9VHQxFjj
	LRmOwMp77484C9FWK9pg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5gmwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:27:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6f56f3638afso3269150eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629634; cv=none;
        d=google.com; s=arc-20260327;
        b=jRqsMsexwoqoP6FcJAZN2dtd0UhdCNwWKlvFExRtX2uuzQp9VALhl777nGRrMOdLPV
         wFxe7yzbb7hnDJyMPvvqpSjHX2i6XPcU57uF0hHLe297lGmW7iqyF0J8nqB7G/VUiMyd
         e1BOQTnhJ50OliumfCAinAGPIYJHu7qloi6e05SPjU5qSEzA2jxQ/HyLmiibPckpBKh1
         mLai9tmumuNNkjJFsEtsuWzX23ou4kaqDhDiVtWVYI5qr788gEgLTaeLjfVnlwtd+y+J
         SopN2+XOIyzDOdxKfVqCYXDFKhSdBibACv1wzsSNpLpn5khP08+EGGhFkhGS6jTam5CE
         48eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        fh=pF6eqXG0XFkWaXjnp7axTllSw1daeu0SSpVmjnmwpiU=;
        b=E5gTr2btznxxD9i/TWAbJ7RIVn18ylinnMlk8kefxlhHJwNUrPFqY/M1yKzWsigLxD
         yMonjzFwO+XY2c158N9E36oNf4KrMmuncuC4QlNAyDdJQ8AdqSNguzzua+PS7nJAqaqC
         jkqKpTTer+80oCmbs2uLXOFEWhSkUlAIRxg19KFitSBLA8B+EcLJlSdBh7uLHQk8w8EJ
         mty7Ox5T01Fcfa8P6FB+meWowIulyLbKp3BS2xKe/jEqrr1NXmA4GJaMjiO+/zijDECI
         Khxzq1yut8frv7RPnDPvAeU9JbsIMPTPgQBobqzLfZ2NU98D9U+f6LB0HxGa/znQ9MUU
         hXaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629634; x=1794234434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        b=PYFZyU/4vU6vjmUGpX6rvzfVjbmpRUBEcQvje8FtjXO15OAvem+9Y+YtjRg1cUvnwb
         0d171Ul9cS0UMUsnsYcbNIzlAoudpUywDuj2ngFQiHTr3o23RX93nrsTT/dVJ0GagpxD
         RTQEodUc0wsrvENGLLSVWU0jOrk66Atgh/c0Fd7I3xIj6VlQNqulXELf1kHfJvUtkP3b
         IQghkEio2Oi5aRQHetLdphqH5GFe+cA8fK4KIUm9IymOWfTrE8eK32pAjd5AI2OwYuWC
         y/t4QqK+JtZ+N/wquk027M/IS+gQR7vIR1EWSRM/279ae5R7KAf54KoaPknPYmxN9cNe
         ptAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629634; x=1794234434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        b=UJRVgQkwX3Njn/s8TO0uRDXJ87Il2v6LTx+qjL4Hj/16wLWy6MwkW1IM9ZWB2NnZcX
         1au8qDB/7CxU8tPXC1lJFCnN2RBnfq+pyc+p3flrZfgxaaFhZ/SiCv4EYtSe3WkiuYp9
         CrekE2HSekfuGxGbNLd2iKh7JPJRilcoA2odkSd1j7JLRSnsg0rj2PUG5SqS8MlYlVWS
         3hqYAqLGMa0lHSKYjS46Z1fCcYyeHH1dIqbV/Ai8AJyJdAtV3bhQ4LtU/4kl5S59ZC43
         pULDrSe+R0/fVgxH0ktI/WctF06yGGlkVAfTpOrTMrKWE00B3pJLHjDVNDhfQKy01EmY
         FKGg==
X-Forwarded-Encrypted: i=1; AKwUvBwy15iop044yYRelBQtW8iilDtbQ4cc664C3/HhrHRz4xlknWclsc30cOiodazsBivXsehkWsMjHwVXoi4R@vger.kernel.org
X-Gm-Message-State: AFq9FYI3iC3Quqcj30B29cfo8GyuZe5KD99NIJ53tQmOECdkSMXN+w39
	z87YgTqhDsxJ75S2BeMu0T1/GnS4wOMKR5i7MrPtBysc+Z1j7sO/Qy2A+La2qajMyvg0M7RM4jv
	yHtSsTR4t1GFKUp2HOA3sEMu6baPYZFfCv71InMsQfKyh/vCkUWIQ+1d4v5TKnMlDRJVaspVHNO
	/jhmKSA3lhI8gijduUOOxiIqetBTScADB7sDpJzduHAtygDskbEqc=
X-Gm-Gg: AYBFou2oNZpO86PrUHzEHgQKTFcxpca3yjV2pl7X6x2JDrw7sB14NVsyLzev/TkYsSt
	W79WbpwrXispLMC3vlmyu4BSu8pQy+3boS0PidZApeb8v2xtwUrU2VVQri4cf/RLJYGcP3vAB8j
	sStA+TCsL/ZgBoyNgFTB2LMhVQ5o16g7lIYV9ha5QX3qS96jubRffZE0Vymw==
X-Received: by 2002:a05:6820:7081:10b0:6e0:1599:a4a with SMTP id 006d021491bc7-714f290f51emr4033705eaf.35.1793629634182;
        Mon, 02 Nov 2026 06:27:14 -0800 (PST)
X-Received: by 2002:a05:6820:7081:10b0:6e0:1599:a4a with SMTP id
 006d021491bc7-714f290f51emr4033681eaf.35.1793629633693; Mon, 02 Nov 2026
 06:27:13 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com> <20261101175553.53746-3-nicoangelodelacruz@gmail.com>
In-Reply-To: <20261101175553.53746-3-nicoangelodelacruz@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 06:27:01 -0800
X-Gm-Features: AclHuK9APyGtpZOJQcsejCVfEW4m73oY8nFEMTVCqR0OB1TvK7sTUjK0ek7HnrA
Message-ID: <CACSVV00ud7+mJ0YWM4a_jzRwDuZTFkHkLF3tXC9NBwMcmyMUfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: free the crash state asynchronously
To: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae89dc2 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=PDzu0jb1FHLFr2hdgv4A:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: 3Yhi_DQbynCMSc8_B_uYvWLqdeGyi5K5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX2HRUxFVyaAgC
 d8Ae8iIhxWK9q4FTx+u8fPI8LjGjPdn6t6QYGe0H3zzFJCoxyVE1lIfgHdiJQ+DjncrfjXSYO4M
 dhXSYL+WJ+ArEwtkMWCMLmqJfJ2gUFybwZMQdQ6KCKWwEWVDTSLQDIZVwmMPKvFSpV1fUJEVnmL
 GqTHXXn9lP/UbjFDKgze+AI5BeJHHCv9uNgnD2izQG1+m9lsxvFV/4KRK/r/TtcYfTa6dJnOVv7
 nKOMI2dRDt2kzHWaPx0mxx8H41dQUbZ+kpTVuSuK/+1e6xMIgT38LD384gxg90tFDszXtxP0vq6
 MXWpZ/3bZ0xGnu3OvNrvbUoNigW65QrsuI8GKGzyN5SQWtNhxlc52wDUHMqX5rNpFXH5uBdLD7V
 cXPUqA2cwePPRsPVq/feAe+gTIJM+/7fNno0zhJpdJCMdEDSx+NHItu5BbkJDWNVOVbVIzfBL9h
 3rruZ6gY/Q2uQfIjN+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX1z5zDD4xhh0v
 R+74NfzuK36drK9Fdh9wqJ+zaaO3n9tW+V7mQW1JEk32PMkX1xuLdoyIfWJH29UYp82w5fC7JMH
 xWRfKvVobsdsznz7lLkhSlwW7q2tpNs=
X-Proofpoint-GUID: 3Yhi_DQbynCMSc8_B_uYvWLqdeGyi5K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On Sun, Nov 1, 2026 at 10:00=E2=80=AFAM Nico Angelo Dela Cruz
<nicoangelodelacruz@gmail.com> wrote:
>
> msm_gpu_crashstate_capture() sets gpu->crashstate and calls
> dev_coredumpm() while the caller (recover_worker() or
> msm_gpu_fault_crashstate_capture()) holds gpu->lock. When devcoredump
> is disabled (/sys/class/devcoredump/disabled, a write-once knob) or
> its allocation fails, dev_coredumpm_timeout() calls the free callback
> synchronously.
>
> msm_gpu_devcoredump_free() then calls msm_gpu_crashstate_put(), which
> does mutex_lock(&gpu->lock) and so recursively takes a mutex the
> caller already holds. On systems with devcoredump disabled, every GPU
> recovery that captures a crash state deadlocks.
>
> Defer the put to a work item on system_dfl_wq instead. This is safe
> because msm_gpu_devcoredump_read() takes and drops its own crash
> state reference, and the work takes gpu->lock normally once the
> holder has released it. gpu->crashstate stays set until the work
> runs, which only means a capture in that window is skipped.
> msm_gpu_cleanup() flushes an already queued free before teardown.
>
> Tested on an Adreno 830 with /sys/class/devcoredump/disabled set to 1:
> IGT msm_recovery gpu-fault recovers and the GPU resumes.

It seems like this is missing test coverage in msm_recovery test.. it
wasn't a case that had occurred to me.

Care to also send an igt patch to add this case?

BR,
-R

> Fixes: c0fec7f562ec ("drm/msm/gpu: Capture the GPU state on a GPU hang")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h |  6 ++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index caa86279f..fded78fdb 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -175,6 +175,14 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
>         return ret;
>  }
>
> +static void msm_gpu_crashstate_free_worker(struct work_struct *work)
> +{
> +       struct msm_gpu *gpu =3D container_of(work, struct msm_gpu,
> +                                          crashstate_free_work);
> +
> +       msm_gpu_crashstate_put(gpu);
> +}
> +
>  #ifdef CONFIG_DEV_COREDUMP
>  static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>                 size_t count, void *data, size_t datalen)
> @@ -215,7 +223,13 @@ static void msm_gpu_devcoredump_free(void *data)
>  {
>         struct msm_gpu *gpu =3D data;
>
> -       msm_gpu_crashstate_put(gpu);
> +       /*
> +        * dev_coredumpm() calls this synchronously when it can't keep th=
e
> +        * dump (devcoredump disabled, or out of memory), while
> +        * msm_gpu_crashstate_capture() holds gpu->lock, which
> +        * msm_gpu_crashstate_put() also takes.  Defer the put to a worke=
r.
> +        */
> +       queue_work(system_dfl_wq, &gpu->crashstate_free_work);
>  }
>
>  static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
> @@ -899,6 +913,7 @@ int msm_gpu_init(struct drm_device *drm, struct platf=
orm_device *pdev,
>         gpu->dev =3D drm;
>         gpu->funcs =3D funcs;
>         gpu->name =3D name;
> +       INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_wor=
ker);
>
>         gpu->worker =3D kthread_run_worker(0, "gpu-worker");
>         if (IS_ERR(gpu->worker)) {
> @@ -1047,6 +1062,10 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>
>         DBG("%s", gpu->name);
>
> +       /* May be unset if probe failed before msm_gpu_init() */
> +       if (gpu->crashstate_free_work.func)
> +               flush_work(&gpu->crashstate_free_work);
> +
>         for (i =3D 0; i < ARRAY_SIZE(gpu->rb); i++) {
>                 msm_ringbuffer_destroy(gpu->rb[i]);
>                 gpu->rb[i] =3D NULL;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index 5cf220f75..db9e11e7f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -258,6 +258,12 @@ struct msm_gpu {
>
>         struct msm_gpu_state *crashstate;
>
> +       /**
> +        * @crashstate_free_work: drops the devcoredump's crashstate refe=
rence
> +        * outside of @lock, see msm_gpu_devcoredump_free().
> +        */
> +       struct work_struct crashstate_free_work;
> +
>         /**
>          * @recovery_in_progress: true while recover_worker() holds @lock=
, so
>          * that fault capture and GMU waits don't wait on a fault devcore=
dump
> --
> 2.53.0
>
