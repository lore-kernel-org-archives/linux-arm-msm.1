Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795845466;
	b=mQ/Rr+7L9rz93kC23dBdKaIBgKbGuPkNVArdZnYOSEGltfUFpFdhxGWrRoc4ymJFIAPX
	 ukwnoc6C1B3FoGwjtL0zj2ROs2c6JzfBQQZbFrDWPc8kGnfoCAXCKS9HwJfGaEg3GpyUs
	 a9SXEb2V+1FP2wTVsjBygdxt3dvzRNfPbJwbPNlx//72LQlx7K/RcbCgkEX3MACK0D8Rq
	 wnIRSg1fQmG2dy3THI0JEHb+SnMrzz/8ORMrYgeN1SHOAxjT2tSlH8mep47OoNLyuZcg/
	 f6/4ljSNh80Wun/lBs8P3Y2x+Nl2BjKP8OU9UuxaYx+oiSuwzFwJerQ5U5VQo3MKNgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795845466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
	b=1syGO8pNHnijvh0YQR/RGTWrMHoVtqA/46KKiTh08ariFMJQxuD/bLwcf9iE8IH8O2yj
	 EAVXaGFhZ8KJ0aGj1NBKojRGVvkyVH1KL60P6FKBxPTc5OThCb7fPIHcB8hFHSQrs1Q64
	 wwS5PgrVN0zlxv71eVG5l/Ji2IeBfXOaPiCRxfUqUaxUx7tbgb/wSwZwXVFm/jjomxagS
	 LrtJctP8rW7ChdkKI65OW3rXPRsUGBT/+VvDX8XJuSL71oCcMsfda/5SBXbW7nCAa4MZq
	 RWHTd/YdKtZ7FUT3nDrn1MkuXIRvNfCAdqgzN0O4kvB14XqgRjdH1QXsLc8pdEh919Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49E606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF49E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lmrVlhXl
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6baa6f27904so8900231a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 21:57:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795845464; cv=none;
        d=google.com; s=arc-20260327;
        b=UWTSJI2wNI6JLROhnPdmp3e9faRsEDm3K+skuk6WDOq/c5D1snxmLzJNmavDO3a3yY
         Ksu6fMHlN92GWyo+xjWFlgEbn+isxgen6LYtG2qTI08vXD70FNOw7PGt0UFWrPqbtswD
         aqA63wxGP9ehk1hMVQRAeB8Sr/NRCj42INrhhqyXy7mvfJ0gEOtK0YMizGNqoPnsEBXR
         /I4yW+ZtKLSJTwgSk2YFSgQW7JtV5wGeH1bdy4QnUXp3Te1R+Ve21GePx2NsShuaYO7B
         pRNp+IleTCysH0zMSfKaeEzr1tKsxlQetF/sSw98i5GgL4ml8QNkJrLk5bPPWGGs0u3D
         RoTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        fh=6LSE0qmt+haAnAyRToqteF1jluurcJNmARA5fGigKw4=;
        b=Sx4TB1ZKh1LBiVcx2MCxuQVZDDBnrgw1xfCdTX6fjK9KvT8jAAPP8lTF/XqI/rbxco
         mugTkjAFzmaAgzcgdEhMuKELuyTU1/8eKa1PwByKbw0v/ChUUx/+BgaqWsuoX2eli7cy
         +TcMcVU0lE6kttrWa4FU23CDfN5NPbOm2Z5BiYWhGVVlTSl8dI9XvJtL+OJCSBZ0E1Oe
         awiMXRwTuiQ0IApUMU4TfGIa4SeIVM9ReyxPiYPrufWjHL2Rp4uTneiuvuDDo7lO2+IP
         SVbIGoXOMbzTW3T+X3pJiotdG4ZjIwPi6WZ6fRWxjnVf8J4qCiA86qIeNsapwBL36Q5A
         GlGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795845464; x=1796450264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=lmrVlhXlsaVMZbgADEPkAy0KVpZgtUOyXGrTxm1M/dNcpxO1ziLWVZEWjImIs7nMKz
         QS8M6rZjvi6UQ4t7uY0V7e86nAywZ+m4bZ9q6mxf4iJRVezZ9yBOGs1zJYsIwyWAiPq9
         KYilKGfeAoBXzFfxukar9PQfOhfOcx6QM9Pmd9Wi4JuQScrJtbKjRQ9X1otNCOJ1sV3T
         Cj5ct6gA/N0tIfcq4HwE8JZxAgVCoCi90dKp+Tu75zIML3qLio09zLpyp5JA1hVN0Lpg
         OsVrSQpCWzBTKlRmZf8CVVBuZm06DRtdcCP3uTaCtU0EAgH/i8IBepG06JXELgKdScq6
         VN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795845464; x=1796450264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpYKemDJEpUf9ISq0dzDk0OlvVaWeNnymI3fjjwmLkg=;
        b=TkhbaQAPUE+GSUwbNd4KV5CoX36/KfNj8k1AE0mPLYFhhpkhvA4GRV4aU06ihF9OYW
         gVXWHwF/dsCBq+NH4c5FbgvhWZXT7AbAG78nXD3IZUUAHGnC+2gQellSs13HRglyCjBa
         eMN0YFALjUHU4Ts06OzxDvfR65VODgNP8pMVb/N7UyE/045UZ6O7fuUbq96eXPY4p9md
         hwfPcXmN1fQzjIF1K7eDHTIc95hSwPOQNx6iM59PXls6bl374PyDydlXnS9MYL6zJ7tq
         HIb+DW1+daA92z6fl865nt5xOrEbfKEmX7eleNsTmE2D7mPpTMmJIxYtO/uGSY1ItCbe
         IbcQ==
X-Forwarded-Encrypted: i=1; AL+hErGDmZ0e+ZpQ48IqbC89AVwJ/5wg7iIvWMZncje1zgPspu8fCv8xituLhiBUAXBlCKJ8hiDDKjsg8S5W+L0W@vger.kernel.org
X-Gm-Message-State: APuU4Z8CXdPs8gm15h07M5Z9BR4unEH0G1cD4fbHVbJEIG56qGnyto6d
	SE2j9WYAD5/9FEyGT8imWBpCjBOBRMt8slEe9ZvdsjPJCdru5hzjveyEPIE4/H9aIrIkx9t60Lr
	xU+0tt/hhVCm6oDp1+rokzkmVr5QqJ+w=
X-Gm-Gg: AZFdTZebPYvdSPVQUboYdHODwsd/VRLIVMOSmRx105gBthYo13evg852tjQ+hTox4UX
	q4u/l3JfUp8RNWpiQT59DjZkqNPoSMUIpPT3RqKEMY4/GJ2jKJ9hfkBidPsp0M4K3+jeGylgOoU
	fHHW1RarzBGpw86dh21OKE7wstueNeU5/LzbIwRqYr0NEQ7LgapbBzIgSDsO3o+W19/2OW7D9kX
	Yy3pr0UJdzJzRrc7SLFh2fHEWl8xz6R3V4gmD0Ovk1lYOxfcLXVAH/7InFwGIfiKJHRLEORHzXc
	OK4eUryzW7/oBkn7pXGPRRP9AUzV97g80AlWGqK/42gIkbVepQwqneCzhQoh14uKCKprvgQGxBi
	owff03k2DNuqffthso4UOh9KuAa9PaPZkbrcIiOGYxRvIPofJsNyD65JXE1d1kVrrgg==
X-Received: by 2002:aa7:d684:0:b0:6ba:1e56:b7a9 with SMTP id
 4fb4d7f45d1cf-6ba37d60695mr15032079a12.12.1795845463903; Fri, 27 Nov 2026
 21:57:43 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
In-Reply-To: <20261125091309.124354-1-xiaqinghuan@mail.ustc.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Nov 2026 13:56:59 +0800
X-Gm-Features: Aa3M54o6oIEszh6kY4GXIp-jdXDpJqhKmrWjTLxx512KQpOfRsaHP5EMKK4ufas
Message-ID: <CAH2e8h5UCUz0hv203SsZROm_fTRptUzT96Y=ZBNozvD7ntweEg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] arm64: dts: qcom: sm8750-lenovo-elden: add the
 Lenovo Legion Y700 Gen4
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 5:13=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> This adds a device tree for the Lenovo Legion Y700 Gen4 (TB322FC), an
> SM8750 tablet, together with the board compatible it needs.  The device
> tree itself is unchanged from v7; what is new is that 1/2 now documents
> "lenovo,elden" in the Qualcomm board binding, which v7 forgot.
>
> Why that is a real gap and not cosmetics: with the device tree alone,
> dtbs_check rejects the root node,
>
>     sm8750-lenovo-elden.dtb: / (lenovo,elden): compatible: 'oneOf'
>     conditional failed ... 'lenovo,elden' is not one of [...]
>     sm8750-lenovo-elden.dtb: /: failed to match any schema with compatibl=
e:
>     ['lenovo,elden', 'qcom,sm8750']
>
> so a board that builds still fails schema validation.  Adding the one lin=
e
> to the binding removes that diagnostic, and the same three SM8750 device
> trees then compile and validate clean (see "Checks" below).
>
> Relation to Pengyu Luo's series
>
> The same file was posted before, by Pengyu Luo, as "[PATCH v2 0/2]
> Introduce Lenovo Legion Y700 Gen4" (2026-07-26, 1170 lines, based on
> sm8750-qrd).  That series did not go in: it is at changes-requested, Abel
> Vesa and Konrad Dybcio both reviewed it, and there is no v3.
>
> This posting supersedes it, with the author of that series in the loop:
> we agreed on 2026-10-25 to squash the board descriptions and send the who=
le
> thing this way.  The binding entry in 1/2 is the same line Pengyu added i=
n
> his v2, so credit belongs to him for it - if a trailer is preferred,
> say which (Co-developed-by needs his Signed-off-by as well) and I will
> add it in v9.
>

Feel free to incorporate my previous changes into your series. I am
happy for you to take the work forward, but I would prefer not to be
involved in its further development or maintenance. (I graduated and I
am a 995 full-time employee, I prefer to have a rest in my free time.)

There is no need to add a Co-developed-by tag on my account. A
reference to my original submission would be sufficient.

Best wishes,
Pengyu
