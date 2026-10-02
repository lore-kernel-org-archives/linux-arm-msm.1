Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDFF3FE34D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 08:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930838; cv=none; b=FJOF/jQq3zLfFuGITjZhZ3SvIoe9yz65J4BPtOE0CrUFbeBXYZTjkhh/f+s5todJ+qmN0z3rys5Vg/Wo+XYuzVlmIElEAy0cEVGr3XWPV+GKzKYHZNtNQUszHC1dtg+0OndZdPQ8k9HRXw4yrqxJdMYU7xFdRgAbN8NMbioe+EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930838; c=relaxed/simple;
	bh=52GfUpvw9geyTFomKSZOrfOFdkx/TMpIeaEl96ywf3E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSDGKVWp0pSCreuM1cZH1VCEcQjL12S0hvuERTpQ7TMSkbIbrtN6IM+H6SgoR/u4Gd+MkwbRqkxJPoJzXTr/OUISD8U0vPJQmOZR/m2oTKAQJbCouS72rFqN7U2e/Qq2XW4NRza9L75nn/ln4ofuMVGifwTwrU/5d+Y6V3NBNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBqS/x5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBqS/x5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D5B1F008A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790930821;
	bh=xN1LMsVBme82xNY8iTaBouPAjacIAn8MmiSFm7uDo7k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oBqS/x5I2Z5zDO8N/s/vma4IEcYHMQbf55Zt+/w3klPbdCm+68a7g6/Ti56f++u4J
	 H+VmgWLf8U4ikeHcfKPxMxoa/d9235sTHDmix4i4rbBCeISHpE6KpBfekY6+UwSDMx
	 mKJyxWQ/J3HPKQ2xb5xCFCu3MWxAoutAaHVUby5sz0Wk8DVzb6sRCz5lH4o1+YOvXG
	 OcdlYpXBvLixnGJe+fE94q1SZCJv5L89aob5rNzDwbMm9XZglZzUdAKvV2FvOugKSB
	 mXKJF46q6azaRqYe40evPXRJgvP4WAzXFw/G5L9vPgbuj9px8VHkPdsI93K/JkaPnT
	 v7IFDNwYgesHA==
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a96c77840eso1866661fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 01:47:01 -0700 (PDT)
X-Gm-Message-State: AFq9FYIuGpGMHXVIAgSwokMaPx0f3dgjOE76B63w8t+06wAxiWhL+VdG
	mnkyarqA3xGbnSYG6zhuudNVafC+ARHOFZ1EfjBCpuRCk5v9Og8L4oZg0bqhZSW8Sj8P3Lbyz4z
	E9UbVfwAGslnlFlXHRleEAWCQ7IJUKsoTP9BAx1nOZw==
X-Received: by 2002:a2e:be9d:0:b0:3a6:6bef:943f with SMTP id
 38308e7fff4ca-3a887800e68mr4674821fa.18.1790930820042; Fri, 02 Oct 2026
 01:47:00 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:46:57 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 11:46:57 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:46:57 +0300
X-Gmail-Original-Message-ID: <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
X-Gm-Features: AclHuK9m0Na3k7ACxnGI4xSNeT3xuFUjWyBVgSYP6SCQBDAg7rQT8-H09G1SvQI
Message-ID: <CAMRc=MdVQ4xUFPtcytXt5Tqor5-fUjHiRvnpmxBsJpJbd1rHLw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document the Nord GPI DMA engine
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sep 2026 17:21:29 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> Add the compatible string for the GPI DMA engine found on the Nord
> family of SoCs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d51373a4d54591f3ebbf5e31fca17..ad70717b5b86e600e74d6cfe42015dc03db25ba9 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -29,6 +29,7 @@ properties:
>                - qcom,hawi-gpi-dma
>                - qcom,kaanapali-gpi-dma
>                - qcom,milos-gpi-dma
> +              - qcom,nord-gpi-dma
>                - qcom,qcm2290-gpi-dma
>                - qcom,qcs8300-gpi-dma
>                - qcom,qdu1000-gpi-dma
>
> ---
> base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
> change-id: 20260916-nord-gpi-dt-bindings-f4b10102d22b
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
>

Vinod: gentle ping, can this make v7.4, please? Otherwise, can you Ack it
and let Bjorn pick it up?

Bart
