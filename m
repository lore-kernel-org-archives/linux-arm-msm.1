Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EEF43551D
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430059; cv=none; b=Gd/ErEZ5Gx9l8ru/oF2Mh7XDTFvGo2CN1HhmuoSvcYZnZAGqSQ15ndfC34pHV61k3pTt6Xun1ZV+IT6HIltkUxCO64MT80ySEZvC9UnAXxY5tkzp7QFgzrfmWYLxWfrX6CChLg0KtvrDDyrSRDTqLjhgqSI++6fNwjgGQAp/DxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430059; c=relaxed/simple;
	bh=w6XavIMw57aHLiDolrRY4GGk/U21PS94Ij+L0KosGQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXjH0GqzcceAagBSnt8FqToy4ZvpNLJHKQF5y7OCAjpLd2kEEY2cwHNX1XanNT64VKZIC9J+Fy1o0cvZPgsokTIUcfyKgsdkE36czQI29fq66z0mEDG3KcXU6gNOMIBH1+rL2ht1PU01RGWGwf3cACEVC5ovhx3YlKvjs/tWppE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LS4C5tZH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LS4C5tZH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so985774f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790430055; x=1791034855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=LS4C5tZH+706MxGAzyunUKi/UJ8wRPQ2MUXJVBh7oJkifoIQPaPsc1s8FCz5ZHyauE
         RBT1SdJRlhjpxqvnjXMPM+q6hiVwrV83uj/wUqWEP1q2CJTbF93G5QNhpfT60CY2H/rz
         t5oQWch3G08E+hcEiTnQPvpzTeQu89sk8UQpKnRbITfFnlX+ecAYatDgMg83zTAB0jh3
         lHSlS4alRSj3oNWs5hiP1fc9yi3tEwk8zOm/nbqGdQmI+/Y8LWHL+a1L0gF/WMO0dQSv
         dfhszJc9qgKoFMMm/z8yQmgfkjt4VWJZcW+7f1QjOgpORVx1G78KPFJ2U7AOdzjmyi2D
         fV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430055; x=1791034855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=YeevfILRIej4V+tGClzrd+LM4rJMF2dv3VNRnR++AtVDl5ETGgYCamAOQH6l5ec+C7
         UlLKA3rAPA4vE5dkL0APHuH+4DWyDsY9tA+IYlmI0o2Tmr4BJkVl5TdY0bfIejvYPxFl
         v5huad5e5ijinHltSyNO4VATTpWmLrxeigBhgWzp+raUrsEchL85b0CDDUI9Jfv3fjfu
         6Z+9b9nvCyvliD3d/N4PPw0KMIhJTlY257QGmqnOEYzRRBx1XuXR1gt4qULC4ODwdM7x
         5Nhgj2lN9FkP+LMCMUMcPIArIN8sGRmKXP4KCORxWhQCQkk0NWyJypaO6bnVleiH0OcP
         XXcw==
X-Gm-Message-State: AFq9FYJIMbUnc2IBbE/nTANbRrkaK1cJ321wg+mzpGVwguzaK8BrZqfu
	+spTbZ9CCLa/5jQ80vGVoXojVO23goaSNCwtOuIpIG0yhpBEF5ToJ2460xdTfHnflhhVLkemXkG
	XpI7N2zg=
X-Gm-Gg: AYBFou05rVx0sWTxEV8xVHC8CBjtPJQcdxmQ0PLRxE9tYkERjzbGsq749yrtlEd6ups
	LTUYsEbOKZ/kETKECMFqIsoLyXeLlE/IIUlKFa994tWgcY2X/A+MUlt3TMWtjKeHVBgv3FKrHVA
	tuL0U6JgGOM34Ztgj4iPJ27o7QTn1uT9jH25pYbf37fUSgRYrlTVA5hsg3MkI05E3N0u4OLIFH/
	VvqbFsRdsHKiatMDbdD/RI4C/VytwGBcEIK3mH8gI/IIif/6IGVq2Nri7xQvbHaLTx4dEEVMjb0
	zN3vKUQZ7meprlOOu6tgw+GP687vIuuRL6ULYfEvyI+L0HtZHVgKPeU9DqZ1F0BECwFMb/kRxqB
	L/E4RqoB75U2NOwEQrt6Fju5rEjW96nnAQFRObFxQ4AyCCyVpbohjWwPvisnGuiZn9Y5oGCht8y
	S0RMkYZw/YhPWfa6RX59hGV/kECYjOE2PvH+fVgF/NOP6sjTCxDwn/P7UpmsLegAH8kRtV4G08v
	dWG04n4afo=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id ffacd0b85a97d-48889876a66mr2785861f8f.23.1790430055389;
        Sat, 26 Sep 2026 06:40:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14660447f8f.12.2026.09.26.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:40:54 -0700 (PDT)
Message-ID: <bd0a8dd8-7d0b-441d-9b14-25fb153465db@linaro.org>
Date: Sat, 26 Sep 2026 14:40:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is needed by followup commit introducing 1st gen of type-c support.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
Same comment.

Understood its needed but, please describe why. I haven't read the next 
patch yet but I guess you are going to have something other than struct 
pmic_typec_port *

Again a minor nit you an fixup in the next rev

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
