Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50DF4F68CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970688; cv=none; b=mXf0QSDt+sX5EI26TPFGn5j80qqt4pks0Z9Zvb6os62RI92EUAO1IiexoIuXlRkRVoqkYgbDwgQxXef7eR+ZHHZgmhMy/P5tnEtU4siIbZQD/jt2aMZoMuS89gwqOJUE04dhQyWI7s7TwHUpmiHhGBchGhhKzYi4Tp+7GDPcdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970688; c=relaxed/simple;
	bh=JAZDEVVWBpCzIsROIvJ7aOp+s0L8O8CrbhuQdamS+9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A844MPYkMsNUg7VEc2EePZOqpBrjyOErm93ARSxgNfKVDA7RipFpwrd1GATJAahO5z+V2+w8Fhg5eFRJKCNQM8kICCTX8VDInPF6Hk7I4P1xmELM9Lbn1aCegLGEn+ubtGSipemt7301/5lxCUiLaVSbIRke3JdMVYvAkZIyo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D9TLTe3L; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D9TLTe3L"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso21408775e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791970681; x=1792575481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=D9TLTe3LV0X5U6WrodIJZ4Js9dABg9SPiO5halhg4sMS7y5xRqIJi15y/LSCfW/gff
         3PPz0AbVI8KlZQMI+JMJ0zom3Z184cvYzFHfbRWzVs9fuw3xO47o+Fp/XoJq/BLEWRa8
         GuhozyslteyFWi0slZ1rKsak4hUUaOGJTEdFluoNTO/4Yl+p3OYnm4dkMI/5HKoc+0qY
         El/6gNKTJY3hyOBZIoIiE7jZvHXsvu7fHJVmHWedsjwzyI5M0+WRIVkGmvBDHLuUw78N
         www8t0s04MAsGaGS+3oYPfFZwAZYYVBrW1XTiLUN6m23lwL9Tp+7Zkf6AAPHK1hOBCFK
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970681; x=1792575481;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnTWC5fZozzSwkHK4q+Oqe31gSO1RQ9RdzCpCj2F8RY=;
        b=MEk+Dgp5CcCht9oE24/qxCml6vElqFfHBLvdP2or7x/3G+f0bOib4vJdWz3bi2DG/h
         bdVXM9wmVMhmnhngq1/+IHfPAZEJ1CLlRQmZ/ve8+FtW5G3UFV6u0eWwV2JbdDCN8UvO
         nTwq3edRK7yF3xFau2AbQiKg3L6o+YsuDsHcNfxYYin+HJMeEXbLiVzRzaJDzo5x1VI+
         uigPe1f27oaLzJWPsr7Qw5XMyVCBFlxZG/E0f35424iaAndsxeEjlVqZaFnHpHwEcaGq
         VlnucBwLik4lj3RbHo1yi5Tbo0Tj+shUqXVcBYs0x0NuDKrkZTI3q+ao14724fWvvJe8
         IY9w==
X-Forwarded-Encrypted: i=1; AKwUvBzY1jpgUMoGJ/W5kv/1/ffQzmNW+OLqqS0R0VL++PofCLW2T3kRi9krdFG33VqOPLXP/HrkJ09UgWI9nXet@vger.kernel.org
X-Gm-Message-State: AFq9FYI6e7fl1Pg/aFO4zGyJPx7cBTmbKjoqeEUhIQqKVudAc5j4OA2q
	3DCuO2F418r4cwv7lG0ulg7mzpvQle09bwlpSG1m00Us2x4PxAbStByk5Nc5KRyKI7vVVK8MGDK
	f8HPN
X-Gm-Gg: AYBFou23Hp7mv9vMU2SU0tIyfNbLuwayHbfvjw6u3Wqgc00yqlRnIrI0xz8BO02EgK7
	Q6a36M8SzKBUjgLx/Y7R8d+iMtXzyKw/ULnfldw3CZZv50x9/X5gT6EzkH3hZ1qKjLz23pqxhbi
	TyfcW6kT9/fJ1X495PyprK1wt8izpyIbMqWAlFTYs/g51RETRVwbeLcbCXhH79FVMt3oBnNvfAB
	T8RLtLyW5tPMfEBLqKXGNg15VW7XGhSsmI5beUYtnAo1/4Zb/8TK9Gdxq2ncZC9CTw+mI10gYpH
	avCyacYoCmru3JkNgzB7R4tZ825GzY8uMB1l04xofTRa0tIHavIL16np+FSDoctxVaQd5CzGX4G
	ueNy+Z45WsiHx+GaS/ugr6OND+enyahUnUeETs7DEg6+SCqV0Pq2Wb+vQ5wFbhFNjXYE0Gl0z5N
	6uaooW8/uy3D/p1dpWN9+CkW2yLiGmhqUitgtb14mOMbgOFwv6RiU5cHZ4bMYGPKnKHEnHH152V
	e/XTiJC3FGC
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr299229875e9.23.1791970680941;
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.126.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm6026436f8f.29.2026.10.14.02.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:38:00 -0700 (PDT)
Message-ID: <db980e07-adf9-464c-9fee-401581986508@linaro.org>
Date: Wed, 14 Oct 2026 10:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: media: Add CAMSS device for Hawi
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
 <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261013-hawi-maili-camss-v2-3-fc93222da89c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2026 12:02, Nihal Kumar Gupta wrote:
> +
> +  iommus:
> +    maxItems: 1

Just the one iommu entry ?

Please:

- Make sure its just the one
- Include a comment to name the one in this file

---
bod
