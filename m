Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7ED448B8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248941; cv=none; b=Oi1gutXo6KA9N3UP6OQ0HlBiKjR2zDpsGs+yI6IyR57ldAOHUve/zKHAlt0hLRU+AcZi50z+BYwXF5L98YpsL75Brw26RoHNl2NmX9Hf+3cE1LnU2JfR+KbKVZ/ViTSdW4Uv2qwUDvzzSRaIp1AyWMuf9pUD6YrYTr1mgl/wf4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248941; c=relaxed/simple;
	bh=zyuhGX/3N+wI7ceGoP40unsL9AFFjmxrAgXkFycZex0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHqGx5XTWZqWy0H07e7DgOWHX8VK7Re08jSFdZG4cUN2GxKyHDiwyfYKzPVGSO598PN9/UqTjExmUV3GlpBvXTPRwLVV6muCo522b2IObdXl64157dh7tEcRVHHBa1mzWi+UKNG7VreeH+5qAIB20xfcP0F9uB6MEO7opYaaeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOKuUeMJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOKuUeMJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47362928f65so3736860f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248937; x=1785853737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLqJ67GqELfYXKH0xBSIba5YqhAXnitzWC8wHwVpGsQ=;
        b=iOKuUeMJh7D1y+V5MCHo2qIl4yWwVMFaX4pAGDNQNBBBQFlHBvIXRsXdu/YV96ItWt
         BnUua7XMKFou4921d1PDhBEOirl0kIzpcZcTVUyAVn4fe0vhfOzLQ5ucixn3xZLO/97u
         RfP8YISCAg/dCF0IEOJZt7kZuCjMk0pQIvMqC2y85uxQusrcsvFS4GCaCmuPchEKJe+L
         JpKExZkurdlIYfL0pO0CZNhsk36ao9UvC2S7FiKONE8AnKmdyDO176sFLUQpWWRKEq0k
         iEi8duwpHpQ2puNejYQ6/p2TipdSsfOk9lgWF7ekzDgjEoae9uY7W19usZ4M3xYN3lrV
         PQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248937; x=1785853737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gLqJ67GqELfYXKH0xBSIba5YqhAXnitzWC8wHwVpGsQ=;
        b=jnpA/b0zq3n6lzvjWuYz1KQHdaskHiHmFBVQJuHVz/tgolrl/qPKw8kGtZfPuhkqKf
         fOHlRHnTDlF4BveqL+V9xvh1lDGcgI1Gdrh8WN1hYq+MdTJsmGQCdbjxjiQ8Q3rsuKtR
         d22KtaGOTc9OTcA6jw73O3RLj4TXPel5MXmC9U2ok4KRny0jLuJHZvAU7QNUN7rUrraC
         3FD6blSiHjJgSMFqDvQT3IXiZfLoHl3ZiV32rKdiP+SnVZjAcct+Lcr+btRnMaaLuM16
         KtMPAfRo+NMWqAbXJb5rmo4mvuYsOnLnl3dJfQ6YxcVtawTmCXP4Z5hJX63Oi+fWtAWk
         yZzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9HK1ApdjXFqhXG/cYyUWE71U3nDAAuJjCJNGyq/BDtbi3JywlB1q5+/AlEzipGTHNj3hsp0YmOVC+kY49@vger.kernel.org
X-Gm-Message-State: AOJu0YzdtE36B6dxxacJ0cS6UhLAxoeRXttaK07S1YOTGS8UmXBZ8mjz
	t/V097ZAQPPITMoN7VyFQ8IOddVfjaOjbmoN+TcChaaE1tXYZirigeIa
X-Gm-Gg: AR+sD10nJhRZggS7nEQXODydafsym6rYezCwzZyDe8kEZJzsehWQzImp96/Mo2yDzoL
	Qnw/q3ikHM5adrNQL+BqmmuAeVxd5DWHRxWETKovyDRg9IqRcvLEbitkiVo52bBhw77FEcCliFV
	J2H5VcVSCnPwKBA8wp/BNBmhzJuL39ycmtpSXtvWOta+RSSsEJG0SjEOkUBHIaNUagtlCJDsn8L
	401Yq3BsMWLV3rSdmnimt6mZm0rwCjNiuXtuXBWE4SUdxWy7lRfJowDVoJsix0YmpfanYWwiFbD
	MXOaYJCm9oqmElrMBUYYnfkvFskBCf7kn4loG+dK/XsEU7rIHKLfySg6wFeaRjDAxfMW7ecSONS
	rGlQGStZPBk8mju55c8etOi1M0/+l91IwY7HodpsoGjaAJH9tPntB49QhWQ1c6hD/5w26mZ971J
	p6AGURv09Kxo7Hg32JJ71T+qxQwBsfPbjRZCPTwy3LhAsTo5TZh0GuQKEfo4vJGxex6BTzpA==
X-Received: by 2002:a05:600c:b85:b0:495:6400:ab62 with SMTP id 5b1f17b1804b1-496c6568fc6mr33023445e9.20.1785248937306;
        Tue, 28 Jul 2026 07:28:57 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45b1c2asm84007205e9.5.2026.07.28.07.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:28:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <be91ae0a-61b2-43d7-9028-411bc3d7f13f@gmail.com>
Date: Tue, 28 Jul 2026 15:28:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: PDR_HELPERS, PDR_MSG are independent of
 QCOM_SOC
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>
References: <20260727211124.853520-1-rdunlap@infradead.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260727211124.853520-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/27/26 22:11, Randy Dunlap wrote:
> Currently QCOM_PDR_MSG depends on QCOM_SOC (it's inside the
> "if QCOM_SOC" block). It appears to be independent of QCOM_SOC, as
> though it was entered in the wrong location in the Kconfig file.
> 
> Moving QCOM_PDR_MSG after the end of the QCOM_SOC block fixes the
> kconfig unmet dependencies warning and survives both randconfig and
> allmodconfig builds.
> 
> WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
>   Depends on [n]: QCOM_SOC [=n]
>   Selected by [y]:
>   - QCOM_PDR_HELPERS [=y] && NET [=y]
> 
> Caused by SLIM_QCOM_NGD_CTRL selecting QCOM_PDR_HELPERS.
> 
> Fixes: 0ac5c7d933de ("soc: qcom: pdr: extract PDR message marshalling data")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> 
>  drivers/soc/qcom/Kconfig |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-next-20260726.orig/drivers/soc/qcom/Kconfig
> +++ linux-next-20260726/drivers/soc/qcom/Kconfig
> @@ -90,9 +90,6 @@ config QCOM_PD_MAPPER
>  	  implementation of the service. It is a simpler alternative to the
>  	  userspace daemon.
>  
> -config QCOM_PDR_MSG
> -	tristate
> -
>  config QCOM_PMIC_PDCHARGER_ULOG
>  	tristate "Qualcomm PMIC PDCharger ULOG driver"
>  	depends on RPMSG
> @@ -297,6 +294,9 @@ endif
>  # Options selected by other drivers from different subsystems must be outside
>  # of the menuconfig if-block:
>  
> +config QCOM_PDR_MSG
> +	tristate
> +
>  config QCOM_INLINE_CRYPTO_ENGINE
>  	tristate
>  	select QCOM_SCM

This is a better solution than my earlier attempt:
https://lore.kernel.org/all/20260719022242.139472-1-julianbraha@gmail.com/

- Julian Braha
