Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098229;
	b=u/rzub2VOQ0EiZ9CbqatndNvkxRPGFxWOvg95AHcQzvV1Drp1YVieCvXzEuDytATFqtm
	 2M+q3Yxv73OG2jeg6chxihOdHzFU8lpluEPpaAcld5uci35OmQiXt48n/IOzfyD86azjS
	 3xpI916xOkNAQGTOQeMmj6LmjooR+9VYdCQ8YubpyVOTD3dleDBqz57m6aBf3k9ASrmd0
	 7JnlJ0lnjlb+X2Gxga8T7bEc2hV/reKjMYOGpgwBpA1yqi3oEUV5Vz1rZbza/RmSUqvyY
	 Uf1Msf458zRAAICSE6LGIloxMLo9IEvW03o13ckuAMK0HK+HYH6hFxef0ZQUmpPXTJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
	b=xfu4Y5FvlViH4t9JP+oaoLvRDOJVnURErlsfPHVqhVcdzfC6QHkV1o6LIVqzcgDyiirG
	 2DVHYqXQooJuuSpucSUIj8DZKrF3rQ3rRJ2dyS9Pl1Yec7lyrUwoXSx5/BHWXir4NmkJ0
	 neFLR1eghS+a4OC2M6r+zzLTQySnI7hT1w8cBWQyfaCQBeY5azjAVvd2S369H00yxRnru
	 FJZa2ikVq+kIUe3iNyRE65FqN7GqCqsSvXoQzkufxAmh12mFcTxbSnEuNEHbDTwLAbhtq
	 dOA/qRJs7h8e2BTh9zcS/MVkGU2uE3NfiiAvQITbrpdlYQeDO00HjrnUQzuXBTfcpMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A5606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 14:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f037bc348dso3269655ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098228; x=1795703028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=RakDrLwKnpFkXQ5x53xU+/JtMeb5PKs/XkG/jGg4XUbPrV73tNZs5tZHokm+sjHSaD
         R53c42cI3ZAqLjcvQeKkxZnMlquo2wkjbjqxPk/+SGxCsClwm9WbYqtlckHmdAMLAW/W
         sCiIayoTguztq+/dzFAq47t/Wgeni9PqjkfBR/GKPGF1vnphVLQ9OSbymwte1rXoSaNM
         SoSH6cEG/+tzOQwWZDOZVZXJKYCAEGrndvMQdcryCRTXj0asVWvOO0gIYKrjdEZhARPY
         FJ5yFBp4vC7QWuTfm2RHldZSJvR1Eo78YqbRmFO191CVsS3RVXrql2nTN/cbG/6WKic9
         Sx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098228; x=1795703028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=snWE1OQmQSRVwJXHU1DEJrMNUlfp1iEiE/42GohlxXYSfalCWCzpd6xLlv++pamgUJ
         CaFyHqIEjW2BX/RcQLg0n9Ttf3Haen/GC1DhjXOM6xz7x1zyqWpbL0jajLM6aUgG7szK
         fMRX4jJAmRoh0abVkSUfgKN/ls0nObqGXKzwEiwPuFnd3VEi6ByR1/mZ2fjBUiHTLLfe
         kjWNewbImPpUMKPEkPR+XvPSWFVXCiwiGTivyznEnapKbDAa/ImJ1P5c4bgvYaPER0sq
         2UaUcIZDJ+niwlAplMkdDHCwfAPgLSJB62/BBv6yV6u9zmpkzhS1U2F3Zodpq48XicLO
         NZqQ==
X-Forwarded-Encrypted: i=1; AL+hErHISmCotHKUvErbdyKlE1PiQ4IEAhiAkuwglO6meulhQqfE5swRZu3YJbK3RhTyW3qHI3sziIZFaeRIwq8b@vger.kernel.org
X-Gm-Message-State: APuU4Z/CRGsKxAis1pU6IicJo1axwOQQwZ+hEKSlNf9CPl77aOfub3LP
	dv1bjKTy10y059H+jGP6OOvKny2Fm0zGGBkfv6QMqRbS1mHGAis/dOsr
X-Gm-Gg: AZFdTZdjM5vTAEKSlLW7fDVnf3dL5rpx6Lxr8L0ak9NjIWBQ/N0VmtrtwN6lZuenNt7
	ipOUKsMWyUuC4obnqyu+tRuObZEjeaqNMupjUz4M1lPATzNvCAr4aQrUmd+TRvPgSuH/AaRLLMk
	y6zdm1zTCejWI11MijtTIdUSHif3Sxx7SJ/cS5VqGnM3LvCFQBL5pxGlGGQJT21TuF+0rVkQ3gr
	po1x/5+p5/uTy00XpUiAnPgEe+OdSido0bnt6vu92KHDioq5Z7xOk6WnMuxVwDGKocm6fxZ/k11
	HKNiHluw4a9QYLyTpi3XAiNsLoiOUiDP79U9FcPL1usPHqBC41AZ+oECskS+4FCkEpXqN8INRAW
	oWpeOlvPyLvrJL5uLzMKgFmEro04BT3uWevdiD7xPLDkqZbykLC1LYfOG7OGu/sU5GPZer2JI3g
	ox3CGHHV0q/PPVYTAtn+cEZDxHl3bB/4q0PGtTDaye2YESIE6SqDprlAxDCPv/jaX2iGs4jdhXk
	DElOgk2bPQOQLQIdt5pE+XWk9p2qA+O32ekWmXtTTBiQ2WjA3Dc9MJznfTRWGS/NmLYoVot5ctP
	Q7WznWiJoWjsV6U9+CruQ58JUQgdrzMJCvU=
X-Received: by 2002:a17:903:244f:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2eff754e579mr60705635ad.61.1795098228295;
        Thu, 19 Nov 2026 06:23:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm164415ad.53.2026.11.19.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the firmware node
Date: Thu, 19 Nov 2026 23:23:41 +0900
Message-ID: <20261119142342.2063-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Abel Vesa wrote:
> Read a MAC address from the device's firmware node (a DT "mac-address"/
> "local-mac-address" property, or an nvmem cell named "mac-address" via
> device_get_mac_address()), and use it in preference to the address from
> the firmware board data.

Another user for this: the Lenovo Y700 Gen 5 tablet (TB323FU,
Kaanapali) has a WCN7860 on PCIe, and its firmware reports a new
00:03:7f:xx:xx:xx address in the WMI ready event on every boot. Network
profiles bound to the permanent address stop matching after a restart.
The factory address is only in a file on the Android persist partition,
which the vendor stack passes to the firmware over QMI, and the
bootloader puts no address in the device tree. So on this board a fixed
local-mac-address is only good for testing; a per-device source would
still be needed.

I tested this patch on v7.3 with three changes for Sashiko's review [1]:
the return value of device_get_mac_address() decides whether the
address is used, the buffer is __aligned(2), and with more than one
radio SET_IEEE80211_PERM_ADDR() also takes the firmware node address
instead of ab->mac_addr. With local-mac-address in the wifi@0 node, the
permanent address came from it and Wi-Fi connected as before.

The cover letter says this patch is only an illustration. Do you plan
to send it on its own? If so, with those changes (and the comments
dropped as Paul asked), feel free to add:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (WCN7860)

qcom,ath12k.yaml has additionalProperties: false, so it would need to
allow nvmem-cells/nvmem-cell-names (as used in 5/5) and
local-mac-address/mac-address as well.

[1] https://lore.kernel.org/all/sashiko-outbox-171329@kernel.org/

Thanks,
Joonhoe Kim
