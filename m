Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137443CE77
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315965; cv=none; b=CTwb2EBnySJv/cPA4sbmZ+u0YyA8e8m4szKCRG2aVlHb4JBMbeArlDd/rnmi+7PjF5IpApJXjuRuYJ4DI7UdpRsVYEIwyFLuGVv3sMGDqcpgiiRG1rURNDiDKqmIrJt2ijzo9t5G3PFIusZFLySunJd5xsf7mbSB1+v09Wtdjec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315965; c=relaxed/simple;
	bh=Pgzdd8QWkHLx5iJntf57eHKC3caXUVrMC3GRDLNiXIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNjcW+BSFI2/MCXfCbKxdJ7l24/NRFBxqDt0+TY2WtAXfSBTURKCWBZ3MD5D1FB5stYGydI3Vl9c3xi5R4knMqIFeeihAcUCvIXtVj5/3gYP4/6u/GXu+AQwOZR9guDBcid/0lvxpJGcNw4XyQdRbpWIDurp79Nl27ZkubbDYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mE0/FiJy; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mE0/FiJy"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15c42a45adso255610566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785315960; x=1785920760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=mE0/FiJyriFLB0XSsNSfv8S1OPGzSI/6lTdLM0KcToXv2AgUM2COud11WYHC0PMJtH
         Piebq4RkZZ6Hhdn99hEW1GDRTwynXyKhs3GfgN7a4nClWVoej32HCrDPyzRl630HaLXv
         xPZtsBySSGNKKuriqT1COFcSsKKLK1OYSIrJbQx8Bw06jIYNegOs4f4z1PIQ5Wn6F6Xq
         rO038n1NcG3MTgWksqkd3PWcBqs+euQ7sJkAv6daRCGuhHbroGFHCsQmbzl3oqzQan0E
         d6xsB/3D5QG9FOgqqubGBb/6Tp0WuuJYrMbIsMrgxmecv9N1euvyIeaxkJKMYRNiTxFB
         AM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315960; x=1785920760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=UbodvGqI0O50QVTMZ1eP8fUdbhrDvIme/P+0zjyFQ2AzaoxR+3rUjnqB8u/2J5d2BA
         nn3ubanAfno+pr4hh6J+YmozFCjc5DcBT6Z6mU6VrGrkRaHK0LyiGv5IqTsntSjSJ0jM
         PECDIgFZ1vALX3s42Exp6ZK1iBm7IloKmbIbvixYZqoYByS36IYQgMUPLaxz8tWVoYDO
         kLa9/SUUueM5OMClV7E3W+8Dp9yZg5OZfgly2VxTQuT0DM/qrbFFjIy40NCBSdfzsLd5
         +J6j/xYn1xToB35C9z9fpjqQ0nAoP3XW8c5VmbzPhQv7am34V2UWz/nKUAwuxWY8WMpz
         DrEA==
X-Forwarded-Encrypted: i=1; AHgh+RpFpdIWccps0VnxIl6/+909/h84+8PXDnaIRvrUD3a/P58jmmNMng42FS2ofJpyqAR0R/1pmh3P4xYLkynH@vger.kernel.org
X-Gm-Message-State: AOJu0YzTy0+i+l6xDk5EaF2Bc/9s2Q+8ZTEUPY1GXilJn93ofbcsZmzF
	JDh4KqA+oX/sR9jtOUOscJZA4qSWRwbsyuKkNa1pJaLDEnCvKB76mBQt7so5eDI/IhY=
X-Gm-Gg: AR+sD11Xxpde9mhpdss5RXUHXSM8DNufFtqPD+WcHf6H1sqhNTTMbfkfO1KII01ZIu5
	hIoMXTk/H8vWAoIRFYxHXULsZ/Zffd7FROxty1RrkzAkW2wWa0/8Eb/BDigzl4GehQoVJlJ8y3g
	HzLNjFqvaKBZzoNfGi9UNRLCHFEEOp9LfoEN3gyYHAq0QjaxqlYH++ZJtMMNRc19awBQTXuECZp
	iI9qfmvf1cmd+zU9lmhlA4X4/ywl028K68nU2BHw8BqnzqRQAUA95jwnjqtBlUYMRtveve8xKoz
	VROIBeKIhvl+V9h7cc++SQFg2f5vMsqv5xjJh2rOBlQHgRYTZ2X5ugkELvM5RUM85zC0ATJUiMp
	GUwlJ4AqHXntSdonLseaQe/oJNM1diTcwYAK7zpYVNIYWzQY81tgjnsBt3uD4ty3JYt+FsxAhej
	0qvvGdQSZYgAtpE+7vYXJ51NKZ7HPjZ4cLJ/Kb05Zsm+IdOlex0MKkrkZcJ/r3HBmk+biM1A==
X-Received: by 2002:a17:907:6d0a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c1f8cbc0449mr86006066b.6.1785315960387;
        Wed, 29 Jul 2026 02:06:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cebf3fsm87314766b.25.2026.07.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:05:59 -0700 (PDT)
Message-ID: <a661e25a-c889-4c6a-9052-5429d9924030@linaro.org>
Date: Wed, 29 Jul 2026 10:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
 <20260728144448.GA2141274-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260728144448.GA2141274-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 15:44, Rob Herring wrote:
> On Tue, Jul 28, 2026 at 10:35:35AM +0100, Bryan O'Donoghue wrote:
>> The original iommus list included entries for ICP and BPS/IPE S1
>> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
>> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
>> CDM IFE. The remaining entries serve other hardware blocks which will
>> be described in their own nodes as support is added.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> What happened to krzk's reviewed-by?
> 
>> ---
>>   .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
>>   1 file changed, 19 insertions(+), 7 deletions(-)

I didn't run `b4 tailers --update` is what.

---
bod
