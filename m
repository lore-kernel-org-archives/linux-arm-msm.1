Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950BA49480F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726115; cv=none; b=TCEiFsWV9av2PcQnEbZeffVAn+bwXQPAEbzaBUY/uu4cZJOs4nvn/F88EHIg+juUO2Ulg0ic/KwtgfVFtS63D7SEPCG9pxZAekAMhh9E05ufzwyyVeoWapOscDOEyuELkn7ZcmKK08Haf7YaanNVrKTPEWclEgCEUTzDZKg+ZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726115; c=relaxed/simple;
	bh=kszFDuclNdfq0CP9WFG+uE4j4V4VvM+PcDa63yU9FKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eioBo8fusuXltid4Idq8QjT5a2hZ12Hocu6EQg3L70BU0Gm+L07g8LqWKht1uQI/+E/3V0NHqU+BwuxISeWeOlqJ7E+7jdSukclb7YdBlr7X71VYkmCrvBg/Zy8QZy7Buwkjl1GsIcz9dMyH+U7mOfh6nB1Yy/IdyPBdZqo9Zlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg7CSuxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrL+NL6U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sg7CSuxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrL+NL6U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9daOT385347
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=; b=Sg7CSuxGrw6JEael
	T7HUYkr4BHbFeBuL1Bi3Q+NinEXgsnulsj6Ply8n9QgHj6+J13bDAx+ONpEjDpSm
	KXOJrKzTT2Pn1ALcjt2228RrBWz+79y3p1M1YLFffyPzl1EQP6rTFTyT/TkiCqei
	Rlrb4Bco2l5a0nFwI9L369cFMT0umyGond96Qt7fN5xYVGwzPHLfhFJjAmXPLY5M
	8QymwDYDbC+fSPF/WgCR7o20nzc5Obs+HMr1RPftUM30i+bFjcMpJ+scWpBkeILx
	kq0N9GtNUDKZYQoZYtdvHnkTOUKY+gDZlHMMyq8kwhCelTRHKUj+LyPP9OFnNFL9
	A66hGg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrscts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1118fb97so14570785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726111; x=1790330911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=RrL+NL6UcKyLn6YlPfhjSrVQsHh5YiItiXUNvo5nNP/30It2XJ0D3o/bTcznJiEpAi
         ch/bQ5nZOFUYN/MRyVAYg+qB7uU5kWI1HCQ70huoA5+kYYbB2ERD5/VqrOo0Io+kG0rH
         WgLQ2iTqFOq107G82jjdw32LIcI1Oh+evNe8QrnOJh3PA00Zp6lBeegYJCE4FXhesT71
         Yvv/AifokuG9EKgRez3fy60uB3wwt1h5Yj4Bn/BKwpa/4OtJVbexL0khYJbsnoytxlCL
         Fd5BkbrtblOGf3ltIqm5Eh/ksFVtvRh5x4+7dQjASGqwyTdKAGp41aautrk1NO87SA5z
         ItIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726111; x=1790330911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY+tN0E6aDJtS5LXy+Vf5AHguWRqlBrG1L1fZBB5kOI=;
        b=HtIEv/3Ctl58XQZg5bdxP5TTz1BaUal28F4Yazxg4ro1VwXE4upECncHNrbBmqcBjw
         Cga3fv9I9aDQActJP6mEefqPCUV7B6+BlS7ggczBbkKf9CvkVlGIzHamAInrEHox68u9
         h8LlZMISGBdqZ5dwoF5ZQtsH5Ztglf5eNVEROL3IYOb71gEBcn9DTDrLrxx3brDJj0ih
         74dbZXshz3IX06fXJeljuslQZHtXzUIvfoF0ZKlfyqsp0VHXThqPmBCJ59oYP86B7eZF
         DxHmWwx0BKBXX9iIqpJ+eqjAqArUpmqaoOaQJTmtQMRsqs6NrhdMDmYfn2yh/8vPup3G
         +avQ==
X-Gm-Message-State: AFuF++myaiSXYLtz8UT+g+DFmFs++L1C3c1WU6bVmcqdr0Ggd7W0NVfQ
	kcPtdHI0FhOz0D+FE9OE8WyHasGcaGNAK/jpJ6TofWfKgc3ivaM7MkZFu/z+1WCQHhU4z0W4lu/
	+XuXADCPjSwar7C1ydFABdYtzCPu3UZqSmU3viWU81v4blZcBRwTUELDpBrjhPDzGmJyv
X-Gm-Gg: AYBFou0UmM2q2eeAWc33j2S46uAqi4uURzIPVzbe4KsZMWtB7HY75QoV/lsiKsYsPPd
	FKaf/czqExWj40HqGoicCn25TazkWIpz1W4v1UGnWfHI+vB4pmHmRVXga9m/ynYmarXVz2K159b
	AXrc8sKMLSWZqw+xmhQnccKgY2VsPxSAScMGJmkXRYqO2sW1ynUOL1oKfi/KQHwUMrFuwfuzKRG
	Jw4MdQ7AS+Xj7zvXhKDcVu16KbWFyGyu5x2ZcTI7AffNi0EjVLIo5w+rXN47zo4Arput2vg8y0b
	O/bStvw2DfetEBcU9ifDjf6c4C87yYaLq9XIlIb87YvfcD/8V9v8KaWEVZ/sUS8lYrWaQio/4kx
	+oxbujQXfT7TyRvalp9ZMuA==
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169259785a.4.1789726111299;
        Fri, 18 Sep 2026 03:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc4:b0:939:c7d1:7471 with SMTP id af79cd13be357-93be0998bdamr169254685a.4.1789726110714;
        Fri, 18 Sep 2026 03:08:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59710fc0sm648914a12.13.2026.09.18.03.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:29 -0700 (PDT)
Message-ID: <ef3beed3-e005-4643-8f4b-fa7b9c017e08@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm8650: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-12-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0da0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=tTWuevluKPo1qLNzH3MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX6BidV4jdBC4O
 b+hvXqohEK4m/HMyq3QzCCWx9wrbxNkuJZkUiUFmZQPxX+8vnaa1KZ1S5Db9hLYStTNpm3ug/gk
 E3EUH6CVQplyVgR/6M1XJ4+gE7zt1FE8go+ATfFlsqu2ygJOFoypQi01Wm+G4eU/eaTUH+Pt9DG
 ThOspwYW9hlNplaMJSs+LYSPCDcUdcUwilrqE8b6S+60YxGi/kKpKg/f3s3EfnJWpgIC/wGWCRR
 MvzdqtHxeP+sJCfOwHgfrKVQPIm07P3OwUqFPLSAH79FgAvjUXJkuQFOMb0T2r1q68zMCZ+C0MS
 BhLP5AzsBjtED9i/Pb35FleINCnmzMIeQEJ87day8PJr7VVAofHkaz7h3ceiEHUiduoIHEth55D
 3F3yFuNMaGWcUqvCoojag4Kyu/ShJWu61k6n6yIDc1TGtaW5TwPvotFvLfgy2P/qlssf2Eekl2H
 l/xJeCJsCGtR3Prxapg==
X-Proofpoint-GUID: ZTp4Ikkb5fSvtpYnK_g-rzS9wVgIyngn
X-Proofpoint-ORIG-GUID: ZTp4Ikkb5fSvtpYnK_g-rzS9wVgIyngn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX3XeDWVgN6Qe3
 xQsczj6xAQvH7f86oFv/MHVLbkRKfYPXGjOoPl5ERAoFxmNRACuf8FqxXcyGhccfZXQJG0ydA5E
 gmjwUG3eSml1dXccn7vh5jSmab+e7ow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and pcie1_port0, allowing board-level
> overrides. Move perst-gpios/wake-gpios from the controller overrides
> to the respective port nodes in the board files, renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

>  &pcie1_port0 {
> +	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
>  	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
>  	usb-controller@0 {

ditto

Konrad
