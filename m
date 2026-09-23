Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64131E847
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147404; cv=none; b=T5Tfx6bdUD8LTGJ1q2qNA13Fd0kPhBtSj+7U1JQXSpWHZZefpT5QT/YW9Efz9yNmZYr3cCIERRu2jbKWcyOP08qwJhRCkNdVYKV4tqp6TI4WlJxu7+DS54EWUqSTExlf/+K5YfJmAQvJqJEEhTtR9nhytZh9YXGxPsTtfrZDMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147404; c=relaxed/simple;
	bh=DhI2MRY1UQ/Zf7dqRQLk43wzkaFYoYUrgRMX/hRmgdo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLmITlAPwefIZCRDH0yIxZq+I+lQDvsnLEi58LnEZjP5EPQwDrrL5AsoQgVxHaLgKO/oMhhg1f3jEXnk1sZhAa46prwgIN577BHytHz5vpzjNV2m/1qfXMAKI0ffAPl+05s11FY2F97PS4s5pJOqxDoQGrps3tCX/V/z2OSd/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WL+ERHJE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WL+ERHJE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435AC1F00898
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790147399;
	bh=Rd3saNaWRQvhb2nfvrpljjDsGSWwzcimmBZsD5ihbYI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WL+ERHJEdm0euXioV2kE9ydfANajxO+zSqfHSd0x3/KILW6LX7nihe+b9hnNZ0Nw7
	 izGOsThNI2oaIevkZqbxFZwvVrLowoLlC5S3SCgFsAe3w+1Vr2QGfA0+ayjpHW2dHt
	 pNFeDc9LL1+7ra/Tq/nXH1ATuC7GNpRxTOPhVMifyBXAttsaH/xOKTjMmwvjeTwkXB
	 WUZQI7LMv7agJLHllR5FsIEJ1HBwdnSs/dLZXsnC0UeN0BxOVaXS1CBtaAmsGM28JJ
	 vULhRy83wMCWVenXQnHBokZerJ03zhNdUL9dGN5rYQKMKn5sTrdqGTr0NUacaMq8/D
	 /h6cz/3lq1UUg==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a47f740839so5152981fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 00:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycjsnavAiL+yaeIoH/ZGvW5gRUJyEcttHuxgeFK+CtYSNV7V3J0/otKfT0Mm4C65szrA5DBrLIgN9Z5KQT@vger.kernel.org
X-Gm-Message-State: AFuF++kNabbtf6xDuk/Ttw64i+EQlx0t5hAY3t/Redgt7t9Cv+Ql/0vn
	H5+wxpa/0rQjp8abSmwV7+8XnMrK25bFCpmmuGgw98knsOxCKP7VHms6/5lJzTvMBFEh3CE4axb
	d1rcFSHdFpuIZ5JJC0d66//MMGYrQWykDRA4QiVZZrQ==
X-Received: by 2002:a05:651c:a115:10b0:3a1:51e6:fe5c with SMTP id
 38308e7fff4ca-3a63064a063mr2236601fa.13.1790147397757; Wed, 23 Sep 2026
 00:09:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 00:09:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 00:09:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com> <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 00:09:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me4Qj_0tEPj5xTsLKwTKiOnVD0KHwdzSnYOzW3cyHdQrw@mail.gmail.com>
X-Gm-Features: AcwNN1W6_YECrRbye3rSgapWE7Ke3y8Nd7IxIgYIXgcv06RcyUviXui6XI75xos
Message-ID: <CAMRc=Me4Qj_0tEPj5xTsLKwTKiOnVD0KHwdzSnYOzW3cyHdQrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 12:08:49 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
>
> The CTCU device for nord shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for nord to utilize the compatible of the
> SA8775p.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 335a8e1a5a9e..1d5bf79f4984 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -31,6 +31,7 @@ properties:
>            - enum:
>                - qcom,glymur-ctcu
>                - qcom,kaanapali-ctcu
> +              - qcom,nord-ctcu
>                - qcom,qcs8300-ctcu
>                - qcom,shikra-ctcu
>                - qcom,sm8750-ctcu
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
