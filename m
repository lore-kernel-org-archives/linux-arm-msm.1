Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019261;
	b=Zla+EnYc4OAEFDLM/1b8ywOVJCRRt4EfKer2cJIz7wyoC4G8aCDlWPbZkVICRrL9lwCr
	 tkq0lVYE0LX21UWYmfXpkfXAZ9bk6OX2OvxYRgw0M6rR2GDHXYXYKz62fLx/vBj9GjgK9
	 KddxXf/BX5srJdn4pWLNxRYEvl7GzfwOOmYBsJvFuKCoQitAHNNIeRg/e5jC64Ia07bZZ
	 3ybRkyS6cO4F8mLr+yMD37zbiAetdP+fWxKagTxtTUr3KZD9eD8H8+NgyLUtL1+VO+G70
	 27I8pokc2yvfsi+bpr+0ZbG+wGB+aSDQeP39Z9/uPfAxNRLDLr8xmCpiQd54OfAobqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
	b=hEVBUCcwNRvVmrefqZAlId39QFXLJ59Wiehsdl8HV/+nqoE5iCo6uquADLaDi9KcbYMO
	 QVV1NaWvMJtu9GsLmoRrV/8L6yFP5ePkPQ/FjTaLHmxfH/exbojl59LEnOrarFzGRpZzO
	 9k0sKGQfi2SylWAE/Q+NqaezllEISIrSbEBsNJF1r4I30seg/Hg+ix2oo7pw6iS3vbbAQ
	 ctr9uXbLmHj3U2z3A3z6SeVwJNzYOA90GuIOJ2lFFmwI/xRpGBHnLve0NKSw/tBYukZDx
	 CR7Hw8vkXQttl/ccSRx+FV2LOQsDUs4a24yCQX6lg+cO+1LABNdTvFWHtYZUniNnJlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C447606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C447606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OTHsn4Nj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HIvzaBwk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuIn2732730
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=; b=OTHsn4NjfPTM5Vt9
	xehKmezvMndttd7xwGa/LJNoh2qvOi+61l36Zrc/8PA0N6YDc1mLzaSxIzZscCOG
	DxzKla8lawAlZzpOE1D//DgzLpTdfavmybYvVmN7rGzK50lQGCklIdCUq0XKFhkY
	w+EBoHK3SdbR3sQwwOMQ/p/LPJETxVow4ar+lgdF3iIuunmwKcDq73N17BnEUHXF
	ZwlUCoVZzI7AaA7S+S2VfSBNgzTi/LyguESnZTp5NC1T0HpYgipPF5GY1GHYq70x
	PaXM/U2LH7/g/Rt8LQ8yHe/4XVp9EWAAMk7sDlr8XnR1OQhEdNi9lHmu8qzJP7Ug
	FRADVw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8qnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:54:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0ae52207so50018137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793019259; x=1793624059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=HIvzaBwkjxCp9ldTvNgCNrnEgkYlWPxr9KiG6QbBTo8QcYdFln+QG4hCd4KjzsDBUo
         JqSIyenuF9mv1keMt+9gLf1OPSYq76zvur17jo7tZ18ODNhlQxtzotT26LKielwFa9jx
         IewYv6Zf+A2KxU59m/tocbwyZJYKio4UTPdZrVmirHt9MNeNVMRX7bjSwJzF0IxAvQzi
         7RxirAoBrsibLU+Yij5pUyt1mtNkGacD8QJBupTeRCiCU787CyubSGIApgN8Cg9MFGWe
         AnPLOrZVymDEOAmzgsHPqzaWh81omNu89jtUorpXBdPTFnCgaRayUCMwuPHyT1gSZlRy
         mPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019259; x=1793624059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmySdFOUhU4GfW7VaXIDaE33ilLhOAM1Jty56BuWlo4=;
        b=AxUrEsjnkPFAlDfvFyqMpPDbwGZrJL7OQiWC6hFw4q4Wj1QkbvVqXrOmCd2wfgv31x
         PQhslHTwg/kbyVYjkmBU+ZcrYjHquwr6m12zwTEwByw6KP2vAidsP0NKfvehzy8pEQQk
         bspSP2B4lTL8IBlWdeaBPxoivayLZyQdO1FHzWThTwDgAtR3m7ZCh8Rsv72tktML25On
         XmZB2Q40ZBBJaZCGuTcAa5vWfMeQkC6v2cVTlIi+LszCCP5hEWze6991rfyUY+ro1MCE
         7pmzg003JVm1XJDDYYeuTA/oZdLJ3MTupYDpdeAwDMP+Eo9ASE64mH3kt5Ty/egTpxTT
         PMTQ==
X-Gm-Message-State: AFq9FYKVRX4vXX6dZJdysEh2QfLH23TY7Fl/5PT1rUErl5/LU7EudFLf
	e0nCrOG4sJMuNzec7cOpNW+tp1NK0Nn6f8WZNqk0ichd7pibo8RNOurIQ7pJb1VY4BfQnGKEbIT
	1bdVgfF6zJb08K7ffGfQszO7ZOGAHvDzn7Iug/hQZ7bWbdJSkhF+9rp4r9x19WQPvuYOE
X-Gm-Gg: AYBFou3YDAmdiK48+NMoZvibas+anOMM6TmPLsS65mrGOBrDyGxSvPrLOVf6SA+Upq3
	B1nhKb4hVPV9TQEGGgU4JMpBEdoToBHO8qhWRhR82EvbpqjvONwuw746mgrl4QPATZ81NF4Clty
	nkcFUL8QIsb34SgN7Bz7zB/TH8rr/EwTmgL/Mw43+N0aRP4sdeIYGAWmgj4AEieR8OCMQyaMN1M
	/ixhBx0FZDdvnEc2JFiQi0QJLs+/+r3YKWubpqmFkF6UPLmFmhnW3P4uPME4/uWbq7VIPXUlQ4W
	gAAiVCMWGWir/xNKdwhky27XyDGFybr95emFnjJ4SXD75gleFi/TzKLkZJ1I6tN0ApzjWAfxvIE
	pzdZbBWV2ian96vl9Hjf23Q==
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732295e0c.0.1793019259296;
        Mon, 26 Oct 2026 05:54:19 -0700 (PDT)
X-Received: by 2002:ac5:c00f:0:10b0:5ea:e18b:16a8 with SMTP id 71dfb90a1353d-5ec22ec8268mr1732281e0c.0.1793019258872;
        Mon, 26 Oct 2026 05:54:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7abf6asm313722366b.81.2026.10.26.05.54.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:54:17 -0700 (PDT)
Message-ID: <d26e1458-f506-4ce4-8734-ba1da012c91c@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:54:16 +0100
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
Subject: Re: [PATCH v5] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>
References: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX2DkONCD7bFlL
 tJ8IzvSAa1l38/syHfb9nIhqjvdqVjs8H+LlcDZuQNj7pzID/gKYdNu2AlBPVysp9Vr+rdqItRN
 LSxFV3GYExpccXszY65Sbm1TZn9BU2vVrDSAa9qCYhiiE2z2gos8X49jfHgfNRAjkBJTDEl+nA1
 TsTFD5a342i+teRuZhdlVThY/SMePAJr5ln/4WgxhkS70/MMCLKlPAq1V0ErcYyhyflQzwZJryr
 UPJySUz64s8Hfirc0Urcxt5GOGygPdM5byLsTL/IucV97S/XK3rnOd2Fiw08LtVldbl92DIEb14
 0FFZL2X5FvxFJAqxHz6tcKKIkAG67giNe3P2WNABRpkouZjrFVwp/FrM0qbOEw8sEZ7zNJRKpvt
 r7y3Yb5jLGtuRQBC9WslzWTgyeOlx+hwb/NAKN0p5aetKTjBHcQ+QjwmhzFPV5P4xuzJBBTZM1z
 EjXbx7VQd91zYGUAnBA==
X-Proofpoint-GUID: cQHjl8zE8vB5O5zK1--gpRWaky-1IL0G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MSBTYWx0ZWRfX4qA+HxZcHTsL
 jYyGrqkpMEYN5IIkac02my4PILCXLtf9fP4mzaRzp9beAnZavzkON7+j7JOW/wgq30rG4ptIMQA
 oNR9mKkKu2Nog22HtIIFQ0ZJ9mfWwnI=
X-Proofpoint-ORIG-GUID: cQHjl8zE8vB5O5zK1--gpRWaky-1IL0G
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf4d7c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3IpUgaB4rvrcq5R6IkAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260051

On 10/24/26 11:21 AM, Erikas Bitovtas wrote:
> Samsung Galaxy A52/A72 are devices released on atoll (SM7125) platform
> in 2021. Add initial device tree for SM7125 Samsung platform with
> support for:

[...]

> +		vdd_cx_wlan:
> +		vreg_l9a_0p8: ldo9 {

The first label here is unused

[...]

> +		};
> +
> +
> +		vreg_l4c_1p8: ldo4 {

Stray double \n above

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
