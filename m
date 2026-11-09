Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233575;
	b=dSDn6o1R/8hJQOm0MUmk9VsNOXG6rQldUNWGIlMM1roR1dvdfdCaJtAy65KCrCuSETtj
	 SeDSMbH78Ab5RVNJGDg57tdZ9aZ20cSqvtBn7w1K5EYTi4m/A6AkQrHKtegpSaDHKrogl
	 2L+E+Q939w7AKsmSTKt6To63UnuhGTX5Fy8RKgBohZb5ymbGee6gfzXj4OKZ0aSEYDCuJ
	 RWqC/0GUNM+0MY0IPHZ4zuX/3gjB7iP5XD1KejfYDNWCxrdrp+97SbAsWLOyFzC1D5kBE
	 K7CG5UCw2x08HC4olqgiZDHdi8rBxlpQeHU99AjYBRcHE3ZIyTiqVkHAdUkMN9UOdBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
	b=2KgRXTKKvFpOAcplyUT+bsHDBLn8ugufrkO1q8EAcnghafphDxpguYg9VB79K5OWpkGQ
	 khLNL7JPgHKSHlcJagoXq2qU0y1ZDXYZ5fQcn04cAsZuNJ4B1oFu5ElEqjl1Q2mA1Z95z
	 qxjmh1EWp76lmPvn49spbdU7gGd87qHHXFBhf2dckokTv7LZHucprWhGGnZcYSi+CX5wf
	 /GriuHx94hX/LFDVj6k47ce6v1GbGUjuADm8Iax/VNb6pRvykWxLxEEsAlx4zenVa3ZBD
	 lCCjDYFlth+ooD09hUbbdy5h0YnyPS0ibF3YM83YvecpeToxvFwx8oDSj1rDKB5E1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CD606D805
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7CD606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b7bf1Oh7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aIj4n5n1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFO1I335108
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=; b=b7bf1Oh7IQsoIVX6
	A9bTlRfFlN9+11ut6kbR4bLZ+BEtSBQC3OSJAQfj9nm2dB2OUIo77CYvyRPW1KSo
	8/JG2XtlngOsTyqDAX9UQAHSoNSr3gz0i20O5d1+iBHYN6POSI1CBtVt2JPEh6E8
	vwrnnHFribo92Td0weaceLKPykVdboLdEku5RxJVlNSsGIqctv5e8RNEWKFZNtwj
	M5y5ytR9Z9ES+FmEaHz1wb/1x5xjSg5v9nRUIkDBxBlt+1kOGmKTBor9WdblJHnE
	kc9sa27v3xN4SL8p9UHqrpjHOtUxanaX5fW7YHlYmddU7GuJG58u2128nXwJTHr9
	g4Kdbw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58h5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:12:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2f843bacdso20005137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233574; x=1794838374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=aIj4n5n17YGmIldUWt0Yx6INE98pNRj8L1bQsSJJzU0hGSgcFIIsGgBaab9i/BbcG4
         PB3XEdpYqAZm7g8QeD9CSM/fph72qy4DOPxfuOa12BIzTvzNw+LY7zwFaAYOSLK4lmjL
         bs1gZyfbOMxlgCEpeThJK5Py+uSROyCYqlqhHVFBFbxKAftU5SGxM09GwJXLdGfbDNRM
         3re1j11rw3JAKu2zIjp7o0NQvPwc18q8sHWs0O3D4PhaiXAdMEmv7Dv99xumKmOgMfFC
         DjV9VewoRFdeHVc8chqbrF5T8vLj+9sJthNkhfM5ejvgY6UK+oU8yyjYScKUsDY82JAd
         +tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233574; x=1794838374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uz8j/5ipZtwfQQUYQ+aW/z8tSUvToqrz9ei9hJvoW18=;
        b=IQgXObcel/gAMahJiqksOgyn7Lt0OMlZDWEM3WCYlAAdOYx5DL4HW6ePLnwesTCFOV
         mgotMmaBonVHHk1p6tPdhXjCU9cbknI4mtUjCZn+CM2k/ks+Fd+SOFpYWP9KqJbmunbo
         xZKebD8WSgmdX0zIk7cmPx4mIxCMD4Eo+wjJbAf/mJZg4KsB4i6mDaiUhsyuvfdVkH7M
         SCXRXaxakKy9kpka5/T9Du0AiysY7pef2DacwLNA96SyBB+4mGhL1O9ilHmwbtolLEJs
         j/TIGDKHBWxQ6eJwX3uBO+ApMM0BdatzlNu4ccVakOXGH8z0yCAzkF395g7L6NTedJtk
         GjQQ==
X-Forwarded-Encrypted: i=1; AL+hErFMt1yplkl0W7IhAkvXa5LO+B4Xa566HbKPR40+qnPUp34OT5r4mGEsbZwuQpXRYJD+k/m7GByHr0PhsP4A@vger.kernel.org
X-Gm-Message-State: APuU4Z93hVqTqggaDRtjSYtfmUm8+uLj+sgfqzb9kD8XiRTYR0HvRTv1
	qY2JrQ3cOjy/QQycW27DqB/6cn4knnAWh5Mr4CdtFagvkPy237eU52uAtfvghcMbW3La15C2RAZ
	WaBYG3HNn6J5Zq/ODpUmbeBi/U3/QVY8RrT3A153XCxcJNxj10l2FdGQL1HXrgXVwloqw
X-Gm-Gg: AYBFou094WB+WUrPbwyN2AfdoyPr6rYiYFyf9khmknKQuDJUj9CbuQTXfQLUaMs9Qwx
	gXxWgwsnEonrLL8ObQmpkyiY/WUCS6mPsAf4IsKIG9rZn2c7bFGCaVALmsCe7upg1iOGh87kvgF
	eKlZKNAI02uSEOHRzgxJM5FmINpoDpNgxweRYwkKagIRzJyxVbMD6udChiEB3sBgftJgFdBWgyT
	KmVY740rZmFn/NB3IvH+MMr21yX51WwY7DYel6k6OFSAos3mJo9oT+qaE3FtO/gPfW5poqlVvjr
	oeu89q5K6Fu3nq2ccTtxwdQXpanCkRtFfvA6fPFFPbMOWW5pkY5XjzrBrZKKRJynbH16r/lu2M8
	IKmOlk7KI9r4wNXfoiYuTtrSN3Qz6oUkz/X3cWencyJSqs5zXju2As90HiEvskiTH9htjQQ==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982145137.3.1794233573657;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr982104137.3.1794233573125;
        Mon, 09 Nov 2026 06:12:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm1736102a12.8.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Message-ID: <08a43e54-6f54-489d-9ba7-6cfc6eb173c4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:12:49 +0100
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
Subject: Re: [PATCH 2/2] platform: arm64: Add HP OmniBook 5 16 embedded
 controller driver
To: Rahul Pon <theflyingrahul@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109104914.1534-3-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _HsWWOHSO72zTsXfy_p3gSEMz8lF9puu
X-Proofpoint-GUID: _HsWWOHSO72zTsXfy_p3gSEMz8lF9puu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX+6Qc5Rosvb2m
 ghA2wlmLrwaCc7yVguGcCpHQuNUsBDLIeHfZQO9xalDE8dmIFiQMfOZrCjpzNenssRepA2lzcG8
 FejMjcbPl5XF9eD2HaGmy6SKZ0800uE=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1d4e6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=0yDvZPlJ0jkY2xphDlwA:9 a=QEXdDO2ut3YA:10 a=KfD-mh6vjfoA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfX1/DSyBkFbOU1
 uRvFUZ+Mv4m4Y1jDkos6YhTuhfjCe0aQN7TOFrGvMYEznkDYdH+WbDPiponj5qm+t2dQEbFimeO
 I2ppb8WBJ9kFuolG8v1K384/2vH191Un16Obu2BOtL9cLTQEPqzcfAcYQCLDaIOEOKbzBOyIhsz
 qYKka956Zd2W65BN/wEDJWNmJrnI6eVTmya9x9Soerqzn2lD3MoKaVP39+5ICLD+znRJOGnvj8b
 2dHcEAXzEKXfKFJPtP0t4aa9udFk4gDnFgY0QAdGtKEI/w8r32XBo6sOf/xWrp6c6CkLKMDgEi7
 pQd2QsCloAHBzotp9KShebNj8iGR7G1Y7nI0cWiOSO/FFrn+ZuIsDbX+mOR7zOSCc5Kus7XVOAa
 RPFVuqLwP/w0TgDMZbRYG0BQCm24YdzLVYn8nhPqYKvVspuAUK4ZTysvuq0XwQJASfGocelkoFN
 Z6Dd6CT23TkC1juW/WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 11/9/26 11:49 AM, Rahul Pon wrote:
> The embedded controller of the HP OmniBook 5 16 (Snapdragon X2) sits on
> I2C at address 0x76 and takes commands through a mailbox: wait for an
> idle status (0xef), write the command and sub-command (0xed), wait for
> completion, then read the 32-byte reply (0xee). Its interrupt line
> signals events, read from register 0x00 and acknowledged by writing 0
> back, as HP's ACPI does.

[...]

> +What:		/sys/bus/i2c/devices/<bus>-0076/kbd_backlight_level
> +Date:		September 2026
> +KernelVersion:	7.4
> +Contact:	Rahul Pon <theflyingrahul@gmail.com>
> +Description:
> +		(RO) The keyboard backlight level of the HP OmniBook 5 16:
> +		0 (off), 1 or 2. Only the backlight key changes it, inside the
> +		embedded controller. The attribute is notified when the EC
> +		reports a change.

That's already reported in <led_subdevice_path>/brightness

[...]


> +static enum led_brightness hpec_led_get(struct led_classdev *cdev)
> +{
> +	struct hpec_led *led = container_of(cdev, struct hpec_led, cdev);
> +	u8 reply[HPEC_REPLY_LEN];
> +
> +	if (hpec_command(led->ec, HPEC_LED, HPEC_LED_GET, reply))
> +		return LED_OFF;
> +
> +	return (reply[1] >> (led->index - hpec_leds[0].index)) & 1;

"& 1" -> "& BIT(0)"

Konrad
