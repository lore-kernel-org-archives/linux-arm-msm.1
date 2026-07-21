Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3F237CD45
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642093; cv=none; b=VyOAi0GSdB4eFLp0QgiMJNC7LhU6GlgFWv0+ZdU327R/hQrWGj9nzvEv2FnqBHOJ8m2c6jtLniIhtxUbBdYo+LOzOpT/lFiV/LGXV5OISnNuV7StWnuLt8XPWbdI4yTeT/pRP/9lr8IaLmAfJlfSbvrcayQQ4PVcIm5LcPug1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642093; c=relaxed/simple;
	bh=rixanAAN0x6M08UwvVjEr8Pbe4r/B4GZojkQiX1Ltr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jloyr8HMnhxW3TstAanFVz2CDh2OLLSUsdUFoVVpAFnQRuL2WE6nDAsOGYHGR1rYuZ4KL+3v43PWdMgMbdY9eNnnmeem/d7XD41XVc3IzrM9+/RYgcZy28ZmFSLEmYjfpBKcnXbT/XXINFVOx6O3B82bpqgRw/9wQlSwWyycDig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8XYzBdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AUkV0ofc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8XYzBdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUkV0ofc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfv6h1687427
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kOj9PAE7yUb5dk0WyJ8r/y88fGntZlYLcWwGGNrNGFs=; b=U8XYzBdVLBJeSbBN
	TVzVU3lby3ECQo5R7H5fo3z5pH1yU6Zrd3PYl1T+DWyQAJtBh+eBf5vpfsR+tJgO
	olQvA/O3T6C89GCtX6SuuqddAoqeaizReOVi9QXOItNeCOJB+qyMhSk23sPFGcnN
	yw/Yn2nT15Vu0d5QbchAH1e3OB2Z0CgHnLtIs/1/dA1l7hNIuKbl5B5fYRa2hLRo
	J0yiKE0N+Jii4ZW40IprLQivZtpXthoAmx8PhjBntZ1oNAuPgWF/MefvzWWI/6+n
	eCeszSh0dMyazIjJ3lJxyCsWmS1aE3vS/kqbJu7zF4sCXd1RGC2dDWcovcSNj6y+
	+3EiJQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c406nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 13:54:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16445145a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642090; x=1785246890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOj9PAE7yUb5dk0WyJ8r/y88fGntZlYLcWwGGNrNGFs=;
        b=AUkV0ofchpYv7KUKiTa7E1bRlTKaHvKOYQ99OKPnK73hrfSQgoT6qsB9ltqLa/yIiX
         n0yrlEQ+BIFh0qOmirg9DNh3O5agmIs+lZqHvxODrxd0cNXBUFA//k2CVBD4BYFqp3c4
         X28QUmlICo4g2jJJvz+lr3qkks/YRHJT28u83ZJX0XOwFEbHvxg+nXwQzi8X6qt2Kk+n
         KqCrKYBAmPoZ+jTKlGZLs0ixb0TLXSGkktlBEa9tSJVj2DcrK/mJHw8cTR3uSHAYx560
         mPRXgvX45jUuwmn9LrOJGl8kg14f4uMEADmIs/e8kQ2Np69ioXHG5Cu6vFW7ZKK+E78Y
         CoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642090; x=1785246890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOj9PAE7yUb5dk0WyJ8r/y88fGntZlYLcWwGGNrNGFs=;
        b=Xf53w5CX2N6/ZjQhxCQvHjeckyogAQW2EENdCYAHAfZm2AcQM6vRDbQ8Y1ValR7VVT
         EK6Dzh1Zs6w2CxxaD/K26bj8uCpNkJtYHiCPa4mxlbOm77S3na14bOaOo6+1d16/bMJK
         yVpVL2d3Gn1y5Bbtid7p5y0KiA5O4qJ7yNb2l5PELhsL5jh9dfDkA2y7blFeTi+82xW7
         L+YBSfIsTe21IfM1UmWAnVr+BIXpbTE3Tb8oRhE8xwyQ7iZr+cIqoJK64YtoyT/F+6xw
         F8mBMqM999uyChf3l9bP/7fzLvmTFIDDTCkSQAZIbcYtmB7tNR/fnOf1/QCWWPp9UTtW
         6OLg==
X-Forwarded-Encrypted: i=1; AHgh+RqkHWWe8X/L+8VoywqH1NDuE2+4Ii3hQS8uYoDr4O9dJqqBFFtaCAegGdPmVSBSJV03ZaGiGSsKOeCnbz5g@vger.kernel.org
X-Gm-Message-State: AOJu0YzHNX7XH5jWaXk/Wrqf/JchcQP7KZt/I8Xk2QbQW23dhqH0y6jq
	3EUSdTbY22+brhDwc03mNmunHxzYavmhBaLKxWeAi1/+NPU7ZbWHdLbPeSeHrsTzzlOucvCS7zE
	MHL3QrezvSB389kmOy5j65mqRjAVAWVnlvEn93fi760Wdx6fk+XF/rvcpL34s5b2FAI+F
X-Gm-Gg: AfdE7clez+rr1ZqTvdXzoMwDf0gzBXcq0EwRC9wp0yjKJGi7eAI1BrtGfV1IvdUkKXP
	r40Th40ygbj1ZK9pJCZEUyfctAlyhVj5WOwthPhzV2OtbSbR2XVWZz+lDW/KTmUQYe19fFgLQfs
	ZSBYj/bbZJGs+TfmQsz5lPtr7qKSveMsEiWUh7/AFpsgyDjoeU4DGyWuIl8ftb83qzz/Lw3FZgz
	Gx1PwTHHEMM1mMaP6Tx6besLSlL6RJFhnKGSBiAqlxD5XVoEEciS91QZB0M+E9uYx6K+grMVRNR
	DJfLPlXfevklk/B/+J4eOHQx20ATGDk0c3M1BGePz28hs6qQfvBvyzgFCBLYm6QGwRx/VVnNM69
	X5P6wBU9i3jKaJtFNqs3BxIHAhkE/XGWq7w==
X-Received: by 2002:a05:6a20:2446:b0:3c3:8c88:7b2a with SMTP id adf61e73a8af0-3c3ad975d6amr19942806637.58.1784642090201;
        Tue, 21 Jul 2026 06:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:2446:b0:3c3:8c88:7b2a with SMTP id adf61e73a8af0-3c3ad975d6amr19942763637.58.1784642089623;
        Tue, 21 Jul 2026 06:54:49 -0700 (PDT)
Received: from [10.217.217.176] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm52334277eec.14.2026.07.21.06.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 06:54:49 -0700 (PDT)
Message-ID: <fe34a27f-2a54-46ce-a363-fb45a3d6c32f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:24:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: Enable SD card for Glymur CRD
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-5-mchunara@oss.qualcomm.com>
 <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <c7b576b5-57cb-49fd-a09d-8d1ffdc2d0bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5f7a2a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dNe6kKLsccxEPzn8QkMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: CiqnAg_1tBGxUPFCSRaUKrBM7GlchGqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NyBTYWx0ZWRfXwIEqSafQDlwr
 QhaVPDETA8a5iux4ptXfmUDpZJ9XRYYGcG5niClwvPjWyd6mc+JnC5eyt1ylX43xJhpSbgsqELg
 XJzPf/AI2kuLrr+hAPk5qcvioC/b0mt++qOHQVU9EpLqaidopsRmrHdljT2hSQSyNF8nl9OJBLT
 +ntM1yyna3PHZLVaWTKY80tvdvDa37LTgycAcbughi4vNnsUC2pSPJUc8Ti8uCjJxfVsW5FiDPV
 U0UFjcK38l/6BC1ID34BPwgWi9rIBjtRGTd2rZRIn6n24Vd6+K5Oo/vA6jgmbzhGwS0ixMXiLos
 1/INEJ48sr2FQbKjE9x5tRv6s95jczciZ8IyDC9+wF+rXWJtyLpiaQld6tXP/MURHhFtGvIg5Ne
 0XgCr9iFvBmsAqghH2txtHkdsECHHKzMA9V0gBFYx6pL/RCLTu+IQkN7K2u2TrJVUh9FK6oDPPc
 0lK3pbhMV6UXdCzLSkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NyBTYWx0ZWRfX1E7Wna+WjXuV
 3yvVR1Wq5vtrkoWSKT2DuENsi20rFKjLGU2daeFZKIrztDsfSvIIo0y1+pFXg1o5kD9Ag6Nc1U4
 yER9N9NFDoZE3KS21ehhDenufv9aD2U=
X-Proofpoint-GUID: CiqnAg_1tBGxUPFCSRaUKrBM7GlchGqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210147



On 7/15/2026 3:44 PM, Konrad Dybcio wrote:
> On 7/6/26 4:13 PM, Monish Chunara wrote:
>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>
>> Enable SD card for Glymur CRD platform. Configure the vmmc/vqmmc
>> regulators and gpio-based card detection for the platform.
>>
>> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> index c98dfb3941fa..48407e47aaca 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> 
> glymur-crd.dts is the Glymur CRD strictly. glymur-crd.dts*i* is also
> included for Mahua CRD. Does the SD Card slot exist on both?
> 
> Konrad

Yes, Mahua CRD also supports SD cards, so these enablement changes are 
applicable to Mahua platform as well.

I'll move these common changes from glymur-crd.dts to glymur-crd.dtsi
(as is) to better align with the DT structure and allow them to be 
shared by Mahua CRD. I'll retain the Reviewed-by tag while making this 
update, if that's acceptable.

Thanks,
Monish
