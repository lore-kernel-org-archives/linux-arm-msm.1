Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7742E0B71
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449517; cv=none; b=BzFubG8nQwlVrhdSTtiYtyOS6w6VCERdnbyC4cSLMqHDJ4Et6S8tsBE0fOMj9Mke3WsEXPZwRCFm59Gj0QfbDzEQntcK3juXfe8bKp9owPlnPmD6SDwPrBykfBz1/JcIHQE0iqElY+1OCftir/gHFZ5SaDtlWF0LYG7Q0oZWsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449517; c=relaxed/simple;
	bh=5uzNDy7TqOIsnMifKUBCd6yHdFj8TpZZ1Usplw3pKow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxARhO0ffuIgDjmFGC9VoAWFH2rxZYbdWsNlEMLNWd3eaZOd+M8w3nAaZ60lcvmNMLeJW86LcDDhevvY8I+m1b0aXFcZivypzTCaaUiUfwMySYNXL7ngY47Qc/11F9WZKrXUsBjkY+KJh4aQOx96mi2Ihm7AvW+fBLRNwfnIlOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNDK1sS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeNZKK9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNDK1sS8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeNZKK9p"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAh4c707763
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 15:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=; b=NNDK1sS8EU7+fuHi
	Z47VrSMumg08C0vbtN2CdVFrp1d5hbQcCjYgAT3KzH4X89uHJYCuJwOfurfObbC6
	UZHTPnqIQbItDcYvVQP8Kd1mLu3Jjzsc6IfdY76HiWM1UHSVnoWF5wsYGH6j/s0w
	kxlb+xCdRd5RBX5COlqB7uROKlQ6U1APCVFvQb9EEIJJcT6jsmbahD258WmuGrkg
	2qro2av21vsT4AVmhMluz2LLKp6zqL3g11cALp7xqUVLLuW5tJckKspauTG1UDQo
	B7b5UW9CbdbyXSvMvIAmLoVZAJP9eu2R4yIX5Nr/SHORTrBtr3CLKmXT6jI4YIFB
	kmDxow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekj1x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 15:31:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso57920675ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788449514; x=1789054314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=NeNZKK9pRXiXVbouz2syzDG5lvTUOCRL94+kwIDPfxOlxfVqNZwl3OY4wrzi2d+qNs
         1KAjn07e9XRMGX8yCPUN8ruRRH2X4lDFQmg5EresciKbBXlFPPoDJ+Un55vyFEvw6bcO
         DDa1Gk+BaxIwJdo60RwXeWOxeqD2CrRRH4CICsrcTQO8E6Yw+q5lSjzzorXSRWyd25Yy
         Lti2JU2VJ8DJHPs6hvZQ9pcoHdz9V19UGQVXX8gt8NW3m1g3kcVS2mwUX2v/0MIMmJ36
         VdDGYXE0UK7+iSWMBL9EcoSTzgUaXevqoUUVNgwLlSPk+bw3O4ILUB1xxzVJ7nMXKE9i
         85oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449514; x=1789054314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndIsPBfnQyXwgYz9iaRnRCca0ilHBDDADJqxAyoUAvE=;
        b=UGTYp/YZbPgRx8eywl7L9X20o2L766hyExs/wUfq3OAT+pxqo7l9Lml8S6qTA82zrV
         BWyy43JrL+34oCVRR1a+tb5DBAWVh9H89slRyvAkgsJX6c4tg2Yurk9WgVJbCzjQP911
         Dy4fTWnKq2bcSIM32wIkxDKActn28uoWoX8/oilS27sXqttTc2VURdx64reQPYdVPDMF
         MluvBrZvzz0I4KAtuyRFGH25FmoX0t/hOObBCZ3WmxqZ6IoRGRUf80WQ/JWy8Oe0zSwx
         vPxEwmfKVgMWoXUEemwt0c3Lw8My8S+6VweZZfRB+ECq+5+2E1+bYCo7gwbazvdNigaT
         Kyhw==
X-Forwarded-Encrypted: i=1; AKwUvByGUlQaCZKKIE4bnSyXKWkyhzh4tUd9J0sz/9c0hrjhpQlP6BoWhInQmeklQsVjW4ynRYFOGrdVxxPdq+gG@vger.kernel.org
X-Gm-Message-State: AFuF++lT/cpCRMDGZTgD1VciXUuwk/6hqhxkd68aKkJMOdV8ntTSxUZ9
	t5Ba5yyuUtRYIE8aWpGbHErPyEOYy5Tpk0TxPHD6F6I5smGn6wRVOlleudSkqFZu1GExuEyW1sz
	HxeeIrG+ZpONxtYtUMmrf1IX8Fkx4s054PS6WTvDvYQprqE46yRnwHilMniMJVMMAa+EY
X-Gm-Gg: AYBFou0yQvTyIeN6BdvmSKnbH4b2DW/li+q8wyig6ppVsW8AwjuNob70PaQgRAqK9A6
	L1e6XHrfYHbFNmTz/YrbXu0+44NZNyrEHubGW+5dafwAPxjWrNoAIfrddtQ6dXwC+GG2maGE7Tj
	9FB05J2jeCwMnAjS+qVnmjyab0Av1nVTo6DGERaTT31QfU//q8fifC4Gwf1WdWyJqW1ODb9dBol
	/gWvcUbU18sFEjfRmga5Z6e5akS9GRqYl4+K7jXjzrl9pXunWMYrls3An/vTeccnwj6gypFEhV7
	q2EXNNP11eE7EleCH7OTmhhSg/ff82tkgGWH7n52h1/ITX+0++Nwqassof0Lyf8lP8KByz2Ss+k
	/jQNMOl3rLNqd/ZdAF3FA6OMVmKbsuqXpq2tLdl3bTwep3/pTaosBk8DSefZFAZ7b
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7514225ad.12.1788449512688;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2d7:4cd4:5a7f with SMTP id d9443c01a7336-2db106d909emr7513075ad.12.1788449512195;
        Thu, 03 Sep 2026 08:31:52 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62d7c2sm11955965ad.29.2026.09.03.08.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:31:51 -0700 (PDT)
Message-ID: <d3d418e6-ab18-4a2a-9018-4eb961f9731c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:31:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-8-21c3db378611@oss.qualcomm.com>
 <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <mdfw522n23py36txjtsesi3pkfhqljlkrabturbjumsdkeg5eg@h62ob3bxsa3b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9MWqI4FXU410SSqgjTVr5RaoK_o6mDNE
X-Proofpoint-GUID: 9MWqI4FXU410SSqgjTVr5RaoK_o6mDNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfXzRPlGQ0kKk2g
 3Veqzg1gecvcZn5uyfqVXi8KbqQ/x5v3iE63Gq+T58vWPkbZVcO4sTXiC++vLt4AxFGI2fRn/98
 usMDw38vZGSsveipoKU4T0vjYfq+2B3JZOM8q79L/fqX6XFfBuSVFZAW1NEQfia3juaxcvTOXDB
 s0VreUZ8Jl1TV9lDdLxWqjOBzLivD0BLCxW9rslQxGHjJ25bsmB81Cyf24eU8/BhmDXPztNxhWv
 iIKtywy3ullZzRtR0TwQ5SmY0bgSnTCe2U1YJBzy+l/hFpCawDyIXxkKthyFMxrsQtdrzQWjPGJ
 yGcWOGUYVneLgwLgLGItKQ9PLAVm7pMpI1gUJoYTJpucrvmGQsYfGa3l/CSbzEZsDWFhs28ot5t
 odw0Z1nBRaY+4GFKAEu9ixmPJwvBYk55JN+zkjIgSfNtYH6wy56kDav2mc0YCtT0jgHEdKmVJ1L
 0imkORJoaugAtkBa8UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzNSBTYWx0ZWRfX9U8mGcpA1mil
 Ha4xtRXcs23LFlCjw6W7N4/oRzxh4cEevADb7znZHKxYurrf3piGE+jCzwnpjgKns6Fnd+3GF4k
 640/AptOTkWPAc1LkN+CtIdQTyzMWrk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9992ea cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bLGlZ6Hhwxh5CS4LpkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030135



On 9/3/2026 9:08 PM, Abel Vesa wrote:
> On 26-08-14 05:48:18, Luo Jie wrote:
>> The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
>> provides the raw reference clock to the SoC-integrated Ethernet PHY
>> (EPHY), which supports up to 2.5G link speed. The output frequency is
>> selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
>> CMN_PLL_PON_CONFIG register:
>>
>> - 0: 125 MHz   - for 1G/100M/10M link speed
>> - 1: 312.5 MHz - for 2.5G link speed
>>
>> Parent it on cmn_pll_div2, like the rest of IPQ5210's output clocks,
>> for clock-tree consistency. This is functionally identical: the
>> output rate is purely register-bit-selected and never depends on the
>> parent rate.
> 
> So it is not a slice of the cmn_pll_div2 then. What is the actual source
> of it then, in HW?

Thanks for pointing this out. The wording is confusing. The EPHY-RAW
clock is sourced from the CMN PLL /2 path in hardware, but its output
rate is selected by the PLL/MUX logic controlled by
CMN_PLL_GEPHY_312P5M_125M_SEL.

I will drop the “never depends on the parent rate” wording to avoid
implying that it is not sourced from cmn_pll_div2.
