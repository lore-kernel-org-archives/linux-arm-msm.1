Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872388;
	b=uzCPQ78ltAHyBYKNrQ+zgrA37A7pnp0zUoWESnCeg7beypdib5Iul5A4etP4MRpc7COC
	 z2zZOodTMEVZAudK2Tamj6IjTIa/L4LabTrOcO4EZU8cHNlS4uMZnsTqEliObPqATDjRY
	 c1PnIn/TtaYGnPGyNdBuQlZSOGPim+dXa3YLNviMxfTPShTeuJcLPCGxVWbn9LlKQBCw+
	 Tqcxy/lZ5+AEXUzgRFmhYu8ERwhiaexYbD1FBxIrc/DDrzu7X2klaLlDSLeifJ+T6LGRf
	 /9vC7xRiUAmljQWoUKV5eXXYRWx+awwdUDUzqh1NxBOYwYOlX7o5QElGdC9exQVq+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
	b=nBX1pJDvztsO6YF9B9iJnxUS7icW8hAOnHI0TE+6X1jvljXPGi6Y9k5q2wmUxgKq58hA
	 q6kO9gq/gcAOCTpRAVpqfPvg/mr3lpFqFiWBdXqy2hR50oi9zvihmyA3wi02xca42P8cL
	 jgfjnb1z/HbfTPY7HXOgCi1m6xAJOsps/FuwWrQsS2i01cyLZL/uc33RVcgv8trTveSMG
	 NKFXaauP0hkvPg6wF2E52w8pM7DFjPFqA15ent+51bG68Rep1uJCb5HzfKyI8cJ7nol5J
	 ThpjYm9pKNRUmsNJyfBsmKYBrqAebjelYZvGAu3llT84U02HO6OyuozdZgOPEtwDIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC4606D81E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DC4606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wTnqIPbC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12811795e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872387; x=1794477187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=wTnqIPbCdCzWHLY/mz5zY5KROvDJSZmZMvIuR5u0H3SPYm/UqeV0RgDH84ocGM/V2C
         +6ejmmybS2Nm54eDNRm5NQinhGhw6bSgJmElXetnIJ7VwaWRbbZkezJtwla/NeGLzqvY
         gRoOMLWejoyUow6FUC+rbnMtdfMJ/qYGNLz8ITL1cS2TRSpxaGJxITDwhQtVg8sYvPel
         eIXy6ZavW1wnqEuWW+tfd92xmz3VySPVTlPbkpGGHr9lCyihlFvnAt4Ld9fK2IQLaQ8Z
         oIcza0+aucFfxElxHqjy+PfPxmdd1XY6qCS6oOnRP7k8GrwX/Fepgadcqis7Y3/qNMYV
         gv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872387; x=1794477187;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10BBEOGprdi/BtDDiPlMGcmuAA0iZEL4avdyWyBKRKA=;
        b=pznrP3pokzoxeTPI0z3wOk5CpAnwkLKH9AfuQHzycJWq3enpftyA6zmSs9HPza1iLn
         uG55O/olY9FqsnmlTLvpmH9CVbFt1ul/pcnvLga0/gd9TRP1TCUpXwLP9jc8ES0VZ2Cw
         XO3RAAdGmhk2Hv0s8PwSd0/5t9i/27HsMbdFQ+e0Rx3IePnBfkv+flwpUatL+qBTBLAu
         qLed4SuqpF0dr2kki5PfiuWuJ5Gt2cpxd20AR5BKC3oJjPeQzUZtSW9Offm8EWpodYMC
         8Jdjl/xm8L2Y7Z8T+ANc1a3KcN2tNzH5+L3vefRjiX3wCrs7g4OU4W7nqH37Ybo9rjDh
         kjbw==
X-Forwarded-Encrypted: i=1; AKwUvByMd1WV1UtEOHVCZ5gH7ucb5l21sWrK04sBVA0zXlTkFeesUp1Yv/iZZhXUMYWykqDQke8CRCyovESX7+sA@vger.kernel.org
X-Gm-Message-State: APuU4Z8otH3wmpGYFkfY4SgWoDwX4K//6lbpIVP6oiR+AuPCQTvqcf2p
	ms8pev2k91Lnk6Rvaj5kge9uuFAtZluOC8wf8aWpdduLvVsPcPV3rudYI0nVHKcHWJo=
X-Gm-Gg: AYBFou0rjkqaViEhJDr1lOGshW7cPqmzqxcsJ7HkAPCZjtHJkf52og1VTFbct8dMuY7
	TRP2s7EQI204431gs6jdN5mbK87sO6Qqrz/j4NVSaOr3X8b82DmwRaK0yu+6Sh/oMYx9fe6baKa
	wEaBn3rDSl2N8yXj1854uAHV37dB58iHBC3ZBGlVy2XNiyVM6BD0g/iEE7M7PNAsR9pfEhyQhLb
	aSowJQiDGFbmheujHi4hkbJjM8rjdeM4Fys0vE0D+SLHlJH/TqMfwh75aRiEfR8xKk7g+9KoLMa
	/4O4zqXXNjeesuz0TcRfvK7h6TpnlEt0V1jQzed8T20WzFOJUCnhx8nMMn9N9jJmnzelW19HLaq
	i2aDc1hgjY5o5fwb+50Wfp0O/eksuIouZ2qM8CHpAe2qtXpQSXcqImIjWVhA3aOeAdDb6xQ63Fu
	QBHPltyGO5fiWwy1g9MON6ZOGeHidNh7m4yzJNb7qaWmXTWFC5qqoTIXFOMoOiIwyv+65oPPeXP
	4t2a8HYasY6vPU8OZx1mhYZ8Sr2ajWfZB19mu5yRZZP5wj+wc4ngWzM9yFObSDclrOpDSDTsmmD
	Zo+Mhz02r9zkolMeNSyN9Tw3F57IXtuxldApgqS8
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr417919875e9.10.1793872386620;
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm162575385e9.3.2026.11.05.01.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:53:06 -0800 (PST)
Message-ID: <f3de19ce-9a15-4b50-a509-c462bf27fd48@linaro.org>
Date: Thu, 5 Nov 2026 09:53:04 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: qcom: camss: Add SM8350 CAMSS support
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-4-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-4-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add support of the camera subsystem found on Qualcomm SM8350 SoC.
> 
> The CAMSS IP on SM8350 contains:
> * three CSID and two CSID lite blocks, which are supported by CSID gen2,
> * three VFE and two VFE lite blocks, which are supported by VFE 480.
> 
> Every CSID and CSID lite block contains a CSI2 test pattern generator,
> which is supported by CSID gen2 and controlled by the CSID subdevice
> test pattern control.
> 
> SM8350 CSID and VFE blocks are known as version 580, the hardware is
> programmed in the same way as Titan 480 found on SM8250, in particular
> CSID register spaces are placed inside VFE register spaces.
> 
> Qualcomm SM8350 CSIPHYs are supported by the CSI2 PHY driver only.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
