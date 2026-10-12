Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159649B1F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819091; cv=none; b=V/BgCB+z7GXyRJpKi0+AMPEzAgaQQos8O8jBGltWuGO62zV5w3inYMnm675V3aifcwRsVkWb9iDl1umHpeqXXynwio835ruMsQassK6azBIUD/Dr9ZLotgQ4Q1giBG1BK8z7CQDRtPLM8ZxPU15vOOs4cFRXO24LYOT9eO/t+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819091; c=relaxed/simple;
	bh=wzwLMct+jxWDcRWFsjfId4DR9r8u7mdmPxs/TknAVIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm30DPUq0uOqfbNOr9lBrJdZx/B+/YKFkm5CmrjNKhIxw9q5wi3eiFEQMVuflH+9JywqJCWV4ZWvLT5H5d8zNE4UKNegIb4EQ6xk2ATCeymRn8BbZefy1KGGDbfVI85TVTqn4w6NmNcYEnu1XP9HhzA0EERGhRrwP53jVTUdHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCi8Tsa0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaz7Bbgl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCi8Tsa0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaz7Bbgl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0C7l1686429
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=; b=cCi8Tsa0igx6Mba9
	NNSG0X66Wkvx/xuk3B+WPguet89ME/MPmmA1Iu4YI1sfeIWKwGWzme3lbtF2murb
	d43etTsHwsFunGUxKRKYzu/Xz6mDRgt+fJOaHyLftzfyvZhUxBAXf1jqVSTOs6Qt
	xK7xBA7z7obboYI54hlwW6pZXCzXJNbTfafbkZHGjo9BxFlXWdpF93rlDD4mz3hR
	jr84kALGmJBAA6dMD5TyjfztZ1Lt2HTDJOYzzu2bSuZdY30sftLnmxa6D/wCHabi
	WneSMI9hYvP+OqdM8bWzjB+VGocgX/NXjnmrOsJ5w1s8kmvUlyD1rXyNIYuOVAb7
	lQ3y5w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1g8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:31:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0dc65ca9bso33230137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819089; x=1792423889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=jaz7BbglyIHpUNyCJ/7rJCoSpOU9kiCk8IdYxRPsL2HbdGfZ5WjU7pSIM72cwXRmW1
         IBfQ+nfXXlazPs7DuJWAvbeqHMK4MpEiDuMZKOOHsGxpSh0gARjHKqXGqeakYW6lkITu
         94MazKRW2a8+06an+ur+BKe9nedlsoQQo+FheWK37SzMowFsGyeUgtUIRRuRF7zoZDGl
         v70bnbiL1Oi06WV2QTQ25uUC2glFdOdx2krPE2kX5gHTQ7cb6S8k5umHdIIQyRElAn6S
         WqIxiJgFkfKjeDN3MSbKcl+LpbMnDIIZq2UyDWIO/L6bm0ROAuS69S6w0N7Oy6xGjqUZ
         Eq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819089; x=1792423889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYYo+57QCxwomqCIyB2lSJhXrYPRM7Y/KGfOAmJd5GA=;
        b=vXNBWUkgiv3ZeVAb1n1Ly45tc8LaMH2150NbOFhQZX2injC5fktaF3Vq4s2yMDczwc
         nzyThmwFcv0j87HKhguOHaaaYU7rzZTMZb7z0HsBmXnSboaQABWwNEuawrcjvgq6048i
         dn9MRWLk4eJrm+NMiX2v3NVtEwjDi6n19grY+W4FpQC+T+cRwBrOF+tminj5uNj6bOlg
         dr0U4dz/4mlt8+s0Jd1agyT2tescNlwo57QngFEU01XL2Xykh692NekD744PRa6zZd63
         xsUguU53Zd0aJwaaCwGKvHIvD8AtJ8vubkwI1Ch+OOd5sjJZrmSe+vUC+V85M01CoOLj
         xaaw==
X-Forwarded-Encrypted: i=1; AKwUvByzdaOmozKp/XENrO1S3R0O5gYOtNj9ifuuzqfY2tYMdiihlLhzr2/+vpV/lU5X2xloOA8QrZoZamRe7b28@vger.kernel.org
X-Gm-Message-State: AFq9FYKEmeb0Rdr6IuR7ErtDx8/HW4CfMEI+JLd2FeJNNQpbmzFT+o6D
	dxbG52mivJ+gNkhFGg92rWjd4gPp2A7ihNKnBQK3zs7uQtdzkQxNCA6dMm132Okifqi7ugSNk3O
	/pMqVt6lzp8gObE3hFhnXvQu0Wt77qq3DBK0/W61HRJMosTt8m+GJd84ZTJOjPOU++mFt
X-Gm-Gg: AYBFou2exrR4aZAANL9Os+CHIRFW5jeTAmVENiWViisjD7HIa7w1BdJqp/pbOykCRdC
	FEiUR1+rZBj6P/JLqkcyuk3Gchcg2B67iN3a+Lu8Omwe7GD8hj2x3xRMWTfMVAI1NJGFyZwP4D0
	IEdvMdM3aq2KaRYwp8dFfE0lL//krKvYFrjJHjyPrdjqRUWhkvUf0jmtfyhwVCbIgY0NdUCwlqY
	9+pV+Bm9NX3kv2ADKoQme0KKVLpqcwEIYjHuHuoa0GF/p9p4Cv6LRR6jXMgaP5hxvp4JVmhgKgV
	wRQZISCf2IPjhb/AAn0FF/y1Jgt0CJ4DmvXKQQHrZNcfZv0C377m9meGMT64TOAs9NAbCkopPZZ
	Gl9Ircam8v9AHxHMnVilz8A==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232308e0c.2.1791819088492;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr2232246e0c.2.1791819088011;
        Mon, 12 Oct 2026 08:31:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34001fbda1sm203669366b.66.2026.10.12.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:31:27 -0700 (PDT)
Message-ID: <2e4f695e-5242-48e7-86f8-1438a0604e0e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/38] arm: dts: qcom: msm8660: Remove space inside array
 property
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <45014dc590b7a704673610a5059a0e6e572a27c8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4yoMRPQvAT7z
 8gjklltNMAtJocKU57vpUOtWN91HvS7CpvoieUbClkPEcu/R+SOScvcRe8U5+SAZFH/SiNg3mCd
 KsTKlYQlWf5pWF71aGl0ZmoX2BnZekU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXz64QJgJCHcbE
 he/Dc00ANGiPKgu7eEHMm455UjUIMdni7u5iAU5ZvSI48g7cYBCs3VU74ixEfh81kAbaD4/Z2ar
 8w3GrKQFsVkxYUJFJ1y39itdmrjAVOa2P4CRpkg3x+bcDeEuMFUFXWMPSVc9UDkAwXtuw6+ISRS
 ldRDEyn5U0aCQeppvWLpJnnXHQobPQcrj7RyJixZOupn7eWbMpXb4Ni1H8+QcHBcdGnEm1PEXzI
 btZARUfNCyVgYbKKoXPdyF6I7SlJl4y07G0zYJyvhY8weGbn/sU/zq2JQLBIm/YE3jc4AbgbXnc
 06WxeSQ+H02G6DSdm7+36i6JqmljQh1zbsysrQwkdyL0UKA7WR8aS8eZQQnV0s7R46ZZr6SRIWF
 U7Lw+gn911fq8g3+RvIQkqq/VbUm0RkCYW9lJ1L9PnAzmp/rYd8F7SiHBriiYo74TngEkBMNTgU
 +BGmPli5IHaMFreB2hw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfd51 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=iLvDT8BEKJY-rmnIixsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: q0b6V5gIxLqmSNlE-q6xozLjipp6pENc
X-Proofpoint-GUID: q0b6V5gIxLqmSNlE-q6xozLjipp6pENc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be spaces at the beginning and end of an property array.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
