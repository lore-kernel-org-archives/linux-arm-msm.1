Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244685;
	b=aFkdAEXaGRablQnVCxz2H7yIlO39Bx5/pdXHY8SU8kE8E0uhOmAQR9dDCW/E36hyWKWz
	 hbWiEEsXIXj4ZFBdn6NK+jVMx2ctWfUYlYhZobO5OcHoE8H6BE3X5ZHkz1p84u+6PzHyo
	 o6OomiGAw9qMIGU1QUF322sw7gO7oxZkwzadwqzhFlgkhkyHrirTFHOu6LOzLDX5Q0yen
	 DB1n7uH52rBw91wBfzwXuYCi/KJ7b83MjBMrLzMWqYrakdfM5lLZHG0sXWFUyBrPi4B+r
	 1HFLm6NhicKpy8JjyfY3QEmG/MEB3YcHK7FLrz1M5HwS5zGw4/iqa9zDc05BhmpBr8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
	b=YhWp+C3Rz875GpZqnI3sTcfrPC0Pp3OCFR4GPKnz4PliOPbBEsoEMrHESs+Bp+rEY8HA
	 RdUgGuVJpJZw30kkxPaqZZn6COCU+3QfGbNCBTBAZvetH1cfsjqWf1K+jfGPwg6EwkMVf
	 6aVd+HJ2g8oYFSZjqPhTXDWVA1uWsDklzC8JMFJszvQZvZuojRqxnA4L5vjCq2iNd/SIU
	 wmDDXvAOTSo6DOmCm+O5rcxuocvwcuL68q9UpwOBbvET/SyG+ag4LxMmG9F7YJSuTo05I
	 S3c9wjOIGZBBiJOQ7w5akEM5vfSAgOKgm3GYyIaPcayDRRe2Wq7JQqdnPIv4JWMoVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2C7606EE84
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2C7606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rmMyyBcX
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc91ddf447so451506137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244683; x=1794849483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=rmMyyBcXW7ALMVD9INlgkPTUsukaT2oxRQw89G8pOPAcS28S0l1nSTZQCl3y51nwjv
         QJXvM07wCT4GlPuMOA1lKn1deIn3urGvfJDtYv+NJ56RqjfT4SMGK9ftM/ZdEFgLDLXr
         RvQYmTjk/m0scfX3E5G4ju0zk9P5VO+lu8rL5oer54KfhFDj+1g9LeW1BcG0G/GAc16V
         vP/cksufXyIYSLVVCNpCjTFv60ux8ReHBQNguejFmP+9XNl0tckQduyzkMvL5Mv8XRBU
         Vnh93LPxH+c7FVBR/1BJWFzvUGuWcXD27J1CFZ4PQ2NCjNSM3IUahWPEtwbrfU/FTnRO
         A7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244683; x=1794849483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2Siy8NkZqN/VokropBjA9uuaJYQWKIpte5yuEqWPog=;
        b=DhOKjgUjZQx85K3Hcio6Be2T+p8YxUQw9KKPpBLPOHXfvJIVibQiR+2fYJtA7ladYU
         FUF6E5q3v0LzRV1tVAUNz2RbuPFHY3bUS26iQejaP5Dk2t5UEkMX8Azhi2Bk9GnqEo8b
         k8cHZIVjf3B+bDwDXsm2O1yRb+TKa7/1+TKxRZ81i9BMFPfSdoTAfnDOpptWTU9U4EA0
         C549dCzeVr7uljcGOCTdxJsl0JQ97ApNkYUeE8ouSAJtXdDa275G5JgdlVqeMYEWDGRf
         rpeYN+fxW4bbITT/MrQV1gkHoGLFMFxDqBV9io3yPTciHOD6sUmzrnuekWxmOYk7O+A7
         MiLQ==
X-Forwarded-Encrypted: i=1; AL+hErHmuDpKyveJTj45iPJYhH0hdtSKp0pm8E/ZLXvAWepsgnpK0Gh9JoUbEmELKPa58vvuXBk6wXaBVacyGyy+@vger.kernel.org
X-Gm-Message-State: APuU4Z9E3tHXpx44FOV+SJ9Fe2/SOigVGWZnQIYfKdlk0MZrr++0gTPg
	//rUN4BhYHvhqzOG8jyLg/U69pYCHtsixbmhufjVa6mm4jo/PJ2rFZrL1wXhROjufnM=
X-Gm-Gg: AYBFou1/Dscee1geA75y1FUxGEbVqdU9+0CFsr10JgMTgQUz8tmLzO1i+Wsz7OKCS7O
	RPCGnvTy4WTXA/6bDUpdkuS9I3GVEXhMMIrnmMh08EqWAjjWTiV26Zrihk4oWDrr8GDjHQhpiW6
	Tu08cAZzqQp7IGZdL2keLeQNGq9TKaL+QpqlpXw/RgAzZnoOopzbUfKf4s7WY1rThI3nL9X5Nuo
	F6HLzRAcnDnm7m6ZS6pYaqmJdr48hA+g/+c5oxwpfkGTUFnFs/uR7BPNJ+4/llirbAqSbihRGDV
	UhNA+tBi3m/ikn0ZQVngJxk6vIL8uzLzQMSyYDZKfvmzjZfDXIPQrIq7Caq0p2BxPczdAPbqGIZ
	XRnsUKcZ4A33CRAcEW2393AGZUh5IdSfPVmy3NSp3A1Km2HxdoNdwHNXI2YpZNP/ScX7OGGOhqy
	D6JQgC52QFt7N+X8xpzYPohhSFCNOTghgBNH9OvhSS4aHCXPe3pvyLyV3nG0EgcEDiyMH1j7CO8
	5xg8dxPbr3Yx/N4ZyHowdlpbnV8Z34fbIc2nzj9Sa0MDgz33b6BNzy6ySx4QX1LrQP2jpNr9w7z
	70DuD2cmDFsZB+3U/zbp3RNOKjYAiPJi+gwtPmQN8rLeyjn936i0MKGY7s19u3zYKq8=
X-Received: by 2002:a05:6102:6891:b0:7d0:3ed0:c61c with SMTP id ada2fe7eead31-7d2db0c3973mr1355903137.16.1794244683474;
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2db605322sm4323468137.7.2026.11.09.09.17.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:18:03 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Mon,  9 Nov 2026 14:17:57 -0300
Message-Id: <20261109171757.76911-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-4-allan@fatecpompeia.edu.br> <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
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

On 09/11/2026 13:02, Bryan O'Donoghue wrote:
> this comment is completely redundant
> Please drop.

Dropped in v3.
