Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1F489870
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411657; cv=none; b=nxdvIMXb9xntkCJvTv2G5TUxlQq5j1x3ei4Q2ObOPMnYVEaamoOM8RCDK4J++A1UGuAUm+gUWFwfVXXBzMo1WRMf6Y3sK+JR35zgxmku9xpc7GOAKRY0cegVDo/m+QjHPDoawyjKUDqFAtBLdX/KKQMXU/Ihj8nu751qCfuh4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411657; c=relaxed/simple;
	bh=E90X3ep0AiMbcW0W2G3xXc3pPnZv3CiuTrXLSl+7Zz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofx8BQAs8Gyxt2ubso83ySdRACgzKQszcc/FxIjt0vh2rYboeVROGB/XQHuV83hQu2wAxplQcG14bT5BVCwRHMexvBoyovZJRCkyeKHgsAomPHG5+DBiY1qxdUXo2hZHTx2QBahs10UAur/xVDY/Aksd7+r9vvObTAFq7GYkSps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTcqvxqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBf+g9TD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTcqvxqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBf+g9TD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA2WDW4191290
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=; b=kTcqvxqkpsj7/gVD
	7f9anPfrJGNUmmV4HYi/FgLSMWMAlHgiUbdvexC1ZHcvxwKwQ5nVymin2moR8hoO
	qCX4vB//H/HxcwNh4BOrTGkJGnSQaTm65urtbiYG7XeK3NfiWw8weWBQU8e/NYjn
	LsCPlgQ8D70U9me2tdVwBWhIelems6f+PjwV/AsuiwPVP95f9iOykNqlz/SjLoXQ
	1nv26DfC45bA45ccGanNpvaxRAF0KVkYNyyWhUGtAzqSc5oah8p2MWs34xJHM821
	NVprldkXygx+d5AmaSMWfAlOa2GfCNJ9yeBup++E3/gQ8iwUolWNRu1ZabSroAvr
	sXlD5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3tygk4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:40:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce756aa72eso5947965ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411655; x=1786016455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=;
        b=fBf+g9TD/MPpiWF1lI3jJyPMAzFexJGZCwfVt//5T7bdF9RvONLUaNaMYvpjj9OVhJ
         Vydj5HxiVc3+8s7BiAqcgiPRbnrfSsIYFshjtvLFz68+cJ++RJ55kyCSbHG4C+TM6LpI
         zIWSUOaSp+D2ICtPmS1EWPdEFTgmYXTrEDdJAuUP9VX9kAYMn5QQbCHetdDP7RdSuWtn
         SMk98L841DzQ/ijQv0AdVlLkyrghooqIfU92466Nbrn9aq6wJByGFEu3dDMWCCGBxfXS
         O0aMm9y2UzrXh8w41/ccALVKqZ+NLstdeFbja4RXghyHHh0dElQ7qSEd59ySCS9n19UC
         yHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411655; x=1786016455;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMKDj6XRNmwKnnZ2ZBwRvPjOhNkq9Ty1/URdEas3t0M=;
        b=HvNhoPDEZ8Pxp1z4dwN6AlBlkvQuiaCmEGuOethoWrZ0Eiz55udXQM5aEC47j8kD/u
         jf3YA/5Nzkl1ulwZsgtDq3lxToWN6i8Eq6cluo96AJRjnVbtyQ+MNk2CCeH//WlcVRfJ
         q7emr7MsVuKmknPVtduKeWNc+E/xEvKflwVFI97c00YC1ENewNKDlX78OSJAD6gzjqyX
         LUeXjyxooVAakpL6GdHlEdVHeTD4asGfvJs6s/PdAQx60xLzDHN7cnYFhOPg5YFfpOuR
         /QA3nanIlzUm7/OiPTDvIbO0k7XXsnI+ITU71qViuyH1/mVHDHXxBg/jIWJNCvoQQLOV
         T+iw==
X-Forwarded-Encrypted: i=1; AHgh+RoaaOJluL996udZj8rNwVWmtVT3342M2PKHoL9NZZTvKkjKQLTnyJZSs4TH3nslLpsfJACYF+40v0SnqAyo@vger.kernel.org
X-Gm-Message-State: AOJu0YwLMgtVH5wE0BGX1ZsSfX5zzqh54iQqvJn1QmL+ndgeNyhMfhBB
	7aCoP8iP5kfz40HZh6oS102q+MhwuAHxknzDRiyLSozN2jDmux+onCQ9GqpfJqpwcpech4asJcA
	d8jnvlzDHMLuIPhpqOrtdg1P5R+SKJQesSff5HcGJFqG/jehkoGV3CH3afHZTVOyCd1p+
X-Gm-Gg: AR+sD10aB26hd9Ka3h2vIafxXce/W0boCZAK3J5dKsHcnOs7Ga5NMnyT6mwG0/5YwcW
	Aqu+MktRTY1VnJ8CSiwElGditQ4+DBUpO1RYYsx7ZQmp7LrWYGuIQBwLFMxXAdvVIdBp1AvLCWS
	M62CaaM6thSnTHYn9qwEba4fMGYr3+c/nf4fRhbcmxla4nFX3juYjA7y41XtGiZSe+63FqyDgzp
	BiTntf2S7OEzpvn8bT7pb1MLWpXZWjVE/fuEL3jwTp2/EYLAo+UT58wdtttDc2YOrpGYtK26k+6
	wTgZ8SaKaWAdtdGEmcR+In+4FbUXxp38TomYUa78C5cHYltmVavIux0F2w9/DOB7RJokYSb0Slz
	cymFthqT0cG7OXf0zTCD1H7Qf
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr39765171cf.4.1785411225354;
        Thu, 30 Jul 2026 04:33:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr39764551cf.4.1785411224830;
        Thu, 30 Jul 2026 04:33:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a088567bddsm413013a12.5.2026.07.30.04.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:33:44 -0700 (PDT)
Message-ID: <9143ad0b-97af-404a-bff2-ca975e3c0d1e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Fix cpu6 1094.4MHz OPP frequency
 typo
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-talos-cpu6-opp-fix-v1-1-f4886fdff13f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ahrm1rS4aXDCgIYaiwMBYEhTNs4I4bDi
X-Authority-Analysis: v=2.4 cv=JZOMa0KV c=1 sm=1 tr=0 ts=6a6b3847 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UHcdz13I6WZheecbso8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4NyBTYWx0ZWRfX7WqXbKVPuIwS
 nf7EgxwRidc79mxggrSwGCGjHsJmOA3Ke022KF/xyFgFxL56h1LBzooBZIjuIrtU+3nAzuT3IYV
 rA6XXloZbNPkrHlRynKZGOvKhfsOD50V7aLFNWFkWloQ8U4G7Mp4/MgmCdlzf6uW0xGHOQZPcFQ
 FFU3N1YV8HKTxYQXYTld2EC8+qAafDP5nY11KNFO7+1kt5xZHXRPV4eemrZLe4WgCjxOhStiXdQ
 1SRHNKENcDklxoqTm3ifg7XHh65uTu8YiQZnDE0KraQ5p0BkJVpcd8w/GPg00ZNO9ik8x+hH93Y
 4+pf+vP8tQ2X7x1jaC2sCrMqIBeFdDs47cNHO4B2il+ktTPs4T0E6XbOYkvCQqi8LbQJ5lx9w27
 cTSi2VLZYcODRQy0oBdPIhJxN1Zzwnra0YHNZw5FzDNxWC3hf++gXDk6htVJOEDVFEH7oeb+tYy
 7Ac6gDVkGnoO53szAVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4NyBTYWx0ZWRfXzdgY9/+QYyIg
 Ho1pI9Qc+yRf4rPRVwo2ahd0XeQJIBBn3UFTDN8CbmKXhOgLvRq/nAVEZc3GQuM8ycrkNlwza3f
 Rm1QCgtQCwLfuPFHefRoBgywUfO09Ao=
X-Proofpoint-ORIG-GUID: Ahrm1rS4aXDCgIYaiwMBYEhTNs4I4bDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300087

On 7/30/26 12:15 PM, Imran Shaik wrote:
> opp-1094400000 in cpu6_opp_table has a typo in opp-hz, missing a trailing
> zero. Fix it to resolve the following OPP update failures:
> 
> cpu cpu6: Voltage update failed freq=1094400
> cpu cpu6: failed to update OPP for freq=1094400
> 
> Fixes: 44562f591890 ("arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
