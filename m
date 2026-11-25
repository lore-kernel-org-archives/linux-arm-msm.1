Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638811;
	b=eQCH6pIoLd0bqnP1/ISEdFk9YT6R64ncqUWjFdvSx6wmd7Fdr28FQItxLhV35G1G9/5u
	 YRIH6kyy+vThDwqpqHz4+NcyKxmXtrySjzD5E5fapkDZg15w8vM1VkQNF6DzeD1aNCIbG
	 agM7ry+WNG2iy95BMkTVgu+RXdg9Eklwcfv0wTI0+/8V2wBAHT35GucWVCrNXrsLrpL3f
	 UWEOxvjIhurSv/ybR4IawJcO8XTML/l0A+PdZe1cF+3EsIzorKSrwKL+4DS6xs0M36HwB
	 1AKgg3GclGYfDgxFzVAOPnuuUiRD8ktlUvNmSqXnQ0H9drogMmmLRBKWIFBbAGa7z2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
	b=cjUEoLWgXjjUWymVahOBY69tBvQbzHU4bNon5WaHAm/hAzY0qSyhVJC+4scnzIK5wASB
	 CQRVLvTGZcXTZqY8mNcTMv7iU1D+49NlSs3qvqn/1e1KUkt9Cd09sJbNlqCtVNiIkc3fI
	 g7HXigooZXuCg/U23LdLysFttrT7ORlqnU6LuJO4D3TS2nA1RtqW0qyxpobJ5FmARtOFs
	 mrkwJeNxz4vi3ejhs9zcDfDb9zh6gELRhZEfnffPrkjRiM/AgUCEe4BwXKMkInWmqZ4iW
	 Ozlg7uJrH9w0vfv0nTnFmAyNSNiI+1oCVbtjow+Vs+aAKVUbYMO7YK56R4jn/2UGnog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=KRE1YBli;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225E606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5225E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=KRE1YBli
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-862df509d48so4801886a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638809; x=1796243609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
        b=KRE1YBlikOL5/meEMp27DhiYqWuo428gJSlGz4fP/B0FFv3joA/ilc8mHdFk2DXtI3
         fKM9f+1z9NBeYMHGEk6RO+YPMQpPHkfriXIMolNBGM6UyoKSkw0/g1AnDEJL+wAzIWkE
         WLFc1VEzL6Imut0yK8ULesUcGvHa6Odm9L1joccbAc6RFNd1ZGt461nbZyxTc4KWTH7a
         Lyr4BPTYIH+MLrAx3ABdQbQlHvIRho53gPuN0ShDiBVhNIuZVV4Q0Th0LoQ/wAdGNf3P
         B8yemud+Vs8p5+7xNCjoM6ULtp4afDSzRd6/3qjVr81dhECwVYPDKftCF1VM15mti8VL
         iMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638809; x=1796243609;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7VQPtUNRM/ow8fyeOLLOBoYjPKsKPj8Yjd/CKESr7s=;
        b=orde9wd2K/9+hY8tRXzFf2z9qdVljKvrn0erMP5AjQcmi1XNLyfrVEfi3W9GScR0ql
         PsRt2PI5HAA+R3ZwF+JGUQkaQ9rKGTQMKJ9CQ9xEZsp4tXjhyhdQwVBiaSC8v28kztyM
         5IQBfORn9LY3bIR5eeJzwEr2ctmoOsLvNDDVtndk2Qih8nEK9gz6E8m9tcEjFDJc1Ray
         YI8dWZ7l7PR+Krsl6x3TVNlH1m9r2gx2zZDBeRWN+jSe0rmQ4EPVZyW8uHQDyi+4Z6Eg
         9LRTVElr7m0JtGSS4l4CKMQNTPHqZPOQ9XK23+u07F7IOuMXGjCWRQxNmWL1G/X46Xwr
         KY9w==
X-Forwarded-Encrypted: i=1; AL+hErGKLllKdezJLRVgSF200SzGjffxs++e584L1hC9Y8n+Bl0BKsmVpdnSrJW2/WV0eDAPqiBZTvWkhjX6X8SQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9yUUexmtEDsQ/5fdFDkqyrznCLAqg403wW9YhSdfhfZAyKoC/I
	Xyou1340EAISYl+YjkwWLsb6cexBn/Ntgb89Zy7I7tDZbOwHgJIIqi3xak0feoecU68=
X-Gm-Gg: AZFdTZcv9kLjSnnKqYJZP3oilgNdVjpYE3WB8vQsNpo94NdJurslpF7iWIfI/ZgAQpD
	aX0T2ksEIqWcV4Bj70JXQ97a5AYdlB6veVdqbWIADD8eZmi/bhJoD3CEG6IKIhv7ryX0HXorcxl
	ixBaiPAt2eIxbn4/Sl5NtkP78YSk6q4ZGV97wo/PAvZggRVQgx7GIaIav0pgDyrli4BuF9iFDZf
	xeWTIUT4bUDI7WX7adGUDuoO++2doCUsNusOi2vvtmFVXKAtxJjPz7PjTXLPgn0b5Ts724CQ/Wq
	kCE1025E1IAhU09w7J5ubb7MYzvUcrg5ktilTU1y3bp5HlZmscMfEpTsNtiQhd8sF1Br5mqappP
	IhX5QcLkAlzANPbxelVtsHVk89pZuHeZdeOo+4w+jeF9amJ0WBox5k5MKsYZGou4gPs3zO6Vnek
	1LjqGI7qJrxDFHWGv3FkOfh0Jq/qPfamOFotpIAuN1XYXi6rYlb6cr3k+OvD5WHY1VWBy0oY1Lk
	zWBWy/aLPxcDSG79+RMyt+rAXN5LyUzgisI8cTIe06BCA6aMQbePORAOteRbBsgpHy9ROfhU0oP
	6LhjJe03OYpPvPfrQv1crmUEBO11SmnP
X-Received: by 2002:a05:6830:4107:b0:862:a205:e1cb with SMTP id 46e09a7af769-8630920a762mr17392310a34.17.1795638809214;
        Wed, 25 Nov 2026 12:33:29 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f784fsm13861425a34.16.2026.11.25.12.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 12:33:28 -0800 (PST)
Message-ID: <f255b01e-ae16-407b-8cab-1af030059e7a@riscstar.com>
Date: Wed, 25 Nov 2026 14:33:27 -0600
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
Subject: Re: [PATCH v3 0/3] clk: tc9564: introduce a clock and reset driver
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 2:21 PM, Alex Elder wrote:
> This series introduces a devicetree binding and single driver to support
> the clock and reset components present within the Toshiba TC9564 chip.
> 
> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
> It includes a PCIe switch with three downstream ports.  To one of
> these ports an embedded PCIe endpoint is attached, and that implements
> two PCI functions.  BAR 4 for both PCI functions provides access to
> registers controlling blocks within the SoC, including the clock and
> reset controllers supported by this series.
> 
> The first version of this series included a system controller, which
> has since been removed.  This version addresses all review feedback
> received on version 2.
> 
> 					-Alex

As I provided last time, a copy of a working DTS file that uses this
binding and driver is available here:

   https://github.com/riscstar/linux/tree/tc9564-dts

Isolated in this commit:
  
https://github.com/riscstar/linux/commit/e1f8e40b04137798ffd410fc675d9eccfb1c13f9

					-Alex

> 
> Version 2 is available here:
>    https://lore.kernel.org/all/20261120183212.1264522-1-elder@riscstar.com/
> 
> Between version 2 and version 3:
>    - Added Lorenzo's Reviewed-by on the devicetree binding patch
>    - The devicetree binding now uses @kernel.org e-mail addresses
>      for Daniel and me
>    - Cleaned up the patch header text in patch 2
>    - The Kconfig option now depends on RESET_CONTROLLER
>    - The Kconfig option can now be enabled if COMPILE_TEST is enabled
>    - The generic gate clock controller code is now used rather than
>      implementing a custom one
>    - Only the gate clock IDs are now published in "toshiba,tc9564.h";
>      the PLL and internal fixed clocks are implemented and accessed
>      only within "clk-tc9564.c"
>    - The PLL is initialialized, followed by all fixed rate clocks,
>      followed by the gate clocks, to ensure each clock's parent is
>      initialized before the clock is
>    - Updating the reset registers (read/modify/write) is now protected
>      by a spinlock
>    - There are no more "unnecessary newlines" in the initialization
>      arrays for clocks and resets
>    - An update to the DTS file is now included as the last patch in
>      this series
> 
> The version prior to v2 of this code was included in this series:
>    https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/
> 
> Between that series (v1) and this one (v2):
>    - There is no more syscon, so its devicetree binding and driver have
>      been dropped
>    - The clock and reset components now have a single devicetree binding
>    - We no longer use a syscon-generated regmap for accessing the common
>      range of memory used by multiple drivers; specific sub-ranges are
>      instead mapped
>    - The clock and reset drivers have been combined into a single driver
>      located under drivers/clk
>    - The config option for the driver includes COMPILE_TEST, as requested
>      (last month) by Jerome Brunet
>    - The help text for the config option is simplified, first suggested
>      by Philipp Zabel
>    - The driver now names clocks using dev_name() rather than trying to
>      hand-code a unique name into a fixed-size name array (also suggested
>      by Jerome)
>    - Certain functions now always return 0, which simplifies callers
>      so they can simply return what the called function returns
>    - As suggested by sashiko, a counted-by field in a flex array is now
>      assigned explicitly
> 
> Alex Elder (3):
>    dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
>    clk: toshiba: introduce a TC9564 clock/reset driver
>    arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
> 
>   .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
>   MAINTAINERS                                   |   9 +
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  15 +
>   drivers/clk/Kconfig                           |   9 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-tc9564.c                      | 456 ++++++++++++++++++
>   include/dt-bindings/clock/toshiba,tc9564.h    |  40 ++
>   7 files changed, 603 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>   create mode 100644 drivers/clk/clk-tc9564.c
>   create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
> 
> 
> base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7

