Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE0E41E6D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233598; cv=none; b=CWSCkeAaGCNKlQZ03eAaCSMTv9HY7F+1BdTzFXjYva5HHYpmXfCLfwKc+AggfoOtt8GBw/9jt5Lt9LtAJmE3500vQ5DpXEuno3dg2unY5C893kGjhykvzbAYkqwvO4x2rwGpU9SKUZOmBCUWxUlDUa0+XKOvI95/G5RWxmGgt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233598; c=relaxed/simple;
	bh=7qIRTIk3lvIlrUEmHSS/Ti9PQ/6ZnnGQ6FQH0irv3jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAaWfV6QavTCo3B9TcvnvdYuWX0PZYkw2d3w+IZfEmiq1lFTOZg2LJ1Y6mO57sL/mlkdFcyqXGKhH10th3zjdLNpXKQX8Z/AKs7QyePrZe68+ELXrqpXc5u0kFCSIsJnVX7gSTWDRHb/ysKPTRZ2HN3dzQwIA1NIFsTIDyBEICo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nYs8/ND/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AX39xvav; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nYs8/ND/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AX39xvav"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82nqr2309789
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSvj8k5hJV3huXVzDg79B9N1p3sbeuG0TqatBMaOiVM=; b=nYs8/ND/joJ3n+Ca
	Dy+zb5MGffPyxkFZ0sPJtUiZ+OW3JiN4rrE1dcEAlqX/ni9WjqHBdHzL+/DcTZ8E
	4QNBFLJpkLjHDGu8RPPp8VdzEt0yIMWqlzHhZNRFqmnghyx2uQmC2j9FcFBKx8x4
	cuQjWQmttZQa2ipuoP9C5L8IJbt60Se0XnJum53TDBcnlh4bFJKxMtMQfkPz50kZ
	n6IynjR9rq9JcFIRCvOpLf2kTac+WHL2GORNWUqRCOmkmpJo1cYrSf6/tN1mWJok
	Lr73AAnJGNZlkvnVk5GqTCVAIENHBVo7hUwv3lysPIUsyhcUFDYM6NFbyWrdqa++
	empFkg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j7e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:13:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fe0d9ba59bso8907466d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785233595; x=1785838395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSvj8k5hJV3huXVzDg79B9N1p3sbeuG0TqatBMaOiVM=;
        b=AX39xvavYy0EkI+9rnZnkvAB5i2mNg551FymTA5Bnc1d3lEHYRaXYJIfkqIVuTbxcv
         lzlnIJeOxgZkh2ger8HGy7xF3yLTbiu0zEUOsFRPsfurmH7m4JFN60YYVgqm1WJqA61g
         fhZBy/y0oeATy1+biO8aAkG7FMRh4kxc8a04ZrUCqWMXiKcO7wdBenvKGW/C0wZk+4qY
         xLY1X/Co6YWSoftTz0JDXwtP9gcjlM+vxWR7vgWeaR7E2ZftIHHmixPsTn78iCMif8UL
         6CvM55sDYqzcOXku1+R3SxZtrajgmoOnxbwy+8OPw51XtbgzKTDU0VRJ95u1VR8zc274
         4BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233595; x=1785838395;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSvj8k5hJV3huXVzDg79B9N1p3sbeuG0TqatBMaOiVM=;
        b=RG+9IrOLJU5UWVKJFU64EX4cc94xN768oZXNkzs8QlzKUqfCAi0ax4wDfm7T/Fw6Se
         P1c0Y/lKCm3iEslYW7AwrBeGdevb7cpKl2vo0y83jEDTopwE1nvm7OnYKP9Dh5kC709G
         RZoFx/4Er1OjdlakJRYb4a87NiC7qmQjRwa2xYDzV9jer9cZ1jMNGnh+2bxUouDMsbwp
         +Iw664rSvIBTQpre+l/38uYSUFxVUAQIuM25Ah2aHlXKX0jVjPXjlwuzkFeb0sF94YD5
         TwP+rXUlwCYkxnAAjhzSPjJMMW9D3fLSQ2Ya9vmQBqwP7qPLpEoCml0jWEHD9PSl7ICT
         7jxg==
X-Gm-Message-State: AOJu0Ywk5kEv/EJr8Cnjf5sKs7GAyPOnQBO8cpw+op4W+RIas2KMqVJS
	WwTM0weri/zOn9u0Wt9vZQl6bynvgZF52P2QjsZUCnUsEOrxsj3FKt6C/mCx/H7KnJkOEyzRE9l
	EyzwrcxTBhz1PXtpZ5tK0xafrhEV6H2olfoZSXlOQGCZ0XcF9DE1hTK8Ns+PbgLG+dDK6
X-Gm-Gg: AR+sD13TgETT/piG09E32toPEpufHf/Htm8TDxGN8jwLnjkwJWJQcSy6iTyIPW29XKS
	wApP6L5VC5nW5d1NucCK+1aNajsQTqAWZqomrOV/CMAY02B19g8BGTsoVaMIuOVOSWm67Zp5k2T
	wp/wCEedkrFl0ieZuL+zK508WS603PPfMgb6RLybd0L/C6iGw4JNpKAZNX3JerZThdOikR4LaXo
	ZWg3qvpNuWsC6vkAgeul75T1h13sjd4IzkTsIsWWZfaeNe+bgveZPp9l76qMyeLVDoKIxMbY5vc
	Kb0kJc+D8SMZj9fr71NXPzfTXolVfaSQusBQ3phVGgqYZolMM4LLL3gtoHDzWAyt0NLmnzSLQC8
	gmAbfxaVUypCn5Rly+0x1gU03
X-Received: by 2002:a05:620a:4726:b0:92e:6485:f640 with SMTP id af79cd13be357-93302671e18mr123738385a.4.1785233594941;
        Tue, 28 Jul 2026 03:13:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4726:b0:92e:6485:f640 with SMTP id af79cd13be357-93302671e18mr123736185a.4.1785233594488;
        Tue, 28 Jul 2026 03:13:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a7861esm757998466b.10.2026.07.28.03.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 03:13:13 -0700 (PDT)
Message-ID: <014f65d8-702f-4b45-8037-8c416ea8c858@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra
 SoC
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-shikra_pd_mapper-v1-1-a5572eca26e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-shikra_pd_mapper-v1-1-a5572eca26e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX1XIPXHFQuPhs
 A3IhAs8wYElf0ojcuQimTkXNPB4uqskNVlfEsJo2REdEcwzi6647bQVbH38sPvWilCb1E8S/Pz8
 IdNmv7MiZxbvKVoNFHaJzYviejudSGMX3wtTtNIrtVgn4HOB4TtcLvG2E/sX6qoCYRCLuFsNAQz
 Ntvc41HF5vnwumoCUcdj9+Jp/sqCkqDY6+8WXbZMkVIo/0z9uRayLAmOAySs0GuKUeOVIBvU4sE
 ZjmKtol4SMILIpk5bGB22MwgCUEhE+NXKIgWPuHmeRKbUd2iXIetPzoQAzAt036/43leJfn7hE+
 Zy8o3ievKscUyKqR0LDnNQy24ze1IvcD+PY5PuP/IPG8ZzQvfoGCFrMH7q0ziFLIOLb3Nn9z5Y0
 p6EGAedPr8muzkrGPtrtFar5w6iNRWT5uTqENWq/It20rBEoJZUCM2HO1D3++cjNu12jFvsufDi
 OKmVhHXWE+p0GZtRSCg==
X-Proofpoint-ORIG-GUID: gE2sLhhRd0A1i0-VOQ8PANzxitweGyyJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4OSBTYWx0ZWRfX8Yaq1N8x67pT
 lD2+6BFVZZaIp4Lav2k7l+ysH9pxAeG9gL2KK60B6p/Qejs0c6InZazZz9HTqIM1JnaOgCBu/Jh
 KInNANzHAeo80sL+dMB7DpfIBwiRQ0A=
X-Proofpoint-GUID: gE2sLhhRd0A1i0-VOQ8PANzxitweGyyJ
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a6880bb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Tj8icNNicITIuyyYsq8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280089

On 7/28/26 11:52 AM, Anurag Pateriya wrote:
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: mpss_wlan_pd.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

I understand the audio domains are lacking since there is no more
ADSP, but mpss_wlan_pd? cdsp_root_pd?

Konrad
