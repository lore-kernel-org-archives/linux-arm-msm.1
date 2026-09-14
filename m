Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE56414A1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376052; cv=none; b=foy5moc5XqFWbfvZmTo2rzDnlOxNjpu6t2W2zSLZDaGP3/wM3oTMU1w9/CGPtGPWGCbExk1FyYRhg0Z+VooyuKYexp2UoZMgswVPjGYGS6iAosGvhFg6oKAHq6QTmvpCShcUz34Uyc7cIUTwoABdst0Rx9SueV7hL6N4dPxXpaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376052; c=relaxed/simple;
	bh=ANcMsf1hv9itPpj5HQUY4c4I9lP2MSHII9NGez4uWHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB3OIz1vsI+cknieA+LiEAm12w7SuQXlVZU/NpS1VfuUSBgQVE4p8izkrp6iVxzF9TJVlgGM+C43TnJmc3XkKAK07VaMAWBSgYft6eFFNGkSZrGAnkY1nnER8cy2v1+DF+S2cdGmBnMMZXLvVpC1QXPn6XDW804c+pqV/zO0EU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkT0Mt/A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxqYVP0o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkT0Mt/A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxqYVP0o"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8KwE1404090
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=; b=QkT0Mt/A5F+4dzdI
	DM4YwnHgp2KeGHEh2ZkFw4epOnczOKAKhZNl4GITHVn++RAWBA2IZdKFjfc2AmoS
	Sv6/VF3XKzxSK6Z2sJX5+lRgWXBUG01QggitDKyR38TqtqiffF7k7FLYQGGH3jGf
	hwJ0gOUPuxYIP+7zXxZd7D5qLKt1DK5VdP0mHOhjjHTzY6+s7LCetMPJLdugBBec
	L4uePynHxzeEejEWPviSd82A2j8vtQUQy+z+bGifSlGyqCHqQQMx8+a8qwG8GJtf
	8ZUEsrr4xQzuz7vYPh8JsjiU5QlNRkozGeZEK1IuxYozUBm7oJOx3ASSP7n6ZCae
	NzRUoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r3gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:53:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso52324385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376038; x=1789980838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=hxqYVP0o7i65nOz92Nkp+RYoMOwe/J6AsqQt72OOhoBz0Cyg32/jmzHXBGGqg1UKe3
         BQkDUACpdqDfG79+eqnDzJnfbcBR+rp/Sd0j7KQeknpLRgYGIkTV0k3ulKvNaJ7UKZoA
         DZuryJObxBN7X152j9gYtxJC5/8HNPRFomucMebtxteha0s3K8ZRBmxkbm1GQSwKKfG+
         wV/ZYuDFYCZAL5h215X/F/iKLbWEwT9rbDGkOUYnFXRKHWBwV7g5Zaq6eK0+mEFX+y3O
         h/sJVsGL+jrPbVw+fcU47m+zy5xI1HooWwNsSmDhe3QIBso3nf07Gs4IdXpNjacuWIh8
         S8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376038; x=1789980838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xib6kAdN7wXOhJ3RTthmWZd1RIgwYetUlCX6bJwfoUY=;
        b=DxqOcNyOatMiiYxcAAiDTH/RTHKENCVEtefKi6gdvalODzMqeqc56C3+ckyMj4MPak
         JGOtRFcoGAefSFzjaf2TTUDn+l0GsHlBRfyrIftsoZBgAh+Q1j0yOFnTSsJJjcROpjU7
         kNBL+GraWFCCX9oUk3zZj0VCdns6+k08zeW1x+BA4gRISk58ASt0eTBZH+57xIkdj9tE
         GQkCoIqTwQmcZPhJWe/h4ve6gpqiCAcj1zDC54Gd+Y9kMDKAM/1yeNxzFS01PLFG56yt
         ugu6pzxa8rbhCuxpHmVl13RvFVATnjj3K3JwrEC1jp5sde6sdEUUNyWwkOsbqb6Pq4iw
         Se/w==
X-Forwarded-Encrypted: i=1; AKwUvBxdqA2tPmxVeR4ZTN2RPVQ4BFntKsPjLdm9n7H3O31/jiF6o8D5C6uR0+1bL7WsOTnn8vhZN51Pu7qHCNze@vger.kernel.org
X-Gm-Message-State: AFuF++kzF3My9DkTZdiQ+8mH+XVoECT5Qw81JXbysC/uYp8pTk+XStZT
	7G/0ottdVZY6p1JA8woo1Mxl1wp5+9nxqxzI2ribhopCBgv5GDE7UxU7hRZiL0N1ZA3lqrjf75r
	PjxF6fPI0EuaphDtgLaHQMEW9B/15g2+DY73MPtEg7MnHkGWw1EGG22h5SApT0NHfIEhf
X-Gm-Gg: AYBFou2MANxI04hSvhdk6y60m9y4dDfgKbtXnhlWJVd9AVzwwVIfs8O1Z+iSg0b/zCp
	IwN/DXLflczk7xD8vLUgJIOktyb9rXM9Ukb3vUAXIntpchsbP96OdG0mNO0kQS2ieIe9VS8zDmF
	38QAFik2lSnt7iuuDEjPJWvEg5qqgGeJPcHlfLuft383ELTamXn3Btx5gUB5OMC8FKy4am3LPJA
	nmVbVwe+LAjPNlKfqFXYmJOvgbJNRyq4ueX1FKA2hKclTdOjr7pnuBitFffItUuzBNEcXOvToWt
	31lMwlVEIzCUxRusY2LI82vyvZguqR9aEwM7b0NTIZxcH3Qr62zyPmkmhevDXOkIIdw5SQAskzo
	by9x/CXLmoDjvKXMs3JMLpw==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177851885a.5.1789376038462;
        Mon, 14 Sep 2026 01:53:58 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr177825785a.5.1789376033280;
        Mon, 14 Sep 2026 01:53:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219d0sm389755466b.18.2026.09.14.01.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:53:52 -0700 (PDT)
Message-ID: <e59619ce-8ae4-4aae-b617-f0f51c339094@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:53:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX4HlkVCWrVO9/
 hNqOXwMXntSaXzGSRB1Uhruy0MU58lof/WwNXEsxqIf4pbaFyTA2TFG8jwBBnUECVVnAv6O4JYN
 0+qrMVYAU5srwgRTEYX1ox0Zne/sEzo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNSBTYWx0ZWRfX8Zki5QP7n/cv
 /d1Rwjp711IINVNInTRQk3+ErTWqtB19KnYOPO0okuwqKmcFQ23xMTe8CCBEssp83m72eJO80r5
 HMEvdR2v4QpuiAGrAe9SeJmAwimVFxBRgNggUJMEdHKKFvDe1a3WWiavo4wOzNAtFYb+MOwFNC3
 HcJkf4MU43q3mXFunvyl+laAQulzMRZBJEVB5F5aNryhHqHLo4sQfikncfOIakT8bYOjwViau5z
 v/v5dplPdNIH7yqiCbR8gy4hb0V/zujyHSKUkEBkx9jh5jLHOzMMUdq5WXujJUHfZsf4eFw1a75
 W2PMtuVpD/qxh9wVvj/nvAo7LmWC3eGn573H6DJY4lQw8YWo6gv8XZeMxE4Gbn5vkt5UjMp/Ccv
 1u81iiuGSqFO4BAZqex2vc0Sy3Uk4LtJ44yBWZZweoYnbH7Q+VrThnosAtmpvwG3KwCuJYY9ZpE
 hEDgmRSxmqK+l6g8jcQ==
X-Proofpoint-GUID: pi-WdFo8luZb2Sjl7rnHK6UDDfZiPPsJ
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7b627 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ReQrK21VLLPqOcHKNgQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pi-WdFo8luZb2Sjl7rnHK6UDDfZiPPsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140125

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&usb_0 {
> +	dr_mode = "otg";

This is the default

> +	usb-role-switch;

And this is a property of the controller, please move it there

Konrad
