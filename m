Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E6478875
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671576; cv=none; b=SHntbVCbr5fuPXBT4bZhY7+ak+s/QR6+9upV7M2BvmxiuL/D3j1S6Q08I5Qy07ctWgEWAu4z4GMR2zkv7Brm/x7tOx6lC4h3674t4oeZsWmafYFWNxEz9mdEwCScjbRmgo6c5++ZkAJJFm/FBKTwFt0GjDIO4N1hL9wFr1NaXxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671576; c=relaxed/simple;
	bh=phpEkPZEUkUlFJpU8mOcSvNhHDcWnWX6PmAgg9Jp/W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwWNNJPXVJJnytSMabNVwunp+aXyVEwetL7Mkd5MUTG9PIzZFSeVTk/+k+aWzR6tRQEKVTxPUzUzM3HGamDQh/2L/J1kaVPOlaPHZzyspKJpXUqNiYaWfl10MG2MDFfE4gWmd97yvGAfI3XpndWcRLJ7A44ZOtcHTQthwWM62d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3WwPSb4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQMLVJYP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3WwPSb4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQMLVJYP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEULIw1050177
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=; b=K3WwPSb4pTyqf+t9
	B+JxmUqQo+yij2VfzIOCKrdIVeX3gEKMkGF2lE0x1Cz049+U1yLDwycYFSJQh2Xv
	P+nRFezLhjBdPmrVOEtBEIDQ3r7vvUjH0BgIjGBd9mok/lE3bM84RWHYDIGtoDCS
	SPvgjDH2M/Di4+DY9m7rVl12BeYQrVfThEZOTlsLd8cUlGU45jrKkqKLTLC9nuaG
	ofRsluKv7L0K1gNG0B34ZnGLCcfz+Pv2ja1YU8z379kwV98jHNFjBzl4kelX/Kyk
	M4QTVUT99LxoBhEfyNhHqs9wXms54mU+O8DmAsOKes6uZO1qFULro6jnflP56fCd
	ddT3+A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvjjf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 15:26:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so179081137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787671573; x=1788276373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=;
        b=TQMLVJYPm3HLwRb6rAgUskhDyQZKu2G4Azpm9eJDmol9UuCw893s3TGQBNhWIgHTNL
         0HzgpYFkBUEZ8c+3NZ28OG8y2u0RgLOrYHRkw+Xxe/178UI2y9ZCTi6GX2ZFx45tFdk7
         H2k7yoiud7XxdiMM6KyEYcLfHW9uSm3j2UA3FltW2ne9Z2LHdjbb/PDOdF5X6x6gUCsA
         +2Fz36OeZ+HfmPs+c5u+mKjEkHATHDrz8Eunm4XKyjBzFcwr55SZD+tWkGVP3RdA1um1
         PXPAHUOmR88SRhy7vuXMDI+DJpaCzLtI+7SJa6UOTq/Qko8kFTYmvMwMbsJSEMh5Kfy7
         ayaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671573; x=1788276373;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmvOoqVI4nFK8bx8DmiZ00iFRmbAwyUfhcb0iHKmqrc=;
        b=nNlORkip4gfNb8AmjwT7VW4tPYqMQ1B5RJnD4Sg6lfOPNCyPrCEIP7fT9yfZJO+doj
         9PIeOYBEjZa9BIgpUh2k8yDTAMykgzFP7bD4WcQ1o81gE1WHo9tewizDVTnGrV2lF8XA
         S3WrbA89/aDy1FQbiwqq44u1hUy+X7e5wE8l/N9S0RRyvmGLAhwZDUiIlT/0GXbGKLpv
         h1BpGz5n6NfWSU57uRdtmc97HFhgZQIQhE1cIFscthbjMoWJBSETJP9HFJMDW/dBrIPW
         ocJJwgtFuyDFuTPGEfWmJm61GBKaMeHYmgyBTlKHhMxm7hR475Z8f7fK3MpYqYhST4rk
         iKsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAoOoM3gYm6oGzQUAJGUdZSjfpRwpKVvanHdG/8WMZxDKsIHzQ0rAF7hUZ9ZrajgSuSqa02sICo1wJrRl/@vger.kernel.org
X-Gm-Message-State: AFuF++m/j1fnOio6m/BcnLIO8UKmLwT2Xg01uJ72XbfLsB47nyNBIpkp
	rhP0wMPMygvgPD9Eho3r6QaxlGCwX82VUby0480VQbddHeqIRYU++OQnH/hpRzHw04IFsd1hnvN
	uTJqoIgtZM1Cq2u2Ii67UxrrwgonFS7eSuTAn1YzesmM6fmOywBK7xCfM8zUzxdHjCSSI
X-Gm-Gg: AR+sD13DkdscmJU05AzF+FCQiTUWWgGvKm2++1xVQtE0e7oqDnmevTIO5CjeR/elw/I
	RL4wsrnbeTJvFCwkTtU+Kb7m93vs5PdHLvPCDa0yakPldBt3uyPp+MYwYHYQB2URwh1Pe0/OQLS
	Q9pc8ZMLeVwlGS3Jz4pdZZVVbIvHETwOna/ax96BGG+E4ItbyCH8zOWWKlYqtHj0N51QTH1yI3F
	TD5iDZYhXdkDgmd0/yFLdsteyvJglN4o94gMtURCm0kWvjZwL8csdVuFtS0bAX+t7I2aElV8C3v
	q1PhW5eRA3lWXRJm6rfhwtYWaGpssYvcVWy4x24Wy0kUxoEUYllWwiAn2HfyJHzKsPO9gxPzeik
	16rPlMq1YjGZFic5IjlE/bLFd
X-Received: by 2002:ac5:c906:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c642f47423mr936878e0c.1.1787671572693;
        Tue, 25 Aug 2026 08:26:12 -0700 (PDT)
X-Received: by 2002:ac5:c906:0:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c642f47423mr936866e0c.1.1787671572175;
        Tue, 25 Aug 2026 08:26:12 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b641fsm247083a12.3.2026.08.25.08.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:26:11 -0700 (PDT)
Message-ID: <31c12756-50e1-41e1-8b01-67c1e0d6d8cf@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 17:26:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Replace old sound nodes, enable DisplayPort audio
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
 <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-blackrock-audio-v2-1-659cc4724d57@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfXwcuPcx4uoN7l
 Pkp1Luq3pxCQTiqdpuZf/hrm42U//sdyO1++89hSCZLI4G0S2tzkKa3y3/RfQP9nNxMKHYYKcqe
 XxyW5htw9ko0m4SA+A2rhkMPggNhlfE=
X-Proofpoint-GUID: cFyuMn-8bYTgqJwTJtkurX8p15YnLbYU
X-Proofpoint-ORIG-GUID: cFyuMn-8bYTgqJwTJtkurX8p15YnLbYU
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8db415 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=dFqHnVd931faZYylGH0A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=gYDTvv6II1OnSo0itH1n:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfX5nQ5N31CvK7Z
 T3kZ/KDW7ultrR9XSUNnR+CjafW1RVjNmmF5/QZpmC6QVxPKUVDJ2WQxaUL5pn2EAN4PAUk5f1N
 JqG67gBv1yEoSAMwgn6XUjXbI1BQppiNLW60AVqtYCirZx1DKgUTWFf5RD/fs3mWE5RzMzcmT7a
 8MD1v60Ui6lreJjCMxKJfVXAbDtz6ow0o41fnyhKZa09IqvS7qzK6FUEMhQ9SJM9Xerxd15IacH
 GYf530s9t80xIdR6NK4w5Br1jmD3pIq3Zp21Tp7pBISsA3j/M1dCtPaHqNs5jUaAG2/UrDU/ejP
 02+gemaXAoVhuFlYqb4F2NVIKYsMMwgXQGzKl2YXejMiV6amEQdWlmmaeIv26A58bTwe7MEXnxl
 dPO/b7HUM7Ff0x9xDYLFs/8iRAEyCzoXfDxKnD2BJ262DzD7PEjlGD9rEZts4OvUW1rqN7OqqVe
 5ZQBApi2FS3a6K7B99w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250131

On 8/25/26 4:07 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
