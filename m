Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEEC45FFA0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388814; cv=none; b=Ga4aFbXpDE1Z8LapE+zuED7mPkfKWz7ImSd5vs9zuBkr8UtyZ8fbzqzYCW+RbTNGZW5+vyAhtiNLP/UExSBf8wgnafzNZwZWLjv2ZZly4j2QI4jgwwRyPRTOxwn9hWLEumExaLVp1m9ODcfqFTbgcns8o7MHy3E4oeBVnQArKAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388814; c=relaxed/simple;
	bh=VpuCNzuMJrwEAHkSgZh2kSxsKdhfDFxxd0rHj0H+4tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5Id7dURVI0muKt1dlZqbEBsMpGYgXiuwcGqlzCUyYJRdgQLsfHCGFAByHBnnD708IinN7Yv7FTY70sRF+lO0MQ8rP86bc6ukJXmruUax6IhvKkJOHg40kNiAwoG88NyK4beiWr/ei8r9vYjUqvnlJ0m4HEl1PXmb3e9qZnIwwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXLWQALI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awUK66P7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXLWQALI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awUK66P7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4NQ1216222
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=; b=KXLWQALI2kburQDd
	CvzSipFAaBJah5sgsg9w/zQqoqqqXeG/0sdVc91XvUvassRJ/6acCY3Qm2poGs9n
	cx2wECHn6TO2Y+l4DedUX8KOnimUgK95yAuUG5EvnLTB38eE6hJ4z3C37qNBc0qU
	EWlXA1ZTGduyi8uZqqzqOmaZhGEfnCk5KhzY9IYnaShCxQj4AYMrcSRL9WZhY2Wf
	kyyfQYQX2xz8KHYoErE6Byw8AqihLhFv/BZkWLI+r/Hh5U22jnIjtXydEn/mGAup
	dr5S2NAARua/JodwNBGUKzUwmYOLiGlmhgybg1LpgCbIClGoT+lfkPLypENo/g2H
	Akhi9w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0af8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-74ab6065f97so56325137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388811; x=1789993611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=awUK66P7HH4ytE4j5YF2HUroVgHX2zkaV3aJjq8wasmpuMjO6j5tSyw+mujuWM78Wg
         5FvtTQE6gVAii38q8/Nkya36BoCfiuR9N0X3zk2IPmfyKYBLQWIDZDHo3A0eXvi7GyP7
         no5LQ9JJVbUSxlbtJzUZ72yQMKgZFIixGZC6h7iqZDXXuALhrgagbZcspsLzjuZeC0CY
         K46MUreffS7gpX0epRDSS/pojl++FKyQkzBG1lTKbvN75Hr/gqknsWvw8nh88t6/U38/
         6x8lWQc/krLbSN79fLBvOTvyYWfnEqkGo6mpICaPi7zSvx6gIHnDEGQ6fajV6jgsqR9C
         9YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388811; x=1789993611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVpCVqznGYdz5Kv7onwGPeux53rZACcfYzZGz0sTBpE=;
        b=KJH+if3VG2fvJ0ZyT6oeQhAcE2CRojn8CnVKUuExcLvMIkWGT352PCflSa+WKaiO/K
         69Hd/1BCu5KyMD/JVxb3rCBhYsVAsdZxRYvxrXNrJyV+xkbbApQ4ucogBA5iG5hGv127
         /ZqJ2t2cqzilt//k88MFeFCWhCL2smigSplEsbrP8kNGiLv9kJze6l1HKf0W79AURTOb
         QZDqhchZAr0npYKuo813fTs1O9jQgHRQF8b/6MRBdH0a3ZNHNp2euI+fDH+eOXA7mg8q
         ZNtOfsLsTEbYlXGHWI/tMzKNCvdDVdzfExHTCpeVqjj3PeiUS9L4w8SjgvAlTXQ4t/vM
         deng==
X-Gm-Message-State: AFuF++mEww4Os01/F4DuazMNVI9yX632N7OXoEUCv6Mg3x2NZ9DP/PmV
	cY6ls+yBMrJBgIr0ZL7TKyZg3usIekRCD6OR0T6BUgmsE/JQ+JUSVY/SG/JoFejtI2nAJSQE2Zp
	DSDMAyCRvk9l1k9Yrb25M8y3cm72dK6Kuam1oZ6fjFsVSGmkj8MzYNgCirry+rWL3ns4W
X-Gm-Gg: AYBFou0xVSo/neEe0SripSN7+AmAnCxiaiCVJFRkOleMm9j6vteIuSZWpYtE1ltg0EI
	CQ/JfnJ0ZK6tpptjRHePdOrbRv11iv8iuOxbzziSkVjzru3VE1squ1REQJGlR4WojUqXKuTiF4a
	TVfCDkXl/yPN1gIAyUw95r+6hCCVCP1mrZJQKxhxlJqu8VgxxP5vD5kHC2cFG9PAEZpFsTrjDes
	M1lkGHh6q+707FfwNXcCCxKt2Ebh5f91uX7hf4VFiuv7WBx8pHtiNpLeTdzdUXeIhYM2HpQiZj5
	IqOjpsiKaUrhBuoHMGOknK0JHK3kY+5uhmiwatr8Rzdyux9PaBULMTnQdBPKV0Ijd6E1dqJmYjT
	Pb088PsGXO6iG9ox4/vep6A==
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375447137.0.1789388810933;
        Mon, 14 Sep 2026 05:26:50 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:78f:c6f5:27c9 with SMTP id ada2fe7eead31-79b509df7c8mr375423137.0.1789388810548;
        Mon, 14 Sep 2026 05:26:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:49 -0700 (PDT)
Message-ID: <a8eba9f8-4f47-4d68-978e-8ffcaa837022@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/31] arm64: dts: qcom: agatti: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-20-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX6LWI340XQED6
 4bE4PDC5YPpT6yb+VuqYR97wlCpxEeMD3GqIzcHgBoscEkOBTB86i2V4cI8yovfr8ckoaeT7ezS
 6w5XiXUpDvhmVSKRgsuQz/rBnyklTiA=
X-Proofpoint-GUID: TuM6iy15_wDk-m-KQE6ESAB7ZDYnMx6y
X-Proofpoint-ORIG-GUID: TuM6iy15_wDk-m-KQE6ESAB7ZDYnMx6y
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e80b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX1RtfLOyhOlL7
 PmBiBXjHVyWxvuJ7RQkuaR0JrucMRT1QibOV1U1tipjVCHMa8YI7Mi+dVNhXrXPqQTBW908JY58
 CONDsmQMcSmTmMgRbWnQGN99vtIUltxTF2qOCVRrFPJG5I+f8An8AyA2Rs0n0rZsDiLMnRzC0mx
 lgWWfiWoVd4GUsTBmZV3SEffloM0j+dPfg0uekRLwZRPRvx2BsUn0FtWRmGGUnSe6btDwcOJ8fA
 4gMm9V6l4CSP46JDNNRTNi2KhoEdk1ax4MD4c0RbpSbtPP0xhApcibR6d6KVp14Cd0JeaIMbD87
 vTBS0ngFNduTPWOCIoSKyyxbAuMONHUnt74T0Im4k5bao5Wd3LL2s+19P2s8u0PmlbGiqc3cS0M
 B0qy8/bgqkVOOgB2EjYYq2wRulE/XcLWJT4S/rQoYfMs9wx2xhHL37UyTyivrFJooyw+EkhTm5/
 gl9IzecpZDWShfnpyeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
