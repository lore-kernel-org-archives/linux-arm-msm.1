Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68562DEA86
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704621; cv=none; b=UWH8mJnxW0sI/7CkH87KSDTjcPJ1NfKupzwHiFeoq+iJQkB+zpi2NdY3XCz4kTbengbbS4uK4Dtx2CgID+6vdMf7lIMK4M+ZwqtmTxDS06TwssK+J4kJXGjsw5RrUoeyNvDWEiHs2Yy91jam2qTWF8TbvI9/fb731nwcnV6g7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704621; c=relaxed/simple;
	bh=Y2BFihCQs6uhG6fsFCa0Ao1NslGdiQDR64l4W13X2XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9s+KTyzriIzIdranrHOqGsaJQNSRvbp0+0zE3U052+dqiwiiEGmdAA4/2CDMSzSqlOT9VuE0Kteou+zfoYUG0Gh0gyWXJ0G/969bgjA37w4xMkhgEKC9dwL+rxnPoPWxbVtyqqUKZG+tILusfWfvmdxAT/BSH+/odwjqSdVFIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kesgRP1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEjoaqus; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kesgRP1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEjoaqus"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M548OX3997344
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7D/eEjwuHQYatRiTjob4Ic56a5p3Gqbx9bIfZorAXQ=; b=kesgRP1NYCFozUIH
	0ACsaG5YidkmDpVP82qtGgephFXfMb+/0lfM6RJ/EshlD7LTJEICVMxEDxPKnd8c
	CTZ/PdF8gorR55rJm+/4xHsSB1fO8aiWL6LRJ4OXgII8z/rEdK1u+UHC5n2gjOXy
	1Zv9QDCGuD2MPtOwsDSXddWEDV9ip7V3vRHBLgV/UvjvhjsELaY9hClBCWvWsnAL
	X1Vu+RQCJHcdrZc9kmxoDAJ4VCzGpEq2UW/eP7nlB8EvQPCgDDBKF3P0lwl74vAy
	LRGj7PWX8PstboX4G6d1/6meKRtz2uHbTDq5hDYKf0AE2vwLksPtn/s5mOp1PYOn
	QyHEmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2rdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 07:16:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e048a801dso2467058b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784704618; x=1785309418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7D/eEjwuHQYatRiTjob4Ic56a5p3Gqbx9bIfZorAXQ=;
        b=UEjoaqusa8yGB3carzKD+gog+YfgjbqxTYwXvvE90n7IAy0d2znj1MfIM6CbAWIOR+
         6bkNmGEn+ZdO0y7pZLIefwDaN1zBLcQpfvEJdfgAgQsQ9N24/p+yhDiY3vn6MjVPbJQQ
         7iejM+8+DLPeRAQPUnJUn0c4MAseT4XKfhXx1Z5zrESOVjQtp/fqywB10zWTriS15n1t
         SlPADRmnaRJfNLDp+6Ku6tQ9D4bnCh5V45fU+lUmMm6DdX1bL0cefvt+o7DmSMx0yUiY
         mYCWHVxytGoHA9NIu4W0X27l/C3LYWX36jRraTTZnQIYjnucF6BeRz+/86NNdf8eNE3t
         ouKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704618; x=1785309418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7D/eEjwuHQYatRiTjob4Ic56a5p3Gqbx9bIfZorAXQ=;
        b=ZjFw59SzM3AigvxjPQqjx4Rjc2sti2zbFfd6Vaqi9K+zZkIKL4qaO1rc7u8IM5S6d6
         QPmCl0pXi4mbHPM0VBt4MpL+N2kfQ9b2MkgoTpKDgwgwAaMQxpBbVqN2fIy9dQvPUdsn
         bUe/iASvlU2xyAyKdE6R992kdyLIPqOfVOAMrXNGs2qN3mHqvmIQt6j8uMCh5gLcb5bt
         uEP+tlO6SWb6tYvCrxEhXjLURhcJx6GMBeUzFySQrkptO6ILx7KtNsfkTKpqqEzdFd5h
         a4NG4eNOMqELIKyWQWo7FccgFCwA2fpcMPAjkXTzB9rP8cjDEZsQlQLjBicVTH16Vnww
         LEBg==
X-Gm-Message-State: AOJu0Ywz82mRdwB6gi9YJIq737U+/PlxDkR93q/SHq6ooC71e03IuQML
	LXOZZwlCg547EraKCGEEgFf/YWX2mSFGSsOeIZE0QoZ3sO96FKanF+EgpciXVqtGat5yd7mZMy6
	b9z+3DwNQn7OVy+BELXHE8+CLzQIl1k+4JHEDtuJycQYdZZ9thjqnFQpNSr9k/r9tI7aY
X-Gm-Gg: AR+sD117aW/K9nVzAOBubPYXHBnVsUYmdT2RX95WZglFyZNrGrk5FMcUjW74uFR82wK
	kJjo1g3ZcQFxOrPsiIn9DAnh5WASaHEqDNjgv+rdnsoFQLJ84M/UZlhiYO/jIEAuKuG/PX4+fc0
	1y6kk1wNhshJI1WchJnvXJZ15oUAEanpJGAi+EkRDn7TP/mnwsZpHmmXgipi0f06GsxAafcqTl4
	PwLfBadVAnmZjEBYubGi7jMZQBzrLCIyDeacUSEPgovYFXvV8Xaam/dR0xpGVjPt4d0LgBnrG2l
	zZ60iF1mdEAxJ271AgVtWXWxfjzOFbkzEryPTcGTkaTAut6BI1H1RjhbSEMvVcduln7GxeUK4Ee
	KXlUpRqsaJ/z/ryG9UB/Gyae9XJ0=
X-Received: by 2002:a05:6a00:4b50:b0:84a:6540:3389 with SMTP id d2e1a72fcca58-84c2926caa7mr21483870b3a.10.1784704617641;
        Wed, 22 Jul 2026 00:16:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b50:b0:84a:6540:3389 with SMTP id d2e1a72fcca58-84c2926caa7mr21483839b3a.10.1784704617153;
        Wed, 22 Jul 2026 00:16:57 -0700 (PDT)
Received: from [10.218.37.104] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17264108sm884152b3a.16.2026.07.22.00.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 00:16:56 -0700 (PDT)
Message-ID: <c29962fe-1d26-4a13-906a-dc96d0dbb4a3@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:46:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
 <20260713121816.2728888-2-ravi.hothi@oss.qualcomm.com>
 <bfb17a62-4997-4ef5-a005-788533b86ff9@oss.qualcomm.com>
Content-Language: en-US
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <bfb17a62-4997-4ef5-a005-788533b86ff9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A6PJD3gxwa0cn4cW0Axqo2qC3J1ByPNh
X-Proofpoint-ORIG-GUID: A6PJD3gxwa0cn4cW0Axqo2qC3J1ByPNh
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a606e6a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sAo0H56O00lnzfrFSrUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX0r/k/2lUHnFA
 FBylLHyDZEKetcGtGDDZXYswut+nlgmS0lE4PtUiTxZm+DZHUCs6pL1Jyn+/WL0m+KS+EkrNGzM
 mVcs8eT/BivuIQLB7hFvvTsL5fTnUY3Zs8kdEtG3bA2664sHh64GgfmIhxg9FCAHtkBDYWXRJjs
 Pk2E84Czv3WZWSoemppDYtkV19DPz/yyqIx17pjNEt+ND4YponPCKAsoZ2bZBKS1d3Sco/iUkan
 YO/oG8rwx+Wq+ym0JWl+XwkEKp5QrwtV4zRpPhjCrS90+aMbwG/AxrO6LxPmT9u/jreJ3hlqL0v
 BFbxCRaauQnMFAmcf2UB8J9IYunImCx85pKQxbNdJVLRb13bKVyaA5zgq+cfp60yEA4BmaKPUJA
 V00LmI3hC9walUnPhSBtT2gTTpHg9IMNJ8m5BvwwPqiDxeOnvcEpWW9hWSZrXflgDd+rTXUW6c9
 IlqdSsE23XBPoLhb3LA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2NiBTYWx0ZWRfX2RZ/d6hfuaQ+
 /i/e3GaOKuCamXcBEIH8Zujkf2pYhFMca7v+LwaPxJrcyLOYwqe6H0W6Lstw9tilAtDN2tWdqOz
 s3Q8CkpJS2V7D4359lPvuP117nl7vrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220066



On 7/17/2026 1:55 PM, Konrad Dybcio wrote:
> On 7/13/26 2:18 PM, Ravi Hothi wrote:
>> Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
>> LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
>> defined inside the LPASS LPI pin controller node. The hardware is similar
>> to the SM8750 platform.
>>
>> The WSA macro, VA macro and SoundWire controller are kept disabled so
>> board DTS files can selectively enable and configure them.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +			#address-cells = <2>;
>> +			#size-cells = <0>;
>> +			#sound-dai-cells = <1>;
>> +
>> +			status = "disabled";
>> +		};
>>   		lpass_lpiaon_noc: interconnect@7400000 {
> 
> Missing \n above

ACK, Will update in next version.

Thanks,
Ravi Hothi

> 
> Konrad

