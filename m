Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEC44A40E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388736; cv=none; b=e+sDmOnCn2gTqB1AcByxbcjUcqX+GvrV1YchnwmydxC/yWdWN+NMIazi5gbGDOfl5EQQuM+SH5Nx2WehuXqJtqDfeaWFwykXp6hSjTTcEqK1gFUeaDSNR8Zp5vs4aJnL3o1laBwSTw36O94OdTIb+vMLE4rNCimFGzh9pisNDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388736; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FGQfkIWet4mKncc/cyoauZLBqEOH6s4aSgOU65r5QTdlPBbkia+oItj2fOkuYEdKC65tqpFVs5tstez4W7bbvZ7Zq2oJ8z1edd4qhF/xhTFX3tNT86lbRwumTXEaEuN0JUCDaqefotleISh/l+Xx8p4Ritb8t/Q5EKSqGte1S2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oolOfKaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vl3gqKcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oolOfKaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vl3gqKcE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMQl4032528
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=oolOfKaKlcUAYeCm
	L+Ihy/VUWmCMVT3utmGA36lPUi0IFOMhEyzwKHkgE5kGHYy5Q6yKxGtfUPd1HJVY
	1aaSJObzucVeeXchPqXK79dSab3OAcKXy15nxR92aiYSIKEAlay07hH3c6jcNYYb
	V67C3cpiX43ntkI5KkNG+qeE1nuhGkLPmLSU9cw++yDKNrWZlimWvYHHRpA5/bRW
	QDbbrwP9GaiSP6zqVucPSZEb71zgs30RLokLAIjtx0JAbmjFxOqWbMZLFnrAIEJX
	P6ByqK/irNe3Dqwn7PUerZqmaw8m6seiU9/YvnNX9VnnMoK1nTHiw/9KuZTnv4fi
	z5MecQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8h1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so55198e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388732; x=1789993532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Vl3gqKcEL4lXVXPJZlzdhtEQuNjSnJ4hg8Sbt/jdGgZB/j0w/EhAZbMiVMZoTbe7SM
         pF+Sf+gmXw6v399kfy6yWr7D2OTeqCfJOxb8Bvfi6otanp8WZ5+zlnXXb1ZaHN1q/Nvj
         aZdAqmrn7hYMnugsI5rNyw380wOZ0M6NJbCZVSW7ZPK1EdWhnDf58z/BzZHBLgRfQD8j
         8OArCYy7G5l/njEd6U6O4sD2VL1GRkPzZfa0I/PSufyQrywaHEMgPxEu2ma8FvqWGMUt
         cVAGh1X94/+2PoxKss+WmaLvF3AhYlCQolBxVddsKZnVdDE5FhJzYAIF8yqsTBsyfekh
         rG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388732; x=1789993532;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=BNpBs35zTRiU26laSP8vZpTp3VXZ9JrfrfN+PRa/0NdTC7cggNYRpJrRYN+NGM/53p
         KSHxhOhwtJqhueZqbRqyJpZhD412CQEvU3uEQywZSel5V0hnrtUcp7dMS07HK4qKOxMc
         HZrejsL7z85JfFzrC1HXqiBtfLSoml4sUoMYfpN5WtTq492mjG90cRPyI3muD9XdysSc
         qUgsgrLt0w73GN5lrAJKNM+k4oJxEvFMRRyh7FQJSKvE+p1V3rKNHPvFg/Dz0UHkS2tV
         PfZgV7O9WhftJFmCtJsYML1p3agUsq9x71I0yYfkXMONVwQm1F3eeASC6dJlOgHWhd4o
         uD0A==
X-Gm-Message-State: AFuF++n6x1xUYbz5CKDoy+BsCGIodEF1HsbnE5bvkEaM6LgNy64EPjDe
	GGXvI8Dhk3rysfnwHYvnvgyZb7mlKBeTl7l2pXjLrSGh+SVCh7LOKUiblKQK6mYcjDwAONE2WO1
	gWbOOb4nwhikfRf5VvmgCYM2p6JmPg8aDjgbF8ykwzO2Tjj5tOFZ2o4uEzBdwkJYpsCH3
X-Gm-Gg: AYBFou0TCRmruN9yq8bS2HShdMdad0ijIXIGGjNAjNvQ0yjwXHIUYQFVJPQrvcldrbv
	nlSIeVxzB8HT4sajEaNaalT/dL7tXH6nPuUHVaaKMlkOqBiXlrzbe2r5HYjYCzXMkVt+khTJafQ
	ObqG/kZhMolmJfgoeEEJo0C3+qKS3e87e1tuReSKZYnFIczWK6HWck9L+9L1YfZCbHMzE0aD678
	blgDixd/zHVECUVsd2Y59tzDYib24dQHhAy+59JNHXyEZHSst8bNy3hGi84UkuSsmvKo/75PyfC
	jAfIV/7HYeiYx5r6WztTp/wvzJSnXp5O6711S5+q8hNnc6k5zsLOOusYpYtoBL1rTpEgY0Ln1Eo
	ZIiIgE+XON+p5ab8l3+euog==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr373550137.2.1789388732016;
        Mon, 14 Sep 2026 05:25:32 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr373537137.2.1789388731529;
        Mon, 14 Sep 2026 05:25:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3326aecsm26638191fa.19.2026.09.14.05.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:30 -0700 (PDT)
Message-ID: <38b674c7-999e-4210-9834-66917e049134@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/31] arm64: dts: qcom: sm8350: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-15-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxp6apvqsX8b/
 MSDLrkv0AVhvise1k6nPLYUiDWKrVdZ20X2y2IfThyhv5XNUyRf/nriG7OrAUzO3FGaX0GJtsQ4
 XHsD6cP7d8sQMb44CEnkFf8pThUF11fZdC2JnO3Zm7evUEO1pg6/T5L78AM7RSl37GcDylx/tA5
 H7kNYg6bCp51h7jnUwYk0rsrippkhW9NHYgrPEv5kDCYoW05YSdHOw3HR/dr4haz3OnJtHBHqed
 21L1M6UAqDXZC+ehIPvwLULKp2hGScOmA9UjWNCsKjlgyAewNchaRtEN5urOWkbIYRD8ICEKRSN
 xYtfAGMcfyt5aZIauxaDb9Evm0HIiI2o3NRTQPeF7Jcdu8sJNp1KEqSgOVfFnXTLHU8/i35cFmU
 iKMVFHgKpFzhqjVA8pWuMdGwJoCo3fER9pKoptkVIdXdvLWsB4X2dLpSLIGFad3lR/A9/s+MPBq
 o3U28APpCzwN+HasZsQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e7bd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: LlFlYKeJe4AutKx_Z91vaTDay2oqrUq_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX14FwCRLWjVwo
 1ek6Gl3UnyyrfloSGAb0f+BUolcCtUcxsdJXvLuCgGSaoV1wRGuM0OxAS1TtxRz+ACWcolYD6Ki
 PCImFl3OiFjCE21/PXbu1FouKRUVJj4=
X-Proofpoint-GUID: LlFlYKeJe4AutKx_Z91vaTDay2oqrUq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
