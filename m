Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569860;
	b=Zx8mYoioupK7Nyz/FvSFj75RoI2lCyl+lexvJ7ploYlePtQQfEQGj9ooCjfy3VOcDwIa
	 /1v/IRH2kytsvjZk8xOQaO4uqNNjuaU9YWa1LWf6WeeLUraQDpGdvYJ94DRQ5Pj1Khb16
	 Y85YRwdtPhk0Vb3iWC7APvsdHtKm/66hYWGtzeN1hx29qENAVP0pzDoBFG7Gp+GYXipIa
	 mqy82iYRY9t75TCAwM/EPzpJwzlZGVgfjpH/+VPzxzuDy1WWl8g0FO55adAn6XD61em07
	 6VbtzVO4vIxVLEgaKyWYR8ARtByCq2OIK8obNCPAaoR5hyTQ8Zr881TbN2ibQw6dfow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
	b=hlqfESOvLFFbVMz2PkNYNzIQf++B8ub/Wxwv0YGH7VwRYFTfiXte66Ed46hUbFFauYVC
	 iPAeO2sb5+TbqJ05uToJLSrdVitGykpPd9fophGS4RbIdSIj11bIZ92GxR6Dzks3moFqh
	 CKuCkjnxl4UQMN6G9SUvK6Zuq871/nYnI4c0aBz2LT6d9ssdMyNmNgYP8SEK4oaWzvlAk
	 QXsFHneSqOzBIusRhplL/MrvgPGNuhQ1HCQIzLvtyxHS3iNUUOzPf+1ZCQNgl+KXoLkN7
	 lnr6JxoEa7ZghlyYDkdhkmUMRo801p5KOED58c2JtUyUR+we87EGWe70/eO2/1w9l2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D42606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrO1mXf7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRyQHIqR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iqBd3018337
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=; b=mrO1mXf7S9FLD5rt
	zKEStQDCnxwR4ZDxHSlqz3JTMFtg3oROyZU5AEL+R3ooq3uwBCRJeyqdJLHRCRRI
	Yje7ETm+9urgF9k2KzPwRzNV+cbyV+Vi9zXzVPtHdBmydn3WLjN1cXLOUY5oYp7l
	0sYyvlI5KgIqc5PhEtyXtcVoBtlbnpGa6v5XuOZfjjOPcNE8fHV2jQSb8LaYUz1b
	louPFnH5RuizqSBpbwmd6CdWh1i9ucm1fIkNULWBrbKBUsDUeyGwKYQR8p65/Pei
	RPMD7S8ks94DhKIL3V3hNZk3s5yPSG6vWFXq7SALTpBpz49CknchAmL0pwvnTZJh
	0wcElQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd33x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:04:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so15143485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569858; x=1793174658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=kRyQHIqRh1abyHBwXj9qN2pXyLNMPAdpUqEUtNyDDOpWat1pwCbj5e5fi7saFrlfoB
         9rWuvqhzxXAh33b8cp2x0Q/fanZk+wiGjANin+99KwOGv3gp9noJVsiorJM/YwMDNvkj
         xsemtIrF9CwsML1IjYBByuppZpAe3GeArCYWgt8S7iPl5P3UGRlDgeWbwdSyKKmLMxo0
         ouDZ5yZU0cWVUSMm8VvNlHomYfjlDxb4zx35a0UpkE/Uv+4nR4njWOUp4IQWTsyFYWzB
         KDB0H+o+XrC9mSbCBlYD6W0lIMNvGaCdEiTuSa85vet8RgWohJqLFmQn/7OtS6UbpbUB
         JHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569858; x=1793174658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=376e3NZ04AYvXJ05krt9Fdz8ClOb73elsktpTuyFrOM=;
        b=Y4Gl1NuHM2LCYrXZL5za4EmoJdAy6e3cfV9GjPZLw190liQaMLCYpddsv3Kn808K+7
         7qchhGHvf+jyH8a79e03wqSr/TdHklxBY0G/02aHuEt2oksMmvebiAOGG4Ky4EtYvs4+
         WzTOMjnTezWmw7YPl+PaAs90mXDBRi/CFEfUC8PmTSZGxVUL156yCe2UycdpyQSMyDUq
         Gc2n5TgTfL6OxMWY9xnfDEz0St/VO4P+tgFx7s8nZjsDuX9jrMjDYHh+W/PaCTzsYNE8
         UKC690v0bVwnx7jsb7xoS/GkvsmN/CfT9kp2snrq5eB0PzjekvceNStifRIdOMx/wVU/
         eA8A==
X-Forwarded-Encrypted: i=1; AKwUvBznBUVT/ormiAC/ZYAhH2MIl0s1ITwxtZj63ulc5oVKxdF9BRBXJfUv70f5p28eEjW6LCgt1juvdVLSznxK@vger.kernel.org
X-Gm-Message-State: AFq9FYKkeq186tBG7oQEZ4TDr5lKUTA9AVlfa2cI18xFdid01m5ruY4y
	9/vURqFuvNfQtbuoUndjLda8teZNUl7UWM1AjimKU0+d7b+ZLJOoBgd1LLKFro1uPMQlBlxrSP+
	svpLwSRATU+PTMSlrH6rZREgEAnpjcDmE5wjT6zEbvhqUlLIKWe/x7phs2pJJUpsNSX69
X-Gm-Gg: AYBFou0pTn7jIPGwD5rCWQnLl2TCL7iyacztCAWGYMtPryc7lLWNKSO/yvRTJ2B+sBv
	z891XPD9++HILjmdRLLuOu2On7HqGye8Mr+Vs6Z4oeha8+NsFV+wBJJDT/aotvv3gyXLe03PBKx
	EmYZQP9rP0CpZeyMH4ejv+MXa42HjMw1L+7gc5p5vG0090fsMCUYUKgqulWqF7qFDt7qOuhJC4/
	s+JmwhDrr6KF1EsF/ERd94Eh+EZrTVA9v7gDHZUAhTUKyeNDfTbuRkS11mzXv1u+ePTugrTwtxs
	lsSH+C7G84VdrWAjpetFhZaIxbAvUHESPb5aLrVkApHFuGSbzgDZmJ4BHIOKEQWcOKx0JsIILtq
	Z4E6Ry8Hoeb9kUnwC3+Jg8A==
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324547285a.3.1792569857913;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:939:9205:4d78 with SMTP id af79cd13be357-93f57f96010mr324544285a.3.1792569857519;
        Wed, 21 Oct 2026 01:04:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030daf5bsm547898a12.6.2026.10.21.01.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:04:15 -0700 (PDT)
Message-ID: <b620b2de-77dc-4d90-acd6-464a85ec674f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:04:10 +0200
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
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while the
 PLL speeds up
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
 <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX2CYVRXQzecuU
 sw+R8fCUzAv0pOZo3O3DT/UlVBjG5BDViiZMJzsTr8syFXMsBfFf0XjpMQu4whUXhaHlWJZBNRq
 1qnkPITTaJxFYbfIukv0U5PSaGDMx99eXLK45XAAuU9zcdNptvbfqMqe1pLiX+ZC5VkecTL5daD
 fn6Z6obq27A6Qovq9+Hg4v0tCK2gWgvZxCbYktiQV7Blc+BWwRbcg2NtmKOg98FSgSMt6E+5vLi
 zflwuyV0hgvnzCZLK/H2jjY7U1JucgN0Dy1WbtKhDCReHTsCPvWbNKTCeqtMJL3LR4HenULeJ0t
 9e3sm1pJZ7/01sHFuLZTWyBzxFoGAn1MTaedTammr5BU48RULx03juk8Gz+PLMFpv59ngM1YKhd
 umpsuaZwINORS5OeXlRjmDv20Wo+35vhpYG+i94F9vw6hV/df8utinoX5okKP6G50l3n8i0IdGc
 CvC6cdMM+972wj5ACHg==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad87203 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zcdO2QGPM5nA-iYd0ZEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YrWWrc9JFioJmkmhOTT5pHW0iiJfeSve
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX3YxGwV5xWQFq
 7BS+GPTJXTrfdwPorTmMftcWdwz41CM8DT2CBVgIe1AIP+8ugtkrjJ9YSemIyK4pd/XYC18OOaY
 YNxNu2hcU7bODAD/3vb9hWx4zXF3Tyw=
X-Proofpoint-GUID: YrWWrc9JFioJmkmhOTT5pHW0iiJfeSve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 12:10 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
>> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
>>> The MSM8996 CPU clusters sometimes run at half the rate they report
>>> after going up between two frequencies above 600 MHz, and stay there
>>> until the cluster drops below 600 MHz. The PLL, the muxes and the rest
>>> of the cluster clock registers are all as expected: it is the ACD that
>>> latches at half the rate when the PLL is reprogrammed to a higher rate
>>> underneath it, and selecting the ACD leg again clears it. The driver
>>> only moves off the ACD leg when going below 600 MHz.

[...]

> Downstream isn't keeping the main output below 1190.4 either. After
> pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
> rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
> So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
> way to 2150.4 MHz, on every increase above 1190.4 MHz.
> 
> The main difference is where the cluster waits before the PLL moves: downstream
> first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
> this patch parks it at old/2. Both are lower than the target rate. Following
> the downstream approach would mean reprogramming the PLL from inside the pmux
> notifier while CCF is changing the rate of the same tree, which feels incorrect
> to me. Also it wouldn't lower the peak.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
