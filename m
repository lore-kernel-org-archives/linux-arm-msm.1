Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C264B7A59
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472613; cv=none; b=cvAnkEcTypNZySp51ui7SEbWeRdclKtw8hhSrDZt56YC5vsrErvTIKwh/RTbvv9/rcXA2kQTtED7UzgKM3JLWkwmRp2R/L04SVU5Sg045lffOVxC8QadovtTZdA7dRD2PmJbjuSEpVIduo0KU9tkKXPT8CL8mAhMS2K7PC02cvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472613; c=relaxed/simple;
	bh=ZTBqoYhGDm+J/pFaw0Ch+MdV1zAK5Ys8DujDZL9Y4RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZP0gst2KeSh+Q2TwIsz6OKvHDBRGhmZmd+0xaHW3Y3exmXr24lydggF2VrvAIvP96+PqadLTFoXAymuqkPHlwoLOkeX9+aHtAetwx4yj2SVJ4nK0r4fC+mfPM1Q9zjjlm1C6UWwiY+J5tYJk1pyLjHpD92NE+jNYMvGBA/ckfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipot0wNf; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipot0wNf"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so748053066b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791472607; x=1792077407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6I4Ey1RdgYWJmoD601d9WiKcqtmCdqt9tXemaY6tL0=;
        b=ipot0wNf3Qv6pjAOTaGMAyNNVONQFoAhpm71v1k/rcIJ0Oqn+6gY0w2plpdjWjBdEW
         bqe+QNDBPPgKjS2Yid4mdrLpVmx2JufklxPaKisdRl/8BtWxf4VYZP+ojxhlLMLRWkHM
         CKDlzG0T09TW/tjpPz1gyYcis8Sl1PsH1VuQj5wK7b9Bpp3KI+q+sQsd3vsMVZ/lo2El
         jRDlTop7xKMXGg+XHpquOYoJjhTRZBImdF5qHeumbAYSP0rIB0QCXOH9Cilh+MHtSrGS
         bdtOPUUdL8MERSNMoMUcCStrNnAXwGPMj2hc1VTNk1U8nwbG/psoJH0ZVaRdA68duTiD
         6Kuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791472607; x=1792077407;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6I4Ey1RdgYWJmoD601d9WiKcqtmCdqt9tXemaY6tL0=;
        b=PW+PJiLtRKY2wkxI6jhoOaJb697kSInm0c9C0Hklg3TZQ7p7PsXoUDLid9pu3r9ZlO
         RtcNOwa7yigEh4/aGZDLOwBWkbMQdqeR/ezWFBwe9N5sngqFmMLQQXDFgnEqiEyiCPpL
         vZbK9cTRTFmbEsfVCoL5SlOdYPFODd/dLS1be4nMT5vv6hOygLVVItB7efJ0rGVeVGhH
         6VpA/Y3hV2HODvzYhbHaGeSB2TBTPtfrZudoeHjXE4lxIG3xtSGYgndMa/W5C5J/DpY5
         8eCAbATYBuGUV0Ge8xGqKwfM6ztotgfKQRPsrCOq5yMPYGZm2o+0Y1x6ihrNexhDMwIV
         LoGg==
X-Forwarded-Encrypted: i=1; AKwUvBxQmywsHxwS9HC7LFnS6CIiM2a582gUfamK1oq63ERS/wo0QifNRZOcTzlB9ukjVsu6GPwBpNnMt37ISq1c@vger.kernel.org
X-Gm-Message-State: AFuF++mfEG2IMIrfnfeehDlDV70b9rV0mOVZ2MarOSzSGw83vDMSAvrH
	kzBhJvg98njnEPT2f9WdxzQMQiEQ8LFQTpNUFIdahV6bv2rZ+u1uh5ZkkvgapcYCDyU=
X-Gm-Gg: AYBFou02UMnU6RdqpAQUAz4FGWiWgU/UlJtNMJeoUNS5i85bYG3qhnS6nDJKBgiTECw
	ryyngZjosLjKJYJSL5PQeyNKuhUAB1YzQeRM0pIdm/Gkw+ATjo2vHPP2DmN5KJJU/+dR9Mj92IG
	ZOqeDRC8f6ernpAGOcpWQlTCpPOxSn9hvG7f3haZdps8lhjv6IGArJ8a6wjKXAjdI2CY22a3sSi
	66MsrKq52UTwI7EXc2k8/omO4lwj2vAe06Lq2t/1kLcz9vuu3kHZdsnenkBD4w3SxepTwCiwkUF
	Mu1bJ6t+CgmYtRZ9jGyqiIda3Uh3pfvT65RD/uDLK4FaH+tIFgHvHpT7nFdMbCJ86z5LZ/ef+QX
	qeSYvDYr3kl74LeAAx2WwbgCe6/653iD7RmahIrXym6YbLH0BlhkhndxbL5V7QSA8jsj5yz7+In
	lGw1DUi7KBfGNaZ1hz2SVsT5+HJzCpNzSb5c5y2bYk0dFufBRrIX8tSZqn5LgapxRwukbKhPD+1
	Wg1MSMmli/h
X-Received: by 2002:a17:907:3ea6:b0:c26:19e3:e982 with SMTP id a640c23a62f3a-c317c0bb076mr560631666b.34.1791472607404;
        Thu, 08 Oct 2026 08:16:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.203.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a1012ab2sm10963766b.85.2026.10.08.08.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:16:46 -0700 (PDT)
Message-ID: <a0a9a782-8ab4-4f32-97fd-f030203fbc49@linaro.org>
Date: Thu, 8 Oct 2026 16:16:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/74] media: qcom: camss: vfe: Define output based VFE
 controls
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Richard Acayan <mailingradian@gmail.com>, Hans Verkuil
 <hverkuil@kernel.org>, Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-25-ed985aefd611@kernel.org>
 <307f12f9-8805-4b3c-92d7-422d994fdeff@oss.qualcomm.com>
 <0d1c5d19-68f8-4d44-9efd-f7d1aeaa7b32@linaro.org>
 <5e19888d-d037-41e8-a3ca-f92d9991f3d5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <5e19888d-d037-41e8-a3ca-f92d9991f3d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/10/2026 12:35, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 10/8/2026 2:17 PM, Bryan O'Donoghue wrote:
>> On 08/10/2026 06:55, Gjorgji Rosikopulos (Consultant) wrote:
>>>> +
>>>> +	/* Output based API - new and shiny */
>>>> +	void (*vfe_output_start)(struct vfe_device *vfe, struct vfe_output *output);
>>>> +	void (*vfe_output_stop)(struct vfe_device *vfe, struct vfe_output *output);
>>>> +	void (*vfe_output_buf_done)(struct vfe_device *vfe, struct vfe_output *output);
>>>> +	void (*vfe_output_update)(struct vfe_device *vfe, struct vfe_output *output,
>>>> +				  struct camss_buffer *buf);
>>>> +
>>> This also deserves good commit message, this is exact copy of the other RDI API with other arguments 🙂 Shall we migrate
>>> all existing drivers to this api in respect to use other deprecated API but having both of them leave in vfe file which
>>> creates even more confusion and readability of the code?
>> Ah but that's the point.
>>
>> You add in a parallel API which is 1:1 but which can be extended to
>> describe completion groups not WM indexes.
>>
>> WM indexes have always been wrong - limited to RDI and we have all sorts
>> of spaghetti code to work around that indexing mismatch.
>>
>> The fix is to stop doing that so yes, implement output / bus-client /
>> completion group - with wm and planes described in the output layer and
>> then move everything to that new interface.
>>
>> Including new submissions. The only real barrier is finding old
>> hardware, making the changes and ensuring nothing breaks.
>>
>> Since there's no DT dependency its "just software" - easy.
> You are maintainer and responsible of the code. But i also want to make the point
> again (which i think others may share) that having one vfe core code which is trying to support
> different architectures of the ISP's which are quite different is not correct, it is match easier
> to have different implementations based on ISP generation (different sub-device) and abstract some
> handlers which are shared. As of today camss vfe have mixed interfaces try to match multiple
> generations in one implementation. So that said i will not be convinced that the direction
> which camss is moving is good. However we need to live with it and add support as you are
> proposing, so all is good lets wait those changes to be cleanup and we will start re-basing.

Well for me its about sustainability and paying down technical debt.

RDI as WM indexes is just wrong and I firmly subscribe to Joel Spolsky's 
edict "fix bugs before writing new code".

https://www.joelonsoftware.com/2000/08/09/the-joel-test-12-steps-to-better-code/

The WM/RDI indexing is absolutely a bug - a design bug - that's just 
been a 'baked in' thing that's been repeated over and over again it 
hasn't mattered while we've been RDI only but, that won't do now.

Its also why I've been so dogmatic about insisting on drivers/phy to 
represent the PHY - its a PHY, so make it a PHY; anything else is a 
design bug.

So from that principle the logical result is fix the representations - 
not implement something else in parallel - we should be able to resue 
existing proven code as much as possible - it also keeps us more honest 
WRT to maintaining the user-space contract re: interface stability.

€0.02

To your point about different versions of the VFE that may be true but 
at least for the bit in front of me right now I don't see the need for 
different version of the VFE core.

---
bod
