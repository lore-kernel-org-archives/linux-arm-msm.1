Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597609;
	b=QK62AXcHxwb/aKLfK4O5KCsUIULlUOHuib42eRD//4dqTkA19lxQK91Gvo94RvlTzqNF
	 +1fuKtanksLbwKP/eX6wa7o7a6Lp0NKiAZKk6KfLyZhNz7g14W/soyZWNCgkLhg+zAPEa
	 HlURLkJHTgG8N4AIjRZP/FAdK9nTuibEA1QS3OzuIRlpqcm0Exq1NmlQeqa/d2OgreVxD
	 8mT25FaDqc0Tx4CPFGwJZSjpJyHdMdnOr3Y5bNikkGknt8h91n0Uhq4EdEiYwCiyZvdIe
	 MFTDaOIaarJyv4/9oh52DURESLiSkIkquFLWPbLDN+bdaLCyc6mWMKGJuc116vaN0pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
	b=D/IbQtSaM0NR4sZAtT5TkOgMhsKvV6rUjLKCfZ0LFlVMsHxLlndKWiM7KBc1W5y0j3NE
	 qCwvQQntqtB15nN23VejXJaOgmaJValId0tDzUrFylzTWTnkZA+UK3apd76WCorudo0uj
	 cELxv/vTYSfkz+P7G4z0NikbQg8Nyuu7Wx+g6t8fTO8izAa9oNncN31hUlWiMCKFKKmHj
	 K2AybUVUTNyY2sEc4Z7DoaiXCZp0NitzrHSn1yTSJOmZDrV+mnohmob8d79PO32Igmvpu
	 BHKyoL7rg4ntrW9DU6ewaNtTVYIeuD4c3mEFbW+8xjth/4BC/IZyhdAOiKG/DdYNmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bA1mqBw5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9gL284Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99F606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E99F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bA1mqBw5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L9gL284Q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69TDC3809048
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=; b=bA1mqBw5lUnG6vcd
	9K1yC8/glLrZGM8XOpAUuivrZyGRIfp+WD3undW+UP+VEUiaH/zShXTlupgnBWQp
	PSpANanOhTsQJ8IgxFviQXTLO7DxCOyHW6Fg9LR5XbinZSUrIoNQLsrQKt72yc6j
	O9KB7TBAPXhNX+SlBIiZMEmnrispHc1S1OCsyui21IfLQ91XXw970clFs2fTwiar
	T+iQcfy98sZ1L0cIz+L8JGWXMv13Iqr/Sq8rYqoPN4B2V/R0zxru8kNaqkc2MLxy
	U1uLtb3Q5pwnHYEHAuMjEjO0/SbPU1r5pKi1oN2ovulPP55YNCDxUe5CiG+Y0yGZ
	HEz0Eg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkby0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:06:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so13046381cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597608; x=1796202408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
        b=L9gL284QSDfokq3jJyla+Ng1+2kGgg6yh+zE4A1tptvJadfyjIpFqXAFaxfEtv2m9t
         8NqG3faIQk8KkwbcPxS2lWYvjhN0uHzzD/u/9UVJ8PBkVRzwjmo07MEKbsKx45/E9v6o
         HevDnY5jS7gHFq/lMR8xeinWJER+WQRGt7BTkIpwtzzMBiPWjIHNmvsWzcc/D5Y12GJX
         /RNquN8jTUcPRQLEAE0F5vy4BMouv8ETEJ9Ro4ZVLsL54SSRhxxGmMEaByU/Zr+jqYgG
         n09uiNnJzciFLWuke81p6Cl4zrvoIMjKiiizAw1n3Nb13RE8ygB+eIg1//b+ByK+MSh6
         qraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597608; x=1796202408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNChMfmi5DInFMx/izI876SpdAyPSwuqxL6T2yjWjFU=;
        b=Phd/qynCyYYgphyC0pJLrZo1rthEW98vaK4QMxi7FG/03H+broMzcJ0a/J7W9jQlMN
         MYAWJ3PPuV3lBMArvePBEJV8z1ACMMBR62IIki1dVckDPuTO8kgIJsq/b2GeMUiLgKIo
         qyT8vetSBId++YGzUjsTYCN+IlaObsxYNmsYSRg2RcoFidfRP3dxVqapz1cMVbOtDRho
         n9KiZai702nySZdpZEDZaArfoYPr49AdogVRw7haVSbhkhM/kuEI1MaFp+JXQpERSuFt
         j4yHYGNzvK49xmhpzi/0hsI4M4K+jwoZWZBaCvm/mZdOtcs4Gz29UWRyeNklp5NQvZCM
         FqLA==
X-Forwarded-Encrypted: i=1; AL+hErGctXlVUsJD023XOyG+PHaLh0pVng2Ax20PWEqLAz6+jFUf8qkamSrGSvX0iHnKNz8bL2Wtmxo6Sh7ymGuZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/2G7om3yadUHW2dQwKtVPECrP26fEEY0Ppjd4LM24InBba6fuS
	bjdIE2feN/Eo4Vo+5E881k5dzysGt/mp3QDtJsoul4BHWgrmBnv6KlVzShFsivb1KZI10U51AGd
	A5mj2RIsIgzmuUBFWDf3x/16dx+2OBbGioY7PRqjQ3TnMfEEOIFHHe4JOw2arYmKKo63/
X-Gm-Gg: AZFdTZdmnwNDvaLzw8urpRwG1Wz35y1psxUpaB4ZLA7tvBL+bLrnuxiTIBg0+3OP9Lf
	W6qouRGgqjLNyLn5iGmJ/h4825ND/2dGwocZB3ExCs7wqCXI9wsmpjxM/+49nBfJYqSUsJzfjz/
	6fxW/TkBvUn9JPTdZmFnCbgXbJ4mhrRZWxPVJcSwIO9Ucc1nIf2N7JFohql8PFoM63QQqkVgUjN
	g2fYi6P/Z4m1EuFvQWVwGqtv0E0mvyEinqbBuDPYUbXDzv00n+dd74gGEfALUEfy4CQfj4p+IUZ
	ODbhD2au/GtODOfH5vI0wak+EzVA4ZLtES1mubo23k64uAISTfn1fnLzILnr45hpCL78vvxYykb
	1+B4tf/SHN1B0yl6gxX+UL3m+G0AdX6fAEZOxJZmNrz/KztqywPKqhpNggn8hkTIB9kxd2gU=
X-Received: by 2002:a05:622b:113:20b0:54b:18a5:ce08 with SMTP id d75a77b69052e-55d76740b26mr301585881cf.0.1795597607742;
        Wed, 25 Nov 2026 01:06:47 -0800 (PST)
X-Received: by 2002:a05:622b:113:20b0:54b:18a5:ce08 with SMTP id d75a77b69052e-55d76740b26mr301585671cf.0.1795597607313;
        Wed, 25 Nov 2026 01:06:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm620055766b.2.2026.11.25.01.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:06:46 -0800 (PST)
Message-ID: <8649f0ba-a333-4ece-9851-bf58cf20036f@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:06:43 +0100
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
Subject: Re: [PATCH] arm64: defconfig: Enable FUSB15201 Type-C controller
 driver
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        brgl@kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX8Gt7Gp9I4OJI
 +kKaKhvw28gaqWBiMIX9tdzAlaDL6hyEju+uLpaOPQJlTHpSLy0XA4Nmf71SZOWJgPf0vS9/N3z
 pSHV7P4xeLi3H3+i0STfNCdY32fmo24vbwwaEFytJuKH2cC/SGuvXRj5mYKmjgfyiUHsfdS1GCr
 gh2pEdJuAKAnDQnjQCQgQ+eMvnAb5ZVvAmHcQtWcDKIJDJeeMduJucU06tJGmSNemMgzSWXcgFt
 /4HTEODNb3lHn9QTrc7yZVEgfX/zIuNXx6fwuqyg0DpEIbSKJS23uDhnaQzRc9HRJyrj3UhxX2U
 cG4AHbDn295tJeBthBlPgZQB6uuI1jmhtmimc6AqKhe1ZqZ95+Y3W2TY2U4c8KLvrfekx0kj5rG
 5mcQ2Qqea0E/FoJl+KyRO0gZEr6Q3o8Las6hEbs/rKVwSRCJV0OAGUJwFqQQv/0A7q62FOXsOdU
 8jNtEBYXk8ECHThR+KQ==
X-Proofpoint-GUID: Z1kPkdwwrrEG4ywdUB_6sP6v7g-3UxHD
X-Proofpoint-ORIG-GUID: Z1kPkdwwrrEG4ywdUB_6sP6v7g-3UxHD
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06a528 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9fKiYXDB1noZe8vDgssA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXwem+N0Yom0/f
 E7wbakJZdOk8MjmHzRzE9PuKgRyii9SZA8PFq/djBTvfm4PXapQkWsO8AoM/GcI/fVim/TQ2kcc
 TEkJfU16m02diAFleTwxJino3z5jIA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On 11/25/26 10:00 AM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Enable Onsemi FUSB15201 Type-C controller driver which is needed by
> the Qualcomm Nord Ride SX and RRD reference design boards for USB to
> work.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
