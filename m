Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582186;
	b=QdlrvrjK9czeN5UFGs4VaWXTvx9mTaF+H/WIbFhcypEx01AjAWNVgh9T6fo0lrpBuYec
	 r5War80m60soy1Uz+7bsbJHUfyXTXcouUWEZ42+u3570eRj7Ypz44eOjXZ376/RV5UCc4
	 SNWSscfXgWedVHjvlo0g11g1DriKdZOinBx6jGv0r15SZvhFcAIJEkU002ERPFEjhiATt
	 9WB7jSfZfEF9qdxaOO6xfmWrmxPotVe+xDJ48fMdYmGKY1aytB3b6AwcAVIKpm4olzYi4
	 TSp6gfXogmMtbc1lCK3fE7/VGS3LhFbwlAF6rQU8btAhLR1Yb2afXsdKIL/r7l2x7dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
	b=x3VQDNn+BYqvgXINQfVxaTdex8u0Jc7ChsHdm9sjFM7AICtvl8pESNo6l3lpmd19zXcH
	 eDcHGGQiPKnGEQQdwP+NOyvde8m1RTRR71Xwrd+hjxBsRl3eArjb2Z8u1n9pl0TEXQT/0
	 dRUTITq853KK20Pm11XZdL25Wk7SXe3c2Xbf06X/XA97Ib/nlvByonyP1ihGPV3pI/7P1
	 Al16Xwf4UXlmZ4+rDVu7chVRuGg3Q4LR4w4MSSJ39bcHbV/i+KOuxpG5VFSjP5fh5/zcX
	 Tlpy/Q8X6LvzZse0oNFVfQZUzsudYa0HjY5MFJhpbs1LORQiHir4QXXkYVKxCcaT+5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E28606A88C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E28606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11581895e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794582184; x=1795186984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=DmaorVqrPTMOVQ5U8Z4ZV9CLCYtOsQghBVhxjRZZypTvKdqe3/9BTAIM0++jsMVoso
         HL94qPhZ6o73tB99jYC6lRnai1gN85/OxOeeR3Lkg844jP2jHKTpgBrahU2QuMgqJM/+
         XltdROzgrWpbNnWbK2/6Os4GTRQEuCuSlxe6UD1NTKH1LhgkTW1ghwMu1GF8Q8qrJKxu
         9FHDPiS/HxyYfklx9p5B36W3I2P11LjAl867xXbhxpHKjzueI56yVCLSUcNwIHFDqfvw
         4J8ErN3cxdBuElgNhzfCnl8rrjiU4Z56vYCEc/otfDuUD3UYw/8na6FbuFHbVaDKWTQh
         LnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582184; x=1795186984;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=lT85Wd69JPsZEZs5TvIqVkKvW4y+2XktWBM+OVw94ixyTmWomWKwsfDOM/mUvZLDxk
         AXmmQJlnPmkSDnD7276IWVNmvJnn98rvf5/ZAx9u7NQ3NhRvQDZGjmUH8A4Ty0jhrmO7
         d83ByoglGRsSQiL3V+77PBYQf51JwCHtlpugI4A+A+HuxwseMnWaiTA/SqiIXE9w3Uj8
         Lyfn4EcfdnfHVdUnLSoFgAcoCu14kdjOW/6/OQtMe+PKXAh4hYp4Yvcy34+m5/ZY8psT
         GTbqD3WGeSZKH30cIBwxUhJ+/HmY08D232PfWD1uqUKLtftT3KydAwmYIi3StgeDN786
         PQ4A==
X-Forwarded-Encrypted: i=1; AL+hErGPPG64vI+pI3zrsEbpCqcxFgGEqp/etOSQI9bHwrqfwxnv77ieRbWFlq94x8eXGWUZpkUKVTnfz8QTvUwW@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y03H0AGvwq8WaYHwVeXKtbBLAhAo0kVQc/cAeG6L58CIMe8wF
	+rdBZg+lcPfSKMRVwzbE+ahX5B75mk54lkSuE2naVmID33c4ug9zbIwlGy+cdPCAwD8=
X-Gm-Gg: AYBFou0TT0p6gquKdzZAzTnGsf5ku/LXLKDDSXVsNJKQSFlF/Ch54D/XfsvCE5u35Ln
	pt1Jzl+iLWDew9d5khQsEYh9r50JxLI/tURdPX8VMQYAi9Xg/nw9wdMkaeo8U5+rf/u/uM6UEOM
	dcVFAvUU6l2YQHZO6Mux7hTi10T1y+hgMPCd2aRWdvngugs+SjhX4w+2nXucWmQ0KQThoRDBmxb
	2EO6QCSC2+y9wjaDWAcBa7ml+M4s/5LDO4yT1mJ2GfJGihge1uUo2Zs6c3QPosG6kkdeB36j/6T
	Zrqt7pfxiM1znHvvyOH5rxEirFMtQoMYxxH3anBQd2z0cNEgO7H0Eg7tDJwvqD0H7h0UlMvW/f7
	GZ8ej5o6PQ6FEtviQSyfvvcF6Z6U4dFo6al5ij/PGmQWtknjToj1m+aSuZ9CspRWCY29nW06vFH
	dwRjAURC1gxUKexDcqY1rHbLk2NHxaSjli3DA4y2KofviDKDsWW9FtqtgEtTTEcLErgGNn2guJa
	xG7cTnjfeqSGXJaoJO+KeqiClZ4Ds70q75JO3mPFPVdyNHji/buUltwRfqGaOvvvRPfzG4lIgt6
	qFZwXixHCG1wKMAmcrcIZpd1DhBtyRCs1SpZ4vs=
X-Received: by 2002:a05:600c:8b76:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb55a01a31mr55189845e9.4.1794582183857;
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Received: from [192.168.0.167] ([51.37.10.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm29719315e9.4.2026.11.13.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Message-ID: <4edafbdf-d0ee-473a-8f11-92be44877583@linaro.org>
Date: Fri, 13 Nov 2026 15:03:01 +0000
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
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: heikki.krogerus@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 02:18, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
