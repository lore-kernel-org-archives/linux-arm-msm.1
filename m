Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D90F509F0D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648386; cv=none; b=dkDNE/FJ9caFV/zEuFTUtUg/zTYdY6XMczAqgTY+PUlrj84nA0FlhGV1y930n6Gd0/h/adWZ2lCUYEEGZ27ozAMjkNBF86MNHxLvzb4A+10HdFqOw1nYAG3kzx/P7yPKkkojME5kabayMp2cAdKb4LHaxlM94+7hgq8JK4eU8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648386; c=relaxed/simple;
	bh=8sUxg+Je5s2DK6+4hwFcHBwLu7qlbmqTBaeaUSsFpts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAKItdLBUbiKEOk3OnVSdIKM8oqOllihV1sE+mjq17NkjHC6/Y1idbZNLfjcM2C6SOackVVglvLAH9g5lTfs4gBu/Cqmr9uf+HBht+m7olgzEWm73ofkDL7oBllkEBMoEoZ/IlH4hj2Kw+p/K7j/HRRhEsaFenNMFhcXv1+Q0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKcwq0Uh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA/ZUFt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKcwq0Uh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA/ZUFt9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HBop9B2013121
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=; b=XKcwq0UhG/Ocw67g
	wmQC875wDBXmYTLIfLKDoUVOhLxaAisoWzvnJaVTH5nRVRJDxct9pq/8FO7SYFqn
	0CGm9rVWX4Fx7tUmIyOMtyYVAphOvF0hNWNdUrhgL+VJ8KyG6ZiEXl1rjjkCbvy3
	Hy91LG1kC3sx7lTB4vW4JJStZY+/upiPkuKsk8SE1e9TuidMdJmO/4eKpoXBGWxe
	w31W4QvjSgxRfr2H0TJEtCssWNi8uo3yFvqwuao154kfygfPVLRBJMY9mINLtKG6
	9jxqPhK6SsWNve+l+QRr+SKdfMKteOPVm87Qv4E8HYgpABE6lCD0isdEYfaqPZCn
	UtMZVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfppg4pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a7bb1dd95so1045791b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648371; x=1790253171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=YA/ZUFt9aXDUD1kGb+oferF1io9H1X9aiUGLUWyiUv7HQ0/2Nrl4YyOoX1r+meQx1Y
         OmTe1Yg0NBmc2HN+485LE7PWYnEggn2jn07Iz+E7nRHosJlpZ+H406uPeYXcPnworc9x
         xu+XPQ55/GOiBz52HXx0qiu7fyF5WEGgOAGjCDlx76MsXdrM/1H9JDmLRq1Y7duWOAtq
         XSyl1uRgCuLobuJGTVbviapXBAlR4XnRRDNzXnn6Xzg5AtD3dz/YwOf/kt0mP0HL3Oww
         HIZ9Rbm/3Oici63Vhot5Au/xj7v2Cncdaumxgk+zT/r0JUiafJwJ0dyDms0YJm3Z5tVu
         zDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648371; x=1790253171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=INh1m+dbSo9Tvj8QWWU9MlWCXieeBF3BWU0R4ESQtTKxo3KRC89ZM3gWEBRnGr0pp3
         7xhzpesu54UEWcvNasaG71GvGftIWzlZj4bcwlmmj43xxYLHVn4D9b0FpwVjDHKpZL2Z
         7Mit5sOCHPF0sQqxH5VFiALIfHV0o5MrRS1gGF835YZNJNhGYu/h6GtBpnOt/oIJsEfE
         S1Ysfi/oWbbDbqPJ0BUkFn5I9AEoqMwbIrlTBpmyaAVilpgaptpTc2ukN8QWKHnTogPr
         QJYFQ8GJdkpZVa7RBJps1Y7IlEDpyLtsceXr9+4W+MZ41fBQrMD9Pypy1Lhjid8gCZ+s
         FGkg==
X-Forwarded-Encrypted: i=1; AKwUvBwBn66RT9p1u2336MvLW1R1UuProWrTbUF+KPWa9li95pD+h/b9aRxmePdPkxMh8d1A8uiiuQHLhF+s4z8D@vger.kernel.org
X-Gm-Message-State: AFuF++lnexaufvD3MsE2X/WCbP23yIzKw/QxUGXItb1Th7AVZEAEoqZ+
	ec8vxcbtgeZ8+DwN9rDXZ0OI3wXNlM5SQX826m2tqPw+TNS/UMl6Ryw9rb2yYk4VDJeW5n366Rk
	EUfJH45tdja9oKpDKStWMSk8LIucNpTRlDkASs0D7T4PHIv24x6JwHLsV7yUNY5TRVndp
X-Gm-Gg: AYBFou0lNEjJRPPc8vPIwLV1lXY3C2/6vZ6nPhFyqXzd0QOWuv3xaYmJ7439BXbRR/D
	jiqX66vxVYpM0MehyEMwc/MBsFs874JYMd2oE9hCqqYh/H92JyD9YpWzcVMvbv4c/1QQGRmEQn2
	3xlGNeo+LJfiz6hOJn2Glx+ko74du633zPaCwx2cNLjVbs9SlFdxEXA7fCA5SVHzkzoxT0oCZRq
	zGx5IAT3UABO32Z5wOULBEqIAfF5UUrOSRQyGmdfYLCma8fi5daF8FI/vLZWlOw3t1XzMUHm7Ri
	pXCM61XePV9uoKIbFZ+kcxPukZPHCixdjGhuDpaSijr5Xj3Kl/Uf3/1wAt4BQ6jCMNHKd8P66e0
	UwZjSB0E+nD764Nnd2jdLFwsRugdWCtufRmaq
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66287b3a.37.1789648371518;
        Thu, 17 Sep 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66259b3a.37.1789648370883;
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872025db965sm2754276b3a.59.2026.09.17.05.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Message-ID: <e893ae0f-d371-4056-867d-ee0cb4cf3ad7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:02:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
 <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fX80I6LcSIGEc8S7sOdq8etcZmF-UAWt
X-Authority-Analysis: v=2.4 cv=YcYodARf c=1 sm=1 tr=0 ts=6aabddf4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ksfHMGAz2zuh8OjjW7sA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: fX80I6LcSIGEc8S7sOdq8etcZmF-UAWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX0ylVqOyo5/qh
 Jp2Smw927OCOoHy+Z45YFjfP5nqfyzwWE3nkczThGGQhPwoGCsX7QA2MeZgqYKwiitpg/d6sR/g
 za2Ui7nziDN1z4yMxi5myHkVWVmiC46Qp5JEzfYxP2COkz1g5rHGfFyUg/tSUKo5c0MsPV7JDGs
 oGTBfXX9xrc9IjasChwnltWgSbhg/17TtGv3WaENYVIZpoZnN7QglNstpqkCz1ShaKCIgg1rtFu
 9PFddnsiw1uyxJF5Uo69OoFwUunb7hH/D0GnWGTbTY2m4ttYW7YsZ9JUEz2S894JsCv/7ghiWsJ
 NytRnpx0V23x0oH4vwtG6BgvHDsNNMAjOQ6pe8FYOq3O7PJ0uRk6auvTyIdBZx5dMnjwyJcGU++
 jQhBTO5iTVbI4Y1Ans/rwk7Zah8ZsFjJitfNVOTN1U9NrjEu5NR/TiRx6GWPNtahGVncjxrdM7B
 Tr/143Oe3xnYBJsHZmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX72fh03qCh5bE
 uBYlS9gsDU+EAGP+kfdgTZVzystwv4k1CxrSAswI5VmOrEmILgJ8Ayzprjjy7SWO8lRsaGQLmTw
 2bXhu0KuNgWqzt+WuLbTNvukxgkNsLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170175


On 9/3/2026 6:25 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
> EVK means Evalkit usually, so SoM rarely is EVK. Are you sure this is
> the correct name?
Agreed. The module itself is the Talos Lyra SoM, while the complete SoM 
and carrier-board combination is the Talos Lyra EVK. I will update the 
naming accordingly in v2.
>
> Best regards,
> Krzysztof
