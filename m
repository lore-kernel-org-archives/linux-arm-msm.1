Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530246;
	b=L59lp+nxdC84D0nJXCk0/girhq6+/RVq32C9xJIS+fU44YYjvdu8biVoeobM6J8MRvau
	 c1UVejf0gKYoeKw4rNoVD+Cd7wEtks7SxHzOVXZQZriOPbWsZp9ZKD8VnJBUEJLfq9rb4
	 NMvDbUE0y7JIL7XcYWc4axf9m28LdQVSzcFshjVW8h6mobn7KOAWOf14W/TT1QeDODIUg
	 YtdQ1ahKzBSD+wxT4j4EQ1dh3jUjnM2MG3vvoEV0nqqSvK0j0qYJ2EzyJ1THb+g/GntSi
	 B3a12dvh+/30leYDwUE0yD+izDrZ8RsCndUlGR4vFoXGuCffZcikqwjp7IENv1XjTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
	b=EhKpeRdlUSnqYcuV8JcL30cGZ4FO3OndXjke1nhTe5aPvfH1wHCmyWcsve7O6bWPDVUO
	 HaT6IQYCBnjfqI0HH0KA9TxDE58gx2yWBNifMIgPQgS/+kmIUhnFKoAkrvUNfG1CkT8wH
	 D3PTiRD/5Kx46+I8wYK4bkhzy4va+V9TxBeTWLbvKgMmGL660ifS24/wxww7ZeOR//1ur
	 IbekawAhpKOHSL49ddQDI7AJGOGOKWe/bE5wASNqSsh8xklWhD0g10n7z03PB+XAmL77J
	 VYlrvKQ4/BtZGgQPyc5EDh6gEBXDFsjvKgu4Nh7JHkvMYlhmjb76ttZm59jaQmttZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BA606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mJXpwd15
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so1067420366b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530245; x=1796135045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=mJXpwd15LM06NObvBG25I4p6y8dwPNFq5cNkKyqHfA8ddIlk1uVMaZcsVBLcfRtCqZ
         Yx+WmXrCx+fx/N4DpX1uWPcHsrX9WVlNyigMDuhn7uAMsJ/CSmqaBilO7c4ANdKhz3SL
         pwx87MGelSHlPrBUv/UTDsdqWt8KEwVP3NHe6HNkqV5HUMIp4aDFM0Rh7e/ZaFvr5bX7
         sjls1tUx/QmTcMxXjq2DCD1gMVDgel03IVZBUII2r0ZXBUkCv0DYhfsoLjmJMTaeiKZg
         DPKlzQg7XgG7Kf6rd9E5DHo8oIJVx6HkM86xdZjzwydyO36mbWJRyIbyvvOum+Oakzqc
         RgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530245; x=1796135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qouj6PmBBATp6eG5/0yJB37SakrvOb+iDg04r5I9jhU=;
        b=LmXdcZQJtR23CSsASimkGcVWH0nmZLJEkTQnQd4Oe7lXG33vQsuyn0m4T4mdWV44J1
         j8RULIao7nKT9QTVq+N+sAQ2FcOBDFI1eKZEeAme7bZrec2gNQ+TCyUnpuilOoO8jOGq
         eilb4LoBOPtFYV/w2PVyVTzGiVuKHOgrXScoHMB3jXvOmYem/LZXEDpGAlBEBgaORKTF
         OxqptuW7joZBlwvvHb4DS13S3s1mKFHVGcVJFCQAH9v8Qhe6Ui3pEHRGIim/fzKrEIAT
         rat4q+Tdozcu7phP8Tev5ivDTxHVyEGWzHOuA1YgkHwpuzxa1TEckVr0+1DhL7O2miiI
         laaA==
X-Forwarded-Encrypted: i=1; AL+hErG7Go8ax/jtn0MJx7BG5YD9XEQLGwYebZ4Etb9wXSTI4UZW+51Z+VVfkv04+akAbGafm/nkzkZotZf7Xu/4@vger.kernel.org
X-Gm-Message-State: APuU4Z/PvHmsqkXD8XbLhPMBCWv5bmsu7JFX56WBHC3KD2P9DX/VVr+b
	SuetVdvrphHIgOB2DaV0MpYXkSC3GYgAj15/fCoFYwIeJPd8FZmt9WnnVpDlreKUAns=
X-Gm-Gg: AZFdTZd2Qi0Yyo3K/ao8BqGidcKmnvlGx9fpiSM/sbwMJwsgvBsziATrg4JFZMX7L0I
	nwk5e+MMSx/M7M0dBVhOXoxuozrDJJd3Zv2wHfDgb7twmYolqGRg0hJ6sK1SgZdhxECce/u7KZe
	DjBNvH4L0do3FEc+xDbAmVr6sD86CRcnEuinnVfpzdz2Y7+iEkMIHma11NkV/GcfTD2ut86lQVI
	xW6rRJX+oDwJLzJIUPVFYzqyIb/dkdY7BpjrGhOS5yCJnAszFG0i5K8bvodeztCOQZvk3y2Sw0B
	p1ZzLEKDDJ25vrUIlGOKd+93U7TfxNVnGYGoZ+KwvDzilRRaabPpGDM0VDqr4l+ZtuNRuk0neHa
	vwp0gbdl6cB9Kjl4RbuKGqtic5J2XOHhtxPN6EOQV6uYEtX08r54kZ2q185lrXBTQfuI4O2yn+2
	L3PUxcD0qFaB08Uhi/DCCXzKCIOoyHB6BA2ib1BGu5uAGU8QoWVjt3Id94YUr1U2W86YyDcZKSi
	K2xgtFWp31VZ+TosxcaMFbYa0Upq+1dsMLf4ZNqVU4irguVHoKgKWgiGYo/eNIKnubwPG0FO+HG
	4htsKSZv42/U6IHZ3ojOG+IQ58k=
X-Received: by 2002:a17:906:c53:b0:c4c:c62a:b9b3 with SMTP id a640c23a62f3a-c513aaacfccmr893924566b.22.1795530244720;
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe25asm525653466b.11.2026.11.24.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Tue, 24 Nov 2026 14:23:51 +0000
Message-ID: <20261124142351.2137556-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws> <20261123195935.1046144-1-lightofmysoul@gmail.com> <wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 11:35:32AM +0100, Bartosz Golaszewski wrote:
> Here, use this:
>
> static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
[...]

Thanks for the map! I have added it in v3:
https://lore.kernel.org/r/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Stanislav
