Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1034DCF3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 06:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244171; cv=pass; b=L9pm9AZkfv2NDYg9AiB8omyEIrsXpqWeHvmkDYi8lAH7nZHIQwK/yIk43xSlcr1mge1/p7L/18ZN0tcF5ROfWIOyazFP6qw+WtF3Jo1ClXb98u/VQaYiiI3Ned9SD6/WZKBURvM1P8JMY9/f7OcTtcVCADhky5yJmYO2pRqjiD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244171; c=relaxed/simple;
	bh=K4gZl2mOhHoZykPR7kAcqsDmqgMqQEWtRL2LJIdoA/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ0ES1Vnx46C1fD8EhpTYW//4NLXkTxI+o/Dd0zGgqhdHW8wDGSYW3z+xeqBp2nHLBWqpYEckD7kQ9GgCTzCTwaNUnxKFJCxiKII+1Umbe2r175u/c2FwO94O6ntEIrgJYo2zOGEuYG2i5GymXfVp5ME/dZauXm7rswCyXCvcGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fo2YkDhp; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fo2YkDhp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15e592da74so524769166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 23:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788244168; cv=none;
        d=google.com; s=arc-20260327;
        b=SjPc+CtbuITiSMo/ZPb3P+RmcbtTW/7ecb76Zcs7PYaNYLZzIJo05MYcLvEalOHmQ1
         qqXjdJYJaK5QKErtCk3v8mYNBJQa0yeS57zv2qTSLyS8hZDTPVwSTJuCr8GqpbrscJqq
         +WkaRKkj9Kh7DIP3eYliMp5NFde9F3zzHvkr4cwD8V4dfUR0yIadf4l4A6giOUrZLtFN
         mwzeNoByflw2Vy2VL0W1HpC7I/ACZq+PNDLe5kN1m6+RNHTf17M5zU+KNetzjFi1UF72
         Emz7s5L8NslZAtdqvcFCiCXhA0SrohxxkuoRHP/aNr0rd5S/+lJLOO1mvmsjUEMy2RA5
         IYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        fh=WFZ5zw8Vn57tRNnXZaK3O3K4fDe+9RKJvUtz0DpFWMs=;
        b=lL7Zv2uvnQgh+b7NF4xHpWdOw5R0JCaJ/oMQiqA93PUGWDY12lY7TFURrfYHIYZ610
         u1BUkJiRRgEgpgMkoCipoq81rG4ZXu4C5CNKf2sC08V6nfFTSsVt7kTya40Jj7sEcdDx
         2T/gJleevQkLsWKOeXgoQwMNfsqu2yfgJAqiLQyoPcvX7lZdu1LMGkF700HFjIlD9/R9
         SDUwJMmUlpBoEBJSZyslqqtWpPjE43p3jaHGWE5P+uy6z7sfodKawJrnNcBSOpKsuw4m
         kK+0UYlKajEOMKcz6SCjXLtPjAcWzMs699vw/dbmWUHzKU6Zfqbau06R3TOdpl1gAl+2
         ZzFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244168; x=1788848968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=fo2YkDhpZfxnKAqDT/bIy7kMg93snOkQDUV43O92bP0KQucf0Osu7oMJS8xxDHP0po
         l8n8P2OyJog9TnxTt81NEDyUHmfJNfcliJBUagjOMFxSzHS3ThrxqxkwvtQ0TnNrAgnK
         jggJtVqkFrof6Xxl7LcbB+3MTbyUUS+MvE/9L7xCgHNzENOW8FXaiQ8ZNwoIW1Xif7IR
         3kPnIImwhJ/gHGDpA4Zqess+K0herU91/6dvhXk/OY23YasMNDhMTcxgjMZUoX8J5nY2
         C+j05AhCZlMRPXoSS8kJTXsPrZKcKRw3WVRFRCvJIigMc6G1p0LMLFegwLrQPkaHlXrY
         ewgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244168; x=1788848968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bEEZ7fL9N/fBrtWdluD5mbU6vgaXF6Tfc86ggJbNVK8=;
        b=nLYWuMqOBaSJYPm2U39GmVCerVIt7jm2ikV9kq+J2KrVSLTQwsDBHwH364dQRxl36e
         2tTFXnSokbZLjLB6RjDwQI4I/UrkIDKLXdV4bxhQWs1mrzGwIGQcLkDZiy6TpDtDxf8y
         ywEtVDoOLKPW50o85N0tGYeQtvlg+yt8z06n40GJ/R0lLjSnoQK4CL5Vd/o/0hqLkoS/
         AwszouHONPMxS9XHQWd+LXBc38RytV14qOo1xMUozp8ObKEcEb1SzmIKHyX7yImI7OlT
         /pBDDqACyLurcI4316+pWVJfreD1wYJ8PcXDIDVX62lKzWq6MtRKMvkxrH9zLLGPoGmE
         7u+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr24nrkgIf9tVl/g6u3vLTLDdSAIfjqE4aCHeC0ESvt9ZvwYgjNt3wKw7W8D7tnB+W9Bl3w/gBjkYb8yClx@vger.kernel.org
X-Gm-Message-State: AFuF++lZywhWn/qMI8dy81Wa4mNpqNNbah+2lLIxDFI2LQ92XRsgGfkr
	jf24p53KyHtW8b/I6Wyhh4OIrJMk1NIHFF9a9mLmAYqbE/MNAOSAXxHFwHCQkoOyEkff0Nuvj/0
	h6jhxXIYEE9YssF/o4wtGqxRioNiVmJs=
X-Gm-Gg: AR+sD12IUW7BcTaGhCLxe7gWrrFNanTtn7a973LFPMAM9aTNySr8G7qEV3yJb24d7Yx
	841Y/+7vh7TLr2Qk9fNGzVeJcoSaIXUKedJnCuFbMi7QsHKqOkhj0WKI93YZM4dpVArtyPvp6CH
	nOS/Wzusu5XajjZOSG1EjrfWFPomVmsCEOTiDZojuSHkO9LBv+we9hgXztOhJzxn6W63jfCfcyT
	GB/UgEJNWRVjzWe8iO+pbucsHasyIYZuk+3R0Xe31A6t/g3AYK1/R/zGClgylZPk42WzJcYsITs
	cGjboDmm9bw3lvmDmcsybAv1d3c3eaJq3eqMIBJ9TOG9kiBmZOMvwZvKgRQUTv3fGcWtHb5TF7e
	/vA==
X-Received: by 2002:a17:907:7b84:b0:c21:72b:dec0 with SMTP id
 a640c23a62f3a-c2556c61d62mr1936956666b.5.1788244168036; Mon, 31 Aug 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150156.1310-1-sreeshankar0910@gmail.com> <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
In-Reply-To: <178822856275.1835959.3848131517961346933.b4-ty@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 11:59:21 +0530
X-Gm-Features: AcwNN1UlOPMwx9DB7E6Z2-eTZ4gj_ZRRlYulJwE9lf5s7b-4tAwIra4YOS7pijs
Message-ID: <CAA-+ukLy9CoENCEnQ0hHGzzHTw3d-aZZfT3H2o7x8_cmo9dkJA@mail.gmail.com>
Subject: Re: (subset) [PATCH v6 00/13] Add initial support for Qualcomm SM7250 SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org, 
	viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org, 
	ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	abel.vesa@oss.qualcomm.com, lpieralisi@kernel.org, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 07:39, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Mon, 24 Aug 2026 15:01:43 +0000, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > [...]
>
> Applied, thanks!
>
> [09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
>         commit: 1c8fe8863780705aba77893fade65f728e82b67a
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Thanks,
Sreeshankar K
