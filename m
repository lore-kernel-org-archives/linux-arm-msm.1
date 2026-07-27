Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9D1A08A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165318; cv=none; b=udsgnCeopBDCG4mq9ZoywBDXbXGIjAxUTxCC3Rg/UmrLJdIKQLn9eN7yEUIAYuLuhGxW4zs4AmIUtS0//VobGD8/vbwG3sbvv6QcDuFObq7wdmTqdbZOMw7Ydr3VhaKFPu7bdHi9L/oSfk6KTczXMA6X2xaosPCtyHHR9h1HCk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165318; c=relaxed/simple;
	bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aYd13C7AcUWNR4Q/V2QOafSFYzGdH4RlAP5ugIjQptIot2hRg4dULdHXrMZ35fY8HnabYAxkiiqjynfJoI9xfmFS+zj06Ml9RUBIeH3Nlul5rRNWB/KEgn7jjSKcjJnbduoawKySnqvq0WCDm97fUrk0bnHPD22ZeJWlQYVlkBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Byqlwm+n; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Byqlwm+n"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f81a3ccf9so1749172f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785165315; x=1785770115; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=Byqlwm+ndqM0Lw9iRHydmPqH/EzaPOQWCll8MqbvsZMNK8FZ0J1iRKnkIYbhjhSTWd
         Jd4wARUGZ092kDPhLXmsOvrDZ3J4Z2I9ZACcT/OE4jpJl2Q4vy/h0pDmtBtN5+yKV/v7
         jwyo1ooi19FkH2RUvE1X1pCoS2m+yDbDivgp+Wg6Y2GiUuWc8NcLxoeEKwTsB9HZlboD
         IX4r25ciAq8jw0WHSjxb4FGRl+feEiyNXupN3xsBe+oj2FNkugdSfwqOKt+7T2kucU93
         XExC8In7SGW0B63/SplKF3T6rWurBObidkNBhh/HrntKdeewjVrdYhrsDPFU73VQfTZ2
         v+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165315; x=1785770115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcPSzkAooiTjREtERSNa+N36b7IKMKBSaMciJbx1iok=;
        b=WCSzSMATSn8QvDe1bApslzOZVkMBlqlT3rnoZGJdUCFGCImofD/Yl3Xl9MhiKLHHu2
         86y3Upw3snoI00Hzqra0WQYvhoOPGyHB2BIBT6RsGmKwtDxynEv9Qs91JuxUMsHFzBuZ
         NLQx+lkeHdescT/xFoXWaz3na7ucQA7DwHcZ7bmdMP2ay9WwW0XRDou2Nrs6k890WK7A
         JV87K5F/bWHMYs3/fm2tyV4WsNz01jmeHL8SejlbaCmrOSPHGRpq2/Dn44Zgd9UzwzmK
         BzFptbEQVgpiYDtVhzuu+PUl30F85dY3+w9WNb1X95A9uP3q7fUY6Uf0qXnbl5Bd94ns
         WX3A==
X-Forwarded-Encrypted: i=1; AHgh+Rpm8oC+RajS0l2y5RONLMSTNyj9SZhFs9lxM2zeZ4aBs7PZ1i8Jgga4i2D0krcht9n/Xtc97/xqFglon9Kw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Nos9rAEXHBmfplf9TZNzGGZEwSkc6rlEE24LufrTzg30kiUt
	5bTUFbJGNyHcRVkdXSGsDeM6jjW0LSVthgCv47k06FES3FDKpRW+puHSwc62su8ch70=
X-Gm-Gg: AR+sD120iJtktrEupGrX2pSBIi+6LnAotMEFU5fqYyb833E3I8/UeBddAyZkVnFqRaV
	hsxxL5ZGrHlN8YJvKAbET2IEbxEmIPPXE5uybW9JFoHXFGadtv55BIbQB4uE5byFS6paodoNE7O
	CSrv6PjAm6HjbFXWfoR2yWnIcA0hH9vrnMaso/mej+bCGYNWffZP6wIXRYuojDRG8JawVrpeNVz
	fCVNsa1vJncav2euw0K5CGezAc50aqEoDPQIlYWKRwzzB0FAfZUERLz5PBG/CFo2jlr92qoQODX
	Y1Cev6exr9YT3Iv4DCDQQ2GlrNCuI5XZXwTaCSv1k0w68g7gjJnLSEjb6We4ut++R9qoVmEpTfW
	dHeBwa24me9b1mpPfPrl4rX4GtVjlWxMJI1EdpIBUx0F6wtIgkrhpa0Xz4kc3joBj+1XWKzEThr
	QDkuEAFwqzOpQ7OYaBcJxsDiy/JVT2fRNQ8vJhYdGk1w==
X-Received: by 2002:a5d:59a6:0:b0:47f:87f9:6d06 with SMTP id ffacd0b85a97d-47f9fec332cmr12271873f8f.61.1785165315467;
        Mon, 27 Jul 2026 08:15:15 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm46580760f8f.10.2026.07.27.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 5/6] dt-bindings: clock: qcom: Document Nord GPU
 clock controllers
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
 Imran Shaik <imran.shaik@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-5-32b45232217f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 17:15:05 +0200
Message-Id: <178516530503.342148.14086284982574726669.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YR6Gb0FwXaJXKuMRwNlLbb7mMb3G+V3mgOaBnojVytk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqZ3X+kr9MJGSM70ASLoPwps4OdWz+npSoS1qbl
 uyWZbziyp6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCamd1/gAKCRArRkmdfjHU
 RX7BD/99/Dzvrhsiw7SoR4khTznSBGBRF9jRX7tiwbrqDDgO5UbQ0Ut5SCKHPFD27vvy3zDS1V2
 N7WHA+heQBJPQZR+529/08QLXXYj5VdGIFV1wPEqV8hRp6PX+VYz7w8McLjXjJScMnYmODqldOy
 9OW+LJCPUGGZcPLxNGO6e1h8tM8LuLofRJkWPqNDrqyHoVA4ghdNHKBQ1JGkN4CHiCRY4Y4b3TW
 /ZE/ybcSRyN3STtR22NlTHQ3Ift1E43QV2aCRa0ckfl9MxqBJ/2NaK10UFDmi0LBze+ubyEIk/l
 5l0ikI8i4o3MWCIJ3KtU6B0ZjnvWQOho0s4DnWBLGMNZNYLYaLI6uT80nauSS4fgVONTSl4cxY8
 ha/flSZvbZLl1KuEe4yn+ILAEk6nVHP8rKhW1cmEhAqdjfk5ZG+xcjqFr/B6FNpzDtb/FNHl4jO
 696a0gtYG8CoiNbIcLk7S9SX7Nn9J8zhl+hi7LH71E5ZI/zNfnz93h/BEEdGnWvexrwMg2CpIiD
 h/tIPdz2/R5etwPhNYzpcH/VoltOaIBxGaEe+o+xonYBFS1uFFR0ScdNg+oOQOpceA2NBL39sC1
 dyanS6Dq8SXZtLIGcuOvCheyVJejTGrgzjcP0O7irOt3CQUcYsIx3Eqe1KQJlSajTWqZ86ONEg2
 TSx2rRJQPsJ8N2Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

On Fri, 24 Jul 2026 16:25:09 +0530, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> Add Device Tree binding documentation for the GPU clock controllers
> on the Qualcomm Nord platform.
> 
> The platform includes two GPU clock controller instances, GPUCC and
> GPU2CC. Document the compatible strings for both controllers.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>
