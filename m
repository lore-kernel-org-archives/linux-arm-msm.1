Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416A617BED0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251215; cv=none; b=IbyjPPPxilirY4b8LhSJrFu/oAorJ9wvHBQqDPOBXuRYewBdiovXubO1foohlcP+UoAmjoIK9LOnx4hXNvq/QBum3uAmjWaUKxindrQwL6B6n5qMSK7QGSRXEZQHTM1hBL5a4YU4UljEDUpj6LlJPdGss3OfwEA29ScvAn3Z2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251215; c=relaxed/simple;
	bh=TfNg06hRNrMClvdfWUpBwt872dgZiKAk8PYNOBBwsBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEqo7T79139w/CALMDp/pnvsRP7ce3OUsjObHmlv639TcljDg1UkwyZ0iUXIvKTLSypPeZBnW+RY0KzUner6D+blmNMwcn5KhfzlxXeUwwWi1YsIuItHuQtxJ9yts0I4JCnegB8mQj/hY5IZ1hxZ7Xi6TVlB40gR2R58tUL5EAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbDL25U/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=anOrj3V5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbDL25U/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="anOrj3V5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEceUp029786
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzk0wHYCJIe5nmkz4JIZUJPyE7lMjwoFgqtF0y0W4q4=; b=SbDL25U/2geADA3b
	dKw6KHKUZwwavaLllYw87lhC807pNZQInF/NISCbqsGjKfZNA8qbHgKqy5iYF034
	V6jkmWwP/qvrCq9uk9g3PA/yx1DmcQ82UmefVy1mfWgTrEhTDvcCMrEVYu2LBT1c
	9mJxEtnZN9Ezns1wxIuDd1bHpd+LOI7eH0CgfYiQy4rSvBoNyoe0qQvfLMU7sSEX
	2YuVwWR8ekBc1K9hoZrL35It/acpc/RBcyhBgJkVSfMRNzdSf/a4jDXSo0v6cQxQ
	DIufxOC4g0owA2a0/F59Tz9bxl6wXE7Ndx8r35Ib1/JxDtZtJY4h0HNTSwy6oZqi
	hZt/FA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxgnsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 15:06:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-739b4a4301dso3505306137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785251212; x=1785856012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzk0wHYCJIe5nmkz4JIZUJPyE7lMjwoFgqtF0y0W4q4=;
        b=anOrj3V5HqMVjMCzq9Hl77VP+9SluZtxT4KCvSY9wdwns9UMO2OUkyolcDdTiC8F4l
         GIS4AHcLojjevWtvI7zYwCC5qXfpzsJeSr2yAI6n5Jm4pLWn6UQjMCwwhiUFNTbqmtdn
         CmUuQtP6M3dH+558l6xv/S+CaWBMkk0txvNE1G1SIFEp+xaHF88/f72dspfl+cj9br8a
         1nX3kuuRG9KfI8g8o13Rvb53OYuN4NpF7EXe0VsUFkpeKAl/5uWxv3QxUckiF9rtVyAZ
         +H4ihgyiVAqBZc2dZxMDagiHg3FWgXWWWOK8XAWA2n8fRQKnd3DznSuf3wNPkOge/bjH
         h76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251212; x=1785856012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzk0wHYCJIe5nmkz4JIZUJPyE7lMjwoFgqtF0y0W4q4=;
        b=Nj4hd1seEaod0v+XJfO8cesLT84cyLKnZl7Di6A9TViIQpt1lMCtNDfcYgLI8iEKMH
         QA+SdUexaRPSTFU3wVejh2QYULb4qWSD3K4LS7lXq1XTf5TGS3tB4D/f8CkAaJ5gHMuv
         zxrPGs5gMZrXGFSyxQQv1KcYABT5TNa35YvvDaJCXA4BS8WcqHYlHpZ5D97QOOq/DORk
         l8yKPTCBcFocpEGv51XOshjbCQXLhk8AxwO7RhSS8fSGYelYITlIJLezZSFtnE5nYPJW
         7digoKCaLVnttbX59p3a/D1fS2jTtKZPVNm4FGsLQwZOpCDetDPxq7pe9KkCDLEhlQBs
         8ukw==
X-Forwarded-Encrypted: i=1; AHgh+RpkJNhqvsUsr8bZw2HgtYfxvYUL6FbiCfhCvWlfRp7c61FuEhK3C6ynZUl8XPOidH3hMEQU/IhzbzPHz6KU@vger.kernel.org
X-Gm-Message-State: AOJu0YwyhmdHvCGFUbhMUxQjj/H5mnAgWPSIl0l4gGl7w7TbBUGMaR62
	AWxHdZY7Exqzb5y2kDPsjGqlRQp1N0fwZVSahLxquZ4JDGg43LEomQ6dsa+dnW3ugFdvkvVZlZs
	ajzAalXT/PM3OG7ysLUdGVihKRNkylNNmme2sHmZgAOcRWMbLZ2blBwdaYN+FydNOKqod
X-Gm-Gg: AR+sD11Gqk9tThGt+yespdflK5VyCLKHqJkwND6Hp8dinePLPFJr9FeeCfUKioJRPd/
	1cuSmB4wVjc8BL6ekmbwaARnsHexpFrEOFGpeLQgAMpCc6Rj38FWpwnCBjZfo+ARyuXMAxYaoXo
	qw+KLhh5tovgOhzqjP16/XqaGic7JPmbgjOhI7rz7X0c3Sk3wUEscFKDkrxdxozD5Q7yDqTGsP1
	kNa0lv/j0rZNQ+9MeJ3UvBzcJ8EyCe6oZE1OgMzIoe1MhmL0nLPrTmQHhgOY7yPE+Y3TIHjG9uz
	PN4vfXQ5B2VK1xaZljaq2VcvmyO1YxXPLEFcj/wWQcS1ufGRHa6pj9AsVZBqvML9pyQf5frgMt9
	rHEG55JxW+iWpYsv1k5tKV50t1fo=
X-Received: by 2002:a05:6102:3f13:b0:727:fb8:f269 with SMTP id ada2fe7eead31-754a1fc3789mr1383403137.22.1785251212265;
        Tue, 28 Jul 2026 08:06:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3f13:b0:727:fb8:f269 with SMTP id ada2fe7eead31-754a1fc3789mr1383369137.22.1785251211806;
        Tue, 28 Jul 2026 08:06:51 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1c32ac0fa4sm782164166b.20.2026.07.28.08.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 08:06:51 -0700 (PDT)
Message-ID: <7761fab5-089a-463a-8de9-1922da2ff602@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:06:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Drop unhandled DSP PD exit notification
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260728073851.682023-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260728073851.682023-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEzNCBTYWx0ZWRfX7E7zJWMgDR/6
 IzGC+pQBztSJBbDYVc7dpSNeKyLncnRkHf9ulWZ8Nq3VUrDLLwG6juh1WwPskcNeXRGwauRew8J
 sWKYUeHXNVnCI244VgiNw/laLr5oC56EgeNtmKwjMNZuj82bTuTf5mL/BjA5jBs0a73zYsvBLmn
 vzKEfFMNexCqKVUBck7fFzdVHnrc+pRAb9cMuDnbLtNxG+yBi/dcP0viSxFY9EMhMcLiGzaKJXY
 3fWXgETxeows+Rcw53GrJKNIb+lwjBwDaPw0KflsSLFnRAFuz2hgY9YpqN7iLIZv2Qcjwh/tJvk
 qhksH6nuO65GiXwmKlAZjkqz7OHvJp+aXlgJO+QvoJlnqAPWOIZtRLKVoiKlhSaehF/MxOebc45
 MX+H3c/6rfGDMC5ELqNETdqt7rFYJigNZHl7fFRnU1M3Usw7/pedQlmwfjElV5HMwO+A3OktnmO
 ZkcZUOPkrYnseObObdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEzNCBTYWx0ZWRfXynhgrwsrIvv+
 5n+YGrPrYuGEPhrETf3cHqZTErvY9SADbsGuxhbgU/6upAGsvMZ4gAwN3RLfZMJ0UsFLC7Oz8wH
 7p1jZMKYoU+aYPjXP/8ROjRXnAEmPcQ=
X-Proofpoint-GUID: R-gXOkyvcV5KuTCUGWFPOgbJTsSN0Xr_
X-Proofpoint-ORIG-GUID: R-gXOkyvcV5KuTCUGWFPOgbJTsSN0Xr_
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68c58d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RPlQG0zoIX3xp8xdtFQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280134



On 7/28/26 8:38 AM, Shawn Guo wrote:
> Newer DSP firmware implements a PD (Protection Domain) notification
> framework that sends PD state notifications upon request. The PD exit
> notification is unconditionally sent by the DSP with a fixed sentinel
> 0xABCDABCD in the context field.
> 
> fastrpc_rpmsg_callback() treats every inbound message as an invoke
> response, so the sentinel is masked and shifted like any real response
> ((0xABCDABCD & 0xFF0) >> 4 == 188) and looked up in the channel's
> context idr.
> 
> This is not merely cosmetic. In the common case idr slot 188 is empty,
> the lookup fails, and the driver only logs a spurious "No context ID
> matches response" error on every teardown. But the context idr is shared
> by every protection domain and the listener thread on the channel and is
> filled cyclically over [1, FASTRPC_CTX_MAX]. If slot 188 holds a live
> context when the sentinel arrives, the sentinel's return value is written
> into that unrelated in-flight invocation and it is completed early.
> 
> Since neither the fastrpc library nor the driver supports the DSP PD
> notification framework, it is safe to drop the PD exit notification
> before it is ever turned into a context lookup. This removes both the
> log spam and the mis-completion race. A genuine response can never be
> masked: a real context is (idr_index << 4) | pd (at most 0xFF3) and
> can never equal the sentinel.
> 
> Assisted-by: Claude:claude-opus-4-8
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Does not apply to linux-next, can you rebase it pl.

thanks,
Srini
> Changes for v2:
> - Update per Ekansh's input about PD state notification (Thanks Ekansh!)
> - Link to v1: https://lore.kernel.org/all/20260727130940.577721-1-shengchao.guo@oss.qualcomm.com/
> 
>  drivers/misc/fastrpc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..97c60271f94a 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,6 +38,17 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> +
> +/*
> + * Newer DSP firmware implements a PD (Protection Domain) notification
> + * framework that sends PD state notifications upon request. The PD exit
> + * notification is unconditionally sent by the DSP with this fixed sentinel
> + * in the context field rather than the context of an outstanding invocation.
> + * Since the fastrpc driver does not support the DSP PD notification framework,
> + * this message must be dropped rather than matched against the context idr.
> + */
> +#define FASTRPC_DSP_PD_NOTIFY_CTX	0xABCDABCD
> +
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -2552,6 +2563,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (!cctx)
>  		return -ENODEV;
>  
> +	/*
> +	 * A PD exit notification from the DSP PD notification framework carries
> +	 * this sentinel rather than a real context. Drop it: a real context is
> +	 * (idr_index << 4) | pd and can never collide with this value.
> +	 */
> +	if (rsp->ctx == FASTRPC_DSP_PD_NOTIFY_CTX)
> +		return 0;
> +
>  	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);

