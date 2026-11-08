Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138468;
	b=bGdVGfY4uHkg1bYduQW33C0zWbNut0boQwlBqLZX9tcr0EMLhEa10oZicI3ELW62yhao
	 AxUqqTG2wCjAlnL9QgmiEWQWn59BjbppaWkyKTZrNMaRKD8Qnc9I2srgaj6+eUiDdaLjb
	 UtqD+TWFAXV5L/QYtoA30JUX5qGd7xj7thXF5D4YbXhjQKY5V+fk2DeGfy3baHq6p4PM9
	 HCyhqrma9LSvBhddkRLhU3QgAFvMIO59UsI0fy/+7moSgKZgFadnTTw+p/NIacc5SYBgQ
	 QmQl7rzH4bSdrh2Rv5Bt+vZwG1ZyQuj1IV4mOERUdW6IR7CHLULi7ch/qsg5PvZD6tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
	b=yDN/m3FqSGKVeGd8gJZNAVUVfU1B7Y/B1h3tZNMBmdwYViR+QBiADlpcuqDW2qWdcPG1
	 +3jxoTp5zzpngXnOhlF9BuF7QtogJNaWfPBEdLkLo+gVmT836d1Lj+90P8HOyNuzKN57B
	 Ki9JqBenwwgF7msDmWYSGjLowlDlLIyjbqpV27bZs1UM/Z91e4kO79AKrEUwPXyBFDqQ5
	 DcCpnrOXWvyqVVzBW0NdhnYxzfQ3MzYbFQRoDShR/Zw6bvpuDlSZu9GMepnDFk+WdlsHY
	 Gs9nNG36hOmfShc4Miak6nYcZHHAvPZBWcuqzBZPK1jSObmy91jEYXGs7L9BVAf2Z6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17698606D802
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 11:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17698606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c411e139259so4104566b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138464; x=1794743264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=efT2ubqlja0XxO/Em3E+kXD0/D0HEcJucdlAdSpR7OX8FUXvVR5wE7ncHvg+5rUZ+S
         JhtWb6OAHvzz2GDO8f0f2Idz6qFPo5BV98785hXrFsPZGzzV+R+VrDlmtClDJHIsGW4e
         4nORQjeKFQPUMCrN7Hz5pCnhwp1G4BbY5KqhPnnZx8YoUXfmp6o2Vxbzan134QaaFWkA
         R+yXwEqWlv/sdPBOQud39jaVJ447Nw4F3ZN9vGffDt8lZqSZKcSrU5jgoFECHpY1t7Vx
         RlRIb/VrwN2zybiNGohTXcsxMbKFIfk+4W9nVGtUy5e4haTMbU6jwAOw6NQjKBGb2vfi
         TiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138464; x=1794743264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=ANQiF7FFQJfIi5/wInxQmQCywh3LrvxQ/mjNoocjSkgdF60lLehOM6xWdWi0oYvTYI
         v5LITqUCumsN/4h5EGYMEP62+jtn/rQJHuvGvSHjkJ6TywjQuJB+TwEfLj4t2nHwMm3o
         9No6xHXpyBhS8Z6aoQYoMk9gj29CVfepktCR3y6vussgEC2L0I4YIeBGo7K71gVE10CN
         QKOb/+VZ0Ka9NfiLfMW4zmLxtMDKEnGs4KUY75GkqbkarSb07AvRzmiWsdqRvhX6kgx1
         BILnKqkztLMW7YUYwvRcgfzTuTENjuI5SGlUtNuocFDH1/CcilG84vgnthSSfOFQYctv
         kTtw==
X-Forwarded-Encrypted: i=1; AL+hErG7B/AU2UZv5+Tu5YMoeuCV+dMiczgANnpZK2d5IcpSjLpxHwC1GnvTxRh55Sx4uH53V5vNamoJVdNGBdUU@vger.kernel.org
X-Gm-Message-State: APuU4Z/f/BcmUn7f3SQCdVHdsuN4TlOIKxz2DnwCh/1zRUItPAp4uYpl
	So6KJ5eHYK4EtOfen26ImnUzw5rqYjquCXrRI5fC11WdqFgyRmyfPi7dYzQ8AZMh3A==
X-Gm-Gg: AYBFou1Y70bDpXfbwVrqTw0DLZzgoJqalyovPHV9HtZ6kVq6h1aKI1Psnt2jn+9UY0w
	hY3U1MffBAn7vRfSHYCpVTW0wBpuSMS0yuUsDJGrBcXYSol5JH9m2ACS5YogMP1nzRhIVSDeRkj
	Yk0jFFdFb962FGr/E1H6ZuXDBFc6L45LnI5gBK91kQSecAgWA5LfXh5MhHN8a0bRyBXID0veVkT
	piyUAm0q8hSjGS7wE5ovBHhXURKxNfoRpbJpRnOyXunvMzqhvbaL1ub2+EN5FTE+KCf3n8xZkAs
	IFVtsBt63XWTVHD618s0ui6F7hZmr71sZt7/rlJVE5Xf0mCVWbWCNEGeGh29FxK9vHwRlkpZE1A
	rDD9N2amCB3qvBxHoBaMv4tkkQjJza23rbwR6AJkwQcDpgE26wDFdA5H2UBhozuyhJnpmmyrE7x
	SVaECIvNmpwNh+qF7al2EHoHFedIiYasi7cOb8eDFWh6JWhDrui27nKQHko7cn6yXhfD88EpmB/
	Tmq/7KPiHL5BPEgk79Rai/n+AiI+c/n6ii5kfHkjlTe88jUTKvppacZczO/fWQ1plBNpEyBtIGI
	8eHHQd4v1ZG9i0cVvo8jHtOQ05/G34t3TgqgpPFnMAPLF5EhI6ZXXQSLt7YozVLX2dZlOfslG1y
	bpEVOoDCPAiIDEqcyqO7Ye0yhA6Yao+TFdqJpjslMOhId0Wb2Gpen8mBt/YEeKc/PJc9yd8vn6b
	eEkEH+Km53tggN+oOEWRzIGoRsB9MiR2Gv8z6zTADm00AWz2wzCLHvc2MvnkCjHkMK2UlMV8WXq
	ATfmXscvDdvnRYZUjjtF3HIpBHkZ3hBnkk7Jw2Akdy+otLcZ0vn3b3U9GvWZm8bV49Gi9/nzTkH
	7Dv0fsOCOSDt18W2ow==
X-Received: by 2002:a17:907:ea8a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c4d6d7ecd22mr95115566b.42.1794138463689;
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4751desm55022466b.43.2026.11.08.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sun,  8 Nov 2026 12:47:44 +0100
Message-ID: <20261108114744.125675-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-4-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:15 +0100, Robert Marko wrote:
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
