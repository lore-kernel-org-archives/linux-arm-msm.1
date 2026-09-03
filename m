Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EFF37C0FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435280; cv=none; b=P0tTYz76eMCErWoCs2GCPJ9jU/Ot1p92DYzdC1o/DwiUu/8ppCOgr40bn/hFGy3hiIpcZmUwlAIBKFDOstaWE6qG9oXEcNBbGdqQyS5oygSqsFB6IWUPB+h9l6BBuXNHB7JToxc7SLQDm7Y0XN6Zd2dfmzz+6QoT9QeayjE4UPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435280; c=relaxed/simple;
	bh=TG60r3d4bxHTRQcM+uozE4UNfFe4TxzVePdrncZnMxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkmOdMSQ8bH8Nf0aOlStafnZvnvOJuUJ6ga3hGxDVk94zyWPudsKQo5dtxvCuLy5tagFRmkMl5cQVuJnlWOzQLDR6VwipOvailbjPwFnqiIG+Rwti/bGXeMRgwKpTBeL1DgHjU/FvVA8BelUTTygt2nJBoiYSzX1T3rUyZnq69o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+9aAbLR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y46ltxRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+9aAbLR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y46ltxRS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHCGM162790
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxrRujp8FnMnYa5VOkn2mFYe981Ric/5r+bDm+cuD8c=; b=k+9aAbLRzXXvm//g
	+aqT0fSBB3Dz7AxIS3jAhu5zqK/5M3m+9Q7D9SKML4Boefbn58lf4m6SNiIZQeE5
	cUCeY/eBGzgppFezGzGagNgHmd3kx6LFNYXnUYROO1+Om/xWBdZSqQ1y57/tXCn2
	OcwDE5AapTmVQswCJ6egyDDtJU4+t/KqUtneonE1RFDT4jpkm63VRF1LPddxlMFs
	NxtbBUVPLHMah5/NWgKF5POIel9EB6b9kVol5ftg+wVUNM12ihkRw+pT1NnUHa8e
	zrvPIyv3k6SH3tqtoOxTFhXNQobOPUzugI+vQgHWdljsXvsTXYpZlNdBgxnnMFt3
	p06qPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx0agh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:34:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso39639085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788435260; x=1789040060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RxrRujp8FnMnYa5VOkn2mFYe981Ric/5r+bDm+cuD8c=;
        b=Y46ltxRS7UAdt3lkEWKojmnpnGKXs45MwvtguFfK+8ZZ3qFhZmAlnHIjFCvG6H/EM1
         XgmcAmC8KxHbLVS52hAL6qtDMowBVEskBBYfkHY/EA4kJHbkUlh6Bfu/4JFLzwKl7ylW
         s/pBlJrDzmmTCdTb1EGubJDrzUN3JYADe8jSqCO1YFDgR+I/ByCwEbXqhdfStsvOGaNb
         Nh7lRotKTeVym7DBHMX8P38LG9/JeJnLp1ea9LtSEMapU1KyCfs4A22qEpgXdSkxZgso
         JSYzHD/Pw9/oUiFzdmvn7EnCKJ9zB8gU4IsMERu7JSTUzD9/PwmokfzhlV2ERIJbFyO0
         ZpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788435260; x=1789040060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxrRujp8FnMnYa5VOkn2mFYe981Ric/5r+bDm+cuD8c=;
        b=eb6UP0EQIWEJkd/52jLo2iZq1BfX99ySkiUp2Sj7kl/TqYCLEMQrotT20MvNdbBvVG
         qxFyYkl+1/bzlPnATlbb04MFgLCPl/3u5sbE4/BTMj8GYWT4YIAEkmL+peUsaTvtRDO8
         5WltQH8pb7SngMrm1MEz6TtTm7Ov3xEek50cUB2dK3xdIhivbq5BSv9R6btMqH4lyOQG
         koKVH3WlBGUJXhILy6Sgmk2X8KkEnb4E8Dnvo1OvZRhEumfovuWJFOrjN6OhzZmX+gvJ
         i63aX5LmWlHCWW8CxXhs8dhGkYfPC7vVo1DRwj0N35+UF7tJoaLNap9+kr+khIVYPolv
         c9pw==
X-Forwarded-Encrypted: i=1; AKwUvBwqFrW2a0O64wLZ5ud/gfd3kOPXfwWoakHYoaSM/nI8gaq+Wphs6NKH8Mk2tYKrSTwzXpzPxV/47r/Wz0jh@vger.kernel.org
X-Gm-Message-State: AFuF++kXLPq7JDFI8KVOe+4saYbcTf0f2EDGglHxFs8BfRjR6mGq52M6
	rzTzHoCGyYgakbWWu+fDsFkxibhWQwxsqXPcShQ2d8pv1xeIbonn+CCCBHb7YC2faH4gvxG3ws0
	huLCRJUm1gpIvE9eGF/oDogYKcSiaQfACsVvvda3YN6K39QsvWpouIKkXJp6m+KZNueyI
X-Gm-Gg: AYBFou0ZYmoPkBc+IfEpczHjokr/YTSeJByyYEc3qxTYKpe9fLC0mpElvKIklfFADtT
	hEGPS+ng7HVp/3TbW8+h1yq6U7lAQE60HrfxsgD/GY9lQ0A1eHJA4cBhufHQpOo5e2yTBXHkXHh
	pI8tTpSvdH7sN/DuP7tK6SLrTcoFsuF1aOV6kyP7lrlrjejSWveH/a7KzbMS3rKxKpGQRbIV90k
	MUagk+hrdSy2uB+GuAsPD2cVJjvtpcFim4lHvfV3msYgnPRLbQZ0lU68geSQ46Ui55zMGYZWhMf
	0URt7HffOCxsqL9zt03XZJxGe60iQCMqvg1jvJq2sNJofyhaNnIe53n2jFtQh+zJd2H2DEvCtPX
	2mPt4OLwahdpBUfmMos2TAA==
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr809138885a.0.1788435260377;
        Thu, 03 Sep 2026 04:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr809134785a.0.1788435259881;
        Thu, 03 Sep 2026 04:34:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm88610266b.17.2026.09.03.04.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:34:19 -0700 (PDT)
Message-ID: <42e9f7ab-3df2-4c0b-94bf-dc1d30330a71@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Surface Pro 11 (X1P-64-100): UC-based USB4 host router bring-up -
 firmware running, rings alive, but retimer sideband never connects
To: "justin.w" <kyjus25@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <CAEfXho4H+WTf6ai1P4sso3=31XFHBfRqtbJqOG19=b_o-MSR4A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAEfXho4H+WTf6ai1P4sso3=31XFHBfRqtbJqOG19=b_o-MSR4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PuoHDbzHfC32AwQpW4HD0TPK9krdY9X2
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a995b3d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ccs8zzdu1jMHLYvExtIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PuoHDbzHfC32AwQpW4HD0TPK9krdY9X2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMCBTYWx0ZWRfX8lJp1NgzV2py
 ARgnXWEM6BP3V6hdxSa2O4Xg4G1QgvbfZVrHSaWeUEYXe1YCIsvS9GDBzgRnilMKnqbwtnXsf4F
 +BmwrgjLXc9nyd1mwCFZuApAfq42KiV2XtCSNLPt58zyHt3VjFX0JgpqCymcZdFIj9i52Fz8e9n
 gqIKWa19Rm8z60fXjNN5RyJg9vXtWWlanWLrO6iStqw8Z8EsVpz6bf/xNL4ErW2nDgPGA00H1up
 pqk0dklcKQQbiFz72fO62kJ2qOw9mcaJCH8pcdPmyGRvSU+nT4GAuIfgonVDmWsYZxp7E3BUNlO
 dmuF799ArGdAZegJTVdwlrPzve2/KslcqClopRWQjX/r0+l7UiVq4yAa6NG10lH1CbCymxR3VOQ
 yl03uy7bNFFxh2LxCMhnFadYVP9zCw3+kTtddrR8jyTdJIlQY52bAE+GRtdJreQav7VadikQeVp
 /3H+cSAXGUwBTLD7NGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMCBTYWx0ZWRfXzVdl+8G4sv2Q
 lysxolplBRk2lYvD/UPCHYs0zBbMkZ78/qL8xZLMHcLL0TSsKh/SwwQPzOdGNHcw4S+G3TdKhCA
 2EGa9379UmTWJHR/ThtF+QSxnRkC6jw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030100

On 8/27/26 12:23 AM, justin.w wrote:
> Hi all,
> 
> I've been testing the preliminary Hamoa USB4 QMP support on a Surface
> Pro 11 (X1P-64-100, Microsoft "Denali" board) and hit a wall that the
> series doesn't seem to cover. Everything host-side works - the USB4
> host router's UC firmware boots and reports ready, the rings come up,
> the tb domain registers - but the link never trains. I'd like to know
> whether the missing piece is known/expected to be public, or is still
> inside the Qualcomm/Parade closed stack.

The driver for the router itself has not yet been published, but is
going to be - your effort is duplicate.

Answering one of your questions, no public documentation is available.

Konrad
