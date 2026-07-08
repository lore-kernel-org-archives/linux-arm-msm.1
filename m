Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C853C3EF673
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549963; cv=none; b=mHezhFLFHAH6vCEU34Xg/RHrt0OR9+IrqvVpV/OI0PPcE2S8ISkXsn7GmITEk4Ie5Nba4kp0PLQyh6I6rfOWQZu9XmWQ0OAmn4OVfCM2rqwEOU5TDhJuqaTRw3m5cJc8005KC6tbYGTYDZUB2IRSLNcuMgB/yULhHFmadYijLzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549963; c=relaxed/simple;
	bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0RTTGjmeU28F4j2wb6clFo0gr92no7BY50Wa+e/6bFuarsGdtKWs9dtDxtcqWrxtnYIzPFeb9oveyl9UyyBHuzmE6ANTk3KJGYrfclh/kq55yqfcyqoffnkmBkvWSyUMA67vz1qYXQqvZA/CgvhE77mwsc7Wmo6EQQ7B2+vMN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XutKY883; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XutKY883"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ba701891so8411075e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783549960; x=1784154760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
        b=XutKY8831PWAz4OdW+oHhI2Q0lbiSDAIBIGxTu4iIHpgQcR2/wAkuVDcp9qC0BiA3e
         IGoL+YrO3FLdDPPes9smBxNHLWHRJyjpYcAcpgnnG7GUVdKhC/RbsLEGqlb0HeyoNi6s
         E93m0GQRPcJhGNqMaVRqjGDZdvK+Fx+8EZthktAHXie/lJZE9wMeQpgwypOQAeqUGoub
         ql1O5xgKTr51pHUci4ogAQk8l4eeFep30vmaDtjzVsn9CmQytCUL4fDk9+N3Der3/Eep
         gzC4hRD8EHN9BU2nxRtOLwGMii6kc2q2qUxI3WrZLx14znosRQQXute5X2vxqgALri5V
         kloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549960; x=1784154760;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuYZPObikWl41A/sQeNw5cQ+pi/Ngp7w32Vw4hpEnd8=;
        b=aAuSMDSm4uNNASMj7u5QyVaQoSTzyVWujrl4zm36hRpkbiR+P5HV4ebQS78XMBa59s
         pQbm6vN2BSK/JJ6Qpw5gSJUp7WhYBHDOIbtMHB3svPNuK1oQSJZaoYnAaMvcXqEvVKlQ
         3DjW1k0AYqcGaxzSX3uNL2rsqmpZHDPLWTmAqssLvgFj1O5DtrKpq+CZeySeK0keo2Dg
         K3yXASD4/vGcWaeqfeY9q9iC6RL93tPx4xp39JmXDmyIAwsFy5KrBWWRgfvCPakla+N2
         KwyVUFV+6cFl92PQ7f9T//Xh/dn8WRBbblXSoBU8t/2gyj1GFWto04XEIVHNdQrdhVVp
         h69w==
X-Gm-Message-State: AOJu0YxqWAtMubt78Ee7FNDUcnDkIWIWdn6LY3x40SfniLc0mWMCW3XD
	a6EI6pRQI/379GGTJTwgnAhnoQEDFINXOBd00y5If1QTSEqHDnx0wC848WYCq1qd5+E=
X-Gm-Gg: AfdE7ckwbDcANd0UDzvSe2sZUioFUAtQ3jAb5rY6CknuRspX4cpjIcArkQUiolkphjC
	UivT7NkcbK73DHXH352wnofe1ouWtUEke3GwB0vwV3wqUe31H6ZQrdIZyy7AcAK423iRgtntEel
	bZWT6ZWNBe5ZK/0uUaMxKx7mWJPWm6pUt7a4FdR6leO9ET96We3QyfN4tf5vSIxgLMz/Wi+zodX
	Ps9YfpJbKRh253mjO46vthvCG60je1T773nFnz1XbakG5whpss2OR5fc096v8ANq9bwMPHQSCRd
	U62xk0zCelRXO6j7pY10+LiIBp9rksoiP8025RGPgF3gOzlQ3J3aMH9+ywUDTE1HacoqmJLiCvJ
	CvqwStBlzH5VOZ3zf3BFViaIXpuJnRRAWd8KIOTc+EJkFjRr7LxXjVo0/hEvFiccUAZK3MB6iUa
	8O+w/NG2wnQofbKyqDTlFjhdnc4nJnCRPN0GjEVw==
X-Received: by 2002:a05:600c:1d1e:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493e68bf03amr41768295e9.23.1783549960120;
        Wed, 08 Jul 2026 15:32:40 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm11268875e9.1.2026.07.08.15.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 15:32:39 -0700 (PDT)
Message-ID: <2d1c56a7-ed93-4fb8-9748-0d4e35cf46cd@linaro.org>
Date: Wed, 8 Jul 2026 23:32:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2026 23:30, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
