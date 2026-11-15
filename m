Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794713108;
	b=yvnPMoMXvGKUx2DOpcAjUpk4cDeR9lqti4LZr+3wdLja/fOBF/M9g/avAt1nXghr4SzR
	 VXp9A9qO2/m9vRsx4kODsJjktjl8DKF11my9xgazH+jM7OF93hrsCD03BFj5pr6p7bakI
	 6fDqUJx/CWlGERGfvTEXRcnZ67zWlAY5ZILsDJ9hC/dreHu3tkjv81+izurlgJGc37HxE
	 Yhxhdc75W0rH1D2T6CkjZtWI2pr5Npli4w/8ITZnwuejLc2UOSF1kYhXFX+vDoEhsxBdz
	 LdBY7BLbMEzrWL3DTyQgd0OmapMVeFx41O2Iu02dz8pIbDoBNOHFH7R+oafOif7OlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
	b=dH62O3HrDmG3MyxsRNdc7Ci/obWPvwgcxoNCOFrJRdtDK4BBoM2CL3loneMgTzFkNmA5
	 eJHKeKqwE7GFuoGt1VDKDg1Cb6zmqhsBB6HNSjQBCJjfAEukGas3Kv0hfUeYs9kwUocTG
	 mVt9k/p53GCMne6qBZkW6qHExB/vNpNJpVbQ6Wih+swhVyjnMj4KYmtukqI05HwsOl5D7
	 v4vEnhzY+aCyO0b4cbWUY+nRh4gJyxL6MxN/zPOpKssKNkcOrfZytR3X7DtN+1jbmVNCc
	 tJfs/jOwBzkyICIL1thEkGx8096VverNc8uvSr05WRx5GUaqE3u5bc8X/y0s9CKeEZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F0606A32D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 03:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE4F0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhbsYhlf
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5361e313e63so38210611cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 19:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794713106; x=1795317906; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=MhbsYhlfIboDlJO0nr8sWHoWk4QYWrxgr1DjannNHaSkkSgGBBcYSs3djiqkqFC1/6
         m0ZUne9cIuREQdr+58Uva+zsdg7kB5jgVKFXT6YY5hMIQlk7C9QTgBmy54+Hsr1PeRq2
         2XOw+re1SXRO4deRkyfpCKCg9/tFNYIwb1FHKXZIa8tBcGgxkRV+CABQxMzK11Ij9vXa
         SJMpOs4QIBCCiBaHDKjfNDYhy9HIsKamrxfvjAbVPx35B15vgPxKu6Gx0VOqpzzktnT5
         3CYJZ8VOssDKKYsXLUo5CP3y6tt+shDW+HAXFmMdCBoh8/v5nTcNrF2sm8DK9wyREbNj
         MrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794713106; x=1795317906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jVTqA8bBEUloDFP/osFHIzevEsOMQXn438BieV9inY=;
        b=wFKELhJKbH6LLcsNQuTlAHZEWp4bVpps8w0iImmo4KMoQB9z97HU532E7MNG50/CnK
         ctFi9T9Cu8sf8vFMV4fdcylc7wU9ghJalF7bw3bwqtBWt1WTZXZ/mQ8zcb2gvxLKRy2u
         VjsxLdV4Egaq46hIr2uXA791q5jNbxZDoims6Iaej0G+4z/GM5e7TiXOjUBePqhA4dHr
         c3TnXgegfsoy/vyGPrFXEnWco4pfLnMtnHRMdcHZaA8Ei7Z50CNfHWUfPvEV43Fo8ZS1
         iRu1RsGnwfAld4HeHYoo8SrKBx0wSY3nXmmJTEN5Em3FOOYEcRjNbAfJrel7+louPbpe
         vRAw==
X-Forwarded-Encrypted: i=1; AL+hErFLBQiYkWI9jNgF02bGNeaeHGdlsbk5ANArqN5WJ17Nq5et+KR0tjUW3QGs0Xl4J1NTl3Xhfraodley5KcM@vger.kernel.org
X-Gm-Message-State: APuU4Z////2BlIGb/+EuchXmfQlnuS8pAAdAyg6kGQQA95YQFtTCsNmc
	GXzfWwFVeE2T+Zn7fNUjYvJPJe+OMu3kXjGYHSibDmLgX/alyVdD2QsG
X-Gm-Gg: AYBFou3vkGRqIHrF7gKjEujeQ0QmTo8u/xotdqMOyt+00I2xDy0JNVAvlbhHrTr6ctn
	GgfwDytLS2swE5DqDZAvPfC7gHJMLWez22nc3CUbN6S4PTiZBgfIar1wBFol2Og0EGh3+VBcp3a
	3hjy2QgeyMXLtb/zC8TW5zKRHLVg1HYoupo8fgnh/zGjwaoRrK/I9mZ0iYZd8F7Ar+9RlSV22RU
	eSdYUz7OY5mNQvDPBRhu/K+qreH54UoDJ5Z2DWSMTV7e2bBhTTjdKuRFBdPBe0fJSJ7CY+Zw+Iw
	BQhIX3x2ZKYRCnxeMUWZEmycFzhTEtsGeB6cVo/VPWgGRxbETMtqWSOFnn247EZmB4BuhBAnJpw
	X2Zao112kZ5EWjieHOdwndfN4zs3vdkhtBon6tousmmZ1LUlrtZAyRcPZQIfWJMAg++cSrBMQY3
	O+dICCADLidgXghtNFOBaCG8XudOlrnoPppOSpLqjuNAEPH83OF7ZqK8J1ZwOJwpb/cq6TxIK4N
	alrt9+l67b3OiUN65nli6ZTm0gzKkrrCsMTWIM8437TJsroYkw3cRaMAWwk3OSDZfAEhFNJEZEL
	JkIHrH8qE2T2vpoWg0Ugip6zBldMfWhPTaxVgwz+xezZ6OFZCZiLbmsE0MjekSNwD9qVUoQFE28
	86BiYBwzTNHcSzpL8CQqAkOMon31E9ZrP5DVYfI/5U89AeuRiOcLw
X-Received: by 2002:a05:622a:228a:b0:54a:6b3:488d with SMTP id d75a77b69052e-55ac7172abamr111430891cf.21.1794713106562;
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm55747396d6.19.2026.11.14.19.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 19:25:06 -0800 (PST)
Message-ID: <81ac592f-18a2-4715-a34a-1f639ff7a454@gmail.com>
Date: Sat, 14 Nov 2026 22:25:04 -0500
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
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-2-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X tablet was listed as a single generic compatible in
> dt-bindings, but a device tree using it has not landed upstream.
> 
> Replace it with three model-specific compatibles:
> * microsoft,cambria for the orginal SQ1 model (with cellular)
Nit: "orginal" -> "original"

> * microsoft,carina for the Wi-Fi-only (SQ1) model[...]
Nit: ,carina -> ,caspar

Wi-Fi-only has both SQ1 and SQ2, please see reply to 2/2 in series.

Thanks,
Haipeng
