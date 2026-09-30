Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AAF4BE423
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766697; cv=none; b=U/97ETij4tvZw9FHU266ObEB04VN/GH7PZDpcVmEjcQEJs+pJpeDVeKbWC4oa2DPXJEreQjPdDQGHnZKHOoZKD5qQ+b5npvey0G8tIefZ3yx8DYXIZ/73ElILYmD15qqQu0PiC4/6BOiDZde4vEDk6NFwFHiNHMrDEawr99BE6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766697; c=relaxed/simple;
	bh=XfAUpWIB5pFLDFRK6D7anzO+YIDlxesyQMaNA6+Mucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Di57OVeVukj/+K0Oh6ENqKs4J8gWwo21giVZTohw8r/tNRaZx/roympsQLWW225yp8b01lQRffz2pydXHTBRfe8SA23D3F3V59DQRoiOg1u62Am8wDCmcz5LMh/QQanBwt443fHOEeCO18aYWRRN+v1mh6oPho6aKhMb+AQOr4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLkwqktB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCQ0+kng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLkwqktB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCQ0+kng"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7cPq3547325
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=; b=lLkwqktBl6bGiQbo
	h5dL9QQtCebhNsajnpPsHsODUeW5cfr6ntMO5C23PySDliaygC6WqJfMqXrVXsoS
	/oIB8Wi/p65eyENGVoyjmHlVBz3wvxBMDpVPA83NgsxM9WjFoBVjCw05Vs+gQdKz
	aE7mj9UfBkuT2KiHmHNeKaLNuRw63725lbIdCGuozD4AtZ8278uLyINuyl7q1LCw
	GkspzAtkHzSAQ5w4H+1U9fNXgKX4I//BuaVyrD6WfliFaN8+SrEy1hm8uKEQIdWj
	jMDITwFlQWyFr5Gpwo8fGsAEcg36mx7Ff4lUXGuFHybLJBKAPgiQpKmUJo4p5SAL
	rIqd9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1418fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:11:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53320ebbaeaso8153431cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766693; x=1791371493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=;
        b=bCQ0+kngQExOA/9fP1th8eGyjyl8wROiXg5pYefbCUyT6R+j8an1c1Ka5XY+iKR4LV
         LuZwF3MGT0UpEI3Yq1bOihbO0OVid1WyOQiYs1iTBPvcBIuSMKehyIT4a1sHBiowEDvy
         ExdSjOyR13kscfqTtV8IVR3RhoUYgdwF7HA9kUJ8m65AdIPBjxBqgjWPB3ht8OiZyx6s
         ERORJ3/yof15t+67M4gZuNgp+HSp9nZrnXP/GAggdtdBGmSUFxTBhLMit068kbeerKwt
         wmjHMiaeR/ilGff4A7slseORtsG2szfNQL9hni0EIkMqsDQZ3Y5dutYyhyY6ouqUy+HN
         ls3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766693; x=1791371493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvmbI9rgvTTA/cwhiqUJrtUvaPKNUBBZFDt5+C+0sSU=;
        b=LLv3EKU0SOH7x+WOufDq8lnnDDRirhQLYfki1P9dKwnlha19ifP8ZwddwAPkKVX18F
         FIFxBEBNv+3YZ3HWnD20o1B1bu4N2py0ZNmYkHRmP7Vaq5Eg8TpSgwzJfpP9GKX7pQgH
         jYZkK3wSXX2s5FKdUmQjqzlXOOi7bF/RoW1wll6gFVN1kXfqpnda/H3wyCXiOoa1ezz6
         Q74ieU9jx8eV4FDa6pP0653/mpfEUfaRbW/Epw22aROqbDhttA+YvEnxho3gimGUOrYf
         c8BJQnUSk96HtqLCP2kxoZmj2UKInFI7HZ56uo7pnoLlHXWugC0zi9UTWtyhd3hvOFAT
         4SxA==
X-Gm-Message-State: AFuF++lf8afhjVTr7v5QJfobJRCGG0Wj60xiEkJneJO24fwyj+zK6bb0
	louFnbK1II3O4NT/EyHIEjG7f/ZWYB/MVBdt26od6SxDbURM6phzZ057cxHJCA7GqSAHMg7vnWx
	l7XwT6/d1dUVUET4DDOXJcDqbo2FVKtOsMIGcbTXYvCDfUBk9SFRAEusoEmzI23glw1vk
X-Gm-Gg: AYBFou31VdjkWbM9ObeQRnIBjDg2LmJbBvoeDsJjh5hSvMtlwFvOWeNL3hGX+tTeBIF
	f28AV176sr/jVoSnGtxh166v78N4mXnIKgxPvKd6MHnw+KhNv863/wHFwjaZiDmBaZD21wzeCY9
	fU+e3iSpk3eh2RXy6O/aUbTiw6weg08s7MbkCWZTgzf7J1jf3Mz8B+cymE59QUYU30nqON4XXyk
	ymYzydV7Dzxwm0IsUc2puBvEFTgmlDovQDqpEwutGOAghAWtgNnR6V41IlUyws9zJDMiTbEr/1n
	qwUopMt83jS+YhWoz1wvvPemIn/Ylziws1Q6JgOmfd+rXRNEUkC+rqWU8Rv6fUrb0xF85qD2+x0
	VREUfwmITa+9KQkDiF/aBZw==
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr150770285a.6.1790766692871;
        Wed, 30 Sep 2026 04:11:32 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ca97d148cmr150763985a.6.1790766692337;
        Wed, 30 Sep 2026 04:11:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f803b3sm49118666b.46.2026.09.30.04.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:11:31 -0700 (PDT)
Message-ID: <c61cfe2e-56f9-4b82-a9d2-a2f5dd7bb45d@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:11:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/15] arm64: dts: qcom: maili-mtp: Enable S5KJN5
 camera for Maili MTP
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-14-cbbb42e534ef@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-14-cbbb42e534ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXxV5OQdW6vJgE
 BYwExfzrEILmBa8quoQ8uB67wDaVGoi6YOmuZL6ZVzS7A+t1Y4DDCOhkHaMV8YuhDPKY8jIa3+v
 9jP2tQRAAyIUZuiyCMWsugmwuqBBjf8=
X-Proofpoint-GUID: Zn4gOk-M30FbgWXMos6L9kor6ckmE-86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX9v4Nxw0cofFf
 8SWYKU+Sm8k1oK8HxV6abbCQXH3PMaXu+ZWZtn1hLM2JhV3Ts448d90ZTjJPIpDYi2AbWgxK6qM
 l1O9olkpxySBGQGNL1jXAEvm8nozRnCKxTjG0xejrqiWhwq+27B2ndP7ujo57Dq6NB6T+mjAYX3
 chhSCyScnARkCixx6GDbKpANAeBMMaWq7VmVj6N3CgYYke1de2PJ7oLejPkQMe3rn8Omx2Dhb3B
 70xJPKaN22pwxDed+GEY8QsMj2Lxgx8oxH0xt9Jz3nRQIdtHk+uXFDBe3CyCiqeyCqvZ65mklrh
 wkBt4iH/H533tJyg6rVh7j3/xGv+1UHk3p2V8rgAo6Pr6FKKr0tql1ZS3lII+jhQvFbRAqpvru5
 xODcZDEa+iqWgZnBFzwu0Ur9B02+BlqGb3Cb4IBo+eFe6bKaaO44eBDw3gP/047wUOdTNxnwj6C
 VGE9zKtJZGYeIbRzZyQ==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abcee65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lfXJP-rXcfLZvGY9UOkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Zn4gOk-M30FbgWXMos6L9kor6ckmE-86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 1:02 PM, Nihal Kumar Gupta wrote:
> Qualcomm Maili MTP carries a Samsung S5KJN5 rear camera sensor on
> QUP I2C9, connected to CSIPHY2 via 4-lane CSI-2 D-PHY.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
