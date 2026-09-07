Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A049EC62
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784517; cv=none; b=oNAjMkb7Mc0vCI6MbtvRPy62sLGHJTaDIvoL+ne1vDp6BH/CAHnwqroXynRVgYZPo+EdX7dJD/t/p5JNy5zT+NqjCSwejJFnQaNO/o+vuiuNjUf36Dp0AO8E5gW4ddMsdRT8/4G4HnCstPkFHr71CSOPjbKiT+oNK2UI1OFewqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784517; c=relaxed/simple;
	bh=A9KdkE7a/lxrEJYGel6OtN6molxp/6c2X9YNsdc3A0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHZSjIUDv0gNnbm0uTCN8y79rzkDlf/hoK/B2h5awXQmqHrEqUO94khAkRAB2teFVUrn4Vr+pxo0UOhhTpOYJkxv1X30PrAV98akoq/Ehb3ApY8YDksmTKdZ4eU5Gl4rx/lUobii2Rqh0Kx3D5ckanNm5oR/HcsKMMg5F/lNTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISXcj+rU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=siT+XnDo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISXcj+rU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="siT+XnDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788784514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
	b=ISXcj+rU/Fh5ACz4OzVLvcMaN2RDNpK6F9WJVjZXbUy3U+Tl+lsP9+uWCNKwYJqU+3RGvy
	Ub+OOh2FBkiro/CtDCPelb3821aO1+o4IL/y00e3BVIPlcDo3dZqz/TacBUaOzbrPyLn/L
	wGuAGkHyohFRBEE1s5Rma9CdfUFJN3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-RjJRVahMPiKLOZGYNP1QNg-1; Mon, 07 Sep 2026 08:35:13 -0400
X-MC-Unique: RjJRVahMPiKLOZGYNP1QNg-1
X-Mimecast-MFC-AGG-ID: RjJRVahMPiKLOZGYNP1QNg_1788784512
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-482f41ca436so2904115f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788784512; x=1789389312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
        b=siT+XnDoXYQS7obbTBloGl6AuMozE2WvUvVUDCQcHAyw0HMhbmtMgu8Yhg8vXXDfC0
         ageMeulVjIndrz/PGAAbnst7u7CkQVtCtrr25DY5qwGNYuQjjQdAhQIcKB91i2lWks6Q
         FjfV+ebKzWb1kbY5UoIzWIS1ww/fGOow7Htr6Znv/P5VX0yheUswoIVftaERDSBh9N64
         lsh1xHYPtU4mvlhAI1Wy3gMkRe4JeeOvPh59ihB7XYQ5cQgjWBjiHA1WguSFSIzJIs+L
         av6YDIwhmqvnK24OcjU3TRBJS0vHV+pKcEiEODE6S4vzYOq1u2Wr+xnEFJwqzXDwS0zS
         zzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784512; x=1789389312;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGs1EnzSeub574uPXMIe13ZFm12UfNdhxp96d4YDOjA=;
        b=mdynctmfrPrI0fzAuGC89cQ25tNGIDSRqOJTQRJhJdv2+qa6k5z/wAEuK2cGFdyhJS
         OuLuxZAuZ/r0t1vrnwLeQKhS2fkB8nIcwXbJajLfN5OjL0drhNzmJ9qYgzysuJCVpQ+O
         UZU500TOr/6WKOSLPwEk8zOsFJyaznqQXYPRPO+oVM64Kiz53WqwwsPtj9cMGmnEAPQL
         8thYHES+uTz6eZ6GimgT9lcbN0GcRY5FM3FCPeJ+kIECJy3gmUHc9hOZhXfYtWru9ghs
         nCox3DvQ2xnvjPmNdl2T+s2nJh/1YqXVWl0VrIP106/TOjljv3aYh3vnv4T9P8xfafQy
         joqQ==
X-Forwarded-Encrypted: i=1; AKwUvByeUIWe7HVOBYf2EiExzsQK3S4uPWVFBQS4qrZzPhK9bhP3FuRAWO2elXLN3+FUv8WTT/sNHGkzs4NGRdv8@vger.kernel.org
X-Gm-Message-State: AFuF++m/Yv2jaGbb4BgtM2z6G8DBUkDhzZoqyCb47s0hiY4iziILHaUj
	5ySxtlYzVYMCJBsAHnxJ+UOCdHoANogeBdabvCcomH0Fq972m2pHKkyoWrgMSgWQ4edRxywSvqC
	UTjIqW2f038galf8dAH3Sab0qdJqbfAVHoO1ifGtan6AYrdwUwP+0HwMUu+0zM/TjkM1LJAy7KH
	g=
X-Gm-Gg: AYBFou0XkgUrYzdzw2O3RfRz6h1lJIC69dMV+xGXvweUUGM1rPOGdDRzMXcu7kHXNoJ
	5IT2WPsZ96MWrzCa79N5k5AyTOxWATSYAkhw0L24rib2RVTp1gJpSKfvM2yZZOtU2n7aNa01ZY9
	c7h8depTPCMGBHT23VXwL9jz69VT7D4qvS70eF9fl7WEmt2prxCAp6ChCauBO086b4BtNr99k08
	IVpzlraf+akmbZ4iY1imxtETnsXXbhxXthjXykXidJrt3C/vZp0ZpaZHjW8bsQqNNzesDYdsNQ7
	Q892OLu9XpZZ2c38CC4KsDQoCj+7Y+tQvwV/nBtQaGst7tU9dMNWfvKKenWDkj6p6J+PvPvi
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064090f8f.36.1788784511671;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
X-Received: by 2002:adf:e199:0:b0:485:8a46:7052 with SMTP id ffacd0b85a97d-4858a4671ffmr21064046f8f.36.1788784511253;
        Mon, 07 Sep 2026 05:35:11 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm29439360f8f.34.2026.09.07.05.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:35:10 -0700 (PDT)
Message-ID: <400323d4-cdb8-40ff-b23b-d426a0d7e6e8@redhat.com>
Date: Mon, 7 Sep 2026 14:35:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 George Cherian <gcherian@marvell.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Ayush Sawal
 <ayush.sawal@chelsio.com>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20260904114345.27509-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260904114345.27509-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2026 13.43, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>   drivers/crypto/atmel-sha.c                       |  4 ++--
>   drivers/crypto/cavium/cpt/cptpf_main.c           | 12 ++++++------
>   drivers/crypto/cavium/cpt/cptvf_main.c           |  4 ++--
>   drivers/crypto/cavium/cpt/cptvf_mbox.c           |  4 ++--
>   drivers/crypto/cavium/nitrox/nitrox_main.c       |  2 +-
>   drivers/crypto/ccp/ccp-dev.c                     |  2 +-
>   drivers/crypto/ccree/cc_buffer_mgr.c             |  4 ++--
>   drivers/crypto/chelsio/chcr_algo.c               |  2 +-
>   drivers/crypto/hisilicon/sec/sec_algs.c          |  2 +-
>   drivers/crypto/marvell/octeontx/otx_cptvf_mbox.c |  4 ++--
>   drivers/crypto/omap-sham.c                       |  4 ++--
>   drivers/crypto/qce/aead.c                        |  2 +-
>   drivers/crypto/s5p-sss.c                         |  2 +-
>   13 files changed, 24 insertions(+), 24 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>

