Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFEB4FECD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651166; cv=none; b=hd/E17C7otl9grhi23c0d1q5symXLkP5uQNNICw7maO0TPiLawO7GgXOBrG5YDtYwFHuyRK9wNXAOBqsebqdDLCqYzfciasqvflFJeCYkMftx+W4T2Bx5+2KstmECVfuriEuNqLEQbp19y+VSCgXGISTY9skrNwaygawJu1r7Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651166; c=relaxed/simple;
	bh=8j8skYM9nhkMoJZfGOrMaZuQ/ShJNnliNXSQOIg/41E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPQSgE+XBYMGyB1fBiEVbclorJN5IXaWbiLcGWf7sQsCSKrgM22itKtty0S0d0bHssmSkcHV/6cUPaXezO4xRDt+AtRNpB/nOLEWfhtai77WxvT9CTD1Zq0uMn4Q8UtbHYSwold2tLKPPpO3PRUYfT/budhizake1gYyb80S30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S68fAKnp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaI8nkzA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S68fAKnp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PaI8nkzA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZpBe577402
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=; b=S68fAKnpi4m8IcIp
	g7sve4/JUKXst/9RjdVy4l3iLwKN15TCqaHctSzPFVeTcZe58c/ygjZWkp6wCV1v
	bAKFe/au55Ht58EvfAdHdVfyCZgJji9dqkyt318ccx7ZoZ8yZsy899wDRgMSz0XM
	m4gDipUNy/WidmznJWFntcPwSiuMcu094i67eDirP2TWlmSF9tPMpigsRR0VhpfC
	/nOYHf2MK8uGr3k3h2sz1HbO9qbCEtoKDjXpSlBxPk+6fSsfmSiX6eqUnXOfCYCH
	jIHD+Vx9oZUJoad8/nN73iMnocCsvbnSaKhSRS8k4qs1t59kM5RGne8pyhqUVp50
	F0y4jA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw26wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:19:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso1500863a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789651163; x=1790255963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=PaI8nkzAveLv1E4Js9fu03PUqxfR0rk5IG9FHvVAjOKuMuPfT8Jbou441VUosHabAt
         Ex6jdIXJ4uWmFaX0jR5/RZcCj5WO+r2iGR80mkQPqMg10AWcqJpUvLQoI6+49EL2nkzS
         /scD8sj52yHPksVnhAPkwtUl0F079u0L/5HIghuBNkXeJxPyfRAs04Gwn12J1mC9ATFs
         zVL9WYQuY/pP711xGuME7Spr0YR78jND1ABM1kkgKx16OCaiTNFgoIxgg9g5dhab6WUn
         h3xJ7o+r1tpBbWNo4rF9ef1XDJ+W0hA0VsOfb67tfng0ri1IVFUU4IQfob/h1OFCLaCQ
         S7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651163; x=1790255963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ov+KJXLMSy+Y0RLLK5WRW/U/tz71r9xiy+wF4r5roMk=;
        b=iyHEp9cqcnSxo7VOw2kM3jrdgpmezhcvPmGDS3GGy8ByQbIEPmMNySMcwzjD8+Bm2E
         FkYm98B/fgoigg+9Sv4pn5j1KHNppmgCiJv0UYWRygUFJu9NuAYW8JAS80dVR9mAAdZr
         4LbieqTn95xQl3WLVKjRgXSj6uxMb05X/6MX+n+/8GPCIckvh5h10YhxYARl7v4jaG8V
         kqfdRE9mqSckDGB80CGlmP41z265arXaMaO4YwI4VWxrJkCUfpLYp3Hwscx6g/H9RHsJ
         gGWqgKV4P3gUVXC+eblWhb2MznzhFdRPg0cqOYILlgrxGUfrPe/VvHo1bDbIXUmOu0qO
         cvyQ==
X-Gm-Message-State: AFuF++mAV2TjkslujiKuE711uKYHIHvAiVcczAP3ojkW1uzSGNIoX0bE
	FEmGHUSTGxFVgTXTfqWlNoJFlA8OCYMo7MOeDPIxs8VSlB5wY4I7jVxPt5/op1mqognk3sUCgxM
	v51pv4uhFFBzY8xz+pbXWqnqJoAJjvi5/0L+OdrE8DWB8nSchi0yFNvtcD8OTZDrqQqmU
X-Gm-Gg: AYBFou2UeWP33ulHCqEGYAAapLHH8BNo3o2uJ3Gv/4Kuz/ilrIsG4Wwipjh6WWFVKx1
	Qbhh5fOpnpZR2KdmIopyrrz3tor+QSwFXMSWWOE1bb6RI3GJayjFI0A3RVsW47SwdLgyjx5hEBt
	rJVdA6skCJBN/jTiTBUExC1pW3VNPpIzV2i+bqN0Ha52yXaeenMt3FzYi0aAt8GYYm2tBEzaDlB
	4gcrK61pnap5F7+mP+XVT7vNeVPXrXnEZag9dAYV2ygWbQ3VrXG+7JAIM2kNE4M7Wca7zpU8kYp
	3n0fNqb6qtUfWoBt+eSIntGToQG5pyD9yu3goOPjqHj2AECXSGWenwBZXPBdOKdJRgc12PcKCiF
	kZ13FAL9VwO2rdG3GViidqLYLaSsNhPyJlEA=
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr591029a91.30.1789651162943;
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:39e:4c7e:f041 with SMTP id 98e67ed59e1d1-39e4c7efb13mr590981a91.30.1789651162511;
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3c06423esm4238606a91.15.2026.09.17.06.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 06:19:22 -0700 (PDT)
Message-ID: <21bd8cca-78b7-4b36-ab4f-ea19cd6d9fde@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Talos Lyra EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-3-e3a76dc9e21c@oss.qualcomm.com>
 <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <5492ecfe-3c3b-4bc0-ae28-1eab79f6936c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RgQyhImepgwUoIV7xe6n8INi3ZAUxSpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfXz5mn0Eml6QwZ
 RBU3Q6x6mfuw7E+vF8y/hqxuG44o+IWpaAtCO6j6aTIb67OxVWYaz610YCp6GtuPOPSu8iZ2hEa
 QR72Tdbs2MsYFrcrAV09jdPrZu8PvOlB5OCyj6DtTxr50jQOtMrf68SRJJhEDDIeCn9tzjcaKAE
 jXkPhaSLdqRDMz40Hmn0lc6vUr14WHk1PnVncWuHMsYZF/gVp/P7DVyVf6idZwDBgvV216C1iBX
 OocI3P7wCg7wCIcj5bufF9rdA7osCaplOTWbbygP3m2W1G5/6T4ZLD40+BXN+g8Zi2T3C2mQv5d
 IcX+YbYjdOgY2aVInAigf/A9+kvbE1nV4gCPx/yEy+qvaIq3FezhoW8EDeP8Mvz8j/s4BKutb4N
 1DU0SAnCUjmjWlS45K9pVjmFZSLz9AywtFx/ktOY8AYYo21jCOZnHAuVO5BCajqid+cLQ0q/jsW
 YWTs9wJOjdSE8oIpMcw==
X-Proofpoint-GUID: RgQyhImepgwUoIV7xe6n8INi3ZAUxSpe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE4NyBTYWx0ZWRfX1ciB4Q0EuouL
 cENDvM4zm65GHoJUA017+8vLPz4BGgzaljYn4ZrMg+PVOGPj5N4YXFmf8m+clLgK6ipLs5+oJfT
 MzUIpUBAYQB1FCspGmDehJpbyxpEfaw=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aabe8dc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=oruCHivJPGXHP5yeABwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170187


On 9/2/2026 3:50 PM, Konrad Dybcio wrote:
> On 9/1/26 3:44 PM, Avaneesh Kumar Dwivedi wrote:
>> Add the device tree for the Talos Lyra EVK platform which combines
>> the Talos Lyra EVK SoM and Lyra carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
> [...]
>
>> +&i2c5 {
>> +	clock-frequency = <100000>;
>> +	status = "okay";
> nit: Let's keep a \n before 'status' consistently
Acked, will fix in v2.
>
> Konrad
