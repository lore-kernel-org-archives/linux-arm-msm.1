Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFE3488D80
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331094; cv=none; b=fyQvUONQZYzkk8ktKAnlqAUmsxoJ8/WXALA0x2/04v08+lN/55tLY/daHLepq1kGZgNN4nyld78i4WByxFx3x+XyQaCxkFY1MNToWJSNltgpwpaalPcl8jA3WtTldH4G4RNma0nZhLPkVVpD/qG6zMPcMaJQYWtIcNctoveH0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331094; c=relaxed/simple;
	bh=Fy7giK9l2GOAAXwBJN7wsYR2xax/m2b0TK3PyUjjhJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JN8sw/pa/kzWlJtYSM4T2aNCyT9Ml+XmUaBcS90bzZ4oe6F5kpIO8VPu19WDviDeP5NvRAE+dEE7qISlb7mMBiqmHc3Wq/PTSBbZkddpKODMoJEsGQgzBEwfLjB/lNmzycCmA20x/aGTKzyZ+KpwaFfAb5qTH0u5k8XvtnVNrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhjOKrAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+Of4ZSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhjOKrAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F+Of4ZSX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD80qH1839446
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSZgLj+Ip0LSbqJ1NOO0qNpuI5sLT/x8UbtxND0+jgQ=; b=RhjOKrAz1T3DRMJH
	WZMyqYppII6SsOc9/xosEKORZj4AVB0KCtg3peQyvaKcGHrnwTSzV0Rj7EAOk9Ub
	41WH/E4pyrU/SpHpnHrdghVhno6/wyUHG1cDk+nHjorOeUTMSxKLXQjxMeoUcVDm
	1t8AgEqdCULEm+1woWQSDYi7RXpA+HgPMzZiVUGx5IrEkYqw8b60yz5ec9H6jhNE
	cwOcMry/9OM+0td0GalyIbOnEhsKyDcZAQUarVHs1R68nu/YXeCnPxigRMycyK5l
	Qcpt7x6lMDj1dMavAqcbSBDjsIY6zlVVAfEiKb/nCuFlnloeAmkoEDHO0c+AOlqW
	n6Tx4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhdp87qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:18:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so20886985ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785331092; x=1785935892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSZgLj+Ip0LSbqJ1NOO0qNpuI5sLT/x8UbtxND0+jgQ=;
        b=F+Of4ZSXUgAPPPLw/3AOkT8X+wSCHfZ1tm+IIp0fds+NDRjjNrHuHC8adzV2Bg8+AT
         rtnV5K9r6dHCT6TvuOYngq396tAlHLZo/iJ+gIg4F3Njn8R3V5YwSkUmT0gaJZa2NysV
         m+vAqSRcnUp40uI4W8Lgta/ocPGyhyB2KGD0IHAXTMzQ+U/jDN7wVMHcXP08yhr3wKcb
         0xL4BsgZhZ2sHpSb/k9nb3Xr43nxOH0v9lwmwG9KTrcTRkSeenvs8qjcNIBNN9Jb30W1
         8BydKngw4j2luOkxsS2+M87I3zdjE7uvmM/5kV8qSRdCrFpc50Tpj4UB+2KMsO5bb5TW
         wePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331092; x=1785935892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSZgLj+Ip0LSbqJ1NOO0qNpuI5sLT/x8UbtxND0+jgQ=;
        b=cQ04gee82rcZyseYWzhQKe0Qb5bMr03EaRkVYLqz0rpl7vRk3Ki23s6POL/OpRoR2n
         nuFXbVeyjG1Tw6FHISUr6y03vLQ6DOedfrKrugMmX4GYXiYiny4CtzSZ6VJblAWMwpmG
         +n0RFeXdVhEgOLNZiCUdK4ccco0VelwRdT4LFRaqJ3HNUz5trTpDLnOg5ZMLqXDAq7za
         3WWEH7brqRQI6toqQEVO//257RVGAGDV3o86m41OCDQ1TazQ+Ne6QKQivQZVd8cLSRFD
         vmQV42hiXakbcJmqOZpZTvZsDjF8Yk48lAafjeEB+RU8xVkIhBtDseAtyJ9aYyTkwxY+
         E6ew==
X-Gm-Message-State: AOJu0YymaWovlQua8fzZ8EDdYx0H0DwYuPBzaHZl8lDfjHFqNfgGEut9
	hIm/BT8+YlHXCH2d6aK8Tv0EGXUMTLpwAjhz66Hy10CwNpdZsmYVBnUMa02g9cnUZnyiP4YXcWm
	OuhGE5sp7k3yOPqvL68/3uaKyIFt5UAL6W/SndXk2vcqSHF6IiNbDd18Trt7hwntsbuuY
X-Gm-Gg: AR+sD12nAekLqEbV7OGWk+KTL3vgcliui5yiGVlUPszaoCXQv75F1OZmG9sPZRIFmeV
	dEj3f1En6zqqZVl4GBA2gc1MlcfThiZUWq0bitv6jMEOT3hbVI+aLAmnHR1weySwPpCUuivsRb+
	KPKNiGffdOqsvxQP8T1BDZOTQy/1LT29fAqqzoRWN4aXQ5T5gK3qVlxXDTZga+1XTR02gWjbPv1
	GGTnUnTrMDaFvPJWXUcTDmWyPbFVP6zsOUwVc9dxGlXoGB1pckpqNOfoU79brMWzQNIzLfG4YpC
	LfvOe1I2zP/aGGPICDZMtFJNt8h3ogsBEQFRuANOFKyUSPpZK4Mv2wjWowRLKNrV2LPSkuozsC3
	zk417o1erLFxkFtdsiTUPou1gQoQYjd/lSVagvvCgUYsiEP87NUtBV2fJK68uevSM
X-Received: by 2002:a17:902:ce05:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d015c3e0bbmr83911425ad.11.1785331091974;
        Wed, 29 Jul 2026 06:18:11 -0700 (PDT)
X-Received: by 2002:a17:902:ce05:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d015c3e0bbmr83911025ad.11.1785331091552;
        Wed, 29 Jul 2026 06:18:11 -0700 (PDT)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c4090fsm11131425ad.80.2026.07.29.06.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:18:11 -0700 (PDT)
Message-ID: <5215ceda-0f13-44ce-93ef-41985979ce7f@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:18:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for
 fixed clocks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
 <c08192fb-7d5a-43b5-93ce-f17c5a0b3cb1@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <c08192fb-7d5a-43b5-93ce-f17c5a0b3cb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z0_hDWc6o-_5DQn0eZFvG-r6SYYLfuc_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExMCBTYWx0ZWRfXzLCiCe40IpYl
 T9XIEYOXtmqIcyl460rRD9xJ/QgofFaFvpldBC1xSbL1vgAFMQc6DEbjTH3H/iZj8pWW+EhSXZ3
 pu+3HSrWOT7X55WlNNTGp1Hh7wT4UJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExMCBTYWx0ZWRfX89uhPV7qy/UA
 chOBo7Yid0akvt66ist9lM2tt5a2eCrQhOp6DgD2SNchyIiCObzzaY+AVkGo/+/HTO2hg2NVfZ4
 f4v5Hb5hGAPmgO07lwcFJ08ft7eQGlriFCwSZoMZTUX+MIJKDj15WvzT1Ox42ip67xg3VP0tz0f
 Nsal9V/iFqgahwUJ3ZXEKHXnK/tdW/r+5tJzkW2gqIP4wYNXa4DZX6lq3DixvO4RGL54tTXYa0p
 wfVs6/+dHbZ2oR09z9Cz5Yic2+aSj1U01m8ms+byc9waRXRB4DwBlWX+KRJb4jeCpOhW0qEIBEn
 ZjDGPJoff8CMJ8ewQhLWPJ6mUvII+7U442nyE45XayUUCnvGlBUvX7i38CmIkEYSzq8lDSyRbWh
 BSjxXy355iR0Gg6+UNG22+gIdS5DLHsN5WkLrXzRiTpDPo7dXO7ormtqZ0wO86O2cozGLS7a00G
 vJwRln9UP7ko3VNynCw==
X-Proofpoint-ORIG-GUID: z0_hDWc6o-_5DQn0eZFvG-r6SYYLfuc_
X-Authority-Analysis: v=2.4 cv=TPF1jVla c=1 sm=1 tr=0 ts=6a69fd94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4OnM024n7VW8eM1T7MUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290110



On 7/28/2026 5:32 PM, Konrad Dybcio wrote:
> On 7/24/26 5:00 PM, Luo Jie wrote:
>> Some CMN PLL output clocks require a hardware gate in addition to a
>> fixed rate. The gate control bits reside in the register
>> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered as a
>> composite clock combining a clk_fixed_rate provider with a clk_gate.
> 
> Would toggling this register in .enable/.disable not be good enough?
> Do we need to register a separate gate?
> 
> Konrad

Yes. Toggling the bit directly in custom .enable/.disable is simpler and
more consistent with the rest of this driver (every other clock here
uses regmap). Will switch to a single clk_hw with hand-written
.enable/.disable/.is_enabled/.recalc_rate ops on
CMN_PLL_OUTPUT_RELATED_1.
