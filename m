Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792459780;
	b=qx81PdswNtjuRV8wJF5+XP0sKBjWX4ZTUeGD3jXbkIDWgjXl1XfyuFEqvxvGbH1mfjdj
	 ehKPseIrV9N3+MGmk0mq+28fmE44DGKTdvmG3UKV077P3mnyDqZ81m8fALgut2KXBZP+s
	 Pzq2Sr8f1WA9YoqIg4OPBAtyJqR/Bb5vS47dHK8wFfBSMbw8i+jL1ZNnCieMVM7VC7tsT
	 ChQItHOoFrijfdbiWUe/pq2T7DSdkm1S+Oss8wzH1pkFZvf/4rLzWFzf5V1qX/D15RkqA
	 7oGGrfNVdEtglWRGjNkqKHoKHTfPMN3ieqPlrzexG95a3qc8iYMQuE7zCO2c4yh92Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792459780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
	b=ZytiCJwAnEQiYJ5EAwzpPGLoDrq8gIPc0/6j16pRrr5c2xesjG9mycfVLxMbRSLkmPvp
	 GkPT/RxzfjzYqfSkgYW8d4qG+efs7qY3/Y+7IJKiY4xSB0GcAq9xuIaLMmFWiKlNOFQLj
	 zDl7nUXeeMRBgkzWddv2V5YkgpCGy3ZQJfRken1dy9DOW3u8LK3+AyhyjlUipv9ZhAtrp
	 bF2RHkxsALvVmxWkoDovAgwnMMLMFzaiMhXWM28Uhc8g+0kKbP9n9qaQEoTkm1iRaUJeg
	 6wmV8VpqPpVxIuPA2Lt1E0Lniyuy6x+3YZiW8Ep/w4oret7w0p/xx6g1bAPXAzYG7Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25B606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C25B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XxUN2kZ6
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1328442c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792459780; x=1793064580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=XxUN2kZ6oEaNF06NIkbaryynlksV1cMlxhrkyWtOISac7KzbtvUgeFnp+pcITmQZo6
         7AFTE+xDCMWFB+Ka8hPWmtY2+ouBmJJsz7SFOycY9AVFqqjPFDTIu4Wqbu596LB/c8y2
         hw7uTy+fEPpI5avdn9oR0gwb+8dMYujIZ2owbXkrQh4NeT9ExNYRiCndy27rStV9CZ4n
         AJX8EJqDvZ6gUrRhlZce8XO2+M8PdnA+eHtnJu6gzYkAyBMSxE/HaqxBu8UmYooBsWMX
         Pwt+VbKoawGN1yuYtTfxtD4d3xHe2zuw3X+FRB4cRQvrZ6Iur5RSVRHzbUNmSWPRiGMP
         K4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792459780; x=1793064580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT3eFXHVHoqDLuSaSFM8eK63zSLUEeeoFpkJDMWYrL0=;
        b=aW+LkM/OvTZQONqEdMGMiXN4M/jAc7D//Grc3KRdluJweBmgjG6XCEkG1A3ToUumGH
         +XeqC46HY/jrnIZmHidTlW1TnewP+4gVT3wcc6fNcb9ea/zRu0XSBQDc1cqM9SJ+q+cW
         ht+JiXfMUAi7+LZKqnjFbePgcMMAmvBoigfAl88nKGkXOsqc9W7JgX60DEqn1bAuxyLe
         HP4Kn0aNiQgjRBA+isOoy6lBjQNt+fiNklVLuZqKXiNitiob+sQcDZEZa7Vw174M1snr
         8Oxkh3bDNKgWZ1OrFCHQxKYZyuHL8kdDwO+hfKiZAoxmGnnQGROI3TaGIakAHFhjAFM6
         6yfw==
X-Forwarded-Encrypted: i=1; AKwUvBzTt4P02CcCVx1bDfyet0g4urvpEidYE43GRoF2UPAX7q3/ZJCla931DHiAia/AhxyyTYrp/KC0C2L9bsxs@vger.kernel.org
X-Gm-Message-State: AFq9FYLjGen4ViODNLX1DEhH9RLEfwnjDNoWOOf0lhfWpZqZ9IZF1uQB
	mL3XwiDhGQfDSJWeAC0pU20sPQAz4qJNhW3CYAStgmks4VoxERLY+cYZ
X-Gm-Gg: AYBFou3D8x62v1U2dO/14P0zZ4Or+ADe6eLDnNpXKxirtF3pO4JqYXvRnuBWy2e8yXT
	sI9osnIrCMEsTJA/1jzqLMyZuE7y63p4LVgKDVi/8uGFmAz5Y05WKjibMsNTo1N5b6xMLDwbg4m
	kGY6Uy9Mn0aJPIY+YalhhuZDNsIdZfJ3JCV/8GxvB2Ib1Rk7lN1EcYrvUqLKoV7BDPevsoktMrE
	4dDkrLg1b6kDtA1XKE7sh3DwdbzgV4G+MDqg2DRh85Ltwg5hkLwm7a/QyYU9LxChTx3QuQqlOmQ
	GeBsQTwadyO9NsOFv4LwZT5SfmtUYz6r9scAwD4eieAGyBzOAmVso3k+WzNFmBxgKra1SSG/jrg
	wGw9uri2FycWxbABtT611Su2dFb+oUIhIz9E8QiBtxTZtiIsaqibMa9aTjf8mQvoz9tsoYnqh3w
	IeM1PHcGVKMcJ/PMuyHFt3BuaFa6nMMGxpiA4vYgvNG37AbjIB0wg8CWbFRfm6cTdpdhfSTJkkC
	D0CyageNUgz
X-Received: by 2002:a05:701b:42c3:10b0:168:6ad8:e89d with SMTP id a92af1059eb24-18511eb6876mr14641867c88.11.1792459779536;
        Mon, 19 Oct 2026 18:29:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm49277908c88.11.2026.10.19.18.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:29:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:29:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: qcom-wdt: Document SM8750
 watchdog
Message-ID: <10d6863a-67ac-42c4-86b6-aa3b0871b502@roeck-us.net>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-sm8750-watchdog-v2-1-b16fcda275d2@oss.qualcomm.com>

On Wed, Sep 30, 2026 at 06:32:05PM +0530, Komal Bajaj wrote:
> Add the SM8750 compatible string to Qualcomm watchdog binding.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Applied.

Thanks,
Guenter
