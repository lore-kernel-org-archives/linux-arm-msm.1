Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246541;
	b=t2UTyds3FNgHyIu7Tzop/Ihq4Vuji7xR/Wvdf04Ao74cqQUDejmP9i6vKMEqxgJatgl9
	 LWrITwdLE2s8Aeeqg7Vsq4cSekuyM9BD1Vq9Znd/wUtl77SU701dB6/HeXRVkO45474M1
	 4MzzZuXleDUSE18VbAxuuhQYL6/qyp+G95KYzFA6TkxzTXzmdOu4QpRzOXKq5pyvqd8/E
	 BEPp+N9r0r94sebPqL4czFV9F+STsb6dnu4ymPf4v+yHldZGIFxNxfCfmPmRV3gsp66hs
	 GsUEIROFpwHFNsvzZLZeeN8CRsHB+JioOwO8Fmk+YXTi/xFB3BCEJhpP1v+stAjHe3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
	b=h/3RNneiQLdDy5j/KN7ifmYpOBIH2G5NKY/fH6QI/DE7nVFrHlTngN3WnFk7hps1yIwT
	 QxiBOT7DP8q3PZIL58i8GZ0ooxSDZPBm7DrILU2UiOEHSCDhzo/k+PyU2T3T/NcrPM93+
	 sYscCPh4V+wAkowUliIM+HpT3ZxjerJtKjZyvVVboOyE932OkHitu1eSf0G6/k4eCuyhZ
	 0uI4jnaTUI479K3p+/98R0oa2/JNqMcmAtYLFbM8/NTHZindnmxVHacoIrmnUkuU2Nqbx
	 oB1NZlM6XN69U8ibc8Fa0Wh1sHaqy5+7+jYwuCva+fx2al8l2pHkKCAy5onV7tNBTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B74606A332
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B74606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q9wQ32cP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so16947335e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246539; x=1794851339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=q9wQ32cPD0so3ZqfuhtKzNTUawAwni8LAA8qq7zVdmSmiF2zoYuT7nv4t184BwaTAx
         OSusIKeJYV0aDt/JPYmkZUSgwBgqWd3VhxAejdJTZpysRLOf3WCdcgDzYXUgA73NiN4M
         qiNOwHZi/reQYemYTyQAQ/eTQ9rMsfpsbuBv9P2jbo5EhDzrw2BYaYlgQqzrh+LfNJBr
         EOwopcYxM34WU5x/tjB9XzT6iz7XSHllAYxdDpf8NzmVJVXzcliqMLHzvcmZFMMGoR/i
         g5qScX3lT6mQmHrFPjwmUrs3xEiFCQ8OeWMD/xhW81ym/Hvw9mHJsnjSi65NvzMA9CT6
         UhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246539; x=1794851339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmsV1ThD3E4KMfcEvrDULM6QGE9kBcLsTn0dQnSK4co=;
        b=zZgGmecuRNQWQjKLm2lTgV40hvsSBdV6rHEfcWMT2iaEwfpnStNrSI0EIkvd0E9wYs
         VlBEVX3/v2gFTz6P1BnpWfFq4e4hQ+GFekV7WGzG2l0o6oxGjFwX4jPNgiavAG+H0h+R
         jIhItYKHWhOaeM+bLDDNRyzjBERAd5l6zjB451QwDmkBqbHiNiDu5D40ZElCO/zgAGXD
         TgFOa2n2qAuSnUI8+wYsBCFlyj+u+n8Yj9W9EnmWa0ZvjMkKv8HiHmGZHINfq7feUX7W
         h+JXkG0TLwd6HEfoLG19tDLcKZwOXeehGwEdyRfhH1uPM3lEOhix34MbgAHZ362uajuL
         pT3w==
X-Forwarded-Encrypted: i=1; AL+hErHe7c490DSh1IreWOtSUMR9k+jsoxa7kvqHfqJ4TsJVFQ/nGgmv1Sjw/MOQJbrdhBn6yScgewKr6BgiD9rN@vger.kernel.org
X-Gm-Message-State: APuU4Z9qgBwwQHLt7c1fLNsEvUk3sHUv+79FYc9/DnM1ktK2Ql7bpKiA
	r8mDBzCzG8mI+x8mRoJ9E9uDNh07DN5DqVYDjLC3ukS6IviARus8xJyz
X-Gm-Gg: AYBFou13XWuPbCLY3FdyQPguj1mRpMKtIWe9I9/npXoer4yu9M1QJBp9lH2xrtu4aRs
	OXwLKDtQRZ6r3uIEGYKaooHMRDHwIzFB2spP3zY8PTYRpCvcTX2ob0PG1Co54ZrApt8SiLQJ0OO
	cD6XdzlH6G1EZbLSH2ttpgfgCtjh7gsOVh3EleHHvYQASRmJUiVLX+k0ykeOwNisXQ2G+PxwvST
	gIrKZVGYJkb9ZtmDmDiJzFpUHTICdvDCRURYEJrO7tkZskRNho2AGGcSndKQVlX4LWe7o7vzGbD
	YGoSZav4GD8fWo0DUPElyiGFoeFK/QKPY0cLsyqVqf4kIiYSDDz0d7bozipqH173j56QtjWoK96
	wKgVis4C/4gegACynl4Hg2UHPYQb7pGcUNA0zjl1L8bUbwMWGCXU16pqdzLcQtQ3Mh9G1WyBJWw
	Wn0gAy1MVjHS084NBo/1b3eZuIxwCZ6ePBXY+hwUMLFkQZfceqYA8bVa6UskRy/RGacZI7RJrqL
	p+uvlDglVG1qGDfr2hIjeAFYdKtSUSAu+uMxwi9QKz7DGMHBHr2oVHBUSQLVDF3D6Fvcdovu2hQ
	6EPkG7P+7VJceHmaDKBJSXSWN7k=
X-Received: by 2002:a05:600c:6218:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4b963c88030mr89979545e9.33.1794246539561;
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d89f22sm7619465e9.3.2026.11.09.09.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:48:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect provider driver
Date: Mon,  9 Nov 2026 17:48:46 +0000
Message-ID: <20261109174846.2091271-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com> <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com> <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 09/11/2026 14:30, Konrad Dybcio wrote:
> On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
>> +static struct qcom_icc_node qhm_qup1;
>> +static struct qcom_icc_node qnm_a1noc_cfg;
>> +static struct qcom_icc_node xm_ufs_mem;
>> +static struct qcom_icc_node xm_usb3_0;
>
> Please take a look at the newest files in there, you can remove these
> forward-definitions. Otherwise, I think this looks good

Thanks, I'll drop them in v2.

Stanislav
