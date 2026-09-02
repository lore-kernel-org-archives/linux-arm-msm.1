Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320B490BFA
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353005; cv=none; b=SihsAOjeNn6Akv68ivKk2yVHw32z3SS3wRrxSLc+NkhNIm81D/q/3OQRapM8fp1W6tGQsmfpvew2NjpIb1okkKJyhlrqsTsktr2jVc5ErSsL65labdoO+fx6czQPIyC8be4OXfcTlf9R/vR5Nozl839yvLqGiziLSJN6BnYu5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353005; c=relaxed/simple;
	bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaoaEh2rwU6wWqYUoviZr4xybhQ+DClEo37hyBmhlgBjQIucQrWt6QYwL7QibYhd46VKJwDgJ/lMGOzPGOfZVKcQUxObEQ33guXkIAMn0/dk2JozUjjjtf7Sii5LK5LVE7m/djD+cHGE6mVHekR6pks56jSvibIZc8H4Zi40soM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXPC4GWq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXPC4GWq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso146012366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 05:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353002; x=1788957802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
        b=eXPC4GWqz/Kw1fZxDHdlSg8T0asqPGvuvYJHA5MO0oAza/KDgQfOrtaqWt5qNONpD6
         u2z7Q0qjTkwod2SAooxzY4hoavod6HZYHgQAAgoHfWnc6pCyQ386062uiaVgbUJqbniL
         m+Gp7o8MLz88lOXRVmP+tyllwhpxuLdiBnHR8gt0EYKUaq6NuLOHYKooIGMYFW3f3s5J
         7NFxhhvC/fc+C4dWeTVzxX2t+9Vrae82eWQ5M1wBdu3wL4RoJYo9yAB3iRlbKDH1C90p
         IaWmQYE8RkXk9LNa0mzntkEoBdVBHc//zx90Y9dPTfXwdrF42N4AVnRTqC4B1a4E/r6y
         vI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353002; x=1788957802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJITWgkUYiW1v7E9D6GmTVjfH9KmNTQjqvmyZGZkDiY=;
        b=Ot34s8K0ST9BVxXssod55vRnWoPW3lA62sRHCHLjH79nCKyVm9bgBfW/a1zaDf9h2x
         wsljBpJwgrieNGKDVvLMpeq7Bj3n7diENVTDecgV2G9KW1ywuhEY0RN8gvDbKyLAjbh/
         OlYGQ+Db4ozH8Nkl0/z1IdpDpurxOuPwwCLMf7XxTF2Nq0vdUOKP3NxJdefh/Pu8E/y2
         5orZAmwjv0FISCbXz/gP/pl8fWEbYC2Wfe+kyZ3xGQtFhice7ZlXqqyFx1h84QdEKCWl
         xol6QgZ0UvW7c2xoupXXZFkDLMZgmXGu5xHxEwQ3E34H35GWEgeVbWjuXCJ4fsEr2DLN
         l/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlbaqmm9D2tjZFxk3/LUcFuucQjcwWX94SY+3gdZEwma2QK8P7z3RkUla2kgsbj91t1AoJhKvS7aaQcJgG@vger.kernel.org
X-Gm-Message-State: AFuF++mrJ4wxlAegDy124R4hYuYzciVTY36+WndBDUYfJXJ/E6sEGTk3
	EAaTZpXZVr9BE+H9YFKpqEdEbQxxaPq4j+YUf7MI5M4GT//mO/Eq1J/h
X-Gm-Gg: AYBFou1nv5detVqktTaJAyhSpUjSr90oEIii76WbJi30pODM3vYWWkstEebQ8Zkyeeo
	WaFjrkDTW1aNIJVwlXu/RwN0CrJWjvyZD6ZhmHIO6jxOyH7q0SQnGjbRBzdNSyZ8gubGd4uQmut
	pXKmd2mUkowVA7unYyBH4tRy3qHf5KRnPq7miXCh0J+WBmJukmQBHBouW7Gc212HhfQmE4hQLD1
	C9MeTa3TEan+cv2pp/FI0BKsU1CHZtWTUVfkh0qzG3e7SEomGlwAnXABMMTNvgPI97GhxhICClv
	Y7IIc5TE08wbty13sye61BO6wwDS14zlY/YomU1JYVfVXfYtIyPUHEJVPbZabnx/MH8l9wx3IyW
	Wi1qg6Z9ZIXfK7WvNX2Hk2Hgv9BGOeXVc4CnTVQkFT0fW1roBnxpU4kUbbXcJBiuXYjH3JqUoIO
	AJeNClFy+cR7Sl83j3c/Vku8KuYMpWevJR/dsNl4eqz/4ie3i7udBhaZeC7YOE246Y0FHoW+opI
	rRNeR8MNCfMZukPiw==
X-Received: by 2002:a17:907:d21:b0:c12:b2db:873d with SMTP id a640c23a62f3a-c25d526e682mr232505566b.5.1788353001758;
        Wed, 02 Sep 2026 05:43:21 -0700 (PDT)
Received: from [192.168.1.124] (78-3-72-185.adsl.net.t-com.hr. [78.3.72.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5cc3sm127621666b.7.2026.09.02.05.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:43:21 -0700 (PDT)
Message-ID: <5636553c-4c2d-4fcf-916d-0f334ddaf401@gmail.com>
Date: Wed, 2 Sep 2026 14:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: wwan: qcom_bam_dmux: account network packets
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260831181006.1382372-1-sinyavin@gmail.com>
 <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <CAFEp6-1Ne2SmyGGLBMMtiXtXXmzEySX0ZgzijNn4-QtN+KFhmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

01.09.2026 10:08, Loic Poulain wrote:
> Looks good to me. Since you're touching the statistics accounting, it
> would also make sense to update the drop statistics, for example by
> incrementing the TX drop counter in the xmit drop path.

Fair enough! I'm adding the drop counter increment in v3. Thanks for the
review!

Best regards,
Dmitry

