Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675BC3B71DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731870; cv=none; b=iT3bdtbbrC5EyhHjUcYoUZhSrhnIo16DGG+wMqUK+END5b4jRw/5y7TSEO31Mfu6kGj/cpsiRCOiNdJCbYcbahXAQyQ1EksuZTgtV8LU4+V7o7PiUPFguZfFno3GWTCnqWqiFK+UGyHqMuIeu1sowFPhaQt44m93oysvcWlojRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731870; c=relaxed/simple;
	bh=O9cNyRwoigeVL3mb7kTFmiffIIJyBa9G6iUysKuCb6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eyuuzPBM8w/Zz/G/+chJqavgWd1CDVKZXENnMlIFSlCtsbJDc6meR8wkoehIoTFcZC6OR0IfPtIisOxaPUSQ9v75joM95sECxcJI66Bf4VkpY64lJy019frdH2ul4URxiYgNRXgsZuDH8jYtCa60k0IyWSOTDQoDA4dpHYqUpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etbtjl5B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KofAdnPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etbtjl5B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KofAdnPy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rlmr3689530
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=; b=Etbtjl5B23tslwtF
	QtQlpkl/cgusRAHBrcj+ztohsHQFDQxUgF05QJhk3t+7FxIRuAzDIXLuWNqNR+VQ
	qZXFsC5qmnBK8rIF8uZ4I33yrHXlJXXxXxcbXNgCh9rZiK4MTiVDu70MEQEAZZ4U
	Z0YRz4+s8tMwYfkazs1fnUt0d8qv+B5KwvraFkKaXYz3nf9APAqfZZOFtjAhGTTl
	8puHhzHHB99gPE5ItEutU+lS1rp9+hPejc/6U88FWENyBcs2iwXwD4DmihABczhP
	n84PK7VHyLu4REDSo/7vplV9szgjSJAcDDyyeVyLsteLOfNWJw93qwJwx+FTJJIt
	cDCDmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2v45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:11:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52e4919be6aso734971cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787731867; x=1788336667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=;
        b=KofAdnPyh35ryxSeshi+mVPfnpshTtX9ycWv1b5sNQHpHJmIjfcN9RfoZFklKUFL5q
         b0KdcVrFVFTrX5iXiRZDC/4U1B00Kd20CGYpeFhgrGA6VwN9Qc3/UgZj4wT+ElZto9oH
         LXqa6NKPrZBaEBLBtoIAax+XN8og8xyUy3nf9LkfVKpp+xyMQ0mVknbDQnvyurlrf8wh
         Xr0QbLGWeQxI0oppqf0RDuU2wQmN5S+agpgJNRHNK+MR+z9LyBK+naYMwGvdMEREjkvX
         uobv8xQEiAQ6C7ggJ/0ypox/Xkfl36Qry6yQnyeOdBJyebDwLCotLZ1d1cTvtMxrwr6j
         ekuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731867; x=1788336667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d67toVqUEwUZwq+Mat+ULLNDoJ/OriCDHESH2OmmQiM=;
        b=n1Inl5sAtL7+G5KXaxgc52WYLdpFUsys4lcujfFgl1N68onOgCBhm9xi7oWygOR2PT
         YrLbbCXNEwrinBppcRqCiRPvZ5EGuyTm/UutPvNK9fPO2F9bJg0YFUPAoFgXMDU/AYea
         4lekvWtjJRUy0ZHClV7V1K0tfhM9lfEzFodLzmE3QdRnpiPBEnUZGpqmDF/bxBD2EfDM
         PLryaLAwx8fz5fLxOxxLdWzC/6yZ5QxaK0pciCmUT3o5v8oHSNMhii81tEEghwSvF8cg
         YeC1WO1MC6XfVafy6IpewisNUEqmeTezeUgYaLO262/2atsD4gCVjDLsmFd31PvGwr3k
         4Oqg==
X-Gm-Message-State: AFuF++mDI3ADSvV13iWAX/fod0mMBGYGbYc3NMcBXBjycV1Y37lz8zOh
	39kYOpkM0NTO3IbuShHidStgMYZL4SpPNuA2P0Y/u46B7bnM4+afHUsr02t8rPHqUROwI5l9qgm
	ZR+Rpt5BtGvdJWw7HlZ7h4ZuiRTptuJJl814TFHcIFx17mB8xXwZYyROaUe9F30yJVQDA
X-Gm-Gg: AR+sD10wZasrktncr29LYk95n7Fr5DUnn8ZOH4PyeJbYoUvYNCk7MNRq6HsYDPLvAdu
	Y2w7nKwhUAikXcUT2yoDVtU2bnUWtuExOD4+IUOD0InyKYBVaPCL6lpT7RblqAXZQsTDYYvJ/NE
	gyPZ+p/50auDrA8rC8LPYlCmSfelw0XXSZLMUviDe/cCeq9MNrEhEnCrLoldborvzi342Z67tTD
	kRniUXTiHKdf9Ly3AUMGvKvCb5nSuFGlZVlUJ+a7+czKw7aPtFjow4VpeSEXUlThmAcB28D6A0M
	EV9DJpjXbcDfNLDgeXDZMFe1uygzyffdnbnKmxScCJ1bNuTV0YlpRhrrDHsrJma6Ufnt1qAouer
	C3CtmHSEuYCLX6KREfDuCM/Im
X-Received: by 2002:a05:622a:1347:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52e424bfbfemr34210031cf.5.1787731867686;
        Wed, 26 Aug 2026 01:11:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1347:b0:52d:8270:8e36 with SMTP id d75a77b69052e-52e424bfbfemr34209751cf.5.1787731867311;
        Wed, 26 Aug 2026 01:11:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac24f1sm3072377a12.23.2026.08.26.01.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:11:06 -0700 (PDT)
Message-ID: <84d10253-b093-4335-9455-42ba821c1182@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:11:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: defconfig: Enable QMP PCIe Multi-PHY
 driver
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-glymur_linkmode_0826-v10-5-56ab597d77e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s5dgel1AughuPKvlCaIAvI76-xPl3nxu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfXx1BT4ysKeI2v
 CiKAegsr3CZt6XMVA4RYPp5lBW5WLWDDKc/6xtAWxjCKWJ3Px4LbNcZjSK69tNYdNFg/pbdPevD
 F73bmnFbdX0EwbgMFaAEIVUQz8URqWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2NiBTYWx0ZWRfX0q5nrXKmp3N3
 qXVmOBRxVEMT0zW6L4oBSvPfANcK1qRENNRt+tkTVTXNHWxK4vZvRyMRr2ufq1jZCQJF2PEfRTA
 qXrIO+amGo4blm2qspSYIdl9RWscODQ/5H5ZhYlEAa61M4dDVU2PVR7WqW01MPgJoQNxtnmWMut
 NLEfnISLRohLx6ihzE34WAmWnAEha95h+gGFO9VxBgdXqvScOg8uHpt+MZtuQK43d5ue5bQjzhx
 ytjThWBVQFocpvrJRdBCpB+ZEF4eCzAAMlczkdqbk5yIXAGkJN64vInN09BKlCQlr3UVqB+TqIO
 k9w9PNzKAdPi/I78gvLqA9UFk+GAZiybJLT+YZPH+db3999cipYQ2/pwsXvwk5FZpGL/V269E85
 l+aj558XvrQTZrmwXKTdMtVedzV2ib24eLL2VI4NI4zpVigq0KDd4G3P5WwrMyzcfsJSukQwXs0
 MtJPnlAj8UvW6JmjbIg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e9f9c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=B6dnFezVkazQL_yb00wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: s5dgel1AughuPKvlCaIAvI76-xPl3nxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260066

On 8/26/26 4:59 AM, Qiang Yu wrote:
> Enable CONFIG_PHY_QCOM_QMP_PCIE_MULTIPHY as a module to support the
> shared PCIe3 PHY used by PCIe3a and PCIe3b on the Qualcomm Glymur
> SoC.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
