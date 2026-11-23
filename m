Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445636;
	b=3UbUAZf9uW127Ql7b0YcR9FhbuxlBgXu2snDkmpyWoxqgztL41yxU8jYUOXQ8o+BnkqV
	 qlXLWAsGEyZys++IThSGm21yAdSHQarh+herrLYEBEyp8P5TZGjl+9GiDsCOUlkeMXsCY
	 b7GXEy1eUzxBe3UyeCyw1hr2/g2WxmoDk/x0A3OHgxoGcdYD+XGOBHAgjvR5rhZWZAs+M
	 S+C402t6LDF/ekvB96Y6VtKcMGbPWcDkzlBxnZF7Cys/ZlGdFpO7HDrC0s0C4gQQDvsfB
	 m1zxYZP42tbxxbabnFIH894gzAoH+T2+AFHf0gVEpdFej0EHMVBf+CJZL3WnO7mxWaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
	b=u5T/B37F+/L9sq545DOMrlSI/U+27UN8sLHK2ddm48NZ8Dw51BZLC5hVrSiZtjvZfhKa
	 hcD40PJLNsqInWTm2tOrg6PUjD/r34ec9rJvz7GkTDFloVST6spcvAFULpCmGm9TQGqL3
	 dap7NwgLIpurtj/Fp+bnXowybkyY/dTEul+Zerz/7DJmfF8rla205DGIJ77ev90kwLs02
	 d9XJglN1eGOvTwNrUSKoBDh6uTX7pRHPUNE6QagghNdBZ+SZkFC6JunJDzlmTH51I1WOa
	 uP4T9Y6accFA2lPQ11hWLRUE3G4wBN+blZ0NN0iPQ44F9jUqQJ5aIm49I5l/4Fgg20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq2eIIQf;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FCF606A68D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FCF606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq2eIIQf
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2762862f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795445635; x=1796050435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
        b=Iq2eIIQfE+X2hpZnLtK5KXeW5oOoKNIGmzaUhyKl+R0y/t0iV0sHjqPOxnpAjzdE3I
         9IsJJ6o4y1l0/h/Pv/ngbneKJiVuxPpRkQm22MaJQ0NPe09KeZkRKx606assDeei0fJ6
         3G/QA7vW5vGJQV0wRd/4WO61QLsK6TltJF0PZF7BACSir8rV2qDVtMllfo6C8ivctXSU
         W09l8zRxnDMU0X9VImi8wam38vsPJMTJqK6GT3rtWKKBJIfSyQHWzDlb4rqYhlscj9a4
         DhY5yHQd/syDmbx2qe3bGjz76bWLuHxf25/Qyiscm1cwVrB+W4QhC6ilgc5j51kQWN9o
         9k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445635; x=1796050435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjYbBAnnUw21CSTHptfmD2VlxnnBaQMYreiidl+aSA8=;
        b=Jl73TQwcG5Jak+Ml6uy8b7ohXi3tEaSbFq7L/+YL6j01NAxBZXCqGQpkoLLluF3K9A
         TelpA0gEJ23D+MOLQx3o97cAwaDUyqEoEYTJPOTXkOvALWOLX8FOETeDKgTxdIgGimb6
         kleubfudFFRGDOof95xWrLaYV64ZaIa+a4IDwdfDlkg6Auy8HOcSSH6Tk6gScfr3LpKY
         tnQsDNDjmKhPbvL13BuN25Ivus6ElcSWRx/yAT0NDrPq+eRefcFsbhdqOq8nQOb9oFB1
         TPVZiPAiSAXpEVrUErgzjGPaPWmiKQtparP/xP4sJiZmdpbdM/ed0uME8T2ynB/dsiWQ
         1C5w==
X-Forwarded-Encrypted: i=1; AL+hErGqkxkCFkjn65e0mHwCMb2ay19K/7hImPd52l/hrexzz6RmEjKOIjEOubvTlZMkNTkbP5X4ELugOPIT1Vhc@vger.kernel.org
X-Gm-Message-State: APuU4Z8/HUbWLe42Sm+RYlHtk8dT/powVzkCGU5IlPIL55H+gQ9Pu7q1
	chd43aYqw9J39Z3XDz3AVxxTQWwagHForhZ4txRLirhNeLtCj9d8Iwt0BAqLNk3QUoA=
X-Gm-Gg: AZFdTZd/p1LnAl4giZvqvvmyILiBSnJHSsNNozOmX60hiKCcUBtgtb0NhU0KGBURJzG
	Re2CDjXaVed814vE26mPZ2Sq0aIxhKGikJHZt53poSIJWY/Dbr097iRQUS10n/t4d0BXgY5HqHR
	sxtESxCHVAx4Sxq5MrlTFi4nxKCr7UA0nUl2VL8pRF3WCUm/1+1U3NbGada+BLqGmsDrqGaB09s
	/hMcvAVqrS1HxDm25+8IKV46aU4UohU1bx+dLDhQqD0ayz6KB3gKBhhaI7ASb7Wbxlob2VbVycx
	Ryrva9kJjuiliDaUhrk5Hv+GX9XdNT9jfolBs9H4mUda54eW1EgKvX2WDCshOcH40KVrfb/ppfr
	M6Q0/1HAa8TertPVMca+srhjmdz965Ojo9R11E0VpxHjIUuZB3D/C2iiyj9BJaITD8uoHhaHqFi
	DvkRt0xplBaeJxCK5Pd2of9aQ9tV78Bd8x3RFvaEFcwBa/BMmTKII8qeOZgdq5NpQ2Cn9eezLn9
	0av7x50zgeHEdoWmw9aVhhQE++3pg+4Hr8IR++R2ZTMCaeKg/jXXX8Url2d6y+pS/q1eHOEAQ/P
	fy+Vkkrq/2oWLV89326Dh0D6eHClZx6X6qenNapyhw==
X-Received: by 2002:a05:6000:4b1c:b0:48e:5550:c64c with SMTP id ffacd0b85a97d-4abb0c5d67bmr23963685f8f.14.1795445634931;
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22291862f8f.10.2026.11.23.06.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Message-ID: <ae872741-7194-4a4f-98ab-5e46cf16ed12@linaro.org>
Date: Mon, 23 Nov 2026 14:53:53 +0000
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
Subject: Re: [PATCH 4/5] media: qcom: camss: vfe: destroy mutexes after
 unregistering entities
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> msm_vfe_unregister_entities() destroys vfe->power_lock and
> vfe->stream_lock before unregistering the VFE video devices and V4L2
> subdevices. Active userspace handles or concurrent teardown callbacks
> can still acquire these mutexes until the entities are unregistered.
> 
> Destroy power_lock and stream_lock after all VFE entities have been
> unregistered and cleaned up.
> 
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
