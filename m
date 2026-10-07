Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7F47D45D
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367177; cv=none; b=aVB3pJhZzSsNbHU0b5A8tvcCu5nu3x/IUGL1Z3Sdy1CP8KprkmWEgSErDgpGHFmO8O9EEbihpf/6ju4mydphPoaRdSInfclhTMEMrm+97Tvrx3u4BOxCSvQNMnzJ6GmbpuNBDOKhZawvrX75I6m9XUVe+X/ZreM0Bbk3FxMZHTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367177; c=relaxed/simple;
	bh=kmGNLGlm6tNuBK4Km8Knj0YQ70asOkHqSfPZaWible0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pW3mmBupcZ/PrGT8ZDtiPGWMLcW481npSsyLhyShCPSykDZ9IHld7EopGhGC4lbtJNbgT+o8tsnElL4g1UkrXj7zxbinKl9oLRCe2nG51lT/L272KyTcdrpLMjk5JPvIlY6GqIt3F7OBEVgF4LI5upQtXpmNMEZrmwFXHyOBHxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygegAxe7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygegAxe7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-487049569b6so1189269f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791367166; x=1791971966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJMzu3EgPln6T21wshO1DO/di8VbPTBozjlpVJV/BNI=;
        b=ygegAxe7ABQ4Jye8Lt087PQiHH9kmbDquYHHL5d5hMO6EDmKfi66Sc2kDf/Eidg4ps
         +uEZxlJ6xKOcC8/ytZTpik2+k7Fv0sQOa9NAW2q+Kk561C+3vhA4wp04Wmi7GAvykjdx
         Y7zSAUQK1WKNJLZLDPGH0ALy9sAv/NhBVjxWL6XzYJ7Jdsqt7/9uWseagfZ1Xhem1f67
         /VbZ8RFGvGJ6AcwuvQUSGLtfdTXEzK9aqFmSuRxJ889rs+sc5zuMOCgxd74OtrL0lXsL
         dWrWSPmGsiH5uGAtPICAkUgGIrVD+Wmdy7XK6whuBsRTmFnPoS3hZFCo4X2Y0mhbfDM3
         YdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367166; x=1791971966;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJMzu3EgPln6T21wshO1DO/di8VbPTBozjlpVJV/BNI=;
        b=s1kDaFV7gbjojBSfJeY01OzxtIo8FhxLgKvPa2ydI+YiJuQ6TcB93yIqwsNOL/91D5
         mdPHGGx/h+nLeBFz8200bSTaXNelae2TpgjyYVg16eJiaIosb7ExSbgfxzA2CA/aj2AC
         g+D1AEhM9KccVC+s3nhp4rPekZOG/pNHn1ANOgJeAw2cTTqCk6TRrNpKHe2CFoR+IpMF
         cWfAw8r5cA2boLLO3ziYxz5m340hmC99EX9wkmiCzYtJ86VsPKKCH5qt9rESmPzgs2YX
         tJlRun/KYxCtAGfTDbOXz6u93qKUsIjREg4AyWRMVIK5GTHMMmixpADvChX8XC5MVNgo
         8/BA==
X-Forwarded-Encrypted: i=1; AKwUvBzod4muEPlcWk1z1dTZZme/GUOAMLD8qoeFhB4H/aX1tYHTD4fDnUySHCC0cEkV2uPZWn8iPBYbMkEI4+wq@vger.kernel.org
X-Gm-Message-State: AFq9FYLQOw/XMR9RChM7sy9J51dGnIxTlJsMzqJbkECEr5hrTwpQ8C3c
	d2WOAE9B/kKbwmudhpcXzWusz2VMM+PNz2AQEJ1B28TpBtkuHm1B36y0F9OTTc7UZrg=
X-Gm-Gg: AYBFou2AneA/hQ7+uCDVIK4f7KCIXW8+vh5E0D2QDDqB/+pYpuf7nd4vjXlgSp2++s8
	iTT0NfhVzBhjzhw4+Yetz3JbYCYpRn/i82nSNFbQpyqv46x73+XvD/GwX4fJ+dRuePNLtnaJacX
	wDMPInv4pqC2qxbSKCgeYe+w/qWSZYjh0Lpr5nJy1RQgONxUKHvYvmRcjgdvHJAmK503ESW68xA
	HQ453UjAbYWTRSfVniVV4tkeu3Rc2u41QiFqy0XPu/GHG3P2nWEijI3zOX3PMFLf4BthAWaIn/M
	UMrfoVovqLjTNZ7qC1EQ14egDEqTARMHkm1r2GUbTsCbsi//9ysmEFsXKcKOZRTYNA7gYAd3Vce
	OMM3Aq6hA4QuerCn/WIzNHLRLMYv2u++eLFe9Z0Be9b8qSb3kfkv4+qGkM98oNGqI+40H/d4CDo
	3Y57oUbOVOyPBNq4jDqFnJR1CrFO71LaezE18tfTyulQw70s3cuj8C5Me6ATC8WpUz9WqUbe2Sx
	kCTfPeLvuSwDzcQeNzkbgU=
X-Received: by 2002:a05:6000:41d9:b0:488:8525:4985 with SMTP id ffacd0b85a97d-48c727869ebmr3211212f8f.24.1791367166111;
        Wed, 07 Oct 2026 02:59:26 -0700 (PDT)
Received: from [192.168.9.72] ([185.249.114.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b60fsm4521090f8f.8.2026.10.07.02.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:59:25 -0700 (PDT)
Message-ID: <e6a77fb9-e8a3-44ae-b8d1-76bb2494d31d@linaro.org>
Date: Wed, 7 Oct 2026 11:59:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/45] media: qcom: camss: add IFE pixel path support
To: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
 pshrotri@qti.qualcomm.com, Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 00:39, 
Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
> NOTE: Bryan has posted RFC changes for pixel path params and
> statistics. This series was ready to be posted at that time, so it is
> not rebased on top of Bryan's implementation. Both implementations
> share common parts, but take a different direction towards enabling
> the pixel path: Bryan's series extends camss-vfe, while this series
> introduces the new camss-ife sub-device described above.

Indeed.

I have posted an evolutionary approach - shifting from and fixing the 
original sin of mixing write-master and rdi indexing - as a first up fix 
to the driver, and then placing new features on top.

What I don't support here - is a parallel in-driver new driver that 
leaves legacy stuff as-is and just shoots off and does something easier 
in its own isolated place.

Great to see the willingness of qcom to follow up on my lead, lets work 
together to integrate your stuff on top.

---
bod
