Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8643635E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620331; cv=none; b=feojkPpYRy0zETLb+tAhJ4YEBgQ8Tof/HxYDfPbR17kOdAQZmISRlBaD3jxGoIv1gVIB9xkuCLk+mFFuRVX/27D3nU+0Nu8ssuzSmFUYasfp5HqudbDWhuyLE2YhZ8OmabvyvkOGUY47AyJRief6/NqgEaUz00PEC5ziwWHpXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620331; c=relaxed/simple;
	bh=cwzlVuspg1hxr/nCkeY9h0mJCrxHPdqk1YSb9/fA914=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tl+WLSkm6qf+Dn0YNG3fhCpnPfipxSSwpHQR2u4OLcY5TXxEJ6KjQWexX8tUIRdDGmfCpPsoDDhi17Ovfox+5nJRfbPIwUa/nBX0sAC9PNkJl5RDUOy8Z4qVjjQWjrcAknHO6DGwe8xHhuMYTK+ktuxNMaC1LEzcZaOTYSxHVhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ppj0Malz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ppj0Malz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75211F00ACA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620325;
	bh=k9LMRIz8NVasIaNCJy3ZWpX2EXTkLqP9LWZZhbctfes=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ppj0Malz4OMrBBdwEaTpzXye0F7Bb8WQXBquMgzEwMn123j56Pfujt8JTh2ZW3ULJ
	 BD1AIyBwSJVTO7k9WHMHUkJUloBVXCnyOZTa14bz5ryos+5oZ7ti2sq7JTgybepyDZ
	 kD72YLOcsfofN6C0fZs67rF7D59OMIEr5jECa29h6MdPIsUrYY221RyJUJCW9PmJFT
	 FsLNKR4aqRIHbxpY3a1Ys3m+UKZXjJafbaBEQed9x019zt6yMtMsllwDWut7coDVzU
	 FW/2XAZ08TBvLwmB9xsIb6GWOhdH6ND/2JwUBiOVQqjmIpTFR74DMBkZgvzfZHpV7L
	 WD4gI15zNNScw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeba09900bso5714704e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:52:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RokuMmt3IkDnB+WohRdPSjZMZ1zM13FzGmWcnJ081dHM6UlfrWTpETOTTYGJucpdp6E+5Wr6SFdNRFikQbx@vger.kernel.org
X-Gm-Message-State: AOJu0YzdGx9M8gM77rYTxJeQIKipKiDDh7JKDQNZl32LhXMQYzUass5f
	a9Q7LdCrdxZ0hfDbvmrnr6MEAkb+a+CRolmUb6s/wKpmDtn3zkXWwErYvNNXl9Hn7SXBiBXNESB
	eRiDxLkbj90dbiTaed24vIxh7rDBkhfFw3Z3ptIRJEg==
X-Received: by 2002:a05:6512:239e:b0:5ad:58c8:5de8 with SMTP id
 2adb3069b0e04-5b28f854e5amr3471139e87.1.1784620324538; Tue, 21 Jul 2026
 00:52:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:52:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:52:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 00:52:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeZsA+C8XXBBCe_mu5fLSTmXJs7i5pEOm4srSaN=VvT2Q@mail.gmail.com>
X-Gm-Features: AUfX_mwDY1TG9EBnwcNngp6X3KHFeBHbyrfQYsL6qnoLc-jS2Ija8AufjSFI0lg
Message-ID: <CAMRc=MeZsA+C8XXBBCe_mu5fLSTmXJs7i5pEOm4srSaN=VvT2Q@mail.gmail.com>
Subject: Re: [PATCH] spi: dt-bindings: qcom,sa8255p-geni-spi: Add compatible
 for Nord SA8797P
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Praveen Talari <praveen.talari@oss.qualcomm.com>, 
	linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 14:02:26 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Document Nord SA8797P QUP GENI SPI controller, which is compatible with
> SA8255P controller.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml      | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> index d9347d780ca4..6552303a4f52 100644
> --- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
> @@ -11,7 +11,11 @@ maintainers:
>
>  properties:
>    compatible:
> -    const: qcom,sa8255p-geni-spi
> +    oneOf:
> +      - const: qcom,sa8255p-geni-spi
> +      - items:
> +          - const: qcom,sa8797p-geni-spi
> +          - const: qcom,sa8255p-geni-spi
>
>    reg:
>      maxItems: 1
> --
> 2.43.0
>
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
