Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616251;
	b=44HL81YOINzoYh0bW3TVOd49w1VgIqMy3zuzAn5JhNO9nANn7rmdtxu+Z71idNbc3VZq
	 p/sxqIAnQh8rSNbnSZz6a63xyUmrcu0r55sSJJAvmDsKNlZ5DiVaJbuxg8cH58H0vz1mA
	 TUzm3QaVLjtZdOVFwxF0CI/JKSrJl1BKOt/5x/1b/jq6Sp3ysPBPfYPMvx2qFDwNF9yd7
	 fZUFI/w3ioFUEUDPwJQfFD/DgIv8wdDiHfF+/V3xt9vn8Zh/P6HkCEuCv4HBW4nCPfY+G
	 QYmTAlJzl7bMm+1aBi4CjvAW39gXOBDYyYVvniMdHbQwMYqGN9J4bWzyQcp0QLWT6Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
	b=AhTu190TEn5YyJMP2e0hI+L/yHPsKzTMjfVi5WktSfWEk53/6eCjshsdSFg4EUJJhGlw
	 bV2TYTSnzB7SMTv9n1ZVjsMocnwJBsyfq+vd46aBVhCmzZ7qArz4c5da5LAdiFrijk8MY
	 D5KrDz5iMQrYSvSYWrX3ZJgwQL0KcpNi7NltugRDfKQSbV3rfZY8CsXlEQpPogkvx0A2I
	 qF6ThTVPSZ8gMNxmz/l0lBhp6slYitjW3sDXf8p3wi8QL9myMJ4G1Slg0a7Kv1uUdsbOq
	 00WQ1E58jEAWh/l3nFdjo/NOw/gXd++HxcceZ/dsm/scrqmhjTS6zxbV1PuTdTAle5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD3606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 14:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FD3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A1uGbcBK
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14c0503dfso521897e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616249; x=1796221049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=A1uGbcBKfncw0Tc0tLr4lyu6d9hbYldzQ35IkDT/oie+1W9Oj7OT/fRppeExQukyJX
         i6DBLiUHi782agsruQuGjA0zcuVTluaD4d95YNsXDOIY62phyVNZIZzGpg82u5r9TBTL
         KP5Evba48Ci3NeR5K4gC5Uo3yVTh53n/yPMCAOudo/k3OR2XuCO5snmihk21L2FljI41
         0267N09LyKKKG7mcN2RHMuSjHGZu2U6xwNZnP9qKjd0uVbBnDo/sDu5pII8SHH9DCC2j
         WMIS/qGAl0H+vQPvMGsMHjv4INCcwDqN1xDPefrteQIKQutbbRcoOa3ky4Wz8GjXsAph
         mzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616249; x=1796221049;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAjT/juoIc9zz5suBwAKIoZ37zYZ6TKZoBm98/nn904=;
        b=k8ZDNOw5YlYayrj/UDx6UZOc1nBJwFhWv7sIlxOU49wyGApXk7HtSryJujxXOvP564
         rPGffHuSSeNKbKP9MR3kVa9E/qrpbac4rTxhzPosHts/bxGOPFmjTC82fT6SOjdZHkpt
         PhjCgCg1EAYfB9qnJ3MlsjbHn/mzIO499aKWhXouFWnlMT/EbftuCU6H4L/NhztvRY1n
         99ZOIJmT5HgEsjk6DE26dS5MOz4f9/U4tOXUL8MNp7N6Qnmz3Zbu99HQ8M1vqGgIE8zx
         YxmpipXQu45lRCEX8DxE3pwSYOalSGD2PoNmWqhV7t6QRtLFKegF5cuioewVoD8VTWDy
         Qw1w==
X-Gm-Message-State: APuU4Z+QojZkpJFBN4Clv+/4KJVngpMEuQnsRWgEcTa7QHhpzKDUJQMm
	WZSAal0eIdTDe2briFluFxvhNRiVaM/EXjhgHXjNEltjN3AyhoIXQE7PBfM0w+KREb8=
X-Gm-Gg: AZFdTZeLNNMS4pUAANFYN5ux+X2TGSr2HW7zTcAOYZbYjG0EiXSe7S4sPR+w3g9rTBP
	kW1M9br+t3utwgfk7O8V4vrZps4/BxnFLK41FD/mmDPZmxBiPR/hmGOjKYs7xPGr9SDyhF3/bcP
	A+j7Ub8iT5hcHt7Zp4F+wih1v27Ywo/wtkoGHAXs3KeEJD7WoAnk+k7J3SbBBnE33MeoVw9Zrkj
	UpM1eVz8vgVLDkHeafZy8QeIL6ch9v83yahVF4khYCDIHx+V8kgNLsCPABGa785ELwGlm5kcUGD
	sr/DE0F7n3PSMzvyeAsku2+jf6VEksy/NXTdg2yjyuGEaXAv4nXjlhTtBKCy6i7fGBNNjXk3DPG
	maDD+doWssOGAnJ4gT78jC4RDJ/FtmJflMGQuK7MLljbNof5X+gD0hcRkrvnevAPAE/gtZiAQQF
	Do3FDCBUpdGvzpxntDBDquwIzv21uIto9TZkmuKDZ9JVc/e4JTkCzqMjQO6MotNW8n7j4jCrEpw
	KRC3sRd/a+wPZ06dCMoe6IKJUpovU3Kw5lkv5jN0EuUG5WmaijgDY5ZGgZp7WUeRJWvxNjI5SmY
	2ikFIgV3idGAxnsYOY5zu/IhXWOifSYoZ6x+Y8qpKlCZXdcFMyN7Df/8cbO1OGkZdZVIN6eE+zP
	4YaS0sTw=
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id 2adb3069b0e04-5c1bc785b7amr6120129e87.3.1795616249240;
        Wed, 25 Nov 2026 06:17:29 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff993csm4633339e87.23.2026.11.25.06.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 06:17:28 -0800 (PST)
Message-ID: <a1b367f1-a65b-437c-a9b7-92b29750597b@linaro.org>
Date: Wed, 25 Nov 2026 16:17:27 +0200
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
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add Glymur compatible
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-3-d7c2983d6d7b@oss.qualcomm.com>
 <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
In-Reply-To: <a2010032-8750-4289-b443-3afb57d656e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihal.

On 11/25/26 15:28, Vladimir Zapolskiy wrote:
> Hi Nihal.
> 
> On 9/25/26 08:48, Nihal Kumar Gupta wrote:
>> Glymur's camera subsystem hardware is a functional subset of X1E80100.
>> TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
>> three CSIPHY instances versus X1E80100's four.
>>
>> qcom,x1e80100-camss is not used as a fallback compatible since it is
>> already claimed by its own binding schema, causing a duplicate
>> compatible warning in the DT schema checker.
> 
> This sounds like the DT binding documentation shall be fixed instead.
> 
> It makes no sense to add a large number of new compatibles to the driver
> code.
> 

Please ignore this my comment, I believe it will be simpler to move
forward with the current code. Sorry for the noise.

>>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 23f3cc30a15a5e098162bea98ba69fa636abdefb..9954a99981004590d34c722337bb6510fe759699 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -5751,6 +5751,7 @@ static const struct of_device_id camss_dt_match[] = {
>>    	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>    	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>>    	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>> +	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>>    	{ }
>>    };
>>    
>>
> 

-- 
Best wishes,
Vladimir
