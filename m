Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E272E22B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 03:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815358; cv=none; b=DeTS14Zp7j7tJKljsk+PdTE/EiZQPP64fGP7WF0yFnuHwyTEAf0RpjshFzgoimZrXGXAFiRenn8+acLxxoImM5uhXIoimN2nhgWdlCboBbhgeHrcd6xwkmCOu6qGBAh3EnwnLflWrVd13dqc48/HotL37PRniWJgBvHIkKrBuFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815358; c=relaxed/simple;
	bh=uRldD9+3oyDXVJuPrrx5fy1JmUONml1QdQ/guV8X7qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngLVA567zsmJxZ8hzlgLBSa7C9DeGskVMi7GcUiqYpB0aj4Ek3dmFrV3hXyVReT/wI625nhTV5Exz8DHNTBsaKPkAfHonYT9tzdTEhvmM75rvyUCCMz2Wrw3y7BCFdU3czdLXsp/fTtfm70Geo4wT/nRFtfZ3zKPrnxIftmhM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSazBtjs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ132u8i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSazBtjs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ132u8i"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67429qkR2204129
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 03:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XheG/6rV2f0cZ6qhmU4lso6FOAuMcYX8VwnAe6UhMAM=; b=VSazBtjs/4QVpwCD
	ZNTPOi2fm0tlMTcXDdhZ5F+VdTLCnv52Ty3cbs+EmVYThOKDEukk4Jdl+JdMWSBO
	/QWvgEUEvY/1l7/1hAV5mUN4/FihARS7JGd+JQ2XMB09oZUf/rDIbVxblvLB3oP7
	syffj2GT9FMqJzBYDlyXS9YxR0N+/skJ8/w7xHKGQrljNGN71K79EmC5uic8dYk6
	95LhwUfg4AXRIqxDjg0hW8PuVyJqL54uYAfTZJR5imxRJF9ujXs9fBP0XRshK62/
	ieleElmM0OWmHtY8RGBGovqQ7U9O2eoY5XCC56GPqdomL4CIjVPDis8tvFw8447L
	xFZDSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7270awe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 03:49:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so118461665ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 20:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785815350; x=1786420150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XheG/6rV2f0cZ6qhmU4lso6FOAuMcYX8VwnAe6UhMAM=;
        b=WZ132u8irFeN30Pbvke90AP/dCzubJgcPLrC8yxheCuuhxCiO2iE/cRcMkxNSt4c/Y
         hCuTIPXndHnC1gDrv/Fxjm3YdTabsiWTGVpYBy4pnjb/fOGl12CEUE5XTPNppqAI8sTo
         Kab2oyDwjE7vtA1SA2N43KD4kdc1HPk0/yDyrbPv7XaYeArKh9S53dk8SsB/zCodFFDN
         Nhkn0dxD0ZKWgNdsrRrVqicEyXG7Os3XMttr8jgN/LJ259WeQn4PWw4I6WzeTBb9LrSl
         WMVP/HklKaXCnrEi9uRNNMTsacw/57F2Xl3HcB1x6zLVFEtxaWJj1NBHAAobeo/uu2N7
         j+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785815350; x=1786420150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XheG/6rV2f0cZ6qhmU4lso6FOAuMcYX8VwnAe6UhMAM=;
        b=Xk0FIDH60PAg7tHwBN0tTijdhmlqoFV7GERlDgFn4l37PEnkQMgzFo4VamboiKsMmy
         xNjgNhziRVWXNdz7AH316RF5QWtjY0YKNfu+epWe3K0wtYV626oVjB/YKa8/kJhLQ9Pd
         bxXLg5qg4bpET97LPNitHWjjq9QK1oCrYIou8RJuiv2KkN09XBhR1k3C/QbWS+DTermL
         j45mjfGyK98YFRQHkC99tQCg3od4hWQBtSvWWXBs7NU/WjJw3WcQYE1CaW6VXhjCNJir
         HL9irsrnkbmCo0ee34L82cu0h8szKmXOxg02hSrCxyQ/16rNoM2F9a7K0YQE8WvRuaUU
         IPYA==
X-Forwarded-Encrypted: i=1; AHgh+RowbCZyTKakCnjTS5WqkATcWynKBBT1O2Tup4CNH31tIZiadegNSAxvA5pK1sKATGRpCvZ3EFr0Sg6PDcaK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZu3pI1P/sJjYknK6SJxys/q+muvarFLhuZFyioWkZXj4iEOh2
	NDJllpQ9MG3RBtDsKVWBVVxx/b3FDSfATSNld5MTQud5LdrrFhkbhny1ng1GAsiylK7SvBqmdFQ
	mRSeQMGEedLW6KQwyY7LeaOAEm64FwTuLEb7prdTGHN8HyEv1KEXWytAGyE/N6EOngNw=
X-Gm-Gg: AR+sD10J15vHNf4c3Omd5nGbwe9IrT6R7UtcgQ0dztbJrE4aOTNCr2AbgqoTGhVXKsP
	8szCfSSi4r1aO2EXhFJksQdXQugeXmcTNg6X3DnWNyRcBP/WI1gCPq4WWZv9SLhvh2EzKhQ9VIn
	J2YiqG8iu69TD7InxjJD/bDfBLr6NF9ZyehqhQYJdkyf3DX8kSF0I+W9S/YoXPAn0IFf7a2cygA
	PJmdtTF7P4SbWhFj5L9DqvKBHhLc/VBocNOrPwGh/nPrJOHQasjONgWBHsMcew5UuEYxm4kQQUv
	XC2bN5nRV0OuIfYfVnlyRfr1ST2GT+r5QrbqEFTgRN1twcqI1XecLpT2Ty0HYVEMaxxxrPrj0CW
	EY8MDir2ZcENIem8JzCPcCocT/0CSVKN+gQ==
X-Received: by 2002:a17:902:ebc2:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d0521a56ecmr131899135ad.10.1785815349715;
        Mon, 03 Aug 2026 20:49:09 -0700 (PDT)
X-Received: by 2002:a17:902:ebc2:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d0521a56ecmr131898905ad.10.1785815349304;
        Mon, 03 Aug 2026 20:49:09 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.118.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae60139sm46681795ad.29.2026.08.03.20.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 20:49:08 -0700 (PDT)
Message-ID: <9f11db59-5245-4bd5-afbb-485500d37675@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:49:03 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcomtee: fix kernel-doc warnings
To: Babanpreet Singh <bbnpreetsingh@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260802003956.7-1-bbnpreetsingh@gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20260802003956.7-1-bbnpreetsingh@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAyNiBTYWx0ZWRfX7xhYrR0qnk2m
 RCKY1jFsbt+qvvgze24RksjOuLkRlOLPoMBXQ23diee2FXGtIPL93CTydbcGjnJY/jtzT0SVYmW
 fTOB/6021cwNop5InbDd2VsAjFL3D2Q=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71613b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=P7rZ2Udeej982rJtnmwBRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=wsK6t3w6FQtueOB5nkoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: -jDxvckwtlDy-IFHIbEULVEowpQNYO4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAyNiBTYWx0ZWRfX/cHFVvs3WJ8n
 o4sXf8uO9hNe5cPcjbYoW4EQKTnzhFp/WEVkF6NeoxDBsDtfirI6QGTNmKT+85r3So6sNIsSdi2
 O1QHlbsLfvkO1QockZy3gfxaaMuYgYaPRTNVSVmNcDdzg+Tu93UuDjmi1Bhl1IAZCGQ5/vN4p5j
 cYg51ZDvjyDeyXE4H1pf54A5MBV5KOQ1l4Xy8J+lg5zIWG0Z1wttWCoa1Xp+6vxrJS8jbywGQFK
 TOV8k8TkwxWrXj2rwFF5XZwbvza5mGWQV7HvAMw42g4h/HqUeLcGGPffmFl2Lz8+EDTfWB/BAv5
 HsyHQ1QpuLfSpd9x/QmBuFf6lrqYztYk7PVN//l39pTRlGSRW2dVlAHa8Z5EjGmgmokVbI7YnNx
 m4ArTCW6NNoAepOgEalk3z2ic6nI5/ILc7Bf3nWMYL4vMVAjAJzbxlw4sG2BjPTwn0yC3Qw59bC
 i+W29vDnkVA0uBFk67w==
X-Proofpoint-ORIG-GUID: -jDxvckwtlDy-IFHIbEULVEowpQNYO4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040026

Hi Babanpreet,

Thanks.

Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Amir

On 8/2/2026 10:39 AM, Babanpreet Singh wrote:
> Fix kernel-doc issues present since the driver was added in commit
> d6e290837e50 ("tee: add Qualcomm TEE driver"):
> 
> - async_release() documents its second parameter as @msg, but the
>   parameter is named async_msg (msg is a local variable);
> - struct qcomtee_msg_object_invoke documents member @ctx, but the
>   member is named cxt;
> - enum qcomtee_arg_type leaves QCOMTEE_ARG_TYPE_NR undescribed.
> 
> The cxt spelling is part of the QTEE message format and is used
> throughout the driver; struct qcomtee_msg_callback in the same header
> already documents it as @cxt, so the comment is corrected rather than
> the member.
> 
> No functional changes.
> 
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
>  drivers/tee/qcomtee/async.c          | 4 ++--
>  drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
>  drivers/tee/qcomtee/qcomtee_object.h | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
> index 31bff4309e672..5849e51612033 100644
> --- a/drivers/tee/qcomtee/async.c
> +++ b/drivers/tee/qcomtee/async.c
> @@ -97,10 +97,10 @@ static void qcomtee_get_async_buffer(struct qcomtee_object_invoke_ctx *oic,
>  /**
>   * async_release() - Process QTEE async release requests.
>   * @oic: context used for the current invocation.
> - * @msg: async message for object release.
> + * @async_msg: async message for object release.
>   * @size: size of the async buffer available.
>   *
> - * Return: Size of the outbound buffer used when processing @msg.
> + * Return: Size of the outbound buffer used when processing @async_msg.
>   */
>  static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
>  			    struct qcomtee_async_msg_hdr *async_msg,
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
> index 878f70178a5b6..5d7b21fdd3688 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -112,7 +112,7 @@ union qcomtee_msg_arg {
>  
>  /**
>   * struct qcomtee_msg_object_invoke - Direct object invocation message.
> - * @ctx: object ID hosted in QTEE.
> + * @cxt: object ID hosted in QTEE.
>   * @op: operation for the object.
>   * @counts: number of different types of arguments in @args.
>   * @args: array of arguments.
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
> index 8b4401ecad48c..d5de02dcef3b9 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -74,6 +74,7 @@ enum qcomtee_object_type {
>   * @QCOMTEE_ARG_TYPE_OO: output object (OO).
>   * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
>   * @QCOMTEE_ARG_TYPE_IO: input object (IO).
> + * @QCOMTEE_ARG_TYPE_NR: number of argument types.
>   *
>   * Use the invalid type to specify the end of the argument array.
>   */

