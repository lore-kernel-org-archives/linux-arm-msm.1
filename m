Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836971;
	b=kcLk7q6qwuyrPF4SI/Jcm3YADDSTFkn823ZT8rXO/e0eDTnXAIjttFLiLW8ks3MZDFj8
	 Rg5jLDgFy9KvdS0/2dlJYEcH9svh2BfjKLXMG/z2ncGW04zwUx1qvF0G06W84iKqFtoO+
	 QVJudTmeaeSXOJX4fFc3MXsY8YIKnbEMV5ahc4xfJjq/kboRy6d5I4uaVSo+3C+kc5vI/
	 5tn0sZhAR9QQfgaHAj2vyhfTowWNqFsf3pqDuoOTbtpbwur3rKaqfiRrItfz/M7hkxz+P
	 QYsBJYSsXY2VCE72WIByxqIskSUFpmODpDE2pjFsVA1KdzlcEUJ05/WvX/PZ855oazg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
	b=3DM2xyyT0QsXY6zxcUIpkXGnrDAwEt3olRzqKcHQNdG9914wU9cI5juTVCDtrwbtZo+8
	 Gj4MTkw4ghn0HH68YrqkspgnNf6R87XwLTrp8LfnpPUgJPiCqn3whAbH35ke9r5XMa0IT
	 yPnrEQ+P3xuueWXOMYv1MNyDhkNh/xBOLK5qWW34apupsu8EOwPMoJXmXp26fuJjQuG8l
	 hbYBii779QZbPBPEnJaBEsypm3HZpGcaevzb367gmFCqt8QnsFwfYFWMFOLPErSBmC4H7
	 3HDLVNB558lEoSILba3ehxfc4+Jv/dtdbX5s1+1OIbvRSaXKjvDqmfQevjpHJIOpYpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUZXkwZA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="d7n/ri6f";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631EF606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 00:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631EF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUZXkwZA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d7n/ri6f
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4M6nU62210825
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 00:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=; b=AUZXkwZArcmvGexQ
	TQZmhATI0LtBwQwk7FyA2OyzObTgrdFIhZlSx7cVLhcg8Ds9mjRWwJ/b9xNyXr+C
	7ZrhTuEpB41c4slKvyCvJHCrJzTtkK0IyNUJ9dnFmYgSMLK5SsPQqorXZKOjXM1I
	7c3ZjL/PVtlhByF/694QQf2GFBtJntjViy6NCyd0KzFwEzEniE0fvRhuH0YQZK6O
	o5iXSc7jPRqy3Hug6r8vN6pUFKL+ihL29AQl4U31u53iSDdVlXS1CQe4a0nSkhZq
	iX7ayF9VfQLiq8aO30aTqO1ToqNH8/YUU/2VrYc//7JTr6uEWoVxt88flUeoQVah
	yaY7KA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdt8u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:02:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1af203073e0so2140921c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793836970; x=1794441770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
        b=d7n/ri6ff6Qus9T0jgCmCs57uslm6jG7FtBDpISYK9eEIaoNvZVrKa51QjoCt+MWoG
         2203nwhnCsoPWB1KpqrScrHBJ0EQj7SrN0GbP6lrnpoiLIsJddhujt8QM3IGTVeyba73
         4d6vvV8Pw9na0oo5wxsoOYEMXye6pnvkLDUSdO0qyPCaJIv9BWVYVgc6dn08YroDj1Nf
         THVG2buJh8+9UW3pdDvfIzHQzTCLLtWUfHi1Gj6Yeh0X7GekUfcSGIfhoKltZLBijXNN
         T6it+1pUvAE4XR+p9MmtiPFVrh/eKYStmvE9zONBJX8qbtA9xzn31blhxT6VfqUCokUz
         xCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836970; x=1794441770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9RSuIZdwtYVcc2DoJVsmwG7WZuhihyHHeboegvG5hKc=;
        b=LYqJ+lkrsMbUlK12Q6kyjpnRSbswrR2lRHFVdqTELcrVbtdABrDt2wLlM54pP7Tymm
         H0lYt93wU2QWqnQy7tOVd/+h6pdgJk69748ihlyj8oEGFsu5v0eSisgPGaLHeNkCNo2k
         9KB8UZU5dg1ppylmrjviXJG6zUF3a4Ka+T9sR5I2knlhdk9J683BWZiFaaDUM3KP+LXM
         HQEwx+kjNkU5jwbVZl7TFpYkSzXh5KlbSkneZpfyceDjjrQOqksaPKk7dmu4NZD8MJVc
         RoK+4AIVn6iORST6h+t+ajjz5w5SFpHtbIH/Ic3FsrFZ1AHiDflnrDmlv/LWofgyt4uT
         r0gg==
X-Gm-Message-State: APuU4Z8EE5WwuOHTgo6ObqhF/IsQEsJ+OAVkmU6dE6KNP9DO83PPzVST
	cFwO825pqcAdOUbzKU7TrZBhwdNgP24PT6+6d7kLFOsHX7m3C1jA9mhLk+cUNzSKk3oiunwDEOG
	dsMzZ70+lCbtt3RVNfNJbyB6ZwSlBNvycMchRzhJZK6wR15XIC6MeTPHvLhMI042QV7za
X-Gm-Gg: AYBFou0X6oXS9knikQE5xru9nv6YSrQ1MrOCC60AT6Rguxl4iZnFm6BqvhUPjL36wJ4
	sKPwciNOrjA7qkXR5t4p1XWtdKBwAtQpaY4GNZMxE6HSKFAhPDIXHF3C+NyOPAuhMx+b9egNQL0
	yR8URH35Flv5xaCU4TYFQ/xObUB+DcWp5m0hCX+UDXNlHc7yB3v9pJ+RMxozNICeXVmaoGM6rjy
	roq5zDAzm5eFk4a/NCJlOpx3BwDyOPPu2EBYGMg6HNV1X7jnxBfGbjWaliFq+mi8bStzc1YOLUL
	xuMJgki2UQsiaqXZUWAr5xqmmN7ljcqlXsL8lFFijvb0yZ2kwqnacVWmWN2rDvN0Fj5dlD1kRa4
	AtX2ar1BXHLxV4xcpqR9Zj/Ix3dPDvn8UbRi+6pWHAWZVgU9MY+kAaJoXmjm0mfDfPCNkn/s=
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26890372c88.41.1793836969706;
        Wed, 04 Nov 2026 16:02:49 -0800 (PST)
X-Received: by 2002:a05:701b:42cb:10b0:15b:afce:62c2 with SMTP id a92af1059eb24-1ac5fa237f9mr26890329c88.41.1793836968977;
        Wed, 04 Nov 2026 16:02:48 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm13232698c88.2.2026.11.04.16.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:02:48 -0800 (PST)
Message-ID: <4d24ae8d-24a3-4ea7-ab94-2b8886668428@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 05:32:41 +0530
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
Subject: Re: [PATCH] drm/msm/a8xx: Fix 1/2b alpha filtering precision
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danylo Piliaiev <dpiliaiev@igalia.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261104212048.21010-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfX2VoZ8UpWWwC6
 jVKrDzMPAqxj6C2gfdtr0gxpkMtsnOwXaWWIN7rud3QJvSNXwTpv0Ht8fmVimiVrYvqJRx2++bj
 ZgZh8KJnTQjp53j7zeM10usA8PgYlNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5NCBTYWx0ZWRfX1CLzbP5KXfuu
 KAX3EET5pKrLqQT7ZjFVVbWxQsG2YDzySWCinsibPf1p+lobfr76D10rTBekW0BZtVv6dFnqZ+c
 3IPHwygqfXf22noj4bD33z7NvJ+d9hl0xyWUTPPOETDxxOW7IPHxPFPiUMu2muNL+0dIlusecbv
 XNc3wszU6VxMno8QMyzMRs6BrtzLdL11ZSmbE43yl8CayGUIOhZASTNy+7GENnmc5sHk4h9OYTC
 o0wdxhRJW4hy3NNBNRvVTTozyXa0Rx7DkZ81GjQP6JUbhbIB/bXAPo3i92x4PFVGYjo79ZLNfz4
 xt0pz+29aR07fmzfCRj41fvlWJOeBDhxqCcTtpkCw1cPhkXBtFG0QsC+C5VsuagTkdOUl9ErKMI
 mVleonTxAOFCGDq+Rcbh4AcQGz1uur+1IdwFnJuu/ImTotiwUhycFx8+wpUVC5eAfrPeo5yNWam
 QpR9F5aQExf9+ofAAtw==
X-Proofpoint-ORIG-GUID: Awzx7FuWwK80QVrTlM23hAel8D9VRq-4
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aebc7aa cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8 a=mnaISKIp132CONEVCwcA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: Awzx7FuWwK80QVrTlM23hAel8D9VRq-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040094



On 11/5/2026 2:50 AM, Rob Clark wrote:
> Need to set b25 in TPL1_DBG_ECO_CNTL1 on all gen8.
> 
> Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index a7d9ccf26493..510c2f6017db 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -61,7 +61,7 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>  	/* Enable cubemap small miplevel optimization settings */
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
>  	/* Disable tag bank id hashing */
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x00080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
> @@ -297,7 +297,7 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -397,7 +397,7 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>  	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
>  	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000724, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x00020000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -630,7 +630,7 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
>  	/* BIT(26): Disable final clamp for bicubic filtering */
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x06000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
> @@ -972,7 +972,7 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },
> @@ -1030,7 +1030,7 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
>  	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>  	{ REG_A8XX_SP_L0_PERF_TUNE, 0x00000024, BIT(PIPE_NONE) },
>  	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
> -	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
> +	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x02000720, BIT(PIPE_NONE) },
>  	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
>  	{ REG_A8XX_UCHE_DBG_ECO_CNTL_0, BIT(31), BIT(PIPE_NONE) },

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil
