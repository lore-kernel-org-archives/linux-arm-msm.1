Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6428455635
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388862; cv=none; b=rNOY5zI+u8ikIMUncgbK0oYu5veldRNMQb4MNDNtKsIsj1C+jQMnoBLxRYBMGaztgHBvKeoImrt6uIIUbJdJ9k8U5AmAnr9t3yk3oxe6nlMoZi7vvSFwI/2wPQQyEm//8yfV3ApGbrcSKpeBCBK7TPxDOwiv/XgTcO06xCocy6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388862; c=relaxed/simple;
	bh=KsCEks0czQ3KTn9/c2CQL91GTdL3uRkDvEd+0HAl1uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlsLm326fmHYm2dLtiIuPF8O7KqtnvHNgGp+ADVrb1tsPIkO6qezz8OvgLXovuV/xwPEUVdO7qjaO9QccQvwzJg7h5mbseuMPKxGG6n9qxbbpfUBe35wo2PDr3KisQXLWD/Vjqv0AUMzmVpahu7gZZByseyXSDTKb3fGa3n0hmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mecwkzyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZccO4Td; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mecwkzyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZccO4Td"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRM6v407210
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=; b=mecwkzyoxz+wYDMk
	ghZM3KSrDi1ge0ZRR+sWxAS0CHTlDPUlqbdkz1nnS08qQlwGkIidKdOhabo7VKuN
	gF3YGjn/hc7wn+BKlr42gZvKAp/PU0T40bjodMnZr8hRzhj+UTfvwFGvmqNHVYok
	kTQCO6EqU+w1OCx6V6fktYWdcY9DIQSMK9sXnBSS1Ar0vymuYDQWRkKqN5fCvven
	t7HdgdYmqEB0Rsd3SnYt+wA9/aKtQuXe9L/BXWzmIVJlYcvt7XZ9NQzeyTuYUVdc
	+3qOPiSZi4549xJVLdlurVO1ZDJz4NcCv+EX934QzIZ+Aj0r+utSjz1vUhOruqtj
	w2yQXw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr5vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so115567e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388859; x=1789993659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=GZccO4TdV0qxZRa5yR5UAQcXVFD8W1SQgIDv8QvTbtwrrR/MqPkatytWnRqMAqKDvU
         vlt3+P4df6vV+EKLoAROaRmIC9zp+k5IEZdJUuZjUtFAYrPejDpphw8Lc3vD/t1mYPpD
         TlI0hCpyOVHBoJFwg8ZvLLwdZkwNy41qUOiQakAg1pqvD5P9zFaviM8/ABKVNxx30itO
         bqdjPk39iGDeRXWW8SF7nMQu9hxDcS+uuSrxsqlutx678ZS2Cc9vCXqZhf39ELaYgjY5
         zYCB3lNapeq6AYLClXQrEddqgy6UgW4XmQ8MTPWRUqCgJc/xPqYbT+YD6pa/jFAoEJbU
         2vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388859; x=1789993659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3goAOXXvK1XlNCabwFzEFSXrwsh7ycvSFuTFsYFLFQ=;
        b=ZUN9hJOVeJC59kcrXjQQ9twe8bGepu2/D6zSn66jbY59IzmcjUG88tr1g9KKwt2/Jh
         g++aYuEKU+atOJfa6+wuKLuxkEAnCrXrPh4rJcJ1Dg7zrPLdZ1qjwFlbNrhf+e6nOfv8
         ujJqqRL4FNPMPzWaUsL4GEsmX8JQaDcnj148c39a8LrsPhcd+HMiTl+wD0SeC30Ze9hq
         owUZlOUvx+URURpKTyG06KroZfEk4cQHxKXvGW9t5zztUxefrzFbkPmtN8EB45UBYRPw
         YoZd+1KnMdrQsn0RhneM51E1VB65T8zWQ07s6XVkXuRte10jMU6Yji1filtmkcO7G312
         n7zg==
X-Gm-Message-State: AFuF++lSCAs5NbwLPbJoKCaOraKiBaohCoYhf62Y1iq7Yd34vjPZmWLy
	C81ZXL8ZCPqHpi4Mz+oRClCxr6aGR9zfxyEoYP3lkhvudfwE2j3Moh1x0sT70Xv6UWi9wmDY8lI
	fnJBVgFHN2JF5Tux7tO1yGukB/KyeLFeNaXKCZ1wC6moNxTvE8L0/cr831z5+NCH36U4s
X-Gm-Gg: AYBFou0O9aeSlV9q4KZq72M5TuqslWWCKxR3eFSWSmw2ZoCFN7YGIfnqS9hrbmoio73
	DeiGJA6Uyh7e9oIaePKJSpiQG8HwClUfhFivTa7NU3uLopmpne2DdVEkVgkosv/aqYwCM/CqJV7
	iKwf4qu4aibPvdyRkQNKHG5HpJObXUv6Go4AaNxZJUl1tpzT1NPyPhDVMxiuY3vYX/MV5Vra7Ra
	9T14czvDgYgqQdiSziHZJP/7zzvUBL+fIknGVUCfLsgrGytT66xPX3KXglPDeiEGUZdZlCcnDLl
	+EYyJ7i5P+1n0rNkXPAwIyONgiopYSNJZ9vyGFYHgWc91Q7xiIYNRyAW9zcOH8a4sxZ1ZJlaH64
	/HDgUNjsjOZaK3DSovmizZQ==
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319135137.2.1789388859150;
        Mon, 14 Sep 2026 05:27:39 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr319131137.2.1789388858588;
        Mon, 14 Sep 2026 05:27:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2432030e87.74.2026.09.14.05.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:37 -0700 (PDT)
Message-ID: <1b4860df-8c5f-4ba2-bcac-6ebca94a664a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yKSB5kTX5AHaL5P_zQKKDNHeO8HQQs8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX88libxjcif29
 KsHEaPBrwQGGkFUj5FmaMhLj+BdhjZDxzdFIcKOsMbatvGRc2xdLOqvwwvm8AuqF7A9ux9oAl7o
 Y6MBjJ3Vq1qv5AvsX/L49X5YjkS8vPyiWHv25vg78DmjRbMpyV+00WBVfl4fZsvQ3TT6EfUu8jF
 sb59G0t5NOVwpg2Rl/TIPpSKD5Yuh0QJJSJgmCGst7A1mzS12Rg0fxZhPpfZN/XqqBja/wSRcX0
 pGoGracphoVLsh1YJjPZTMrUGNTra8PGsXtJYQu6iftjo5XK9Ze29A+48E77Vsp6+yO/DVJlUSH
 8X/ENJG4957D873+40xy894JIEDxw9zcgmgWsxcYBHWFh1D5bNtRjL1URcbhUubbZDTVzuUtvnN
 1McTu2vcQ4ma9BJ69YAE544XewCEf7Hp6c4RUBeZ2miqz+yYZMo050fObGtYFFW6LC3DF+rMIPu
 QWhnvkFqnXyB7wxdjOg==
X-Proofpoint-GUID: yKSB5kTX5AHaL5P_zQKKDNHeO8HQQs8s
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7e83b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX9+Hz7Izxi9G4
 wDr1mOqq/EtOnuXJrJHsljuTnsl5cWSJNSpgFDSwybtOemZhgSDwEaAO/KYgMCVEPgpqNXVK5to
 Txca6d/vzbMfX10KM/nMOts5kY6qmkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

>  			gold_cluster_sleep: cluster-sleep-1 {
>  				compatible = "domain-idle-state";
> +				idle-state-name = "l3-pc";
>  				arm,psci-suspend-param = <0x41000044>;
>  				entry-latency-us = <2752>;
>  				exit-latency-us = <3048>;
>  				min-residency-us = <6118>;
>  			};
>  
> -			system_sleep: domain-sleep {
> +			cluster_sleep_apss_rsc_pc: domain-sleep {

This is really a system-level state and any overloading of the name
'cluster' is only confusing here

Konrad
