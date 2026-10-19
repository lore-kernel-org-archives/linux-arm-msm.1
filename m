Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4724229BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394746; cv=none; b=eq5vbyN6drpr+gN/rxZsTh3l3LKvb8T/L6RG4W0PXodoN8V1k2d8UeecB9yuwu8f2r3R3PWNHRCdZvoCJ/l5TzPlgIq7tMy/Qf1weoDuKK1XtRhYrwY2TWOqvzEl/fZow0Ouva5IaWeb4UZr2uQR7VXECPPVVf9nglCl35Mr++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394746; c=relaxed/simple;
	bh=xWF+QRQlDHw2ZGGPr2Qc+26xZ821hZboGpCCtUdZvxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL8LFr012w4d6hZV0q6tPZPCEWVyDpExEWUUnpl8a9oTa2AIM7jxIfMSi+JRJzdwhgPQuGz0wRCux/u/S6Po7DDvubKfr9PzD13hmHZiVs1aQWUrDCceD+8LAbYjn0Pxg9LB1iZZ4bWpL52CDWxDDNUNJngOL0tqO9OY+i6UBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOjjp3MU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUcFSnGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOjjp3MU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUcFSnGl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jP1r2179776
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=; b=EOjjp3MUSkwizsaF
	IqkUf91goeslH3UufT6jF6APm3EGqyy0/qSkQ6MyvY94WHeIaIiRgDBdJfghrKBW
	7wiPdeFoPW7S23M5fM3jWZ3puEOO5pu0ZZRVbtNEwx+5jhI8M6Ca7KLtx0afIJQ3
	3FHT43/fA0ebJJXNuvJSyyzWUMMoGTZtQycKEgy2ogxNnDG719aRdz+f9nTqfF2m
	bitzrigml7eZzC5+DWB9TYg4vy1FM/+hC9WPLCDR82D3XK52nHyvsvFxUsZr0z73
	xBKknc8RKPp1Yql5Pl0yMzxv71vin9aGfxmFJvFBQIt7nsnEKQfDuyCaV4sKjRpc
	swkLHw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hhnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:25:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso5571263eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394743; x=1792999543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=;
        b=NUcFSnGljXzNoMAvU3ErXaaZq05yLjRSya/+prWbwpqQ1pyx7XWzFiz/WWMuLVkRoP
         //2lyvegiJEQ5Tz0AEPOtNshalk8swUBanNNKx6o/q6bX8jzwo02fDRf87YiWBr7f8cZ
         pyW+lFOqFSUs8t8apTedVKVtf1n2hVhOdQw94feCWKO8ASS+WkXXSoHv+5+4TKPcQPEG
         3SBj7eGIgxFFI8ADeDz8eQezw6+Zb828hNglHWaBLCh0AwLwJyXeh9VG7Q4H5NpJrSSa
         uk0YOYaQ7V2Z4gAsF5mBFatEcqZhrnoeI3Hoo7zq6s6XMvsDdNiqmnMjZsj9o50FKov6
         YZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394743; x=1792999543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZT348g/Ac7kP8wYr12fgEIsNfhFaNR7Am43qhu+KN8=;
        b=Vz6+Z2xeqgxafozrwAn9L1qabx3/VkhxG2XorS68d37GbOL95rQTrKuT3m25q6GnYX
         lBJuEpjstR4sWNVzKpVBRqP1oet7XFpcEwA4bmuK7MhQtAIiA6Fv6MxBUHjycM/oH2Uv
         tyJd9YQZSSn7kLNxxQ4D1Hk1CiMjAKK+1kjCe/9x1UYlm0xQiCYu2qWP7O+x9Htz9seC
         6AgSffrQUA515RR4CgfXPhJNhQRjeA9HkLp4pYhGGs4DZN8Qam1faApOB9RJcuoMovBi
         tH+/YxYvME+osEuVmiexix2lRNAYIPPAp4wk74P2vkzSRPoHtioDxnXu4QmQaCR8Mjon
         MKtg==
X-Forwarded-Encrypted: i=1; AKwUvBwcZzmQ7VMessb2nJag4EyE2ZRU1UpieuYonfU6lb4m19Syzp4pgLTpUI0ekG0dfl3ws5CRL+z1sCsaw/KE@vger.kernel.org
X-Gm-Message-State: AFq9FYIA4M8PoqttGM7Lzjz64BknQk5NSsko3M+wr3rdRUS1QXu5fYcI
	cgmLHCATYgE+w5Con/Qh++teuk9Lw2m8mlk5vza74TcUcj7F3S9phbYvjWNdF3upobCIjCSCQHk
	Vg/q6pDpd02iL0ObSIgkN68T0pRd42Iy+c45rwenUv6ifxgkapyexWfzf30J3oIfBjrTk
X-Gm-Gg: AYBFou0K+4Tg3VfgqL3OrdtgSzk+Ro3KZK0hyMlmwT0pZ+t1UIc45E7E+udBsFTz3vK
	w7C2w5fW/FMplCk8qbS7NtqPtfq9bS0wTNo2OzbR5nrBInogEkTSMdwXgBUOPwNXGQHL3j1O94s
	jzJA8LOfdqguPQFwNIIee0sevyjWlLQgPVfcPob45AF/FpUZJ8jzDshXl66RYAOU5SsYDoTjbDv
	gRShwdhtAHM62q3PVLQcz6SmMWnyAuhxeEQ5XGAR3PVJE2uKXErXjytX8iM2exrtfBWsXGwE2oL
	GMcRHKXB+PvDeGxeluq5cIUXgy2Sq/BY0DVGZYMwp0PTlbPjuk8/1y63fn6BpgBd1rNzfnz+O+4
	csSC4dvJnyJYn9Jrt5au5cDmc
X-Received: by 2002:a05:7301:2a9b:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-361a1f4fa38mr9834548eec.23.1792394742988;
        Mon, 19 Oct 2026 00:25:42 -0700 (PDT)
X-Received: by 2002:a05:7301:2a9b:b0:35f:6d9d:af68 with SMTP id 5a478bee46e88-361a1f4fa38mr9834518eec.23.1792394742408;
        Mon, 19 Oct 2026 00:25:42 -0700 (PDT)
Received: from [192.168.1.7] ([101.0.62.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm37292247eec.20.2026.10.19.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:25:41 -0700 (PDT)
Message-ID: <dfe968ea-d123-4e94-9a6a-5dbc21ae431c@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] misc: fastrpc: wake poll-mode waiters on SSR
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261007084447.922-1-jianping.li@oss.qualcomm.com>
 <20261007084447.922-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007084447.922-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gsn5mDFETTqr5Mtfrl8khqGMImzKrE58
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5c5f8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=sC8K8RXUWm68HHFV/PXcoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ibi0DqZ3yaYieqUivDkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX0mP2rmzl5C/f
 z6LYUxnuFiXciwSf3f6dBnSJ6Zjl3N3x3M4mrYXBH3+HDwgqTrLqQvGOZKUHGvsajSmxCWmv7KG
 I7pyRiTA7R8GKFOZ4BYymeeGHVSDnJw=
X-Proofpoint-GUID: gsn5mDFETTqr5Mtfrl8khqGMImzKrE58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX3XwqKD28Q/PX
 FvJf7tsC2+5AXd4uTo9Fr2b9gtpOoK1UJZ5I1icgfqkURQowJdeluE7eaPCO+owDy58+SWBe05n
 uYxMeJRdrdwVOFSVv5Xf80t0sg+V9WS7e9Jer7vDKyZTwks/pZgErNPjN2Ryz+6/QaK++zNykDr
 VvSUWXonKC2hAAtyrCafbvz2d1GZRmtoleTB0TD27wmS3KkAvBUDanQ0p9y4XqBqbL3DCAgYcGv
 daBhk7sIRua0LGYuJVmtmxf2giZYzSEhnWl4POYWrcocF+k/KYfpZ0UXYe+pzlhbIOWogumOHnf
 +Qz22Nt+brYACYH4GjEgK1/THLRUEdDbbg+L8QhVR+Aqg7v/QFKpeUj0O7QmVYkxrDpGrgjQuml
 Cfu6NS1f33aG4XWBq4QQzxqNosJNFc25M1a7Kx2V+rJmlUpLHagfnwUc/7YBAqfSgPmhLpInKgi
 i++DKJNsRPyX/WVy4Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190029

On 07-10-2026 14:14, Jianping Li wrote:
> fastrpc_notify_users() sets ctx->retval to -EPIPE and completes
> ctx->work for every pending and interrupted context, which is enough to
> release a thread blocked in fastrpc_wait_for_response().
> 
> A thread using polling mode does not wait on that completion. It spins
> in poll_for_remote_response(), whose exit condition is:
> 
>   (val == FASTRPC_POLL_RESPONSE) || ctx->is_work_done
> 
> Since the DSP is already down, it will never write FASTRPC_POLL_RESPONSE
> into the poll address, and is_work_done is left untouched by
> fastrpc_notify_users(). The thread therefore keeps spinning until
> FASTRPC_POLL_MAX_TIMEOUT_US expires instead of bailing out immediately.
> 
> Worse, the poll address lives inside ctx->buf, so a polling thread that
> has not been told to stop is still reading a buffer that the SSR
> teardown path is about to reclaim.
> 
> Set is_work_done along with retval so polling waiters observe the
> termination on their next iteration, exactly like completion waiters do.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

This looks to be a bug fix, can you please add Fixes: tag?

> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 05b2e7e4ad3b..c54c450cb571 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2663,6 +2663,7 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>  	spin_lock(&user->lock);
>  	list_for_each_entry(ctx, &user->pending, node) {
>  		ctx->retval = -EPIPE;
> +		ctx->is_work_done = true;
>  		complete(&ctx->work);
>  	}
>  	spin_unlock(&user->lock);

