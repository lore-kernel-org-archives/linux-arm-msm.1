Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD15439F90
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011881; cv=none; b=tSeVYF0HcIk2v1TufVaAlfLU8cH6yJmBqzR3vdWOPdM/Dp+QjX2EKNFVEb7jyufBSXf8UEmDzy+kWJ1hI/lnCPXHi1CpX+O+uuQITlffrzROAh+P7+WRTXkt1zmk79wBWN3EvvsNeDJiIqzkxOn3fYl9r/P2APJ6AocyxHeJ/VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011881; c=relaxed/simple;
	bh=Y/BfzcHBW1+/hTfe8NWTi/nlFyz3lih/XK9O4ky6nXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJ0DvKDPbAXu8aB6qg/yK1c4t1ArSaGntD1+bA+Bc/zPkYpgZfTdD2CTjgVUO1B+zt6lGEjhe674+LH1eRC6jWZaNxgsOK9RCJ3zgbDAAi4IK4bB01BW3fJAg0LQpdd0sVmxmNNzrXIh47mE0c2/dhuTa+Qg2r2LMzJp+oOJf+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJX5unF+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJX5unF+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-472326ca506so1369956f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786011878; x=1786616678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ufo/CJ3ncCi7FHgGFSyE4mS7SJGms4hMqbby60EAfSo=;
        b=vJX5unF+o+L9Usnc99MdKQh4Zsp+lQ4ru1UyOoK98FsV0FqMmqf5gFqv5h+bYV5F2K
         GDVnM2uu7CPu9Dlx8iBfbun2T3G3Y8sBWdifVWM+bics8QewLZ16Hgyg1G11sSdzi9QF
         ZxVsyQ3Cqbs29GuftgkjO3PC+ZaqhvztBrWhw8LC5drldcQzE06EBWktd2lGKlrQfp7E
         hWhuNtRBB3eP0dahzW7VgdGNFpkGW8f/2b6dOMlXqnjYWdpvJzCSiFBw3n99xnc9mxB5
         ZQZv8z/HDFJVWoS2hxL9r1w2dyj7yf3M1heYh1rYPfEjoJBmQIFmAfq4OPkw9M3V5v4s
         scEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011878; x=1786616678;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ufo/CJ3ncCi7FHgGFSyE4mS7SJGms4hMqbby60EAfSo=;
        b=iVTc0DFWfedNpdIvc6UUoVuXiBNtdoafVCOOLem3MtH0UQtR2RpS+Y7LbtM/5FLia6
         YttfXwbgexLijNF+Q65BgW9OS299reJvTY+ylpBdS5Sv4VGAn2M5CpV4PVwZAQMPnyk0
         c/U7emzGXftFxT/5JTrw88pGSFLh8Jha6t4OCQrHdH76WUpyezZcCKFyWONio5neqsCH
         6wbN7h5XzlxyBbxLMTCKkK6qXAYi/O/RcPOm1hNFGxbd16pqWNJTi10wIIJxwFGYvHk+
         sVYZNeviH1+kQDoEGHlKf18Ziz2OI/YjG9I+H64BXujzLSKg0kyu7NUgcAesm8/8V4Xq
         4/pA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2L80dpkVts781YccsVZeZriu4P/p9NaJG7aL/MPaGyNnC/PzXhQLIvKA2S3Zn6DL5QBCYNR8qFVKvn2gN@vger.kernel.org
X-Gm-Message-State: AOJu0YyBKa3CbDtK5i49FmtKaA5bcVoaw7GEx1uxJgDFviP5MC+qrKqG
	9Bal9fHdmDu4EFFQaMDhjbQTSZbfvhA55+keQZGOLMPHcGBWDfBqOi325Gg18Ko9IJI=
X-Gm-Gg: AR+sD12QFTtL+CA6K6TCqfqIsNMoaBmdgVFEUbesdfzVreTFWjqIw0vw9uEyQsDR6Fy
	9yb8SjgSJv0+32S17dRl8DV12WUdlKi3bxZ/eFgZ5xcz5ZvozXRvB7RBcwV2CRbz6r2wZj4z2oh
	CuhT9Je5ukcAbEd819qQRSjAAdCnJJqcEA9jkPRLaVRmp2epkIsePMtad9cGIg8DGEoF29Y39LZ
	C1wIPqk5EXwIKAmNXCik87mG9SBPodsWfrH6HYCFfG5N8o3dGYSkJ9b5dX0gyXAr3SXK+3xOoHb
	PE+FbiYjnoTVVPpQNuU9EUo8dDL+bo3Zg/lgUGB74+AuHNPPzh71rZyxyQLByAY2dQQaA+n1UDg
	Fp/lpZKTQChpI7UGFKWR/fiPw1kf3pjiQjFI1FFtwJFc2/EoqIqmzsRd1aFFZZhzHY1A0uzjWxs
	Bgqfk8BVm2T+DHziel+RzDoLk2DiOqtkoJr6PhNw5A0jcNv+jV6FXMLEvXmkn1UzwCb9nnWpU01
	Q==
X-Received: by 2002:a5d:6a4e:0:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fec4edc2amr17986324f8f.8.1786011878436;
        Thu, 06 Aug 2026 03:24:38 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.115.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b250cfsm5060906f8f.28.2026.08.06.03.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:24:38 -0700 (PDT)
Message-ID: <72b267c5-6490-453a-9900-b196d1cfc5f8@linaro.org>
Date: Thu, 6 Aug 2026 11:24:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
 Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <futJwsC0VjGSkjrB5PP9T0jBOVgWADaDAYyRRp-OZifaKPNtjcnnA59QJaQTdqYTeayZk9jY6e1jOfun71Yp5Q==@protonmail.internalid>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <689580d1-8169-41cf-a954-927e10135700@kernel.org>
 <d0983bf7-a708-46ff-9f86-f94fb6a92ba7@oss.qualcomm.com>
 <d6ffacaf-7f83-42be-a3cf-40ce00810ca9@linaro.org>
 <Ia82wa4IJDPkQZpTCt4MDMqtq1VGZ7DqIaJFNvV0MjaT3jjWrbD_iBs8RU7pqrIz-ZTMSK2irncUv7-PZ-fvkg==@protonmail.internalid>
 <8130900b-c9f2-4f5a-80f1-1e8567ee1b72@oss.qualcomm.com>
 <f252d83f-e0e7-4061-8da8-d2650f1beadf@kernel.org>
 <ea0f1777-4615-415c-86d2-2a792ea42b3e@linaro.org>
 <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <41163185-09e8-47b5-9ece-c6503cb48920@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2026 11:14, Krzysztof Kozlowski wrote:
> On 06/08/2026 12:07, Bryan O'Donoghue wrote:
>> I tend to think - absent an obvious an immediately applicable fix these
>> two drivers must be marked BROKEN, the alternative is to apply Daniel's
>> fix and then live with the results for the bindings.
>>
>> Since the DT schema change is still under debate - what alternative is
>> there ?
>>
>> I'm not far off sending that patch now myself because I'm not seeing
>> urgency on fixing this and TBH that's pissing me off.
>>
>> As a user of a system, I expect resonsible and honest behaviour wrt to
>> bugs, not architecture astronauty while my system can still reset
>> despite perfectly functional fixes being available.
>>
>> Great you want to do sub-nodes in DT. Not great, that's not agreed yet,
>> even more not great - the venus stuff isn't even on the list.
>>
>> Please indicate what should be done for -stable this week else both of
>> these drivers need to be marked BROKEN.
> 
> Nothing should be done for stable. Or rather: you can do whatever you
> wish for the stable, because we discuss here mainline, not stable kernel.
> 
> There is no problem here "devices running stable kernel are affected"
> which we are solving.
> 
> The only problem we are solving is "devices running mainline kernel are
> affected". Fix this one and stable will follow.
> 
> Best regards,
> Krzysztof

Yes -master.

My issue is how long this will take. Several kernel cycles and the 
debate is ongoing.

Daneil's fix has not been applied which means the replicable system bug 
is out there in the wild, not addressed.

Daniel's fix could have been applied and rolled out to all users in 
mainline and consequently stable.

Instead another architectural level fix is still under discussion, which 
is of no value to end users whose systems can reset in the meantime.

Its just not responsible behaviour. So I feel both of these drivers need 
to be marked as BROKEN unless/until a fix lands.

I'm hoping the vidc team will come up with something else.

---
bod
