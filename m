Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA73DBD6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542279; cv=none; b=Gu2P4Jr59TIjsB89Pa86O/weZSCI03n72kffKPrMR+DB8o38U8H34jvlsjl0LDZk11o4YF5KAKWhrPp1gGzx463CW2Ktah8vgTM4OQI7F5cwx1QFWNNlv33EC2kQe8gzB5LO58cdMOhCeJYRfC09vtd9yl8jg5w0hoKiOWcgFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542279; c=relaxed/simple;
	bh=tx0TCDRy13709548VbK+NVplX+xG8JpNeA4Y2RAEjCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxSnDl2Lh1U+ggHvmWqmYh6x4XnKUdy0mNy74DSUmmVzNMKzEbL+prhYhLKstGhKQlhUIPmMYY+RHQyDycZUXOaPYTM46cHwLcInirA2or2EnZSY0qwzbJBkwugUVLP5ljTYNtm2rcQItZpiGLj2QMxIgjxrIKm9S1M7AxldYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M8Kos9Oz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M8Kos9Oz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso10160775a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784542271; x=1785147071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bW2kLeFTDvip1n3U55k/FG9Uzjne5JKdejrzOvSO5zA=;
        b=M8Kos9Oz7wzb3V8f2gulEXZgcptfMj+1MLXhD4bDhEx8iYHhbWWiTCmtp5ynEvjkh+
         rDHJLGMR5F1iFfjNwuxAyo0PNA2S2WgTnkwlrOIDFucRkUN/iPu/DDznO7TSRf5b8XdI
         damT3SxOOEa5AMvItX52tw8m+MeNhMl9m0Z/ocdNksiAXkhx/pKp8S53J+sWQ+eQ+WF+
         Kc3KEWw9zbWPshneyj2CiB+rONvVON39CR0zuszgsWlf4UAWAywjsmZD2w0AKw3RuLvI
         kojkJm3gCibdaBaoieKc6rmD+GE6I9eZ00pXxFRc7WEgtl14SQSHhbPbXOfj8Ci44tET
         NA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542271; x=1785147071;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW2kLeFTDvip1n3U55k/FG9Uzjne5JKdejrzOvSO5zA=;
        b=X4qArGh8JBRV9gN9RrdBxeUt6opLefqgfI+Hia++WI1iiVJaqq4SurEcQfynyHMMwC
         bLTMSoc5DiQg9UwKsK5b81hqhBW0sqnO57LwGExYyS7OsDrQZfN6mumz7B9kHKYyLhuC
         sb3RG1A7ly2oV1SxZkUJ1KZg6RxyVWVPcMlPKIv7xYwszj20uivgcAbAx6gyJygJaeIa
         d/s8tqWxtlE9DfIvm3nF2GdcgBuzEozhkBBa8OzaP6WfjyeJ7GDjzgWZm1AudbI/VWgk
         JCpw19Ri6mEdCFaIgqzph5j1psO4UmsiGjJEpIeNkIEVm+8Jg+pU7pfsfQGQ7h/uULSc
         hrXA==
X-Forwarded-Encrypted: i=1; AHgh+RpEqIREf6rJgP7Phge/xTMikzulS2NGB3U3F1eFWWj+iOqADqo1XRfJ1ySxl293Y9mzHhFHapp65uMOEFR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6yHtAswXO83CRUkwIrc6ShUHPJdJfEgTS5MiC3LEHN0kQahf1
	0hJd5U4S/hmNdQ+lUHhNjrMu9GoesCNrz41VMZjp3zRDXagkSt+Beqe2bvrjZCAWM8g=
X-Gm-Gg: AfdE7cm3CjX6MUzrh/nNAdkHVIWbBNX4iZdYYpQ83tTOSpoIebueV+ydh0z3FaAv9OD
	UhEU1XYm5FFDR4VRgbiXFB8HA0IV2eofCB3Duu3dmN+ivIVW9+r2z+C5RjnXZjZ/ou+/Yx165u6
	4og9AUpXWrUrVoRQczDATC5JzFSSV4v0aulhfqcmNNAQldK8bX2xn98HkfoumwyTmTuEVUjAu7v
	CwPRlREeUBKoNOLr4WZztU/RG3Ot9yKcKrS7i6GwRAC/YoVYvxUqN1q+FYz2OWoGnEFy47wV8Bh
	PomYBn2l+4ANLtZMOjW5FdRWiJYsCYtY+ERw0Jpo1uDGIJrN5im8Uy2yxSA8dlyyJlR/PepYpjM
	OUIBA6A9PEuLGE/6tP1A2/5Nlh9oTBm4liXcmOiMM8j8d/DB/a3GBrwrqAbEieG2vjdqnQReAxy
	TuxXzJ4pQqrHJhzw==
X-Received: by 2002:a17:907:9722:b0:c15:f26a:3438 with SMTP id a640c23a62f3a-c16b46decfdmr557526666b.24.1784542270781;
        Mon, 20 Jul 2026 03:11:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm431493266b.43.2026.07.20.03.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:11:10 -0700 (PDT)
Message-ID: <99c019b5-bbb3-4bfe-9237-cc768027ce1d@linaro.org>
Date: Mon, 20 Jul 2026 11:11:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260717-camss-version-v1-2-7ed71fea95e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2026 15:20, Loic Poulain wrote:
> Provide the required CAMSS PM clock descriptors for the QCM2290
> platform. Register the top_ahb, ahb and axi clocks so they can be
> managed automatically through the PM clock framework (they are part
> of the camss-top group).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6a2bf3373e8755805c8cd0f8fe5037b788d68fa2..04b5601eb0b53110ce1b94248323dad1c08da9ca 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5589,6 +5589,7 @@ static const struct camss_resources msm8996_resources = {
>   
>   static const struct camss_resources qcm2290_resources = {
>   	.version = CAMSS_2290,
> +	.pm_clks = { "top_ahb", "ahb", "axi" },
>   	.csiphy_res = csiphy_res_2290,
>   	.csid_res = csid_res_2290,
>   	.vfe_res = vfe_res_2290,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
