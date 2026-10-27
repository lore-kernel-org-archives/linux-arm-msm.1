Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098174;
	b=OIl7zTrO7GecMEE5moDIcUozvOhQAn3mbPEu8Peb+/QSxWRJ+2X5Wk+Nqulyvmk2ITuF
	 SZZgoSz43189AS+oObcW4p9gyhek/exPAeokBDsFVZTqj1soHxlRTsVekhfDRLNz/7nJ4
	 8scDkLNUCGB5Vmzzhz+2PVuAiWgNCIDWAgpSDq9FZPz5b5Yp5grcD2h5poRE9UOQAN0za
	 WQWVBP/A+LoR3l6Md4FHwxfAgSeMEPWcONrljYc99/44qxg/6QRfXauewNVThTeJygLW7
	 aKvGRrXb7qpMbJhrZUlhUMOMcGEiUmId7uVO/7zM0Msb4JFv1fFD762lkGp/K2RHMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098174;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
	b=EPRf7+EYAOUUtbRwRvm14vDMQHaN0jP99fXQo9X5UYvEqNHrPzRtogB6pBbu5euLhtA2
	 yUFDQEDAIXe+5Or/wX6sCp9Wru3TM7qhwzkVJb0Nb66vPu1QIfdJHOtafUjM9o/zFV0v6
	 gKNqzTjrY9+jTFQsUEh65xe8IwHKcNfoX0+dYNvxcB1tSubQD45CcvuRWlE/z92ZHYpr7
	 Ss2EYcicGszbpHstU7MSDlAf1di7Ry+DPPMXSRPU134U55UOHI4lcN9E5ncXEovsFj+O8
	 4rsFMDpONz+5OD97GBLQyOgb0hIbPXE7/YzCCcTlEfc6TJD7igIkG3vbtT0/Jl+YSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E382606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E382606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g0Y8JYGd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KoB7iIMz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe2Y11974129
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=; b=g0Y8JYGd4Gq3paKq
	f2ixC2P0SWWVpBU9vHSGH9+1X5Z9ogQsqsrQdnW/bCs1YL6b07UaTm4ADDZae4d5
	7VgGadjp6T60ugbFKHAhJzDFoutjzc/WCbjqGL+q8apJlsXcAvF8JeWpyUYU7FVr
	KuIoSevxpeKxOXaaKaJvj5UJonbqhSrKL3XEqJscW3t1rFBvcVLrz2IewgbH7GPD
	JCizz23DjD/MDfAigqfL6pNlCvoTKRn91Z3o8QwMXpAh8bMLLjPDxOqEXJIB9SuC
	aB906McLIHrrgxA7/itSyUPEj53We1mgVeOhzwjJzLfo6C93+I945da+RVH4dt1Z
	/XmkVA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g607-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:49:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so14275241cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098172; x=1793702972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=KoB7iIMzv+LKYWLN7yRyZS5VOvFdIEwHT5p9o4iZoLk7W+mVAIyogLgQ9A6qhssuQL
         3V+PcitsqMzSjp4iyt37f1wSvl8pwkTxXCUYANAFXSckwfxmCda5gh1HywzhbeZnO9rX
         J2FEyzCeDVTStN4+3568P3IWZZbWaKu0YR8ZQP8CBQj4LeptmEY7TxJAFZIE+yUxIatd
         u09GiE8TxFQOszCWxYRJ+nmtniAuo8XSIx2hvK5340CAN0YAFKDRSF/Fhzds0DL4RQJ4
         RQQ2OQpr2kPodebMbRffIPx0VU6gj5JvOKL8xvtZQ/uygVZX0SFRcUJAVqFruZxMWVM7
         YppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098172; x=1793702972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5tGmvbUJ2op+8nhPcyTDEVrgBH/N8qAtJfXgf1NHn4=;
        b=usUIH+kTrVZfNv2kexKEGPXo2YX8P1WWVBlawHN5NzJnQ8iEXSQlx9Lf8LgiZmCfZB
         uyslkTybvbIpmyCYkEvWt0cqbbI9WtqLGw3WJ3tkRah/lS2/MCe5Ve0GGHpD/Q1RXoP8
         LiKQwjdzGaxxYgUeIlv7I5EohzewtyTFjGd7hoUGPMr03GoPewbL3yHhV58Ec09oC9NW
         ifgaOThnmIMbM64a0ovzXd1onAoT5VVhfXVxozRbOLprRJlIKLgYJXs2emdXs94Mub/+
         TA1wvHgWcojfyIVxAdmrNfF7b3ggo6L9HJ94M7Q1OC8CjQtYuiaxOgRw7PyfeM5rfUEf
         ZR0g==
X-Forwarded-Encrypted: i=1; AKwUvBxFXeQQvdczrK2LViPuMCqmzJnNJ10h4V+89+PGCzFaAzBFOHj+PW8plpcXaby9B5gFBc98BTSj6v9K9FoX@vger.kernel.org
X-Gm-Message-State: AFq9FYKCRNJ852CqphASqp/aKj+MiwGzRxjj1zjmNvFuoZAE/5cfttzM
	IG6LRqanSibghuJ33FuDfoyGJ13Z7+t31fNq9vHSLUnVkriitaIjs+5MnYnBRthgp21M3lPBaMg
	17dHwOpJ5Kvllkmw3h+OVC27Z2ltP/DaeUzWp6QuilVJqXdRhr2s87fPxCg/3xsKlvldE
X-Gm-Gg: AYBFou1ztdqCT+5pTw+boaFKvahg9S1/9/iGxSSVEL4diHO4TcLa6s5kZsbT+4p75Pg
	Lvc9yIDN/h5TGNQGpPl7HtoF6m/BrOk/xr4D07cotjsij0dG+cl6RFzcfztVb16qnujWMO+KEZV
	80hufdpLXWoBeP/18u+MCNf8y/QQpI8qqdaEAqN/5xlHhDBTlx7oL22o7ofP3fcCb+r5RcBU9xb
	G3Ovw2MtUPrfs6ymWnHmXinNQi6ntntnFUS837xX2Yh2lxctYx+C+++Hciy/y6gkIghSgaan2QU
	O9WTb2MxwKMMem1KW0A7Z5Rc/qdLihXA5SjqrYl6TZPMEdZGELwvJ5LHk/vV0U3H+EG7QBMrD7p
	hjDYrZF97az5E/miLWfhw5g==
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321971cf.4.1793098172335;
        Tue, 27 Oct 2026 03:49:32 -0700 (PDT)
X-Received: by 2002:a05:622a:e309:20b0:536:3519:de44 with SMTP id d75a77b69052e-5383b6426e3mr146321851cf.4.1793098171923;
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd77e1e9sm429781566b.67.2026.10.27.03.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:49:31 -0700 (PDT)
Message-ID: <665b6014-f9df-4582-a682-e825dbb1ca4d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:49:29 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
 <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026154001.9323-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae081bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qQh0c9Rk1agPjm9wVCwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: n9W33nQsEHKa5MHAqIXoEY2sT_XxgIQ4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfXx5nC3q/mT/Va
 PPdNjTL2E08Ex5GRU1YBjczdFPOk2sjq4GEaUwTy23A482CPBukVwkr8weE2SgqJAT/gIXUl42E
 Mg3EkDhLTFC+VPo3qeXvTzaZFq5Kozg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfXz8Y71VqTYO8N
 Y8XckoXoIktRsAhKrcfvJm0ZtdQIxP96g5YUMREWC+PPtDhmRNCb6P2VoUTo5llRMkzkC4HQmpj
 T7Ynm65iHkY7DLiC47G5OD99tjbKZcoZXNKxQg39mjHb+7RVdOZ+qyiIvHSaxRlNoJCSIgR+sDq
 DBg4OiuFLHh6K//cjqzBfrPOp54MBHv1Xc6+cUDH+sjrlofsVHxpC6727J25A+GcNNZizDVgJo9
 H5x+1PbpadbfZ4pH3U8tJeytIt6EYgHB0l1wQ6WS6/tjXNePcjuMW1ns46GMB2EYxPIPp7XXlUA
 443QsgwFTBUDVLUk/QLaoq+GYfsrzHn80TxJbwpbED8W9JcIwlxeoP/EOlBHgoWk8ozuzTFNI4K
 EiG/bdhoCBIyS1+9bGqw18WpQc/UVr33FT1XjMHfFMBI4mwEMcpWMPZG4rVAq2ufy7zlXanYIqR
 UTzfdkRPbaIvdp4A+7w==
X-Proofpoint-GUID: n9W33nQsEHKa5MHAqIXoEY2sT_XxgIQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042

On 10/26/26 4:40 PM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)
> - Webcam on the internal USB 2.0 host
> - eDP OLED panel with DP AUX backlight
> - DisplayPort alt mode on both USB-C ports
> - ADSP and CDSP remoteprocs
> - Two speakers (WSA8845) and two digital microphones
> 
> The GPU is left disabled until Mahua's Adreno X2-85 is supported.
> 
> This device tree was written with the help of an AI coding assistant
> (Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
> ACPI tables. I reviewed it and tested every feature listed above on the
> laptop.

I hope you asked the agent to go through the regulator settings!

Konrad
