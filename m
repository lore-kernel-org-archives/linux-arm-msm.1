Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7A4AB1A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822145; cv=none; b=EmsVvSvltIZyUZB/+wnISX4YXmBPCZEU9B80mO8rPKd64TiNgP5sPoi3tKDzJHhCrodZxsMJj/Nqtc9fHnQStRmV84AUznHsdGxEqWkKFrAygGSWt5566MCp9+NhMq+smltJiD79NMets0bldePEn4+1EtVOJiaGuUdFEjgqvAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822145; c=relaxed/simple;
	bh=lvpPyCGDTXesWaEY6g9dLJJ5DWtjGQaG0FaLxSfIFBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8yPKTjESSed+jhwQT27PQMzun4OKlb1HSTtRo4F5DEApGvip36UyUfw0+g7QWkU1Oxl8rBJO4kq8O39jqCRbGkmqgz0QRTeKMJO9SYDunFWBp62EU7Gg63KHfyNG8Dpy8vLRighMyI4vUt9YhfgjyZantEqkQTRAwde46vpskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nkuk9YEy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axE60Enx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nkuk9YEy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axE60Enx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFevfw1895533
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=; b=nkuk9YEy/9Yi7cv6
	mw/3wyTTR+RFFBzhmK3iqDePsLd/II6Ak7uCrUnfSLQoge9768mUl0+gG2VEzuMk
	rHGyqsR2Hojgnb4knZ2QGSdxGyugYLj29KCF+2Tc6iKtTyc4nIwgosT59bDuyh9P
	UYC8JCvRkF8XrVSaS/FMgRl+StjIevll5GeGHTNBxT19UbBZLb/YaWKIFbDn5pk/
	iI/EmldueRUF6ZClIE5c8Hpt7l9tTIdmXqyEEWtOOsCNuvxwvq8H4o4v9scs0s3V
	ugHjdsNXqf86eNIBUs7jMa1wcAzk1bLYnZ+a4phgil8rhdX9utSjty5Lgf2BFu4L
	DHFXnA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kt32e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:22:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cba2460f8fso34007137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791822143; x=1792426943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=;
        b=axE60EnxUpA5BkCLysTc4IvEYIyU0J1YwuZ4hEikPxbz+tgzvluDQ0Gohg57nFItDP
         ECiW+nvrYsWn85pw036yhwvhKwrxp4FSNVqk1HlZYWqR7woX97cS7znO7pOhrbiwuB5u
         Z6vqcfuQex9WgoVwcFRzyB6ArQXz1XPle4/dwEOoacfsiIuFKrmzaeWklBi5xrUvKfw/
         c5lyNHTpm49+io6uzA91m6ntwozASYuHKrcNPTGz4oiYLD+CVDmr7M6kduBX8rR9/mYZ
         HAuXRO+aYmbf0Ec2EIePSVleHSSMFaCGVPjZlFsILZvnOtpkgdYlC3Bf9ai7KJ2k4xgd
         MHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822143; x=1792426943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qvUxIZZyJ0aPoPDhcOpJX9lew0Lb34qpElwWNDtrpkQ=;
        b=SDdGb7kxid3zTlY2R1zFOKyPmpaNAMc3XXTpb8YGQ8Mig4JBkBnf0rXBPvs6afDqwF
         m0YfJ7vmnnYpe5UJVc8JC+dXEGfxxIWJ60qX/4gK3Z9mEGfmi5xzSxIiBChx9x3TTGOm
         fw3SewEp0THoU9/jZoluRnhUNPD1ZTxXDCq2Uic9hcyeizc0hr2BVKVio820kWGjNv69
         lw/jQS8bsA7NNaYwmmntVU7CGkdF8MLvBiDf4kJGErgNcpmhp7xOfrbRVGdbj1xKEDVT
         AhxX/bj0Isw4h6J71Sf+ZCoSFkKRmGR3RsMqDFeu9ktthXljDT6X5XEzu9FJcWogODXE
         Ovrw==
X-Forwarded-Encrypted: i=1; AKwUvBzaIP8y4xvTns5vKsJXitVCy0/VQmj7VuHy622pNu3IxHWxcSyLbEQ+dT/+cPtFwxtOXMMm+5gK363i51C6@vger.kernel.org
X-Gm-Message-State: AFq9FYJfMroNrCf1hf+CBMJhMWUO2ocop6z+XE0WIJ4Q5ErKJiGFO2C/
	4cINIub+nHPGls6LpIEnBKDEaS+YHoAMp6AeVtg6nP4I35W7tLqI+JPZwO2u3T+uREaksWul1G6
	fXVMlaRqGSry2hTLhF2pIaH03Php3WqLBz2HJlk5n2eGbgtQt8WMYdIE5ofBMrP7vndU6
X-Gm-Gg: AYBFou01Dw78Y+mtdWrXn5cpJle315hTKvrIZdibo9n5jiwCDTb3dlNV/lfs94yYdbS
	H5vL0GVMdQnZrCWASyjCtJvjmv0zncL1cIlW5a9JRQOunPmU2FcEkBhCvhXVRehTtDR2vUJNjlk
	PtrpsglrpzjZLDHSZ7Kzr/P2TLugrOUC4zmYfrHX0qqm/FLJ/EuS1uKiYhRNjJ4dIriyX4MpHBK
	RQRhTNvfbcYcWYgW++iwNfXBvPWgh0IBB//tsjBKyuS8J6yJ68BToxbdSO1CsmKzwKe2a2/KIkX
	QUfAOrR3q3uNkKIoVI5i9dUibbqipZTfn/D5E79zcPnyEFiFGHQ6Kb5D0c3o9xuiwlrxJtChaxd
	KfUlmeaeAtD7IqmvMWvhLpg==
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2016017e0c.5.1791822142785;
        Mon, 12 Oct 2026 09:22:22 -0700 (PDT)
X-Received: by 2002:a05:6123:4204:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5e91f5370f5mr2016003e0c.5.1791822142251;
        Mon, 12 Oct 2026 09:22:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae46f0sm484257866b.79.2026.10.12.09.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:22:21 -0700 (PDT)
Message-ID: <0eb6bd2e-110c-4a6e-a073-9b2b6c93d086@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:22:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
To: fabricioakio@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX25FT2PyRUKap
 CfqNDgt+EZhZUIMV6NVWa2azrNlvKq0Rpw0Rz6I6My1AI4BHJzwhK2F5qADuOwP9jPaf3/9N3E6
 I53so6mKeizxAl/urdDdu0l35FsA8IT2NvQbqCBN7XQU2TmD4pKnK0pnK+9iSLWDmYNsH3+/Xyi
 r5PpBFLgI9KUo6SKHDzadsSrt3UA7FimX6mKs4XB2YjOYsTJi7CnAOe6uvq90VuRd2DqHafp68f
 DMr9/zN/zxNKHCS1n372fBxxjWm/TLSqj5/YQEQB6kNeqzZgkLu7bvRdMliuCt35tufFtSi7fzv
 MMX0OfO7dAEiT4fQ05ViC2D8ojmW+bTov2YZH54jaQMl+sxbDAnxqe6ctiFbyscdEAT+tR4Dh2v
 9EFKjhCzGWj+e/Z6upv+Ey031UBi2g9kJXypeqQtTpFGaEPOU8T4yS+397CWscXmp9scxN89O/V
 J+kgZvVsNODRz9Evvlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfXwp+u7UFYlPjd
 O0pECHcFrum2EGgwJ9cuIVrHbl3UBiMtS8jsHJ8yQQJEBVtFr4tijotlKCqFM0rFbnCgNeE5HEl
 cjO349w+cd+It8ip4rRJU4evMnVzBqs=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd093f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vvS0s_9CdDRdiUdw2gEA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: dAWto8R1taU2gT_hM0QfosfVZ3b4tF6_
X-Proofpoint-ORIG-GUID: dAWto8R1taU2gT_hM0QfosfVZ3b4tF6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

On 10/9/26 10:49 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
