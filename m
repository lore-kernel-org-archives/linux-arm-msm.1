Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9321543F4BB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223505; cv=none; b=eIXRglwPVBQ3QquKXU/a6tFqKkOs6MxTM0s9pkT+u4CpFD/nfR41c72V89JzzZNFkf1KWtmgIVxvsYqiqNxZFxekk6WDuBLY5yN9XDamX7YZ01ZhmTDXx8aBvXQAmnipmuhHVVOsckW/uLF+3FrKL31Uf1gGNpd0UlmTAD92p/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223505; c=relaxed/simple;
	bh=Ka2SSLcUV8UUWFy+BL/2FYhkRx4DqSe4z6zTc+Ne/fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxM1CIp/nGmOSvUMrml2cg3kUgWoz0ZtqCiIS2OUAm4fwZoj9x1BsQ/dtYco1ZBEDog/fpQmm0XA0sLZLlSangDVUtceqZpE071X6zhCY+jNjCIDl1yvVOXzlBN1aGfeZ3iIvvLRF022mkBdyf1jZalw5x1nVWwNNk1QA5gZ9M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kou2dgZD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2kBNC69; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kou2dgZD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2kBNC69"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSst23275067
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+5+w4eeCJgo7hXfrMv7Q5GbOkc71xdfkF2RHVuAjbw=; b=Kou2dgZD+uyrRxnb
	XWYOOYOVSwrIF0wFGSmSeCsgazRwxg+Rsme80SB9T+4fcDtG4+zJZuJB+h7pAV8z
	uDcBdXi479iODyV8AEEOwUK1gQr11UCFqcCULTAMF53XseKI5k8+fStedc9Wj6sM
	0+afcvBQNKhUzjvLW9yxS+1LD2f8/Pw4FY4Kmu+Rq93Dc2LUnhbm/6JpISi1sSMb
	nr0M7vLg1uPpnYimifNwMFA16QaVuI/A0NBtKaq72u1ZepEFbiLRLm3uAy4G7uYG
	tzlYU+dtmtvaeOAdcKu8XSJb98aMiACvLYXbCrZqNcarvkjByuC2N5D4e8psAx2M
	qkN9kw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2rem3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:38:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c069f73e4so14072461cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223500; x=1784828300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+5+w4eeCJgo7hXfrMv7Q5GbOkc71xdfkF2RHVuAjbw=;
        b=X2kBNC69mKs8oU2UxxRLyy8xkKJicyHdZFDyPMXV+5BonRaWqq8i0vbjSW56PPaLsL
         n5F1mQJnMGcv7o75WBZoatjtpRFF376vdrM68mT2hrVtN7kAhkGLhTRKGgrP+vAWdx31
         Iqf0qJvwEY9b2u30csDuP71U6+YkJ5p/VN/CrCkcujZf/tlkrMLhaa62jmUzUEKqIYZc
         86ycUfuvDc1nnAAWm83wWKAL3U7WCt4TRnOzNWFOW95UZDRSAPRdAyyFs+SLW4WQesIG
         Z6tfkLPX/AcmAfgfRdBcQjPomIEBwqjSnr03FtFaQ+yf8QNWjEEikGdvpNPWF2fHeVQ9
         A0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223500; x=1784828300;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+5+w4eeCJgo7hXfrMv7Q5GbOkc71xdfkF2RHVuAjbw=;
        b=NMgBoXQ6t0q8oivqWAk5O5VTIG08GnrGPGwcCQJ1rpjn0Y1h/Z5VwBRQp23pDjCCI4
         blBcWsupnjSkfiLjgXCogbynurMV7ZPKWc66GG2mHJVYqiE5qpAgzYJzJq4RpNbieTIz
         pZFfgUKObc0SuJENDQ3+NAJBlHdDyNX9XKSD49EyOmor1uCp6NfIhf8aONPRcxhS16Ox
         ANuUV/0GqyqnbUJxkOZmSxIcXHtoo8EhhSn0za/WiVt35qXYXszOyNDb5gY3m+zzJ/ks
         SYrMFNMaWbW9EP7H1L4irIhyWFKrOzoGhikBvzfdqP/fwe+Xwv/CE8s0C5SzNexfufbU
         Pdkg==
X-Gm-Message-State: AOJu0YwoAPAuM859TfwyAsZ6F6GHrXrSuNVTnwuTzcDCeAJpiy7HbwyL
	7ac4Za28SDRbCUrc5bqFxeiXP9allekMSz/uZ6GDoTe6ORIw8xbf1USJRUvMw+4lgZ401NWEFBP
	2OasEcn7UX46zP8/aeE2KHzDv4reSk7wb16lipGOp1M37fHfL1CQ9FbSlBZqmM9ZdtLsh
X-Gm-Gg: AfdE7cmLu7Lx44wm58HGQeyMt3cW0x3eJCkwEYNpwCfD2B4HwSiwLi1ORMUqlYTGBgO
	2VrvMpdTgfFFgbZjlmdmjAqBuBztys3k1Yj5kCgenZQ8DD975uDpGV8PSFs2BR8DxSd/Xl+5eQ4
	Caqet2ksn49RDFSZEOEBCtVioYecNZIQpLKWUIz4Wwe0OvrZq6ixrvB2Dh5NOeX8zpnnqSL38wI
	UeJvii4jgydJsqtG9Nsq7tmtmhoMS0MCkFf2hYN/eWk6C5KX0lAj4FkxigRRB+9Fh/qEZOLFTHb
	P+pNeC9R8mmqQHFq/GCgvazW+BAWG2nrckoAF4vPHYoe3bxordj1UhHYeqdS1iPL9T5CyH3/+XC
	ZwLMMenKM4Wv+rQnnfKyBoNeA
X-Received: by 2002:a05:622a:58e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51cbf360791mr177688181cf.9.1784223500615;
        Thu, 16 Jul 2026 10:38:20 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51cbf360791mr177687901cf.9.1784223500179;
        Thu, 16 Jul 2026 10:38:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687128d89sm253982766b.4.2026.07.16.10.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:38:19 -0700 (PDT)
Message-ID: <74feddc1-4298-4111-a25f-333f93fd7485@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:38:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Enable Primary USB controller on
 Shikra CQM platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-shikra-usb-dt-v3-v3-0-13f73a0571bb@oss.qualcomm.com>
 <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-shikra-usb-dt-v3-v3-3-13f73a0571bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7NpMkZlB9IbLH8RQQEvw46yEuXmQJH1D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfX/Na+lDglntll
 YOtFJK7DqPl7sIX6L8TaZm+J8SBepd0bI7Hdpb3awmHWxW92thYsoWkgDyfS7BgNChCaaWtZfMy
 XzFybHIjdkBWhDvcIl0tyk+M64HzNaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MSBTYWx0ZWRfX0I73EenLIcp9
 lDKdjbOsU6S3Qr7YLujIweiTVQQTzhN6hD+pzYcpEJWjvKnuHoeu9+hoPpYjXr9FO+Hb1fGO6Ak
 MuPJRYhhwXAM0mg6MvZ1bGZ46zQo5pg5k968L1tCROZMAnlry04ebT2QscMf5/9Uykqps9Bpt+K
 N1FmAFHXNOn/uC8UT/r5iCc79YislKl7Wbpx384lRoDw3oKj+yeh4d39xL/4fmGT8ho2qnKCKXH
 SZOQpLy8Q/5/aUvXcXnRslkAeSztAevz113rutU7KVSI3817oWbrDRK/dyQuW/FafQP2KdF2ITd
 4OzmI8JZHg1vVxff8sX/rYaFoMvIEHjLx1DuFCE4wLX9G4VCcZBVUuY2mE2s05TKt30/+MBwuA5
 IYYYPVlyyv1gOrKhrILDR4dgSXv6TCXyEkHFg9Bz4sccAQ5705IENII+4zVbw6Aqm6zqKuZ67mn
 NfGFJLM5O49BMf8fEkQ==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59170d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vkizRLYyVLwUUGCSQSEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7NpMkZlB9IbLH8RQQEvw46yEuXmQJH1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160181

On 7/16/26 6:29 PM, Krishna Kurapati wrote:
> Enable primary USB controller in device mode on Shikra CQM platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

