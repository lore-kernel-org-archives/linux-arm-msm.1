Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735052147E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792070; cv=none; b=YJqlBFhaTRJmcGK5SLUojo5CtMZBu1IhFOqYOU+1GWcOAcasTvo04m44XAbZpJhweQTCc1qGJF6EeQBjmqccvBBPnILIgEaZca+xwpqkqXzNp4INgRwCKJFPthNEL4XCIWqBwI/XmGsdXN/+T2CCMHxFANoplTWV3OG3gzx89pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792070; c=relaxed/simple;
	bh=2UE1slJ/TuqtnCQfrrKjh8A7RNcnR3G6JBVTg+E/JL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoolIDyb8lv1JuXwWPAlhYxrRgkUdFdFLpn3UbKSwkoIAqABBV5nzFg0glgPjlO0CEpBV818mm1D0xk+YI5jACWHi68sGLV1CWUz2MgIM1Bgr+VDd2qUISx5xWQv+oDxNM5S/UKljRxPc9JsoXPOczWLme6mS9TDQ2TpxY1wW9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/iGb5yh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czTZqv/p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/iGb5yh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czTZqv/p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hdS474955
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=; b=R/iGb5yh5gV+VzRZ
	yCFEkH4d4rDnR+vKoe15fRaCJi4R42/mdiB6NmcJrF5frK9CRi3rD8YYWU2pyb8v
	OUVigOu78zNtDxDGKQJmQjTq4oHP5b413jrhdmFsg0VBon054OMYK/KYZCZUia+q
	Nw1aiu3pupkVf7mrgTgolwvyR1DMps1/4jTDyCRPZMgbB4BjFAKcdfC0NYj/O9S5
	GZoMfYcCBDmj4obyPe7oZqTlMAl0VhU6mL/9baAWZyug+xKCnMO9Mny2Xel4px/W
	kWHFX2jSt5qEiCBmM6FQsUNLHaYw5hVsiW8VcRGvOzD6Xh1acjR/zrWWfkpAFXt3
	Zgfvvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9wa7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:01:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so6410185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792066; x=1792396866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=czTZqv/pjeDAvGeb+1fWuI59V/zjKYnrk58c0H3ya5HpQe+FT2dP98hk6lifsNJCiS
         PiZJCOwNVAqwDWoJdnvRgk8mj0C6qs2BpJbJt0zy6b+zMmvH9AM7mWWDzjc/kIJed4hH
         svQL/LItE9cT+bNpWOI72LmXQY83lfKuZMyIRJI63rWPDjKtHshNsQFBWCkgQIdjCmg+
         cm/IglW2JmHn0VxXMsvzzPFlVrk/DIVlpd7lnKa3Qd3knx6IBGr+gKmeXjzsmb+RwHc4
         RNKBC8Skf3nQpgPXxF1qGiru9ht986G3026Cwvv7jL5HoHMNri1DVh6SKS/rTD9iVggB
         b7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792066; x=1792396866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=yj2oroDZRNKDNj7Pa73IOcXYNCIwXojpz+byUx2eyfG9hoBU+oeBfwbJKkeUnns8DY
         vKYdpqwvfEn/5fFzC0m8pxeIsblgq9ckQNoHkblgdB1sSccUYqP0/q+2iREYC7s7J5Eu
         T0jQQv7qHnvLYeCZiFqeZw2mKwJ0mqp4OmWJta2JwVtGgAj39N5na82iqUFg2B/vDT27
         8Bad8nMAvu+gqHQ4/5pPYrDvqRHg/ieP8LazESLD93CWQibigqgxYuM6XVuadu5gKjZ2
         vMUhiu/gS8C+K7ULLfITK4F7qjz+CGspSE48+grXI0reUfSuZbfByxjNvruQmIEmzGgS
         TpZg==
X-Forwarded-Encrypted: i=1; AKwUvBz1pgc7YrSpDuoZZ24kCo71Kzt73BTs2EVk22jBHvnUH7Wf3/WfFkYDXeX4QU/qS9f5STw661TwNjo+97aZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKgSwyrlN14rBVR46D3sN5JNILNqQsRLa+t7pRF2BOP3M50QT9Z
	u1bNtPcYKZ36kZS7KO/vRTEDrGh9NXv5oqe1TtwzVCypkcvW+WuWBoR5I0N5OeTMH3+8e9x6bFF
	08TLf8Hz2w+n9otGZy9+w0FKg0SMjSG4KS9ncZSQNcoQ3KVcxEcvrzSsiDI0YIgjKVVuH
X-Gm-Gg: AYBFou0S0pWHQHxEHcjYrWHQ47bGg6c8DjsWrdeyL9Dna9G6aFYnNEvYwL4OAwYV/z4
	cCXrw6giOtnBeZ5oyn7N+fdIk7HKkAQjECAta/yMPhSo6MFI8Gc1ia8Wj0+nTYl5y5Wl9QipfjG
	Wg4b8meaXMYvFoDuD2klLvJCjM6rFBlAcv2IYV4vK7tbzU7U3CELlCuPNaR61K1wl+A0kF6Y+A0
	Az0y2Zuo16W5qvSa+4rK5FrTUqSf7y0JbsEEp+QSyR9KMKHAWfXvxRAkyziT4EXA1TXX2QLz3bf
	fYffppFBw6Fgm1sZCXGiUwRxxeAwl1emtQppf1ldXZaGSGVp2cXVwo4kh53RoSewhaErbwzZGZ0
	e52nnhlIseGszwAlLFfbIBg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661417785a.4.1791792066186;
        Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661411885a.4.1791792065667;
        Mon, 12 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9af97sm27169731fa.14.2026.10.12.01.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:00:42 -0700 (PDT)
Message-ID: <d33eaab8-2933-45a9-a716-b3eebf3dd9d4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
To: Xilin Wu <sophon@radxa.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc93c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ksxQWNrZAAAA:8 a=KLRTrxjsjmTHsxePAeEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: fzSxwz-pCalrOpGpXgCppfj7renFQcUB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX7HotUP1eFozS
 U0JEf+CiLg2hJHoERWXQbBcx/OFZvjHmXbMlbvf/VB9Ow0WkgWBsojYfBVlKEBycQWalSAfYs31
 D2/xzuTMpIhTTwV6MR8mf4ylMvAM6Gq5NSERNZnSa+EOMQoyYjEkI6we3znKHYO0EFXYOlV1I/e
 JdcpLBbjz55hRUlsKf/p9RmhUGHFFD1cafeiVXo0BW6nhTVc2ar37DqQmyBkBIQP/I0HRE10KxQ
 PlKft+k6juCrAPTafZsdoXIBE9waOsAjYBpMW1bWKikR6nyiKvMiR1jYoDk4CcI/iLDtG3o+XRZ
 5xPGyXAixu+g0LfOxfwHo0YCOXFD3LAWUxUlM8ZF2UEnnLgv8u38XvkjVT/Bvtz7WXUe3qtRoqy
 n5e9j6dDJyGNyH1F+X7mh0atM9hNathTPPSBF15piqSu+iDmiMo36v0teuzA41TjfLFpa5xNfeB
 jELRTzJmR/BwT0YyMXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX4IXrlV1iBsp8
 sm7sIP55/VTePgwphWH29KmHaTi/H5cepVEbEoS8A67u5ThEQGJMz4+wLD9q/wVwRQTCIpiZhvg
 QYrYuhwgwOvGJmGy18ccdexzhKyOlyg=
X-Proofpoint-ORIG-GUID: fzSxwz-pCalrOpGpXgCppfj7renFQcUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120031

On 10/9/26 5:16 AM, Xilin Wu wrote:
> The MISC0 update clears the bit-depth field but only ORs in the new
> colorimetry value. Bits from the previous stream can therefore survive
> when the new value clears them.
> 
> Clear the colorimetry field together with the bit-depth field before
> programming the new stream.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 791bb3af2cad..783cafb22374 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
>  
>  	/* clear bpp bits */
> -	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> +	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
> +		      GENMASK(4, 1));

The colorimetry field spans bits 7:1 AFAICU and bit 15 means
Y-only video

Furthermore, I believe this register holds the standard fields/
values defined in drm_dp.h near

"/* MSA (Main Stream Attribute) MISC bits (as MISC1<<8|MISC0) */"

so we can drop the local defines

Konrad
