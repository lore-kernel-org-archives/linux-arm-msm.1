Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E964D2C11D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205228; cv=none; b=oF25a3ihIvetnIVsGz9PhjhmJWZ1rBb+jDZJx4oxSgpQ52F6tlJ17KHBVkNMVSUriTtqml5PfVMs6aTiHZ2BQN1/F2FGDYVocta7bjuiZI15bIT/gg915YkU+D/sKHwtu+pyrQ2IUbPFYmmVv4o1kVOa1PsK6lEqg22MCTr1pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205228; c=relaxed/simple;
	bh=dyay5f0mLFWdR33p9X89+nx9+9xAzz6YoEh9yFD9SV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFx5O+c4kho9r2pYDI9/tOvgbaNfJESvEg/9uiOfjdLjrXMH9YcrqQPC95yekY5LqjVWt910yTbiv4ocP1p5v6BcjHm2KnNWnwg+jrvrwiEI1TwzXj34D2tWGlMSPIvnT+FxyhYFuhoLAPjFu7AEVSdY4W9I7JbwJOTcX5Qj0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSinCYV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmMtgsE4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSinCYV3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmMtgsE4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0kvH61380256
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=; b=VSinCYV3WGdviCXC
	4T6ZAl5h3UHaJ1/rFoB9KRL9x67o9R+07SmjlGAEVU5/DAv7RnIYlFIEG2qMwsBz
	mt9erWBDiExTAb/wf5Kv6uxF8Oaztu/BYr/MG3bQLfeAPj+DdoDXJy97l8ZVIven
	EJIU9ErSQeBLuT8QItASdZvsrAddMnp8P1L3XDh+80lPhJBSd4MAucpyM/8KGVyT
	ALa6Pkw30AS1r+Bh3x+hS7Zh6mtJ7ZBikLl0LwDkHbRfFArfgDyVK6G7TUTmwPOj
	+JbUHY+dQAOOHYt9vLS1F7fy5js4ME2MxW07suwxRwTdlt3FzSpBujhES37xQu2A
	5xoFJQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrv038-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:20:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso91386095ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785205225; x=1785810025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=hmMtgsE4oyNQhwzNCZFyyjHkuImEgU9mlwA5IIQzoOV2TJZqvBvvM//Wc38TxmJSan
         Z3bsWaS3lvWQJY2KeoCR3yuLUjNvSQloP8F3xWGy05qUskHVY+vQzOPrZ+QmkWbNW+nF
         kQfUZUcmE5X2f04w2nOupaSA5R18QPwxRNn803veZSc7B0GeWJ/1c5q3idWRN+AsyOBm
         bn0cdarePw8qGkQ78WCUg/CAb1pIH6wdRAREax0b9gyQM6u5HVUjwu5tQQ3YAXbwPIZe
         Iu6C0clBo2nSN0gTXYPJDL9VgfhzG3Eg5rgvDrJ/ogyslLXeDdu6KbQJpDPXxAeLmT35
         NBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785205225; x=1785810025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=gmM9b/IYCEBtocKTa7uufo8hzCTOKWYKQ8Suk+twBk9iJXr8iJI4HJO8BADXtXW8PV
         5PFoWC9Ufe4FZ1xttYspFnzciVl+xCPGaOOLvIPc0/CF8ivWHhRv4wqWf0MthksYQzg4
         hJJT/PGgAjWywc0EVa39lmiS3DtIVrFAMuJmvRPc64xgnoXP9uph7ppUcgBgnoaHLRIp
         LVWsTDbikzofQAW/d1Jkf0M6BGxHZuRXP4T1LJZ7eNBgFE//w01vAU2GaLy7QZGfYygy
         bW1DGnGHIaodmc+uB0al56pKCs5dvzpGL8+D/PbaO7AOoMIfEfBd/Y0lnNjo//RTfRA8
         eTXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9NQZRdHv1tOdDJl+UznXk5ypYBOJGgHDxMMBJ85GcHY5ieoil3yqdQnb5NOj5mYwd7LpSgUMtINsOf5Q4@vger.kernel.org
X-Gm-Message-State: AOJu0YzJyutuGyFtb7ZUuiZzMKsjN+AN/5xKIyBz7r36v079Y4E1MkhI
	9fBfC5xZewEcb4+QfC7Kwj40f8ZFeHP1+6Un8PjZEO+0PlTiN7zEw44cDwY402ajoHrDgrPDUkV
	FJdTIyCnjE/FF3XWt8Ana9WX90bduwBp/sPMZVkzoR2B/oNE7H/TE3s6XtElngQswKgEV
X-Gm-Gg: AR+sD12VON6VhZvgMNMRReQpsCDfiuNEke/asJ+4OJbo33qNkAph2+ymTjlptZiM8k5
	bxZJUiEEWpm6o7X3Sm3LwqecldxCFUXdJML51XkhI71ZPkUtpy2BrO2n5y2vQGOMMHyEPKIy39r
	QtzzQEqksLuAad99rZMJnn1mffP1KejD7OoxYVd413Zc3jirvsV1SacZmvVeii0OCek4b2Ze5JQ
	FidYcv7noTTaKa6kwi9PBPul744KrkVK1sjNJpDJHqB72yvNMbR7LxrBo36ockrAtLasw9lA6qf
	VTmnYTgLpSg4cWYfkfXnJ0eseHnUwAmOkWODbBMYGPs2p0bz+G9BPaMz2g0wxjgP3bpLGYt1RE/
	qU50jKXplf6VU6suMNkCBPVaObLlvY3CfyqGUe2ITS6N0KpSy1IePfCYy5os6KvBlnw==
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178705ad.34.1785205224854;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178315ad.34.1785205224408;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdcdsm43957695ad.49.2026.07.27.19.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 19:20:23 -0700 (PDT)
Message-ID: <603ce64b-374a-4d69-83d2-6387b55a5991@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:20:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
 <amOMPmn1fBE1gGoe@redhat.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <amOMPmn1fBE1gGoe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfX9FIwmm9Nqrcq
 dWxtHaXs3bFaUaNw9RWHyOZvtP4FwabOcsELQEMJx9ndrrUKOGiuwx7xHAHQpwNG3EO6BpmDwU5
 8uNqwEf0RqCHNGK9YUwq0jv5Y065L68=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a6811e9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=Y8BVQNzp0A0Au5e0V84A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: LGLi8iOghEAZAvMcL-MNzSTg2GHBtKsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfX0oHP5IaddcXA
 Mlf+jgghOzGvcUWklNrIGu91EE+5iKKsC8IXEU3TySlrflAuXjuF4Rce7l6AWvcA1mXC49qMFzI
 cwdnpfpTsnMO1H3N1EF6bfn77G/4/3uB7cMCVcKkHYcnnPHstscgGHMJSKuXBULbBmwQxCZGyvR
 c3LU6AHy/DL+URCNLHbK5ZSYmlTHIKv13+SfS1/Qzpn70PCjmicwFhnsTefh9Utaf5BbX8Y302u
 sae97JApeop3YFP3EScidJr1JcR6iiZpifBf8pN8s1UFU4tBuQt4g1LkbpuMI2FMCd0rPETGXbu
 v1JhHM9QZ9xzho5SeWgL85wEJQs/xqmaB9IpQD++vGcQztXiTnm5nR4omv3BlhdmYCB0/XTalUB
 CJS9cBgGheDZhq6RHgYzDebDUj5mwshgq+cpUZNfWJV5F2ZqQthPhXDPbHaSjbQyD0AJ6z0Sct7
 XHoRnMlnJ43FjGm6hsw==
X-Proofpoint-ORIG-GUID: LGLi8iOghEAZAvMcL-MNzSTg2GHBtKsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280018



On 7/25/2026 12:01 AM, Brian Masney wrote:
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> FYI there's a separate series for the UltraRISC DP1000 SoC to export
> this same symbol. It depends on which series Stephen merges first gets
> in.

Thanks for the review, Brian!

Noted on the UltraRISC DP1000 series. I'll keep an eye on it. If that
series gets merged first, I'll rebase and update this patch.
