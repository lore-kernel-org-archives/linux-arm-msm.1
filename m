Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472739;
	b=cU3Vos2+/i5th07KM02BOF1oQeFREOMAqlfA/YXh7S80EJoZKpWfljqY/Fupayqwe1do
	 v0kJD9ZM97CjIDNkoNnD2S4ukL/GMgtCtFEFTOPyRBEHx+6CHgzgTuW+UkpLsuBRxK1vc
	 akYJDdhBkWlOUYTVAC6098U2hGqtrVqorfAX1yg0r9Cv0SPmeU51M1HRwdKIH8cKgQIjN
	 xVYbx1++gSnAyXQVvJ+kHfg9Z2yKNYOmiBBiPQWbzAWGUXAA/1wkYhO+RIJaxcie5pnKC
	 5e9muzk5hdyhyUjw+zy6XXTCIoE91lyAYTCivPL56sPQNizKnv9Q7sYSzRfq76cIz3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
	b=p3yjEKRjkcdbwvITKhMs0+4TUVoyZQqzklX8kzFfdFYJd4ZKuZSY9MJKKPA8iNN+vXtD
	 wIbtVT88yFzt0BAtBSgnWwVouwfQ8gMER7Fq9bp58t/YWPv0GPASbW0VYCaxW399TRQUj
	 U8MWI2+0MkXwcRaF6tV91VlyYwoev5bGLgCE5wRW6hUScj7YT03PDr6ZAw5fJkze1XVtx
	 kXf0z4Hv0BH2iJXTz31XJUc1nZ4jEkRdufDZ+PYpK2KTv8VdF6vtmJTUJPrNOAmKF3QId
	 ZqUgVsUCp/uVWOGGouLC46tgR6kdnRKPa/qRUPXwgu0b7D4HBJtq+MyM2ids/pM+vDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABD606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5ABD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71ab5e64742so2343758eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795472737; x=1796077537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=6LEkh1WzWlOSIoIIHWHHvGGe8ls6F5uMHZ1h/oA0Mfj/yUszyLlz328XQa9sRllh0p
         tVUeWXGJcqXx9ToqGSMoiqIXv1E7puZXYIJTrpse7wiOimDRxg1VWeA9864K5z7DuTPa
         iDKLedXwVP1geqUl+GNOhRu11khMsxrj3SrIfw0k2lxgSTTsR5qEBPlQsbzZzVqnOoyp
         64/NqX3sCgdpxbp7WX7Cx1QzlVVorxFLiiLf2bE72H+3UlP6o4AQCaJn0Ru4kBM/y6Iz
         /V/6jfXFmv49jLvEo9diYhTSYIrK3tnOyQodcRn6CIPXedblij46nG12w6shkcsVS0g1
         UZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472737; x=1796077537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=QtGkbDzGRyFs24gcF0L1U1doV0f4KS5fEbCb6ugl3/kuZLjmVdELNBbMgK0lZWEX1y
         BzMSMwAj3JNF9dAnQh6v6QMHICDBZh10BxhoShLJrDH0bGBWPiQNBJLgPulm7RDz+Qoz
         a37Su+/x36YAIiGkjTRQMDb8+BTtLarFjrXzmc2FzyAQuKpIAA2rdEpwdF3jQLAZv3/G
         SPGB1h9Dqodqa8HfWisL9UzWcpsJX0LAuc0UQfwTSGN80rJK6wtODzaEEEYVSnggbt9H
         5JpAQJJEOR+3xe4htfxOdwXgPDVHO1dHmBvLcEpeUeu356mEZTlyv4D/L8hiQuL7fcJD
         u/+w==
X-Forwarded-Encrypted: i=1; AL+hErG5+CvO4QLKMxvIiTVsGZiNKvQ7ugU+/sE1BEu7KPChEH+MTnGaWmjjhtRmU6BYO03LfQnPPiTcpP+KoZg6@vger.kernel.org
X-Gm-Message-State: APuU4Z/NzDqHH2O7j+LgPa1hH+ypPVMZO0xgQojwOg64sxfYs01m0wy2
	065Kb6eD9qB9l5oOyaVCf0tPULwiwo9OPTa37JBBGNrve/uqZYU205PHXQHd7qi9oZQ=
X-Gm-Gg: AZFdTZd8Zcq2+ZErDzVZ9kxzqHzY0TS2cWCFW46naiDmLGf2p0fRqQWZJfwUO6ao/o/
	qgIjkMw0LmOpViz1OxBUxrrnhA4MYKVRIFBUhonpcf6ONQ8iFcGvKdmDyfeneSGx4I8QB6vWHeW
	M2N1kRKkV/JlE7Y/JXTnIJ6Rnn+WZEUcxznNgqzfQKbamrC176Cgh39Nh7j87oNPOm+SImZC5o7
	IR7mNcGr672/c6fNsG3StYO2vtw+hgHXFukMG3bRTUR0sAcjsRyOGKroSN6ge/QhvXnOb2QLpLQ
	MqQlXq7/NkU73GMDwLA08ME0CZHZn+u1SkH3rXvB3/KYTNU+UaDx2q2YTTfSA3H+oAPr83VA0G9
	TlG1I71dXfHPygPiuo7Tu1PYv3kD8mw0gf+g62HYti2viL9vor2i1B80mmMo0P1CU3ZrSqsy3Qp
	PV7yJuhv8srVUwuyM5MY8Iao1RghgZXWZ+SC2oPFvW4m3Dj09K1PI6pa9dyrqiVEwDR2xPgE3uc
	XNsg+rTV2NXubbb4EWWASookvnN8DC6GCQj6pbiBHbXFTBad/1xpsmt8+sx0nB4wKfAoqmLcgJe
	yWACtxaVzWrCW73IEgzPFDQraUhkVIcF
X-Received: by 2002:a05:6820:1391:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71b39039602mr10599042eaf.0.1795472737591;
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm8511306eaf.13.2026.11.23.14.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Message-ID: <ca6115bb-1c45-408a-be55-68b74977a380@riscstar.com>
Date: Mon, 23 Nov 2026 16:25:36 -0600
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
Subject: Re: [PATCH 08/10] remoteproc: qcom: Skip unregistering uninitialised
 SSR subdevice
To: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>,
 Siddharth Gupta <sidgup@codeaurora.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261123172140.3547896-1-lee@kernel.org>
 <20261123172140.3547896-9-lee@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261123172140.3547896-9-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 11:20 AM, Lee Jones wrote:
> If qcom_ssr_get_subsys() fails in qcom_add_ssr_subdev(), the function
> logs an error and returns early without calling rproc_add_subdev(),
> leaving ssr->info NULL and ssr->subdev.node uninitialised.  When driver
> probe unwinds or the device is later removed, qcom_remove_ssr_subdev()
> unconditionally calls rproc_remove_subdev(), dereferencing a NULL list
> pointer in list_del().

At first I thought a failure seen in qcom_add_ssr_subdev() should
mean that qcom_remove_ssr_subdev() never gets called.  But now
I see that doesn't return any error, hence the check for a null
ssr->info pointer is necessary here.

So... this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Guard qcom_remove_ssr_subdev() on ssr->info being non-NULL, matching the
> GLINK and SMD subdevice teardown helpers.
> 
> Fixes: 5abfe5cf0b83 ("remoteproc: qcom: Add per subsystem SSR notification")
> Closes: https://sashiko.dev/#/bug/linux-5594c348-0c41-4482-b001-481878256d30
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/remoteproc/qcom_common.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index c53190f0c537..6fd92c33392b 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -537,6 +537,9 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>    */
>   void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>   {
> +	if (!ssr->info)
> +		return;
> +
>   	rproc_remove_subdev(rproc, &ssr->subdev);
>   	ssr->info = NULL;
>   }

