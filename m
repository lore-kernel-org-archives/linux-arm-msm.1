Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355AD560AD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996165; cv=none; b=PpPBS4Xvgc8ijcZEb5u2nKikT47PmVrtveLas+R/kk9aea5+Qw1VMCLPfJ3D9Q48/ZXho9omTya9QuimXgsQ+eo6qwwHcxLf07D7GI4MxdVuvQaL4+Thk45nQhWHoCHlJpPkJP1xC5nRNn3xZNgKbg7IOb8/tAEdHJBwY9PlN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996165; c=relaxed/simple;
	bh=+5ByLKIjfqCvrkCU7NEJqSiloCHsqlgCQOrg6SvYrXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXdtFpM/rY56KuXsk8fpeApBgsIwIHyrr7zlg7+D9urtqLycRLczBAe1dti2Bhf+i3PutaYZVGhYTMR+U1pFClANMDD2zNlH8CyIQMIUrmv+S2cf55vWfbQlWQKKTa5/uINAiDCS3q04dAY9EEZm3Ze/41EjQIwv0nVX6cgd4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymax4bHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6ARyZHJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymax4bHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6ARyZHJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EGZjf73468940
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=; b=Ymax4bHa2o9Fs8Xf
	oMzFjI+CfReWH8It+9q8IN6PxA6f5+p0ncSJ4+4NMHJDIt/uxsJV9pNkr8m+jOxq
	kF/DppZiKZoHtI0Fi30rbnwUgBBQ3wEaj1NItVHcVoD1V9kJk3Gclv1VKZG3DKFr
	8yxS5GfvB8AXfa4IkrSbg9bC4SG9Fxo23kYZk8MXEkIJKa3o+hPWTI15v/Bh5Auk
	PbtzUApcWGg74HxQ+IS3YM/8gpAj9OPlbnaVhj8RdScE6okKFXifLoCmthjEbKzd
	8npKdrjMF3ed0tuGBLHPO1dHRRNQMNl0mQL9edtvK5l3HRbqeqCfUFRa29MyvOdO
	X8h0Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd780vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:42:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso50010885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996162; x=1792600962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=L6ARyZHJXpJGY8JP/n/M7AFL/gELUm0g8OOz15dWxLPNw2UzBHdUw1vMK9+I96QRh4
         IAYxj7XTQXkgUxSPZgqOn5NEMdxYSmokMrphRTIXmwBluJgoyIYmqNp+WICaAkcft3HW
         G24+DFKuhAPGsx/D0ssz01TfrLjDxe5ADMRKhM1tXWaLVV/bz7tkRntJlzY843ZrI27H
         44j+Ek/SVUc08TG6qFFaNnCzn1NR9GQ7awrpox8S7qqRNj0Heiv3el0LghNJKVTZgXgc
         WeeilyYczZCcFD0cSnkgklH2Ww9gVhuW7AA/Q7iaKHXiuBp1KAs3aYvAeAc58DX4yAge
         3Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996162; x=1792600962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=LEIIhIRYoGz3hh/3d5s9gMfMHW69k6s25Hb5R8Id2kXQ1XPXeGyp/E5NIbEjJnQF6d
         XLiuIQ3xV2T6U3B3iQvt7JG5mxrakbro1G0uHArXQ9y6uP/4f29//UMvaQynEFeiJ7nd
         0Fuvjd+k7YG5tHyeWEFjeLu/c/ajlnIA7E3VnCe7i5sOHEkpuUclsnoDiO2e1YY7Eatz
         ZuonCCNvvQc8vZqN6vseKqa8H/sjUkor+zfnXH0wy+xA9H6MdXYMReKlZaAdK5Jg3C8p
         sr8TON4TLDOF9PekJw7PWjZZ8b3WenoGllqYFeoNvb9ZBMvE+6yfpVACwC/opDFdZiN4
         ZfgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIf782L5RVPV181/Yj7PBORzl2AqPhdx6P8EoXUKaYGzgUgFTFI2keYOY1RryqDISpsxkn60M/FJOVYHLF@vger.kernel.org
X-Gm-Message-State: AFq9FYIHKvYDjqrnMi5Cj/EEBwyjsg1ep/GHzIDpMDYneP0ot1uYjVsa
	5UdYdT0gnusXFH2O6LhyqwhQR+++9NFIWSUGPs6x+oQkwWtir7MfpxoqijDZBB9uSM0vOmnk9Iv
	dNwRBRzxeQZTOJgEYxA8yIIszFa+W4kOIwaFfZvzEvFtCAXy/VL/YppRh63lzm0Rgt4iT
X-Gm-Gg: AYBFou3qgqM/t9ERLr8H2Ak7tTzawCZ8BW/KY/2amXoHtUnm1FcS9G1Feq7m4himvv5
	klCfy5E2WsAdc6wAwGuVG//1iY5WAK3eA6+vpOHoNjUl8kzT/PTQXDxdwSuMyvkqJsMRwAqFlX+
	cooftBkoLbSWR30C0/1vslsmytUxLxu4hyjaWN4haaUOfZpT9Izv6YX+3z5W5Xs0gkFmKHD1LO0
	bIV0ru9MWAu5xMJeyU4znp6ZzgVx0ub1c5jrZThM9EJunBlkqVAmqZfb7WHspPE7vTGT+75zJs2
	tzRHRL38ytOVRQ0j/fL9gt5kgjVgk3yAsg8xrTR8/q9RdZxbWcc/BfM2/j4vDyoCQj57Wfokagz
	k7vUum2qi9A0sqMWfAcUnZQ==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053026185a.1.1791996162178;
        Wed, 14 Oct 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053021385a.1.1791996161600;
        Wed, 14 Oct 2026 09:42:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cf98sm4760366b.13.2026.10.14.09.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:42:40 -0700 (PDT)
Message-ID: <85f24f78-9b30-4394-9899-65e19eef1b16@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:42:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
 <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6acfb103 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lNqPBwARffoA8ln7mLoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: nyTcusv6FWKYpzfsee7fqK_5JbLP84Dh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXzArcgJUwBVaK
 YhZ117G2Gf5a8NNBhEyqIFjtIZTC5v9c9CdbLjFL8YBE7N43QC30942QKKBCmFWxd8AvD/bvADr
 aSU33JG+5nOxZcsMkSljINdBugV+mN9ADLY8rwS0RmC7ukX8ILpMlZNYpG7KaUcK0QWkzBXByI1
 pHdnpq5dygH07Hf1WRHonFmCmfjsWO8Mt/cwMsTIswfIpPYiEAtezL5aul5dEksfumZXsGosE7D
 1UMLdpXHkmJNrS4Ovv4TStRKuyObk4HqLbcXOwhsgIS06yZ3A9mmj5+eIwpYEMuIXEBsP+zNy/G
 XqSMwxnb3BHasxTwykx3nzHVOaOIrVsFQFONh/xA4sc4LCN6tplIFm2PNpxlaKUmJCMDCjmnXTs
 NoBBeOO3nYyy7lTHm4gB6a9HWwoZNBJeEILAbqv57+E080vURR3HRFA6Q3ypntaJCsJxociWM3w
 OOVr6I5O5rKhi4ZOHqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX61fa2AbpUnTl
 gfJxhgVHmBwvq7F3E2nWX3vcqSXMfxoAc0QY99tlrWcWtbRfZTmRLV3Bf1vrEw/+ZGdn9OwVKzo
 5sC9nQ9zRUtnkzk1CB3fhSvvPcQOxPA=
X-Proofpoint-ORIG-GUID: nyTcusv6FWKYpzfsee7fqK_5JbLP84Dh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On 10/14/26 6:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Make use of the clock-dvfs infrastructure and fill in the power
>>>> requirements for SM8650's clocks to ensure the hardware can operate in
>>>> accordance with the specification.
>>
>> [...]
>>
>>>>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
>>>> +#include <dt-bindings/power/qcom,rpmhpd.h>
>>>
>>> I've commented to the cover letter. For me it feels like the layering
>>> violation.
>>
>> I understand. I still think it's okay given this is a driver only
>> for a specific SoC.
> 
> Then soon we will get MMRM submitted upstream, which (currently)
> randomly imports a set of the clock ids and asks consumers to talk to it
> using the same clock IDS from DT bindings. Doesn't sounds like a good
> idea.

MMRM is more or less clk-powercap. The data it grabs via DT (power
numbers) could as well be put into the clock driver here, in a
similar fashion.

>> [...]
>>
>>>> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
>>>> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
>>>> +	.num_pd_indices = 2,
>>>> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
>>>> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
>>>> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
>>>
>>> And does it actually have the same vote on both MMCX and MXC? I'd need
>>> to check the clock tree.
>>
>> In this case the RCG needs VDD_MM and its direct child branch
>> needs MXC for the flipflops.
> 
> My question was "on the same level? Or on different levels? In the OPP
> tables we (should) have 1:1 between scaling PDs and PD votes. 

On the same level.

Konrad
