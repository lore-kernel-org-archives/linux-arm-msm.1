Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459871;
	b=Xe6BvFBAmafnOxFrlFi2lMaf/dF/TXitnr4M+/CSYTKcSQdet86wviApt1lXaxeNplxa
	 gT3R4Ae33ODIC06jnonbK9TI0OM5wO/4urwKHLs4/+hsF3Jv+qBo5aZ6wBTJispgxXeos
	 kudmf/KIszxeo48mxNx50UTZWWAzemWIblZ3fUwzVA7NN67jvy0rVZqF2CrlOIpk2lEwY
	 RvOf6TeFO5C38fp6s9AYy5XlWQqkeSqdEDefUCE7DfBpum/24dw7o9R+Y06a9vImt+XyD
	 4pqgkk9WgLmyCfTPXZH5PuyptZ5PcJqKNOJEjN2B4Q5Fvkgl6ONUKBnfFLDn1QGhwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
	b=FuGmtP3ZS39y6zVpu1NfNExPluGjiA6Z4SMYAp6YYe2tSc43BbA4ddgXURvWmtWd0Zzf
	 Z2iHa1ClzfSe0D1kwORTqlRgzrWEzhySyEruz6HJ4nKiD39QdzpoucAfwWVlRC8UH5sQv
	 YWuGSPyNqXfwz2zie7/hp2ap74hbIpgXlhg4/0cQw3zwYTOctuSe9wu01B+PDRoaugEQN
	 +ttx9299eAfFZgC+hidce7sxm1g1e9TFloDllzL72ENdRohkcmHSlOW84VfC0t48tqH3K
	 RSDt6QPOfFic781StjU1ZrTUFTi4HzrVlBcwWkGB130gji51LTa6YzUVDCwfD624tHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPdLPZff;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A75606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPdLPZff
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5371732eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 18:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459871; x=1793064671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
        b=aPdLPZffNmo217G9eWGlRm1FdljKwmlMRRhAYx4MmC6SLEKjyRsg8qO+e+UU4wGfvK
         IXxJKWu/71cohwDuIAM72o/901AzzXVFeZ77ai8hv9VfcGWR0iGFF03S3/8r0AkeI+rk
         MmEHUgxBULR6/gEWt7F4jqrP4gB06tCzw0R36h3mYFNJwFKdzxAGXo8xSDD1cUZaKixW
         JLRFEeZ5KnqR2IQdmpyRdrLMGxT2y+7geNUYN1cc7/3tZDN6dfb1ONb+fawinXq3kKiO
         DQl1LKXtuLia+4Ta/39Xng8xFeZ6ebvCiIWk9VWm0rM+i2YkypHQHTFQDBxHRYI3Xgfc
         72WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459871; x=1793064671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzrF64kiEKqqwWT5o3bxL2C80x1Hbvhrh6y19AZ3iRw=;
        b=z0P7B2484YPKl0fF9byTULWL0VZ/uvUo321cXqwANpjhFjmJ09L99u93pilODNn2Lh
         UuR+Cs667zrnC3BZzAdFfzXNK3ET+WOp1Jr8rI2l2q7Gsnfc9L8qjH+59Z4Mkm+VKnCB
         vMswEoD6nlFNEGQFXn7PlO+lPGxBALzhEmxkp/ps2r4bcT+7z3W5foK7GW3LyiiMiQWi
         q+T5nrvEE4zVGulRwdSdHDnk3uymQ9EJblucQDKnfwVa+Me4a345zVAplwYjrcujMAIU
         CEQWHHGO51v5TtnTq0c96ljcuW8Zvbb8iG2QCbIdN9v2FKbzgbcULleGz1KhYkMjQZ7I
         Dp8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7tvU0EGVpfHK/ebiBBv7ry6NqR5ef9WmsM0fii/t5IALG1abHGdOqVpIJ6wcdCIzmdAXkqcBrectHwN93@vger.kernel.org
X-Gm-Message-State: AFq9FYJakLk23WHLkGCszf2aHWQY6HK2RxzULTW+9ZSKbnfBUxSZhieD
	J/KcxB1r6K6Uep57yewPZlGpQsSesBm92iPkj4V5azbHVinTSFzRmeAP
X-Gm-Gg: AYBFou07XSydrHNJ9mJnxujaORCQKrHvDxWN6lNVv/OZY7l3vS7kqnoPfs1MuPSuvfC
	6yddbpVvrvPqRxKw6Upk5O6KiJDyZV6hGWNaVrXYs/eAxUtvhQDiflEwufk+lH7h/HODqeJNuKG
	60SQgA+pniOfNvohbiE9WWOqbO72Sb4+oJAq41aNYNR04J3z2gA4z4/8HE+Gq3CaWTwWHfbKVRG
	wQJcT1mcfr9nQUNF6IdrKIlnD7DRLf6nuOs1aeDszWMxO8Ht9n0PvUSZhpjEkxyhq+Ss4m2pGBl
	WjTmDglnJLoLgnMaSIIAH6QK2+ktwFqrU4wO4VxelBqkmZ8FLbzTqAbGBwooKh0c7Wp9GkT9fvN
	bnIIHrdES2pGUqv6X/7lH6gbYGL8tl1FdXso9i5mMiBME7ODRKGRuda+pqo3rXFOEHk6hx5uwJi
	9lhMjdAd6vSMFBeY49ICh8MxPvlA1gkpNAlf5a7pH4T8oPRcENe2mK/OOGXk9QjxBRVHpPw98iy
	hniVEEtidfN
X-Received: by 2002:a05:7022:f51b:b0:159:aa67:28c1 with SMTP id a92af1059eb24-18512b3e25dmr13513794c88.20.1792459870405;
        Mon, 19 Oct 2026 18:31:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm25427211c88.19.2026.10.19.18.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:31:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:31:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: qcom-wdt: Document SM8650
 watchdog
Message-ID: <4b808464-c860-451b-b179-fdaa39e14fbc@roeck-us.net>
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-1-7d7f7d71d88a@linaro.org>
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
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-1-7d7f7d71d88a@linaro.org>

On Fri, Oct 02, 2026 at 11:45:28AM +0200, Neil Armstrong wrote:
> Add the SM8650 compatible string to Qualcomm watchdog binding.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
