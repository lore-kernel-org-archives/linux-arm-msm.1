Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399373;
	b=kL5MoCSbxuUgdQLaFa1D7R6J/mU7YnxZWHKH7Ew15U/Eex0kZRI8aLLh8VnVDFppMs9d
	 hd4m00tvg1zNOZuRzPH13O4ssGqgDfzSqbI0CbTDhhx3re7k4FlhengJtZdy4b6EGh/jV
	 5ooH8mh/QVQoXuqDJD2xTnwUm2tvHdjYs3LTCWA+0AIvSrlmDM5etMZWiUZLMSScVM3eP
	 FKA0YmxH6pfmCjIdHQJIQ88KyNgPD5DR5rwKyVmhO7tMej4yCkt6A41Gy+fnWn9Euy+oZ
	 55ZHYjOZkinlGLUcA7sNyx6XRCkURNY1gCfuDNmC4K9hIKp9sF8rc7mrcYUzGz34zfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
	b=O8GBQCqS8XXAn7nIFomj6GSVdQkWBvzr7Z+kWdrjLIqJXo9+2MO7C6EJ1dWCYlOQ/7jO
	 lgolqd3+nYksNjKk7qkZ8SVxqSR6F29MJ11j3tNEgPrXFx17VUYdV7fWmTEUVw7qCUS6t
	 ppxzTxPYAObsiJi6/8bLDpGaV/L3jokY2MCXEfiU4ql1eM9Gv5vfPLu+Tt8MT32AmnfhC
	 Ltaz/5BqV7VJFq+Zq/ZALMoVPGQWW4XkkB9lF5TmbVZX1NiWX3MqOvTZc/DAB1Ko2gFCO
	 kHuJKLmBExwFL8fSgPHwpg3G0Sq4nKSlWNnR09UEShQ2Zze9un1HuOn3f5F7pBEB6aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A8606A8B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220A8606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qEVRdnEH
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49134c8509fso2558481f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399371; x=1795004171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=qEVRdnEHKR9SJkjIwuqUlDKDa/eqsVO8f8iPfjDn4hG/N9WCGa5Nx2Yzwf4jVz/kHP
         S9iJpa6mOIjzz9wzGG9xnlTiqQFb04tfHmnI2GpXWYoH7Ypb/cYSbYUMfOGZ7Z6pXusm
         26YrjScF08lM9kmPxMQDDfXOV14+jJMUASRjw/dswBk6bQ+pEJATDLKwR1bFJzUYXI43
         3Yr1kJ1/SOlD9lyDQxxHULgcLQtFLfdxu5o6tH1gR8wwTgQSWcNXM5mVk7u1YtT+cEFj
         ZMPphlKliUqEb84X0pOLOA2MaQqmVRS2zr3IeJPU/5O//YJj61HeVp0d4OiEZZJbogkV
         yM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399371; x=1795004171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ShfGnGUwV/ETQzS6rKCsRFXhPpVChrJE2EQuNOxREuU=;
        b=gg7Ym8KEX8kBXoXnnfhYHglj6m4mZmmjFm+JySBad6GKi47yJPHl7zm+s4t246X6Bu
         9W4IEsNqaL3zmKDswgaIHY9bQm5MEYsVbfTe7cgx4XnBKwDhMR8yNad/weXhOYk3Qou6
         av1DPgJE/ktiG9v228MV5qemv6Jx+3G9ym4jdAWJP6PoB6h20jAD5JkToOkvxvg7jdh8
         HJHAyLtNsC5ZUKT/5PF3BFMa++DyxSzFjTvkGrh4/UoKU1DJZiVMtM3c0AKrEY0Qk99G
         n4eRAfhGoN+kiQUHypW+CrPtSxOs5D7faSdXwzDqQRm8QCCm0SqzhOE6/J67rU5LGE5Y
         iYig==
X-Forwarded-Encrypted: i=1; AL+hErEd1DFeM6OFrseTxie1LCOcJbWUGB+iq1fLAPJRo0RDolJs+sbzOrMpy8bvzfjGDMhyFuj3Us++ZVj9e55O@vger.kernel.org
X-Gm-Message-State: APuU4Z8fmhf/ZMIRkh0TCs2nzUkCwkLJSuUaDoPMj6l3Dp/GQLh8vDPG
	fuvwZGwtCLj1ELdcE/Q6aEq1XRWogRWiguEtexwd3pJ2Mbqs7+Af5YRi8a0/0qA2F5g=
X-Gm-Gg: AYBFou24ySQZ+Y6zT6NVb85/sx700NjPnju7Mmz4wYFQ0clP7GOjEcIFgCU9Xif+Zic
	bAdmI7RHu/Q0gkrw4LWzDzRQczc9ptB0pSve4qBRRstQ1UXpX5tZY7HgSYbNsYzyz43Tlzh6OiS
	JZ0xETb3U9qSrF6kPPhGkC7sdgnPFlHI3yRJqwUd5MwAznILssYZ3WmSrkznS06So1aZVL+7Lki
	063lw+IMcrKbahfGR4q55j3V8rbkyXg87VPxvkS21wFnmtbHDLMUnnM0Kl04lhZ4Zj/m2ujx/RK
	an9Q+gMESDVXfPeFcmMCZ6y0eNaOUuKYGHqoKNAn1V4wqxQbABhGt10F1YDa+LJ4fln6pr9MjEs
	uS60eyatXx8XBIe9/rJGdsCZwNx+Z/rLCWWHF2695wI94iWrQLUtO+oNw93K249Umb+PyVKJXVL
	Fo2uxA8MI9NpE7Cd9/0W2WgQGObkb6eEIkNhNuW/if6d04czOusEVj9lR8NZrgbKJItNjZ/dnJE
	C63EwiYvgJvhTFXuIWXkCr9BtZH9omMhvvDv7ve/I2oOmyHnDbn5wZMhMenOVO8912mv6A7ZcPl
	W7VyI9VVqiP6aXwU9pkCMGu+0JY9xUku5uBAEGX/oLfO5y+AK0ENisnk
X-Received: by 2002:a05:6000:2308:b0:48e:6f76:de9c with SMTP id ffacd0b85a97d-499c6e9636amr3846243f8f.28.1794399370646;
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm9544010f8f.4.2026.11.11.04.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:16:10 -0800 (PST)
From: Vlad <tvlad744@gmail.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: Keep the host bus suspended, not torn down, across suspend-to-idle
Date: Wed, 11 Nov 2026 14:15:56 +0200
Message-ID: <20261111121556.1871-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
References: <20261110-dwc3-s2idle-v1-0-2ef4cc3f8130@gmail.com> <20261110-dwc3-s2idle-v1-2-2ef4cc3f8130@gmail.com>
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

From: Vladyslav Tymoshchuk <tvlad744@gmail.com>

On Tue, Nov 10, 2026 at 07:16:44AM +0000, Arun Iyengar wrote:
> Suspend-to-idle does not power anything down behind the drivers'
> back, so there is no reason to end the power sessions there. Keep the
> core, its PHYs and the suspended ports, as is already done for wakeup,
> and mark the device as being on the awake path so that a power domain
> with GENPD_FLAG_ACTIVE_WAKEUP stays on as well.

A data point from a Qualcomm board where the first sentence does not
hold. I have not run this series; what follows is the existing "kept
for wakeup" path, which this patch extends to every suspend-to-idle.

On SM8750 (OnePlus Pad 3, v7.3-rc5 plus board patches) the controller
node is a wakeup source, so dwc3 keeps the core in host mode. The USB
GDSCs are PWRSTS_OFF_ON in gcc-sm8750 and the qcom GDSC driver does not
set GENPD_FLAG_ACTIVE_WAKEUP, so genpd powers them off in s2idle all
the same. With a USB stick on the port the xHCI then comes back like
this, in 3 of 3 cycles of 150 s:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
  xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
  xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
  xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.3.auto: HC died; cleaning up

With the GDSCs in retention [1], as SM8650 and X1E80100 have them, the
same 150 s cycle passed 5 of 5 times, and two shorter cycles of 25 s
passed as well.

This is the third point of the Sashiko review seen on hardware:
device_set_awake_path() does nothing for a domain without the flag,
and the core is treated as kept although its power went away. I would
expect 2/2 to bring this failure to SM8750 controllers with wakeup
disabled too, unless [1] is applied.

[1] https://lore.kernel.org/all/20261110213346.1359-1-tvlad744@gmail.com/
