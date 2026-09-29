Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1B4E56E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672741; cv=none; b=l2JDIlewedBqfq311bMtH/1PpoOwBwEw3bF6D2MrOVBcEGnJcer94ic1GyUKv/tOYnAKzSw8ghl/9RjtLbl+z7ZCtPh1p0QDPG1/D+3eztqM/Ev7HI7jDgAz3sHJJrQPGpEr3/nA2HzYv6r0QzAdW6KKdM4R2P3Hrj9lFJIjkj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672741; c=relaxed/simple;
	bh=dOxCFITIjjfNlVXHpkNOWJqmhuzYBxwX52SfV4FFHZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7IL4Dfck/cP+KnFIg/Zf6VKXSn/78dOM7sjGFBS2J8en5vJ/JzWu8VmfVUlxDtQbvuYCot6gduf9pZyaQmjbCDAeCPYt6WxL6RTFNPDMU0WQrOBjjryQy8G8V4hxFEQpHpRFotvdcQTxor8ciAMhkGwktgl/GprS6SVLTOAHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd4nSPTV; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd4nSPTV"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-853619d9956so152462b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790672732; x=1791277532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=dd4nSPTVjvV+YRWujSwHY6fCrK4dEmOXvgnXKZYa/KSejTHo/Y97ptN/FSNKUzz9ta
         pl2XTalgy9+bC6A1JmdgBZAxn15pyhhww3w/9PHPzQfzNaRHaNTm4Van0H20bq5zJYdo
         SzIpReHrOi/93lRUw5NnRwWRITf+G0yPJ9VIGeIfgFM0CxUAGDyYn6rG1IlDaouG7Skt
         vFde2kg7l1nXjbe373GhA9mFaA5yhuTtpJc+0rPd9SNalha4FB8IylvDw5YvP8GiJjR6
         enZLewsgXWW2eHSHcb0xITjYE2kZDnLS6qORjD1eqxKoxrhHmCXHoF7v0j4HA9p+DugG
         XSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672732; x=1791277532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bevleajp85eun+yxjdnuf48AUFIAcQWpSDeUosrkt8g=;
        b=DuWjyTj+kllMtSqREzhfdl8kpdbzXO8uSp3JHoEwRHHkb8Co2fSJ7tjpV8aOWnMhVh
         vyJBFgO/QE0quLPX3R/m0Le7xAZqd22xTg0ovjMUk3Kfcl1u8d1PSEOKzSFbnwoQyfMJ
         p3AsZK/zkDdqgP6vfoew2Pox4lI9ke7D5Nb0hnUuF3WM24yiC4FFQIW7znnr/4t8fjJ7
         7dlshBeGt3YCmKCqxvB9wnXFiItppByvu30wFNlJZfbG1MYkSzXZ859kpDsH+XVf74kr
         EKe7tRugkuSMyq3b7ytEWpBxCLoePC50UoJqYaKHWCw4AlfJ6WPqUswaS1k5p+95AKVc
         IN3w==
X-Forwarded-Encrypted: i=1; AKwUvBwO6RBLZIqSi7D0lNCoqXz+2WkYewBPoVtMnqOjI1RJ/sUFrrj12WwvNqaxV45Li99ioPzIZ6L++nkJZ4CZ@vger.kernel.org
X-Gm-Message-State: AFuF++ntW5YAwWbgtJOk6FmflAYO3nvGNsAwcOXuYtwoWicybQZUlc1c
	guKmf9iFRKgAdw/GFqqI+3jIGseFZhYG2onsUeSIoMAWVS3rnC48QUF0
X-Gm-Gg: AYBFou3eq7G0y1RMwyJ220HSE7YFm3mXAv30fJ3qYDXvSOiiEjeJhSmJIlihVDPTVu9
	zguBrxANl+MMgQvarai/+AJDh1dXIN0n7p/IaHPrZzs7VRnXt9sNbaBftspJYewiv6CgNpF4Htj
	X5JPQ+LNyhdRsz9opdQidmTQh4VZWPKNV97E8WRoAKk01ThrsNS+mFpkSnHl2T18p2HBtQonaA0
	D9Ba3wbvB62betc49nXEGLjxHuHS4lcLzQ8OWhxkTJFCFzYZYcVmomo8Coc4w99mMZgXywdaxGQ
	HJqBMCCcI1QQrL7iJk/P/92+LE6gxeEYbvV4BAskZ3Q7JwckCI+t32XwWSFRZVsROyT4wtmiEP9
	I5DUtloQRS5r+vdzzEDZXzBfJtwotdR+gIGpjNARuSMOK1SxnJw2of3bZ4e22uvTJmfu7mv0Dx0
	czdpLcKmbUf1aUwAaCeY/eEOpXgCKQhnQ5IrS778LutBxzNsD/n+nkd4YMl7CFjJE1jJg6HDY6y
	MEFZtj/z/6qsig=
X-Received: by 2002:a05:6a00:4a12:b0:884:18fb:edcf with SMTP id d2e1a72fcca58-88418fc0398mr4492868b3a.0.1790672732392;
        Tue, 29 Sep 2026 02:05:32 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e163dd4dsm464701b3a.25.2026.09.29.02.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:05:31 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: krzk@kernel.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 17:05:27 +0800
Message-ID: <20260929090527.105522-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929-inventive-hidden-sawfly-03de2b@quoll>
References: <20260929-inventive-hidden-sawfly-03de2b@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026 10:56:43 +0200, Krzysztof Kozlowski wrote:
>> ---
>> 
>> (no changes since v1)
>
>You changed the compatible, no?

Ohh, I'm really sorry about this. This should be from the v2 commit msg but
I forgot to check it when doing v3. I will update v4 to fix this.

Best regards,
Jianfeng
