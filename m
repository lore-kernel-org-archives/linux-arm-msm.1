Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FAC4E80B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561655; cv=none; b=tVmQy4bwI9Z6UW0wZPmudih7kt0kHfw4GTbqyFCNyKBRZMrOey9x8AhJTih4TPXQzJKgiqnPicNqOXZJ3S1NqwR2femlvNRb9RVzHZP312g1X73w66TVlAIUMVAMcoO4V0Ls3VI4nPK9Ss+UfG01/Pu0/X4tng1j+KCRzNk5LYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561655; c=relaxed/simple;
	bh=ZEcUcshear5LPgt8z8TEQgEtqWzLXrp6HEezPRLIBuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2q1WcjsSI5Ge6yIfJ3UUmbPqHCF5pl/IWXEFvvrQ1xowlcTgke39jyDbmEdL6sDeGgPQQ6o8YZk7jp+WD0U1bvW45iDLnvKXtdnJ+lXoY/QmshPEvB/RteA4FEopJpmbIQG+01G/t3ZQ6gszWD2w3bvN/Nm0fnIEKxNqmU2tN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZ/TR7gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPd8cpRH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZ/TR7gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPd8cpRH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92eOu2348103
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=; b=RZ/TR7gl3V8/2b4K
	B89G+uiqpZFq3UIORmHAX33uLUsXXjjVni6syzLCOBk287w6Q+tivWOz4QyBNmIp
	YkR+LmDrN9DibPMb77FNxalS/7ixBu20i+RRyb/CHu7S0tTq1q0Zk5AW20qMEsTE
	WdVBXqrHN+5qi7MDOh1wl3/vLoqG6o9GnV3q9svVMkViNtS07OQplK2magHrdsGZ
	OpJlFEx5w/0VTqbEDaMe2pFWaCXD+7Ms3lNogxWO3nPE1KkN3EOwSICbUPU7zYHu
	wdpXGXzpcvXFyaRQCCLDDZEcPOSZDWaopqy8r9Gj7NX3XlakRIYhxT5FR4ub0lPB
	MJDgdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywb75s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:27:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d0caso86148485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789561648; x=1790166448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=fPd8cpRHvQndCsX8ORekkMFZGhvBYuCVn2SwFSWjivVEPaDF6hulVoLKYvoP6v110A
         fu6u6lInskMKjzkxdu7KpvczrKGwpVxepTLuA8weunxkgI8IuhnkS4RMot4fY2L5TfP9
         OQwy+8RjA53X3IzUBEd1jAwpL6x866Nfw5xNmxz43nGVCnIfgrExXdrxs1UHCHoQCydG
         LABDtdclW522TQEmDN2m7/CEZ3jquvayqHvYKXL7u67JjYp4i85Jqa6Kx/fwIekKLbsL
         nePsEPtLKYh7tmCmhdlCOEvZHMrZpCskJnWUfD8OryizrxtcYU+CwGwMs6S9I2zHqlFK
         K2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789561648; x=1790166448;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0jia/Qee46Ll8brkm8aJP8twbg4qWS9nR+j1ou7EFs=;
        b=j2l0a+uJFCQtqeL4+LidCZHu2LOAcXCjMZIIwgXuhVc1bcriZ7oFqlIHKEB1FBWfYB
         pE88pmRr+x+fyFIl+PNnxGPCFv0AJaS2I8Ih6Q+XAQr/Eo46XX+/IeubZND7yceN34dr
         g1pvGRb9pqtONLN1R8QOOm6Ub96OYYj1FdPx58npKmU5nbhvzdO4Z53i/4aLdsYh6KiP
         UehsP/5B5iCk7Y5NaC4U84751dniKmFR7pPNoRxOYk892Umf0r/4SqabGXtDUrgEwWlV
         peS/8TlZQpgyhe7oN/ld5D8BYR+Rw6N/AvL5UTozif5EdPkyR44ASZBleHfae+pD0McS
         lzpA==
X-Gm-Message-State: AFuF++ktzUU+OJR1EPKZZ4UrX8Hbl8M5XIgNNmgzyG0rSsSggvz/tIUj
	9eEN2SxxJA63VaoXSdRr9MhGQgYG15PcwxKbx/6ylAfz8/3pX3/2EgQmV+CSsHHXgUnO5DQYXz+
	DPWJZLU81avR65L11mTyAwS4/8MZpBH8lk/wqwBUoRqkXAyz8tuNdTbHXocIg68EcTwEL
X-Gm-Gg: AYBFou2M8V/H6s45zuZcU1PKHht0I0MgIQbRuqCjK1eAe8HHZvajdSYusUwAWB0f3b0
	YniAJ/bSAJYjSXCDNcKlupLt/48NIZeTdZK8yw01AskZgxb9xkZTc18ykrVpBWze5wB/u0HAjhz
	9TDjdmrzcYUV4OkExAvjM7yKDva1u7prQsCKwtHBooTc/EXZfEX2D0P5QB3eftHTWd7n4tvj0v4
	GntUhnNstjRb0++7zM1c/YHoCdzkrdDIUSgBCyX8n1Lfy0xtRk8xroBvMCxxc5groNSS1mAbVnd
	0d22BLHnk+VEqksmTHz8wFCchiLwZgADOA5zC/8KsHRIiFOHkwaPUrtAwlt5xe343ZgGFaeYOyf
	o+keVscRJbEQ52QkieYc8Kw==
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300220285a.2.1789561647708;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
X-Received: by 2002:a05:620a:25c6:b0:939:48e9:51a1 with SMTP id af79cd13be357-93bb7738f0dmr300217285a.2.1789561647302;
        Wed, 16 Sep 2026 05:27:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de082ac7sm124957166b.7.2026.09.16.05.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:27:26 -0700 (PDT)
Message-ID: <260ee81a-e900-4f84-a757-04747f990e21@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -fJLVebcoaTNFjxIBSdsXbjl67P6nB_B
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa8b30 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0ETrVkJFHnd_pK7WGEcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX4PT5FViICvLe
 zHXgLsQ8ySdodm/AeYYefI+KRmsnxDELnfax/lisurmQe0N0/iNwWSF3YPgZeWMq5/T90a8zxkr
 sFNRb/gFSjHr+xT/J7yzFVH6An6kBA9XIVJhjAFqWrxD4rGxvwrbRP33owT2opqkGCHq6lB0nZt
 bJSM/bq8nN6oJIZtEphoH+XrdudrXA+tUfVbtoDWz/3YwPUqRyLP4KxYOirduvmPajUoWBln5N8
 CkNrhWh8RGc47R5ca41jtVkjvvBoNnb4qlE2eDlS6/TzBX7NHZVMd15nt+5adXwrGwP8kOLQhD5
 7SozrQRy8Ip/xW24cNY/yfewqde3pzvW9DsXp7eAie3zCl2FFD0sCRJjnunccC5YLsFT1D0Z8ES
 5ZSPdlGda4Ic1XY51VVlO+K7zrb6PGrukG14b9SsEp/cwtZnLOWb1xzFHBDwxV12HM/mEGH3EEV
 Elfd+Q8/7eRlWQxT+eg==
X-Proofpoint-ORIG-GUID: -fJLVebcoaTNFjxIBSdsXbjl67P6nB_B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE2NSBTYWx0ZWRfX4G8wojNLvqw7
 e+Le5e/B/Jf+yV6HIw5HbeXpJ+mN4m1Zx1tdF34vDxnJuo2kdHZ3iITHSsUzcESspD2pXZQljJt
 TR3BecvXt77g+veZ3i9AsUa4Dgr4iI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160165

On 9/16/26 12:01 PM, Abel Vesa wrote:
> According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
> Drop the extra zero, otherwise we land outside of regmap range.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
