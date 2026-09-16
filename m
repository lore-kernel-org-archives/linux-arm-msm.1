Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B572AE8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573027; cv=none; b=dLXVolrPfX8FGb2fJmnHmD3cf1f/bnF8k1LhXqoA+3iGoJUwQ71BimHWrYY4MsjjAQzunyi0wJJKqRnwJv/H7TefHVFWhkp+5VvLT/W7qJwLY1synFQqfGqhRb+Kwa2zPr/ZNsGjOja4XMsY4bWIcETZ/wgSouy2IQywO6due2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573027; c=relaxed/simple;
	bh=ZwkseMV6FbbwphPv0uGrX/aYoUPUYRh5WltUTfvDOZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljvNnKdzOperRfwrsrLVq8S12bfxHswo53ctYSiZcgH0nSQf3W/0EsxkiRnn6qPzlMiOvexiXBlasDuXh9sVroCc4b3Rw9jcTHmNyViZ+Ql/lMowcE0xMSH/yjG0uXsH3TczhMF56sI9X0bAfFgxF/0RnqriLBPecJTKjM2rj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iksRDBTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRxBcsI3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iksRDBTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRxBcsI3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GF9luK3640361
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=; b=iksRDBTLWdel5adO
	38M/fUJ5mmG+ZK7EZVBvbaCloehNAPJWOFG3HJI8ZlAtCnB123XaRMGvvBePspvq
	bJypI2FIjqSRtkNxFUGK2yyLgy8bDTgkmQlE7V6ic9P3GCBE0R4QllPFRVECsxVN
	CX7D7fP7XRjZQWhwAZ5yxIsp24q3uiE+Ed7/V33aezLDbAfWkt1DBfvVsDEcsGoU
	Oc2IJMDOMtGxkfvHpXoW3BkVwqMsSVttgQqeuGPB/rt9PHU7FvX5wyWGMW1a7ygo
	uOyGNFsBXtjK8DgFSQ8pAfycg9pUnU+ji5GN8xjUQOZF4d7PyGKSb6wp4C+DZIhr
	iMYcLw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfkkp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 15:36:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82ad4977dso6331025e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789573018; x=1790177818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=LRxBcsI38asErWduQHfACnACVkZksER123Z4cVPw+ha65dm6X7AWqEWN35mgtxTe6F
         IyW0PraqiOyZs2mX9/dgUXzb2qFy6WSGzRD2K3p5PmHtNIMKX55nH7ef0Wv1c+vwDLK6
         4OH/eelPZtuZJPOjlryj5WV3hQIu1SAdGHVL2yYx32B6I7aj9jlsXfIdJUoAtLjddqzP
         TEAeZW3KHqLtooINqbWS7zDfad0OD8zluJshEg5jN4yEd1td+g21MszjTL7Xr4pNIT8i
         h0yftgKKnY2m5rO/t7mBnPmrZHQ5U9D+7ilcBenQ2IHOipE5t7TPlv/KQIUOi2tlgofv
         U4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573018; x=1790177818;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JdsTIVTs0KYsy94zRrHjZ3fCdvLEW0KfasUbrZWJ/vc=;
        b=VcN0WY+yKivhl+LyPDjEkL/RKTkznv9Y6QS1AQxuYezz/XHQLcJ15H6H9G4AGiK/Ga
         uv7+iZ4dJZwqsmDyZLXZ5nx5R0ZmItkQys+vSGLV56ttlQ9Kd5DcJ+5eOXDacPyAt0ol
         GNkuisW1XIz72/LTSdbGVhYQplObwRnFVeahIp+/7plQ/cVgAO4pxpHn///IBtBussvX
         eEecx6FA8vP6R6TJ0JD8A5c6Sdf7U2KPdmvJiZUvrwtk3cNMVKMihHgHXv28ZdXgQjP9
         fh4vYQJnHfbF4YPlLoe+8YcG/aTvaCCQHnTV+gyEns9OVYwWKr+86Hbdsx3NDIEDtAVK
         b4kg==
X-Gm-Message-State: AFuF++nF6wY2zun6ONi7DKpXLaigvhY9/cPTgEgzBG5mGVkAtept+dUE
	cZOPd7B6Xg/fWdTPkPJ00RFRaz29E7bPo9ZazIcpohA1pAwMz3/FZQxeILUjcIJkti+TOSTwio6
	hvU8/A3W99gnyQKoFT3kgBQnEo90+GEhqs8denGuu7ONEo0DTpx/mSPZn16rBXNoueC8A
X-Gm-Gg: AYBFou1clP4Z/95s+a1tfyUHSPdlQjiRis8l3j3Py7Ya/vdBNZKi8KtPRpPh8eFTG9N
	T6LQmz0qUk9syobdaHsUFK4auq96qYYgXwoc00aYY/Kw6HyIdUnyHZQxBPrRiXQgHtz4ZPjWqx4
	7WJ0QU1PdHsr+26V7GIwQPasADryjOCpXwfQ7iqM/EyfvY1peD4utuC5+WUr4BDcbEHm+/t28eE
	ZblC0e2mlwgrV+L0ux2aZztfo3V0lDg1x6ZQXaU9TFNM2GozeVH5maJkLgQ2zBg0CPsdXwWfEM/
	u9lJ7l/f3UKMXYcQOl7QNDiO8G+KfK3eWwkrKpwiDkMWI9H+AEHIpZZF4SpAMka24wYMY8ofkFI
	Z37w5Srj7WoancN7qGKL8wBo7Kp2E1zYUuXB5SnuEcQu+05qOXTkH6xxCdyFHWlc=
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4693038e0c.4.1789573018198;
        Wed, 16 Sep 2026 08:36:58 -0700 (PDT)
X-Received: by 2002:a05:6122:d24:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5c99ae061c4mr4692900e0c.4.1789573017750;
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Received: from [10.38.244.133] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be95d2esm27183766d6.30.2026.09.16.08.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:36:57 -0700 (PDT)
Message-ID: <5f8746bc-392a-42c3-8ca2-07327e5651ea@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 23:36:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
 <KE4uG1eVJQ53r3OwBVGp0Yl45AtOqMj-yJJmAq67lq7ze23gLlb-2Ci_I0qYx574oG8woS9A13xt2Iu1TkTMZg==@protonmail.internalid>
 <4c43c80c-d8c3-4738-9a5f-0b3e1c19679d@oss.qualcomm.com>
 <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <6ca6cacc-3fcc-4d1d-a6cc-cdc1e9a403ca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaab79a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8EY4eiAYLadLDWKzreoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfX4Y8/tYIs1sHH
 Aa/nmNJU4PXs/bIOf90X7wBCS/SBzV9TeCDZ52ca6nJJKi4yUJixmTyucu4TgrVOMx/9aYXtfTx
 16Y8ukHV1R4/PVshThh4zHd3ycvrvcGo0F/Ivw+fM7SoaPzv3anq2bXRXxeoonePz55QSHAQuR3
 aJfs3q+hbniShCu2iPnx0OErRS943TVLIs6voOLqUDKBrc88Ii3j5wz7c2vHFNeQYLbxtnuwgwd
 X985rgHPtKRyQ+NVPIMAdGSYYS2pyXfr7rde8wwQGit2RN5JzgbDa0EiUAXgMAlkGoKff+Bkiyn
 I1B+uVga/G8g+4axJpK8snEjrvHs8QlktJp3lQZCP0RP0UFDemN1IlaKlNxMDD4imk0eEBVni04
 ADWxa/zTpqskxokLEZDKH+ETvrBnGaJrv5A7Ha/41GtYIM/A4qJEp0K/r8BFEmJiFOqb5ajwxGr
 MVCJqFdoUGRERMXfZEg==
X-Proofpoint-GUID: 0ruh2FgllAF8n-0loH19PaGBAT3VpuXp
X-Proofpoint-ORIG-GUID: 0ruh2FgllAF8n-0loH19PaGBAT3VpuXp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxMiBTYWx0ZWRfX6rwv8FG3uuWR
 BjwDnVjs8EN/rlDZXtVIlOOg4aPapsYb3myzE8psvcvQCFIr1Jz+ogG0vaVHUHsMn50qeydxA5m
 BcPomPKnWRiimL6NwglJCMJg2COrZn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160212



On 9/16/2026 10:59 PM, Bryan O'Donoghue wrote:
> On 08/09/2026 09:46, Wenmeng Liu wrote:
>>> +                 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
>> I think we should remove the SRC clock.
>>
>> Thanks,
> 
> There's no clock that is derived from this clock, so if we remove it, 
> what is responsible to switch this on ?


This SRC clock has child clocks such as CSIPHY0/1/2/4. The CAMSS driver 
never enables this SRC clock directly, and enabling the child clocks 
will automatically enable the parent through the common clock framework, 
so the SRC clock can be dropped.

Thanks,
Wenmeng
