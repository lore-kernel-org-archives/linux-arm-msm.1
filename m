Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201405;
	b=RXbkLQMXu9FoCQBaWJpdhSIVLF314AJ78y1Q//K0SuS6SbdXw11z3kZ7mvTW1E1KlsZW
	 eBpm9fpKFhpaS5lX+iOqzj/H02gkKrLg4KYqc7N/RJdA2DZBZqzNAEOp/wdxmXsCMLfHb
	 Dv/xYr0b+AQa9JGVNy8GRXlYkbbqXDJ/CRnCecThoqUUmj/SCnad/9KW7oLlqi4UB/AC3
	 UxIpYIXlOXRzVc2Eh/+DmujpC+1xmcTKMhnIjX/XxB6zNuGQfoOoVM5IqbQB5tWDTjRbC
	 27+qFlfcw51/KYW/fZtf54hZ+YFItO+sq6BmIV5/pgmVRRYO5t/j0VVf4unFUrDh4XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
	b=yIzW+O5ArzUbZXaaX2nPFceFfc2XiCkE/Qy0DIXfGsEz4gh5zeYZym55w+H9KGY2QuYa
	 WA1lsH1F8Y3HMDx/+q7/XN3nzr0VQ2378dA3thRCm+3+eAv4BIYNjNW46yiqhWkwoQuJR
	 AMJd2Dslc1Mz+55jssObFB0fHQpAFdBh0q/FbO4xZxgvIZvWk0HDmeeEGjlk1Mbqo2He9
	 OZdAkP7tXNf0x7GsunaT7bvsM8xhHdLEBGGddKa5kvPc8987zWSn2Q40IT5xIayHMpTYe
	 keGITgoN6eHjy2FAO45o1M+iRqr9wvLPx9Ny7H8+BzBG8Vi5DODa71wizmF257KAXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vJ7yndT+;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5CE606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vJ7yndT+
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so926702f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201403; x=1793806203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
        b=vJ7yndT+O7b25l/wGMPE99amMHah5x7U7PfAMfKkHXLbqya0rXClPEzDTNGmkaVBop
         ZD6lI3L2tZL9Os0N0IJWyND6zjGg/IaB+aT8r6vy9Y9TQB/LYjafLoArFo2ufYVPlRrc
         iHCvsJutcMM10JNrT4ndOL4GGey+/+fJVBxh4tC6vHfuWYL5x/Oq5MckLGZ9e0Gsy6JH
         bw0Im5uXyiIIyYG81/Cpojqtdve9BCmukfm70cvyC/H6KxM39Nzp4sFcPMGXSSjf+jRY
         YKh/9E4go4nwwAJCP5viniAsfNFlVKCllc3y8jXwDRi58uc2koDt0lAXKTj7zQg+sql5
         x78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201403; x=1793806203;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v2xPMZsBlMMHkm+gRncrQAOKCD6wJbIFyj55a8+d/IY=;
        b=kQlEAWkEB1R9CFG4kIfok2tdEqQgZwUbfNh56sU8kJPg4xmIS4mXxg4ITkO19YoTVR
         KD/0/tkvg3vvgdgf365jklOOY6/mGqFE6hYCRbe/Aguvn55gRi6UFl3KTqecfMkEjrz9
         nsVoFkxOa05eNEmuGZPopyurXtIcG95+VATWOUehueNLecoSReFRCuIWmzcvwJ/elrbU
         cmIYPo7pj0VSUotKz5CkG0SGaFk+5+QKGjIeZQ7FhmOZyfIX8VAiGUrbtMJPoNIF+4mX
         GT2Et/K1CYDT1AJ/3ME8P1fFfcVmDpaiN+qR/nIg+X77g+NXIqUJX03unMAsBJBpcq+f
         Cpyw==
X-Forwarded-Encrypted: i=1; AKwUvBwS877Ei7YYD/upD/1p7KLcOrki0+ZcDVdADQaHH/6CLZbj3UCw3LHiC0JjEUneDoO6EiA2/gKJ4RgxF3Y3@vger.kernel.org
X-Gm-Message-State: AFq9FYL8hAKxNB2kkkEtDY3uFdYz5BlwKH1j/4flMhuqihCIw5wUGXKS
	5omswUZxB94OZxL4CF7l96jHM1IGjbitUVNeNGwegP+kHXpE2JuiWpkacW++6p9OJ+Q=
X-Gm-Gg: AYBFou1iyg1Lw273lSPsqlZQjo3tie7lQzRzWNY77wWF5NpAXhFUGy4aq8THuYjFGdH
	717Fji9s1CA2hQEMUnLCrh53lzBZTji6AcNt0MRGMrgIpJw654w6MvZ632nDW4PyFuMMm4lbDFt
	AzSi/Tg1n9MohMrMQKlVR8wYG6K+tUEKwEA00fiAwkjG8MDd0gq//pKyRg04p1VntxWPBy7Sh6z
	/629qQE9ANq1z/BSwYexbuohDAjZwlAr7F+sZDNGiS/c2sCY8Q/Mcs8q3mAw2O/iFyCE+/cMJz8
	3Xd+C4D5AJrsAoCoqLqc3O0/TybxNA5EdFnvcKGjmPuDQTLz1uOhPSoudcln9aL09f0D1feSFc+
	L4V4Pmym+fVORVJpRMBdoRpFwC4GtzYmiCEsUsVobU6ueZZzLfT92R4FXUfIoubt9xigNygOL3d
	Hy5GDHWnCf/OscrJ+0XtzLSirUqPj8QeZZ3cmbhKYfaH45ojeNvyfVq7vYxQSDFaRDpSZBBtBV6
	6ZHaTjJgZTP5hvajjhIdlnqd12lW4af/a1FVGR9YrnmoD1iBFArAQnvPSQ4sdS0MFVh72ulQBlL
	RAy313SdK9B0BvAiTlLweMN5EQa3myRdOIOSgIKk2g==
X-Received: by 2002:a05:6000:41c9:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e5d5a45cbmr6725057f8f.36.1793201403193;
        Wed, 28 Oct 2026 08:30:03 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm29519048f8f.16.2026.10.28.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:30:02 -0700 (PDT)
Message-ID: <577e81ea-56d9-4d94-b5e6-364f728c1493@linaro.org>
Date: Wed, 28 Oct 2026 15:29:56 +0000
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
Subject: Re: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
>  From CSID 680 on, CAMIF was moved into the CSID and the CSID became
> responsible for issuing RUP commands. Starting with CSID 980, RUP and
> AUP are issued separately, and each command must have its corresponding
> SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.
> 
> CSID 980 and newer require a specific stream-on sequence. After the RX
> is configured and before the RDI path is enabled, the CSID must first
> issue an AUP and then a RUP. A RUP issued before that point would leave
> the VFE without a BUF_DONE event. Therefore, once addr_update is set,
> the VFE must skip the initial RUP during stream-on.
> 
> Add addr_update hooks and camss_addr_update, and make camss_reg_update
> handle a missing callback safely. The VFE keeps issuing its initial RUP
> during stream-on and behavior is unchanged if nullify addr_update. The
> skip takes effect once a generation that sets addr_update is enabled.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

I think we should probably serialise reg_update() and addr_update() with 
the completion in the ISR but, I also think that can be done in a later 
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
