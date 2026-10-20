Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792512944;
	b=J3WFw1Xa+V01dm93sUVRxgrw+kc6cKw214T/g/jyEliJyjcj2kTqbPkYCED17kDL8kFp
	 2QAAR+85H7835WkRvt1JUvA5tL2B3vZMLEQBt++4axEZvzlhVagx+Ah/aMBt0+DNNjIE2
	 UKrqpsJfylHve4hnB6BFrqKl7AVDXzlaNxk+TjMwlmDYTWbtvVUqGBa5ZWjBCj5mw3j+b
	 Y/01bJiFwYSgDN9UTS/bUOlAMjUlZanMUi96Jh06uzRSZtOKTJWxvVFNCg+OO37++RIff
	 t30MNCSwTIV3c586h9JX9phlE/9wBja03/6gUa0xqmrnnsvIppiE5MlaBQdPSuI0Fow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
	b=GBTn7KbY+B34AjzgDhPld5AMqPVXGDeEHreL7hZKulq+sAaey0yP061+8NsEWq7Skrma
	 gyBkFWLku9sUeUgjJJ+X4ZloBpxDDd6clXPfYoCHBHkNM9Ku7yTAjRd5EUZoPy8XTsQkf
	 5fKHIFoOuGd/ot4dLcM4EcWcw91L3O56SyKgMyprzsmAl6Vy7j5thvnOrp450ngAdJpmG
	 V5sPHLMOjwweikIAkXVhV76KKVHz4E/Kqkkv9odHyn5BBNKqQ94X1DbeRQQ8hjH/PKKjv
	 /nbTE9fEWzuSuYbewTTk0Qa815shGcAIbEG5SoflxnAxqAi3a6QDX+lI9VB2P+dTDSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92150606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 16:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92150606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aPwbeMPz
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3db57938so2933737e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792512943; cv=none;
        d=google.com; s=arc-20260327;
        b=N08WPDH7N210BU1y9vW4jPlDao/QbdEvgvQ1odSo+Ot128INL9W7x6co211D7M0OlU
         xVJ/0Cn8ah7DLizhQpM5Z3Un7w29a296wN3MGyHTH/DHrBoiwwLxoJ8Ut9jJYtWHxAso
         /c6li1i5iOs8ix4TKGJbFlXuv9A9/O4biLsHfDYavQ9V9PLLwQpyFar0szSAjSN0I/wm
         bSZGcqnHdAlgHbnViN1RDMPVNbLyPYoZ+jyb2wWmVILeZyzk/d4/4zUqhtgWVKvMiHVn
         Ce0XGes53rGsqNYI2KK/qzTYWHIVMZPyKKwWF3FraY/sw/l6w3RcbMu7EEI5mjMZR6Uf
         Klqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        fh=hUAiZ8nzcF5Vqyvz11+pNlINmg3ltvHj1zCCf3CH4ik=;
        b=Jzb8Db6TwBVQZnYyxlju+k2CUdEINKaNogCAMp2prNKlf+yI3TvQL76KGA/xrhq5RQ
         qi62u5YXraIN2wC/ITS5FxJ2PLNcEpKjeRma9/uBqPrbV2VjFZXhZs40pPM6xObuCfxG
         zxPj0ElzGNeTzzE2/5BHDODwLhaWBwgV380+mwJBh+R8E+Z9VG3PlOlAwiZoCSxLI+yk
         XsHpRR3C/2tJn26NVFuUQsYrvq9DnWsYt3UYVcZNbsmM8HOV95aoPfgRzKZ7sve85r3N
         mT6WGUjsh/SzmahgaM2h22KETe5PoGEUlQxb9T+vnQ0u21DQbiloGfnn4pCoPgKgXMCZ
         objw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512943; x=1793117743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=aPwbeMPzAdLLeNAORWON295qh9yETXyJc5a/Id43rICPN6Spi03PNjK9LcYxQJBDdB
         IrZrzj8BxqqZrDjlCJpTkSD5UTyM/53aZvsftbz7fUYKor2pNOyBIFKdFhCXP8wMnUbV
         QvsxtYuhE/JIVqy9XioMAOfY6L9gjyOxqXj8ALZXcU5bg+T3YUubiCqjlTiLVZpGxaY0
         ZzlHMlQVRJ9EbI7JOgh720G1k1xuodMFKrj5hMYsfbU4zt7L6wc8wLrIeCgFGNMzPsHg
         EqG+OmqbSuDt2Vj/ZNLsMsS0F3yTzXI/LoT/r11AcyBrGUuF5h0S6OP0W0aUeYkDUEIn
         QYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512943; x=1793117743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQHzKVqYaZwJZUC5Pb2xzxfXVpRRuYjJWgJcr6l3L5Y=;
        b=rd8QSbEYi4nuCP+d9HrCAR0Y6PnCPjsPHkz37aNeOsaeO8oCP93NEJvmJeg0zJtuqp
         5O9ynawCGoeFCy+/Ya1f9NarsG6WMcKyvROwa7gq6lkScFaqBMpKVzfUvriRyoBYq/jH
         pV8VBy6f6/9duGWiQwy0HBf9rL6U26CeAgTw2B9hTRPT3aZ9ZjgOCCbDd/DamO1G7SAH
         Qv1ox2ibZBq1tnUwAn0kTpkQluHmHylRCFOyG5SUlpOUm9ghrgn7VUNW8DI7zowY5ka9
         WUHXIRWB3X7C4pAdJpO7CKpCP/J3IdCGJVoYrnsZNY9AMurvxPfRTSVx+PYPO3959BqE
         gLgg==
X-Forwarded-Encrypted: i=1; AKwUvBy8cQhXFHfG88CblG1qUsYJVn8TnYYFM0Tuje9E0Ss2SAS9cVJeB/rdz2duGX1NOo+pugGx+Jq35y2VBArL@vger.kernel.org
X-Gm-Message-State: AFq9FYIDyiK2BES+8ZK002jAhpMCVOvW/qGEizoCrhJm1B/1gx2eL6y2
	tTU+g+AgerlcISLSRd+Zcv1rWQntaiNaY/qk3AVJplsGXenMB0z8VF/HYUGA2MyVw9mGYxjQIAt
	12CZwgN6x57YHOxxW2MCW1XukY9A2e8Q=
X-Gm-Gg: AYBFou0nloXw1x9mI94XrnNxNEsgdhJQ0l+H8WKof+L2xJO9zB0xIbkpUZVG9em24Ow
	jbb6kqjmqe+mArlFKZMUEKrICBaeXKa0xEETMtsmOx6IUIhZ8cx2rOu5AP5IeJbCc0xfokjVmwD
	f5zfKlsHw3VmnlAW4h/TLw1UeQAik/bumqQnEbChvcTrXFBplTXE5d+e0L39uaRERTh+z54jns+
	AxD8heelb67TS7YGhrDdN99TpXO5vfxTPurmNPnrP9/NQYgp+0V9uqls/zbLKRLlTKtIvbepKdg
	LwVUA8xaWZoZMRPr9VHggoK18VikrtKsge8UD4TvAT93BHmBZXHkNNhscAGZ7Z3TNNQLXJpgAA/
	Z1eonSyGMNwo=
X-Received: by 2002:a05:6512:1289:b0:5bc:b375:9dbe with SMTP id
 2adb3069b0e04-5be50a6b0d2mr3742796e87.45.1792512942267; Tue, 20 Oct 2026
 09:15:42 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com> <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
In-Reply-To: <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Tue, 20 Oct 2026 13:15:02 -0300
X-Gm-Features: AclHuK_1LQ0hgYaSfB-TfSrT7gWRZXqvLPPkmi6DcPVVcEYrpgEnBAEw1acmmg8
Message-ID: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle states
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Martin Botka <martin.botka@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/15/26 3:51 PM, Konrad Dybcio wrote:
> I threw an LLM at the downstream tree and it decoded the states to:
>
> C2D, no cluster state    2        0x00000002
> C3, no cluster state    3        0x40000003
> pwr/perf L2 D2D + C2D    L2 2        0x01000022
> pwr/perf L2 D2D + C3    L2 2        0x41000023
> pwr/perf L2 D2E + C3    L2 3        0x41000033
> pwr/perf L2 D4 + C3    L2 4        0x41000043
> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>
> sorry for getting it wrong years ago!

Thanks! I had decoded the same values, but I didn't just put them in
place of the old ones. This firmware supports OS-initiated mode and
refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
may only be requested by the last running CPU of the cluster, which a
flat cpu-idle-states list cannot express. I tried it: with 0x41000043
in the flat list the firmware returns DENIED to nearly every request,
accepting only the few that come from a cluster's last running CPU,
and the idle CPUs spin on it again, at about twice the battery current.
Linux runs OSI only with the CPUs described as PSCI power domains,
with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
system power collapse above them. I'm working on that, but I'm not
sure yet when it will be ready, so this is not a placeholder for a
replacement coming right behind it.

Dropping the states is not the complete fix, but it helps now, because
as they are they do harm: cpuidle records no successful entry into any
of them, and since the deepest of them is what an idle CPU picks, each
failed request is retried instead of sleeping. On the Moto X4
that is about 133,000 failed entries per second with the screen off,
and the battery current goes from 277 mA to about 115 mA without them.

Is dropping them first OK with you?
