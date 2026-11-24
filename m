Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532862;
	b=kvqdQHTbRzv7WQgfzq4KPcLW/DB2aBT+MbAKBMpMtYwryF/bh1YZZp2K3RxrLUkg5YDj
	 EMlCvpXsn5ZTF0Gw3/tUX6yfGQF+Kh2c56guNdvIYyJyCKEpGgxgXXRfC8kkQlWKBHeqz
	 yzLrbNyqhMfJJDWuZKx/GpBVipEI+jp2zVcE80fVl0u33DJgYIimDhYD4NOt+Rdqb11Dn
	 /WyNfEYRvnFYd5GTk22zbpyZc7oGvbqzmMsQ/C/kFHaUrd1rvXIFqIwD4ACZolX9cYcxR
	 Ttaxd/bI3DAjpnPpGlFTTSHsdd3UPk9Al21XafZOJLbYX6VfHbP54i0VFXrhis1nl5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
	b=NGCZUWhAdaj0u3M35msBuplnyMUuVOIhh2vuxGncpKlxWxwNJDpTANGvf0FVPJAZEc0M
	 Di5op9MW1aAoeCVPa31oy+hHOTjyOJYks6uxAWaBnI5/rJxBIczBSPaLgJptrNLz36GrY
	 ufkQkFy/F8Fk+mDs3WaeeJCUs2JtOFleg2T5RIVxRPgIGTpd+SCTDikILWYZ8HoGeGzQV
	 8b7+VEEs0ZhGSp1dwI7XU7eqhcw8+6av59hhg/SbbqJqk3JnknbBH1e83qaSu/toPXey6
	 hV99NCuurWaWo+wSTCvWFze7cQDOHb7FwjUzQ6ssXyzQvKHPaKJju8gzB5buUMZTl+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF63606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso3387311fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532860; x=1796137660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=cA4kVEyBti5oMLaeq7wT8khKjM1DVQUy5qVqtxYPOKnvBvWTxo1pJMgv+xaOFgWBV8
         O+Fb88txNYas/uoXAuVv8jncx+4khzepX5H9SQeIAA0HH4mWphgfrDKfIWzSZzRY2K0q
         L3JiqdQP3BmXzmE48NqmXEOQ4w9fd5OmD+IVV3pwhvkdPK9iFj6oFwLy7KD89+YwQnwn
         jEEdi2WnHYjGM1YZlmouHQjy7/zQaXqf8kxrhBTCzLViBNKtd6rju2hQasrmPN3W2EPa
         zrUL1UjTLksmq0aTlKUCLYp9x209mpDE958BOSijHdkEhZkPtRsYG9SYBpJRVn+VAr2R
         H/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532860; x=1796137660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=Zf8ymdHqsHL+YDlhbiPY9QYzirL2lu4HkLJGdmH4UtiHSsW/Fn6wBO8bfAQV3BT/gU
         nRM4Ql97dOE0OnbogMV2W/4bdrjlfO13TjbVNJ+6fsUi693nSKUbUOYZkuuxTMwMXe29
         GBGzztbPMCmw5GwJzLRo4A3XgLyHdRRiA/IpfR00YcRt5p7jA6R5SQUdYeLhdqIrLCBX
         SbAiYhcGNlTlAHqnDj2r0uisDohYJuZJq2QR/z9tt7ZctkqNuRFrLjpqgC17aX1JRo/K
         YVXVXitM+F1TP5Tznadc3liiPqoIo311RWgw9C36idipEklDofwjk8hVgr7cYNBt8XdX
         7Mbg==
X-Forwarded-Encrypted: i=1; AL+hErES+HxrFeIivx+QNKQYQH0pULunASVFfw2BHpJQONElCW+t54sDcOfw/3LGGdPX0eVwlOQc90BOkscZkIok@vger.kernel.org
X-Gm-Message-State: APuU4Z8uDEIp/uDbi6Np9f2MLB129agGzVonNuC3zwnoyJTYksKnJp46
	mVlaAxkqn19uCEkNwbUdeaeDfJUj3J80i3V1ccaGaiqRPTxGsZuzxSF5zyV2zzprFy8=
X-Gm-Gg: AZFdTZffCp0/NVdPJUFuqFoxXdDVyoD7qy1dQfzPhiEz0LtECEklOwnV8ams+aExzFU
	3WD8H6qFbQEIwHRBF5LdgamGxJO0hmuAceFSA8v0mmwbf047pedz8lQFDf/1d0TCm9FkazmJc5u
	uhOBmdO/BN5LlW/H8kBxCkyBwY/2SDJJTqN4+1Dk1r6Cpvm9NujCjJ5KYxMYOzJjwRuqWjYmGEi
	Q+AnsP+lw+LFxUPmzR+J6fwL3+0lFi4+QCRwu9+APr+CKqYGP/0Fs9LgSKbeRkCiHnj1njkmlME
	Z3jVQxMpE+TTPLRnwvFS1L/atVFRCOpZoV3KjZJtf0Zp4SxnxmFd/SFasBAYJEU2DQPdhgHFxp8
	l75uaA4CHLVW3LKp+XMA3RDPC7AepNzThJpG3OlGNo4BCUpIbP025tuV3CfoeFiCGSc64XMPiFf
	tWapPdfQjH+eUveVJ/g99v1oo56pEiSrMg/uf1ELztu8JwDWDlTF9AkBGZFgyK9K6oShVhN05XX
	cwjMwOto0K/ftvVqQr2jb+rN+LfJ4Dier/KZQEqZz77XhLYXdO89oMVRfn/4h3XVqoVV2qkRTBD
	htLF1SbpRbMREpt5pQEHbdl28TWk2XWux++WzHfkDcSTqX/TZen/l3Re0No1a829WRejeYPUZIX
	JIl9jKqA=
X-Received: by 2002:a05:651c:a110:20b0:3ac:dde9:a04b with SMTP id 38308e7fff4ca-3ae7f7cd8a5mr35764001fa.0.1795532859714;
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm39335071fa.21.2026.11.24.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Message-ID: <5005ec8e-bc15-4962-bfed-74633013115e@linaro.org>
Date: Tue, 24 Nov 2026 17:07:35 +0200
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
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This patch fixes a basic routing error that has been present in CAMSS since
> the addition of non ISPIF platforms.
> 
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
> 
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
> 
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
