Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398400;
	b=ILU+Mr035VXCOvF97WncNES8qrh53za0oJC6NUV7bnquEC/UPIKsbB19rwJ8+OFekUU4
	 1HTadjvObmMAVlTjZg/jVMZdJo47zDo7nwN1U0/lK8mfAiz2v+URKhdQ9qWfBXpedbh8N
	 /PnkJ9u8lVEdRCRfSBYwoYjYHiZ7KG1UO+U6JkrTlG6FvX8dY6GDK8M3DbdjM/hH6vRbv
	 HutBQEjsy0LzJPaM4PqX8dnsdIyPB5PcJf1O+rOd+st7xmLyVZJetiRDYpI8N/vDLzs10
	 BReNfLp+ngMsC8EEEpzL2KLpmN2hjCHfjgpqHhgN0Iz+p8WaFKYctVjNB/sSs/f0Hkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
	b=FBwbCQQxk1YMzSqjFpyL+dYozUOMtHvhW+wt6LOd5H4VhsTdmm/ptOgkuImNjiYVGBQR
	 boIhzaovunTJsUlvU+7XcG9r/TkBpZQHX4Fbogc/cfw7KIOqH5NwOGh/UiGGM9Au5HdyI
	 sSpBUUqHN+xn670HhrwoSgDU9sqpSkn5IXsApBs0a5RmMnFB0ONpwSY65A1gmzBGEfSie
	 LaIXyLI/Zx8D6cxAZTC5m6ogYbpPhLwk125ykWJeJyR4qPnhy/nq+nHL2HXL46MxhRLGl
	 3/hDwXMns8X96RN+DC8gGZbfA3hBFeR35RlIfTanbT6cBMJuGZ41wrS7a6RXoj4IdGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0441606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0441606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hyMUp7qt
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20244145e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795398398; x=1796003198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=hyMUp7qtXScGFjw5VJWtC8lxSVW/noa4jMYKoldsEQMVJJfY+9Sq7WvD/3a9YtO61f
         t7q73AZbrv9pio+/1SqXRSNyPPVXOdXN2qLGCeDhkhj/M3o545TMI5DNs+JMIU+rn+59
         hQrSx7HzWfe0FYJUWv1i66v/qdPGNjWAH94Kc2y60LmwbXqAu3pTLwEt0Y7VXZjulDd9
         f3R3R90rtf+JjUpCnn3Nh06DQxr5tSV1hu2FtYCgas7hwt3CSBFvmT4DcRzxL4qqo/kh
         7rMae1m40aaJN7SgoLmnR8MmEkIAzWHJuJwoMP16c+cMpV4AmIJUpPaareUMzlnzz8mQ
         ZWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398398; x=1796003198;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7SM8IJEkihEJUb+/6O+/CyfvEJC1DOUd1MAPDV9+/g=;
        b=Qa/ZUAErCTsUCAFdyipZ3SA0ZuFP2/OTYd9qMfQmmSxswm/qtu0SjaHD0VRsFGGdAN
         OmWuwC7PPhpRqHYUf8dVfWpEA1vFP8GBRS0GDofomrT4zBAK6rtHoaQPXnPVFlTeSofk
         pIZ6Db2ttflEOMRg3ld3/JpIFuc0pOGAOldmAVCZ7lTn05WlzBGsvI9ab8G3lWM28V0Y
         7sk1920pACEolCDrZmbXoll70NwUomNTNoAAIb/JPtmfWl88MF35rYzPsT/Fcn6cOBkx
         pYYT5DEwt5oLy0+2BtTgNjPI6uD0mx9Xk/3A+eynehvkINcn6sUUPkEE/DjJAassQejO
         5Kag==
X-Gm-Message-State: APuU4Z/1G349P/YbxrnojMrWAlgZKbwyLynKKEVD0Fyh/TOR7ObHwvNI
	sDYP4pUuF3sETwiWx6lBJF0hX+PvCMk9v42oWENps5rrrR3fkhywXDtril+Npx5STlI=
X-Gm-Gg: AZFdTZc5mRY+OzMQX3m/DdxYGzIaFvYsPY2cCI0+8N2nmVjb/RB8juCTpDUbLECplAZ
	ELHiOG9wwK1iTIQlPoT5Sb7x+MteZfSFBw4NIR3LOIi7uoEKF218F5wd6BZoP8ehCt36MvrZsd1
	ZcX7yh9/FtWdm5WtEUmEhJaMxGWXO6zjvrJ/DWVy4qJvNLDNScaX02d9+D7FYXJgc8LndkXOseZ
	f+f6Oxx7MyL61erQo4oDVQEv/7iSUhV9Ov9dJ6nYWEGChDzggAsjaUoChCPlRLXv2LPnCDAFxh6
	c8j8EDQFsYRAnJ/CHSKm/pIoPJQ5ncu4A7MlDmbBpOjUtP266J5WtadveXvHsg0kjNVPIVOZ4lT
	v05zqq4/2end2bq+7mXUteaZxVGAv8pbCzTXNFM16zBt2KhD6ja7bIZEdC2ZWEgmUk1TtBuIov8
	u5LNLJYC9uPL450P3FYZIyF4lE5eGmuinfXU1I4QgS6QbfOWLTNTkTbPsJPH5uJkEKvV5606oxB
	tWzJkXZmQMB1r9NYs7FIF6pKjlu9dRA4uoZ03Gmccrgble+u7AlRaI3LAv5z7txtOGh2frqdjYH
	lR9SVZLpDKAdPY4GyvGmp4DR6qm/R/c50XrYWgSsGQ==
X-Received: by 2002:a05:600c:840d:b0:4bb:6814:738c with SMTP id 5b1f17b1804b1-4bb88820cedmr210403515e9.22.1795398398283;
        Sun, 22 Nov 2026 17:46:38 -0800 (PST)
Received: from [192.168.0.167] ([109.77.88.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm264872155e9.9.2026.11.22.17.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 17:46:37 -0800 (PST)
Message-ID: <e707a3ce-7e3f-480f-9166-3f048b02e7e3@linaro.org>
Date: Mon, 23 Nov 2026 01:46:36 +0000
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
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 15:04, Nihal Kumar Gupta wrote:
> Glymur previously reused the X1E80100 CAMSS resources, where port@3
> selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.
> 
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.
> 
> Signed-off-by: Nihal Kumar Gupta<nihal.gupta@oss.qualcomm.com>

I mean this is a bit of a convoluted way of describing this.

You have one less CSIPHY Hamoa has four Glymur has three according to 
this patch.

=> Fixes: tag
=> A commit log that says this

Talking about the ports doesn't really describe what this patch is doing.

---
bod
