Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA134575A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478332; cv=none; b=GIA4ehfmEjkrrZP1wKpQQVIkZWvJUlYelTxN4Fa6nw9tRW1oiB6m33Pucf4HzbLcGyt7hvT1PrJnmLQi6yQORQlHiXrKFF4V1LTJ7kAS77b7Zo0yuPwk6UiibyYdb1XFUM8t5neZK0iu7Qg6Hl8PNSS5vqoo+ab5IivcQ4xre1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478332; c=relaxed/simple;
	bh=/VqEbBPXLabhuR0UFd29ORjztuL+BdLMwiLR7GISl9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnBEB5J4BP6Ni3+nXDk/ymIN0Mcs/Qk0EvJmfWtrJk10hHTSqrrEQByFWUT3XZ2cGnEnF94rq+5Aper8SRipesUWSsYs4FM69RZK9DupbDkOrfLFVX4tpma/l28UgUMz89CQsDyq/081UNMsGqF035fsbGStENkAZzmoKgW6rys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WX7ZdSDB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr/XShjQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WX7ZdSDB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr/XShjQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6BJsB3310079
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8UxirRvbXdY+b+94Ymr+F20Oxc3hLoj+iEzXbmXsno=; b=WX7ZdSDBJ2AUzeZH
	xcW0IR1ZmEPsOlWLyRv+UyhYy+MtN4uidZ1yps+8O7vx44GauanFrBOejenSvt17
	Hq1ALDdhVOP0BTFfR3YJQ5mx0hUWhNuigbXJE8WgjT3P3EuvJE+i0bFh8eU2XLBF
	lEn6WoxGggDeDaQEvCeag2UkzQIowJbWpP4DuFe9nM6G7CTQ5Q/HOx2Yqt8TNXBP
	OPs99O/5jk4FfYCoVvpDZsuLsgZ7k4fYkSi3GGujQyQXB7WSajXnl1Yv6VMRWvIR
	2oZBOPLZYB0mEo1Sv125HuhGsLwX3ZQnsM6upjqDD63kaWrUaXaagfs1FNCaFqeB
	2q6Xxg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp7g8032-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:12:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so1418783b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478329; x=1786083129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K8UxirRvbXdY+b+94Ymr+F20Oxc3hLoj+iEzXbmXsno=;
        b=Yr/XShjQdySlkF6HEo+25Zr1zu71dw+RXADcHkJnuuQ0ZkDnUJ5ZrhSOJjVBccSsnW
         caFS4l90ebsc1/SLn+j9ACCRLNQV7pubL7GSfATdQ77auCQ+NfCJz3apsX/cY3p2M4oZ
         kW+qBIlKNWuUVBJD/lLSAj/Davu6OnqRKAAd5ScLDuEmVg86iuTFZcK8mihPFfxjHi1u
         MCtBVAPYSo/tKftCzuvmagcGBOPRa4NIbaypVMmbRvoy+plCkWdJpjniSw2P0BKwJ6Rd
         +pwr3SDq3/7LiHqvtNC4z4cHJAfKO0ANfGFqlejZNUT2JTU2EnXDvp5Jtsh+qRL+i8pL
         mqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478329; x=1786083129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8UxirRvbXdY+b+94Ymr+F20Oxc3hLoj+iEzXbmXsno=;
        b=g7jaEM3tCuIr7pRfmSQDAuIGBuVVqCVdyfsFCPrLXrRk8+JPTKFaCML2LegBAfK3yY
         ocj1l4jOVLbL1TF6V4zp5URBd0GJXPIr4z7wJsNEKwvXrRVjD0wbK9KgUE3zbywQen1K
         /WmkByO3i6pvGW0mxeyjadNQGUoS8MDuhScotiIlaUGDhS3RRvG+RE8x2RXMB6NJ8sdX
         v+OaL4oRvL867iVmREWRq6lYOyrppw0XdxAilHD4AFVTdkSKaseDfc8FhsSBCZMPOrJH
         fmhhWk1apAkN68Zzfwl63TyqXtDtUG/f3RI459zHNBl38EbTvSYg74Gh7t2VUmVc7Tu4
         r1nQ==
X-Forwarded-Encrypted: i=1; AHgh+RruEOyAX/JULt/+sF/zitFrCnst8enlb84l76gqEGXOTR+cNNHL+BAcm2+Fif4PmmepdhvEVNlirtmbsaoH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx93pfT4D2dpDj5TsXNjD2fYEPipH1DmDoIpi2XVuaPxAGqOqHI
	nYmC+8w/8UNJpxEd1rLo92SEUr4pBPZrw7B7P4Cxle7vqosVZsmp6U9m8RXa22HUM/l6jXGp+wV
	GQ/oIcRc5oxoPkBNR8koWAuMQf946El+TWNHgoMhujYIzQE5c2kTZbHIVR8J3dmtqWsdk
X-Gm-Gg: AR+sD11EsC/lN7WmWGM8PjC6fM+LuB8YBXzuN+4Jze5Q6xxfNm3lQzUYXoLhWNt5lUH
	aJGN7C7cFPbiGpdcVC+j6STdr2DNuUjh8/cT10bPtZ4pXS/X9eE6sZKm62/IOpojAywlwURbc7R
	z7aUFrXRC31rX49RFOxh9k4vXFfzb2oPe2HfvtAdYAUN14tGggdod6qZk0VC08sdJ6XhEG6CT4T
	KatctHXoahNVPRm3Ia8jQABm3jZOQvTcYtrotUm3kYK3q4aHLYrrY8RAGjf9Ml5Eb1ldMg5itQo
	JEHactJwHid/V9qt+6KSFzF5mqMhYr5uXFPww98GdhSJoLI5TEmknI58nQsVBRpHQnHuaJUXz74
	lZJVt5LZIj8cHZ9NWtgmbX3kLdD3uaQ==
X-Received: by 2002:a05:6a00:3d09:b0:848:2f84:f429 with SMTP id d2e1a72fcca58-84ed718e6cdmr641348b3a.66.1785478328659;
        Thu, 30 Jul 2026 23:12:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d09:b0:848:2f84:f429 with SMTP id d2e1a72fcca58-84ed718e6cdmr641320b3a.66.1785478328169;
        Thu, 30 Jul 2026 23:12:08 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed57d96b8sm339361b3a.21.2026.07.30.23.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:12:07 -0700 (PDT)
Message-ID: <46caf817-5327-420d-945d-283ae65a511a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:42:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: reject overflowing invoke buffer ranges
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260624174410.6074-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260624174410.6074-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=6a6c3cb9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=tvG3XtUmWFG8HhscTzAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 2U6ANzhNexXOuWFDlx8KP6-319ZLNxds
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX1sM832Xujjyp
 jrQC+2sDqlG1J1UM7697YUdsClhygdpjctNp/lGx0+kd+nuEPru6rwof137bbnNAP4cdMPRbgBI
 W4TL9ftlz2pk3WbFEqpAVTvTweqEjfE=
X-Proofpoint-GUID: 2U6ANzhNexXOuWFDlx8KP6-319ZLNxds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MCBTYWx0ZWRfX52UigK4xJXjJ
 LSRy1acIE55bBC+t77CgUq1k6pu1psYoZSM/R/PiIo9JO6MAJXIvMixv0iUrcgRZk0Bwa+zY3kL
 kl5ovcHthgLshLvXGxemRbIiS903Z3st4+VrhTRhUk3BQi2UOCAnuoTPYP2w9KduucyYbt0fTQR
 pVLM1sF+iHoJxcSy/3odDy1zVs/JhLxsdD3Z1Am0lM3D/zVbX3q+bc+SXVZk3WNx4EoYIIzNJQP
 doxDzsxTOgEyBkPk1hawDefNAHRYnPldUdavxv5z1doj38goRrvusscUk4AOr3/d7VKQ1J0UVoN
 cX6dY9hxG/jIBfZUblc5c3rYufspuFMLFSalsuvggtukcrwjDlFa7fJHGvDpuicRigsyxMXLPbp
 8Vrdva3JlkhHhCMCDaBSKCQhsSyVfARhpC0JgXV5t8pxSoCK7AHM2TFMOwZAoDApMX5y8bBUMpG
 dhf4OHbwfndKo0BE/jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310040

On 24-06-2026 23:14, Yousef Alhouseen wrote:
> fastrpc_get_buff_overlaps() builds end addresses from user ranges.
> 
> A wrapped end can understate the payload size.
> 
> It can also feed bad ranges into the invoke metadata.
> 
> Reject invoke buffers whose pointer plus length overflows.
> 
Can you fix the commit message? Use flowing-paragraph instead of single
sentence paragraphs.

Also use Fixes: tag for bug fixes.
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f3a493845..ba4ade874 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of.h>
> +#include <linux/overflow.h>
>  #include <linux/platform_device.h>
>  #include <linux/sort.h>
>  #include <linux/of_platform.h>
> @@ -607,14 +608,17 @@ static int olaps_cmp(const void *a, const void *b)
>  	return st == 0 ? ed : st;
>  }
>  
> -static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> +static int fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  {
>  	u64 max_end = 0;
>  	int i;
>  
>  	for (i = 0; i < ctx->nbufs; ++i) {
>  		ctx->olaps[i].start = ctx->args[i].ptr;
> -		ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
> +		if (check_add_overflow(ctx->olaps[i].start,
> +				       ctx->args[i].length,
> +				       &ctx->olaps[i].end))
> +			return -EOVERFLOW;
>  		ctx->olaps[i].raix = i;
>  	}
>  
> @@ -641,6 +645,8 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  			max_end = ctx->olaps[i].end;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> @@ -675,7 +681,13 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			return ERR_PTR(-ENOMEM);
>  		}
>  		ctx->args = args;
> -		fastrpc_get_buff_overlaps(ctx);
> +		ret = fastrpc_get_buff_overlaps(ctx);
> +		if (ret) {
> +			kfree(ctx->olaps);
> +			kfree(ctx->maps);
> +			kfree(ctx);
> +			return ERR_PTR(ret);
> +		}
>  	}
>  
>  	/* Released in fastrpc_context_put() */

