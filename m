Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363948;
	b=1NqM4cZWYkmhPG8WEIlsgPUxbH2k20UwlIJOZB5QCaTZzq/K6nU1l0N5aCwY1E8XlCFy
	 1SJPvrN7+HUe5njMHHhqw5PYcUx+mYIzLn5hgztTQEQR4Bg0xFsiWMi6Y5G1B3JZ8kDl7
	 eXV59usfsZLEeor2t47S49ICvm01cpoGR0xFtb0V5y3yMgxWOseHEaMWZR5IsYhhT1751
	 QRxaAg15LyyblRqE8V1SKNLJ5ZOPIfMjQI3yoNySQ2DDn6miOMoOuHc0TzQhOzPvkFeYt
	 5Y/r6CSNy0jvhG3sTQ+0U/ECTTjyiNshoCp0L1CE9qerpL5rgPhEGnFEYkr4zcgQ/5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
	b=BcmhFKV8qXb9Lt4I8itXp5dJlI8ZBhBsxhnSsUg/lq/nb/fc/kfgNkcqN76U9bLrdAL7
	 FtvyJpvO8iXwHSbE+1P7xGtzgE/0hhxEihD7r8kZiAcHbTZ7fhRStycfLXw4cGZsphn51
	 SMHyjEnWiu3bMI/XZDtK5wPSJLenr7tia6VEiRxuuFmQ5qTvjtTgwaP4rpAkfFVhb1THa
	 srrCwZRTN8YYWR/S7RjUvDzTs3tGSdoJkZnD0ImvfIzuU7J26mmrluaRSpzR+uhOz7qKX
	 cUGAHXzDikLLh5Vx6S4bwiNZM5V+1bhI+mmBhfSO5jOtbCslSObVCOMBbJKe9JZMn6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mC0J45hG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elNaCSBA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A7D606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A7D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mC0J45hG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=elNaCSBA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG1312071544
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=; b=mC0J45hG10XRaLaO
	EcAVtMoij+nwFFtZV/OXNULSfZwT+TLTfm1ZUnSMBel980CA84cNPUitVVTUoMe5
	ZNLuUSo+l4mwTPEbdL9abC0T/Oz639N6flK/jYkfO910xfilHW1GHuOS4/35p8gC
	UmG8CeFxi8XPjzgU4R6Z6i9s9Fb7G6Bb9fHkGVe6ZSa45roSBGhLvlJcPivCjmRg
	V/bajZF9rGd/+FTVehXE3sBgY7ihmjEE+0/N2I6m5ozYfHXKmTbUi2GC5XehbnTC
	BBsMgeuQijD6/H+Xaxp7KPKcj/n+KxmvRZgGbq1S1PskCU9Xv18WI0WUny9xkbZi
	5knCDA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p334d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:39:06 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaabe26601so42481e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363946; x=1793968746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
        b=elNaCSBAnTAYmnBl3a+fpOVZVy2wTI05+w4A2Eh/OHg+xlSNmCzH29s1d/l60Tbw80
         smz8loLL4ugQwK6WMA59VAlXGZu78zwhDbBr9ehMmuvqImyCQCkhtGBPISYaoPkdswFw
         i6tuEdEplXrW9MdowcH9ddxMpbybBNRBI+bmktRsOnbzrkQwgusOfNjFm0wI1SXY4Xrz
         P/8cCIjJjsTazDAaD3xuJxrpZlqSNpIKE4aqzT85D1rTOjU08lHBqsMgzm31M8p6xl8E
         ZnnpFWVF77LOjCDeiQuKRyzVk9uN7L4xGrHwV6E2+oKZRKgNddyX7DiMWDTeMMk/uBkY
         CFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363946; x=1793968746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uI4r/lNnWWRwm5efiSfVrEkVa0m10ZlmU3jditRFSTw=;
        b=FqigtTS7yTyj4Cr+D9Ks034CNN7C5gaIsIOXK4muhewhnZOudimzqjsoVCCOpAwaTg
         Uj5IYZtSSMnxJh4DB4yX2nC4f91NHU8YlkAWbrFrQMEPstCuUVxy27sosBatH+oAMd4p
         3gtbRLT82aRZJZzAUiRMrYkgRSx+VmXoIo/yxZRgmWC1gDP7SM3uoF4bd747RbWXFumc
         FnaIuQx5h9mUwdAUU3wGx8ljFGuYyKi35INhhnruKiDHbtDhkIPqoJTn3XrYhO6J9AIU
         HVINI/R9N3DeqMYcS2n5/0+3faHOkWmaCUlKCTcKfF1DYj1BJtIXKm3FkQ1hzi5PwFHt
         grYg==
X-Gm-Message-State: AFq9FYJCL5nc6TX/MTO3nVGGIx6jINuetKzL46k/2jhnBhLhXLd8vRCw
	w/98MKuiKK3uYpR8AzwxaXph6fAPC/q8wqCuuslYQpvaqaIKmBRLSmywDUy8ngj1m9BStz87HpF
	YLiALpaBRn6SLn41ZtsZafTZS3p1+0BfyrcOFJGuAZh9SmwO5QBQQj5sFjlYHOwdKs2A7000uxa
	ae
X-Gm-Gg: AYBFou2AWKwocT39iQe+25BPTZHRupQPsDWrWM7ERG61/o9mSe727638NnOCmmTdkl8
	8jIoI+tUpuBodRG0fs+VIy6pf+ueSJMmH+CAa0fZ9UjYi3c6nzBrM5NGoJ0qkcjU8HiLpMD4Sxs
	jUoLLDaNSvARDTpwwqzdR2Li7XRGDHPqY/pJoczTC32Pe/R4ROhO6eJQUBc9hSZ6MIvHJWBiOd6
	b0JYSfcjtUMkzsvlpcCh3pS261JtSJ7beS6+f2arjwN6n79JS38+1T5MQ6Yey1FOuj20C2uSWzA
	7CDS5SbvQ/bj6P7fo7JQ6u+2FRZkBGDUV/Ds2/WL6UBfJowzBxr27yWOVoCsh2x2wIwSr8ahhBk
	luoFCB2FebZMJeuoqm5Oud9p9dkLgkRLF7N1YsKdY2zFOYVg3CTya0YwLvMRHYfqk9I3wI/A=
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr998353e0c.5.1793363946138;
        Fri, 30 Oct 2026 05:39:06 -0700 (PDT)
X-Received: by 2002:a05:6122:2b01:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec6897ccbamr998229e0c.5.1793363945761;
        Fri, 30 Oct 2026 05:39:05 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabf26b72sm60608366b.83.2026.10.30.05.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:39:04 -0700 (PDT)
Message-ID: <aa2f2311-d913-4b90-802c-e414764be169@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:39:03 +0100
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
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm
 Shikra SoC
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX68mMuz2pFnGl
 Scl8Db3hfqW1XUORYm90byum+LmZXzzna+dB3owNGK10DVNz1lOhD2bKulPidsrZ0MP3IdFZoBy
 jPyUXoEk1NCpHBNSjZyVlSy8loeLwKNptvUFSIEHS2GIRV7DmmMr9Z3Y5wTXpuhSVKaG/jlErv3
 sghDR30ZF9VpUwxK1StowK1gPf2C1BAxZrOzHkV1ciebnxePjQ7aCrCaSS282Pv1IIuja1eJpe1
 gOhJagFS9nepEPujhGOdpL5uNoN0D0aFspi8ISLT0og9U4LXbPUwD3lR0N19SdKzSLces0bZ2Bi
 /uvuRrIxVhGk1S4vQ/icrAJvaTh/tbxNdqHJRj/886kg+Gb3IRS4bCjDhmwylWOb3oIYkfRLNiV
 JgHR0eaEIHPL+I+QHyzJXxaMHyhcPiMEUjIJCdA4AUuMJgNstgMIRF0TGu2ROTUFiB+5tYafogF
 DVgPsiqNJs+kWlqzhnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+RoAQGBS3XCb
 0XbiC36PFvK37DGASq4PqwMZFfB7fXvDT6z9CMVX3nuJ9v0kkdlK4FEVXZd/suT3I5gT6r4yoMu
 D9FlzlvNj4OY5CikyYPm3O89OeWKQlU=
X-Proofpoint-ORIG-GUID: 2kZ5N99iY6ZVMyEOqi7yvGmCmrqtBowG
X-Proofpoint-GUID: 2kZ5N99iY6ZVMyEOqi7yvGmCmrqtBowG
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae48feb cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7yfVbiq-ooDmJZbsBGkA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

On 10/30/26 1:33 PM, Anurag Pateriya wrote:
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
