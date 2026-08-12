Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB44503E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545873; cv=none; b=D7UEHX0AZ226hklpo/pGgYvJvs5KNvdgLjwAHXmDmn5vFzjXSJVpmUdmKQs75kOs4OjmnahUVlMkg5pRImK3/R/usKW/qUXLVXCbtccSNSbN1JUhlFn0+hZRzblhFH6hIUyPfD2IxYIY3albZCfZyceQZorn8sMfUsvdv+JUYMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545873; c=relaxed/simple;
	bh=i58CCkzqQy4VtXw07JKIL8ZZNTjvSNoRGzNvHk2S/dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k1Xu23qOLZjgwUMJVWt37FLpaKcnAc2eeuWTpQGa/YIYyLET/u5ymy3+6CV3RYTMUgSQ3GloItWvZ3OARQjDvrfLJgyZ5A3i7EzqPBNHD10BIZHnZyvEO2jvQQE2/TEK6SHqkxDjKiFDxXZot+dnKUNaDEpU+4ikNfbFSlt8Y64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=a14LtTdH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="a14LtTdH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f703a9d05so725076f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786545870; x=1787150670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i58CCkzqQy4VtXw07JKIL8ZZNTjvSNoRGzNvHk2S/dU=;
        b=a14LtTdHi+/v2pPsJFhd6fm+sUyvjt8kHBn7VrRa4UK9ggjzcQswOnxLkgra0NsY9C
         nL2gozZRoa0stsXyQwZDgKJpD4S70SXWSRg8CIt0Q3Hv29HnjuCw7FIgPlAAGC+R0All
         Q5rNDGUSj1T7c5dr8Dvk01qDNdC9mo1ryvzRg+oFTBA/KaCIiz61uRT28cxoe1SakSC2
         13fxq+S9dO+Dam+YUZp/QIM/sOOpdtVrbpPukEn2diYloeiFJSp/wbyCD43E+R3hhJg/
         VS5tAtr9DOMfMI8xhF9wU6kbZ06sDv4+lJaR46PLRbzvLt4ZN8g6a+WBUHFoSrKe2rzR
         jOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786545870; x=1787150670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i58CCkzqQy4VtXw07JKIL8ZZNTjvSNoRGzNvHk2S/dU=;
        b=OAMlQMuPW2KE17Q9YB4O+z5VLF2Syqn6UrvIefVyIk1rqkasivdHJxaGtJcRaEypJj
         yEvv+2WlE1XUuJFsI/PdpGvqxEhmMlujYnoc1kmmUuk34CixciOaZ3FdwcX07tVsHB5i
         dPvVv/Hjq7jatuopV/ZaHPQ7S7GdbbfO2+FvlCjC7h+MWmjMtb8R6MOrkey+QQ92DHUA
         MTFfrCZgW3jXKPczCn9h8aTJcgi/MlPmLWPF0kAoe1OLZAy9mBzY8N5IrmGxeoaB8B3l
         1fCrSH/pXphEUz7xuS026ysixySK/STjYqUNnpLkXn4tGjiTSapYkZmWPIl4SVXZQA6B
         PXVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF6xrmjYbK+A8VNwj5lXAcmvUcS/yLMlFukx2VXUunfBmqpddIOssWuLnszvptsDcLls27CIuEUwM+DyVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1IlyISVvWSBY21exlFWWw9AxF0lYTUnR+JiJA0XJ64L4s4bz
	S4QfLSkeKN2UuD5JtO2BwrDWuCtPv6UBT21fA6BpF+PyOAoxnNu0YK7b33py7wvIA9ge
X-Gm-Gg: AR+sD13+twJPeOtnQ3mdp3GN5BbApqrEu4tMI3nLV17ttJQSxrW/QhtdaPyvGZ7Vjhh
	rhoUbiE2++RIWHRTLSS49wKdfOs8xT8+nTUu2eytBH1Nc5QVuGIdzfIC6tgzQ+52nNmEXalVpnk
	Hgi4C8HTDgJXFjzVrn3auPdyzy2ArqTyYR55Os9IHCphgRjT+W1aK+qqr7+tnAXyFiZGpe35Kvv
	4IJzoDpyTyOOCTBey3AYXxR2X0nB2zwxFYrOXYVhBxYpGCwEYxX4WG6jBKxCDS0Zz+ov+cOCXVI
	IE61EYB6BO3ng32B/DmcnhtFXja86Up+5sJfvhzPN4pwr4XZI7C/Svzq9+2wyHwsoiHAZ2NAe4Z
	qLp0Pn0Wf1kDbNchxWOSZWgjUBI1DVslMO36P0qtDQybXfOFzWAjBhOdl3z9q/UzJb2JZ7IBjEN
	vVxdHMTYToxjNcO5ZkiwQAtajUVCEudQvPggZGuK/qT1l/0KkovcBtr4Og+L0vreh6OzPQ2Wo8h
	+uT8Q==
X-Received: by 2002:a05:6000:2607:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-48152c3f767mr8300016f8f.4.1786545870253;
        Wed, 12 Aug 2026 07:44:30 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150bf5f0esm7669983f8f.4.2026.08.12.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:44:29 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
Date: Wed, 12 Aug 2026 16:44:28 +0200
Message-ID: <20260812144428.1105298-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com>
References: <f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/12/2026 6:12 PM, Krishna Kurapati wrote:
> It is dma-coherent.

Thanks for confirming, and thanks Abel for the review.

I'll send a follow-up patch adding dma-coherent to the USB controller
nodes, with a Link to this thread — keeping it separate so the
already-reviewed patch stands as is.

Greg
