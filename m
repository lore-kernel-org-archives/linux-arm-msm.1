Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705296;
	b=ib/JRlN/zn0OQhebdz1wpfFRYg4aC3dvJdrQugAqAdjRzuB5He/FFrcRwGalGpIAkLFN
	 FqVNJiYHOkaoLPghGlqyC/P2Of4SIh/NnVbI3fZC6GJrVk1Xbuv6hB/rAYeBVI3tx5riF
	 K1YUsZOnSJqM8rMQcWI8HZ19W58Q1v49iokId+AxDpJRLz3YaBYciHvkmeHGo9JZReAMv
	 /GM6dSCcP0mHK90J4xFJ0bhCq2ZTfyhs3c2UV/PGpl+N6Dw62ctmExoipb5+V8Pv1kuXa
	 eyBED88jnXcGdskuhHW5UW1oMWsrUd2NVYNHm3PoKQqaZt+VuWYjrAMejC5Y8dWNt1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
	b=o6k0v+l4m5bHIWj1oQMSlodHp7jomB/BEoQ6OE1t0RFJg7k+yQGXBbaC2UbjTZ9iwkOh
	 Jq6tF6QjZ4vX3hFltB/ZeEx0trOf7vKPVwPj1bSJzdT1EWF6vA8TjOWZ95J2YkNuQ3OyK
	 t/qc4nDiP2lQBo88b8e8obCl3ZfwRG7F1STTCf3SWNL+gSvpMj82JaI+odhgM+dFNX8uD
	 wT0NjsDv8P6+GJnVqr7ohugC4q/1neDbjA21fl+QhBWpvcBhMd6POohyT/3P48YbBFIKl
	 fuloMgjfg4PZbg0GVN63zTe+z3kW90IZFUMC3zORC0LtjVG/VnGQx7XNfD9AMom8FMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhXnytXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5zRIq7q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1F606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 11:28:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C1F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhXnytXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J5zRIq7q
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAFvN1476093
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 11:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=; b=lhXnytXDBomRVi5N
	B8uWtpFK3OLxc/i6rmBSnSEhijKn8z03PoY5wyF0BKReeyYxvEGxkeuONZuZ42Gp
	PmBu1FFrjCy0QDLW689g4c2roJJEmzSHU91xlXLMGDqSoUJjDszqtgbvaKk3qKyo
	JiNCFZR1Y3chQSTfN/T9+R701QiXxDfdrI/nK9q9wNFxvJ/RHb8BAGpov507Wacu
	nuY5oQSCdYeH7tmn5dd9LPLtizfwMW+FkkKl899Fm9y+OGMAhJBeOpT9v1xilf1K
	qEBrkzeBlguuznoYDWm5adKMYacQz4TQ+yXlV3Va+/y9susfj0pjKpk+3KBnkX4Z
	yRRhNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hhkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 11:28:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so76570585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793705294; x=1794310094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
        b=J5zRIq7qlO0fCPiM5iyykB4m7liB46k+5ssjGbFOU28maHIKksoe3XgRovIyYhbVYS
         LfSb2qOlaqPHTQ2tREBOM3g3mMnnqNK6Ta1PzuouAVja0DkR2Hp3naXEwYGju6M4VmXW
         nM5OHaNl5vG+S6l++6+qjlaKDt/R8JUCbNjDeRzSHxnIz/CLkcttqlQYNIjf0Ukrk200
         jpGel6kqGGjxzNBuEs0PBWvHLe+G+QGePohs8xel7t8Ml6aCmrNQpcbFV5al1FVU5TVc
         P+XZRyf7oAGj/Imgufleka2c0cWhL1dSpcwPp3hLR1VNIJCV8oVtJKRSCX33uIMVqasF
         fQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705294; x=1794310094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCHWzHMBYLC5oIHSiuIaJzKU448vWHYxkzVR50GakCk=;
        b=biJwGYs5fs94BDrRU30Kz61+9rONJLeHQD0rqrt9HmFA96CaaEyXZ/Zdd0yS91oYgS
         8EMaA/C4wH5XdhE4YiFch/MIpG/mT/Bz6X/mtqqdKHKAUVvspfnVZimLqeM+ChBrpwFL
         1s1d+dJ/cLTTZ/xZzMiqc1IdkaoAh8PMFaKZicV+DuKcoAw7Bfob9LEYkEnISe7LOj5v
         rsFugjvWFR9FckPXul23CqGHRBL+odNc/A7DIR774BWfR77r/yuoUk6eBdV0ZBzqEmZX
         NnjqWaW8CG+1Qjs2VIgmKKig/vzgLs4haPygJ/ftMhPuDZMF4DKAv7kgqwy60/lHIg6S
         Uavg==
X-Gm-Message-State: APuU4Z9Lzc8mcPFiBBjkmcaYLknIsdm8X6L1KtJRQCnVo2vUG7DShahF
	CcrhPgySG1GFLf0qTV47W1dyTS1rSVFungCpOT3hSpaM78g+8YhzBfRCkuxiYn6X9rNQrvSBj4T
	/MhvqRR3idoqeEDPYOvbZUJw6QmNG+T9uVhhkd3v8sOLEEiR25ROppMO+3HPRhdWXVMXY
X-Gm-Gg: AYBFou0g9gJfaV8fIi38XOZyNVB4Mx898KltRVU41PhL1xLjLCE9+2XJoddalSyK5GA
	OY1En0idKgjYiCbx7zwUSVa5H1Gp97L0oiHrCuaZrc04/L5wqlFz4FXwirvd1UCeBZnHrsutHMY
	GquIG1LzxfScIlRYT45ueFQmVdxnCFd1fUxNzxZY0sRmGBvySznPs8QXuGewYBHsvv9P76oukpZ
	0PvEIvHt8pxCpsiQ7NuNsKwPcjN3SUW8Z60M4A6Y2sSpv0lTecYgw9q5B2Sb4Ux+DGKgWGUv7Xh
	WdxcpbjUaJn9Bl/McDWvyCaKVwwkjPfGGLsd0Q4YjxM+YezHGL1hYJSHqUvAA2n8+rPP/zxQ0T0
	zQdSAjYawCzrSfAZHRr/rqt6CxWrllQVOxpH2ptvs4INBTFwc9NENsocl+aWhk6qMJWOInw==
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1995201185a.5.1793705293995;
        Tue, 03 Nov 2026 03:28:13 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1995198185a.5.1793705293550;
        Tue, 03 Nov 2026 03:28:13 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf49d25sm76802366b.62.2026.11.03.03.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:28:12 -0800 (PST)
Message-ID: <a4151c32-bac2-40ec-86f3-59d4dbfaae62@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:28:10 +0100
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
Subject: Re: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IojFpOHMbtZIppRnYkvsHDicfeCC9c9y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX9ztbijO9Em+/
 +Z1PwrXQXUjlLzU7+B+0v/Ov0QJVV4alochmXog62kRSkKRsajz66ti7fhKGgn/tw7U72O6nJpX
 TJwQoa9HJggRi1v+juqONtqBwNvw9eA=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c54e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7AxDZKSYRuUxSVEY4VYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IojFpOHMbtZIppRnYkvsHDicfeCC9c9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NSBTYWx0ZWRfX/EhLTT5P+RgL
 phA1U+MSMhFKPRdSK6FLoVNeOpK+CGPpbT8+mj/EvfTfNq86OOBc86c12lbLVR5VT8RuVK7zINb
 r3qSwAHQHZ1Ylsi3rUYZJu3lo2In5iPVPsMo0fNC59u/C1goXJ/JilcZuKAfkoPiM2MEUvWmGiG
 N9amM23/3pOTV3/PXWPuj+g8snXTNffkTGoK9f7gM8CdHg9fmX22opZvVjhMfPx7emHQjGTQxvS
 DS/I1rwUS6mQeT8Wf59EawSPk1Ql27z9XWy4EizFOlbZLped8+AzsaUchz39E0uM0kmmoz79wWk
 S9yAB0jvwG3mp6hImZuD9MAFfC7YdYJjAmKxRwtWpOw/WDGVUys976dZD9BKgVZR+HUalm3q2SK
 IKYSyJI2NcMn/BShG93bhNc+KX4FPfoFM05mS/QEJ4wYHWmw0aWvXlrFYkAv70chKA4w9G3HEOJ
 dvMDFZNjAzZdkxRlalA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030045

On 11/2/26 8:00 PM, Rob Clark wrote:
> We need to move the gpu lock around a bit for the next patch.  Use
> scoped_guard/etc so we don't have to make the error path handling more
> complicated.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
> index f12701e286ec..aa59b28a3392 100644
> --- a/drivers/gpu/drm/msm/msm_debugfs.c
> +++ b/drivers/gpu/drm/msm/msm_debugfs.c
> @@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
>  	struct drm_device *dev = inode->i_private;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_gpu *gpu = priv->gpu;
> -	struct msm_gpu_show_priv *show_priv;
>  	int ret;
>  
>  	if (!gpu || !gpu->funcs->gpu_state_get)
>  		return -ENODEV;
>  
> -	show_priv = kmalloc_obj(*show_priv);
> +	struct msm_gpu_show_priv *show_priv __free(kfree)
> +		= kmalloc_obj(*show_priv);
>  	if (!show_priv)
>  		return -ENOMEM;
>  
> -	ret = mutex_lock_interruptible(&gpu->lock);
> -	if (ret)
> -		goto free_priv;
> -
> -	pm_runtime_get_sync(&gpu->pdev->dev);
> -	msm_gpu_hw_init(gpu);
> -	show_priv->state = gpu->funcs->gpu_state_get(gpu);
> -	pm_runtime_put_sync(&gpu->pdev->dev);
> -
> -	mutex_unlock(&gpu->lock);
> +	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
> +		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
> +			msm_gpu_hw_init(gpu);
> +			show_priv->state = gpu->funcs->gpu_state_get(gpu);
> +		}

My clanker tells me we can't grab the PM reference before a mutex,
as the recovery mechanism depends on the rpm count being appropriate
to let it drop it (and kill gx this way)

Konrad
