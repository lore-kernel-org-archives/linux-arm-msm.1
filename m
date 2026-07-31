Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F383988F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501866; cv=none; b=XtaZk7lqQhmQt4qtXqL5jkfdeby1MmsI5da9xBqNqnfmKvfOBpFRqwo5BcEY4kT0gERDRoFRnBX7KB2bDcYlwP4QpOLtOCb5ofVTCirfB7hotPc7hJhxD/1++/QKeEXjP0LQf6UMOGOaVNc4G0jDGoXhP4IDI2mweWosunw4zZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501866; c=relaxed/simple;
	bh=buwbiU/QnDmVP3ZSgK9+kJtoUmj1QC201dBWdkmBAfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sLiGlAW9JHVs3xFXvo79u+bXonpiiuN5nfg+2wLG3pF1MszIuQr0kDh5w2SNUvo6aXdOASIZJzy52XF5Lslfv+9xuGbeNQn3qfFWUItg2X1V4TYO3YczgVrEu/qb/zmecF0/431TCwjvFR9bVLIIql1o5RrL1JTJ8iXn/AMRMnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXuxWgBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c8p1yZDB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXuxWgBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c8p1yZDB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeVsM188815
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=; b=BXuxWgBKwhRdidSz
	TlCcIF8k4sVcBeWUovBIRFLcPhU0CtE/eLc/gQInUKdpFfNzArIB4mxuVsy3U5pm
	aa9YAOmpWFkPF7/ed9+udgO8KrizqM1Vi7hRO2B1hcIKu8WB6NvHndGOWvsNoEIH
	ule/qr8mr4oF0sdKo4wnMe6p+AMib8a+tbIkR12WIadDTq4zBatfHe2J0YVkVCJq
	BUGa3eYjrkNb9QhLhFFl8UeGnUSHu9PrnY4d8nFSZHVogW70reAthMjXKkXFVEUW
	m7V9gpUxilWnFPbKwzQyzlLnmvD8JT76tH3VHg2iZXvttU36NeDSmnH/3L2K7K2A
	U/F9gw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u06xd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:44:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf6acd760cso10818985ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785501863; x=1786106663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=;
        b=c8p1yZDBQd4pJJdUZyruHUIDj7QM3t7g6G3ArfHEr7Dv0oTmKc1U2X/MXoP+NzH3Rn
         Hx0XxRSRQHlC8s+jUk+Va/B0uLguJR7HcCtMSd5JIYp4w8dEVOZgbI/tSVBB0fw3iDXB
         QwOTsu1UdS02TCGEyteHD1LUUI0lYS8AGVEvsrVV8FSxV6f2UDWRvPCbweMOfeSmsB5F
         fPPAjN8yO66BiTCvKtHIAeoiGoaWgeulruwJNIB+pDNjMQvd3EW3cFFk8AsgjvOiSWd+
         xG8pMU1eZ6gEyQNypHaGOZOVFzjAub7o184Ja/Loe6OMp6qG5dbhYCjSgB74o1LMUjVe
         DWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501863; x=1786106663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adV90e68ZwaEoo0CTXVs/OkTtap6iN8ZseHU3dWUaqU=;
        b=L+ipjvGXnrHlxAnv8G3EVpBU3ZVLeS+48MXnoaScqe6RKwYXJh5+tyWh+LKTitQV4d
         EsNlHqd4gF1w3ETPBm615bK4OsJ7bYoVLTtOzVNcrgtGFpwnky5/7usOYWc1WgmvkcHU
         u1G9AsbwgXZrXMaYhsUDpIyENla9r3VmVZUvhwrgDBH0bgw3NNZQ5V+yjwszFJ1QeYO0
         Yb/jhj9jCKZdwg3oQSY200VEoRLJCluvFwJlLysbkNOIA++KUwddP9kD9fRH+FsgvHgr
         K+A7/plZAvGrZcbjFJRAvbMdiwi7yEDM8tPFMgrMoSwm7uzckmPXWA4q7UKjdEX4BVEg
         9KaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6BrCPycMA8NjFeWO5/Hskunln9fX5kbNdCjaBMSYEG0BbeRWAR5MBMxAX4SbVbrMu1Zm2LpV7jwmT4qBe@vger.kernel.org
X-Gm-Message-State: AOJu0YxLgnG3QbVu5fYJ7AePUsaz3rkRlMYD4oGEJDomv4588qv/HFvJ
	UF9oZgpvj4F+29o5E/4y65KK5LgMUlanJlm0vRvq1r+w1WZGgcJE6UuQN/Z1ITyNwzQV5HRgaIr
	G/cAxyJ/l1ocDQTUK5uUuXxARveEjTkRoQfr9RKH8uLLmUmaUWmxGB8G2X+Hz858d8ZmXiKiI19
	3e
X-Gm-Gg: AR+sD10F9wWVxIklLuyg6ZHQEZ/cRwTmDJ4Wxq8YObVRym4yQCg4ufn1XjYbK00Xpi8
	rE7Pky21dzopF8KPvb3kl/UqVayfTw2I0XPAlyVHZmvKS0KDekT94fDBdplAvksRvlWtdR8ozXd
	Lw8BUiGtd8+hSZOtlS3nj7rfdXppLdT3NJtoB+qqUOe4goFjb5INrl2+AvUjj+uK/h3J4eCE5wn
	MkJVGYpjVVnGAh0/rsrBDH1l9pCLND6g1l0XAklHkK5A1yeIpqeHQn/hWLw9ZkbHgeNcgWZ+KdH
	DIDlqVCdkIGfPe7jYCJZg7WsiH1wHgHQMYVlUzeJlADfaj29ZXJKBguvosDTpZroUdGP4r/gg/+
	UbhPyOCOoK5PjlQ6WJIjcB75bNqcD2uOp
X-Received: by 2002:a17:90b:538e:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-38fb1127fecmr1723565a91.5.1785501863246;
        Fri, 31 Jul 2026 05:44:23 -0700 (PDT)
X-Received: by 2002:a17:90b:538e:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-38fb1127fecmr1723540a91.5.1785501862822;
        Fri, 31 Jul 2026 05:44:22 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm8878628eec.3.2026.07.31.05.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:44:22 -0700 (PDT)
Message-ID: <4e948116-98fb-4814-9262-94161925a349@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:14:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
 <20260721-shikra_vpu-v4-1-6dc5a8999b73@oss.qualcomm.com>
 <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <tsxthwcohhrmwvgzg54drdrfu6tzjeszvpsvkpstocxqr2smkf@j3w5qeo4t5y5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6c98a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wH_4JSXJLmvH2XmrYx8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX2FdkXrL39eOa
 SPxAUV0mU4oUl03lZ0m72B3OR0d3swUiGU8dbHAcLLXHaV2+bxs68o67QAABLIu2meNNILVW25b
 D36MDzT0dxYNmjKrLrVXKAIXZqLAUMc72lflqVEbv95DXH9313US2lRnrZXEqN+XoHAj1ZFz3Dl
 K3PbT16kSrmQ9xPcHp8BbkHvzYl62QGz9/i5DYPy2XL2XlUVGzeFPtcwEfTVd9hx62qz379ArhH
 EJrLxADMHNAen50IGAc1svqd9jMZwNdD22z3Hvgt2gSMDZA8rt/IHD1Z8/TZQtpeE3jtMOZxt9W
 PSFM6vIWvTlUrNM/S6ez/uSPk1R1voFMwL7p/CgAF4spJiZprHDk95wpkTqKvIno2ygmg9VV625
 LAptNDIIeg8HMWU2tfZ4uOhC+nHGy77QNClL/wWEo1aADFvQepESTuewmHwHB/Q8/tOXdo7OUtR
 FwZxJDnZSk7tFqBR89g==
X-Proofpoint-GUID: PSkEgRQUqp7ZA8_tw6XSMk6xjrgCnvEJ
X-Proofpoint-ORIG-GUID: PSkEgRQUqp7ZA8_tw6XSMk6xjrgCnvEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5NSBTYWx0ZWRfX1gMA4tZvosbt
 kYqrEnIbypOneFexP+VShK+hog3nuVxYKrqF2ie9WyhitqDGOgFxFDHhtJmHeB+F4FAgkH85TLd
 OkdkvafUE0jzpSFYZOjLLHvSo4kYKRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310095


On 7/31/2026 5:27 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 11:02:25PM +0530, Vikash Garodia wrote:
>> Document the iris video accelerator used on shikra platforms by adding
>> the qcom,shikra-iris compatible.
>>
>> Although QCM2290 and shikra share the same video hardware and overall
>> integration, their SMMU programming differs. QCM2290 exposes separate
>> stream IDs for the video hardware and the Xtensa path, requiring two
>> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
>> equivalent stream IDs into a single mapping. Due to QCM2290’s SID layout
>> and Xtensa isolation requirements, such SMR masking is not applicable on
>> QCM2290 platforms.
> 
> This means that there are still two different streams, one for pixel and
> one for non-pixel data. Stop using the mask and describe them
> separately. One will go to the pixel node, another will go to the
> non-pixel node. As you wrote, the hardware is the same as QCM2290, which
> has two separate streams.

AFAIU, SMR mask is an optimization to reduce the stream id configuration 
to SMMU hardware registers, separating out is _not_ recommended which 
again brings in additional register for programming the additional stream.

Regards,
Vikash>
>> Since shikra uses the same video hardware as QCM2290 and shares the same
>> programming model and capabilities, it is added as a fallback compatible
>> to qcom,qcm2290-venus, with conditional handling to allow either one or
>> two IOMMU entries.
>> Common schema is updated to accommodate the iova restriction of 600MB.
>> VPU restricts usage of 600MB for specific streams, which could otherwise
>> lead to device crash.
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 

