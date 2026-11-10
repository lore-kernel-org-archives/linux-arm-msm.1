Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325402;
	b=E6fmg3yuLK2EPOgQIHWAPJe7L93bltrxodo/UYof/rw4lWrrMo56bXNFVApAD/lEU/aw
	 EB/I3G7OX5y5FnbdDsVxtlzGd6Wk/PEl60v2nWn7zz1Hb6KRDukhyby18qSdjQbWBf7ZX
	 WJKwJ6FaluCv20zzU2UtBId8saGZsVxr5lhKfdvcwYhZ3/tZejnqw97GmVpkJQWk5sFf0
	 cXZENx++EfKQaHY0U8yay6WY+twXtUDXIXHg07vODXiYdqFpW1xFOESN0b0shFvBuqApZ
	 rBZKmBGFW+4cXVCxNEGlzmu1fkPkaOWKrc+GZ04B67ZoA8DiTuZ2Im3B4EjSFIzwxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
	b=LGgEVGFAydUejFcgUwdNBQIqQCoK84Qj6YpwcRhF16ZlTNy4FBf6oiflCPuoD7YIgLrl
	 pvUIj/A3Tz1bpSEL6vjz6vR9NhGaBZCAuL6MVJuCGbCsGJxILUCQhku45D6SOAHhLU7eI
	 kmdYZ+FZOIVZ6yboKwXiGRNzfkwUh8I7VFd9l3LZFp4/bQkPZ5WheyHc8rCB3U1G/OqRh
	 w+ujWESo8c2C1dyqHoro93LBh2k/witMJVksQVtduv8ScqunOHcu+7uAEf3p67U6ZLaq+
	 f8g2p8OgvRUMAT1SkhV/uKNZdJH1Cs8FCsV/LhGgXoXj4s5k7BQh5Yimd86J9t74oGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360F7606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 15:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360F7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1249525a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 07:43:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325401; x=1794930201;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQtG4o/ML/2sB0MvTtvE7H8moOh6q/FDtaR4iqmNY1g=;
        b=mMFX9JFzaDPP428bhxo2ko1xrbpQC3i1ltc4GZgjK2ku+mFhMd7zwF5K6aGoOpNA+r
         Kn/xua5xayhyc6RcmaFzZjSZiZTKOESBI0/iNL1Y307ZZYwQWX8xfVf+FyqMKM5yoeNo
         9R3Q2v/WQsx6uf4wMkhe27KJkIaNl8NALbkvzc/wyVWjSAQXMDDqWMOs6LiXy96yredF
         e2ERRgeUmCakDvMmwpEdZeq7GNZyiTa29wCIufZhDbC7OcO3wSsLbCTsugUcXVUZeljm
         6fnw8zMs3Wr/7vVN+sIcqembRjJaKiLatl7yZiEif/mczeH+RSNOlGXvSjbGGPTidi7g
         162Q==
X-Forwarded-Encrypted: i=1; AL+hErH16pJ2M5xwBD9/0n2iOOeV2aqETlBxf9KXKVW5rnT+CT8NNJygDY5pk962qohzU+mctUOwcQJs+qUftZMn@vger.kernel.org
X-Gm-Message-State: APuU4Z920oXQ3to4MPCAB6NdUCIhBbTMc19eZB+8XphjOcAmhYsq42M0
	H5fvz2VBMdikRyShCQMqMXphP13lngPOUBwFu8GgNU+4g0NgVI3aRg+p
X-Gm-Gg: AYBFou05p0yt9eNZxapQLVyzxspnF5qWsVAWp7sx9hNF+nt7ouvK9nviC/GV6sKlN97
	8DKYdft+/PWfZWT3egnJlIvOGX6hQIsdkN65o+IzBzSmRGhM4Ma7iOZ4NQswbdh4+M3yEc6hd/3
	AoVhLF986jXdAdvp2ypVf2dMgaGuwbWb+Cc/ZIJ5I9IfU8RaFXHQPJ0ENztGSooq5Xng9E7h2P2
	sRTdgyvx+PsyD7/G+sYUx3Cz0RvA1TjrN2gxI5r5jt0egiaQLUNXUZ+kMvtEBhug5a6aCwKI7qK
	9zfITT4UEFPlvdMKkc7rfQmytmmGxoX9Fnj0vzSe5zpQeQ5AMszEE8yMxROjD/CYp41wCPHAcH3
	3uUVCQjPydCmom//0fqBj23qmCWBg9QkW2EB1KpmxEWBRbsqVlpnUHdUn6ecgSHQDOVdsnOS3t5
	JRNCOSovBzzXGooFPjEdi8xd1kHaVRVOZYdteGLfoJE6fI8ZF+HnmRESH6jXkQsfFgEwUR4J0ak
	dVk4okRMkk+b7be75glXu34xZ0cpkdNavNkUEu080cZknYwRu/lS/PdTVw4YOKSCScYFlp4oOyy
	SA3Y1EjUCAKlhRkQMvtdXT/5tKiDGvso1Gdw5/8rUwca2PqgwBsqjhH33GBj/w8zsqpxu4TY
X-Received: by 2002:a17:90b:288a:b0:3b0:a9de:9886 with SMTP id 98e67ed59e1d1-3b166cc035emr3111438a91.12.1794325401459;
        Tue, 10 Nov 2026 07:43:21 -0800 (PST)
Received: from ?IPV6:2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2? ([2800:a4:890:2c00:14b6:ffbd:f8b2:d9f2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d5e830dsm891469a12.4.2026.11.10.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:43:20 -0800 (PST)
Message-ID: <987c1008-d0ab-4508-82a2-1a26104a47c8@andrewgigena.dev>
Date: Tue, 10 Nov 2026 15:43:13 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261109-slick-transparent-ostrich-28ddad@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

First of all, apologies for the late reply and for not following your review
advice earlier - that was my mistake, and I should have responded to your v2
comments individually instead of letting them carry over.

I have now gone through your v2 and v3 comments again and addressed most of
them locally in a v4:
- reg/reg-names moved to the top, redundant minItems dropped, property order
  aligned with writing-schema.rst, example cleaned up, ports use
  patternProperties, bus-type dropped from the CAMSS binding, etc.

Regarding your v3 question about the order of reg/reg-names/interrupt-names
(vfe0, csid0, vfe1, csid1, ...): I took it from qcom,sc8280xp-camss.yaml,
which uses the same paired VFE/CSID layout and is the closest reference for
SM8150. The entries are also in ascending register-address order in the SoC DTS.

If you would prefer a different grouping (e.g. all CSIDs then all VFEs, as in
sm8250), I can reorder the binding, DTS and driver resource table. Please let me
know which ordering you prefer. I would like to hear your feedback first so I
can adjust anything needed before sending v4.

Best regards,
Andrew
