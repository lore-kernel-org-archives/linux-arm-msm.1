Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475823F20E8
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323130; cv=none; b=LtUoGgLcxY0BZ2YhyPBn5ylim7itVP3XGMc8Bnqn7zNFslJtEEg9M9qddWjnyBjulcdN18F4CenE8jj2Tww48F1hwo3FKO5H1Sz0JEG317uptDwhtJlYpAgsh8amzXfGRQhIH0sBCbGd0JjyYdhW4w6hul6/TPbKywj+1TV1Ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323130; c=relaxed/simple;
	bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrXjJ37lGA7XMnn5ObEUH1PgtUUDh4HoTcK3J7cQkNDwy5oBbCxID2QDZDBMXIcKhscJA5hfGFaQcGhFglHPt7JkcLsOyZAVhpskvK0vGPq9etteRY6cCs7P/UfUFexonh+ZAoQ1PRDYDu8VIrKDVRdbUrEq8C3HVvf7CAvsaOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXzsa0uU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFLaQCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXzsa0uU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFLaQCC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2cZM1929152
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=; b=OXzsa0uUzmnGTHWJ
	qBb/Z9En1hErNvPa27MbhBehPpd1chczwOEhGe9Cd09UhFLt7xgC4t7sKDdyD3ww
	L/vztegtDAyUGrocifthsRChiR6Yo88SAMe7ud6VzqFOJPEpI3p7CXeCgDUJPi0D
	t3dCxzukefTVi4fljz6/RHUoT/ztOmTvPFXDEBmS2OoqNRyH9ECDfm2m5SiIUvvS
	KEAkLJZqzAPEN1qa7zjWfGmCVrk9JYBlfJwxjLVmE4+lr7eGWaIUWVZFYlBQkwxa
	zZpQGuOou1MoKfLj5Gd202+bb6AAPGY4oqtTnNCvcd3Zz5xLf5cwv+AyLfmShENV
	S4ODTw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3w7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:11:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86e8cf017ebso231355b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789323111; x=1789927911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=ZKFLaQCCE9aAgihJpxyRRvqXwJP0tROC+nLePw0pe8WBagAPKdZML8kWliWat1LAkv
         cKpbfJwRJ/AjirhcQml5yqOJ6nazAo3/tcUqukQ13gMx+vSOYRihpiSRh0RQ5DZDFt96
         ndB2/Oci3rjkS7jr1Z5ovPmj98GpCWmH051P/mymvB141pKmjmO0W3bseacLTWjW4Xad
         DHB1v85Pd++Bwohbc0tVZ83EBd2Ry1r7ApN25m356tDCQ34n6uncaCDTQcpwsoWzRuVb
         gfOcHsX3MxGGUV9eoSAiKCW8pXLOltIN2gh6RZ6LC6u+LYOd+dPeSVxIVMibigxPzaR2
         WuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789323111; x=1789927911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWJrlW1a0acCp0JjlfqoSDhCqt2s5CvuoidMsbBFYHU=;
        b=KuS/GgQL75bG5vCcGstcMdXg3y5vAG4GLqB/Wfxezudv9Nkql8rFjsU+Z57zmrkp4I
         dL7/or2lhQXbaKFOC73NRw388ywUAwFpWRHTK61JLws8cW7CpW21SvhQNTOJ9QQIBeeO
         eUcP+dLoay7d+XrBZoZGxVosuSiI2jDzNAJjwOVBlASSV3mVwSj+Y/XdxzSN1rF5M2fU
         PoMggRUsz2oNouEpK0htavZ4EJ/o1aCF6vRDEl+QPyMZNw5YTWlVzMmwSZwoelYSqofn
         fFs9BkLUB0t0OXAmX2FynTN4yNIBOKG1wmWWFmS9nNxyBD+LjFfBGL8XZbLX73j+JIS9
         F/6g==
X-Gm-Message-State: AFuF++lFoEe8w6LDs6uK+6nZT+E55yGj5ErUXeGdiKQj5OXlj/sap3C3
	PFTGwKRr9P9SbKLsmy8sG6G7MbzhivUJ7O9jBuJDh16MARXvMTwErCTagoycGHhy/HUhMBwnFWM
	njMGm83WlsXaKbIv/UCxNCQDhxO9k5boH2+1yfbzxV4+nx8r7Gzq+wLHRtr3XCJ8xaKFc
X-Gm-Gg: AYBFou0vmh7MvP4d7HIV78NiIy/bfqdJHYRoWh8Lu0k7QCuwuEXbJxJl7z3V3xr4FyC
	xIFHy40LvnFgAqQiFrQ/QW8GCv1sowxhof1O+js3OSpEjCn+T6ebt1NuivtQud+F9OaA71A1H70
	yR1bjstmqLPz77bwNACUe1aVzTG7Qkk5DUBemxDCQecs+16JtDEwGj031F+8+2WfTjaRhH3LaMG
	hqqEMwgFvzSPoJJydqciQn+gmtsIqmgsEYk5MsPfbVZZxlP5ZgjM4F9bds0fWUzJ3QayZpqWQkK
	NOmAGZMzQ5iGTRD1kggJ75x0SHN5opRP/IvskaOt4T2o6CPqt5L9uDgt3RXbrZXpAEcrt0Z6Rqs
	ARYw7rXFs8MvAo5AkL3qhg0Q2sNST0Ng=
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346671637.0.1789323111177;
        Sun, 13 Sep 2026 11:11:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f96:b0:3cd:9dea:2be1 with SMTP id adf61e73a8af0-3daecb20df1mr25346619637.0.1789323110768;
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.234.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bac1c716csm20983985eec.2.2026.09.13.11.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 11:11:50 -0700 (PDT)
Message-ID: <831b7702-07ca-413a-b2e5-5be2b8401ba2@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 23:41:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
 <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-3-3825351f9740@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6e767 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=1XLMJXld7+1tWuaUSnCLHA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5Q0izQ4MgAGUw91kEtEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX4faDAKVZ50+S
 4JSV5+0In8q+VrHpBS/r2vmhRYu4WzkUfBkqWfjAuF5ffrI14wdggCqpzsg1/5t4UegzRq57q3n
 RO/CKt6PxVBbPORVFSqoe1FtnBRB3k53SSLxnsMAMqtTmO+GMHJX5Cdskp6hGltp76JVsdTkjfe
 sREDdxuFFEbQc/nHdwi/qBWdJkoZPirP2DOmJcV5VAB8NvJ11K7K8uzAPnWlj5l89QfFFfIKF1n
 geGfAyFpYsQCVFhp1CFnX+QfQqzKsq1BCbxRED9DwfjQ4DL5m8sqITa3lbE1UROGdarefdDZ73j
 3cqSn8bY4Yjg8ma15/lJf7ydy+h3nrzk6tlPkzfeHX4bKFnymUeXx/6s6jcbh78wtSEhe3CqFvj
 1DopmgGj8iY/uXxTMgY1IT9two4vsH/4H0dtmjPgObIGXFA/I39lmp64Xc2PvXAY62zDTdaFL4K
 qEoewYppry2JlyFTIfg==
X-Proofpoint-ORIG-GUID: vTGjHDIydowV6DvRrRr18Vs1vpDxuqWy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI1NyBTYWx0ZWRfX+JNpNVLixF4u
 ybGTl84lqtl3Yrd2kLw2emSaqAq4V8/vSkLfDSLPTtzbNBLVPxoQZwYxF4ZjmI2j542OQWkiqFF
 LQnAJ975RJc2KU/QN1zytUMM1Zn0MIk=
X-Proofpoint-GUID: vTGjHDIydowV6DvRrRr18Vs1vpDxuqWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130257

On 9/7/2026 7:17 PM, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
>
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
>
> Keep "qcom,rpm-stats" as fallback compatible.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
