Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78932531AFD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 10:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950755; cv=none; b=SGdTiBRndOPW7AUhhkLxxKoTSUA3Sfrz6GGcyNn+estXQo6e7WWo76kjM5+AvNL3aXuS+tcPu2rNQbS0v/t75DmVWNgVxHXU05IWPdSbc3wBiMEeP1pR7IRDu80cyayFM94V7MIBu+5dc/7vz4UsCqNE7SlsbNn2Q9WK22YvTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950755; c=relaxed/simple;
	bh=tfrLqcGsEUuzNpqwHNUq3Kj0poSsyq9DZH41qa+NCYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYskUBFxve1M0CHmqZ2cI9hpIm2o/ExO+Z3okn4A/b3SQ4uXEMG8+Qhd3I5hLHBNwT8j8vj90c/+89UInfE+PakJUvdePpGUerzUk+clYo8wYz1N9TsDfXNTiYWQ3qtnJyV9jDn7SibHqPNs7w9CW1aKurnbpGXFrXBO8xARNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuC7/YxM; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuC7/YxM"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a8814f93e0so18995a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788950751; x=1789555551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=FuC7/YxM0IWorvVEMRW88CTSyc+nScDh3Dod5/LuIjNq1SGR48ljmYMu4IQQxA6W50
         uIDo/0GyYLzcigr28UyTrLwqVlJgs2LxCQoTEdlsPmsF/tFcKQ/Zo9tP2iqhL6GxYqf3
         EH5REa3ORVqW7JsRYgPZ5O0TFNr5bJE+oi3RdMWG2tahoc4LAhDAm52p5PRNKvmt04Jv
         9pp8oNAWQTGyd1DSRw8gc3y6Htf0bMryLokUr24Fm2IV9Le7I32Ii0PX+tEHcESPTIRG
         9w2V7LYYEIHcD7DqhMmFmDPFOpKgGhEiZCL0YVeLZ+pVdJa5Y6o/QC9rjBqsaZyYBsu3
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950751; x=1789555551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MH6BpfVCqGiCGTmNR3nzVfS3qVLZltUsj1CqM88T+M=;
        b=BHFtSCEA6gOzXO0ZcbUuSHfCz+ZvahScnfJ5F6nAKZeXhOZ0y8chUUZ/0DXlH4zdbF
         Y7Y+twRrCsJLun5QITThJlfleLQ/5UO+7gNC6jdtIhDuf4fuvfq/T5AwVgfFmfORl0UB
         NkEied6xS0dr2oOLmJ+oqQw7/ZyMYRXH9UvR8MG+XhaPr+nMpTyRcSA8vd2uEL1GKFCv
         j1+MSxaiVXXo1UteDhTKTIb7tKxu7EsgQtAGW6GUxMShYrQgBodroaUE1rOSu1cc/2SS
         g/VNi2IOC4HIC4VyJd09rrouJdr8jHH0QgqYui0jTSgs4IVVRDUnm/vXVVeFEOzTvddu
         cehw==
X-Gm-Message-State: AFuF++lQNQpvTX8qZ8IzjtTIQIXlEImgRH98VFrr1piaBlWE9esEUqJB
	YxzEUCIkNJ5Y3gNWKQWgy+3aM/eJ7On8sEkRinaZjaAOollO8I3YLBrMxR7qsLUhlj0=
X-Gm-Gg: AYBFou0jl4Z/upmnQC3fbyi6AJnK9gTp+PSE6oN7UBeBzNUnTw3lQUJBzQP8Gv/Lm+J
	dBbR2pfZ1SF8SfNV/5gNHOqFrwR4tVv/uP3R3auIa/Acw6UXKLYnxfMO/Gz/WicQsMEFZuXpTBx
	cLlNE7rFiZX4I/WpghzuiCUVAjMctKKbHa9TA7nVaNv342TK5duLgB9ljXoBBHJjxxDkhNWnuTX
	kNdwPwhQ6P9uTjG0MqeU465lMXN5ZhYcQEHsh4IEx3aXKhXXAFQSsdjK8jF99bpFfXDNHZuv0CT
	aoJ3RG3ig5oTczDq0iKlQ59kThkW5mV1HkQVCEPug5e41lUMcEcnPrZgHbAunXYi3HVVp1Hlyel
	NBZMfs3gQFUIf9CMIZOUKGbMGOpB4vcnCoNsncyn5uBi0zKqp2lhGg+PGHdKGBNlpDFG+VBxh2F
	8HcKZ07/Zdsu6ttrtM03dbkC22wYUfwy5+cfaYf/VIfpaljZTGkHNpyf0Egao6Cjurb6OBwCoK1
	miGEon/
X-Received: by 2002:a05:6402:3253:b0:6a7:f5b1:2726 with SMTP id 4fb4d7f45d1cf-6a99ccc2f32mr65130a12.8.1788950750705;
        Wed, 09 Sep 2026 03:45:50 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.32.60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm6886762a12.30.2026.09.09.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:45:49 -0700 (PDT)
Message-ID: <eab4c6be-e3dc-458d-8011-304a98f2354b@linaro.org>
Date: Wed, 9 Sep 2026 11:45:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: qcom,glymur-camss: Add Glymur
 CAMSS
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Guru Das Srinagesh <linux@gurudas.dev>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <0wqEOKsKQUG-cPJyVkrWjcUUrp4POMvOxwKLbIaM_HQ9goiCr0D4llW4AHLrRfqjnLWyFVvpWNGbwqu6DNBM7w==@protonmail.internalid>
 <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907-glymur_camss-v2-2-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2026 09:13, Nihal Kumar Gupta wrote:
> X1E80100 supports both the legacy CSIPHY resources and the new PHY API;
> Glymur uses only the new PHY API via standalone phy@ child nodes,
> so per-CSIPHY clocks, interrupts and supplies are absent here.
> 
> X1E80100 has four CSIPHY instances while Glymur has three
> (CSIPHY0, CSIPHY1, CSIPHY4), expressed entirely in DT.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
