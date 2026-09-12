Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF433D6FC
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789178101; cv=pass; b=pXlfhId+LbYSRwHIbIyDdW38LHmigF5PENIQU87QaD8bj3laj0OpktVJmxRSc5ScYPiHnevMy13/kmu1MbvKLXvnvGnKTV1rSnRFTwA2MzD+HwsF6jGrD8w8aZ+kjtRk2JzhAvewlgXebtn7BIR0u2GOBlXhS1Iu1ff4CtNn/2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789178101; c=relaxed/simple;
	bh=VFRwnM9iUJh5pkFmmmSrz8i8a58gw6HIct513ZlHT9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqoJWY40dXJPwihmZOBOgtXIbG7CA9De6akHnaV8VPKP2K0xBBqKrtCpZ/KEqzUP/4IQD5Cj6rvZY4sz2/yzAxq7Xo9IyjbLDinnES/Bv1Fx0ZqKsdW7niTEkVtd82Wg/VUaexnHH2ryIAGsB4wrQdQB2oLeGJFoPYBDLXh6b78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAh9sZi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIyHlxIa; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAh9sZi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YIyHlxIa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C1HfiE2490358
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 01:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=; b=cA
	h9sZi9GAnqA+3YVu06UOVxEImSlcqa//a75kClq/YGD1fx2SpjurUSVSAUyUFmFn
	UqhPUaRQV8u34y5XCbszsUORzKCufgNJctRaMUbzWElByDEHe5lzXqIgwKK+QkSF
	kjr97UuO7swDPLBSk/8lr0ueerR0o446llBkkP1uJg+axkPdmFUjOnp3kxvRXbTF
	GJqBfPB1Mm6N1ks/uHuOTFcyIcMCBZrW+2lXBKx74YgqBPhMe1BVPuWVwl97bPS6
	+A6Vett/Dl7YUW9jq06qiAp4nAUVkBrZX5sgTNNKUINKFNUh0oocHBymixxNMeb8
	HvqLN3bSO2JcZNNecppQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmv8sg4x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 01:54:59 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c21c2859ceso239356eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 18:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789178099; cv=none;
        d=google.com; s=arc-20260327;
        b=J7AT7t9h2M2NWBjJqwBL1OJRWlSnrGIrUiWUsKogC7nY42UV7MamYZdq/e0Q5Fz2o4
         L2S8omMtPib2FA2aXb5vhYvQjj3RigOOqe9ADOxsFSgNP6XLLwVPku5xf8ZkJ4+zf3CB
         kOgTjzkucE15PxXYlEjrAdREuPUPalyXBYPKyTTuD+r/r/3xtmy/ObYiQinHEVxWyFRO
         KpcSA7+0+/oSjCpVhU9Gz15SzH5+SRDty0RiDbRNIipdOFRnvFwTsqkP7qYmPWZs5Uh5
         cCLVjgXAytkNQkh33hbRf00Q2QOeUkTOUqMXlHQbN8uhTlmiH3oFI9P2ZJqc8wKDLInQ
         coLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        fh=5XOe5kClG79U7zF5TaUkVwBCOTAwiCzopjCuvBXJ7ts=;
        b=NlN0y35qW/+dB9iCc011NR0fwpAYIapx73xb+GUJTzy+43K1KdtZng48x34qYi5GEp
         ad8sD70OJeFXlpY+Hb/Rtx9wz67IDHuahZZkyBP03C8sHiPPZgpjKjEy7jMrfz4PEDgP
         joecnDDqpWm0qKJEiyFDzzzaxTCktF4SsgC+fOe6nktgNXhIjG+JWBEwm48kXWqnk2CW
         6i8RTPtbrxH3F4DbMnQTOPNsxO9Da9x5F1PSpmC2Hm6hv5+qXYpryBwq9k0Rqlns3flV
         B5Npqunds91EI3KAiB4+pV1dRa77H3WUmzBKrIjwbvHivb/vaeuyfQ5qFuEEr2uRmhVA
         orDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789178099; x=1789782899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        b=YIyHlxIaZ5nt9qx1iCE4y9O79tlI05GNN7ESQK7grYydLZ5VJNqNYtfLg4RcaAXY8D
         6u2dBQjx0hAKKL+Cw0qV9IN6qn8NHIzzSoflbrGs1lLjA7xi1PskHu4WRS1oN3q+iJ54
         c9eUUR3AzKktaHq7/XOYxfvhFnorNxjzLhH/ZVgcCTjJDn1o/TAVvhXWzYa6zm3aosdD
         3PCv8V/AFMMnpuucOX9+GpLLUsSu4iXj4ZLzVIhgbZPSdjf00DBn3ipKq5D6qokI+atu
         l5+3O1viRhNsVoxPp+KC+cCDRFAW4c5FccwupAgpC52jvAp8eYINqhAVYYAatDMKqIPn
         lEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789178099; x=1789782899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dO9Rlve2Ra13poOIPSmbNHYnX+XzabrihEjpiFcx0qw=;
        b=r48XtPJDcyfgI/dfeWPz7vu4vKoIDK8y+P4+2MWs1Z6VYXpQ3i2Q+tMaqrXNUn3PWI
         WrfDNCYIRsdzWO6acVMegr1Q1ANP6rLLMTXmVz04TeChY0XbmiG3pRPOk9PICp+UPH+Y
         dhc3ht66AgPITtzAr+dqKTQDi2ZNQ4DwsLZ/nv5o9SAPmxhSukJodbmx47hkgGaxK6gH
         v1LUs23PJnJbgy/O4ZlxcfgJTdY1t+2Wx/2t+g5NDhgjyNF+pPWIuSMRWhlM6mdOAzot
         FmNC6Gqt4GCi8X/yNibHNC3C+24l/oiE9Id2KVYbShi4o1rpYbLnI0GEpFGLjZMwwK4o
         znJA==
X-Forwarded-Encrypted: i=1; AKwUvBzVzAyNaaiBMJtx9x35BmMT7gwuIstEwmVdgJq3jn3iZ/3G0+wgbm3u6QaqSLasljo7zxNnbU5kxe6NkT7Z@vger.kernel.org
X-Gm-Message-State: AFuF++lELlzvfzE0Iv23IF1S9m1XB2z5hJWURFA9wHhpe0du7D+nt8nA
	QoxtvrWYhkkxS2ZGJ3Cpw7sYSwS5CTpezAWev20eWIBugQltXl28ezCCgiOVjK06MXgKk/GEYfg
	bZZTyznl1nDYGlIAKAHK2ypKJ2T+JflMQhl9pV3OSyNmZ7aLVHZpKYjj2nYSmy9GGEmnV/XJlr2
	YKLUb0Hpq3Tj5Cvdl+iIPq0ynFodtoTCtX1AtXdfzasdI=
X-Gm-Gg: AYBFou1YduY6ljJdZ9KFGg2YTv8nxPV/cG892/SYkyGIz2er6tStNJ9j6LkLcGbyyqe
	JpaarHYSuiTjF2O8bC/K6RjFvbuIzKpZThdF96TnxcaiMIlimfrnRjXq+46KmvtkyAq5nc73znA
	Jz5rhb9QgAn7UjRdKiyVbCdNsaisxfWxF8LoPBqxEwUWgkzqafJzhzDLEY
X-Received: by 2002:a05:6820:2221:b0:6b1:5735:b88e with SMTP id 006d021491bc7-6c24c6c8ce3mr771785eaf.6.1789178098709;
        Fri, 11 Sep 2026 18:54:58 -0700 (PDT)
X-Received: by 2002:a05:6820:2221:b0:6b1:5735:b88e with SMTP id
 006d021491bc7-6c24c6c8ce3mr771774eaf.6.1789178098301; Fri, 11 Sep 2026
 18:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
In-Reply-To: <20260904125523.43813-1-roman.demidov.nn@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 18:54:47 -0700
X-Gm-Features: AcwNN1UgBK-qx_vC_r0dZSSzeObThSII9I-bgwOa6aSUrNw21aClLAt97iPASAo
Message-ID: <CACSVV02h=c8KQoUT+18uXBoL4nkTzefu6AiTX=y6-W0rUrSSYA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check pm_runtime_resume_and_get() during resume
To: Roman Demidov <roman.demidov.nn@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDAyMyBTYWx0ZWRfX6nODV7qcB8fN
 nLzO+A30oKQM9asvglMVepE28JPNkriNq3SHnQ5eMmMq5iu7YF2TE87B/gqsmxwWZzWcpOdm0S4
 m5h6pnL+DqxR0TpQPV8gcFAji79OIX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDAyMyBTYWx0ZWRfXw7Ms1z2kNl7k
 MFCKm65GhtYEcfGKlL2MIdsn62+PnAQcpuAddR6IWom44jpuTX2ef1x+il6EzYhUOnkI8j36Sqp
 mFyyLVg2iWN/xmvwBKC7E7YcKuNphRPexnV07T3EBgF7AgMFBZHtU1j873dCZXTxIyBk9CvnJHn
 JBL71Yk5vqonMsG+0HIeeTE3hlABjPztPENcmFBPJd9QiZ4gPCjvaZEh13aG2/TQmksvB896t4Z
 4cgZCQ8GTd5rWY2RSu8N/McmCJbxAW6EL0tBrat8RquShHJe79Bh+IuRbxnsKeViL907KI+GeDj
 Yh0W39StgkTU6B4/Q27pHlfciom/ITgDjertrv6nH1c948bdu7EdktRsyZ4cYED1tBtGSLOHaf7
 HgXdrXfipWpL+rlONGRVk5XF5MAfmv6hckV3zCYBj2DY30ZMqw0AswTMwzS4p1Jq3KoZOT2ZjM2
 ds3CBbXNr+d1OM9gXLQ==
X-Proofpoint-GUID: aM7n1W_yljLYQPfFnnCwXLzL4Y0sNhV7
X-Authority-Analysis: v=2.4 cv=Cucq4X4D c=1 sm=1 tr=0 ts=6aa4b0f3 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=HH5vDtPzAAAA:8
 a=E6Br8louk_51uBx8NIgA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-ORIG-GUID: aM7n1W_yljLYQPfFnnCwXLzL4Y0sNhV7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_01,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120023

On Fri, Sep 4, 2026 at 5:58=E2=80=AFAM Roman Demidov <roman.demidov.nn@gmai=
l.com> wrote:
>
> The return values of pm_runtime_resume_and_get() calls in a6xx_pm_resume(=
)
> are not checked, which can lead to hardware access on suspended devices
> and PM reference underflows.
>
> Fix this by checking the return value of each pm_runtime_resume_and_get()
> call and properly unwinding the previously acquired resources on failure.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 38 +++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index f9de9329dee3..0cf205ea744b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2175,44 +2175,48 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>         opp =3D dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
>         if (IS_ERR(opp)) {
>                 ret =3D PTR_ERR(opp);
> -               goto err_set_opp;
> +               goto err_unlock;
>         }
>         dev_pm_opp_put(opp);
>
>         /* Set the core clock and bus bw, having VDD scaling in mind */
>         dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>
> -       pm_runtime_resume_and_get(gmu->dev);
> -       pm_runtime_resume_and_get(gmu->gxpd);
> +       ret =3D pm_runtime_resume_and_get(gmu->dev);
> +       if (ret < 0)
> +               goto err_opp_clear;
> +       ret =3D pm_runtime_resume_and_get(gmu->gxpd);
> +       if (ret < 0)
> +               goto err_put_dev;
>
>         ret =3D clk_bulk_prepare_enable(gpu->nr_clocks, gpu->grp_clks);
>         if (ret)
> -               goto err_bulk_clk;
> +               goto err_put_gxpd;
>
>         ret =3D clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>         if (ret) {
>                 clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks)=
;
> -               goto err_bulk_clk;
> +               goto err_put_gxpd;
>         }
>
>         if (adreno_is_a619_holi(adreno_gpu))
>                 a6xx_sptprac_enable(gmu);
>
> -       /* If anything goes south, tear the GPU down piece by piece.. */
> -       if (ret) {
> -err_bulk_clk:
> -               pm_runtime_put(gmu->gxpd);
> -               pm_runtime_put(gmu->dev);
> -               dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> -       }
> -err_set_opp:
>         mutex_unlock(&a6xx_gpu->gmu.lock);
> +       msm_devfreq_resume(gpu);
> +       a6xx_llc_activate(a6xx_gpu);
>
> -       if (!ret) {
> -               msm_devfreq_resume(gpu);
> -               a6xx_llc_activate(a6xx_gpu);
> -       }
> +       return 0;
>
> +       /* If anything goes south, tear the GPU down piece by piece.. */
> +err_put_gxpd:
> +       pm_runtime_put(gmu->gxpd);
> +err_put_dev:
> +       pm_runtime_put(gmu->dev);
> +err_opp_clear:
> +       dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
> +err_unlock:
> +       mutex_unlock(&a6xx_gpu->gmu.lock);

this does at least look a bit less terrifying than what came before...
but maybe

   guard(mutex)(&a6xx_gpu->gmu.lock);

to simplify the locking part of this.  And I think at least some of
the runpm stuff could also be handled w/ guard/cleanup stuff?

BR,
-R

>         return ret;
>  }
>
> --
> 2.53.0
>
