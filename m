Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672336;
	b=WHuATw0txghoFljuxcDph0fzAbszNwRBUd+NBc4vb96PcEkfwkIBS7djrT5ld2rJHLOl
	 RP5itj3qZG2grdQkARombQttJKsoVZqb8EbFsShYSz60WnDE6CyRw3fkNVoKpl60aYXDm
	 yFwsXwe/lTzFOj6Oo0tlOV9lQAvrqdODQlI6EByuf7offimueg6yOdI5uZZKVf+S1WQPV
	 9Di09jQSrXLXBb5St/V41AMDmBH9lzXJnthpskt8M5fJvGL7a/9d6KC6h8IwG27RLdIB2
	 CFBClF4Bs9r8mAqRvoYynKQrhu0bHYPNopb/yoTnNTOqC4D0qeYR/Jc8t0ZYsMiY11w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
	b=vx3vDnhh4R6tVnR63NbqyPvHhCUmIxW2+Bnof3ZHxj8QK8ZZAAxdDnC8sbSd9uPmdfOI
	 ju1xZ8nk0v4OPHOeGB1Yte8eBrpDnNCZFKUGV0jKbDvc6dcakfu9ac+c/VzL/9xVrP6OP
	 /PPMcivC0JgKS6n6SODtXFc3ZVTQTjovXmIEfJNj+PKZe91p246F8fm5201ECREP6bblK
	 TDIvz0qrxreT8m59jGFuwPlYlGIAG6IPE8Oy2EE9UxUlB7gbYKpTliTBTqQhJ13TQ1QG9
	 At7bgP39rDO2N55NDqyQ9KCOAHsnNtZfm7THwzVRip80rrz6vs5g493Bbnkd9FFvctQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DDB606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vp6h4G7h
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c00b0866b0so381304e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795672334; x=1796277134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=Vp6h4G7hpleX+FTb7fdJNRAUYd9jz4lCrh33wMt0Ysn5Nb2Xo1Zb1+kzJAUVK7M5YB
         tzwbvxW6rKNBTKwTsrFX6mUrY9wdUCBJPrDzpBluNzFfe+x0SzxpDd7g2z+1OUc7Osxz
         uEIu5Xt+UxUDEqs5lNqsReLPF3kyI+cUNMjCtVEpEL3TvMV5sjx43V662aDloiIrM26H
         TxMW/fWmkaBqAlyrH0tDhiQQ6TXOAv0/7qWniaGnVMQPuWrv2jbIZ1+opl8j3/zzSJ7d
         R+f8ajGcN4IcmH5VH5PoeMz8OGFMF3xInqI+yNfUC/EWj2pL7DZx/tLkPlZXPn23Ic/6
         qjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672334; x=1796277134;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPWEk037QWIcnrjW4FwU0aU2BDmAlHR+95YsRtbxp0=;
        b=qfifDfkBGbk7nH6NF8ighApGHRDLJ7TuhbtVMWqWtzPMeNWo59nJ6nmkky9ekt7fot
         p7XfaZvM3igruMW1hJ/XmKw5vLsOk+7y1m1EQqoDS8/SqVXr2SPWVQ9bgxWe89mvitDG
         AI7Irkc7CqeV6ob9PR7hvGKZ88iUR7mTerPdcSEGx7flaoPKvS4tPObio5pNCE6PsgXP
         J05iuTdLqoKr8RzmFwkL8pS2qTTMIZIMUJLpNjRDBrgXgcjBWWDswUG+SB9u8ELsiMrX
         GuhUEhCHCnLRLFp4x6O/piRizVPCrAXxdqlMfm4pvNs37jirTS68/OATDnMWEdjeXtw9
         tVVg==
X-Forwarded-Encrypted: i=1; AL+hErGEcICZY9uQACTyPDtlEWV5jnvf1Z7EE9XMyol9nmVejA92nLb2faUM5nvpTwzaxtjKx8o8jnqEh75AigBr@vger.kernel.org
X-Gm-Message-State: APuU4Z/tlMGgcUEWCrsDbolH8Psb68pSwUYhWebm5pmsyYbqXYUp9Ik9
	tVYohF3QnnFF/IGlnnn9kC7m/oZnp/XhjHCXMY/kA6T0ZMcUf1Bw3VB/bSffRBoQhnk=
X-Gm-Gg: AZFdTZcrK6t2AE+DAxXMmI5JGKh3cDC9lhKGo1b7bxf3zws3tCeiKK/iCn/p0t6IuDe
	/mcZP+0WbidKfRqPCECbI073RsCRs4KSOwlD1TSoyig9036mDFDxGVcAAF22nuNqYERiAsX4s6A
	zFSlsh3mYJirVkvaRlSMWwroZQPE4zX/TabZPfA2vwrcconwMqAcBj4KDE1BS/F+ik75ihybsPk
	9zZ4oRcUIHO0yfkswNNMQeDFIkqMXW5pJVLVWW0LSgLMh4GyQR3L/FGXtA7QFpLv44ER32qPaRI
	YlmqIOgKVdPO/0KXmr6tUpR8fk2uGg1RQX+/hFbOUDApk72GoWo2FF0fpQPDfyzqPQYOEuiv3K2
	jSEObSvM5+6huJ54+jG9GrPsGrHtFJBsVVs8bhum/CHwklVGU3JzXTISJEsCM9jfk0RlQMMBCnx
	8AugtHEn7HX5V1GtdYcnY2ipll//032g78jWVJ4M2MoUqKFIth+V1bfL0IcjMkBTig0uYCWA2uA
	KZjs0fevs4jh13XpJI97/vpuH5uOWxtFGXk5supwiZEX2bGiONrfxza/XvtGZCd6o1e+hZ5aM6Y
	JZr6rDaqSBZsOz4Hb4VEZzh918FSHZxdesWOYkRpiS2ftIGCBCgHskcOXIZLVNvYx/voiHPF1cr
	7bLuhBpo=
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr6657518e87.2.1795672333627;
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33a96sm5147700e87.11.2026.11.25.21.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:52:13 -0800 (PST)
Message-ID: <044783f4-29f2-4a73-8b2f-d06fe4a5ebbd@linaro.org>
Date: Thu, 26 Nov 2026 07:52:12 +0200
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, bod@kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
 <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 07:41, Nihal Kumar Gupta wrote:
> Hi Bryan, Vladimir,
> 
> On 25-11-2026 18:52, bod@kernel.org wrote:
>>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -16,7 +16,11 @@ description:
>>>   
>>>   properties:
>>>     compatible:
>>> -    const: qcom,x1e80100-csi2-phy
>>> +    oneOf:
>>> +      - const: qcom,x1e80100-csi2-phy
>>> +      - items:
>>> +          - const: qcom,glymur-csi2-phy
>>> +          - const: qcom,x1e80100-csi2-phy
>>>   
>>>     reg:
>>>       maxItems: 1
>>>
>>> -- 
>>> 2.34.1
>>>
>>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This series is already present in the mainline tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

Likely I've picked up an old series for my review.

> I am not sure why it appeared in your review queue again.
> Can you please review the follow-up changes instead?
> 
> https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/

Sure, will do.

-- 
Best wishes,
Vladimir
