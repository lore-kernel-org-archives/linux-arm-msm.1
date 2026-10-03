Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C5E379C5F
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018299; cv=none; b=QQSMYYt1Uul+vBNDf6CeAhCAGW2JAifceswqG0DwzYr4o6cJ8X47XPb2TSiloUO4hXOMiHv/9HWgQL9CwM1SXSPTjahNUaCkOv9Ggt3hPJ0gEI2Drd4dGrJ0cDGhF+roW42RVJCoL0xewdbLUvK5KFJQUWP32WZCAu62x2/x5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018299; c=relaxed/simple;
	bh=oBAwIlp0EH3iPcRUaPn/NBQX1NuaLsMheNDGOxsCCCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI2nHXG53bqQJQV8606rrRzG7KHc9drEVhp8vWBTwnbE1nN3TVr6Kxr2+QX3xYqFU/2DcisTodMyuRO90t+Xwfb7Oe3NOX3yMBZLQU+b5eOjwqW+NvBLalwRvZzsofAsjsbIEQrXGeTd+2+Baiw1nG/BgHqBBN5HpUJIzjbx+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S06ZJiyU; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S06ZJiyU"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so89695466b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791018296; x=1791623096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=S06ZJiyUNxkTWTJDW9fMCol/9fu1dIy5o87nmR1DS1aFKMyhGm9XeGOIPwjwcE8VTc
         +30aX593eqYqkg0faeA9CGvwuc32zcLfi3LGupK/d+x24+v6tXhAJlwjyniDGLu6VaFm
         wv9eXu1KKhDULReGpw+X4Y8qxEbIui6QaMzN2hhnqqbyr7XL/jHgk+NUb8fzQDm5z1aB
         dO/8th1A1YrqyXzuzCd685r3O70sFoYWPfnvMUAklbvqb76sU5rvvqevwYcRNsglZ16F
         86uBvzR0a/Du6cc0nKqxj/bXjhKWrKjPuUguoNM0StVbS6zQhZ6VOR3u1RmfcZ0tRTOa
         JSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018296; x=1791623096;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SCNo95/BixJDrCNj1e89Xl9YT1Mqeqtzc6x6damSjo=;
        b=HWFtENCfTF7L743AjW25wcymfj/tv9cnE/l6EZixAyBRAQsR5fjeBA5I/qzxBSh/tJ
         EExWKGy8GJ2curae0bo35zVnLjLVoHUF4l44eeC5EcNw0Xphq+bHanYl9dPqq/QmXKQm
         g4oExSQ3HNYdFuVpdLuxXkJD6KRknTCwkcPxx36KMt9AkDCSjxxRm7lvIqs7YUfHIupY
         iLn/WN4OXlBwPHpQs8rs6I8nNBd0RK/7V8hJnrr+hAAAeGblRhNqxh2ohMmvHoNxAs7x
         +oH6yK/gpz1+Mb56dFHoZFO9ljMmCg6ZeIYWbfj42r+u8nE98c6tiV+rtkgtAACu0eOO
         ZJjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmJ/J3BhrKcEUq1ZLABLdLdjDI8v9mlDXitOu2B7nrHSBTPjoHOE3liliy/8H00zIOnjT/1oIByHbCcm8p@vger.kernel.org
X-Gm-Message-State: AFuF++n3JH+iPXj2uwM3UV3Dgoy/RKD2yHtLPTGGt1b6OGl8PD8CFn0W
	oGVLt+OcffQO2E6CRPfiXpOI2zxIUIBg4AXNf8HY83eg53If1arkdBrE+rdApUyCMio=
X-Gm-Gg: AYBFou3BhIa4CyrSdSfLqRY+DInkBuJN8OZAa3bXdSia3uzS3kM30anP//kX15TAP7q
	nI0XYYagQhyf51sOgPfdw9tYEUf0Ptn0dlxfsKX+01xVN9mXFk643Ot2G+uZALrclnl3YBk2U2R
	um0GkJptEAF60edvvrvx6Aysl2IpUoOknecwONprENBszPuUl/6HAXINCE3R8dRO72zf9QTIN9E
	E91fmKdkkvyuuPf4kcRn9hHwPF53fE8qxb7LWIzt+DK21xrRFOQFy4KzikyEd6bopEZTGBhqNlw
	NGVKKIfse/MKXPMElnF2x5wsGgSN5R6b5BNlLrswvHYnl2xqXMhOeJWdw7TFyXoBhBwx3ZeZc5E
	7tzP3DLBPDRNlFUemf/maFJqFjMWjdkgcZ/fqO4Eq5XCWEdTX9aabEVmYSv5+7fSVzXgQrGofVd
	CeQ8zZ6gZY7N6P4Dp18KjKTaFmWnVZKT++RENil8CQMCdFVcX8mPfktpk1dKTwJEMmFDa5rkO73
	BtWUHSvxUo=
X-Received: by 2002:a17:907:94cd:b0:c2e:3d17:5265 with SMTP id a640c23a62f3a-c2e4acecd07mr452317266b.21.1791018295547;
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e71d5876fsm48745266b.0.2026.10.03.02.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 02:04:55 -0700 (PDT)
Message-ID: <86300678-cc2e-48ea-9421-b615dd263f24@linaro.org>
Date: Sat, 3 Oct 2026 10:04:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 02/11] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261003-kaanapali-camss-v18-2-87ba4ebe0db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2026 10:02, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
