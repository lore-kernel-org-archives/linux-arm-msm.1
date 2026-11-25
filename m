Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634268;
	b=GqQr21ymbwMQtojR8RHkoGNIcP0pugGrN//Aq6kVf6EEsfljP4OwOJCz3UZeiMGa1RvQ
	 fkJSYGotPNJShCwOqVUZi2NEuFZr7F74DhDWtjA6deEytiIudt/twUQ/N3f+R0pwlIcKw
	 499+lscOOnEvTKSKGPmiKjE28FkIfNKGAUABDoxRokUsQrHKgT771OrCQ4jAku432aEBd
	 s2BuWAuG/wNZrV4fuSOh3Vog2f+9/XVwmS+++WbjxTu/ppq9DCCr/S/gFWF6M+PRUicR+
	 yNLQrwAw2rR0pWuLUMu9igU1OukPVPQJ8s634pT+XB9OnFmqXDvSwq8/vz47i1hizZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
	b=H7wE9BvKC7D7RznML08kt344Z8B1qva15Geg5fymNgZ0tU61TNyuwNDE25nCX9Illh1y
	 igAAR3/q7UQwaOwTNBz3mMFMAa4nLbJPt0MMf400DfntjloQNQxN3ZEu2p9pYwHVQ4Hkz
	 mDTrLgRspB1t6qQq4zSfxIEtFIR/rlG68lC/49XCGBGcGDwaChZGNUukSL1xF0zc1TbZr
	 ITMfSADJ0TU6Lr7J5gexd0k98MzG9dQ6LhvtC+oInl2azEwTlmuolpBhP/V5QDIbNuM8Z
	 m0EEOTUPdMZQ4vdzzTKXuGgiua24KsxVS5EFZ2Gnz4izik0v6NVpsOVbIORjSeY+l+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pvBp7/tB";
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738C8606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738C8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pvBp7/tB
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adfb0c9e3cso5214641fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795634266; x=1796239066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=pvBp7/tBpC1KSjYcZGoQVAbwKtI3KuoTioFuA05nFzjOLfCmy1gzs/om0I2tHfavRB
         yP7wd8NaLh5diwgrRFebK6Gec0OpjEbLbqbesceF8RpBwkYV9NEESDgr/+JaWXAWM2s1
         zVVbYvkYIuVNo5A9UX/5fGyzqXUNmc9Lb1Hr9S+7DhCUDyt2CWeQBUiyxYKxpyFHF4Wo
         WQTxTpKJ+SBZrDtd6LIphmcpAl2g3ThzWu39jZN12bxfiUqskPthYJHrgzTvat5q/EGF
         KDR7VAJshgus3unhbCoE8Uz+i35+I+y0mtw/W0v2K1C8f7LxlLxHUuXzqHT7keskXDdk
         YXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634266; x=1796239066;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn5QeghxKopwgmJC1JLC3ndSunXCU3zxobPFDaZ1R/c=;
        b=Gt0P+9M+Wv0bzwr+vaKVyH759FLF0ecFOsrwU871UT8Bd1ZQQ1cGCU8VID9iKxNHld
         Dmj3dDutBv/5aiX/kO1oNGBkNCivc5jEpdcW/rkkux/C2trdysJIPlAC8eJ55xZjVr9M
         ShHX3KUBDFE0ZA/mwemAQc+Io4P6l+K+KDhFFKNvdiTlRweFpr63b4GRL6wBuRVKXwP0
         D7zBNB7UqIGlAlljUL3tVN2h2AFjTI1mGtacC9hjJ3vpV3kwR+UhreZ1VNaQfEhDqPm3
         rnqcP2icCfmESr2aRp1q42/q89YGbaishRVkTr+mKxzLwgldOkwpGBXGzAkKoXmjSWwn
         EDNQ==
X-Forwarded-Encrypted: i=1; AL+hErFsBrzM03z8sdGhBT7sAPLc3zmVV2XJzMSuQ6PdiQ8YwqehW7SSaRyxlFdZwOhAmLHF1RM3PzRJmMc29T4u@vger.kernel.org
X-Gm-Message-State: APuU4Z8jCWK1JRTROqddwRz9p5kpuSkbMlth30HR5sr1HsY404ALbtdG
	vXkRWtZj9Csgsnq+uewm2ZH4u+vOHE+VTiJ7Y5ra51a4UeLZqeRzdgKQjV2fnTFOXyM=
X-Gm-Gg: AZFdTZevv6a6wnFbsdW9bgNRn9e8/VofdRx7y5N7eSO0gr6iXd6Ko2OydIr003pi1CZ
	VxuMHgmazjJrNiccLSA30+5RIvisvrj7WDXJeBQFrkwrqv6yMRb+8ARV9GcWlEAw27cdD/ck/eB
	FbOFNJKSBNmSAY6t3L63ETx6pD128sH88N2NVgX2jVuGDtgdLtQRTXhP6JXqRr1orPef3RfJV/7
	d3FeWvlm/aApkYgEGNMycqRPtDTkc/zDN+OdIRgOQ/KlADu6jMgqMkSF2SwPL3v6kqFCwYqLAvz
	VsHkv4KFX4FclTuwA7t42iYrQB8xJW6S4W/dgVLusMFJ3/1XJOwqeqHfW96gQ2hTgDP+EDKifoi
	WzYNkdXuw4SPJHwLVdm1ssA1lMnDmCZGzPTJ4KmkciItCeyFvuu9sRkp/Kvx/9OhaWGdJaULppc
	ICuKbjQ8eUF8qoYNe6F76OIeltljV/LSKNspFpWAKaGNIEHHdlg2Xf7Mq9IvJHOmtA/T0+rEOEw
	Ry95S6zEacc1S8cLR0UugUu58T2y5OmwCr/FlXMyKQdxt4nC1VT2Z9tRQJ/KjmsTHY50xDXnT+5
	fzlpFPtQBNGhQQbDBNEVFs2x1ZD3eS948DOkMXzbtGeBl5piXoCmBTy6H0Z5O5G7gUEd+QTh7gM
	2Fudz62I=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6416689e87.3.1795634266419;
        Wed, 25 Nov 2026 11:17:46 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm45702711fa.28.2026.11.25.11.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:17:45 -0800 (PST)
Message-ID: <c88c7906-efab-4956-bb56-cf9ca6734c6e@linaro.org>
Date: Wed, 25 Nov 2026 21:17:45 +0200
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
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Rob, Krzysztof,

On 10/31/26 13:21, Vladimir Zapolskiy wrote:
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

that's a gentle reminder to review the change.

A report from Sashiko bot is a false positive, there is no intention to
support the old dt bindings:

* https://lore.kernel.org/all/sashiko-outbox-191924@kernel.org

-- 
Best wishes,
Vladimir
