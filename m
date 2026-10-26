Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028297;
	b=C2PWxnV9nAn7A1LdK0IPudFi9ysKGtqAjrHjOe6MoXZaYUzAOWG8rcv5wNLNQHVl/xDs
	 0/1nNc+kU11gcKM08M3vZbeoZjB3JE85e2oKRIxCunZVOcZQ0DsDfeo5fSFskCuAH74cV
	 UuEEb1a08qJzno+kNjE5QWzBmfTZJKQfdq6fjibitHuGwwPfW9uy1oXHIOpkGjCmOToyC
	 j42N7Voh4KLxdgbakZqi74HredeEFYeh39J+Qi1/wcdyplwl1vdAx/klZQrIK04xuieM+
	 7tdd1cUy3b3T2AZOB18ALAYgY6ra/TLCSdcrXEZmp4CMWac7ht4gJTZMlKj9yE6Bgbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
	b=X2MBossfw60lucC6LYsvcpvw6FFnH1wTNog4QePhzxEOd40EZyvZPBWMJR/UXPhyNd8L
	 vsOmn6AFdsb+Tvp4UoxX1pEM/1w+5o8/+kHGMTRM55SSZWGty2DW4oe39LAkC6YJIVouh
	 b3M6pnOHZekDl79uJo8gE10bgQS/zFbBzPW67rCgcuULCTF1wREqC50BjWZUpOqUIjt8h
	 4Xgtmel7VfihCpGhZXgvOSa7lVgLlUVCgnYMZigNQOswLrz/l16YhyQEKEcw5tMLqwsXK
	 4ct6j2xAkfCLEUWnukJ/BaS4q2yTQAJNq289fPmyslazgL/wDRWNnAddg6V8ZpDv9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRzyVEYP;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE1606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDE1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NRzyVEYP
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4550d8ab15so396405966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793028295; x=1793633095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
        b=NRzyVEYPtSo0/zlZWWXstcRd58byuqjYNBOOe9xipLu3ODsIsmj4a5CwgYvbgHQ1Uz
         8HVRbBtBUNQs+TFHENrCPRIXnR+zdeGog15QXOwyY45+27iAh3wSJJnZZwNZSIkpgWK2
         tmSSrI0CqXfZR326vGfxQaqD/2vjNfVIaZHp71yW9JVO1WfLb5KtJxGCerEXczCDWCyt
         1I3P7GH/mDQarAkyPUg2Ewr0Ugiq42A0DNK0OInhJvOJG413JVmvIYrblCKadXHfK7W/
         yfGDYAsf5k4JKL6V/l0Xy7NOE/BS/uMxh59sNYgm4f/LRdkZ3O6Lx/TOx7/7hnpEF2Mq
         maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028295; x=1793633095;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/eKZYT2XBSHJPb67RYoqY4k1/nqAIq6v5M2nmhwAcE=;
        b=jaOmtzYbC8cswHyVbrAecUgTgWkiWYka+hjKPJXFHlBacSlZ8Me6mLdslmSTDMd0um
         H+xH42YFkDENToehVivOpb6Lez2aYDIf9hB9uwCnlsX9hQ4qSgA9D9gu0va63PU46532
         MIJ1gET5mB4PyxaXRf3IkRe97oG7rdXezCkxXBIJgOazbV67OuCOVKC1PsleyB0dmTrg
         MJQ+6IswgWPmzQvaPrEZLFUf16Vtw00i2t3KCwVwq3BEWYSI+rp+LpEF69a/1L8oi7kK
         EiPwff6x4McKPoh9yQE7RoVAo1vXUeGG3pLLVw/KRUpk9WVbuinG0DyBHELcDrwUNfJl
         VjJg==
X-Forwarded-Encrypted: i=1; AKwUvBzXl19JGUQxSWNQ0famveqY2aGSYsQ1r6oyw3TsGgLGju7IbxP6xK3mXQxQbrfRcpVmAUciBhqvuETLSxT7@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0w8AKxSUq+TEHYWS+HX8uR5ZidwNlVkK5jLj/8v8nEIMUH6kL
	wlKNbcKZ4CXDEkLPYlGYTYo/szcnApEi767nBGLMY/iQTcv/RsZaTCq36eTKPXX434Q=
X-Gm-Gg: AYBFou1WntyIdkzg7aBmpQztYUbiw0f17J3A0k0JfHTRjoF6nfAO7hqGFU1o4NXgySc
	oi8zhgHa6Tn+JOLUMwwc+5jp4rzTj6J6vrZscjeN+OGXzKGNeUUz6PPq9YZZmY/d+2GtLQMu5SP
	Th1s4iyiFcXWie2fhmJ1PB5daHKy9dSvIEt8qW+vR/8T4HyqE40EP+MU9liIJW27AQ+3uJDS+X0
	BmIs0FZ4HhSpZ7UKcCoXkAMwAph67Kufum03v8TzqNmM+BmkXCqh3c9nLoIgbt+TQC8AO3Lrlq8
	rWQ8s0rKlu4YnLR/8z8eRwPW644Eona3IbwwY17qQSk1IOfPNp/U26b+7guDgC1vFNBSV1WCR3u
	go2jeDMLPqTxEcP7khZ+b/V9g/CgFM8Uf2qObF7Y1+k9eGL4SqI3leVNWO+HYkNjf769FZZxbLR
	8cSoOu683N8/bMt2C34kScy5pdzwDZzk9oY+LHK2bKcRw8aLCfIZ5bH8gifoks1Abo6IpLevzP7
	7nMSmV2cB9ku+olGg2CHnUGDoRigG67cLPQQVI3jNO4uEbcvnSevxbHK72rc5lX/QHESKVpDsIP
	aNpynSDycZL4
X-Received: by 2002:a17:907:6092:b0:c31:7495:e57 with SMTP id a640c23a62f3a-c46bde9a0eamr770063266b.44.1793028295532;
        Mon, 26 Oct 2026 08:24:55 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.151.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm329841166b.8.2026.10.26.08.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:24:55 -0700 (PDT)
Message-ID: <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
Date: Mon, 26 Oct 2026 15:24:54 +0000
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
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/10/2026 15:03, Loic Poulain wrote:
> On Mon, Oct 26, 2026 at 2:37 PM Atanas Filipov
> <atanas.filipov@oss.qualcomm.com> wrote:
>>
>> The VFE fails to power on when the pixel rate exceeds the highest rate
>> listed for any of its clocks. The rate tables of the VFE clocks are
>> independent and need not have the same number of levels, so a clock
>> with a lower top rate than the VFE core clock, such as the SC7280
>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>> still supports.
>>
>> Clamp each clock to its highest listed rate instead, and warn that the
>> pixel rate exceeds it when the clock lists more than one rate. Take the
>> clamp into account when another line powers on an already running VFE,
>> so that a clock running at its highest rate does not reject the
>> request.
> 
> Again, we retrieve the pixel clock to derive the required VFE **core**
> clock rate. If the VFE cannot sustain that rate, failing here seems
> like the correct and sane behavior.
> 
> What I don't agree with is applying the same logic to other clock
> domains, such as AXI/CAMNOC clocks. Their frequency is not directly
> tied to the pixel clock, but rather to the aggregated bandwidth
> requirements of all active clients and data paths. As such, deriving
> their rate from the pixel clock requirement feels inaccurate and, in
> my opinion, is an abuse of the existing logic.

camnoc_axi and camnoc_rt_axi are matched by vfe_match_clock_names() 
today and have been for a long time so excluding them would be a 
behaviour change.

Perhaps warranted but that would be a different patch for different reasons.

Upstream:
return (!strcmp(clock->name, vfe_name) ||
		!strcmp(clock->name, vfe_lite_name) ||
		!strcmp(clock->name, "vfe_lite") ||
		!strcmp(clock->name, "camnoc_axi") ||
		!strcmp(clock->name, "camnoc_rt_axi"));

Also - RDI path computes
pixel_clock * bpp / 64, which is a bandwidth estimate, not a pixel rate.

> So I think the implementation should either handle or delegate to
> separate functions depending on the clock type:
> - Set the VFE core clock based on the pixel clock requirements
> (typically vfe_clk_rate >= pixel_rate).
> - For all other clocks (like camnoc_axi), and until we have proper
> aggregation or voting support, a simpler and safer approach would be
> to select the highest available frequency.

That's a bigger change - this patch only changes the top of the table. 
Setting to the max clock by default would burn power for no reason IMO.

On the core clock though I think you're right; if the sensor exceeds 
what vfeX can do then failing is the correct thing to do.

@Atanas could you keep -EINVAL for the VFE core clock and clamp only for 
the rest.

cheers.

---
bod
