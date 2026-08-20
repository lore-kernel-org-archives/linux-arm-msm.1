Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9537F738
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239481; cv=none; b=WQtTlCnJCFX3BzYWBcHrqqFZjVgyIoUpWeo8C/ncqAkXII9rC5tTBTdiSswecLHDXdRBttKLb/gkaluBR3X+NyVLCFPNHJlmVjpKwglvza/1dQWiNc26nnDAxZIHyGjFJPUaxCGGNCldybtU+r/YC6lWiN6jMrJ5iNTNcOQib58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239481; c=relaxed/simple;
	bh=5mospAeJ+WQFvDOFffDJlYorx2Ldl9egIIWSX5JuVkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCfkgrmYtAd4UEhKhJEd2tJCyc42bO47CCPcC8j4YaMfr2MQA6NTgIh1TaU5ZhYhL4SC8zxpevndCdXIaxnOYamZRBzyhrYMpJ2iS2VBU2Z0tcfOzG7Jot68OLeMEWleM79IFbHGzpsKEV2tH+piiHmJwQJbWjmhWC9RQdkIi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NK6Cx7cQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK6Cx7cQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499a4d1d7f1so20160635e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787239478; x=1787844278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/98bX+CH+lFllKiqKstls0WsvphSuEf3qS82oTyBRRs=;
        b=NK6Cx7cQ7fIyzPhzqnCWqFrZAWtt8kA41FQhGcdhHhTjnDsHD8IWUoLhVxqhhjTnOK
         zTfnWP0xxyI213euP2FOSTpTMnYaxHR338mvS7rSFMIrwP/iRuVYZWtJfwa75EwRQO5Y
         8eMD4RFLkHmWk0WnxEdiqDjc/t4tH22dGLlqZu41tBAyTseUNShFNWbO1KgWQbFP2pES
         1+UaPCIIuJEmrEve710vhZ+16JW4DjPVVXQULQWyEBut7nWUL2uFArTnHLRzi5v3qe9C
         TpO+49jlxuW1lfSmg6Tdq/2WFWGpsrDI9CcRTOVlfslasY/Pm8CP4ssd+2zfZyrq78au
         fpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787239478; x=1787844278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/98bX+CH+lFllKiqKstls0WsvphSuEf3qS82oTyBRRs=;
        b=jkP39Wbr5ssBLmfrMy8yFsWbwsuDLHblnzKwpsgv7saCx0S2q5gS9pujDTV0tFYr/f
         XDMkO5ZeulAL2Ey20xT+4ddlJmJ21IGW9kEzHbKOn8K/VguWR34o3ygY7FtVmcgaJHB8
         DCACIzZRyRUslqdQ3FeFU4Wuik/MZ5ktOp/3FkjLP5vxpd/9q9uDbbnaUFw2Y9qG5h19
         TShImuOE0+dIi769/RFJ0Kg9dwXOg5uyfzJkE4QokRH/IB4XNBxEuKDNwHDID8VufTu2
         L1uZMUrYsY8hh+AhPPRRuplKrS1Q2/+Zh1zbzY1nuTG4wazCz3EZVZMothbo+86XSNwb
         PJZg==
X-Gm-Message-State: AOJu0YyqUpkKQinVM43yVjHbUafj2Bo2wU8bqXMPeZnutDRB35LvNMmq
	5alPK+HKrmmGfvbiaq55F1gBiFUZWQsYRpv769mSHYAsS8kncmv02qyH
X-Gm-Gg: AR+sD12ZFJM5ujW2gKJTu8/oGwmJ9yS4iBAn7gbg1qGBD98kubqmZBhBH59nO8Qu99i
	Marbzy5MZn2/h1yJcsh5XvNXRLavPKyZQxPTkcb0s9PxnaVOUHIIbaNGn45DQSgB/j5t6QJ7cJ7
	9E4u6Gh31I5EDL0RWhGN3O7reZwsMpk7jLnIsgLTOA1I2QBWahgI7AjD1OAQrgmkt4sCXUi71pd
	l91tDtCWQ5G9IOwAJqvH2McUQrUIm2Ela1CszxFOsJXTaHTn3zlht8cwU+pHCtCnUETN+AO7G1M
	BTfQvOP6wVjpcyk/r2B+Tv5P+1Cwa3G0qxJV1LVH55p3LQL5iorkkPcEeD0aawWZQsa/i/OxYDG
	j9SwTnbE3qsd4+I5hRNlTEIOj9XLhqUjXtg05bC1qyNMS6HAu/s2YotDaBpqOVLFaWLg43ZKb7P
	Q7z/Jxkz3LwpUUzwxB5vAb8g/JvmB008HjCn7ML5u8XOukZVg+quwhltjaItE/Og+OecRRa2Kjx
	xOpnQCmMf8NxDMpYFfYgmbw69YQLA==
X-Received: by 2002:a05:600c:6748:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-499aa1d0670mr268427225e9.9.1787239477402;
        Thu, 20 Aug 2026 08:24:37 -0700 (PDT)
Received: from [192.168.1.118] (83.31.75.144.ipv4.supernova.orange.pl. [83.31.75.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm12618644f8f.27.2026.08.20.08.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 08:24:36 -0700 (PDT)
Message-ID: <4dc461a9-68f8-407d-b458-695ac263ca37@gmail.com>
Date: Thu, 20 Aug 2026 17:24:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
 <e16a7122-18c3-4bc5-80c5-1cda458fa2c6@oss.qualcomm.com>
Content-Language: en-US
From: Adam Skladowski <a39.skl@gmail.com>
In-Reply-To: <e16a7122-18c3-4bc5-80c5-1cda458fa2c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/20/26 12:17, Konrad Dybcio wrote:
> On 8/20/26 11:42 AM, Adam Skladowski wrote:
>> Add a devicetree for the Motorola One smartphone, which is based
>> on the Jacala/MSM8953 SoC.
>>
>> Supported functionality as of this initial submission:
>> * I2C peripherals (Touchscreen,NFC)
>> * Power Button, Volume Keys
>> * Regulators (PM8953)
>> * Remoteprocs (ADSP, MPSS, WCNSS)
>> * USB
>>
>> Device tree also contains supply maps to other subsystems like MDSS
>> but due to missing dependencies like panel those are disabled.
>>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> ---
>
>
> [...]
>
>> +	typec-portc@22 {
>> +		compatible = "fcs,fusb302";
>> +		reg = <0x22>;
>> +		interrupts-extended = <&tlmm 9 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&fusb302_int_default>;
> nit: outlying sort
>
>
>> +
>> +		usb-role-switch = <&usb3>;
>> +		vbus-supply = <&fusb302_vbus>;
>> +
>> +		connector {
>> +			compatible = "usb-c-connector";
>> +			label = "USB-C";
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +			try-power-role = "sink";
>> +			typec-power-opmode = "default";
>> +			source-pdos = <PDO_FIXED(5000, 500,
>> +						 PDO_FIXED_DUAL_ROLE |
>> +						 PDO_FIXED_DATA_SWAP |
>> +						 PDO_FIXED_USB_COMM)>;
>> +			sink-pdos = <PDO_FIXED(5000, 3000,
>> +					       PDO_FIXED_DUAL_ROLE |
>> +					       PDO_FIXED_DATA_SWAP |
>> +					       PDO_FIXED_USB_COMM)>;
>> +			op-sink-microwatt = <2000000>;
> This is inconsistent with the sink-PDOs you defined (5 V 3 A vs 2 W)
>
> Konrad
To be honest i don't get what's this about.
Based on docs it says its minimal W value taken by port
and based on PMI8950 Charger it should be about 100mA@5V
while SMB1351 can also take as low as 70mA@5V
I could see it being higher when port is used to power SBC or something.
