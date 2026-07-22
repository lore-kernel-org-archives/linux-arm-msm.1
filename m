Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D7257844
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682148; cv=none; b=GbA1C9ANoJDFu6MkFbs2hhTEVxV0bU2fgn0BvV+oGqxd4z2TNNlE24yEyyCE9q3Egf0jQYBWgxBklu7yNjc4xHULE3dunn+y9/g7Tp6MAMaXbk+VUiaDair2DUO8DsFWspt0Pejw18RqpbNMHnfvqzVMBoPjWpdZ9lPH/tiLm1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682148; c=relaxed/simple;
	bh=c5H5aWVOu3sN2gO3WB3YRb/qJbB2sTD4c4JP3roiPMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lesLox1OhJZ32WWoGEAu545e3CizjUbl6fGwyxOGb8ck/mE+4t9puAkT3rXL2VHpQP/cMrjrZip/QFzhXpxluezDxO7pvC2z/RoD9j4+/C3eO7nSOz+P1KAP3ZypZWViV0JtoCg4AynQLIhqKLRwF+X9/kP17aBMe1Oz2fP+8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4cQdBcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYps7RBm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4cQdBcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYps7RBm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZNqO4190046
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=; b=A4cQdBcOfzSJ+xxs
	Wf9YkPWkl0vVI0PXxqY2IwQSKv/6Rw3/yPwo+xat7cf5zHYobvNq7EfHyy7BTem3
	BhsTYDmn4UPLoGNNn8yy0+GlJVVQ5soCHQnuSzg7oiRRKUM/YPAHsV0T9XTr7ATn
	Ce+aWg0vGWW7XcE8tJL8hFcdJueR+bn7XkAwr4tAe3QsEzuROnRxYHvjnfU98mYe
	xEMN6AeVQscx8l+0BzTFqp91S9TmpMkFKuFXPm/cOgM59LRoxPBYzC0POR7wua8l
	0K5lOHRmEaC/NhhEeTXJgvtRH6RFNSWnoNRDAofV2nR5VC/jWaiVHfCVj9XaK1Za
	AWGciA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nsupys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:02:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e086f8e0dso1784723b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784682145; x=1785286945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=GYps7RBmrL3NO82GXrfFKsH7BFwoMFM6yv4p5r3pdrhz8VRPjpUN+HmEjp3UiXuwgm
         C7L2LzCiL0u7dncXoDcdRBK2u+T/tfH594cXdsH4FhPBin88V8ltVXkm6UB5IoDtiA2s
         DxM6ZSkBzDg1sTYE+njK/AvVQtJWVq+rrx2dU7QbRPQMU9OGI/zaKWa8m6fcqeF9C4xn
         SYh0DIetH8lgeAgYPUPy5cEzBGuJfW4y0XVpTLupqkCXuesQIQCaV6UF+wdYCVqIbjuj
         KqQMePzZ14YMnyYKNcAGqQfovx2+Fefqz2e/qrfG6knlZoWiffhm9qxgF7XHRdBuXCRz
         wsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682145; x=1785286945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojiTB81xoey0jNfFxlpZMmHDF7PMrb5D/K/H1sD3MDs=;
        b=LstQF+xeHiJc7UhzcbzX3nKztm38QP8O20drrghH4khgZpRrTTXDp6cxi7AEkwhZQM
         HpWpDJH9l0PoXA+yWwSnJs7JP0PwpwdgKBoUkJrEqVRnCmhja+UJap+XJW3I6rc/wWIv
         hs0Qlph6gopwwsHqRIVu7Xx+qNIPEcIdg8Lz55AmfN7ZehBUVv/gGM6PYzzyWG7ssmUY
         Btz/AQUuilh+p58hzv1H2AGFxpPwgpqmPMJIqnH6rd2cFclrFktG2n5QVD+Z0cApNBGG
         mnTejKDScJ8nh1HoX4jLU0nnCNFyna3J5phz1l3GUiSF52YMV9Y2b/6CdpuV4edQozJ8
         MRsg==
X-Forwarded-Encrypted: i=1; AHgh+Rq34tiEwWpMKSTJRd/HsZ00JBOn/UN62HUojjynSlt2ThzyvMsH2mN8aqi/eh2Qx6y7IFFU7LXxMtAX/2qU@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbXAtf6i6c1cqn5iORIVQnO3tgFCi7bImqrvP0aRsyxU6WSET
	2BsKJPO76FdmGGtTYKqm+AFRYDQo1FFEDf17QgNlEpkM2cDt0pA+d2XwWtrwR5Mv28SLUyCNA+4
	MIdQTZbYGfYq0YY508zLpgu85qYKev8hypN7Tdhz/dWimqxAZUqIhYFgHckfPgZkpEQFJ
X-Gm-Gg: AR+sD11lVWL4Q3PG03IXfsJdBbqOIOey8TJs2oxDTWfde7RZqF6jjmKJa5h+GKn3w/5
	aIvt+jo2joE9lBy6dVGGMFtiNwPz/vqo0PM46IlIFx1m8g5XPg0zC4650TzjAjhNYmbv3VZzdiY
	Gwr2oVGrrKYOIDnJKAbRz5DoPlPMfrU0+dHtrQgh0AKSIGnOrlexOZ88nhUmVu9Qmf9Z1gOxVwy
	F+ckLywhWEIrwIlHR8H7z9r8eZamH4DV8SdetDFu49RweTGNSPuF3LTd74PB/N01P7+HnikEWbt
	DxoHGXWjhMm+iROHYrTOqmS51cCGC23QK28SrZedohGiL5zowqfB/8PqhAGQw0J7q3LDpd57y79
	3Yu5Mg8Nr2jEYG68ZsPeV
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558340b3a.67.1784682145445;
        Tue, 21 Jul 2026 18:02:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:4091:b0:84e:538:476c with SMTP id d2e1a72fcca58-84e05384b33mr5558254b3a.67.1784682144785;
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237761sm475347b3a.4.2026.07.21.18.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 18:02:24 -0700 (PDT)
Message-ID: <2a532aa6-925a-4c97-97d5-22f4ec6e51ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:02:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for shikra
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260715-add-coresight-nodes-for-shikra-v2-0-ebd485e39a51@oss.qualcomm.com>
 <20260715-add-coresight-nodes-for-shikra-v2-1-ebd485e39a51@oss.qualcomm.com>
 <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260721-stylish-dexterous-sunfish-1653eb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q1w5WyzbYjUM448WF3kUwvxnJPwsMlQ8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfX6zhNB5M44MRD
 HT4m6l8mHKEqXXSJtFDy3AiMXHqWNWIWIHKHE1UPEa69a6zZTnkqFauEl17oHi3MYlHLt0J3KGu
 j22t4CzAyurtkX5d0v/RCU9ISfPpVRo=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a6016a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dx5vPtEcpawhRY5uvL4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: q1w5WyzbYjUM448WF3kUwvxnJPwsMlQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwNyBTYWx0ZWRfXwVCMPE8EXDhF
 naP6ekc9gTvRm4uTiDfZgc6J6tcL1qSNen4gpvlquXYdVChJQf3Dl58dVSiy9e5FGWalmzAOzTI
 pb7Wnj85FHdgc4pc9pGORpcPawGRTI7dc4jsE1Pr05nJlIsPyDfSNiJjM5ezIAlJ3faLdzvm0tl
 txz9uxQc2iwTkzxf1HuPbr4NW59xS8dYvYcK/O/urk6nyt2GVehFBG1Pcv5Vz8D6lM5T35EmJhP
 VfBy0qz3xMLJ2tPqw09mpMbi9HVEHjzYrXPu/qbamVoK4eyDsryQLyPd9EnK081Eb475J7nP7qv
 DdK2+dmEJ32CiYIA3SEtbAPgmW6aeNcMYn3C2sStwLPvZZcTEt3T+vYN098/8Raldj+Z/E1a22b
 7GAFU5yMM3SJQ0FB8AESIYgc6sMMSv7H9FEQShgnhV9InMgsUjNMKj8c967K4IBzH/suO6hWzLA
 q8XSLyneS57IOg+6RVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220007



On 7/21/2026 4:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 09:16:14AM +0800, Jie Gan wrote:
>> The CTCU device for shikra shares the same configurations as SA8775p.
>> Add a fallback to enable the CTCU for shikra to utilize the compatible
>> of the SA8775p.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> And it should include useful final prefix.

Thanks for pointing out. will add coresight prefix in subject.

Jie

> 
> Best regards,
> Krzysztof
> 

