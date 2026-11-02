Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609981;
	b=Y+Y9OmKvagtNplLn9d3e4CMVWjNaLX1Q8bObLHdwjRU1bCkuDXyHt3xM48tyMe9IqPyZ
	 DVwNnbOV/Fuy6SxckeWona3N9buM9UH7M1ZQwl7cj0w/LRedkohArH7Ia+AIE4L67PkPi
	 y2qE9RM/L/LwLOc0R98kjGPUK/8ICN3OxyZNTMKeEp+btU/7H6d+rXx3cXjlwujeSgvKl
	 KR5NBhFMLkUmAeHj+A3L176gHkvzKB6nUaCMmQmnTytOoy29twLHUpH8P86bXR4igUEth
	 h7qCxJ0jydOplZ/mm9WW+GcrQ+rPtorvUjcJm36PwavqzEcw9sCzqblK+h8c89S81pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
	b=X0mg1j586SRPCuQXQd9aHAyFDf+XICTveLFfrzmOsYgecTEHiThn3TQNWn5HMt09LfLX
	 ubkHCUUi9QxXRkJt2k5XfNgg5k5cyRSP9IajwafaQJj0Rn6A3P6uBYM4A67v3CU4VEiy6
	 k6pUjZKLywYHE54f8dpchI0UaMPYSursUibYyE3CmXunvp2G7P41Cdqu4uhNCyjjK9i1d
	 hYRc+wH8WUTSALtkCAg6cg3tCgZLVdIaYqZGwrAf3RQ6QJpF0cy9zgPSK1nKZFo2/Mv4/
	 VHbmw+ZXcIRJNFXnWRhokQlW1hKXXIrjjSoAC7ESTuE0hCzsXOQWv5SuCpz0KJdxPYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MPicOz3G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK2LgM47;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B85606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MPicOz3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UK2LgM47
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pf3F3120956
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=; b=MPicOz3GBcz6eNJj
	mA5q8TfXjJpCMDNTEXk0HtIIDoSdFRGOgeg+uwljdC7H/HGk5OFpo/C00hZTR2Ji
	J3o1lsjpaPqv0BMztT4NmJwqLaL8P+dgunwun/5ImLFrDBrqM7yEcXgeEZ2eMoSc
	9IrPXBkLrj7F6WtSUfgJsIJCmP7p6H4CUKrh3PHrZCr4Tvb9VhLlfGRFdBuClHWT
	R/PbxASCcM2sb/m4r+3yCstfLkI9FPoYj3upikMxpeB9G2/tCDqQ+1WP67d5q/w+
	fODw0MCpXrmoYGRXw9xmDKj4W5vSsw7aS1zMCrvJLcayHYtu7M7Ljd9ZNDJO1dy8
	dSzZig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerfpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:59:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so8190181cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609979; x=1794214779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
        b=UK2LgM47KuBrPVsJy6q3nTJOMB+d7Kti2Yn8M8pamM4OS7F5lo1ekloFIVuU1hqrcG
         S+OOigeVsBecE5ESD6WeY5NnbK7sI16URM0Uo6XNbVe8ROgVmKG/hFaqw9culVVvZhsN
         faxzxjfZNDjnx3+dcCz3s4HIBlhLxemzoDVAswTwfTh5PDlx7Y3rFp7bIcDHszL3fIbb
         UqDwgkOCaQMZMzyYtt7Qkgmut6GlL5gAZBqrTuNM/AoSadjBTZ48hux1HdxjnRHoXLMF
         oS4GZ6fteZUk6qIepJTLnC7UcygNW3J0nb2iesUpd/thnfTjv7ucShW0go37GKMUFMcu
         mVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609979; x=1794214779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsIkMVZuvY8WXZz0BTapBeCRIHu02AP1S5EsOfuC+MQ=;
        b=wCjcTlOhYlmkJjvNvBmIIxfYXO706fpIYot3eG5D9umzll/f16kKprqIkiWTI1028p
         O67minBiMnYKLPQAvXGt4Adni6HRtkHAcGk5AAnce6ZZop6uir5JBk4bgfW+V4dZAcJm
         nLTAJNv0vhbDkTp2V+GAC6gXLXpZ4AcSnAiAVRxdCoATvkEbGdEIy0xiemBRC7U+cB2d
         qcwVvyW2/sOd/rdKW4HqEzh06Q8dQ1OHfzKpJmKt39b9Y8CXDwvWLPwPK04GaIleeV1p
         BTWCiwb7yKpI8r7kFipS1MdMD9Wa9etxQGdf7R94E9QIdXtp0kFtRGV6ZG5ZvZCE6Tyl
         8gUg==
X-Forwarded-Encrypted: i=1; AKwUvBz6I3rZh2KAtDXLQnpPBIPFLOJc63e8PNiU2j31ULDLMB1ySQRIrr0ZzyP9NmCASra9oaF7yNuvqDMERaR6@vger.kernel.org
X-Gm-Message-State: AFq9FYLCrtdP/1Xl7a6xk/xf2JcdyIbrIdCjAgj6gb5KZ/347mI23Oe2
	CIaROrQ7O7wcSU2Y7ynjdB/Tk1tzDwuAXH+86BWv2dCJG2ZhXGG+ZxZO+IlJ32uW+pM1QMYmjeJ
	q+AQpbUe+RwoXAPURrRX+re9fPwEVsYlKr3Nj1t7qLTbcRACldQ0Y46jwuPL/7lrCGthPlXaPAc
	86
X-Gm-Gg: AYBFou16hnWgVWfx9ksTJPK1kAUN/bOWxJIGVPf/pvq3+Nn86wbf9EtW5GVZGRiqC1t
	uOsBVLI/1lgMiyUXavb8CQOydkB+AW2sEEm7lSo5/6409QAni9tCyRHhHoD+FGzZYrMBPCq8SnT
	LAtil3TKkqpo4wvQLUQIIVY2yvCL9oCZdrk1QOkMrwjjJfXPVgNXjUjJs/96PkEOhUz3XzP4wH8
	R1geXCR22ixeVKZJk460mRbeywsVxgcJl2u7KyVQUf9LWDGEhrYguFPjfSJ2yx4AcqElkZeqwG4
	eZDcnbbcrdvvLJDxfeA+a1iE2JaXcWnVYWyqXnF6LLE4V27NTjTTJrFDObQ2GCT/sjdGxHBHxSr
	lSs+FFIFQ4/7Ij4zwj60hmSjIBsLlmTd8HqG/wYME7RfsC3WTruqwgpALl1ziQL1hHtAQghk=
X-Received: by 2002:a05:620a:98b:b0:93f:740f:5a62 with SMTP id af79cd13be357-9442176afe9mr1467288085a.6.1793609978630;
        Mon, 02 Nov 2026 00:59:38 -0800 (PST)
X-Received: by 2002:a05:620a:98b:b0:93f:740f:5a62 with SMTP id af79cd13be357-9442176afe9mr1467285685a.6.1793609978162;
        Mon, 02 Nov 2026 00:59:38 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cab9dc577sm361042766b.0.2026.11.02.00.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:59:37 -0800 (PST)
Message-ID: <dddc808a-6407-4db1-aa72-0ebe5652f97c@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:59:35 +0100
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
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sm8750-lenovo-elden: describe
 the WL2868C regulators
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        linux-regulator@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102060458.461372-5-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae850fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=RKBUxXkDnibkq30DnYQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX60llnIvcdQPv
 ZDy8bUVshqjaAuhfP3NvCdsOu9oNP0fyZV4/QdYqNVsW+JCZ3XnCM0NilyfTW8jPAwM9u1FxOYU
 XGo1F1XZqYMXjWNIXvbxFI6m1rutAKc71L5QcacgNhTMcmNofW9HRpytudogTJAiot9ZLvPG4Km
 vIJPHkDFycpUjgsKEBG04gWlDah996Q+I66Ax0lhVOfNOTv8WmFQ8QSFyymzxnitlGVybaKCtbn
 Cq+eu0tb+7YihZ7TCKguLlfmgZMD/ZCldX025JT1o/c9P8+GkIIrw0bXHGCpCgjQyqLZycvxAnf
 6Gxz4gBk09wmuNCIspJVlH+dW/qVNjikMklZ4Y3IPbEpuvE+kTowCfPHgQE2c1/Ph5DEFhVn53y
 8S162d13kNWHxFPNvmlQtoyRAGikBv0Hp9N9HniHzoJAEAXqYRlbQjFBSzel6IGwkCue1OYFP0H
 RHNPUC60F0RoBs4m2cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX3yD+mn0Pnc1j
 N+o3r22ZKoAPnUnH9iLvIgaiD9idRjfWt7kEPRtHZqLl3TUQEat7wcbMyOL0MKOBC7DT+dlZ8vH
 TPg80AHNe7WsaPXlCJTA0pUpi1DudVI=
X-Proofpoint-ORIG-GUID: aaMb22505HxyiXG23KEHzGLR112vK45Z
X-Proofpoint-GUID: aaMb22505HxyiXG23KEHzGLR112vK45Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020035

On 11/2/26 7:04 AM, Qianhui Xu wrote:
> The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet. Its camera
> devices are powered by a WL2868C camera PMIC on i2c10: LDO1 feeds the
> rear sensor DVDD, LDO2 the front sensor DVDD, LDO3 the front sensor
> AVDD, LDO4 the rear sensor AVDD, LDO5 the VCM VDD, LDO7 the DOVDD of
> both sensors and the VCM VDDIO, all at fixed voltages including the
> offsets programmed by the stock firmware. LDO2 and LDO3 are wired to
> the front sensor, whose binding is still pending, so its node follows
> with that series. LDO6 is not wired out on this board.
> 
> The rear camera hangs off cci0 with the VCM. The front camera hangs
> off cci1 and arrives together with its binding. The rear sensor and VCM
> compatibles are the ones documented by the bindings sent separately to
> the media list; the CSI endpoint receiver follows with the SM8750 CAMSS
> series, which is why the endpoint has no remote-endpoint yet.
> 
> i2c10 is a GENI I2C controller inside the qupv3_2 wrapper, so both
> qupv3_2 and its gpi_dma2 parent are enabled alongside, otherwise
> i2c10 never populates and the regulators would never register.
> 
> The board clocks (XO, sleep clock and the two divided CXO derivatives)
> that the SM8750 dtsi consumes are described here, as done on the other
> SM8750 boards. The board compatible is added to arm/qcom.yaml here, as
> it documents this board and not the regulator binding.
> 
> The file is otherwise limited to the camera PMIC and its consumers: the
> rest of the board enablement (SPMI PMICs including the parents of the
> WL2868C inputs, console and storage) cannot be validated on hardware in
> this series and is left to a separate board series.

What's the reason for including it here then? You already gave us the
meaningful part of this as an example in dt-bindings

Konrad
