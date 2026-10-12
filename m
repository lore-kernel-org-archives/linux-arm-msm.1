Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB79375F81
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812706; cv=none; b=gmUl44f/ldjUkjQemaGoqB0YGUz3rKK9Q3OlZhNkum9ELKCUJuaYWJzIYTuLKf0M3MTtkb4fp1NBge+8YoG2egJqUlOV5WU9wQDDK25ZnNSVvzoeIHRbGODdD6+rVX93ykcKfqAoBx3YOjsIU8wO6Oib4LSRc7BKB31kmaGMNlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812706; c=relaxed/simple;
	bh=oQfRZHXjCLIjEYYPgdVCqgdBHbPItDrDGI1Z+Os6XYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDB/fATSVyLn0LqphUOTk9QoG81DJ+u9NUxf4PvG5tme+BqdZLTmbkN5QUPq5k/TK5FpVA9o2/OvCUsfmTtEt9QxM8SNHOpzY59azjcNQARmAbRCM4sWceyZdUalur+NeF+rauN/xZEcNq/ONAWad1cQ4Z25Crg40M6gAeOyJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELF4cBl4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELF4cBl4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2803381a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791812703; x=1792417503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2maByi8qUEGu8Db15iKgLtRhl323Oj4E0vQnTrhsX4=;
        b=ELF4cBl4dRPQCPxVJyxjJjqlKlz5BlryGW8fKaSi1yQHaP7KAYq9uHO1c+VencSzGO
         RIVy1BJBxgRKFrMmc/ta6RBiUvINiAqM6Odw9oNBDgjaeox+YdV3ie/PCLkxDwvqwRZ/
         WDKakBbGwoPnuXTWTPXK49Qon7nR5eD4UaAdirVi/74ug3j3AUP6ODM41yZ9vj8HOWuU
         Yf5QG/vFdffi9dpgpPnAX5Z+a+byLpIaRGfiLngu2RENMD+SevAiilAaOzdbdggOucQD
         4aRD5b2VJSxd3pP9n30hjipAZbJz74lpNyRsAn7n135Z7nKul2SMst3jRF2cA9pY32je
         HQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812703; x=1792417503;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2maByi8qUEGu8Db15iKgLtRhl323Oj4E0vQnTrhsX4=;
        b=EjspmtwJW4LfKovUysTd2iYDFIqJtyIu1pTx2kKmdVhl6w1Xy1cSLNW2PtDPNdBxuW
         OOMIx2A7BmXv0yk8YWU3xo1AhcJc6JXHQjF0LCdEOZkGBZAJ6nWagRsDEHt6NTbvOl6A
         4odxep8xv1GrC1IDc2W8YO+ylav+V2yFzkslMhUuZrK3Ch2jg4n3jnvQzW6X3yeMD48T
         g0mH33bmdoo6huMgOb0VMEU6o1A7EjpFa1X34UsvHlU83/WJGbPj15DSUPUtKt2NLFLI
         nWQtRQ5BFexuiDwzze6L3NCBuAsnSkQxxgCHYCHXnyAd03P0C4yo6ZyxqSFNOAx33GmH
         ZNWA==
X-Forwarded-Encrypted: i=1; AKwUvBx76+V6YnIK4xFbtqpxZ6eERJE7svCfCBFWlZa3qNUrhOLnhe5RhK820BxA4W/C0fC0q4Ib3Kw2nba9+hNQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLa0BRpgGxbh+MExlH0L67RToht2PAXMLZhL62Y9PetULyg33US
	q0zXaoRhZpm/iswiXFpnpA11a4OtLNAJtrbFPncJH9+F4AttS+ITX5W4HvCBqEuItrw=
X-Gm-Gg: AYBFou1nZH95QVaRXtbHLfnCWSuY0bR2O0Jv6vaFY9G0+gZYMq7wUPp4+0WQzWtmtSk
	S6Z/bESHKRGxbRxvfvY+lbQl8KR6aEo4E/lTNZKjN/BOnpfbUqlBrsGxRaDbAY3qTaZ5tdxch8/
	dEpqYe+wyGZQDk+iRbR+9tSnxi6BmsfCYmJdfI10inN2JQd28cJ9D+KhcdzUxDyOR75k7fqQu2r
	yasgWjSZd6kBNyEPOaCuEe/2f5aV28Csfq2IoYWzmLiawlJpuvOCTqc3J61+tpwZwJp/r6BrW2V
	8Qaj/i/x/5NvENMoZ8UGAQgeAtWpogVuGXif+WeaQVGXnGqw4h0fyHScvOIJ3cdqGBRgzcBJ4iZ
	2Q43nbW9MrHmKfQEWTelxN05+IL8C4n/Ab7n5jl6HBwZow/srLr+yinsYpoSfjs/botxGkbQo9n
	X8/5wt4rq9xhKlx9ynNDFp6aeUqj60b3qX4QfJtR5TQyLy8w/KwgTAAIqflz6CGJc34M/1dFPGe
	i1Myzdf2lW8VHqlr23PPg==
X-Received: by 2002:a05:6402:5285:b0:6b1:497d:1c64 with SMTP id 4fb4d7f45d1cf-6b17c293eccmr8596872a12.45.1791812702882;
        Mon, 12 Oct 2026 06:45:02 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.202.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm1932208a12.12.2026.10.12.06.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:45:02 -0700 (PDT)
Message-ID: <bde5fe2d-1aa3-4990-9590-9d147a5d4d54@linaro.org>
Date: Mon, 12 Oct 2026 14:45:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions to
 camss
To: William Bright <william.bright@imd-tec.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
 <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261012-sm8550-camss-tpg-v1-3-620ab6f151dd@imd-tec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2026 14:03, William Bright wrote:
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright<william.bright@imd-tec.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Needs commit text.

---
bod
