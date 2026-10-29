Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271320;
	b=Tgjr3p5+10pfS9vnNMvJxLq6PNeQbzLP3Sck8IaGg2zNfhh1S9HKHNCd3jNJzgLmTEgy
	 nqb7gADetm+7bxvtWYPCKXHYETnLyi3RLDRLc8bUg5rtgaE3j72+fcQDVvDKBW11KXqLp
	 SwrzWbHPkqNuYmaSbHGF/LkPhWgWN161hylngi14mvTybTfCaI9+Edqj5vCLIYpsTbD+u
	 pYLJ5llpdWdVb/DPERMj1MJV/OYvaJnj7ojOwFENtdKMsCY9bqc3ldi79PWHUWa9/0iAV
	 0nxQBRPqNdJSFDSjbPzOwsFq0BZMFqmhvV11ZQbCo7hbLfZA8doI2yhvsdm9PrpLmRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
	b=sR4Fqxu/uxhM2B6npZNj9hpptD1t4CM1AYtoye64KEFtkKtsAO0EQZmm1ztSLSoLneL8
	 SJ107ocIFgjL21GjlzU+zAIKoI7qBJprZlTHLScIF0kUzDMIxJ5n9MO6r3MS2p823bVJH
	 ghmk3Z9twa/KZB2ujuuV2JEkvPQTnV7UHJ1bGBc+GaPLoUo100FecryJdLy/sFXdnxl9y
	 dn0MzhJyZx7bCKkyK9RQ+o1MoI9tg9Ml5fQJS7RDN0KcjjcAPPkflO2Y0WiFdakd6jE8J
	 mIOugOav2Z+RERRSYu8jPvh8i/Db+y9Cfnl5fMJgcFMDR4wU6HrtVc67T1uBVH7hq4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5ds+4Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTZcDSjc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0CE606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA0CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5ds+4Nz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTZcDSjc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vEKa2912475
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=; b=h5ds+4Nz31FxFcC0
	yYd4bs2DRWtngnmfVlkeCjFwPcXpfBRKRoujZxONoZCYvnbEH8QO/v8Op74WGRp5
	YDqqQspGamx9P0rYj9/OQWTlpYrpoYR8T4xxgniSp/FCYc0T09Pt5Dvu0W54xWQ6
	NLK4uoEmIVP7/CZ55Z4HfcoSy4ivMTabaY9N+Y9DcwaUqUucTkP8QplGZkhix+O/
	8J2494qywp9lOIc9pa028aB8Fh1QpfpPdlVuUuCKaRljSN4ErnDQGicHxC50YPib
	BHS2eLk65yJFNPXwSZ6OVdwwpe40qzz+7rNiwBWMIDVz+roM4QrtNV1Uzas4EvXr
	NxM0sQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2bkxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:55:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso325780285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793271318; x=1793876118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
        b=bTZcDSjcvnWDXna6F1ke4t6Oi/T9jfgYJIZiAGO1ZxRVCTQxa94dZCjKCyfLOEnyGH
         Lg+AXHGnqDIkw/z3OMuM4VzWv1YwEDU4+0WSO3dCqterVw2517XGjSu64XmMPg4RkJtZ
         BTV1yvfH5knC5Mz5ObdALqmmzJt1tZ/bMkjPYRy8vmQKGP2oEiGwGjPkUL5nQrCz9r6K
         xl4AlHNYJcRhRB+jgiMxBCn4jR3ljwVIdkFJGjmyWqf9mbBOIiztziLWfe0odH0bUOeL
         7/l2XDWefDXagzOmCPlbb/NTguvb5RPZJKS7RRvYdveT/OnaTsXl9wwBiukZc/SMgHTb
         9nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271318; x=1793876118;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRQ02HMpLQO7yduLf0Ej4eDHdHrDR4RBPe/ZlU/WyLg=;
        b=En2Q9IwNJVg5KI6rgOyIuj+lI0Dvf2zXqdbO7gVD0JRjPp7t3ch14HEm787vfMbIhN
         ibDt5tk1SeW2vqkUhgn8APJI3dbFkUMyy1Ltms1Gap8Y2OgIVys67QcmCOF2R4Y6a5te
         tt2lfAguoUidCp6EAFmiBExTt3j4RqvUg/R14GLCbo3t+7HQsbxH8nRjy8W+BvHnlXRZ
         PKgIhG+UHuigSrzcZZAkz2lCdjipUAY2nhfIXy5wWwCVEV2dClYEhbi4OniMtjdUk2+q
         i6bAHFBGxvM6f37W6tobVoofVIq0Wr0nkEJBd7vOAFjJVDdBQ4eKqjQjOgoPpaJMOLYa
         iCoQ==
X-Gm-Message-State: AFq9FYKim5XSJZrMZjVQv2y7Sqm8hxxOjnPQS0QaDC1OWfVr1jGg3nZ/
	kInpxHM210glhcupiHiIcQUGPhss2lLYZTSfeXdyiqYfjk6mKEPHxBTuwWPgJsROlER49vtzNmo
	J9TfUTOzotgKcHaAyknxzFWQebIaGliOfejW6Y6/kPTKHn3TttjdPiPL3T8kfPtNb1IAGb/5t5w
	Ee
X-Gm-Gg: AYBFou0H71AN8HQnxR1Vdp96uEYsLYlgYnFAueAfKjr5sibP6pYC6h71oYWZFxIavyb
	x7CqXtxw+mtJGbYhVHXPlqhuVD/+TpuCRECuPdKMNB6xV3EcynMfQFus62jLM0rpc1+GhazD3nQ
	2to1waRqUqZQ4TO/eFoddkrt2gLNZx+ZRrhWpkL2x8BxX4NtY6Ul4tQ/gAcykhCGY1e4Q+DKVoD
	9e1I2JWc/E89QDjkT8EsrA2V451yMjBt1FvZtiMkrVBS2wgPfpXTAgdxNBOApt2ioGflxTjnnn2
	XI2GJS+lmK7mN8gkiUeH4eXiCtytSAzsr7l2Nl/sul3n3oHeeu10Kld/ltFIsVQOvp36aLBbvLq
	hVgTRbNDQaVhDFQCVsMdwpGdfPrxRBO6VT1XQUwbsFUHdgrrhVKWw9MFeMGs7NyZgkF8Hf1UYdD
	mlUXXJVDkgLRHhFwJhPEfanbxF5xQmivByr7htHQfr+IWU20kopXl0DfIpEdDiXCNPWvhOVrixO
	nlo0PrQ3hF8j0JRPIbTM9uUkGq45x9iwiMC+NbNgn4=
X-Received: by 2002:a05:620a:170d:b0:93e:c691:a1c with SMTP id af79cd13be357-94408d45cbfmr723008985a.76.1793271317899;
        Thu, 29 Oct 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a05:620a:170d:b0:93e:c691:a1c with SMTP id af79cd13be357-94408d45cbfmr723007085a.76.1793271317256;
        Thu, 29 Oct 2026 03:55:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49d0734d9bsm95378166b.41.2026.10.29.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:55:16 -0700 (PDT)
Message-ID: <646b3a89-0a7f-4db5-aea1-42d1f066b4e8@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:55:15 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Soften no-firmware message
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261029001601.82269-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae32616 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3MgKiW-6PIQHAM_P06AA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cBOyxSx23FHl1-oGR8a0H4S51cpq9baN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX+uwfXDBN/RHo
 tRMLMMG3uq2l1AZtEXgqRGZl/qcEreCcm1LgGZZCMnFqfdM3X5gBpZVOz+DtWvYuz0bvLw8F9EL
 iPdCq/F8Dxzc85EFAaajROyWUQglnFI=
X-Proofpoint-GUID: cBOyxSx23FHl1-oGR8a0H4S51cpq9baN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX1LGagWnKMI94
 SQu9EOwZWwdrt0X81eCypnPp2OcFTfctCFLrfGr8CcApk9uHinw914AH31iTBmI/DwAao2NIyPr
 iFZDZz45N1TOnxdtKnCvVI3Yt0fR8QIKEI6meL30v7XhTTNkjMPARrASFB7UcFoeAxjyXNYXo57
 ZdoE0Wstq5sHGUDptehJMTQnvUv+6OSdGRWN7GR6wQnQiL/ZOSOaK06nzVRQU7jdoTGGqFxyStU
 bdBhsdqhTQvkNtI64uhpOBhBptbpk+3qYKvDC/lDNe9ZXK+jwTFJRo4L4FQvU6kE/1A6PUmnsTy
 Df6m4clViV6A1QZpSi9nxs4mAzE0LVi+V3JEGsa6WTbHb8prBpp1zMiGNS6XnaKoJ4RRvdHMWP5
 K1/vm8VyOLesnwjTOvLZqLKTuqm/wgoJCvP3ngu1di1cD5HZiN3LVx76zJTztol4JPjKq+zIVIC
 UraM5DxeEFnMz56L97w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290042

Hi,

On 29-Oct-26 1:16 AM, Rob Clark wrote:
> It isn't _necessarily_ an error, the driver will try again each time the
> device file is opened.  But if you don't have GPU fw in the initrd, you
> end up seeing this error message at least once.  Which seems to confuse
> users.  So try to re-word it slightly.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 5832dc25d6bf..6db6cb7eb287 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -558,7 +558,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_NEW;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				newname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
> @@ -578,7 +578,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				fwname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
> @@ -599,14 +599,14 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>  			adreno_gpu->fwloc = FW_LOCATION_HELPER;
>  			goto out;
>  		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {
> -			DRM_DEV_ERROR(drm->dev, "failed to load %s: %d\n",
> +			DRM_DEV_INFO(drm->dev, "failed to load %s: %d (will try again later)\n",
>  				newname, ret);
>  			fw = ERR_PTR(ret);
>  			goto out;
>  		}
>  	}
>  
> -	DRM_DEV_ERROR(drm->dev, "failed to load %s\n", fwname);
> +	DRM_DEV_INFO(drm->dev, "failed to load %s (will try again later)\n", fwname);
>  	fw = ERR_PTR(-ENOENT);
>  out:
>  	kfree(newname);

