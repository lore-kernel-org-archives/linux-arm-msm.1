Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4613ADB89
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752491; cv=none; b=iCo0h/DHJLBXzYjjniP9/PIz8TAITmg9vceQ+kcRpK809LcR9W5CONiR0fVoHIvKiR6k++9XHn+/PoLqljpELrnoeNbj550KIuRdUkrmTO1Y17LeBUFyrkK1rQICx4B8FBPtLiNWUnFVo5jTaXkYuB808pyBjFnvQfpKntzpBKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752491; c=relaxed/simple;
	bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ/Pa8koIlBzc7WCVZzuXsoffVcrTLCagwq3OWO++INUKyNgzn2WZwvehziiVvcp1Q7c2ZgnzMo1rYXU8d8os0PZwp1O4F62ldwcRQNFopX9RkoRqWBm3WM3QmgMsW1of4QCLhhkZym7ognaoZUQSqW32kfRdEZU3DbkezvCjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVtP+5MW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVtP+5MW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956242332dso31298325e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752489; x=1785357289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
        b=OVtP+5MWkLZabIbQWWcmxe2AfQ6iZtPW3TcV6XKqEm3C08ggSR2vaH/AkwBM+aH0uQ
         E/8lTOKkL/8oJtYM1IofaKxaSpEU3idmh77EnOSA9cZ/9GBxB6qnOufPGRPVynGOcM2V
         v2+owMAA6lh7QW7YQvZZ5+zdmHLgXWVR9RLXaCd6MFEUGuRc2o7wU3E8ogOmCdmx7nS8
         PRsuBWnJhg/LkiN6GBBWa29RyAvGTeWKwCzO7qCZGuxyJbXcP1x1XBuZkQ1NGboEVus3
         iFrzDFcO2nOIO+WUSkkDakbr3+XT10d7USBu03iReHdWcb6Y9sLzuPoJCJ4dKaeYo3+y
         tvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752489; x=1785357289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
        b=aPNkclHaoXx5Q3dSMhubjEQ4WigmpMzaR/yti8kvP7tDQ9lyeKHdqmUjnZq1ol1vZA
         M7BwY+WiOJxpjSaPKsQjCjbdI8ggRuCBBysh8Jr7n38y1jm1gJf1flQ1THtHDKEp6JZ8
         jnDBN9LrgMn2iRx+uLw/zGM1wpMwWthRN+Sq5zlzCfmjmtx30QmRStx20NCBwq3yqr3r
         be1PcOEDWX8pb7qw0NWv6iueBbzd41Fais+sItkrr2MtWusqrN/hV3vzRpPfSR4AiYjC
         uHO6nvXkrO7gEPvE45a1U+FaPeUkatUTWTJ6VJZ9UYM0ag5DJBUfW/7xaNQr7pBoP7Aa
         bLaA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmqz8Z+J87hVNFcBVpv4as5X8G5BiCPHojKslvj8HA3tJ619pyEyCrdYNkes6NUlSUqpH2fVXdsjlMdgzI@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXhk+zQW+FMeOd/WJ8+49Kr1tOlbDHOJUsYdnYbCxaxIl1I/S
	aXTLtcHvyz0Ph44D2HCiJqSaaPAZSmhhDoWIkvB0OzkyXo4PGIm9Mew1
X-Gm-Gg: AR+sD10k7ly+MQZHfGDhDYjx2ixtdr0OkcNwiT9K9SR17yq3VRUz141MV8AZbel0X6M
	QxcRv1AW2NGkL90kld7b8CJ5QH9F4X6RYLUZVzmAQrVqcIRWZMe/zT53V+M+fTPKdEyTfNPuv1K
	w4xliE4D6vc3mq/zD7kH8mROlYG4PYWyfca5NcOjK94ZMPiFcm3AwYeSA5IAJFOcaNptUjUb8w+
	+fh/iTyWryf6qEGnxdQuac/MYtjTXABRbeiPq2U3L+JMZh1x9u/PWQWfjiXWMTZGxhSNdLqkPz1
	O1sD0M43ptweVTTtNf3l/oZa2FAGLgfVslRoTy7zCbt1W1lILH6DoQ3jhMYflB+ZvOefVoYUDHq
	Eh3nbEhAMKeR8IQZEZcZunAubbbjBv4KBHjJGrzU5Fcy3T3ZE6hlml9Oz3b/aUklXlVLfh+G8oH
	HA72/q9W9HaKd63+dNvK2WDAHZkpgTLn+VqIzVeKzZJiSK6RQsSQssXoPJsbldS8on97UfTw==
X-Received: by 2002:a05:600c:19cc:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49573cffa42mr2236195e9.18.1784752488856;
        Wed, 22 Jul 2026 13:34:48 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a967289sm93558325e9.11.2026.07.22.13.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 13:34:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3b56fedf-95c7-432e-868d-f6f8a0368ce3@gmail.com>
Date: Wed, 22 Jul 2026 21:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, arnd@arndb.de
References: <20260719022242.139472-1-julianbraha@gmail.com>
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 7/22/26 14:47, Dmitry Baryshkov wrote:
> I don't see this commit in linux-next

You can see it here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f2866e6a27f7cc26111ce195ddf00d4050bb27e5

- Julian Braha
