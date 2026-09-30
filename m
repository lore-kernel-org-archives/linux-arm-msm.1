Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EFE46C4BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766684; cv=none; b=hRKIeC6RjhG2pod0GtCkyWvBJnDdtbqlor3Nx/tZ/3kr/HOml6Z0kYJ/0DGYgaYc0MBFOMRYiJ6tRg/Nc74pe5FXXy4KmTuw/UxT8RBZGCqv/14M+ezdo1K36aRkOjJIvjmszv+AuCt9v6fWo3VntmIxmzKitFLv59E+o46w0KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766684; c=relaxed/simple;
	bh=i7/Ddmlv/nASy9qZy1FJthLav9YvKAiAioDkGWvdURs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJcmcDjyFci7Pds7YH4qrPDbw7OT9fscyUiCYzhGjXx5KojESXlBM6c194qGcTjz9UPd1DMnbqxoElEPwbj1MXITxmG8gPfjgbfUs3oq6Ng5IbKbwA2zhBokHdHOvVFzJPP6tgNHPtm8INcfNVM8LPR930TBxqNXcNvcsUW+PVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDIEd0ga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JpAV5wiw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDIEd0ga";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JpAV5wiw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB8Vp13796684
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=; b=FDIEd0gaYezmy4ft
	kxcmynOkHQKgYz97TpHAfasoAOpmCtvyUyKIoOGiRCb9LB5zrYPrAT6LhgqfiFYF
	4U8HzrQOsnoxZt2D5D9xrSBGxh8o4X4IgIt9Nee4NzBAZUW0fR+2oue3cPSKR3fr
	snsXCuPYV3XmfzMcIMBLPgybjLU9a0vBgek+XPDQfE2wfuAHr3X9KBjjUyNPLSFI
	raikEBg5ZDcrI8gy73Bb4gGRDsNzUFevNH4cHxxEt9x1E4WMTx7L37HR4ZD5DJsl
	v29O19qW6f1fWpDoUeieuRrbU1bn1zVHKYbLgsCEOeO3nrxT0/Xbl0kaJAkfn+rE
	DKvIcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3k2pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53320ebbaeaso8152681cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766681; x=1791371481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=;
        b=JpAV5wiwPPBUwRJEpoxkO8Ydv/1xn4RDxVeidcY9VeoDLlq4aewml1OU9SzqfZil90
         jS0qOZLyDw5MRVkXgkMiyyANxoLKpxYZTsD225bpL1D7sOSGCRUHTSui0K8dJxyJHNBr
         5QKnexUUBwFFPzVJfKESkN3o61+dl9KBFoEbPiAF8DrCAs5pzsiGxpw79UVoR4qD5Qpv
         OQM0v3TduNrnIBYT7DW3f2DnIMRhv6+bGfMFs3wdOj7IAuAdxANhbpBnsSwz8XXV+qK0
         l23AlGyFoAVejkenHgRP9WsW5cN7Q/3V6BJiEjG0gazoeOojOaZ7GND8h95rtcFRrZC3
         e05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766681; x=1791371481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLSP6RP/ktPW0pVnkumOxr/DfzMe7aMYty59LE3rHJ8=;
        b=Wujz2HZmkUWrCp4yz+1tTyboBApHARfyAGLrF2s5DnAUqZ25I9T7bE25qE0daIUG4H
         EAWv9sIWOUqJRv5z+II34wRtXBda6RE1dM3QPFQV7bgKis2LEepndZaKDFJcVtYWq4AX
         V1t73AwL63citNA8maTvU8ra8YNHI5dI5pCtAlMxZg6dAALE/cLXxWc6gbH3DeO1IGUA
         jupsEThWkPHZVInRUluqyKoizPd4F7qb23SK+vnmjWk6d5PBxRPqTkLsFv553uAkVFtj
         9Z0/9cXbyaCi/5a/F+vN02/u14nq6I8l7Xn8Q6S6VLnnxy9XS7qJeWwQOhkjjF+vlA+O
         cTxw==
X-Gm-Message-State: AFuF++mISrXDE0pYSYxjLc06w1OX4fFIlm9M3Xbwz8OrCpHBi8oQnC3X
	j5JkQIRJxVuP3ZzszTNk4yGdgvhIHD28J9IVYNDRb8YhS9aPeu1DRap1wsZHKPhLSVYL69Qxh/V
	3Xo2HJ4Uba+TDNWlwg6Vko32cs8N7KFRvy5afIXT/0sXOTcAqii4T17CrDV+xxkdkJA1I
X-Gm-Gg: AYBFou3j4AX2b80e//utgVJOSQuoR2oBMsVkyzIc5HDpSx22+b+Om2cJN32UafmAoXz
	ZVkQ36Qp9r6LB7NCh2TSiAbQzeF4oDetHpanCQ++TjDwuPVWXewjxSlSHle3t9OMHLmnCrFcAVn
	8SI1zJzR5AWdnbJgpKUnaBRZGQASIwcohwfHlGZzGHBpgNZHwXgkU6lpOuKD4Rau3zWZrWLsEwR
	b1PcO2M0vUHzDFIO+6UdLcSu7phmb2R3YE1APxTxt+aa2TaFfCR4ObRdTdeKlIyu+5aFtF2CDdQ
	pKd17XuDhH3wsG8X4oVhsIB36A5o/IJJEeFtMBGJhLDKZuNpPPpL1JioS5aG7B0QeJ3YdUBkdkm
	kJkQCLX+0L73YvPwB6uwsBw==
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr150232885a.0.1790766680561;
        Wed, 30 Sep 2026 04:11:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:939:b8da:1242 with SMTP id af79cd13be357-93ca93311ecmr150224085a.0.1790766679866;
        Wed, 30 Sep 2026 04:11:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7ea6fsm48243366b.40.2026.09.30.04.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:11:19 -0700 (PDT)
Message-ID: <84a3c9e4-4ddd-4ef4-a4ec-d71c30122128@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:11:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/15] arm64: dts: qcom: maili: Add camera MCLK
 pinctrl for Maili
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-13-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E6g4z0MUcIJYhYNWMNZk2SkIOqxmFat5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXzy4QyzCuYu6q
 kfapOC+MqG7Vo0nspIkate16RQiWDq/y/pBzrYsHXmlY9UNJIvpxxZBGrvKXrQ47a2Vt9o7TIja
 UZcfhEjfcXclfiOMsvGDhH6pGshXOpLGCH2Cr+5cxCUqknXm5p3R/UFf9iyFHMFiSWwRz1fpjzq
 ojeWem/+fceuBslZQlGJ7FyTUqHIDWF9iu1e+uJUDeGYm+6S2AmdFYvokEKxfB8l2nsypKWKcP/
 j0HG4tyXQZJvtiXN12FL7MLKZ38wRKJ2sCVuA4zg4YAK+n0iTdnQ2bEGbpBzgPuJV+65qAlJ35w
 u8FFAgGUjuOHTPqtu1IA8Q7ptWvwJVu5Ml8hAV8HNa5nTg2JV90UFIUqSTjUy62hWrXT2WNfSFd
 sX4jZ411acik6IfX62xQvquF8WWDET8Pr24bIIkeDebPnabyuDsk5lmjCbmazexiCrf1Oemnrvc
 Q68Dlba81zaQ6Xmy2JA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXwh4u1OlRe3x1
 ecIlb+hZIDLeHrwVkt4oQJBadWi34uUMnb2LYm3zkBPEAG3zQDmdaKEzU0sorejhjgNQJtMzmtr
 L1u5AHnlL9DGt0dBanyQbf+LWL+U2g0=
X-Proofpoint-GUID: E6g4z0MUcIJYhYNWMNZk2SkIOqxmFat5
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abcee59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2DWhv4IeyTXb80rK1lUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Define pinctrl definitions to enable camera master clocks on Maili.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
