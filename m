Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36873A7F60
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279838; cv=none; b=kD87zoJN8UtjMjnms49isgNp1dCMLf2pSoLRrfoZ4un6r/9ezokEidNwsnPRQvGH57U4LT+lorjlFmDjn2R5/Rs4NQV/wkaX/O241mbu6iKPMjfk1fDzeoHvExMsVeH8u9cfoN9DhFvn1Q+5fvvyybQYkvj9lNi0if9OgZJ6p30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279838; c=relaxed/simple;
	bh=jPNEl4Yoh1ZLXaB9Wd8N1Msiuq1Ol6ibvp5vgFfqNBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g2LHvU1fEL+IXs6T9UTpcSK15twSA0+tVAa1I3sP+dpKxoGBu12kOyyh2uFqt/vvBPUww1nhQ8AyUaOJOzlnSgzY7cdc7U1J3smp2q5HsBmPacLvwX6O1FZibMqx1040nBWC/1BuRIZCBwyp38jWdK4LzdHw3CBuIOW3jzP2krM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVjg5FPl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8irucX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVjg5FPl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8irucX9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cFd31160799
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=; b=YVjg5FPlpN8+7fh4
	+elqgQFxo8rgkaI2AvS9J1dQy68daj7sRD8EipvpMJS/uzW7th/VL+K2zf2h5ivJ
	xTuo1Y4r0mImlncssFzidamVSzpD5YNPvRCrfWOKoj7JGSdJp2mI96D7oWieaNIE
	Yn7fXtKXLDcD3g0h5ftRIlkZn9c1q9V0inrgcDLuX1Kzq6bMxZUN2UCtzhaRm/4D
	Hd98OC3oRAlc84m2wSO4tC/MR0DSgLfBa5WnM+G7aXRoizzbqgEtwuNJXMr+sY1m
	7JHIB0SyPzYx9UjfAJAfFm9PKytKlAhJqYg8yHaZpQkEwI1Q7F5OEAYFcli4f/fx
	m1k/Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3as3bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:17:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5110c89eso187486285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784279835; x=1784884635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=;
        b=P8irucX9vBZFFAxDkfjVMQCb3ozu0iEH14F4t0trQ5eQAeiyFZ9SYd9dgjVdGZfobE
         JhWK4hx4XcQmoJUUxSqOFUSPy3hcQ/nM6y9PmpdXJ+X1zF13+wpgyGL0t72L5e2gnHHG
         XPGzno95WEwnZtGyOski+mbkeMXXMvG2mtZHmxInsdzbCWjGcDACrUyVnaKEQ5Bg6wCT
         0jYolJzq9VkL125f8+6xkkicEayGIY6iB13bv/O2hX87ARUNkjCD0TINnWd/rjfL2coT
         SFSssIoXOr1Tz8GN35hTSBSDn7TIMTKx/qtjGgW8V+KCv84H5/1txN2V+wAyYosNLBBb
         c/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279835; x=1784884635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGQUpW0PKU9SI95eE/1MrXbN+xazx4ocxBKiJkm8p8Q=;
        b=Hgeq30FvA8F22H1NcoEoIXuwd/YGJ+v0cFeKpQ2epqdAzTOg7UImj7EblrmEDymeK7
         e0PsuOoYddbGYSmooy8UXJtyFgKJUpyl53QxBP+kBeLpQbqd5zP382V1GacfvwHzd/9a
         27uk6Aq0s4GXRRv6V85/nXONafG7NEX0LQW2f3evvXsbiohpv2+XqUbU4DIF/3/B4Ijr
         jTs+5DHeNi+0gse+ummNoIv50D9oOuCYn/VVeVBIuAIWiVI5r5AzS8B19fWtrBCgcHds
         vX30rRgs8Z41bUnPzMHZ/MANBH5GFZLvW4ZpO5w+2Ab4ZAUFYMBzRTLsAFKtsJslXRUa
         As9w==
X-Forwarded-Encrypted: i=1; AHgh+RrWbxR69mUz2Ke5xXrabpgTny9wKHMD1wVj12IKpZOaD7xOq7wXv13asRGee/jQW9zWYfpXsHxgwKbIECtq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6nSc40Hwhfh7AYnizfW16CW1S8jmcFMkHoDmg6/L9VS6v9TY
	LLfdogrVO6rWgIUu2oakRJ8meCYoLIxD6/kHBj/Hb8rwsK0XzfvGMUGtaMuNYe2kI8uWClrH1N8
	lsqBormGcU4S9ejd/p73hJPGv2M2jX80Oirxl3Cr0HzCum1jHrNbaNlk1/J/+h0a2L3Km
X-Gm-Gg: AfdE7cmdFfuLZaBX3lSlPpX509iO5l363cn4r6INIn6S0BobiG/WkUY3C/uBfAj1qsx
	tGfcF4Y8K9koG5sfSPaMgxam6PmAFlZCUsJj6TEe+/j0pqnAAXuZepJen67AbnQAoCTwLKUvEDX
	i5PAHaEvizWeQQOovUQDqXkeiFuc+5ILVQ89HtEGOSRwviiBdEw6As9w0WUP7+x0OfNhV9p3NgU
	DYjR297hOBVzXhnblQdvFukI44rF+cqTJT33GZQS4/lc6YQD4ArgJCE36A9GbgypvzvoY8zgLh/
	qLqTxJk//izGljOMwLBS6F28mNwYIfo8U/tWodwn0PfWS5LuwxdZj/I6+FhkHYYW3fLIYXTdfKC
	Ofwg3arBRP+yn+69qMySO/iF5
X-Received: by 2002:a05:620a:a107:b0:92e:519a:7c06 with SMTP id af79cd13be357-930b433f303mr114737985a.8.1784279835244;
        Fri, 17 Jul 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a107:b0:92e:519a:7c06 with SMTP id af79cd13be357-930b433f303mr114735785a.8.1784279834875;
        Fri, 17 Jul 2026 02:17:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm44377666b.43.2026.07.17.02.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:17:12 -0700 (PDT)
Message-ID: <04a9d8ce-e83a-4307-8b14-4afe739b31e0@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:17:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
To: mohit.dsor@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
 <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-shikra-work-v2-1-86ae8552259e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX53JDVuKvMvdn
 +NvRtI19hrcdU8rS2CViJKGE/U1hWdSl8uAowbs0oRxFXzlLbw+iTnvx5SynezMbzwsFupiBls0
 kyhLVPcF9/rCKFUdd2o333eOXirZ3Y8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MSBTYWx0ZWRfX6HBtXIG2wS3G
 JMS8eJInfyoollidtE8h6vg7JVCqEs6c4yJNNRHJZXLQUSQqFlDqoRFILVSzZ5LiBl9YlCcwmli
 dzK4VYwG/KwM8KHsoK2btcLKAmMpVqTgcIaGf7nPpI+vqg6q11iM1pDHNUPBcEDEOEz7jyH5icK
 zpRiy8x9kQelcpQWpzFFyKrPtZP9rbxpEBJg0fYD5coXQrstMcNVBEs/xiDg/A9xX2nlpbIw2pS
 kioPpyimud7AN9VtBE8JWx5rawkGnP3oDyk5zvNveCv9BlTCV+3/0zPOeYyvlBIsXSKS+M0XTle
 WoIEuHyJ+CoSD4BpRMQYZA0ktfxpv3/ZoOgIyNTnMnQ0OhRStzuiXHus3fY1YymMnP8J31Mqt+h
 fpCVQF0jGrKq6NoO/xsiqckT93Bj2RhOW8uihR9imlATH+0ed7jFQfvP57kl06tpLORRtsdfPrQ
 0y5i0fqGde9Bcz5+Xpw==
X-Proofpoint-GUID: IVY64YPVk-S0cULJXcBAACnMByX7DOXh
X-Proofpoint-ORIG-GUID: IVY64YPVk-S0cULJXcBAACnMByX7DOXh
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59f31c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=evxpD-9nWyVjaAOWT8gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170091

On 7/16/26 9:30 PM, mohit.dsor@oss.qualcomm.com wrote:
> From: Mohit Dsor <mdsor@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> 
> The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> rail. Reset is on GPIO76 and interrupt on GPIO85.
> 
> The bridge receives DSI output from MDSS and drives an HDMI-A
> connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

Does the other EVK not have this same hardware?

[...]

> +&pm8150_l11 {
> +	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */

This comment is superfluous

Konrad
