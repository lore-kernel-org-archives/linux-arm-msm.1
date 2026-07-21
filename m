Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE0846EC9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 19:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661885; cv=none; b=WDWGKZSlyKzi9O8oc86FcNr1Q15KH3nIQYkBFgK/qKrmAHL82zLMkEuOGj09QCHfe6/WPm/8dYaVYn74L+5ByCFGBLQZwjibxIEPYRXuYFYtl8i15QBkestHyoYdS83u0uFA1cpEafI1gQDLH8XJ8siuXnFovfCGCyRMbO52mCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661885; c=relaxed/simple;
	bh=l0DnZO8FRwU2en+jhINecBJpPrpTXO5fLYNKyERE9oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAFHcfTAWWLHTtnOjr0HHoa9i44NECsogPSSuFGDelJ8EGtK6xEDbiusjT+QDgfLo/RLyf1r+oNdMs/UZ2H0rT0t8iC6glCSBinRynWx8FrHL090tytVrfD0GeUz4sSk/BLESb7HdbfQP9gfANYBTCw6IkL74Wnmh8iVJQEm7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D1JEOYqU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D1JEOYqU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f785467faso1741397f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784661881; x=1785266681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xv7RcLIXwcJHJp4KDHhwlbXkkuhNl3KPHg9K6zOoWbw=;
        b=D1JEOYqURoXf5D2i3SsmyJge2VH7Q57Dgsr5HEC5V1/SVAoDWZvMOLSU/DVg0ZzwVo
         H5wCVCFAlD2VZd0QGk7E+Nr45NagJN3ce2g0QfmHe7ZsYj8H7aJdiU9UMfidnNhcx41l
         3txMPO5yUDcssD4/aa8AUwwqsvSFzSV5MAIjq6XEt6jonDP6KFhQIuwrmIozQmql64Jl
         wtF2GEJ0K7E/afwAOji6lhoEVxyMwtOQ01mPARNclwxiw6cfl/cMMS8aVT9Bkv341tTj
         fnfoy1xf4n8YqZtzvj3vYeVL3dgpum6wtGw8O7g6E9ZRl8crhDZnwV9d7aRaLpr8uChe
         nPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784661881; x=1785266681;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv7RcLIXwcJHJp4KDHhwlbXkkuhNl3KPHg9K6zOoWbw=;
        b=nntTCTYbgENjMgWALVn+6UgzFBvVfIYVd4tKSuS1rCtuENP+/lpamgpEKH1PYTlm1X
         cZN2UoxRzy7E7Dlb90GKuFyxmjS5DLoCDSqtXJmaTwSOTC8UBCPtB+UK23dGwpppo3u/
         U1HAokP/NF7Ynw9n9b6W/ttpoj3RzXdL992HUIohSE75p4wwvIzLRVaiNHtqIb3VZDhY
         XviYeKEc49qPZy2oy6bPtMPnh3c84xF8fOT7hZNDevuihgCjCLRZo0nhQfyCj6zB0Cu3
         HZPm16aMuy7L0+s30cmQpXqY0xJVATMIG2+9Zwo9PMpPd5nlBhwREWx2Pc0HicMK+vFl
         P9vQ==
X-Gm-Message-State: AOJu0YwNmRaLueH6ohMN46j3nPEDIddjEtwnBsyO28zQFOyd/R5SArff
	X8/lENVL910wK1sHfMo8/2E+Jr6VCO1XaWmeZOe4aYZmZCYVnqevfStUt42PmRsqGMw=
X-Gm-Gg: AR+sD10jyGs1Tef+orqKJTR3XD0W2xcaAGbMuAG5mKtgTQfozt2dDHXxMis3rhrOlZh
	HEvG/7Vs7YgI+xd/+7Y5U9N3R3RdjVSJSDPVZBRk/FcGNSJoOb11SF6BO9xWLxtTYW5OkqcilGb
	r7MPynfopqNpKTCGgAwSbmtrcP33H6A/fiAISksfHcFwBklTGDxmG6fotruld+VsP9+IhZyxB2p
	SdE0ZJXwkBBNEiJN96xz8q0qwKu1BcQ6UjQslODYAiMwHASu0G+PLcd1MojvUri+HuEBX7PF0dE
	m8Mid12K0RvznJgPdj+AJP4qcSOKkVqFHFZzRgeOZ/Yde5pGiIkeDcqURE6u9l/3S0ND5Fl+NhK
	woBzfwK8PeSZvBfwSHZtqPLx31d/h+FN4N9je0ZUXpXQFj2NbEHvCg2/Dvnt73FO7Wl+VyrG2tW
	B8R2j144QxK6ysic8=
X-Received: by 2002:a05:6000:2988:10b0:47f:6981:a04a with SMTP id ffacd0b85a97d-47f6981a22bmr13980470f8f.31.1784661881488;
        Tue, 21 Jul 2026 12:24:41 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.186.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm41781481f8f.8.2026.07.21.12.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 12:24:40 -0700 (PDT)
Message-ID: <1642e709-df23-43a4-9ac9-2e004e2b3bdc@linaro.org>
Date: Tue, 21 Jul 2026 20:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
 <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
 <wzsAes-UM4_r8scRyy_yhd39ZdxvT8W9VroVPOGWABLsw7MqR05o_z2MwhgiC1gTSBgfVHpXWADbsqoIOsR0Uw==@protonmail.internalid>
 <ec3d6035-d4de-4e38-8c72-b29a04b263ae@linaro.org>
 <1f128571-ed46-4a60-9594-74fdd5f440d0@kernel.org>
 <864c13a0-a52c-43f4-9d94-646bf66ba31a@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <864c13a0-a52c-43f4-9d94-646bf66ba31a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/07/2026 14:35, Vladimir Zapolskiy wrote:
>> - bus-type from the media-controller
>>     Already specified with camss still aligns with Rob's declaration
>>     "the consumer defines the mode" so I'm comfortable with this
>>     compromise position.
>>     This will still facilitate CPHY work/mode-selection via
>>     phy_ops->configure() with how to define the CPHY part TBD.
> 
> As it was discussed there should be no phy specific interfaces
> between this phy driver and CAMSS driver.
> 
>> - data-lanes = <0 1 2 3> valid
> 
> Would be nice to get an ack from linux-media maintainers on it.

OK so clearly the consensus I thought we had reached doesn't exist.

Vinod I would ask to merge this series as-is.

---
bod
