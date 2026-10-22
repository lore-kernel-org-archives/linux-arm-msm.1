Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661102;
	b=5IU1J0AG9SrK6SkWc/i5a5NqKbXjORk7TDe7clPA4V9zc5La+u0LCo9+fg5mcjXWktwh
	 c9wd8Ng67KPrIhPcj0G9kpWvhsw/XHz/gSOFg69mTXO7qsBxsRtJBn1fy/j5LUvVukDuG
	 d1rM9VNSjRhIEintJeilxEVEu4dvSUmQpu00S1HZgQzPqVVB+TUPReOV/0FIDE2ce924m
	 qrEWKrEsV8k2igubND7a3IEgE7tYzR+/RIPlzV6Gonz+OMnT9gl1/zlf0aW8iJWi7Y5+l
	 uBpbuzK9wL6Dw5B0jUz2fYil0Nk69+41mrtUMEwz32XR32Is+i3O9sJemXCV+ygJzqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
	b=T/Nzs2qybcUZxwk0gXmq201GfE4fRcckl57TiUM4w2ShsRf5QD6ngIe2BUmWmnyIXwaj
	 FX6IISmIUcmMTKlbhUdZ88nIVkC1WF8DT5V8hShMHakiVL2A4Rfn/YNKzuwDD18jLdElm
	 ergfSEAXIAtbzVGg+HjJexfIWNvpBe2T6NQ/0BQgjMCe+atMp0Sw9zjYR9IrqebpZKQ6c
	 lw+hw2II3OyjZTlJ8xKLnOwOITC9QDJKgU7yhtCEeVgXyt8RjCQWh/g0NLtqN3nFRy7ti
	 XDEU2rvOeLOB0XRSSh4cKQrIM7J36/DOjQygt6JBpMN3kU6f8xJ+Zj/t/EMq4MMS+3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA2606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704NP4110612
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=; b=SNIfWIh2BD1xA3IS
	9RpYsnwpdP28ajmvhxjpX4BMqNOVJBhdP8kRs40baV2IuGExQd4v4ZIiBrAhZtWa
	3peEUMOVtKhoqpMqdXyZ1wdRAt3Pe1jSPCnwV9DDhTkAtAvE6AzGptZYBAqcHVUb
	cRCsPpPWNsWEP+TrhldvIT9zTccRvAY6QdB2QBJ7hLYsOJCf49+JfDQalYu1wnAk
	cU+mz3ElSZ4rQ/836OPEh0juBZqicn2pvgefCzq3EVdHoviR+yq4G63RoGuQ8jdh
	5CaIYIH5G9cPMkdP7GT+L4ourkA/US0nA4mb+Udrh625/lYY8KxGs+ftiCkhjVj5
	rwHcTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so40520585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661100; x=1793265900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=Y714SOzkNwNH1ib7eT6zvW0EkbehqGtYOUN3l/Ew2v4InJ7k+mEnO8qRWuN+K6MoKu
         d7jySZnv0O89GHKNTK4+GZ3NzBv9xZh8GUjU3d2GNsdjpzjk+y3ZyT8wFRAqNsVzPb3l
         eTR/8t4yxj9DPohm+an88S/R0BFd3QFDwmxjt3VIopo4oUQbkikCdBtQWBS6C8GGvZ1l
         5AXXd0q8U3XXstgOM0/rh2Gad/9YSqsjPEbn002hB68nKxdwHWOyN4a11NrvMS7iKLdw
         ZSAAYXr8Twi0t2EZ3tWaTOrMWwrhvztSO79TqdCcxT6OFPTucjEnzF8Nc5nJBNkKVriF
         sFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661100; x=1793265900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=cAE3V3TBrj5ovaGQ4UofHgm67STswG+RpLFAv8VPHE6OcnnhhR/nzGWQPu4OyuTWUV
         2k10wmCjUgccHlwlJFxxc4DljDpzi6AdJvl5lREK3r5wYo6xIxjiw7mr9RuoXEK+5Fan
         sX3WsSAhu3nNlzkDEHRgSTgz5G3a4a9V2N+MfEH7ZLYtMi44bld53yzCYUs7jpjjoN/X
         N1De7sWO7M9ojHSKS5fLX11HWaNlSzGsjdNXq0CQgb8gl/5DKsI5ozLwsF0APMg5BQg3
         at3k9r+mJazr7CzMC+qMsGX476OIpXC8MHAJrJyUhlPcvhi1Mm/Lv3IttbjO7d2gG43u
         wK4g==
X-Forwarded-Encrypted: i=1; AKwUvBzJKAfgjJwONpULa/WfhW9UAFLvVJCUYTOJcXKrwsAUYN2okk4Pu+Mq2jad3e7/Q2rt0uUqxqN6umved+ru@vger.kernel.org
X-Gm-Message-State: AFq9FYI4L8Q9z850CbrWicqXcB3Zsg2iarbLR6t/XN7iaWCx0FmiWH+A
	oo85ZAKMwfImNhJj8m9STIgYxRb11vBrrjLmW2KuR8ee0XZC84qleK9yZhtQaBtHnvMLJq1JwkN
	4XC0tO7aNGD2sJwXwQcnAl1sXsglcY+eoTwxk8qc8dU0e8kCy4T6fILyvnq7GV2TygTuA
X-Gm-Gg: AYBFou1JDwi+ruU8BGJ6/3J/GucjfErPFkbKxrDM9vTHjSjez+Ye6zAlRkKt1o8VfnT
	/5ikQoN/B3TJgW71AfgHe2HxAaFASIwxpGKhAFUB4urVCPA9oCdo2tD14HbU3OHL8Spu2JjkfQe
	asDmGuxWxWwP+hfY4eRqFSJ4vYvLeAX8s2fgLzcujflTgaHphP75OEuW0UwKYpJzwVr8fIHeVod
	ybPEo/xSfhHcoMVCuCSJNBLi+bIX+JpnGFZ02A+GGQ9ryHxMlSpzyiQpzspB3yEIOpuehih2PBa
	b06xRBjmAkDxcMNr0WIS36s/mB1ExRWoa3DQfBaAS1u0rk0we+p39bRF6g6egCO1XEh9+Ih+tKi
	doaz71uXraQUsWodxslIG7A==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909631485a.5.1792661100070;
        Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909629585a.5.1792661099662;
        Thu, 22 Oct 2026 02:24:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:57 -0700 (PDT)
Message-ID: <a00c39b1-e993-4cd7-94e5-9bcb2494d679@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:55 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX11dEvNYQ0ZWQ
 x2XbUO5p77+qxiBNe2pH3mwUroBZR7GoKiknS7UqPkePHX/RA7feRvfT89PbfdVyF9Kb0S1QIbW
 31hU6LgqC33Xm5vGX9T4i4caLCYENfJtucwSKHoA1R9xrVdVW4mcaYXf7txMG2zPP4kWg2UKcjI
 g+3XeO0EIVi4OmkUn8LeYWLHuLgxEFWB6qA9Cexaj89HAMqMeUpSzWVoXIg+0it/9NYKHXNuibi
 mUW3lsmXEgEeuHcg1tydowDsv5EJHeqpv3Ew0VJCxfBponrUlkHyf/BgBQKx6gdzKuTzgZXsCgY
 7oe9nMrZ8qcyhFBb5Xy3U8pr1dBfwzcxy+fwMR492mectFVNXQKigov52OWqlzfwK+EsVJLLCx0
 MsNlCCW1IhzGvdxjhqk3r6JuYZoY9Gl4WFp+o873iSxnm8feIghwdRFFsGhKBM0iuA5wJGoYm3Z
 SKP7nlF7MhS8b6XeqGw==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d66d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8
 a=0q0syt3hQrrWoPH5w1IA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=6aV5INxNnvWGCTbEtcBN:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: iy1mAmHikLh3LbMIAr4UB2Yj44RpPL5z
X-Proofpoint-GUID: iy1mAmHikLh3LbMIAr4UB2Yj44RpPL5z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/PW0OT1O7PI6
 7LmlP+HmfYksFsLvMO+Q3UEsYJDbv+ia2H5tkkt/GUO5F/sx+80KsDNyVlGYA7MurMIIv1uquVf
 GCMfgw2N3/usFXaUG+G9HchlUiZAai8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
