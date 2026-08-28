Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE9E440A2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917414; cv=none; b=t1BX/7uCwjdoF7mxaM7TBT3e5MH464EJJHjN8nOcgnV1gVgpM0Fay7FLNRxqorVNlVdyvJhfj51GSITCCC5MraF2VG1LFgfqF/MMc/MeRtI1PeGpUtOB/jbNKcgc5mPY4RRc5ToqddwztJ8X2y73y/XjH5NEMGirx+CZsOH477c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917414; c=relaxed/simple;
	bh=HFcChH/r4NK93oSVruGnrec7/diczXN+uEa45YCif2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qO0PPSR0vA8KmClCIeByykqotDs4Wl6kp+Q2Lm/oV//gwsWwjVLlWNGT+Hk/D74bPl9VtVijl20PHw5X/WMl8WaxMYho+oXeg+ByybJU85NsyAH0WaDJMVSRQ0CWqazh+p2XTILoVJerRdGPh+aJrUsLPyB0+gwOOZ5FvA2Iw04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1D06wpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUoy3W85; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1D06wpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUoy3W85"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA887x2596142
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=; b=h1D06wpxpEVKDU4C
	7MTvwoMGdtiiy/phDxBEwWtTkly7GSMQ8isO1eW8V7N6/MZNtJQaVhiQp/do/pn+
	Uuj52jXp+X1z79KtJG8Zi79lWVNgP84pWp8HuC31CZ1XQRT9/UlircoCa8e2kEjN
	acmq2XD+mKjTGPcsClYtNQ2EDouTY5gJROxsi1w8dO5Mbx55L/jFHg7V1TvArgvv
	mpLTOhJMrGLUOr95psY/K+eIg4pPsTn1YpI0dlXhu6rUgOZy3Q6TBjsx9G8dyf6I
	/RuKTeFonTmxxBPBdVxXLbk/k0DwKoEOhWwmPj07Z/zxaxex9Ym4RWFOhH3xNzKO
	55eYlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3a11f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 11:43:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so20861285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917403; x=1788522203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=;
        b=kUoy3W85/3Mdd0gNl2ZEvk77qt767XK2/92ylLkCi34HafxELDUFExC3KPpji7aWrL
         tNXn1PeJ4zPmVuqdAap40ks8FIKhIZss9kDunKkgKyq3wt/z1zBD6fOQpVkvomLhD5GX
         XvLynSRZCLb34ZvtIO01mnUidmmRPGe0whpzPdUO3jY3O92BXnk3Ei6z2PPeKg9f/u0O
         6IA/A/3O2kwSURoXfA+8NJfgCT2MfAWPrwi8icGybe3PAF0l5tvu4wepZ38g1AaMyIjq
         UNmbmue7r9gslH52WONXFAt2H7Zac1IjU2prZG34I8RYaVBCIYQf3l4pJVPS48L5GL+m
         sRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917403; x=1788522203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=;
        b=laxq6RMqKqvDprGrmY4eGMYi3lX/5BSTRX9U5RNlI0qi07hBDnkJ20LunEblcCGkKR
         yP/FokifYz9qZZ/fioETxP4Z1BO9L9aG7QJnEHo9HQUoTmC7I3IQTPsvvAZ/Ir+88Cc9
         jDPNgsCLgkzWyUcrGlcH843iASBlwMavhABgCBKaREkqHb565yGp1BesvTHwbJXRH5rk
         Xb5p+7WY8fqaaXJbtzkY8Qwc3RIa6Nt4X38KT/zz4Zeotj2tRcHlLRwPpVtdy1m3/ao5
         MbxTGCs+UGzDrlvjF5iVrqJQwtC618SXhVbc1c+zIkzRofegTlL4WvPMj+VgOEQH47zb
         2CFA==
X-Gm-Message-State: AFuF++mR+f+6QMGNhhB4phE3WZV4e+fJUVYiElu8+ZYuu6ksLddWKRpm
	jeRpWZcpKTLhQDvc7K9xko2dGp8qfv1sKyEZYKCSD7ffi/tkzZcHUuGne6fEle3rs7Ht0iQc/N9
	PmrbpuinEjDxnzoverQyh2BMEGKlVg3NEnOpCnDJZe6Hd3CxmSGHmoKJtwRoCL44phJZ94zOxbB
	EM
X-Gm-Gg: AR+sD11warpSmvUfarkn37KEOQpLRliAlMARdKR2oSYlZxXNM8/EvABIu3M1cKePfER
	feOacaWBikfJGx2vfL1ndecWW3+xg02OBEpd5zqzWvlyAA6x6ynEfOykSDVgy7CetvJFoTVeGEW
	Go9Ot+ACCVxgPPlIxJVZbLXqsgj53725Lv+L4DmIVqVewSR2XFd0NLv9q9haoaGFZ2mY7rTSXJT
	0o83KTRh626VH/z6dGuHgCsFzhRI8g+kGqNsSMQRnZel1TayPLxCG/VN4qUpfvfr09Hgin00h+o
	H4XWTU/EKNBX90Pv0ggn4ot9PLRjg4Jxv889tXugjckpKnuavnG4+ci+vnrvTOa0/x5I/JHQZXn
	nJ/yfqjwZFZ8vZ1STLXAHWV0=
X-Received: by 2002:a05:620a:8399:b0:939:fe9:4310 with SMTP id af79cd13be357-939138a057fmr374113285a.2.1787917397912;
        Fri, 28 Aug 2026 04:43:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:939:fe9:4310 with SMTP id af79cd13be357-939138a057fmr374109885a.2.1787917397495;
        Fri, 28 Aug 2026 04:43:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b59ffsm71808066b.34.2026.08.28.04.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:43:16 -0700 (PDT)
Message-ID: <213b039b-8d2d-4c67-bf7d-2f2b063dc793@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX+8P51F+oDaIq
 UyqmI4pFnrXm2DF/8/NmOgqELXjGKfZYZLj1irfRIavrWUl5IL48wbzYf/c1EBzMSowFb7OKKGN
 NMELv3wUYHEAT1IvBTGhCqD8nfXIVO73OBh/HnWaQJg1F0WkUTZlWZ6xleq/CjCa7QNDN5Zc2lv
 7yNKyW6FyrPI2U7xw0SzIWy1y078imdnyU7tGT412RQ25uiXsjqsdDAieLHjHNsOVmxyqgJ3avF
 aQaPH28kKtEKzIwSMSw4FY9V0MHO5VH4CJYG+SUWIK2a5I8VyMdSBw/bUWraXCWPAUb2DAPAIjX
 CemjHpXCMgy3wA53euZIShAHgibllFNXdyxP/Re1l2MQzd7ypZVWp+38EqjiwgSYYiTY+fMknmy
 6A+aNBKBEMCVpcLq37yqeZ+qwZQUOF6EgzOI5L8Ni7P9NZaTxL037czx7o51LFMir5D2HDULdqJ
 mSdnrrykn1pgxjR1eEA==
X-Proofpoint-ORIG-GUID: 1ZRx1wSWdZ32nrc5VHYd8RXM3gHETtyN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX8YGhx88C06+B
 fCOj/AtJhw0485N9oySJ2ovRJN0QoCJs/QQW6HC9vet/XLYpB81keiDoIkv71y5zA9kWNvD8sn1
 plBPfz0vAnlsqwW4ewDjVIWU2916p0Q=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91745b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Oqahiz4U4qnBBrGiSRoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1ZRx1wSWdZ32nrc5VHYd8RXM3gHETtyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280101

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
