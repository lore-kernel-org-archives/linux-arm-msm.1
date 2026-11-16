Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808399;
	b=Z52PnkeHDBhKPxIy4ejWurotfS1mxMHCrEHvt0WAU86AA16qqblgwOlwctqkgA7RU5Ud
	 W7eyn8j3Hb/VWsOWAxVDjEFQkVS76TAhog+B9Vtaq/IWyIeT7KZ+XkrO4e9nmWDxkFpMZ
	 9avll9HDsibC1AJ9Wewh98P5UO9i+D1L5Z+kqDezlKugTZw6z6i/5jlV23Sc6kcBgNzvb
	 qqofBNUXqYaozu+s+qb/xD5qNq3+SJlQHmUn2vMpARCuBF27zlTorAXWsEamkF8rbsVRi
	 XJ2DebL3Swy3xhxvlPfSnwkw3S+Q5n4YdFDviDzzawMEXYjYtFaJhOyJxrfA41gI06Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808399;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eOwVzLDlfkSi0YjT0f74v9O8KdDB1ij1EtqULwicacE=;
	b=Af18I+7BvvvsV8e/KeaJUCYTxu9Oot+J5804VCFhFjg/yO9FooB4/f0PB2n8aLAZpGZp
	 FQZtC9aHzhXn+bfXxsjkcENKF3MrMJ7ohV30DgfSjBUnDAL8b5CLLE/IowYRrkU7kjuoJ
	 anFb27AtyF8XZhIFWTUnfbRUJO24i3s1QNWnfzM0JYLeXQ9wey70l8+YYTDti8ldvRgOC
	 SqV/9++6gsS96/+UEv51Xg3NNqN+fdicW9/KGU0k2wkBJpMhrQ/IGIBeDBtFBXzP3bc3o
	 nt/1H4z18XsrKQ8QiXEOpkHNW5N5lO3rLM+dGSNByD3XHIvr7SDhkIJNamfJYPUGKLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b="T4XLHh/n";
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07143606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07143606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=T4XLHh/n
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uD+FCsVNWp52CztDUUMpqbHdeuM/UhgnchIo9AuSFIo=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794808397; v=1; x=1795413197;
 b=T4XLHh/nqO0wmBVvTuTGjCvoM8HMbhY1sz3vr8TIfTESnPTn8vu1yYNkXMSjqw3bd6yPx42K
 HwwWXHFScGlgu5WEhPdwpntBglzqvCCKlUdiGrthb1PDJcPpreorX3sTqqjo1mjmf8aCpMUqAUb
 1cgWxa/VktYTP3bNo9yOXjyT9zyCmUUqmWuCb5SsimSTiQmK6nRVPZ8LCQMRegM8Yhz5WL7ZXTo
 1k5iVJFCjUmEReuy4vRsg39mp5qTDslJYjVhOfI7NiR4D2lK7n/rAxfRQvd+iLaYn9PTledpuQ6
 vM+Gi4gwfvQ22tKUT0x1y+zMD66+lgRYmn92dlVL+x+DQ==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dc7e3a2922be0e4a;
	Mon, 16 Nov 2026 05:53:16 +0000
X-Mizu-Trace-ID: dc7e3a2922be0e4a
X-Migadu-Flow: FLOW_OUT
Message-ID: <fc99d887-dabe-4461-906e-c40fed5d1889@packett.cool>
Date: Mon, 16 Nov 2026 02:53:11 -0300
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add ASUS Ascent QN10
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261115-qn10-v2-0-19b11603e776@oss.qualcomm.com>
 <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261115-qn10-v2-2-19b11603e776@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/26 12:49 AM, Bjorn Andersson wrote:
> The ASUS Ascent QN10 is a compact desktop computer based on the Qualcomm
> Snapdragon X2 Elite (Glymur) platform, featuring an 18-core Oryon
> CPU, Adreno X2-90 GPU, and Hexagon NPU. The system comes with 16 or 32GB
> of LPDDR5x memory, two M.2 NVMe SSDs slots, Wi-Fi 7, Bluetooth 6.0,
> 2.5Gb Ethernet, three USB Type-C ports, four USB Type-A ports, and HDMI
> output.
>
> The HDMI output is driven by the eDP output through a PS195 HDMI
> converter. The four USB Type-A ports are connected to a GL3590 USB Hub,
> on one of the USB MP ports. The Ethernet controller is attached on PCIe.
>
> Introduce the DeviceTree for this board.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> [..]
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hid@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&kybd_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> [..]

Where's an onboard i2c keyboard physically located on a desktop mini-PC? o.0


~val

