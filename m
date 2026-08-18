Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3846C83B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056888; cv=none; b=jQbW77ZJW9p7AxM5FzamEc6ksYNAeYH9K/j9YqBJ8087d2iM16P32X9Cjlx53NV9QJOPm/gS8AdE0lBYYyxTovp6kPnBZK+VvNWsGtS5oZUiV5xTyxBOcUzsin1ATDlHQVo7iuIbiTNtPcJ24rZ+cME5Uwz91WIVcUZ3hrYdMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056888; c=relaxed/simple;
	bh=6QSkho6K6D4RepOlHx3goC1YGgDnUBI/Uahfbn4C2C4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Usqj3ghddeItXRh/hRdOlK99XdxGXQplOZ58kYSfBVcwZsMlAyoexqvKtpBcXhr3ikvjiFPPLHzNlflSAhwPu+ab33CyduwA5GB3vC3AyvfWFLo/ZW4+4pzV4JZs/C2mW03tJLO35t/oW4PZ1OUNcHfh9hKKWBU65qAMZgPtZf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhvHLXgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZAVzdpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhvHLXgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZAVzdpP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABUSt515203
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=; b=KhvHLXgneagenG7a
	TJl2JpqPHsu5Z/eDKgyCRQbfOeg12kT/Twe9rQZNkq0LmAvE1MumCePkthFm3joP
	UWYMd7x5bMKH0gYSDBUl2aB0s4rpvV1g/6ObFBjlA0xXR7LzeNx5wGTK7VRzAGre
	bAynitKFD11n8EKTmlr7gFlTQBap31wCvuua6f8HPxoilviRQJwa7DyRXZyyvIbS
	XJLduckqkE2daAJfZh+rpZB+EjoKiP2J9UqLwVCYRIN707KlGZ0xLr4nHz77vIdG
	/YyPgOpwpUtQToYmndD/NtDBBI6hnhfs/jDIYP9VQfnqS+WyWwUBtiSzKmZ3JgyP
	JxlmLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2jgfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:41:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936bd9b045fso6747085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056884; x=1787661684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=IZAVzdpPdj4n+VrP8jR7HVHnq/r1MQxzGZ78ibiaAKr4EVeGrVJihSSMMrGjAi7Bae
         C14Y1NjTuop77dUUwaA/gvwz2H2tlCcxeii3pSDYj+JKkLguLfaOxhhuSWVgpXEH336Z
         F2cMLOnXwsKKcwXh0QzJ3J2NJd3S/7TshSFPlwCMXHdTmLJXsdAKcM7a9bglO23yyJ4b
         UeDWbylHSJ7b/Su/mZTfRhdnVzHw1befpqQGYb18SiyOLw9O3fuBZwYI5FxkTB4vFk2y
         +u+4KEgE/6Jrxi1BlmO7E2j189K3/jeUDeN8YdrNOomeKg4hkzXwfIaBsJXs5A84cFk3
         6CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056884; x=1787661684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfFYp5KxQ32tNseOFClbJYn6i0Vk+UFQrS6NM45qp7Y=;
        b=Y0duYeaq8Y89qwPYj3zxuzodm+QYp+0qdwz5iLWlp/GPiOrDIA+0VkDi7xbXyp52F2
         6zsYO9C0dfEO31rLj2/ha5m2CQOkbvG8ykiSJUYAqh92nQxlP1Czs4lNiMbaTWYQu/vM
         03LjMD6i4IxQyBIYPXX4ya1HKFaHS4SHV89JRA8uZr6AZ6Ya0t+2BMYG0yIrbYXRt0ZV
         huY8xVafLJEcwSdP/9TezGbXiNS+vozEleS5NEeQdHCuO0aenENPjPUQqSkv8O8VeTOB
         sfjKiNULof3DPFFaHAPpM8r4/qlE0QsZ8oeWrki17HeSxlIJvN2RDuUsvUtKq10nWxLe
         FnuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsF4TBhWd4A0Y+DtqrYOYl7DXq/w9RFO+PwmOOw5Jt/EUABmLV7DlE2ecu59vEdrtcfLPAeUpM0dRCl9+U@vger.kernel.org
X-Gm-Message-State: AOJu0YxkImX1EyTPBiPjuhhYw5qaOLfdpLjLWjV8L9Da3t1br7qpjX/N
	2H5UjBK/wQEPTJr6I2T5y6F5lZqRAyfqlN8i2lF9XhHMbc9A202XkN/ZxAu8DpbRGarlPQN4m9F
	uUx1MQ9Cg2+nZHFQatLVm8cjgQs32POYhRO7uNii7BLqVzQYcq4+Tau8FH+SREHrmZZY1
X-Gm-Gg: AR+sD11NMQRw0ButgRY9KjJyhKUDX4Mp2gyukTqftGaYqe7bkAqu1RqPqUT51Osz3en
	pQh9izg6gYQTRXJZ57KVw9yf8WV9cPwkfv9d/KgA0xUf24zpCY4ox/0LpgG01iuId+ve1MIDrhC
	SIH3zUb0eT/3qrKu/dEkJuuuhooOYZZW14gNvuZgtJNATvxSlSRocGRnpE7rOsWUvCXJGfBWvoX
	OAiG7rsJmtGXRW42JPfiB2zdvyscZpV7yPbel3g/UBR0LRsiuxlOn4NgwnnXNw67avwbPwMmcut
	y7i94gSoqdZyIc7VZcOU2vv74WWZLcUchC9sS/OS3CamHeo2scWwIYO6qUsrpAF4uwLT2IvGpCv
	3MTW9nW/eP5fAIYHsgjmohiAI
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611789185a.4.1787056884519;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2611783085a.4.1787056884066;
        Tue, 18 Aug 2026 05:41:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97a22sm140036766b.42.2026.08.18.05.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:41:23 -0700 (PDT)
Message-ID: <1ef41a49-dcf8-4252-acdd-f7f3c1210c55@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:41:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-2-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX5tfnzsawv/ZE
 m1/Ow3hkCk76sHxBXn5+dwcfoGo5XrMtJOsVF5rGqcPyj0T9ELxqkHeImsdqtQ5LjVTaRN8ZX42
 9gDns6FZ3PvkMUWZj9T7EOB4Idm6Nd2uoOIgifhcT3bV+MSQhUOorNHFsUep1unM2HGGz4O+Td3
 ReQ7MaQGUZi57mnc9lQpihTaZrtiull+HiHGLt6fQlti0vOOMbUsnLLmTsmvfAwgyLQTYPtCu+x
 1bLAXk4GseaSB5uQxa2kWNwPucsY62Mkn8lsqclRSSG9vZdB38M6kmQScht14yRI9oFwxf+tZfH
 RMAI/f/d79VvyDPvPuHFhjI1D4RxKGX4jUsBzkToPuTcHN2z9rrbKKnHYqoiOs3gN37H4IijGaG
 WjsGJMtUSYfVkrbl9bWMGp4ejLMBdQZu6kC4RvqmDmlQMmjdMQP85uD3wmnVu/G3zMxm3JOfHNJ
 gCrnxe7KlutAxNrQiQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX3w0COQUJx7Ug
 NifSP9YCzelzF2di5DjePZXstb1vXn2FH0PiHUZJwrZ5HeKPOnmhLGAFsgZ4WossNCr3dcUKEDf
 1Dhb5uotS5dG5wfMi5sVg7UAtbBv+Xw=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a8452f5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=UnzNPPs-tNYotgR03joA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: FPrYjn-_PuBgmcfugUOKe3VmryvIDkTo
X-Proofpoint-GUID: FPrYjn-_PuBgmcfugUOKe3VmryvIDkTo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and models the module
> power domain controlled through the connector PWR_EN signal. The
> baseboard supplies VCC3V3_OUTPUT separately and has no per-camera
> regulator.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";

No reset GPIOs?

You should also have a reference to the mclk pin state to make sure
the correct pin function kicks in

Konrad
