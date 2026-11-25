Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600400;
	b=XHvhQTEUBNUW4Mjh1WG27H8C1TVl23xkTY5riCkd3hlwmTjDQw/OQRCQ1d+syRF1/mUS
	 yMz0HCz4UxeYuEcMYhIgZNPydCinVKmlsr6IARLq9rGYH7Oe9V1q899SW2u6H+3YP4e3X
	 6fDHYBoN06+kTMhyQumNhu0WsTfZe4vRPAWHAgIdQ/sQ9N6pgOVgYNcec3Feh77B4hrii
	 69awm2DNNyjjpUWGhLDltS0KiIdQd41nP4l8kuynXomrppIwIOhXZIXx8J7FRgukSYDxx
	 qlNBQ2Q6jO1OlaxHST0vUiGl7BARbn/lnb1jIrW+v15+ygqzScNvqo88WaC/wYAcm6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600400;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
	b=3CFHqcQ82Qjv+rDgPd1yBZEZ9HEX4jG+bW6zrJsQgFHFx3/C/32rGratt4+serA1q4sj
	 td0QBkib4G3ZEQDoVZ0VgrD959I830Ongl5xLbryGg6BKwZ/v+Ma9JC2BMnwtj6Vf9wO6
	 uXS4jRG+JwAkcuD6IERIjxcKoj48JXAzyHN05Vq5/r5PHOwaVfcLzUtrH83eYzKEeu/hu
	 VopTv3mC5AV/GwkBG5V4ExslUl4eU8Ui3Br4PjJ5KN36VM6oUX3+AFdqI6DIVO2+RX2SG
	 /WjqDwkk1cOp+rgiu29Nnfudk61a3Skk5a2XumkeHYbuXCFtVKUIXkj7v5m5dHt3+8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E4606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTYV4034201
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=; b=c90SPQ0DmhnIfA3r
	fBrKNi5CwIVs9Q8Y8e8HNHuZfGGLUTD2ALfns6N3iIW/vOOtX7VuYnZj5H11z8CC
	zw6ViY0s1Px6n7wqZlubqL/Wa2dOIJhkuhnIyl7ZLROz+HFrWuJfYuH2oekxqtRj
	5ioWP54l+lu+gYEHXfKxwZy0SeDJnMPLAZa0I3GbdpXiseygAHC5tej/p5sLK6/E
	fS4s0bp7PoCZgum5wnkiAzhWNFtktcXCHYSYQrhgsQ3lz00vazOJPXSEu0MbdTIz
	yYBAEo5sJswRwCP/AUxrb+tlJS/RMRLWRDCrJ8BplFv50zlyUIwZFaeFKDypjQb2
	+sT2Iw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbj52x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:53:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94965dfec53so68352385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600398; x=1796205198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=R7EbDZjPGaEBase9KgRYE0IHmnWVQOwuCZ/YImwh36sGP4vesRKRgQCV9jtegfXoXn
         tdWHE9TPqkQK79g8jh+Ci9nxN4Yf36BtVPT4YtpkZHuaRzyPWhDLEyV5o+B4UdUxTW6a
         5uP6Ji5oEepSlVy7aZipzvFEWl5wagXuBI//5PK9zCgpk6tPtSe9dVzWSeH+s+3g//fv
         9Pr4oU6uLkAeGW5F2IlXJbrCl3RVyEgsY6tadBwv7lx2GBOgbOUgbW6AWzFSsqsEgDzY
         T5Vr9bBtWlApPl5F70Ttjnso1NmgXXe+6Lu3QmSUte2EVWLn/Fg5XujPp6ILAQGbDBey
         6zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600398; x=1796205198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=bQ6YmZL5AsmQGQYVT+6Qc2Qs31nKn4L03AY26rc3yPzv8WnGiCuagELRr/2n890Ddt
         lNuLQVU9bywqOV6EdjUOxwV8m6R2mRDMmXIQUbhO3byFALzaY6DqSlE8+530QYFjAmgn
         mBKrugdS+PbXY+8EZRH6pLmo3ScYOyqWDsjFRUC1c7Q1Z1aMo3JnPGwTQw7sS7IwJ9DE
         vWHL9RuCaBbyJyx9K77byjXfLf706EAP20Kj8VcHfhgn/mC0G+yCCmWAKz51IWCHGzE+
         vmS/1N2QBvB1oZFh+/5NiNLXQluUwYgHWGCM0rQLLMaN9DUp8Bslj2oJz4GwMpVcDLK9
         5Ypg==
X-Gm-Message-State: APuU4Z9501Nyu6RCJa6Y9Mj46cM8IZW5CFxIKchLiEOteQa1Xf2gEHOA
	bks1i5gskANCb5z4ReoZlsn8N5XegF3I1cUl/aQzzdBVTomWRr8Ae8bRC5mY58eMWVsFe92raQB
	0/2tx+GeCZ1Ljn+M+BUoP3OX6S4aD4GR5N5TCJSZEsei9L/3aWWMabaudBrHVAKDiZZM0
X-Gm-Gg: AZFdTZfqsrH9CZ980vIKNTB/XJYu+HGsjoelXeBYJWGBpjoX3GYxzEWdGorsbslrAJF
	2WrQbnRuXs1rvaVyYSms91FKRBvP6GdgQZz/p5wewjFqH2VVw3wqi5+1LmpmZImPlaVg6+lyQr+
	1CmtVk+VVEsfiW8G1K+kolHreOnJOBKsqAXsjGyNeffv3FP5HVfFIvJQDODEedZm41sWANbZlAx
	XUkUPKJ6+JxWnFFevtalgOglx4UIjYAaWpGPMOhezXr5nAONGNHUs8IJz7jMbsBI9xHkuGy1IWm
	ti1k9B5vnqXyvz51K2vFLU4yYOIAxX0mg6gyhhrMmubru+Pvf3Nl0ovDpzm6WlZp5HNXPQGK1Ms
	OCXYMd3mLFY16J+0xhAvxSipzB31ycWZZl0S0Bh9rLZNg0QWiDk8exQ83fI/TOsRIRLftouU=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847963185a.1.1795600397640;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847960185a.1.1795600397077;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68802sm622707866b.28.2026.11.25.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:53:16 -0800 (PST)
Message-ID: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:53:13 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX0hwshMTqm1GA
 nzGtK2vwRyD1YU8wDNYgkznXXligC6CwsmPrMz86hdMEc0Gshn+1j26+CzKaElTyqXhPkoSlL/v
 S5bllPOYK4bNp8ydX5JxR4BYl1uCYLA=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06b00e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=K9kiO-SBJ6ozCPIvxsMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX5ONY8dUrGB0q
 pmdWBjg5p6mTsXHhW4s+AZTj/CWS7EeAimEgtgB4rPdEx25wPQf2XfUaDNgra4dcBayDMJt5PL3
 X8V6o5hQG98hpuHsDliVcT2gLrcwOs6+jlfl5AvGUj/YC7sRejT2Z45N07TN88cippKGtzudwxu
 AXYxJD3el3nqz1c8UVnhXDywKKAx2A88IWkEJ7iP2Hc5LPmRcDFZTBVGYr/oUSa3l7tSyk0tuzU
 vUT0+NrbcQlkbNKYhSXw3LRZK/Ycz3JaHg8Aw1w4dMDqSKWbicSWXDvPfh7cQ9pr7iT4t71xBaT
 8vLly/WR977hBvhCj+09YLTLK5DpvfTuMAWmnLtyoCVvmbKq4jvzUEpfJXoeyjjq8olWxlROQyu
 iaS4n5NTMwoGKsVWVU5O82d+22LeVx+HeET4WH0LEAfaGLOaiRLi70UV2Rrg2J7rteMy60nB8h6
 IvzRv5YDAY5lokU1HdQ==
X-Proofpoint-ORIG-GUID: qix6Vs9O1x5JDMLHA8Nt2NsGCO7nWIe0
X-Proofpoint-GUID: qix6Vs9O1x5JDMLHA8Nt2NsGCO7nWIe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/16/26 12:03 PM, Jie Gan wrote:
> The cti_riscv device is suspected to have a clock vote issue on the
> KVM enabled path, which causes the device to crash during bootup. Mark
> the node with status = "fail" for now to avoid the crash.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

That would mean Gunyah is enabling some clock that the TZ itself isn't,
which would be solveable through a clock driver patch. Do we have more
details here?

Konrad

>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..5f5a786fbd2c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3996,6 +3996,7 @@ cti@982b000 {
>  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			label = "cti_riscv";
> +			status = "fail";
>  		};
>  
>  		tpdm@9860000 {
> 
> ---
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
> 
> Best regards,
