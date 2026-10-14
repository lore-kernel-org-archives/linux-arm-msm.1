Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252D74E36D2
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980933; cv=none; b=sPiGFvU5Ogq/BsXW4Ungg5nqvdE+CpC5JwyRAKeeLUm5iHy+rSP2tGyNon1lHijWMiA81lKddHP26UaC86YzjoN+uZZxDJ77nso0xKj3y8cir9/F/VCUBv2+7lyMaNa0PwW6BahvjlUNQp8WhNuNfJEXG/Bpg8nnAe6eWZwjJfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980933; c=relaxed/simple;
	bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8Px4QjFkfa/S0WqdMu6/AJh6Ze+n8gIE/e5cQAVcyor4EC+ml/M0MvwO2zV78MAI3hSJUf9NxXB0aqtsYCnUSbrSRfO4w+qkja7UCz4UT1nZhQgR/aro0BZh0zuRJPR9IesksNt2+F9aoQ++znl8m3x4jJU5Ve9cPwxooJUJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hBp5+gY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+V+VGp4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hBp5+gY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+V+VGp4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7dC1I2873863
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=; b=hBp5+gY4ZSoNEJW2
	Ns0QHOcdMVFplW4A5yixPzmbT83GllJrMMhv1XYzDfDPxMwsIMpqvctjetopl7rg
	VTsyuhyeft8a120DfR9qYSNEvKxkDacKZnbcF8XELZ/Saf37AIWp41Q5SOnu8pzc
	/YSWf1MFEUMKq5nYOq1XW9qzPzFm7QgvMMVKz/4T/CkVj8Rt1W4n2hNW2jL7MUz/
	sF3+lS3IKgi+UXdn+D8FOU3U8vBwtz4+yOulOxXJrjb8nY4XQMbB0psGZy2EvPRA
	QOXdqPUdJL/EJTjP+arhDXnt1kKX55EYegrnW2MUIabMyHFS+hdkJu2oJkaeCSHP
	IIXDAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjgvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:28:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5360b8cf8f5so536581cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791980930; x=1792585730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=d+V+VGp40l7PmkXrCeQdSp9jHHv4JdaK0nsSF4l0X8/nyQIkz/pVDSo8iFPv+OcMK1
         11lT/TjYPCkgAfO2mv1cxKDj0+04RCKvuBdB5yBNaG+ovWtbppH8dhr/w7y3reRifLkj
         u8uFa7kiO8OD/0gzwT89373Vr4/WKjTkVWEGIqdKlHNZGgTvVGmzT7rw7P1D5dPPGaI8
         kN6EtUyq2xCaLwYmyCt+FKZLZj7ZOMAo62S7Y+qxkkWgKanPdK+JUT1OP32OeApNO2SA
         7+oYw7x0yzroKFIqhYNhIPLEWK0b7XXmrktfFP26/JeTqnU4dk2GuETMyjrfIBitMS4t
         cCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980930; x=1792585730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSxddKp4I0UCxp9ZyNQQ3VHE0rhz14xxQPIoVAC1g6U=;
        b=wVilrvc8n4AD9GHWwxFkE+8uUpTc/gTfSZWUu4FGt6AWt0+e+CRk3zme1tOe+28zJy
         QOHO+vB2HefLNJjNe2uH17B/2RV5V5/EbKUiiv0V+lfCw3s0aTLPUHwMNoCdgcyAXdja
         HquvNkJIe/SzEbZjTTYMNL8LJTcZGGf9s06+so4uZUkn5KNJ31s3Cse/YfSzGWRilyUO
         7Mt69cOyKd6esKg1Cgkq2kj00V4d26zKI5jOiS92znQoTeVf1XuefbHE5TzFLETG24aL
         ZncDmqipbctr6MJOuu8Osr4KDUNZ+v4puVnHkP4nYvBoZFA/VLacRLJq9m5D/DmiJ1Hd
         GnAQ==
X-Forwarded-Encrypted: i=1; AKwUvBz20g51JAlTi7DyjEPcCuyTpLaMiLqgXsoZBzsAIU3M7EgrTviUOmExK7pS7MsXhLQ+0XszfW1xuJEEl4G6@vger.kernel.org
X-Gm-Message-State: AFq9FYJVpkOycMgXw0l5UtIFnTrMYQDNMCrHayYqxc36EQYuEvkyMUeu
	TJkAFetQNf60o85dKFXvokornd81sks6n/ILNHPsbIUc75Arn1Um6EZIBhmJeYBS5WgOhRKIQp7
	Rox4F9utsSbrcC82G4C8OZK12qQ1lz6YXgjJmk3q/Kiwfkt3glZ6JqSFg05nEBVy0oigZ
X-Gm-Gg: AYBFou2o+SA9Nty0c+0e7MOdAcaCTJy6ratwMD6moSlg/iRO3dqsO5FkrMi8aLjyHVP
	GGm5wqb8Dhg3BsfDUINNdsWVadbmKktxJFRL6pY5DIzDGRGaaAkrBPdB8qvBQMWWf0gncGqCIDw
	YXP4L8FUF4LdCPb8ZM2S/nOpq0JarwwFy478f77naEhxOrkiRMnEdoCeoC3KARisQGw5BMGxXE5
	XZ1nGLiA16UDOVAJm/zotNVWTgXubXRO91dXLOgNF872KjaYaXfu8QQ1uUq8EFusXuWFiHiaRlr
	4fYPbYjnYvhZxdt7QYUDiruTcI17MO3DeAmKZ/GjKaNzj2fEf0N+RX1oJro9M10fd4CA6A7wTkF
	FZQKFTEUDdBzZPU2HHjVb4g==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881091485a.4.1791980930255;
        Wed, 14 Oct 2026 05:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr2881084285a.4.1791980929180;
        Wed, 14 Oct 2026 05:28:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9767227sm694052766b.11.2026.10.14.05.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:28:48 -0700 (PDT)
Message-ID: <d77bac91-1018-49f4-8128-27a69f754aaf@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:28:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL
 wakeup
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014121910.1509541-4-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fH9Ilp7DoWKhIbHEzVUa3BFnaN9vyEYP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfXy1k5Q6SHBB8o
 xENKscS+4dgHCI18fVNCz6ontOCiHFE5SF09lZYtxZ3/ykzFSamx7DDFdVENmUwqvEe61vzX0hG
 BOla+lnPRGC3LT0jTDl8N2gATnfOP2s=
X-Proofpoint-ORIG-GUID: fH9Ilp7DoWKhIbHEzVUa3BFnaN9vyEYP
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf7582 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=swowMNEn3sr08J82c5oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX6Ih+n44xlf+o
 WxqPJFutoC3AsAKsl5o62lQ0ALMWthdsl1UsozgRtJoqQrqvBkWjVT8YxbLrakhOZM8FxDFFqEw
 pR4RIdvoPDwGluDqfj3YeDznRe8XuJGXssdnv395EKMEk9AqN4SEf5wd6I8xTTH6NCy3aknynei
 REECUVHyG87hQDIcaazAYuhHm76HPACAM3uAYPIPOXvTUe+7bvB5i0gRxz59VqfEYsRlB6/DTK6
 BQOz5iTW7C0Rsz4P54Gxwy/R15LqMwgOZBT7gcYdcv4P0Wj2MEbtcF1PksvrakPtWdtmbt7Lttk
 SxMKp1F3qYLnhKkpFlP+XG/VfEkNkOpqYDWLrCRkqaW5W+DFBhngQZOLQyNvu5/YpfFNIIgDGoc
 BOcKDkBydUtpnVmGwCO4ktgdKKEKZ3dTXXx3kGwJKrrUIp8ifdjmylMlw927Zt0IQElWJ28Qnto
 GteZbb0KLOLokLq0g9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140049

On 10/14/26 2:19 PM, Linghui Wu wrote:
> Configure the WCN power sequencer SW_CTRL signal as a named wake IRQ and
> mark it as a wakeup source. The CQM SOM DTSI is shared by the CQM and CQS
> EVKs, while the IQS EVK uses the IQS SOM DTSI.

You already have a reference to that pin. You can do something like
gpiod_to_irq()

Konrad
