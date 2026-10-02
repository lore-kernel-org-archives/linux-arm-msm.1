Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E7B4FB9CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961348; cv=none; b=ptEvYwoZ3HPfJSd+7wYq+o7BcneSY9xMO61oQ1qWXEKqcNEmHb31Tjp81kTNUWLHLQF9JhFSlKEVUUWST6bC8NjNn6F22wPTWPqspPWHdy26qxqeNlT3vMPkdGCddj5zvgnn/EV4wwDKafoCSlHfETwhpH1uESzvjoOHWH1iako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961348; c=relaxed/simple;
	bh=a1pAlJeZ4Uo2A9KGYp6NtqaoIeZN6ga69Qax3b3HzQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+Bnm00pB755lXmpFisosmbroBLFgCXNNIChxtfcOivWPnEDuSCtU8wWjSWe9I+Tj9P6zQ1f6W4UTO6pBRWzQ7HkNMuIAgWXejKPcFlESlQkPsBQf2zUWvIw6j5aRJnvFVwa3Fd2pw0Ioo2oy43KHS0DGlnhzdr31TzWNwp8lM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXMuxogA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dl+MXLJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXMuxogA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dl+MXLJV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H5xck2984634
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 17:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=; b=dXMuxogAwmwYkXVx
	0cXUL2XR4xHSJFDVHtA+Gv3KoP15+/A41yQpq9hkQUyOR9XI98y3WJ1sgCSYmMEr
	aycvq9l4Lv2q2x8aaP29bcR23JkY4u5bLQOqQi/uOZp1rDpcXHPqH5PfrjRyJvED
	W8dt3VWpa03SE4y29Tn48zxZa9uh8z7irBFVLnAUvMT6/jY6sYLB1BI9/AceZPRS
	fW7LY0zFLRxQFLubRmiXeK/vmS8D5f/K70n6H0PkBr1zsBY3IMrb15w3gb9V4DUC
	MiOejtOhwj6XbLTfwojQYn72O4BH9DzsmVs4evwMDSLWi5Suwq9W+i3Y2IXnN/xE
	sNDoVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mtneh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:15:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12487346a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961339; x=1791566139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=;
        b=dl+MXLJVQEiV1x0Qg+p/Qgt+b0NGyHAVKe0xrkSNsQRUdwfcttbEKCHqc2kBqKzESh
         jUvJTPTigKnz7ePro1lLQ9XDAtQjEVvaVdskzVnR0ah4TFzid7oFSZmU6HPgxycp/PGb
         3oUIsZZSorhtOfLbEV8l4K56GTUcrvVpV3wV21/t5jK4nV8Dm6oboFB42CPSbNluYO7/
         APrrOu8p8ezeviGjGnSIcYX7z7S+bE5dDcPE3/aGahghZExIto7KQNbdUqRobJ1oc6mC
         5amkzRpIrOG/+Z1/26XK5Vq+rAfdme8sY+nwC/27W2hzX0MiL2w7+cvyMwZo4Ij6HXu0
         AJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961339; x=1791566139;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbsnwXTq0OoV45hgow4KHvYsJLjC6m32dKDmrYd1IQA=;
        b=P/kmrSTILbC9RTSa4AsK3WSlCa58aweJHHAOflL33qLfD+NV3bwUzE2wMWfTiGR4SE
         ZjDoNzPdsKEi21c53dqZ2mn+Gk0/mj9PYhu6+lGnJiU2i8ZN254fbTEcg3YJYEjFtejD
         B/qyIlpUgX5ZDqoKTlzWO4/QTR5NEaDDUKIRVqDvN7R4RmM+J2J5n7s6Ew6x2phh6uJw
         CKgeNfUF6MFckHxzqhsNAotL04hh1l9GplYDYmAq1Fz3borrlxX68EJibXV0KQd8dCG5
         oZO6ibewXKbiM/3rDswVqJcgrbKK8mw8rdT2r0qzjFEOZUC13JE3UMIJ5o5I6zVKa7ci
         qk4w==
X-Forwarded-Encrypted: i=1; AKwUvBwDrjmlswP4DtsJn0dYJJo8qNUq43K40TCMvlKRpFPhvkhmI/cwGl+bmr4VKKMEZ9awp7GAUpNWJAuEvwjT@vger.kernel.org
X-Gm-Message-State: AFq9FYIkr0lbE1ePRkgpGGyXhItdjsuk9gTSd4VlF1vdqSob2yXDxCC1
	6oSl1fAYBixyS5Vq/usOC7yCCjslb+XK7N168ld6xwrLixXFAt6IimYT+Axl1ZRjbnXRuOLdgP/
	3v8u4cYjtHaowOy6f/1r92y0WeLU6dS16EMU1k5yRtdfa8e4JPCm262srE6I+/VCNN7se
X-Gm-Gg: AYBFou0/X8fHWmFvqJ0CaO/tyMjgYJmr2I0yZ/fCas9JGEsSMo2cTLc5Lq5kl8W0L3a
	IYcISnQgFS4rFK4/27fnVK5qOVndgL5f6zatVlaqF7OGUZvPeyXLdT2O/r+9qiGyKmEWS9Ql9Bj
	PgXb8ohW0Ae2MaoGbJqvxTbNqAbkaU7WdLkQZ9C03Kue2m4ZCCG9LWq963/oKylcbQSrRHCUe+o
	fLBaxY4J+EGx+0g+7k94U+FpMkElY6LYNXY1qPHb4QkfZHnjA43niLLBJWMG6XJy+ZUKi7qlku9
	m9hGV8Uh92Wyya7bVnUT+ajN2qz3PhtkriHG5PLnBtQod4K4jE1Kb5iyIIoGjKEwPvfxJlagEEq
	q2pH4sT05juik2Cf8CMi+REUYAhmnDdqPJub+McnGKRo8Emu+4Q==
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e635:a8b8 with SMTP id 98e67ed59e1d1-3a6cecf86aemr3187605a91.60.1790961338749;
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e635:a8b8 with SMTP id 98e67ed59e1d1-3a6cecf86aemr3187588a91.60.1790961338379;
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd1c308csm1772910a91.2.2026.10.02.10.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:15:38 -0700 (PDT)
Message-ID: <656b3e9e-4668-4369-8bde-d17bda52bd2f@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:15:36 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: tolerate absent crashdump state during
 cleanup
To: Slavin Liu <bolin.liu@seu.edu.cn>, ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260913125201.109964-1-bolin.liu@seu.edu.cn>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260913125201.109964-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfXxHYyw/LFR8pg
 WaAJE4X4g71384c3R0bMsLqswUUO87gD6Xidz08XQjl7SWeAsYFdOybvIyBBveSQ6Rt5K5+6gV8
 CbSGulbT9Dj68JGMw0Xa6nsHFTEMpis=
X-Proofpoint-ORIG-GUID: 0svCl4Zy3qCAmp4acRkFx_JtzwWI7OhW
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfe6bb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=GiR1NQjo400kaVoCfNoA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0svCl4Zy3qCAmp4acRkFx_JtzwWI7OhW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OCBTYWx0ZWRfX6tTn3wV1IkBN
 eAkB++frcr2+7SmoTX1mQuwb6SIdUUQOUBAPBMcP5do/SA53kXzfDN+q8RqtPYzFysHzOuXVDdL
 QBjlvTQ/2J61OsnHi5D5Ib8ueZY9+XujX6F3Kz3Red5a6mAUH8KMhPgFVihqGJbVRFihzsWMflI
 6SueBo5YoGb2tEI+ER+1uAW9bXeGdvg1JYc7R93iwTQkEww6PiRiZKnCi1WEKxuIyD1oPI7BOb0
 Ww+2UGLkuutONPd5/rbLzXX3/wd6mdlFNf8utH9NcqaKrUYP5ITJOHej77SdJGtLUl0/JRQhGHT
 OGZ3FILIvnjg8xAAiiMux4csj8/NRdoPxzye1rr8pySyezMtnY6k3nfz9F1FveeowOrTJiZuzsk
 s8uXBaD1n59Wn7VCNsTtg/3mc7kWtz1AF4votsd36xi5ivX8z7l2P6vNdoYuKANAQ7K47pySX8q
 wjgz7K98eye8PVZM7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020068

On 9/13/2026 6:52 AM, Slavin Liu wrote:
> A negative response can be sent before crashdump state is assigned.
> If queuing that response fails, cleanup receives NULL. Treat that as
> no owned crashdump resources instead of dereferencing it.

Please describe the exact sequence of functions which triggers this 
scenario.  I don't see it.

The change clearly protects against the ssr_crash parameter being NULL, 
but that doesn't occur in relation to queuing responses.

> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 6bc1fe6c748c ("accel/qaic: Collect crashdump from SSR channel")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>   drivers/accel/qaic/qaic_ssr.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
> index a98928654959..d9ba1d333cdb 100644
> --- a/drivers/accel/qaic/qaic_ssr.c
> +++ b/drivers/accel/qaic/qaic_ssr.c
> @@ -194,7 +194,11 @@ struct dump_file_meta {
>   
>   static void free_ssr_dump_info(struct ssr_crashdump *ssr_crash)
>   {
> -	struct ssr_dump_info *dump_info = ssr_crash->dump_info;
> +	struct ssr_dump_info *dump_info;
> +
> +	if (!ssr_crash)
> +		return;
> +	dump_info = ssr_crash->dump_info;
>   
>   	ssr_crash->dump_info = NULL;
>   	if (!dump_info)

