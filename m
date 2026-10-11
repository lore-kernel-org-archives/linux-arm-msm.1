Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7E4279E0
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708995; cv=none; b=CD3LguVKAFNILNAxX18HVC02F3RBCNxTcadidci67OC2yOOG8B05q0OdnaKIqdum0yr5u1A9QBzLRyp960joQqkWucK+m6z3eXM8keaRtqCZbm//foitcY+bs4a/n+6j+RB9JE5eRD7JPrVqgIPA7XJH4dpu0iOPoTZctNwqw2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708995; c=relaxed/simple;
	bh=trXuCyofDSoyesvjUgDrKmbXdt/YLOeYazvd/Osj+lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eirA1mQXsl3kwKS8LhowpEuf7Ivgg0D14PUXBigr2/bY5/98lg+H1M7aiMy/UuhS/xBYIVUc6pbAs+pbxtHWXZodnSTVWg8gZ8EKdwmXnxNnnT4OmhJQKtHgy93cGiqJTO1cxzlouagUyHSUXM/MrKZODeHrL7AZfGDzIE0DW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCf+9AJj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCf+9AJj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso269786a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791708991; x=1792313791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=HCf+9AJj68FQjIxYxllcXMPh/xLWNhDxiwo2416kSNqHz9iEkEonTNZ0QTH+Yt+uWg
         +vJGQ4ibw2DaCwgZaaBa822cYfUtKvqeK9yPyjgXlGRvkCsqD2kHCUJc46s+qrWAeW9s
         x0CI+g+36a+2AANQEActK1Zog4eQuF+G9vtYFogZZnob3kMx2EzHaHQ+dVwT2NmurOBI
         Mf9FhnqzJHXeY3Y7TTnqbwWE/lSmHy91caoz52tlv5uo8QjI2autT/HQ5qF3UTdLoZOb
         bCLBrRViqKctlHnPtoO3R3qJiYsz+Uqbox3IpsXQFHlrFt+anLfctQCEtIs608+sxEU8
         Kkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708991; x=1792313791;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=qP2Rw5oAWFQ4ngEVho6K9vCHRe7P+KKc6aIxbQiNF/yzH55nmRPvmhOjw3o8JDU4EG
         s5Q20PfbD1JDzptmkHJ0cX2ZQ1J/wN2q+TkhtWiFOvBJI7NxwfC2hXaUhLh3Ft0+7ixV
         M8cHeBQxR5M9m/IPuNnDGy40nl7eyIxf8LIbYTw08aX6Od1WySQ4+lBfXCCwlJ4enjhD
         pquohB7E3wrdmVK0yGV+6VMMSo0EMoj6C2nz7nuqCUiebWUDVb9Wj9+XFkbOYLh48a9D
         jmA0aRCCPrUo9VVvU9OdJKJZDTwMTg6Iys8eY2nNWOHG0XYZ5bB0PgOd+kiKL2qouDmJ
         lSnA==
X-Forwarded-Encrypted: i=1; AKwUvBwMGbt9yxuFRhd5q5vyK2O/5H2Ck/XG5LV8RXryAeckJfJ/YdF8RPIZEab7o2z63CQ6aaH1+2lD4M6/ZDge@vger.kernel.org
X-Gm-Message-State: AFq9FYK9FfKCuSGwS/vHIytflIreop9k7Sb37HZJqPT1vkz/nkMAvJF9
	eyC1nWvTHXhKsdA6YvLxY9WNiS/5rrpl5wdzAd9yCgM6f0rt/AfRgN1ttO4yrE4rEcs=
X-Gm-Gg: AYBFou3MTS8uiLMPI2jAub9eaFmijA2MZ2ekaaNXk8me07ZMHDoFuiN2913tgUejO3Q
	xgU0rZqHnW/0YkcL+G9PzfTmkI4IjxAOtbx2oqqky1ArTMIwJwuLfwz19g+wh5jPEJainkL++Cq
	SnQ/ZKrQGHM2GPmg+dB4k9cY3Q6qLkB8C0S9ASEeWD0l0R6a40Inz4Nx8tyrnltl09FuQ2pjYR2
	CWkhhtKHtMya6DgDrQsGpyqbuW6fC41YwyLWgKLNWdUX9iYFsYh0rPr+Kj+EQ+76na33/vH+VbT
	C/z61B3/OuxPvSj9Qg4EwJ0QXdSqf4VLSY96uaNXodsit41JfiAdBjxv1pyEBh3N5v7QaWr4rff
	omgWlmRH0gOTMSytAmYSkoBsGW/6i4+Re4/Hgbb1TuKFQQuZJXE/J3+QyD7NZtfdMvrz3IEZYUl
	Va7wBeTVSC/FRyUp9+QlhI4CV4j9wH/gR3t6y3pZ77St0wM2yNCaz7XBNH6tMoJw2fkfFoJJcrY
	05MiOt0hyM7
X-Received: by 2002:a17:907:940b:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c31a9ffee01mr693409466b.24.1791708991035;
        Sun, 11 Oct 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm334413466b.80.2026.10.11.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 01:56:30 -0700 (PDT)
Message-ID: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Date: Sun, 11 Oct 2026 09:56:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
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
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2026 17:01, Hangxiang Ma wrote:
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);

So I'd prefer to have a discussion about if we can move all of the 
updates to one method.

i.e. why should any of the updates happen before csid ?

Sure vfe 1080's documentation makes some sort of explicit statement 
about an update that has been implied for some time.

My question is why not gate all of the updates this way and make this 
not a flag but a global behaviour ?

---
bod
