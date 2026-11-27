Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779281;
	b=jsqAqptO/7i7yTKLnODyQEDRvMnG9Rufaq2vlyvRs1z7oaij7YY15006aGWTONFGBzLH
	 9TRZzzBnobK83QQICmd/zfMQFER1eRt7wK0S9Q2VnZu5/c1utNJm6aTgPGhm7/RkFqiYY
	 wcOI20mTTdqgT0l8o4L8ZUTfDzov2MBvBeEQGNkGxrql8wv8C95kKnJjckaAuyy+GceyB
	 hj6gKpOE7dJNEhHd+l8VnxTqOkBKHjB3mDVIBP/ERnhWo6furYjYC2jx849blJd/lswnc
	 2SemFLxTfuktcarJpcL8qgcHzVAssq8RgEU6sGYaD5gwIGrE8PtI2uRJzW3r7trTgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
	b=oqOWKN/Z6YL+u04f4RBVxU0IMA/bA7Lebaf3D6ZrfJWfpUXxXyXgomFeZiX1ojNWQkWa
	 40nZ0CpJEz6gZuwqK7fRlB7gfLf42ZhhviQ1n7d3Q6Y/CUUPXDAjxF6Kd3wQvfeAsIu2c
	 qDBrdZV2U0KLzD9zaycmladG6FmNbcFYQ2iR+PlQF9NiiPG3eXWSN/TihmwOcQUeht9wP
	 2HTOc8F9NMxB2w6bXuxQU+x9lIBZfSX9t0voKzFpO5g3hGt3OM+b1W9yWwShLwsXJWd6b
	 ofsou3QWAT2U+47UrVceDkBvqyRuaQqED8MJJNnDnGhxIlQ11Jed131+MShQ1u7rLzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puaiTsm3;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4F606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD4F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=puaiTsm3
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso3123313a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779280; x=1796384080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
        b=puaiTsm36DSsa04ZAcGzKvjO5BieUQBfKg5/zjaw6B7HkZQ7kjZ+lqhWTNzG5UnDW6
         YUh2z8yHmXjCvYfSZ1cfqjwHXxzaL9lipf5wGrLxKfBY8iwQb+T/dZLDKDm+vhY+8nHe
         otvFiFZllZQL/1HuElFmW9iLD4+d0ropQoStgw6HUXtAT83OIOaeOBKlchBdim6V2J/J
         UPWH9U00Vc/V65vHWmvqbcdud35QZya0o8a+ck9Lg2ONGAyPcpj5rNSRLz91SVy4X03r
         dkMrxsExJOLJorc4BgysWLYOznUVJOpUu4lF7uRrWH8x/gUNxwseub7JXhjGq7auUt7l
         i99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779280; x=1796384080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV1DMm8S3sFQulIMx6Fxah1ANLGniaSymppLiw7gXO4=;
        b=BfufepzN8dsnq3StwiymXmKD/KNtVWwckeJzKn2qAdN1UGj6qnlLheQ8AIuHbttNcK
         ZxYMpMqKz5u8MIjml4onSIYeDjdOxXnI3+I0ldmOZJKLsiQLk1m6QJduTRIGYTdBrBX6
         Oq9BCIBnpEZ4Ww4gzgWRYcQnNMB9DAp5yrXgdNeWy8FA/UBq6C7HxyrkHr4YcLDWfrep
         uC8lk/FBSlRvHBEsY3zb5HHASbzwZXf87WOIkdJegnt9pgI0oScanEtsA2dedpbBj8J2
         jL0HCUAOSe2khWv0aDrZtEWHKUCteMpL7qiya7jnw2ERnXQRhj4iIOvDMIeKJi74o1Qc
         KojQ==
X-Forwarded-Encrypted: i=1; AL+hErGKRFQ9JfvUaVdUtzWj0XF1ZdfV3+sc+EOz9Y8o1yp/Dzazir9ISy8ZXCx2Oh/Ig2joUksciZm+/aoGrGT4@vger.kernel.org
X-Gm-Message-State: APuU4Z8enfTuvz5KjydAbYzOBIdc0O7sPZuEzjgBsC5ES2F9/XRIqzrn
	ykQBLobPd14S0foRUjibr8LnsCH7eiYUKYgNhzaE1jpQ90SEar+5jPNQ
X-Gm-Gg: AZFdTZdtS6GVVefuSxKRNJj6A+YVKc/iJCIzWRtV/1DBipr5/x5DDoLPN11lyUg3EJs
	u7/Cu9ctxPJhiQAGu4KDBtFZ//qtvltXGjhb0NAVQ4NhX4I9Cjuj1cKyzOaTKmb3/E1WrA/fI09
	rHmKINDLVLj72dBkC+9CLG2iUeo2dxtNS+KfetmBdp38X/KsQAv2MbbLiOdA/c2bSNuH1i2M3Sn
	HlS/UUQ+i9GtZJ16Tg3gPTK3lNdrBkR49/p9N4s30bl+VapGWExvSR0DN+LfxbleKEqJCJz1Lod
	Zx0gSNBRfzWmkBi0azRYP5Q90JlaOi4shxG359kejOef497rqiZ4rqWn+uuLq7TvYe3sUO28J5e
	lkHUEkhe+uDCfBzd/ivn3uBwoZNy5g++SuJJcSQKY5cDw3989gDWOvhell9Cc1HCNsKx0CPWq6E
	smnAKwMtUJamwhJsQD0eJRBT4LtYF+suPikEvtIOvYqkCZ9Df1zUr7iJPJZr6j5sn5Z+jYwMRBO
	JUoEUPoF0O5S4N7fBRaT3DbH7uRzUg+kvBNyr1D/RYcb4ZaN87++TOLqNEHSJbefJXXqVcLwYfZ
	IaCDs0VD//hT52TXH1DqxPSGG/dyqcOW2lkwpEUhEqdnRWeJ0qwj8kAb4Cfgthja2gVtjVNGAA=
	=
X-Received: by 2002:a17:90b:1641:b0:3b4:fcba:8c57 with SMTP id 98e67ed59e1d1-3b4fcba964fmr7522887a91.20.1795779279764;
        Fri, 27 Nov 2026 03:34:39 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm24875559a91.0.2026.11.27.03.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:34:39 -0800 (PST)
Date: Fri, 27 Nov 2026 19:34:29 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish:
 Distinguish display panel variants
Message-ID: <awlqxdv2MUpIaMjS@localhost.localdomain>
References: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
 <20261127101942.3215633-3-liujianfeng1994@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127101942.3215633-3-liujianfeng1994@gmail.com>

On Fri, Nov 27, 2026 at 06:19:20PM +0800, Jianfeng Liu wrote:
> The BOE and CSOT variants of the Xiaomi Mi Pad 5 Pro have separate device
> trees, but both advertise the same root compatible list. Firmware using
> that list to select a DTB, such as Stubble, cannot distinguish them and
> may select the device tree for the wrong panel.
> 
> Prepend a panel-specific board compatible to each variant's root node.
> Retain xiaomi,elish and qcom,sm8250 as fallbacks for existing users of the
> generic board and SoC compatibles.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> 
> ---
> 
> Changes in v2:
> - Use sm8250-xiaomi-elish in the commit subject, as requested by
>   Jianhua Lu.
> 
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
