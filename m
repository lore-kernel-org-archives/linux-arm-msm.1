Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811442;
	b=QQrNVCl9CcOblpww2A8M8q1i48TTU/oBv7pMTeP1Fwbvuq/MFoCI4+1KtvEh4R6V4ns2
	 i8R/muHrncdEFvqbueO9aPwudRWrSIEfVwkrYUXAOgslYANZ5gEcgBGRy2yb+shuGPEFc
	 NvtNm2R7hk0GUszO29Q4MJgGMppaYAeFwCof0oSaTxF87VRqtPCXiItb6cyplFJWesb5A
	 MOWG6NUxHtIAzsHB3aGWLzkMF4mP5TL6+uVYoBIegnyhxf7NB8KbBYNirDaFarttkpNQ4
	 +5pLmbTSbzOtTtc01QuSehDDnOYgkzi4nGc79Fz8My+z7OJhBiu72kN48RTfIKRdrFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811442;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
	b=pyOH/oIpkxpFPlHmiDCPqpWE60KpgMPpx8UAExr+hc4wjqIe0SLqlkHdnXGoMbTb8KkH
	 ceT/7wPnxlSgHcND5NN0oK9Ynpep6/N1OO4hmcC4QpTY2PefoZ/5xleUN1esnFuT3klGb
	 kk9gfboISWMwjIeiA8Ji4w5Q41RtgcXjDDP17InHDc7W3PLhjx2wFSkYKTTIyi8rWrXUp
	 nXm6rWW66opxMjcfXo8UhCmHbkZt68wZrpvmmnSL85ahu+rlk27ORppwndsrYbLQC3Fq9
	 bchZcMPBnBf/oDQhLuSgTBvO8KJMdf/ZAmUtMcUVTbLKBUBzg5oPQMBqf20BydDHmXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kNdXS4/7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGT3wN1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D24606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D24606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNdXS4/7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGT3wN1P
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJB0Cl3752720
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hphn3ZfKORUo3yr9W6IsBbo3
	W049JwCJrXs91ZHeeMA=; b=kNdXS4/7/27Bmjheg0WPfQA0MdTG89+3TYQIrMtP
	KPX1JUzQQodVcJqU8ZuOVICrLCwbfVGxY0KtiAcPltWSjhCKumY4cq0hP/d73q0k
	cAaDuMqGtkCDpD9q+2XFu3dArsBdBFA7IQPBbS8Q5N4es80BriYOYy+nF0xvpSRU
	qJct5pbmkoRU61yfmFWKyHBkw9IKirVLWipywZK7r8utenuJBSa2EG4p6jBJHIK3
	myQwJmE1hSIGngZxKB7kPMV7ZOXPSC5tRhJPSCRfWLM1oQOVwMV2iG7apDEB6TXo
	sRdUM6onL8HQN5XYj9uOEWhDjIhpFS+Nxd2P6Mqr7EzCPA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74ghasq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:30:41 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-677c4ca22c5so12609597d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795811441; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVZ/ZENwu9C+/si4+0LFWXi6yeTQbyVwVZHGJznA//neuNvHlkT1c/yCezMzhikypm
         O69VLYcXzuoXNihq12hDyg+vzqHpY/AMAVr3YW2n7VSwSd7RnvfWa0QVBMz3wdfK28re
         DDjpzDU6frBOpGF4qNJbMp7i17SdEV9vPWYkTyhBva+BzhWIpssLoRTZdhtdMog5o7WD
         ZR9zijG/KLho5s1p/bIYSCcoO1mNTi/KaCcSlL07+JQphgJv13rwX/fx1gxZlURXUUHZ
         dmys9o6HZJG9Du5UQfcieJxLKS7ADypBpT3HsTouqYuZYGJz51zSqJuyQvMW4lzQKa2C
         RAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        fh=tD8q7UDXs5RZgx+BXJVY7wzp7pvxdlgi5I2Y5R0y76M=;
        b=Pgm3X+eyX5toMj74c/7NA92aZKarN//bWUgbiqwYeoWhBraLMlD1DkcBon2mIQI5Mr
         qvIsilKxwGIRqpyp1/pUfvG8Lj0wWXZgb8t3xKEvUT3V3grYLAfZQo0JxJE64nWBCVia
         ZZHll/D95gVdgDv8uoJrpoAKKflfKfFLk7wHT5aDVV06AuxIKfXSVoZ+CLu9WjXGf7FA
         Js9sCBHpmsFjgIYc1l43c459lC5U7vKxhM6yyEn5J7SSyShsEAc/NoNbrDV2gaS/uMAS
         rp/IfbL7CtzC6oYz/xEshYeEmXJXt1eUq6WYuOZ/5WlzUUoh6YkqLS7lf2olZxXHpjs9
         EfmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811441; x=1796416241; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=ZGT3wN1PlGRoDaMQ//HdtafdKps/ToLBwy00fMDYnyN3elkn89ZICzbW2qMU6U+kbk
         S3r7VMOEfp6d0c0LxMlAjpcBht4hI1Kc70vi6QQ0CMkce9Y9Q29bPBNhAuWHPagsIAH3
         jCqAHfqqn4opF7AgdGngUORdbBYZ9QKVjVs+yiWw8FkxowCvC3bn66O41mT7k4NZ5jzx
         vRX0Y0oPfTgesysav8kP++VKs4ZTG7B8Kc+ae+2kgZKS9SkIm9GxV4hxZvWiDUlzOL5C
         89+Czfa9+q+/5gPH/iA4zeEA5iaYNRv7y8y59CVxleXdNH8nc0px9ONs1LQpVNS7KXnV
         6+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811441; x=1796416241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hphn3ZfKORUo3yr9W6IsBbo3W049JwCJrXs91ZHeeMA=;
        b=TCNZdeeeCyHg3RvydQEkuoJ1EVmqBATHg6XoFO2jBvFhqGcJ2a2Dpm00+m0tCnEpyH
         KqRNLLm+eE88S2CmAnpV7Vi1tU1L8Uj8kqlJQuqZ1ylpb2KWf5LOlATHVw1IPD9Zn22B
         YSK6GT4t0VK7vu3LYxlj6vl6RtirnFe0fe6GW5zLfer4hfDo7TRAFKGwJxuBOxjf+hft
         1xTqfwxP0DXoFMq1b0oDbKxPqLKXav+rEMdXEAHVbEd8VPXBbpMu0qshl83bJT/0kaM/
         ojKAmJNN4/nuJverujhrFuGr/BZ8UJrG1+Ki07nJ4FTsljIyuVzqSbaYXj7LZ/KyQ8go
         1vgg==
X-Forwarded-Encrypted: i=1; AL+hErFRW4tphRtp3RdqL5zLNP6WqOEFSXThvvD9VgvuzV7Hta5C9N2iMzGYgNpx/Oygw0OMiX5H+Euj7MO37Fsi@vger.kernel.org
X-Gm-Message-State: APuU4Z9CDa9h076yxUyDj0fqF0qJ+sn4C9H4Zgf/0P+s6GbhWullgyN0
	S3xglNI9kWUIX0UPasCJlGCEOvDctD+olrywhnhIR//ZxTRz2hEPOF/X6sC+7javN1deKiXd8am
	wFsaERanuuu+8cfFgVR8xSKyaVwL5RhE7ECnhS8R2If4zV5APPQo17iGiiQcTT9awxuIyh6UA89
	YIuHb5WiSrQGeV4nxkyXNFiqTLW1xwGGjWLkDtmeiUTm4=
X-Gm-Gg: AZFdTZd6YJCCGgS3UlB9dramCxgaryYnSroFYLOxlT7+bAdzi3gewvWZHJvdv23XRMn
	6IyQ7D7GobjHEC4S87eAlnmeIQAQIRf4B0Pc1cPXF+9OU/jycMkcSkK6wzYQY/r3BIPCDpxxUun
	H8D/gN4jrJTizLPMxBdjMXwvWLfz0VLPNKmwgd2F7gauRahrwit/1cWYJ+1ZDlirNC5tbEjXkNh
	obM0CiDp9WzCxxHaw==
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id 956f58d0204a3-67df4446b92mr7114696d50.78.1795811440219;
        Fri, 27 Nov 2026 12:30:40 -0800 (PST)
X-Received: by 2002:a05:690e:440d:b0:67b:ec5a:2075 with SMTP id
 956f58d0204a3-67df4446b92mr7114661d50.78.1795811439276; Fri, 27 Nov 2026
 12:30:39 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-q8b-dts-v4-0-e8e7438f5545@radxa.com> <CAPnEM6aAK8hwJ3EfhzS=gdMPTf+bhVgS-=JAoM+axcHzBQ1CGg@mail.gmail.com>
 <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
In-Reply-To: <FE7B564926118C33+50565d89-ad83-441b-b85c-cafba0df5546@radxa.com>
From: Chris Obbard <chris.obbard@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:30:28 +0000
X-Gm-Features: Aa3M54rOA0nGZYSsdhumtFBM_XfbHqu3BlAs81Bv2P-Z0wUA71uwNq6De_uad1M
Message-ID: <CAPnEM6YXXVJ==OXinyZyGBfKS4iX=N+eMJRGZframsnfAeTtjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add support for Radxa Dragon Q8B
To: sophon@radxa.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX7TfZFs4algrF
 7e6sLTxmg7PcozxZk6RgLkhhl06ub5VgrXac+DPUBQxuypVMb4rsralGV1NLnQQ6840CW8gsMn5
 9W4J/9Vmt7yyL08vnwK+i6dc1XOVESo=
X-Proofpoint-GUID: UBKyCW-aq-pYWpDzsxTKn_dbbjhzsiXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX4BO5G9WCMfFs
 GxvRuvMaIFQxE/5y0v9t7szm53TdpBs7/dGeLv+FhBt/kVocbswpPG2C6q3o1bKLjF24QRMKgQ2
 z62sWaEKMtn17/YXJU1mMwU9K+tmwvd6KNI7+WQ5gSqQqvAXkqKhHvxqP63rxzenJBP60cYKiC9
 QGVfVWagE3JVmtYP7jeDUY1l9iQOuNVyBTwTYVFwC47YHr2Og7yjDUvPORl0/M+6usz6otzgsLD
 ZSVr8E4nVjKqMb/n8HzGEkgXK+8dyHpMRle5//XtNgYGBofLw+cY1fwtDJq52ZTGtFuVg6lI1il
 jSTRbWqSdQsfUKH1oCCTiCdDfpzZzcvhC3BmZs0CZxXzQlibNfkNKZ+p5Dx8ydFm6ugdBE+oLwk
 loaRwLqdDFOdW9DhX2FaxyT45QrAEcwW1mQ829b/f6rBHVAPHJs7tG4y90EzFjM4C4bynt6ZH6V
 +a/gHqCujibaPZgibQA==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09e871 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=ksxQWNrZAAAA:8 a=NEAV23lmAAAA:8
 a=05-C0eYiNmMOl18pgPwA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: UBKyCW-aq-pYWpDzsxTKn_dbbjhzsiXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270081

Hey,

On Fri, 27 Nov 2026 at 02:43, Xilin Wu <sophon@radxa.com> wrote:
... snip ...

> Hi Chris,
>
> Thanks for testing the series.
>
> For issue 1, the Iris init failure and SMMU fault might be related to
> one or both of these patches missing from the tree you tested: HFI Gen2
> support for VPU2 4-pipe platforms [1] and the missing Iris IOMMU stream
> ID on SC8280XP [2].

The two linked patches solve the first issue!


> For issue 2, I'm not sure what's causing the hang during the password
> change.

The second issue was quickly uncovered after adding UART - it was the
SError you mentioned
in the cover locking up the device - which of course
https://lore.kernel.org/linux-arm-msm/20261127-pci-of-disabled-bridges-v1-0-3bedcbe51cda@radxa.com/
fixes.


> For reference, this is the Linux 7.3.x branch we're planning to use in
> production [3]. It still carries quite a few patches that aren't in
> mainline yet, both for stability and to fill in missing functionality.
> It may be useful to compare it with your for-next build.


Thanks for the quick advice - you'll see some T-b tags shortly !



Cheers!


Chris

>
> [1]
> https://lore.kernel.org/r/20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com
> [2]
> https://lore.kernel.org/r/20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com
> [3] https://github.com/strongtz/linux-radxa-qcom/tree/linux-7.3.6
>
> --
> Best regards,
> Xilin Wu <sophon@radxa.com>
