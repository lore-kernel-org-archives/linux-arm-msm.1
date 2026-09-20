Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D32449EB7
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789920357; cv=none; b=Ji0Ou4HqFxqSJBZ18cUxnMNMA2COV5D2LQp38pCBqotviOg0k6yrYPYtb9SW4pA5tbNoXucFN18EK5mabbsUC7l1flWEyKo8JuMTNzVxXhp6+BOKWtm+/JA5BZQtX6AHPpch5mQjW4J5oON9Muby6i+p+Su79TZ6CKUn+SXllPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789920357; c=relaxed/simple;
	bh=Wh8aznI4Dsx8AG0YXGKVP+EvgBxQIagdEPQpu07m+Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DG1s//LjTvFAmlfA1354TyOXAHwn+oCfrZDW1PTnoGCeLw3HJbgN3EQEuNfWRooaOaB82x6wcHQJIAtjNqmUOK2mIANHPDpNlgxZXZvAlpXFrhyJrCglnsJoV4bzOBieu82mt/IfLAaXRmVNrRxE7SyiVsjG87V5Kdkh8JRXPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKDXYOhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AvMmHrpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKDXYOhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AvMmHrpD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KF9XQ93674151
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 16:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=; b=RKDXYOhNnzQJcFml
	trdYN5zY7W5EdxJODIg2AQyftug2qyMbabEvwVeiFl/rDhKQC0Mh8fAQVPTrzxdU
	Vf/A8tfPMNHPaQZmXcE8FtviLTcAtb+n/ehIBcsa3fH7CVwyzw8yPulyBwAqYu/9
	QC5M5ctxDGILYNF1ULmOS4lspEC7UknrWn5zdA8rcabXvgGyEXnqONpeT/9M3XKl
	4o582KxhwwwMZu5k5cz2wFTTatJTvBFfAUduaY13yeTcAfHs2YGE1TwiyetqF+eH
	CBV+SjkC2fG/PWuwFBO+OK80Yw+GwDzHcZL4rcDa/N54+6PL31JhjjsbmGUpivdv
	EUIwZg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbfbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 16:05:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7866c4ed349so2134648137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 09:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789920351; x=1790525151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=;
        b=AvMmHrpD2E2HXcSBaoL25pZHq8eK6yTRrg5Btflfx5ytNzy8XuEBNPIN9HF2wP2107
         0Ep0MKp0LvrqY2s2JJ80yLCKiXeNJTLLs8t6qtaldcI5kts/mXKjBGGFvm7rLgMlJNdJ
         IbTibo5dimHx6UcygxP+s9u83WJPEuAPNwkCQ/JHxqDyyEk8r+RLZ/ihQAd3jr1ouaJC
         bzVhnBLKykNL6hYXqfGsdClFog0UND4sea7BeTRVNBgOCGovsxOVvk749C6HLZripv0H
         3VQkgybXJbac6Qanp/f6Fn782GnDItrLoEu1U/+0qpOC7D/x/bTcSTcO68nmXTmgloh4
         D1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789920351; x=1790525151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcnopI3chkUGfHerpPXXgF7ag3G5/WkTywshltXvcmk=;
        b=hSUowHyyXC/KwnlPBvDNjKzTr8tHZRPv8AzNUp/fg6tUn/zCINYopuemqXmhYqfby0
         bc9BB2z/4zmWNUQ2haGONFU+iHmJwARUXb8Odok5jyURM2fqviTWAk52kcrdhcDjmM2r
         xTCq/gcyXH5jvFS65dUtdndF7dskVyQBUR3h2gPPjzJBU221uHHUxsZjuFSJjMZ1u1lE
         lJmn06oA1NXnPuzyrZGZ1pxd1CzGvbMRyBTPT7Zx4w2XKMfNp3xu+IbgTc16ZkPqCAC5
         lliryjdJ0bnHE7R3Vx5zVOJYG+lAYmjvFPRj1rI7WMm2CPDzDb/o2v0HPWAPB6e47EO8
         O/oA==
X-Forwarded-Encrypted: i=1; AKwUvBwgYTfttu0y6q/olvxsKmmT71Qf7PUhwnkrZ8cntE9KY1EPDz2PC3kUXKy1+fN6YabGCNEwY3U6XB54XyrD@vger.kernel.org
X-Gm-Message-State: AFuF++lcw4qeMr/m4pK0XqGg+Q/kqF6mhIVjd7aiJp8MXBCQGql94oas
	vBA180wAM8gyhWk5UuiEHYSgRajr9DrSH5hVSGIJ/alUUHgexhJjuwSDNadG5dDP0w/bEGINlAS
	IkYcpDmqmZRCWYf77kQav24bUsvziK6a7M257cF3yi+DQE+S6gU3YGS6OBOkgx2Jd51Jw
X-Gm-Gg: AYBFou0rNAL0+gbv+IMus9tLEn+3brQO2dC/B4trh6lSmKDH1LSwOtEJTAwXhcL6PsX
	aAH2RnWOOtK3gKhLC+jZcP3e+5M5Uyclf5fKSZiVXqb6aiTM5DvqgIoQFeUvFYniJnY5hRPGvOa
	CpjgzerxIbi5bCioslMnr7QrqVuob8DC5d4JlD4euCzkCSQS6ygGTKAlNfPik3ueq5QvcpG/UJQ
	HFGzfdg8q+cTmkqpqPQpq9yjP6wz7AkU5GiIMgcdzHWnwJaqO9sLm4K1HNXoGuj2bmgIqjrwucv
	xjvGWcI2fZrzqSNDeBt7aeKzQTqXFbN1yGicbwQo3qWdSYo5NJkN7KtifpPqTuW3pmCA6SU/P8B
	dh+11mkyj92Jnb+oyKNGUn4aSK88wIotHwMyaJDkLREh7
X-Received: by 2002:a05:6102:3f06:b0:7a2:1f78:c6fc with SMTP id ada2fe7eead31-7a55c88b9f5mr3955585137.14.1789920351333;
        Sun, 20 Sep 2026 09:05:51 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:7a2:1f78:c6fc with SMTP id ada2fe7eead31-7a55c88b9f5mr3955558137.14.1789920350939;
        Sun, 20 Sep 2026 09:05:50 -0700 (PDT)
Received: from [172.20.10.5] (82-132-212-44.dab.02.net. [82.132.212.44])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f7e05sm168445545e9.4.2026.09.20.09.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 09:05:50 -0700 (PDT)
Message-ID: <393a1343-cef7-4fe2-8236-8946185bb394@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:05:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: use DAI table index for playback
 constraints
To: Zimeng Li <me@lizi.moe>, srini@kernel.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260920145848.44521-1-me@lizi.moe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260920145848.44521-1-me@lizi.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: csYTM30_BFuwrdr5IG_vNBYjS8eUWgN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIzNSBTYWx0ZWRfX3Z4RshQeKc4U
 pq6A8ZKOXhgORlEx3lQ1E/uWni2ihbx0oPP8ZZmlUMOOwJV1NLUhoM21rTxkWt5H3Q4wY+dzeyc
 XQAc4FXFrTqbR9U+43A7OxwdsQvQUs7xaamHYLZSdMIUcjnZgauowWgKQDCVp7jIi2bkW1dXBbT
 fN53aW63+XwG8d/U3Q9mwaxt1Bd4UM/OKQ7WqgRzbmQ9pYYXfvtcOUbl8rekEqVdpYU7vZaF5FH
 ZqwBsH0XoxPrT33c5+L+CJ5vtZl2s06sxrapx2kHWMkBksPJdLkZvfZC00oevIj7+SHu3uvNAPv
 9/yrD0gvUsyXG/BzU+lrPQgANWV5hmeIv42Oi0DqYq8+1f90l5x85eDb12ojEL9F7qNnIVIuZSG
 B+vB85kxyPpdZomD93y5GLaz5fKAR5J0kPIhsdChJy0n/8hFi3qE/2BwSIHv1v2j5RXWlRhHFQ9
 OT1CCeZJ5ByuPwg2Z/g==
X-Proofpoint-ORIG-GUID: csYTM30_BFuwrdr5IG_vNBYjS8eUWgN9
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6ab00460 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=HvmqtmfFEEonl7hC97T9LA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iDUYOmZZWeky2fLdnAoA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIzNSBTYWx0ZWRfXzSHiDfRveSTs
 5p4V2pdk77IhHEZ8RVJyjzwSlQcdaJuHhPd1yswGXWt3daqrgGOO5s14XKwbBUraAD/zQXusaR1
 kPb+xgQvpoOj+uh615Gcc/VDq40loD8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200235



On 9/20/26 3:58 PM, Zimeng Li wrote:
> The DAI ID is a hardware port ID and is not necessarily the index of
> the corresponding entry in variant->dai_driver.
> 
> When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
> currently uses dai_id to index variant->dai_driver. This is incorrect
> for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
> DAI has ID 4 while it is the only entry in the DAI driver table, so
> the current code accesses dai_driver[4] instead of the DAI being
> processed.

This looks like a bug, however the code has been written in assumption
that the dai_drive.

That also raises the question that was this patch actually tested on any
hardware?

> 
> Use the loop index i when updating the current DAI's playback channel
> constraints, while retaining dai_id for indexing the hardware-port
> specific playback SD-line mode array.
> 
> This fixes the incorrect DAI table access for platforms where the DAI
> ID does not match its position in the driver table.
> 
> Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")

Cc Stable ?

> Signed-off-by: Zimeng Li <me@lizi.moe>
> Assisted-by: LLM
Can you please add the actual model name as others do.

> ---
> Compile-tested with LLVM for ARM using multi_v7_defconfig with
> CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
> lpass-platform.o targets built successfully. Not hardware-tested;
> the IPQ806x example is based on static analysis, not a reproduced crash.
> 
>  sound/soc/qcom/lpass-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da..079177a6d 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  		}
>  		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>  			LPAIF_I2SCTL_MODE_QUAD01) {
> -			variant->dai_driver[dai_id].playback.channels_min = 4;
> -			variant->dai_driver[dai_id].playback.channels_max = 4;
> +			variant->dai_driver[i].playback.channels_min = 4;
> +			variant->dai_driver[i].playback.channels_max = 4;
>  		}
>  	}
>  
> 
> base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4

