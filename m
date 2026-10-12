Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D949B46D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818772; cv=none; b=PBHjinQJNzJtF5MQb4gdMppUCtsG3Ak/6M+z2xqdQsdueyzDjhZ3nGIRi6s2h6lEGpJ3tc56gLB7B8qoz6Y8pRhlPU1nO8qqSHRcvl8oo2pAwRORxCOk8RAmUkX9bLcGvRQsRd9BQOxCYGqpjtotvtr3mVlyqDxncnnxdWgyCpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818772; c=relaxed/simple;
	bh=YRZ1Vfx8lSYuNDiNgnycUotxGhT7Ea9kKQg+HZ8e0oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpCagZJGUA2ykDf8d5i4cU2uKcyW8ebAZLfwzGAX697uwNt8HPfqYs4zDlzqjjFlSAMqbgTvWC3N+XIUkr8KTkOFKfGLVWI+39FoEwY1yoVl2uU3RHz9KLeVAirq+8BFgCMaVmIIyPfiDO3ehi0Xoi1mVnFudveI3j1XTqXitAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdgiDFsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjE2JTBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdgiDFsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjE2JTBr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC00Sk800949
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63rCeMBwVfAfO2U+EgnLLJONX0WyixxaPlQk9DU9dgE=; b=BdgiDFsbbBCAjyfB
	4R+mjCTMKcIJGcsYfzMPRBnJs4Z3K4+IOuswpgXuInkm3EKYblwu7mtx9xHAc3Hf
	gMNfpnfPHPssGcnJbbTVx3vQsOQpmWUPbgtxUmnSIHbJJQZ7T9YFxH3Ss0x8MGbh
	97zepiZLE0ZRcjxKPF4+efayaMIQYcrTn28/PUvUPpU8txrLx0N4Oh4Nn7wQTm/U
	hft9eKBiGRC08ev8xF3lNOtf0hijG3mTaM6pcJaSbFTMKpQhNxeKV+gcUtZ6svHQ
	QJgGi5wiCANQ+HU0nkp1SRWHkIvn2zSxp2dabsBgzeVVO6YcVEY9MAhvzH3Cjycc
	vDXUKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsda1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:26:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so20581285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818767; x=1792423567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63rCeMBwVfAfO2U+EgnLLJONX0WyixxaPlQk9DU9dgE=;
        b=YjE2JTBrnUsheWsO11qAgDgGVjgjp5yENYm/xiT/yxGjSuv3Fe5S6Rez/xk/bxNzLF
         SVlfbSesiP3pfA0G3X/W6nwAhB9E3fGTUCswFewIxOLhQihqYaxYQ1f4m48lsfjhjBMt
         8qJPcnGAvfNXqEMelD7xdrXrjOwyys0a9cv1rC62In1JlWy0JzlWQDu2O0/s+CFsTuO/
         IE5mC1IS1ussyy2iY3QSxNgqlRyOAYYGnZ/Irqcv3xztGF3pcw3lQ0y+YSQMSb20WEg3
         j9iAAAnDu78zB27xzxHodSRU3dtxZrLubCFytxNsdTM7vZM2xYfTP2JIVVw6a/FzH+an
         7Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818767; x=1792423567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63rCeMBwVfAfO2U+EgnLLJONX0WyixxaPlQk9DU9dgE=;
        b=qy08PJCkihnerhu3d9kAYmYQZlYIEZdiQhbCH+NjDJv29J72pcLf9DYSO9e4Gs1zXE
         AqIql0Db5QfnV09dB9ndOih0KibtDhpWF+UaR4qzJ1jhnwOd/Zt4n59AFSCC2o9+Ymsj
         jeirBSHLu6PX5j6Gj6vv+xQJmFL8Ztsgq1nds+jc/NheC9HwLNcESsLwW+gw6bmYzP6k
         x64JwP1VwrJDdjeXrfXZArQ261dMHTphj/m9XxfCEHNG3t4d/WDNd1Cqreb9Am6FhMUC
         O6+IBuunJnxE61MQ+BGIL2+AaNeffvOyYIMEVUC2M/vU4m7qAeELWtzPsM5rG0KV78Ws
         ZGSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdYjw9HJbuek9Si1MsKO0rvhIHIRF08bmZ/qzJab6J2KA2dbKVNz/uLg1OYFgRqigfGXuh0x9r57pHzBFI@vger.kernel.org
X-Gm-Message-State: AFq9FYLdjG92F8tcRyFlpcmkBPW5Ubcbv32Mu7ltJw0BPPVGiNJf0BBP
	121YA4ttYmkAA9RCk2AZqkk1EVXvT9aDvRKWzE/gQGtxxPI3QHsRQYXfsElwC0luSY6JcOYTkLY
	3a2pQ4BlKFXvE2Gc/Mw5ISlEpp3ikFktimDa1HaMPs5GhknoLyaZQgdqXAs+lPMifv+tJ
X-Gm-Gg: AYBFou1P7YQY4XZ+iJYIpqwXqacGASqW+cY/LvqLv+7zQ65w1+FwxFGXCXVkYZVfSQL
	NbK7V8OpQ3JtYAmaguyVOktPsW8kUUkNoe+12Yh7rXVibof7kUfJ0e8HUutV7AT16t/8hWr2z8X
	C3Q0XBpFKahv6fk7uK/eUF5h652PTcXKtui9cngYPoq8GdN0scO4bUJfuPY6uRONFyZ3V8ZAOs7
	MWNZFy6+sXb70i2ardM06uCQ8wx7ldyoS10ihfssaN1J1hy4ayXxwgq4nOEpqoN3pCPMWpYh46E
	jQoMkKJ0qeuq4Qyp9aCFhWSdGPuKGJL/Ms92stPCBWBXLMXHBVGVgOOat2Bq+1mbYzT5f7IbyYB
	CQCBJQFSgfHfecox+2eYrKA==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr1683431085a.5.1791818766726;
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr1683425485a.5.1791818766199;
        Mon, 12 Oct 2026 08:26:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm485666566b.82.2026.10.12.08.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:26:05 -0700 (PDT)
Message-ID: <4ec3f929-9845-4762-bb2b-f6b9dcb43776@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:26:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/38] arm: dts: qcom: ipq4019: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <914f62eb921e67f31cce119ed5852dae86858890.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <914f62eb921e67f31cce119ed5852dae86858890.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rj6hPd11FSA4lk5WpNJNsIS6HP6BkaZI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+mBJYMcA8Alt
 X5frdHeucSgTfQkY9PqBCgM2ujqEn+kS/11Pu4L74Q2vw9pLyW90RSj3N7xl5yYksvkA7TK2Cou
 tIoW62N+XtVPgtWU+35u/XOyXS6gde4=
X-Proofpoint-ORIG-GUID: Rj6hPd11FSA4lk5WpNJNsIS6HP6BkaZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1mWR9FXqz8JP
 CQvJn9ylhHldKLmtc9wHz8LMNIWvAEC7kXCoMdv3XjU5HUsfNYXJSrly3RCugzkGZ4YMzXal23P
 Vujt1F6fu7nGSk1Lx+bziK4UfpQoH1OH6cRS0M5ISI3hFvcK1UplK9bHzs1moO/eMbh3i6T9M+h
 7rbfi+ip/JM9Nv/yq8eNVj75ks5i/hcFBdHS48OaW3rcH+GU0L+KPxvRKreaOxYMGJfIMpeqOF3
 iawxF1g7A8QzMaFrHNw9H/lbJv0RO83sBtdEPxD4YD1Qb/Ajt/7nb8odj418Sf5b+Cexo9sFeHC
 1VAboIdYvJzrFWfJx53GZoUZlPOOC5ctYfJl+ZTpUD0+obrnSSDF1F4itzK3coKDoihrcFdYjRf
 65L3gfMetlzTlhX60TCBajsKDsXuSOapDqVm86ZjxNi1unu6YqMLtHG0V8JK1XR5Mz09EfvLAeB
 6pOgFdPhorQKUW6Aj+w==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfc0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=YEJ6OWm963Uic9HVx5AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There is an awkward line break at the last elements expression. Put all
> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
> formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> index 1fa1aef140a12..51721fedf7d60 100644
> --- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
> @@ -135,8 +135,9 @@ memory {
>  
>  	pmu {
>  		compatible = "arm,cortex-a7-pmu";
> -		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
> -					 IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupts = <
> +			GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)
> +		>;

I find this equally awkward.. especially since this fits below
100 chars

Konrad
