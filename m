Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EA13ED3D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971035; cv=none; b=TZjpzbOACBWSeCVqUaDypJKTv/2eFbAwOBOLan9R1KAibnrcmVlFvPEFsttgcDmTbmoim90FXQqwJ6vanl0il242k4rf5xS0H/u3FyI8UD18GoTGMwd1bVZ335tU73KQNJJ/yFt84n6xGpy/TIk+Z/u7ypYMmDdhDrLCaMAs/cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971035; c=relaxed/simple;
	bh=p8bij+xPIuY1F2wzTxNxuEiDx2tLRjfxK2DOQb5YmqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDIoGkZusNbYdvHAJXYqZoZCFNYfJBt0qR5VggWESmz+gHZMR8QE3kPFjZvoL+X998i3ImsI08JIb7F4VdJqLRwPEHXyrSj1Sj8vEpXUl61XR3DWg/xQnvizKznDg36J3fDyNfsZ8rbVkI10aBwLy9guO6SX944PifwLmCKE8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uOYw7f4O; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uOYw7f4O"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so1077295566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791971032; x=1792575832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOCQwbGkL9XqwqZkq5Sc8MdH9xmRzvz/HA/PLReDL08=;
        b=uOYw7f4OPvpwLDJBsDw0RiocCBQFaY7L6IVYwf251T6PDD/vlDPeINPkrEszp7xxIo
         tMYI1dkwiYFQdtHXwQGsFlUNJ4uJ0SQS44kUbPEWNkUWv1Q9jdW1kBeAYxXb5KANJ2Y4
         RFGHRPgeCRucwsmvJuUSu/C2l+aKDhToYAInFS9joJW/uXFa9aQzXkwAaB30tdikQUCG
         j22Dkuet1XeZ6Lpk1ZX5Qa9jTLcXR7j7c4VIxP19NtPtgOIJBLb5GpVFh1taqWS0ZlGs
         KLCOIPOhEozBod3CsqIF6OHYwDVKE+PHKh1svgXSSUWWG8F0RFuGODxfna50qSVRfp5Q
         kZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971032; x=1792575832;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOCQwbGkL9XqwqZkq5Sc8MdH9xmRzvz/HA/PLReDL08=;
        b=f/8BkKxM1JCoc0ltN5rFigpXv8e4DXCNNp+SiSQKVeZSisWS9/xKdyFBHtl9p8JHES
         AktmWqYotnhhe78oKAjQicidJyKnlXRiRaaGbAp07/PlL3XKfJWgSpqv3GiDZksUecxz
         1hthVyItviB6NziHuoP4ZsKFTt4T++HlGepX2yEGTAVwr954A2+zOerppD/I+A955E5b
         jcv0oyIELOYRgFxjcTocTFkFo7/+zjy+cdJDRp7CENjqsJtVSSbufyzLnMOmm2dKl9/l
         hZhL0vEZpEm8cJjVUkRJBaUjS2Md71iApiWCjujMwSoit9SysgxUYCtdpdOVyBARyzsr
         mOWw==
X-Forwarded-Encrypted: i=1; AKwUvBxF+yeuBX9ixXWIeX4N7qualBx+XkjUx5FS1woyzVSeKLvuQ/4kN8DLMeSlL5w71as6WqqwYIX9n0KPG/qr@vger.kernel.org
X-Gm-Message-State: AFq9FYJYSHF7CI8o6S8GcSqzUuydqy2RormkWUlB9kr3g2VdWHuRpYjI
	aXqNaa6aHuPudqdbQikqQr/UhDLlHbiJCQ7NqAovrxnpz17Lw6gmUs1dUOvUQJTCJo8=
X-Gm-Gg: AYBFou0N4ehGPA3cIqAU98ahv6w1VASaPRuQRcsAtYaE0aTQBZRrR2nUWhJo3dWk7VP
	v0UsMyVPHp9i+CyonVc7xqhXyC+K289yXUpNYjgo9uylA+MYQqAIwsqOWQQEnAyeZJGLgZVnAjd
	aNtkW9JIH+Yyo/t+8/QesDs34fJ8ng6tJPEla0L853v2QcDoNF49YzuEk21xrNOKAMbh8thwhG2
	52kBKbxkMW/Ixot7RWcOjolqpI7VkISy9uyrznH6wPz8dx92OCPaefPClU0q/TPmFnTdGRmXKOh
	lndayc/UVKCSjdMmPiBvdqRzsHyq/G3nE2EE7fRKvoNjrF6U80dUX6416+2Ix5N94NeLLOo9tN+
	1u0OHL+3gTNfF5dQURqZGqF/t8kwrjrkI1I0RMYzoa+qpBwOTwQdGLI8z6ygDOZAoSy+yf4fbPw
	o5Abgwajn/91eHd8fjnW33tRJdkBi72jByUbD7RmMsD/lBp8hLMn6V87VkaEnNHFFOqWBcpz13R
	Rr5fzBEJ+VQ
X-Received: by 2002:a17:907:6093:b0:c2d:d929:95e2 with SMTP id a640c23a62f3a-c31a7067739mr1466697066b.21.1791971031904;
        Wed, 14 Oct 2026 02:43:51 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac702fsm690779866b.65.2026.10.14.02.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:43:51 -0700 (PDT)
Message-ID: <4fe3f636-2352-4f3d-9634-637622b2cd40@linaro.org>
Date: Wed, 14 Oct 2026 10:43:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: qcom: camss: Add Hawi compatible camss
 driver
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
 <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-6-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +static const struct camss_resources hawi_resources = {
> +	.version = CAMSS_HAWI,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_kaanapali,
> +	.tpg_res = tpg_res_x1e80100,
> +	.icc_res = icc_res_hawi,
> +	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +};

Wait a second - no IFE or CSID in this table, with both added in 
follow-on patches.

Lets just collapse the last three patches into one. I mean this can't 
bisect in a meaningful way as three distinct patches really.

---
bod
