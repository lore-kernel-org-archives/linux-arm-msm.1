Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA2F4483B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546098; cv=none; b=VcP1AlKt23AoZjhVmpVz6pXroguVilp3KPfMj/+liYLtLQAYeIGhrqvRe6RyBPm7hRAL+Cm+3UPnfuyzvY3YNFDIceaf334WcbcH9QhVqAMYHdJ9wmS4NQ1uDGVXNaPIFq2I1q+15a54q5ww+u3x01jqm3mLgGaSmPZm3Cz2/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546098; c=relaxed/simple;
	bh=yLnOagV+pT8eAzSsdk6JR1MTvfu3QPXw3QIDFR8KAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLalgPiqDgLupHn1uodfBsgaF7l2Drl6KvrxK2DaivqQOpcwVoUpxK58seJhk6BADD2JU2dN7EWRMySv7XxJ5TdEEGVg2I/8ELwJ31IGiju0j5LW5H1skDADK4fopSOEm1bpnARwCbk5QYAQuTcoAwQDV6V7f+k2IAd1AkHdXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYJo9uha; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYJo9uha"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso90498766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789546086; x=1790150886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=jYJo9uhaS00BaRERJ68n2phfJZhMK5tlAOlpmR7za6vywdJjm8TAb+R4dHNvDN9ssK
         OV0QA+zwSr+HYk6vrgfQJHUKpRRLs1arQvzrnB6o7zkG4jcwy8T9S0H8rdIhAU1tVpFa
         eMSQd8qUlVVfaoiBrTM5W/zQ/S7Gj0IF4Kte/MYM5aoKtEqc3Bboo8lDSUGRRgQqXO+/
         6xtsi3ZkyBk+xuLo5sHnVnGHKcSBS6T8xEgVFqvDriw2WMqwxUFsW+iRB4JLnPT3uApD
         F3nTGt8wdhBDOx9SkZdXsdWLomg/T9kymHmjbelV3c1v6TdwQIt90URDFzDl8BEuaofj
         4iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546086; x=1790150886;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJf22ij+JQ2jMGLbFA1R+j1lqSUaO3cpmGjQBuD64T8=;
        b=yQKl9YJRe9/5shsNUUE+10qiP67ZUYQ4FbwIwJvqa6qGLNn+a24kkSWaHRbpi3fE22
         xmIeF26gUqOYIA9GBc3Qp7W/bRT2TEAnd9C+0rsVGdW7TR12goqOzKz3VS6cCefoSlTm
         JRaYgk1biJFlRyeSDjDg8f2OEfqegk1mpDQj8bajQfjav8TuBZ9e5oqBo1BNlZi/mjWa
         jQeSGVmoyF1Q1fvvPCgf8PVMcE6czvPzd7d6vfbh/ue2skXXjsqQ1a4C78x3K6Tmv3Z2
         4tpQew9SyafgvLJlis3tgsBVrL1Eui58rPmguTW55LsiygLJJeM8GOggoPVGFQLiEyij
         gU9w==
X-Forwarded-Encrypted: i=1; AKwUvBx8SXSUctzTDPnkyw3uiZqTvbmWe8y/6xuqVw87d7UtE5MXRA3HasVCtt3FTvb2PQ1hEGEi2Zhy7dxOOGxz@vger.kernel.org
X-Gm-Message-State: AFuF++k7QXLScOacdz8Vi/39SUfQYl6Ssx+LiaALljN/M9Qfe3fUHOsH
	qG4CHAlnpr8HlDgRBWXHhuAuwOhK5Tur00P2K0Bxrnh+O7retboxMTwf6y7hhwrQUrw=
X-Gm-Gg: AYBFou2NiauXUHPgk+vuzOYKEgycQVOa7JPIpFjsfUdr4QPVRyuwTU2Tc6ZWSSfbJYk
	Zvy9eMjtwRCwWqv+C+Hs4QubOEmshUEfQG8tTHhKzTL4Bc7pTYBGvfo//H+ce+eByPU1srdywVM
	t+psWtYZA7j92+6YEbbw394iNg/FR6IHkOaWKOPVCS4EnN3FvYjLGLhpDU2GLo0ByfgfF6ykeoD
	AFWgGP6+xACQaLWAY6qFvO19XodsFn0ytQIZAaLJfE8XITMSYVoUN0iYVWfCPMMUzuvrGfbpe0O
	FjijoTK8P6F/zsMhFtw+Xy+wmCooMx865QP3EWrvzup5DsYSbDfh+BAyUBXLrZcNl8NUFTtiGZZ
	Qvlr9ahfVhDFh6nFlP159Q7ghqMCNE84HGIWD+If+1D8OLEj45B+phkMeDd1bjUwIMcS1jJpigB
	z6K0/PEwuvlpeqLHgD5PAX3OrASdBo9GeISS/GZSVjDS0K81ixaamgEyE9UCbDcQJy529+ehht+
	0IZY5GEcM0epFsf0+fZcjU=
X-Received: by 2002:a17:907:6091:b0:c29:5340:1837 with SMTP id a640c23a62f3a-c29e52b6aedmr98025366b.16.1789546086423;
        Wed, 16 Sep 2026 01:08:06 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.116.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de4866d9sm83158966b.23.2026.09.16.01.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:08:05 -0700 (PDT)
Message-ID: <fcf04e15-d47c-4b42-a94b-077486cf634a@linaro.org>
Date: Wed, 16 Sep 2026 09:08:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260915121536.19207-2-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915121536.19207-2-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2026 13:15, Hitesh Patel wrote:
> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
> done for SM8250.
> 
> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
> deserializer, one camera per CSI-2 port, so two independent pipelines
> share the deserializer subdev: both cameras stream concurrently, and
> each can be started and stopped repeatedly while the other keeps
> streaming, without the WARN in call_s_stream() and without the second
> pipeline tearing the first one down that the legacy s_stream path
> produces. The CSID test pattern generator keeps working.
> 
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0201debd4..2023c0df2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   		.reg = { "csiphy0" },
>   		.interrupt = { "csiphy0" },
>   		.csiphy = {
> +			.streams_enable = true,

Set it @ the SoC not for each csiphy and csid.

---
bod
