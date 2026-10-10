Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2CF45DF47
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 12:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637020; cv=none; b=htt17AAsco9pA2eFiPxeUCu0LjNFs29mOFjL+TRb84HZPh0K4tLFNFa59oMRGpyfp4W11bS2Um6MQkF+g2W6ZZCituSZn/dstYXqhOmYLs9KedfsCr/mN3/V5FJ5FtPmAoa/8iCKVwZLYYnL13e4vIAJbX00Ae6uQZOqk825B98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637020; c=relaxed/simple;
	bh=W/UEILEHedjWzea26aThXcgblmNjNpWx4V4u/V5lw4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J43cAg2fEgiWNfKEt6JjQAgnXrcwIqpxQNi1XBCfgMOVkR9RGeVvclPZ/9D1sDOt6y3SBZPZzdwsqm29BphAb4KLyIy8P0G/QB5n3TsBQYTLVS3THW8nI9fPJF1hIYIncUt72ECt/wIOjqyhBY0tQMWY2HNQN4a4kzlvpxJ2cF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJk1JCwX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EjG8JNKh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJk1JCwX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EjG8JNKh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACVJrt289603
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 12:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DdqTfmxv7RjX7a6pYYeAcFMXK1tEr0dFq6vCwkdGz5A=; b=FJk1JCwXsNzxLxct
	4QIM4TwGSLRWJ+olwZ2yWHHIoln3g6Y2jeMLmBqmVKBYDmIX3cozXxhZAdDSHLNp
	LxnyO+jgEUqY0CX3WJ1b0dPZoj9awMVdqWbRSoIIQIianSN7IVgHdXub4Q3i2yd2
	2MQ+VZ384Jvpq8kJgCerM6AxEJHHAR9IKNKEg6DOEVzxfwz5ADAGfs6+UohDnE6L
	pB1+eCbvYUCrO3LII2vFrPdUHa7haSpl7zi+QCPKsD61BazHAZMtW1BXbVPGZUBk
	66FfaEE8QYrHYRTWP0K3UQB4WUNbFvnFea3bWJxmsGkrcozf9DDjxIryuB+c/pLj
	ZaAnoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpgh4mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 12:56:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc7a6e4e1so178711985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791637018; x=1792241818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DdqTfmxv7RjX7a6pYYeAcFMXK1tEr0dFq6vCwkdGz5A=;
        b=EjG8JNKhxhpw4QR42vSFCIdPfmzluMofsKpvyvOYvIzeGskQG20BATMzRaDEmltf2g
         NOLKHq3noYPyFK/LY+pXLO+vuSETvXp4XJj6mkAUPfqz7L3rWEaZs06qWPqIcRB1tFvl
         8W9Gnn+tPYPmUAILGeQl5/aYNWuvPEppYw40z4/l03wqX14AmAM+NBPlQHRN8wm2z4LR
         RzCN9js+RnO1njgE/IClmI5W4oYyMV/sbuEN0WWJ0UKmLgENPPc6NU13+omEzQGsUMO/
         x+ZYyZH5osJSU+8i/ZhN3dmQWfBo++pjwGIkhwa2NqvvkZNFQOuqW+RdMAInydcKliHF
         CmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637018; x=1792241818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DdqTfmxv7RjX7a6pYYeAcFMXK1tEr0dFq6vCwkdGz5A=;
        b=SRYiHLjzaZbvXYYDhR14Z7Y1+RwP+FNMQOYOd6ReRzC01bSUsHZbPdrV4LBTaw6+BL
         g2QYLZQNht63M70OnZrsUTuwVv7uhx7NXCIzgbtuV/6m5KsdDxFYuhHYtHSO0YMwh8G1
         EzWoDJawjbxkdOrF8iavi58YJDMw+PQClCZGQ8jlv5S3dDaY/wcY/ofgeKuIdx21TxHe
         0rzV9qQW3U/rPChwIGJn7mbk1S5IEZTl8ArPsQqP5mNX6tdEnpkg9shaj5eF61P0wHZO
         j0l8W1Ezhab+q2IKtdOFUQEjCpgjeDZ//XAiX76UzabXsiFHjHAlHsC0vaxSgHvNAiGC
         /roA==
X-Forwarded-Encrypted: i=1; AKwUvBz2g6yKOBpe6MJHEjvcbptaBzJRMizSyWDf0519bJGxi28SPaDrdGVd+SUFf7WJbysga+yuiyekDqYMVMOX@vger.kernel.org
X-Gm-Message-State: AFq9FYLn5prPo3YeBUKA/KEUTZRIh5WyBEaLGAHmWU0VzfHLTpseOUN4
	dv8G48mGG+dodBIpXQ+35/hccOoLQurRaGuvUj5hpBmsYoKFkOchP3v96h5/+BNLeGTZ0A54iSf
	HuDLhk7GwyyFwN5K8uWF+UTQ/KWpd1zUoLyC+TbeV4BIEJDGP7q226S/yCnAwf4BbdFXEyw9J/5
	L3
X-Gm-Gg: AYBFou03QnE60XMj8HsE9ZBpjugyueHy1wHi2XCdTwsinP75mB+2JwM3e4lXqJDxxaq
	0r5ptFypNUlXaQR1QaASKXP0AQVtJ0idQTXvjzb5go3t3iNjhUgnJYQPbRKe2nPWV5asWYRt26b
	y6rl5/FaDBy0Q3KYUN+cM+6+9bQ0V7Phvuzey3XLc+TggHXWUIk/BqlJZLSxpsBQLnMTwXc+ZWT
	HoXgKCZgthizI9CgSQ/oZrwfUoaWsKTelPlwv4Y3A5KcoLX8hrKGs1ATDYxI3smF5si0Luc2SpT
	gvfTDegnWJ+MjsKSQjlg/Jmz66GLZF2hrytYVLdf7PF4nhiYNEH5giF0R9RbHGh1DB7kgojCW8v
	2X5Bo6PmcL3hWebauX5JuzvRE6499fkENt6PE8qMxLhCRuQ2XuRQIhBlhA6QgPggbJfELNbTda+
	wiczSpeDjJEWVgTUNF
X-Received: by 2002:a05:620a:3947:b0:92e:8310:7369 with SMTP id af79cd13be357-93ebd248de4mr824665685a.37.1791637017882;
        Sat, 10 Oct 2026 05:56:57 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:92e:8310:7369 with SMTP id af79cd13be357-93ebd248de4mr824660085a.37.1791637017012;
        Sat, 10 Oct 2026 05:56:57 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-350e-a8a7-dac7-41db-afca-de74.rev.sfr.net. [2a02:8440:350e:a8a7:dac7:41db:afca:de74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm9014383f8f.21.2026.10.10.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:56:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, brgl@kernel.org,
        Joonhoe Kim <26rote@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
Date: Sat, 10 Oct 2026 14:56:52 +0200
Message-ID: <179163700869.6835.2267810663519966879.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007124001.1724-1-26rote@gmail.com>
References: <20261007124001.1724-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1MSBTYWx0ZWRfX5fF5tHgWbBjc
 n0j4utLEwu0xAAdxlIo5KKOSZT7xTqEEX82ToKdgd+gf4bP4GOnH9u4pZ5902U+d/sNA+1O91HK
 50xAA8htSOwoFOH5MKjUFMuNUQ1nmQE=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca361a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=buVoV1uq8FEZNaAFP7gA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GnpcgXFyegqLG1FTg5fQ2kWypEL4WRrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1MSBTYWx0ZWRfXzZdsoS9zlZnD
 585b3lUJ4IgSE2pCPHv+JBCEy0nswVxaDWyC4l+1Agfvg1qt0N4KKhaZM6wnFeLHzWQoQFmh3+U
 nx/XR9yQkA6VUQMy5pZD3FLj36D8oy332+yjHagMyIgO8svffigPpURlilX1N2j9DqOMfZEbKB0
 OyYFZcsHuX0hup9f2RozlDJPq5RnLM0uOdzoFR5Du3X6/LC85EcktQYbUl0/KeTMobq+CFcUKHu
 yMf2w4QYeZxBoMXHQPzudXyNCx9eEj4df+v50msMj/iet4woR0fNxNq9ZklbAN7r70cPEA9YUyt
 GKHd/rh04IVNVZ8kFqEzaNDub+bl47Rx5uMAqY3Sim1xEg7mtpO4W6ZSuZ2E/MhtzhIQLZzm/Z3
 Ojk0u0EYJi8riqQ1+jl9BCb/4BId2MqVtEbpLWNmkGHVLfKTHBFYr5apC8TRrFPpl1MHGSrU6BF
 mHzjbq2n67aAYQipV9A==
X-Proofpoint-GUID: GnpcgXFyegqLG1FTg5fQ2kWypEL4WRrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100051


On Wed, 07 Oct 2026 21:40:01 +0900, Joonhoe Kim wrote:
> The Kaanapali TLMM has the I2C pull-up control in bit 13 of the pin
> config register, like SM8550, SM8650 and X1E80100, but the driver does
> not describe it, so "bias-pull-up = <2200>" cannot select the strong
> pull-up.
> 
> The downstream kernel sets it on the camera CCI pins (config 0x2007).
> On a Lenovo TB323FU tablet, with only the weak pull-up every CCI
> transfer on the two sensor buses times out; with bit 13 set the sensors
> answer and their chip IDs read correctly.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: kaanapali: add the I2C strong pull-up bit
      https://git.kernel.org/brgl/c/1df7f369075d7e8f7794981995a5103f1963bab7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
