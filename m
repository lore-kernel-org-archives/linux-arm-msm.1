Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E0F55D876
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874080; cv=none; b=dPeTdIZKqp33hSRYsirSKpyxUGD5edA1e+hDcvfl4U8xhbFCYLbRNj8ceEdjKs3GCdaHFPd6rowIImTfHZcUESJKpoI1GkjdrrhlN2aC4vQcJxhBsXtZfrf5NH5hFyCBljvGkfsr+28Ir3pnQk8G1u5upRi8sPPyXy/FaL+DT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874080; c=relaxed/simple;
	bh=RQ4g8roiCImK09lGOGkJ6W+2Czo4bfLHxiAgB+DarvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Np9vrW7/tb/FOgCqAFld/VGF8ftXzIFExfv9OCVlqHhtFeA3YEYoe6EJWKBTLLqExR9VUmfSm3EPIEXBHOzdmBW4dLV5WOmsVvDULW+CXUPW9KTV2Pj58+E7fsH6u9YHw0AHVP1F2nfo149TpqVYuaEaz1L2IdZrr5mN7C1dTxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jGsgMxWC; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jGsgMxWC"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9399798ca61so312263385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874065; x=1789478865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljmgwCAVphhfVW4k+b+cxvt43CtdExVqUZy6qEm1NMU=;
        b=jGsgMxWCro9vCbHnjeRRlB0wAS5k3yajRCqdz6ux/n6GbIKgajUFNcMoSEQKkwsWxX
         JSTrQhAJlygxq6OMeZkkuu0AvF6G1QnaHXFndeUEyuP62t+9xbrF4opqFXrqDSZfohDD
         fWoe19ZDQ2VtdssxhBkZASyi0IK2n9f6816w+7aNdDS/OjM/8q2DYAf8H77icSxBj0GC
         c364fvk+6+9P83wP4oyfs2bVVYndA3MaUjUew8XcUzG+4Xe+0mPlGJQcV+yHLmmpFjd5
         b7Bu6x+Ncs59u9+7ATYKWWFf7G7iHxC0UCBM6b4qosEGgRbG8BNVScPvDh5SwfJIMgCI
         K19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874065; x=1789478865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljmgwCAVphhfVW4k+b+cxvt43CtdExVqUZy6qEm1NMU=;
        b=MZ7VVMT33R4Ay99X4rUJG3eis1/OeiF5BbemMqfky4clI6UaPoEMUqNcc7olAnd8gn
         YGRG9Cu1o21mZdX3FOd2lVmrYZFiY8W4IxK0pN9UBoZHM8hR95NdjPBFb3i549+ktkau
         Of2q1aQrPi/ADU2qh8zjcRSVPcDjcj7k4kmUW5UHIedtkuUxeatpXdCYwQBBKctJ3l6l
         Pf/LJzMlhRHn2P/DWB1MM5QHXJ/VLM1CWeyWHHpIw+ZKx8UcOdlrhAdzDIzsGRl+wxsM
         QG6ZFEyLmXfTjfrUuNMoPvtBM1XcvV0S3PWK2MVfjDSbxuqLEKl+0A6mUeOdxTnBe7dT
         zh2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxDyxqMWiHGo9e+J6/bDv4pyFAPxLhBOI2ZvdtOzfWa5t8tr7IgF6AvZZBvdaa7fLv6fDqAY9HBFeLXF2T9@vger.kernel.org
X-Gm-Message-State: AFuF++nGZJEShkFtnY9HtjESf9ItuG7AuGLa0WTt96C7WEzb45Te2HdC
	8puFIfKvQgjJUv+2USw0gxAyT9T3a1Lhb5dXg7WKXItbErwfPLgDTM7FfYkcHSx1epM=
X-Gm-Gg: AYBFou1IeNe4GMUxYpasmwOjySX+nG2BNr9ip/icKq3D0GdvEdzLn3DIouVQv1ySIwP
	jkaLlf7JdPjyhCWeQWcg+lpr0+q85cmwF+x7NkXNZ/P/+lpjyEX7MzMnB13DrJVkicN9BCvfAp+
	4gj75cEQfr1Hhbg0cN2GHupZx29Zhm57SNM0po9aFzPDViDXy3gW0/6gteijWlcS6EmHtxibCdo
	sghpxBM80UdLQf3F55w2fWUVW94THThxEp+MkuOFIDFJiI2ZHFPvsoruDuk2BrXVu0cwcAerbSC
	mX2DeT9M5ENq5ciphKB8qefcFMShR3qZGvOFvYGqEI0txcayeJ0VXneFfg2oAHG2c+T55uw5CZr
	YtOr+7tpduyzXBHPUkS6FUc1DO7K6UwA3aTDHqATIDz3yCmpIe1Y64O/8xglB/Mm1Qhvx13pInL
	N8OEVqPyGbfffSzKRJAT0teqj8wLwi+uRkAXSPom1MI0lFBc980nUBm0/oIfPf
X-Received: by 2002:a05:620a:8198:b0:939:5cd3:75ce with SMTP id af79cd13be357-93980311c5bmr2025182085a.8.1788874059680;
        Tue, 08 Sep 2026 06:27:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:39 -0700 (PDT)
Message-ID: <abb6c06b-8e5a-4f05-a49f-2aca6ed0c634@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:37 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] PCI/pwrctrl: tc9563: introduce support for
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> This series is based on pwrctrl upstream branch.

I'm accustomed to a cover page that's a bit more informative
than this about the subject of the series overall.  Your use
of --base (to produce the "base-commit" tag below) duplicates
(more specifically) the above statement anyway.

How about just a little bit of context about how the TC9563
uses an embedded GPIO controller that we now wish to also
use in another driver.  So this series isolates the access
to that IP block in a separate driver that can safely share
access?

You might even highlight that the TC9563 is an SoC that
*contains* a PCIe switch, but also contains other components
(including an I2C interface and GPIO controller).

Aside from that, the series looks good to me.  You just need
approval from the devicetree maintainers.

					-Alex
  > ---
> Changes in v3:
> - Describe gpio-controller support in TC9563 binding instead of defining
>    a gpio child node.
> - Link to v2: https://lore.kernel.org/r/20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com
> 
> Changes in v2:
> - Fix PCI_PWRCTRL_TC9563 Kconfig dependency
> - Move of_node refcounting management in tc9563_pwrctrl_adev_add().
> - Link to v1: https://lore.kernel.org/r/20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com
> 
> ---
> Alex Elder (1):
>        gpio: tc9563: Add support for the embedded GPIO controller
> 
> Lorenzo Bianconi (4):
>        dt-bindings: PCI: toshiba,tc9563: Document embedded GPIO controller
>        PCI/pwrctrl: tc9563: Add GPIO auxiliary device support
>        PCI/pwrctrl: tc9563: Switch per-port reset to GPIO descriptor API
>        arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563 embedded GPIO controller
> 
>   .../devicetree/bindings/pci/toshiba,tc9563.yaml    |  19 ++-
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   7 +-
>   drivers/gpio/Kconfig                               |  11 ++
>   drivers/gpio/Makefile                              |   1 +
>   drivers/gpio/gpio-tc9563.c                         |  99 +++++++++++++
>   drivers/pci/pwrctrl/Kconfig                        |   1 +
>   drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c           | 154 +++++++++++++++++++--
>   include/linux/soc/qcom/tc9563.h                    |  19 +++
>   8 files changed, 294 insertions(+), 17 deletions(-)
> ---
> base-commit: 028f86457e822ab9de5b0d6d23efddc1b8b54ae1
> change-id: 20260731-pci-tc9563-aux-66a29d438f60
> 
> Best regards,

