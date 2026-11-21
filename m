Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288244;
	b=wr+uES+gmyhJIRs9Sxp0NFUgAYHkgEVcQ2H1klJq/GIBmXtLBmYmfD+/+iFN2TxuN+SE
	 yOvy2eUlQ7g7X8cRYoZLkhH8/cDtD2CwbyGOz0fOog+eovh6pwHv9JNXoSm1TdM3kEfmS
	 cMFpnhgC16a6npAJorZy7m9FDvs1hp8n/GCZMJbbcqxVCKFR0MfGu0PGZr9HAxD18UNv5
	 lI3GkAPmoCzeEJJU+Ek4UNmowFJbLxyPKMLgyOdSRBkOEH8rktlf4im/OFbqGLU+6wamn
	 9dHp/5R6D+ETy6WhIxTYEcy3Gn6DsQKZZgGC3TBwKm4hJoTPG9eJTpDFnjW3eeHYNlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
	b=Xa0jGYIQ8XybeWGQzt7lW7GfbY8tgz3ZPQA3r7sGVlt/E0Tl+gTUIwb0oC3H0ikvRK9D
	 sM8bHayR8yADrj5RHnNkBbLGmPY1wa2oKqwIzE8xzy0NRBF3nIqz/MnyVhpmcDaaw1Qhs
	 +auRcGOHbnXz3jidh7/WChhhf/SCiHNZXCfilhueEKyNCixtW75Qk/ORM97xc9LEPg4qV
	 77B4ebkPuaKnBl9mxBrEIpJRNMvPCZw5Ef++6h5NBVy6XonKsk1xmuhfpg+bo9IpTyom2
	 6X3PL0VZ0XATHhtGA1ICgYzToVJZTyKTe+7v/jTisWsHS0lZ+uUDYBJdy5irDq+Eu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3D606A331
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 19:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC3D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBJufFj1
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55d2dcbb905so723291cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 11:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795288243; x=1795893043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=hBJufFj1Qm0MTosVUdix7CYrg67j4sFwqQyFeUWyKL4F+kVtC07PIqIXq9JSi1b3wh
         /SxqneO5ezTSU4dS5sJZmxsCesQ2MNcfN+fbVZwodKRErXx4tPyNfcNTBdvC8kF0EDjh
         kRXy1NC4XQbhXeZeGiSOq9X/hJp5jx3uoMv/b9kSgmq4DlwhTFJhEq8MwsvoM9hvLkD/
         AOJstP5SehIESYaP/IaV0+ZP0TibC6BN/gynE4O3BdgwCuQ3jA+MmJNl7UxWe3f/Z6zO
         As7O22AnCezZKZ2wHYOvjJDAij/CM0gYuzNitfSjb9RhWwES1spSjOXnMST009P1fur1
         vmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288243; x=1795893043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5OF8cKDgl7yVsTFuf6yQzM67KAU7pgtfoA3oSBKEFY=;
        b=Q+S9jh0F79HVOVIY6E0bq+npWP6JkyGpjWKwFPAXwxZ31VKiIXU4yr6+pcpvehyo6w
         gHtbZ3WfjTIXvVeR9EVFZReHYOGk1MrolhHY2S4rtEN9T5eej4/e9uVxzEe11gma+OrQ
         Ke3VgXg9FycOrIsHYeN6AcFBaT0ly8kZ0BTO6HrLp4cNZxm3zBrjVayVuqTN/zaCBQ4U
         3tIHi+Yh/NjXzNkGE5vlWkO7tENZYJcraOkMLU8/ay1cKhLUAcVLQM8TiL6Fx90kEXZ5
         PQmP89l6vRKuO0UYDZGDbUWiYro3ONTlRlOsRT17qDzb9/GEG/piCvL/dIx0++0lCYTq
         1Wuw==
X-Forwarded-Encrypted: i=1; AL+hErECDZ1hlNe1NfiXpp6//lxbxNJWUm4pFgEkwqCP20MLq3XQhf21l3SOKuT+qVYRhraNwyLWE4O11j4CDXZD@vger.kernel.org
X-Gm-Message-State: APuU4Z+b2VNjot5yQ2CsT8l2od7pt8CwPZuu8XJOT3VaM9FHCJ7R5LDx
	p4CSZ2v7VZTob7Mh124sMzsPgFpF1t8v5PWuxQ+2JwFDCYskuikxd1QL
X-Gm-Gg: AZFdTZdbHSP3nDEs/E5/eVsaUrZOx1bgfwK+b95qy/DSCKLdWqY/SjedKM5cUUJrzqb
	iKa0ysnEMnS2DS/kXq+VLR9vCfH3E1vIFU6Xa2jGmwil9X81N4DZmWF86MoDRrKwtSEAwmHEqyz
	ZLgaboV7dwltLuxQUfvqeIidwsPaa+cWVJ/1nz13UI27ftec6ZWcxysmVnFOh8Jrlb3YTkcXQOu
	3mSYSqSu31KhNoAvkokADUvHYiauuerJtlodSocbKFstC+SwrdriliYtmbNLq4lKKl7gDR53TgE
	fOWzcutnGUTvwJW+AXc0mEmPLwQXvljMLmVKzSQfh+m0KlHBiOHh6x4GDKIpHWA7GT6kcrj82Sr
	Cypj/tPQ5/95W3yTKEY0Snfo2ahv6OSUg7fqE8lFXiquuh63wDhvwfuYfEh4aRKwU6A17TJORjI
	Pi3xSAdc3zP83VlJSzo8fiGEQQXhrQcEvjLxXlwd9KXwNpFIlP+RHQA20UazZLPpx8vfyXB4t7N
	KlVzR4Ilwa7pUPWWDFt37/2UxwnNAtUrU3+gj9a6yrPFrnOsSc2iEOEZCe+yXIUzPwInoWGUHdO
	OJgTH6Ho+//8U3xPIoO2sdhJuWO4IeDFYHNs9eZT8H2osxBV5OxqQL5Z8Ez0PKe5myPVAaNXwgm
	YMDc3xuXX05xtLbmWNlvCttSW/t2d95nNZBHTYy8iHAkyupA2LrmY
X-Received: by 2002:ac8:5c95:0:b0:55c:8dc9:401c with SMTP id d75a77b69052e-55d76ade97dmr125384641cf.70.1795288242646;
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm55854191cf.28.2026.11.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:10:42 -0800 (PST)
Message-ID: <af0d5840-f025-4791-b026-139e4e5f490b@gmail.com>
Date: Sat, 21 Nov 2026 14:10:41 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov13858: Add device tree support
To: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sergey Lebedev <lsa.uz@pm.me>,
 German Pablo Lindo <germanpapulindez@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com>
 <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261018-ov13858-x1e-v2-2-cd35434cfcfe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/26 5:10 PM, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> Add an OF match table for OV13858 and parse its firmware endpoint at
> probe time. Require a four-lane D-PHY endpoint and both link frequencies
> used by the existing sensor modes.

[...]

Hi George,

Tested on a Surface Pro 11 (X1P-64-100, LCD 5G) together with Sergey's
power v4 on a v7.3.4-based tree with out-of-tree CCI/CAMSS & camera DT
nodes.

The sensor binds via OF at cci0 bus 1 (0x10) on csiphy1 (4 lanes,
540/270 MHz) and streams 4224x3136 at ~30 fps via libcamera v0.7.2.

A few notes from the X1P/LCD SKU for a future SP11 DT supporting the
cameras:

- The rear module is mounted upside down on this device 
  (rotation = <180>)
- Routing and power sequencing match what you decoded for X1E/OLED:
  IR, rear, and front sensors all identify on cci0 bus 0, cci0 bus 1,
  cci1 bus 1.
- Rear VCM at 0x0c on cci0 bus 1 works with dw9719 as "donwoon,dw9800k"
  (vdd = L16B; focus_absolute shifts focus) but it only answers when
  the sensor's DOVDD (L6M) is up so dw9719 times out at boot unless we
  keep L6M on.

Tested-by: Haipeng Lin <jimmie.lin@gmail.com> # Surface Pro 11 (LCD 5G)

Thanks,
Haipeng
