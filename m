Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12C844A409
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944955; cv=none; b=gZiDhlf4+hN6drnoBaKnLCaTxzKHtjNDNm4AmJXB8+QNNq3yzl9FeH3L4LuRtElONE4vMjf30QIax23PAHC9eryD2fexvssB3/lAUy+Y1dMak3YlOCxE26SZbCIwd+YGYPf+2XH3ZwZUELjqUcsgaR9+KLgPhk00L9GaHHB6qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944955; c=relaxed/simple;
	bh=n869U33FgzQwQgeAx52QnufJ4gsAYthki6NGc+wQWZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4VncMeT9O2s1uwb/MQccZ6UbplCK6Yu7lw6xbcyjjaEsXLaSTt9jIQWr08fwpcS5SvbtsJYCWPrMo857ReppMFbt+0iXxsKY+dc446AqIAL1umZSnBaX38OWIB/ZybHFQLYJpwtS9bzoNOHi/CkQpYP0pdmyzuQNJph2Pg5c9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4Ci4anG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cQ3KlKyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4Ci4anG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cQ3KlKyQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6898cOIO1189177
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=; b=F4Ci4anGRiSYp4BE
	IpcscbNIAe64rKx47jXH447Xmey98s12mspnUsfyakiPlMsAcqLD7UkcZUOiSVVO
	2LPKss7dF0jKvnnGF6wk2vHxaO7SuWsI8v1oUe11bgT/TJttP541ZLAQEcjp0S95
	F/TUSHKpm3NlMaCK8pZC1nAgZwaVH3JzpwdticLCXkE/tP1lQmEghvkH8+KNuKnC
	xY8Wiifm4c9IIm4CFosV3kpriWb3kPS7cm4EYocs6Lw5uv3tvrZYf1rAvTnrO7o/
	BvqmKidQuqVFtHxNElIQSfY4EVpd/cJSuBcKFskAhCFHWS8Ea1GxOxSUhfQczKP1
	BZKuYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjxtm1exy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso51302685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944952; x=1789549752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=cQ3KlKyQKxSbsvsz8ba9ciSByGFTFafEQP7z8t0pVxgSLbbDhkaAZkYcpuIwV6/h6V
         zltXvDMIp2ButP+JdZCLQ76Nq04EGnwnsGxS/tZzNNjmmoWUfyvIe4ExYz77zTBeSAZs
         7wFrLqE7W4J9PIGvob9x23kCA/R9zoiZ3DzOYa2JSBJxMw7IQBoOVI3hIWiHsMXFFIyQ
         G/ozNtIHNZfBtTho1whKItQmoc4m9OXUKstvsgpNVACi0Juufgvhx+UmK9oP1L/0Y4ZA
         bpY4fLfiRrqv91SToeCJEf/5M5Sf4Srve/vR/r0zmPUJJ48qi33q9FoQ2c6u4BL6LUK3
         n+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944952; x=1789549752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sq9jQKsoFFhpbDXfr59UFkNUKwhGTZadJlLf6uSBi94=;
        b=WoYLng50/6UsnASLs5BeajHSUZhx7GB/X88z8DTWlTWekEMt6Q0OKNVt2wFYgtggDu
         cvuyY0+b32vx2F4KguXAggh57XIvdl5hf4fo+OphIm5jbJtWxIRJr4UOHrUnDXz8TGDl
         09inu33wgeJjSKCN7edatqGg3H9VrDfq8MATZJpyxDyqx2r/Pmz4tJjEKbGrodSUjUC3
         UjEDNLmKcATslRbtwuLz+r+mUmm+cAyyx26ddBkktLptjEHOPnY053lFaj9Bcml4Besp
         GhO+qjAB92DlobdTOrC8yaJTQnbwHqeCNIJtnf3gvXvpRFgnwAoe9cH596C06tFo9xG+
         772w==
X-Gm-Message-State: AFuF++k3E8MxMooS7WNBsH1YZF06epnOexecpCxnXKq7GTjgMHuRikZl
	dDg5DpId9C7JtTY5WX2kT5eEatePAyhOyaYOQqGVsLC6LuYLUWsYNGwzIFtZ9LU6n1uUjm2M+Z1
	XsJCkevYirMkTsbZtf1P59LU3VhwuuGNu36kzEha86lBsQmbz3sZJvZlCHR8Hp6fQiSBw
X-Gm-Gg: AYBFou1BpRYLH0xIpJ3QWOIC012MDtCfwfWHsff3tQ2AsKTygYHWS7kfG6yB+ze2d01
	lZ36BdI2eb6BR6YFwvO6AnPx3wUEFKYiO4+H62rMSRWNg8eCxPo+TL4xvi1Ius8hTUAh2NkqjJQ
	oFKf7+TK3x1el8QgOYwh/oupzo1EiHehD6nmP9HRNHzwU1eNoDWIRFFHaUvY4MJ4Ey0c9hponCk
	2AV3d6n/CeSzR3cWhyUOpVVVkYNrb2gtuOIrg2bUrIuAvI0E4Ak/wJwe1nCP+b5xhMTknQnsfQz
	zNZMUwd6Qe6keR6j5Let9zPsrdN8gogAR7Nq8a1LmmDuZh4mJOQr4A4gO12/ai6JA0zO8fbD6hc
	FuqgSyr0J1pdwa393vRaBmQ==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979971285a.5.1788944952163;
        Wed, 09 Sep 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr1979966085a.5.1788944951632;
        Wed, 09 Sep 2026 02:09:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a98505ec28sm1274405a12.16.2026.09.09.02.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:09:09 -0700 (PDT)
Message-ID: <775b06dc-d97b-432d-96b8-f645f685b845@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX58ZAKi+LwM03
 yNGTkw6iwQ1rFmUpUFy4Wh1U6xunajJ9T0C5FrcAZo8yrdh1Pn/FfxtDeo7/YMNLmRYDZHn7rSX
 PVlEPqAkRY494qnDd89yHTNI2X7GiEA=
X-Proofpoint-GUID: KqSetzUEMyu-oLq9n4gOlLHdnIjK5jn2
X-Authority-Analysis: v=2.4 cv=F+1nsKhN c=1 sm=1 tr=0 ts=6aa12238 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KqSetzUEMyu-oLq9n4gOlLHdnIjK5jn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX9sagtmMzoy4R
 lCSv4/rF3EqR6nooM71sElDd3dj5oKS/jx5sb3XoFKYM4ZFYiOHHNysy14l+FQXVehvff6L/TcQ
 WvIUjIIO023b5mR4/rI3MaSFfpzmBLePQgxmSX7IjjmQ9KQUWZV5a8C6T2hk1UifVznPtZfmANK
 mA21oABPw1+CHRJf4cdUpCVSb6uN0N+jg7Y9lmh7eiPC2SBoEFA+GP7MqPSRP1StsIDdT5awGs3
 XwshhBluUkjfhLaO5VrdzM725So5ozFB1uCiur+X7JJq0hJYi3HCkLzfq/w/7OKVMmsaHRMa8G8
 LtvlY+G0kfajhqGotNl7/fUhP4cYjMULBNTQNtIfJVI64iZpRVc9NH9l4XCxVAztGPAhmM4lwPj
 Qbc7M86eEZvQSDj3DJTb3sCwJYwpi1ZXW/oudpSbkv3y4wO/gf+fa2ZmuC0eCCIIB2KcdYR6gEx
 1ps0xqKbd1+ofTTZ78Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090101

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
