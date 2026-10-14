Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBFF481666
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970714; cv=none; b=iishIi4slGq0VanRlFXZLgnEyqLB9cJ9Zb4CZ3ISTVJxkitm0OcIztWgiwPSBvF2PgscKs0/M/oAPopWG5IK/+BHJyC5rYRbJTbAmODsTfZCmRPJsYkD1oxbpmO0s31DAB7YQGZn5v/YyRpTcPX6D5vyT8DRFtGeD502L+cARb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970714; c=relaxed/simple;
	bh=ieAQq8W05Ldh6ypvnca0o/oiaSqWrWwDpTTeoe4YWdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0jVLLIqUMKoJnYF+1hQRHfilWKQvxE83418KPa3gGvHfC3T/bDSpeBdWWy5PucdC5s1p9XhZEx4xcXgSYBbaqwsN95dL2AZ3bOTgC0jOSuzpN7aItWMaJC7HU+xtlx5Jbw/zZ4bq5FFMFPknnaX66Tnl85VuS4smrTSlMt2wtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vE4seWoj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vE4seWoj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e4df2e26fso525019366b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970712; x=1792575512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+phdlrYB/RD28JPtIDO6lYJBfhoxurBJxdEKdj89FI=;
        b=vE4seWojajhrXAXU3xkwRJahawNuJ33pEC0+n+TRATlgWD9pK4vOTKM1Nl41iSYS6U
         NVaLwS3CuoaOhOk47H8rHOk9ctsVFASx6ad2sXWx2MDFEtPIvFTS1r21sZyRcR/lNQaf
         J5r4Flv4V2CoXYuuWIKCX8QdWLero6zPviAcFLQ2Xc/EOa+iXWaFmeIEaV8MdYtSgtuI
         m6K4eA/mM5/hIaGSBnkVE/DkR1SZmWUWcs8gTQ4TQ/s8TFg8aQssW6bVe/grxJUrsn+2
         nHIYaQTqeJ4t2pLmiWHdx42xejEQpS6jU4J48SCTFCfgEcG+Ntc2yFjk2lMSfUdTxpfl
         J2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970712; x=1792575512;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+phdlrYB/RD28JPtIDO6lYJBfhoxurBJxdEKdj89FI=;
        b=EvEObvc6jwH0w0aJUtJGFQSH+ittAZJIdTYKI8qC7MAC/4QOhynEZk7KGJo8Eiym4C
         WMJpMMu0KVOm1zlQb3bSb4pDXi/bT2Jv+OyH1hOvqynsf2LtGzaYcODyUuS9WwjDRAOl
         4CfCJr7t1qROMPHQp56te/Y4JtKWmFgfyUnQ0whV5VUpyUdAJp9yuo22TW8G8XiTtjrb
         W+hu5uqg8UPABzf5ZtCZ5mBKt+YOA4BExuKup/6DC8zRI5Tah77E8Hi+jn/ZbLwF3zy5
         bqWbsVan6shYEaaMaGZeuXNGF7k8wRCpoVwQhbe8qX4dxPH1Rg4Xk2z1yUHdXu2HaexH
         NfNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjtckw4GWFG+89M+T3N4P60iqoJt5nfxZMKFstomlVZFE/Ti20L2JPQNc8qsx4fqci3NeAJPgSk05RYKw9@vger.kernel.org
X-Gm-Message-State: AFq9FYJCZvftf0+s7UUD60Kh1CZUIXgsxh9AsPE+DU/T3kVl+8u6elJ1
	ZAB76DDy0nRq4e8lkspPk0KUw1z5bYfySFP/jzPPF/BmM6QIkAYZSx7zJMgUaj4kTTo=
X-Gm-Gg: AYBFou2tQHiGc9xupOkjwuIijNbBQk0yLQjcmS98+rwxGM80yY5PDyzFIIsi3r0JPfc
	G2AfKEtnc8IzIDodrhTMum0+aGZIB6B9pV8F33QIfo0BGt0u7tZbh3zBx+EoCt8OZ5Dp3yJAE21
	fpp76v7JjUAkQE9ou4PBQKE68FfIc4Mp2hQ9c/g178mXxPvawmQ/OwZx5zzR+S2CASrc3uFXV7K
	Ca5+CJrI25THmPJJzQiTPq52kc7XvEDf4l6Bd/esn9KKcGbW5IhGceOEhnpanzDd5O2WteYlF8G
	u9KZndPs2cBB16Cu1Z7cgq/sGmKsvTJDyEGuX5o0zJ4CNL/oujeb7Mhtf5rEZZVg0hZ43YJAn8M
	Kge/jcB2Ys9A4rvNV2g1AiTIgkN6jk1ylh1hCHEo4RZU0pGn43Uw8zoaWuAZW3sv9byIyWGZT9n
	S1BivCz7TJTes8UUbF7zb8TfTISuDgnSUrKzV6LlO6afI8/cKggx0FTvzpr7XhGT/eza3+F2Kqr
	pDCrwiMYn1m
X-Received: by 2002:a17:907:2d88:b0:c25:541:fd3a with SMTP id a640c23a62f3a-c31a9a07db1mr1358197766b.7.1791970711490;
        Wed, 14 Oct 2026 02:38:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa5953sm693842466b.58.2026.10.14.02.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:31 -0700 (PDT)
Message-ID: <47c2af33-05f1-41a2-958f-11ca13568acf@linaro.org>
Date: Wed, 14 Oct 2026 10:38:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: media: Add CAMSS device for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
 <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-4-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> Maili shares the same IP as Hawi. The only difference is
> Hawi has six CSIPHY while Maili has five.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> index 5bf0dca3d24621bfc4a09feb8e5037a925869751..d1d53d6f024cbf7d2a0f2525aa4040260353b200 100644
> --- a/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,hawi-camss.yaml
> @@ -4,17 +4,22 @@
>   $id: http://devicetree.org/schemas/media/qcom,hawi-camss.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Qualcomm Hawi Camera Subsystem (CAMSS)
> +title: Qualcomm Hawi and Maili Camera Subsystem (CAMSS)
>   
>   maintainers:
>     - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>   
>   description:
>     The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>   
>   properties:
>     compatible:
> -    const: qcom,hawi-camss
> +    oneOf:
> +      - const: qcom,hawi-camss
> +      - items:
> +          - const: qcom,maili-camss
> +          - const: qcom,hawi-camss
>   
>     reg:
>       maxItems: 13
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
