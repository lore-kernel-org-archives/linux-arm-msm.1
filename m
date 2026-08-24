Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C583F0AAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562686; cv=none; b=V25Trb2Y+3BzJS89dOruUGY3ibVqbyoAkDZUzzuyD3rEcK46EZ2y0cBg2ETsCgQ43e4aamGeI4pkoq3bUo+4M78UIq2hLqBoK8AkO0+L+IbzWUoet5TKhXyn1Pare1Mop+o1icw8EDfF2dqLnsMXeRPvLD0LwD2PDKiEgaj2Voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562686; c=relaxed/simple;
	bh=g0dFoOoOVkLQ9cnrGuwvqmwMtmuK/m38bMawr/UsO4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZWfkYFDD3z+ASJz6udtrMob058NJCEMAXAqhaTI4N+Rqr1a6q8gZCJmJKKM1y1ACSXiJ+gOLsQVe1gnomNHNF67FvWXVMAHAJu7a/bxn2sXWpycExLD4h38ouhYfimreNp0nPYKektSCAA5K3AOmtzvDPLe5muLPRRT5DiVLxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaYVUmNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvTzEd5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaYVUmNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvTzEd5u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99EIS1981809
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=; b=iaYVUmNCqcLDebGP
	ipwIrHMOOqCojuznR4LJz5oa3/Sq6NPMpRhVof+RFp9XRXwEPAxTcdEk3yVtbcW5
	rlUwaEd4p7OQqliua7K+JVMSV+hmljHnz5hF4cVWRwSobql8yqNmVbIotQs//hyU
	MHQ/eWlB1cZ28CUAvoECWiJjwkRivFGWn1Wr6gDnTuHzV/tQEfC5Qtd6npeNQz4l
	/1PjYFAoCHA82kFljVPQTM7dE+7MNPt7nV6UbzA2evbZmaganAqoViz0AW/x/ugm
	NwLeQzwhJI8M41+edMAksiwTl0t4mrHe7Cnq/hJIHHELl+EwzDrpzbvNmPHLhL4S
	Zw7a7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g7528p63m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so7341111cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562683; x=1788167483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=cvTzEd5uJg1jNG14v/zB8BSijDelh69Y1u96UTDzALml1uDwY5Ep82BlB81T8t8vWr
         mv+mudDhnhWqPSJXixnSQZ3mPhKp2J6oxjLIvyR7R+XvHQ8ae96OQ/iAgAZl4udSZVuv
         IjDMf/ZlNTt5upJJDdkJqzjKtaSjGHZjqs3/tGde/w7PWr3GuEjKZ5Zdd9Bj2Z6n3h5v
         RH8WouFaOjeq+057e93Zn4yvxr8N2Skq12BrGCMhxHj380UoWAlYdi51MGJWK3bu7mRp
         vYkZqCHidtkPFEOldZKPmf76SSp5c9wnj0SrnLcEyVUAUH9NicwIuo+j/gBtRy6W1Exz
         KLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562683; x=1788167483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=q9GIJtDOfiAPBq4W5EGnJ5GNn9J7o6ufwprhjPq8NRNmdPMTvXdjQ97hmCHXdMcs4x
         CgGK+OmazGYqRkDCXZZfA0O76MTEVh/pB/H0hhx3Xdzlz9R60idjcmGpqI2e0NFR8o4E
         x5cL5OXZ9oalUiBY05PZhRnYtjoib98loVCU/92QT3Ht4IbE1lgWXJxsRTXmBMPLsH9g
         ka4wNRv8afpKclTrBJCSrHbfYeDKSnKgoOB2T6IEFQeWZ51GtMnAtl9FYXIDzP4o+ACS
         cLQFm5Jyfv5GafR1ZNYSbEINsVQZ2ONmfjyUChr3ToTEUrybVQib1iDYGM0WiZtyW1ae
         6ECw==
X-Forwarded-Encrypted: i=1; AHgh+RqpzPn4eaZQc/PFAEIqEorld8XuLQkB9g29iq4YnvXawQQMO2zbNkp78imzt2079wJrRzzNWOVkk35tJMoD@vger.kernel.org
X-Gm-Message-State: AFuF++l0QpHI+qih8muCy9DpqQbXKpHkWfggErpLyUPb23pr3+HZhg6U
	RiHRq1vPp0TzsabmpObe+fML42No4+DIeb/byutsgMYTEI6MA7oURM9hyXB9McxzrSw1BrgSyyZ
	E+15buN7ths5ZgR7rSaZPUTenJ7gQmZsBzGDiylN8nyPjhVfEtX9MOK22SX4E+II+Hi7P
X-Gm-Gg: AR+sD107AveKOM/wLzFRw8cmvn0OtGK4drlE88L/ifZOmpUZNIeZdBsChctIq3/Rsyx
	eM5sakwKZXUa2zulIRH9mHraSinKENKQxTTBhVHX1g6SSPW3IDMqPt4iYwS1Klv6LT3VzIMZkmy
	onWp2H4gBX4F5FoE3mlLWGgN3nykVReGLvLUA+DBo59iPnS5wvApsvb0Uu8FbFFE9aSSr+TZRbD
	QA7DvRCgSQW8/piezvirF5uCayyz2To5CGi7C2Y/Oj8ZLpDt2jp6lI2IjeJTGYES0ifHXDUgmBj
	kXR/B2aUq/ANrLXR+pgY1xtN0X9wTUl26tEMMSbpe2TY8xBy+6Kr02aPaOCrISAE0xd+9FRtNCO
	Tbt2NeQ0trlA2GhHoLqc82P0f
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666941cf.0.1787562683551;
        Mon, 24 Aug 2026 02:11:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666351cf.0.1787562682994;
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1117153366b.48.2026.08.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Message-ID: <f065ddd7-a04e-424b-92bb-24435f1803b2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
 <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DsJmPm/+ c=1 sm=1 tr=0 ts=6a8c0abc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oRK5wSY2C-ChLMD65FwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PrOBKTYz227a4rZuOTXOy33JJwD-Tutp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX0lG93KhI+NYF
 MDOPDxipWVdn+g0eatZ2EmQk9xemb/ffnjHuCXlNBig2mGsSM6YIrYJP3izsm6//K3AdUiZVB0u
 SqS3f2vPGFv2wpzuepxlx5M+5/CEDRUl/tIFQszIrnCwL7hC+UVXootrScAxgxUfaYiascGLTiR
 otMAvOghVReo7gHSI1M2VkisfGT937oepX+EchHrmxUOw8s02Wgmq8H4+NR4lJQgL+5Ur0Bpx0j
 PKOcLJ5DC/ZJO2vG59JWC0gSaRZSMuvZCVldCEt3fUKntFWCz5WBdGr6V27+ohvI1K+UTJN8PIc
 zka0e+qIzkjiTYDvfi+pqjgwM9Ik7aNSFM7Z1bZ4D3w8XuMty5Zc5KQY8Upm9wcUnnWyV02ApHX
 eQQ+m/n1exEbMja4+a/0qibOrMD7bHk9FOwqNOuYWzQEGXqnuJPa5305nPfh9fncidKrhVgG8dr
 t3F2HHwm4u97vPpAPrg==
X-Proofpoint-ORIG-GUID: PrOBKTYz227a4rZuOTXOy33JJwD-Tutp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXwGZ4ApONKvOg
 BrK38M7rQrJ5Rg+XmD01W8DZuQlxU2gS96KPlEe0TPso4xm1AstLvs2f56JCbtoCYdFJXq4kTff
 /go4uF+rvOSkIN9EDXtQLxPs5iVHgCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/19/26 5:25 PM, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
