Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1293B4EAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585760; cv=none; b=qoqQ1SVyScGyh68ljQyKPA/hGSM/MGyqkIszz4QZfwhxEET7V7OS0uDIIRE4gTtFBpkVSAZOwT1EfP339ptVSP+xXmnPw1tM9uBTnEgaEul7YqqS2P+IhteB/Z4mImgstYqv4bskxOd0v9kR9Kr4pX3uHVOsiWG9jqpTJ3nVMHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585760; c=relaxed/simple;
	bh=i0igLMQ33zhxoOIX3XetWF7gN8smYnjfTXIhRoexI1A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RM21Ns2WW7h/xHQj30muFZddJRxj1kKOkEzjYzQ1TJhW5FZAwLE03HrMVRHXXkNwf4bIpsoKUrcfNpEXlrmyyQ/bEuU3onuwAo5wRyIuEbfl/lF1W2jjtt0O8UOAexaSgGR2GidrFBWZJ463S3obLDrqGCy0NCeYI2mEfXLk3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cx50iv8X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cx50iv8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1471F00A3D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585759;
	bh=YAtIHqm2ZMjAhBbacLCHQR++DR43xD3ram9aYjsmlhY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cx50iv8X0cQmJSVUnfFpWfSZ5KfOX7K+K63BaXt8a6PedSRTewifFWyiyS8wo6IsV
	 4zCChQ+17C8Auvsr2sBx2f6bonbX3nxBEIPndgt7ZNHeYwYDaqahn6jRHrDdGn0Yxj
	 TzsiOD7HZ+uO21u0paGCSs4fXOtYdm+awwY8emRhgFMXvkGhu7I+BPpwCfdvMrGb/t
	 UBBWIRbPepf+qieGlaR5sV4z+F3ojGNBCeBm9PDvqJ6v34r4bDdrr1Mpw3VxtZXhbd
	 GdatVEZ3XO+1X8T5EyL2fi8t0UwLy5J8RSOUFEJHyPH3DWmDGxQH9rRSx6vW+gvmii
	 HDy4kGUVgVaeA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7225e60bso14530081fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7JNkaNRR+oQjNZ/PhEXSwJVk19jH3eVVAsZv8J9Du3nsfxEtUMUrv/+FireNxO3Pt+trxxDYabL8oiqSi@vger.kernel.org
X-Gm-Message-State: AOJu0YyLn38I4fcgSve01UdN30HRqoVKGK5C5kxUAit8wAtYdpT7UyOm
	lV8f0y7DFuEODmCbhCjwk77x1xMpXMrfGSKXcs492Jcv8DiwBb+EzTYZNSDMsPVOnBFH/MHBTfT
	5pMwfDUGX9HwhyrM9Rn3dCCE+sj7FhqmDhiTFt760wg==
X-Received: by 2002:a05:651c:199e:b0:399:90ae:a406 with SMTP id
 38308e7fff4ca-39c799c9fa9mr12982771fa.27.1783585758335; Thu, 09 Jul 2026
 01:29:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:29:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:29:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 01:29:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdt+39pbnE3XOwRm6yWJAENU1UeQhw9xaFu2vDqgcXU1Q@mail.gmail.com>
X-Gm-Features: AVVi8CevtjxRrM5Jiux4yHD5WK_K0ewuBLgZ4WNdELr7GiHQbbHlJ0bNIUyMMn4
Message-ID: <CAMRc=Mdt+39pbnE3XOwRm6yWJAENU1UeQhw9xaFu2vDqgcXU1Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 10:20:40 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Add compatible for Qualcomm Nord FastRPC which is compatible with
> Kaanapali FastRPC.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..24fc0752c11a 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,nord-fastrpc
>            - const: qcom,kaanapali-fastrpc
>
>    label:
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
