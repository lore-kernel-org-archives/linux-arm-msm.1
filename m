Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E25E43711D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620293; cv=none; b=C26JvtnGngeEJSncUnGST77RzJ8yHxACWtlwgDG/XzJDw3MeYsjjxmKdrd4fpEPyalO9owfXk+nkXgzsh3vNSq0ma51hO04hefrkaf39rJYKJC3kWdhEtYIe8Zk+DEDUoeQZIn4ZaxT1MeNTepoGPeuH8Yu+ZfDMAiiWG1E7msg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620293; c=relaxed/simple;
	bh=edo6W7d14mH7Fu5Lxagl9T9a4yHLKmozkFxFeoIFPoU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnYKs7PgSV1Wk+UO7k2LlD/La8J8AALn7yLVIHgeQ5OJnx7BtzlgRKwc/1Y+KZ66wlgfVmDjAUr4NsbgQHC9JjqZNwgRRKq9wU0k0IpB/tb9iAuUiPhGL7dycsVtkdRmZxxwofzWlwdg6RyD9aUphecG566vHcgiFsXyqoxY1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDkH2r6h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDkH2r6h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E290C1F000E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620291;
	bh=Qlv2HAnbXB72odlhZukuhXahac8O7i04apMrlr4+GB0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XDkH2r6hXL/G1LHpcV43ry5J/lyLykZq/pOUsDqL2xPo4MS+1xWc0xmi2geVIgdxM
	 ZZjYd1rsd87BJQmUeVv+bD4odnCXUEXKrLCMx63NLF0Ug0PItFGXtuGLaCpRTxOMdD
	 /q4mxXNZVK9RF+SQPkQ7Ujz52uCoANj4qIf1G0OdPMeFV0uXV15QmazJxKUwtq0frd
	 jf/nuIPEGrEpNM5+FbMQ9mkp30QKXHKB5W73NIMHmO9Ou7+YTW+svVeUJRItBzyPm2
	 xAvtNa2OVMq+8GosebTsPAs9fjvaD5iJuaDf3DU/oko9U73vVbp0SZtt0QKd85rzbD
	 3gPrweLISbThg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so790340e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpi23GMfzMWLZheA3AquGrMoSTe33lW5PZeHPf9iMNeJ5p0O0EFQlrWyOVsgp2oYUPDGXfgPNzQozFQPnrO@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGeWKmExDYAiU39YTQtzAv0vxgEbZXCjz6cbvPprZEgWZn/o4
	qREwIn7eN2MdujjCScVa6aFSlRrKZOA3gFZipwvK2VOKPgW90wPyMegAYi/+2JRyB//Pm4G2wBu
	7uFzHEBsBGcb4dxcKwTjdZixq9Qbt6AZLiNSeYNxyJQ==
X-Received: by 2002:a05:6512:2250:b0:5b0:1708:afa6 with SMTP id
 2adb3069b0e04-5b28f9a7933mr3348919e87.43.1784620290688; Tue, 21 Jul 2026
 00:51:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:51:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com> <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 00:51:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=Md4xkLe8JFuzv280t4uigJc3np61LksQAPOPs_O74C=TQ@mail.gmail.com>
X-Gm-Features: AUfX_mzEyApNxJ2B8d_6H19H1FGjfri7UoCh4sr9YzLC_1FHUUz-Q8jppfUnqVQ
Message-ID: <CAMRc=Md4xkLe8JFuzv280t4uigJc3np61LksQAPOPs_O74C=TQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 06:40:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
>
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
