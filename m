Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987774766A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368331; cv=none; b=iy9jEGz7OIMOX96HVZKDXUCBsbapdygJeynLlI3cg8t5wK/GbwYGpGTSoYl2JzbYEpY6FaARsZ6KpW3Vv2iS6Pu2hdp9PW2uMaEUWhNMSGbvNfhRAjpG6oh/J2lOgBAmyrIAX5k2yt4DDxWw0e4mGnUdSe4BXHqptPsoxOXCBoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368331; c=relaxed/simple;
	bh=0tAFdlpsP/xrqn/sPZkXuGFYqrfRYlRx8gKvjexmNnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMsMlKFK+uyuijAYQR+nKiM/2SfPIxDpBsh9605IQac4GJDb9+Q3ecOyJY0KJ2dwllgfplb3CO5RbFBc805MxM9zNWQ5KotaMQ1zZPHq8PCw/BCNJJuXOy3kQsFPymPWyVhfuPjGoXCV0ponJzUB/7t1H76CfXlg+BrBOLIW2f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz/a26ko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeeKw7O1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bz/a26ko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeeKw7O1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jR34118857
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 10:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=; b=bz/a26kogg7pvygk
	JMGOJzgFcCT2PlTAwrtLobdJz1k0whyTRQn1Nd4/kumzpbaGbGV5Q4SQGRdZ/jLY
	XHgAofQXYAOfBKaqwHE/y+C5yNpGm/3l8yIby+LWcjkAPqK1mIWb9qbtdeZam1kM
	0gWoL83AAjOFtssperng+tMhF8bemEUXwyF4XwsL/k24lR0IEhFgCRcXYsqH1J3Q
	JoDhlSlaSdpPies/ALeZxdvjTo9rZmFna+tz4HyNYcorXa5v8JGAQ0xiWzNtqC7r
	mcAynbm9fyfTFrt2a6DE2fR2fzdZbbQs/VGG4bcI7RkqQE5G3oBCloWgL4RQ8Z5r
	7Y2vSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc590ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:18:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df375fb9b2so41612345ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791368320; x=1791973120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=XeeKw7O1CYay2KxhaumkCpTAz8ZHowqSLu79ZOK1+Q//2LqzL+ZVYWMu2nOL/NHo04
         FFy8HMVSup8lt84V2V9ABhAsc4sO4PowwSAsiOXwcZ0x/DQ8zy0BsQPf1vZUfIeHK42X
         FX1mCwNud/t6JXKq7PfNf7kZweqEpC4pnumWHDm9M/W42+Hg6VzcSiHJOMYji8stOR29
         U9l41gMIHPsQQJ8ui2ygjfIb6Xa1HXUKhnv60HfVv7vUpkMQ/1ktzaXDMwSFjfhWXwRv
         QE/UE2U91YBkM0EIYM6M2xZu8c0Sv+9+0PETJZW0kjs/NcWFn4L0f0LLf4woAySNGk/L
         qaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368320; x=1791973120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdDgnRU3NVC8pLT6LKmoyDAgBsbTkHtw5cLkuU4+x+s=;
        b=NJxUFegM0sLBuudSFRVI2qo+kSl5/4z95JwfJ7hHGyIiFEVNWJGuo0gKkGXTVl+zw1
         v4jwHcMcfbHNjxn3KOlMNWUOnJt9+SqWV/Zv6j/poKj5QIynCHHSpUdf9hPMEv6GXSoW
         t5/ca55Tpjf4PBvkG49cThNaCuhov3z4+SGBkZHyq1cG9Km1JtAcPolLjk5JGWVnr2Dh
         FFFozFrc+yPRVHX2EqpbB1WbU7BaPX1xOu9qOBTyTGf04y5kc2KDgvNvG2lvcsA6pYCZ
         ioyrD17fQgQXTPhTsVCt5rvg097+vM/Dr5vlawuH0/sA1r1T2KwakNYjrieF2rHb4oUx
         aHsg==
X-Forwarded-Encrypted: i=1; AKwUvBzSsnkf3FwUlmYC6by1iPiLMdohtu5ZfVIGILY3k9xMS5WIR0Hehx9BdzpPkRVyMkS0IX1hJ53cEnh3LtHR@vger.kernel.org
X-Gm-Message-State: AFq9FYIKOE0eRzoZBrnKLczBxhgkmg22z/lFMjFlgySI6BMUbW/NtVU6
	UMtnVi+foTdc9PGVddij4c8bIcA+rdo38Hmc5HGez6qFQl2aRldNxG/+iybx/8ZcPZbuq80ab9w
	ubvhB06GyWJCLBSvOT01Y5l87YzQzRlolBbsUnywbkQmGOfgrnB11oBrh7Wg1B9FVRz/v
X-Gm-Gg: AYBFou0L+zNK95o2q6PpUlFz3TC51envlBpH56/E0s+3QgIJIJmbSpgJuG4A/v4SjAZ
	Wb0i36M15bFSa8REngl50Lj/F4KpxWp9v4mcr6RcIKA4Acp+88aYnLwH67YlomL40a6QGNSSIEB
	oi8P0e9W9x8kjdA3+CHl8ElwOUN25MaM5ICIYEVljUvbFUfgjpUN0J+waizbKnEhoh5ARq/xx9R
	+tGIFC37t0Crj4S+iUMstu435QJ9lLwxTCDIoA5CJICO4kNA/Bcqe3/TB037lXfEh7BGofhXRbf
	ecYv8iz3XLBUEJbLF+BevFuTOMZinvaliOa+Gxx6X8hpZLnGH8/rjqX6SscKgoRaIck2kjoZ5dm
	neMVqmefKmjRbUXgg0h3Kmd8Y2cX/
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr937165ad.37.1791368319887;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
X-Received: by 2002:a17:902:d990:b0:2e6:25e3:b363 with SMTP id d9443c01a7336-2e625e3bc79mr936765ad.37.1791368319398;
        Wed, 07 Oct 2026 03:18:39 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604a558c2sm7495745ad.74.2026.10.07.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:18:38 -0700 (PDT)
Message-ID: <a821cc9f-a2ed-4a43-a7d1-1597f50f95f5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:48:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
 <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX40YdNZT04JVM
 Zdl4UJb+PrBXilNPqJtmnHlAc4diOBI5ZaIBqJSwkOJGALOFTdjL5mV6Cj8A41P4JmztPUJ5vof
 7atj8Y0h2aXAABU+Ddge3fYtk0B8A1I=
X-Proofpoint-GUID: lqWcqXvS_A_B5gCuSGjv1-LkZUwE630I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MCBTYWx0ZWRfX/YYuMNjIbUag
 WXR8+yVZl8fk+xOgnBugSOfEURI7b6xHkaJ/BKA+0oHEibhWqfnJ6XqHN5G6ULsto4NPJ41MFeT
 tlD5Edoym2giCdtjkBgVpya58BlH2Bnwpv81KyypN8NQRgJx10n3lUzGSUIaTehICrPtIWHeCyz
 g4rZTeI2C8PRAiuIBqPBxqnpNyqZmc0Kj9u2l6qPxMSKMBkUE8Ow9Q4tz4OV+Z79hUYtmNIWcsX
 oc9j1MZ+LXl5Yp8FAV7LUdeqJ34eYeAm2PMaOAfePjHs7qiLP7rvC2EsirGxgh4J0bMqD222kZh
 MIdfEJOExQTcT/IQr/FlM1Uq/T4UK2IFwXbi1svfUuR06b9tCsWnw4V1BB4e1pRCoyPBloy7A+q
 gM16HlydrqLZnJsp19WnBL4eueHUuMv86rxEvTBv8TRo8wTvIGHht//t3ccCBrDehq5Ob6jwYfc
 ojjp4kguzIONv67JXtg==
X-Proofpoint-ORIG-GUID: lqWcqXvS_A_B5gCuSGjv1-LkZUwE630I
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac61c80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SYeg_LyZQ0ZiSJgYx_IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070040

On 07-10-2026 13:57, Mukesh Ojha wrote:
> On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
>> The reg value of a compute-cb node must match the SID (the lower
>> nibble of its IOMMU stream ID) it is associated with. In the cdsp
>> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
>> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
>> 14, which don't match their SIDs and leads to SMMU translation errors.
>> Fix the reg values, and rename the nodes accordingly.
>>
>> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
>> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
>> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> If it is possible to cover all the SoCs like Hawi wherever this issue is
> there ?
ack, I'll send out a separate series fixing for all the other platforms.>

