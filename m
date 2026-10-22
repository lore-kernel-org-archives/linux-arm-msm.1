Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660327;
	b=Bu3s5aprRviHz8KHxf96LCGR38wYKNZJ9ANXvPTH8csnODWSOv+HM9U6PY/8NyyminSC
	 ZM6NwbeanG4r+s2lmasQNwWzoulfp4idHWM7fAsA3s9HwCqVQqxLUbrJK2K2L6q4cr0Kc
	 OCTk0/7bEN55xCiEgmsEou+BhcPIpeLTqxZv3CCkZxnJgaXxPEhH2aoS6fmLIvNXJWBB7
	 lRo5/zsHakde9zd4qzG5G5IxG9zxZkfVhklhIOOdADGr4r7KcfNN2mi+zLyOezdfNZ+WV
	 PG2/aCZxXzQ26u79NpGQY0yaoXutTojXh8irKfsMQzwXd2thBJdZvmHyoGIvz3kxEvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
	b=LKVc+iZ46HEBAwZDSNhZBvLgQEhSd/UmhhJwZ1Sk7r3Qs6EZbqmqdl/d6xniUamz/kzI
	 wrwj5qEZ5D77J/W/nIZmbEllYdSsXCGHmLFwT6S0UiUqtf3PchQe+oeLUsNUHKuuMVvWs
	 u1+M103OgclsWognTD/M3bpHqCq5plRM6FpHncmfCzlZH0RJH7u2CkX4XSbKKon8DAroK
	 zaX7va/KfZx+Q1CI3+05J/FhvaorC8FhZZPx6MYL8wIErYThREcaFyHqU8yq6viJ2TdOI
	 YJpEILc9dKVHG9Xnbswen1eVtzW4MzTiOHwczCP8AuYljvU4O6KdUjeR+ZX+gg288BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGp92Z2q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YON45gN/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E79606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E79606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TGp92Z2q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YON45gN/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xrG92171944
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=; b=TGp92Z2qRiuIw5Xt
	2+Nf3o/13TUS3DacfQ0+o9enLx5g4jF0/IJ2Ov/ohrdAMwer2R0hklk7BAWDO5kF
	AIXe+E82f+ksId8kQU0KUInLTYuJjwZCVnEwJ6YpzxT2ULcDpDmbwNubEbKyMXA8
	KkxrD2iZ/yJgYvlFy2Vn3fNIu/+LXB7CjyPYOb3p/zi50Rfy+RFT76JChNvhoUMX
	aKbYCqp9LFWJJtVWhfUcTkaPvJx0f2DXWeJqJsMzuvKsUNbBB5Mgybr+1uBw0YnX
	dXP5OoYRxqnILRz8NWnP8+EQzg4671xD0FoyNAqU50qNj0LlUYMOf4ytfdFPivx0
	SB6cMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahme5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:12:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so37091985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660319; x=1793265119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
        b=YON45gN/DeicUfBqI3hZ0qHUz/ossG1rPYMsdlEplnTbez74iU9c4sTe5JKfjyodgc
         6rWqL6rLiPi5S7QclMh4XNLQkdK36iSLW3BH7MiZN6YDS50zUiSXg0C5FKX40eaOZOqq
         2OoTW7c9mvrikLJ/tE11sQLXjHcE3UJ/gPR2R24ZrXfqXTBQ/FnG+A1qn8rfnhdZnPx+
         t17TP57o1dIJsmRvXJJ2qewo3XhcXvdBUxjqjp57crR79q1luGWLMvvZUR7gxPxsB23u
         YD3/NeU34TIvr9byCKwgU1vmB6V8hP+n2+nEsYhvUI6Tv/J2wGtuwVcczH0wsg2JvCgw
         RJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660319; x=1793265119;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2/oXuthUW0jNB8C0Zfw0YNuEEx3T/Taw4GTzJx5fD4=;
        b=PzCPJz1HGaAAN419PI2NQIbMmbqFOBedyT4AMDGV72n9bO1CmUlSmDEaN5JEbHodFO
         VPylJy7MQ9x417p5zABWS2aJHbRM3IRwYBY2oC4B/IL7fc8AErVchTdYO7KYQKb9bO9y
         qJ/uoEzkVd9LC6Yc7YHm9HjmWjBtL0aNzCuAEES4PIr0gqvb1tOVBZBlHnylXpZrIlj/
         IloDSw0H2nRaO/p4txcM4MdxL7eCa19BmvZ05i8gWEZX8cvSt3kNg6gUQllIeL9tosAS
         ph9ZaRUx7eEttQfLdjqac+0fkMrNipBQpzP6/x4LitPsoMNlaJoSbCFQnG2sWs6nXG5Q
         I3Yg==
X-Gm-Message-State: AFq9FYKdVJQzbnLQ/9hnYxARgu00yjzovgFsrNAd/ocY3HbdUHvAD4HL
	JmWwEO8r5a3MXevQRGcNmen3rTEO1OGmSzYeCx402zeS53HNDDP0VxOECETpKo56k7QwGS7dVPe
	yONZMcFLLWFGhnArPDywapI3iLwqUc207vPdxkbARLc/2XaS2MhwylxOIGAXK0Ty2j3LC
X-Gm-Gg: AYBFou34uZXq5HUr5kNZtWAGUCl28rGuu7TKTLXfXO1AYf8ffh7gCiqsyjcDcCRvN3T
	InQeIF5qkrdZOcqIUKtMN/iNs5A/Wsu+KNnoi5s0plIItfws1Gj25yzSNS1l2qVvO4pmlQj4Y8E
	xgiEMC5ugHZlmOGH+TLro/JRgbK9kOH5IskjTjQPD41PXbo8mIQ43dlefNlY8qTNgEstNHR2jxO
	xhJTAYkFCdML6r5Kp+wxQZe/uj5rost1dxTtajqfdxFSNeiUw1FuXeNrF4HzLOLsQGjCup9ATu4
	pVJRfznBldEDZBwiyYgu0DouBQMbFMmy3sY+eT3U03pIrB8m8aS+Ece7S+fw7BEv34zguKw4ZdX
	KgedD5sy5Aj+vCY3d9wc2jw==
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1042851185a.3.1792660319138;
        Thu, 22 Oct 2026 02:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2b95:b0:939:eb09:4458 with SMTP id af79cd13be357-93f57f7af95mr1042847985a.3.1792660318782;
        Thu, 22 Oct 2026 02:11:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40317024asm1565099a12.37.2026.10.22.02.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:11:58 -0700 (PDT)
Message-ID: <4de4af90-ea39-411c-8bdf-999d6bb94338@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:11:55 +0200
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
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261020-nezha-v5-0-04898d6b5f80@mentallysanemainliners.org>
 <20261020-nezha-v5-2-04898d6b5f80@mentallysanemainliners.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-nezha-v5-2-04898d6b5f80@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H7Ca1ruPrlf7EJLF-Wm_jroCu9or50Kc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzGjNIp6qbwDU
 7kjsugIJTyT92NczhuiDOSXo4tqhBzKO83ZRDYImx/XSHHPSU7sCs1IGx5musLyvOLcBwyR0bfQ
 DizMr+lQE61jE9DGb5HV+xXkj5V2dx0=
X-Proofpoint-ORIG-GUID: H7Ca1ruPrlf7EJLF-Wm_jroCu9or50Kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX1L38w3/Crlf3
 U7afXlKssnbhmo1tFDWe/sxGGlqeS8IA+ek+OVfN++qfwyI7WFHWdpVDUrbew486FI65qPsEL87
 tGpiTblW407QBjIEC0xe+0KnZCILqC0wEto/tiU7wPwMpNiKUh5z3tIoSbkI7aA68diy/5J5nkX
 F4yMZ52qrQEjU5vhV2xIiW2MtTjTdezB6PW3Q5QkGdYfQL57dkP6knuy+0jOCqk9avm0q1ZxuVB
 s5HJflG6L6IJ1eebu6jP5c9SFuWk1R66VgMNO1BwExim+R4CfHgyz2dfi/yQBx2ufdBQRMZwGZ4
 ORKHQGFz/fYJrtWkadN/IXgUuTP5KBF2dWABICmSZxXXJENZZkFzA+VcZjQ2GE7BiMi8Z6FdqlI
 X+x2cJ4t2Qz+2513R3+fL7x0KfgvA/TuewSGiYRau48XfgOD/FIGuKkDa7/WvmSH1hglxUSYrLB
 vgZezBl0B+EGG8ciUnA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d360 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4I5MClDQAAAA:8 a=MDi8V2FcbNEfkNi6ntEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/20/26 4:19 PM, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
