Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4A3B0AD8
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461866; cv=none; b=XHm+1wjIgwEO/M9QlTF/9w0ghqaAlFtIrn1AvAzohoXMkZOJbMBrEf+YdvAIL5e76SvEPU6zQcwmWAyKXj+FhIYh9qGl/Iq5oj1OX2hImh4lpJVmyU1kQXBIZKdK/MmVcjqfJqfF8neXeZ/LS2hJYp8yN5bj60c7xkTA6TgXR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461866; c=relaxed/simple;
	bh=sj4bS2/dXB/i9x9sS5ZEco69QKrmigQRCDI2zV24RZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohuXESiyeUeSjIbPS50HFs+P9//flPWCjEbcqkyBIW4zQyOZXROpYsyyaSoLdf+9RLq/OwiY77mpn1u0pHZH5h5U37kz7ws08nqcNweOShM6Rz778qPafTm6C3BaiZJDW6eA+lU/vmxSfdRzpvQCu4YNRWM0fIRBBG6wOhJrXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu/ou7Uo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHEu2YFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu/ou7Uo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHEu2YFq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWwV93718396
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=; b=Vu/ou7UoaPmns84N
	jDjLKPOGDxANUYMV+3vie79g5ItIEqRIXtiTQ+tA0x6vT1XqrajNzQrB+5a3e7Um
	JYVUDrHiIfDBGxFzA0AagO4LamhLiV123GvuVsWNW76gANu1U0Um6rMXC7vOxPve
	sTWPCu54gKcKG0vMtqECln1IS1pGVyXWD3hDuySvhdtSN3U057Ct7aWCu0/CU93H
	Z9xyT3W5tqIJpLO02MzCedezfKPo3hU23+5Qm34g9zSSZ50ZUnJncnYFETBhkdCC
	LdZyqKEYBbNwPYA3472ZhTtxbGns4kOyKU8/U1DFrzTzD5BWQbY8aBvJ/TmeqfOe
	jXjg6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwesyge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 15:24:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3932714a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786461859; x=1787066659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=;
        b=LHEu2YFqJol5xwHr+NGL/RNyQZBy4Pb/E1AuMif1XutK/4fcmwmXRRlbCgZYtMtcO9
         vdsIkVViKw28o/hmSZ0ODjjE4bPbeyUjeSdvow/RGsXNBdYXmM9RbiXrdApbua3rZVU3
         sbBhMuAyIb1Vtmo541FwhiB6ktvsrPFoJDUtlRgzAeaR3nR3JIdZaNUdDJY1gk33IHjD
         qkxuNJiB+mWuZeH7Q6aHQu4hFAW6jA/JGnp0nx0ug9UjuMKaW1mqvlBR6w3f2FOeN41+
         pc9U7Zp3rIP3RwCG//cL/rBJ5OgX9RefXnfmElYAkabN1ihvXJOT9Z6n8JKSdMr2V4E3
         baRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461859; x=1787066659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0yHFqTDdSz7c0Ma7aGwQ+ILjZzIZgI1DbbmrQLlol8=;
        b=QKhMhqjusFP81fuXp7b8UHiPVp5FCOyIku5ImC8qUvyr6fMWDZKZ+ZsdtXEsElulBf
         Lly3GiS6a1y2r6uQBy7TVPQYE8e9MaA2vceBz0SXnVsg2en7GX7Gu0fITImjXaHasJaK
         ygQJrW+3eE5bSFqe886cOeC1wgs3mRkMMw8JWIMoju7JWJFG24tv+WQ7bv5MOKAuRk7Q
         B7YCJPaaRXow49dCZ3+6xI+Tl1kPMigQStrT5lOnh0a31DDsHhoEM2ztS9wFL+zTBDun
         mnDLAc9oJpDW7YTy/NNU6uw5BU7yNXZlEQh/h19CxOXR5azZ41nG/CBEjHNUQZu7FHTf
         w6/g==
X-Gm-Message-State: AOJu0YwvliLvPTRgor7SLaPI7H564lK8FW7CNKJ00KmiQqSpKcVrVdRU
	zYWcFF03jPHH73XrFFkpp5boCi+8MUESJd2yHh+PHAXmynR33o1okblN0gNvK0MkqUHn/OUqkm/
	rVcW7c9IbSqWyNbeqDn3ZhcPEAU+zdt0LnZyP51IDQhsHvEDLlNp9KuX5IpTC7AyPtPPdsSW3ve
	wdjXI=
X-Gm-Gg: AR+sD11IMXwFr9GK0tBiJKGct47+kanfAJkKfo+E6IRgXwWiMIjYTR41Ck39+7aiDhv
	fg3pdPSCN2CG8zOn/7IyTABkf0vqsUgp7DaIATeTBt0RfRXFUIyfTdqTzFMFbHrhsovqMMpfeLR
	h8hN5IGbVhUdK01knTKZhMb4MRZQ2n/ZRG2TR2FfdBZBgNfBocLBb874AQVIe5R4OReOJfLTAgJ
	JnvjCMpu+c1jKF3t7BR/8F6rXfrNmkAgYgjS6c9/kK/kAzgppe1e158pFKQ1eNIUe8tvz/nTlWs
	mCSHAckECUI0LP+hJ91KoMPU35Zzj7yBBVo6NeLTTlK7AGEQO1Ow1s68KhvDSfNVVXSkbwMtmot
	Mxt9yFrVtAow8KaZgjCgJ4arXa5qkSPRE+NEs8s8cIw9z83y+ssgbwl3fahTxc5eJ
X-Received: by 2002:a05:6a00:3407:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84fa8670b69mr5076165b3a.1.1786461859325;
        Tue, 11 Aug 2026 08:24:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3407:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-84fa8670b69mr5076087b3a.1.1786461858816;
        Tue, 11 Aug 2026 08:24:18 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9552bf3sm971806b3a.49.2026.08.11.08.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:24:18 -0700 (PDT)
Message-ID: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 23:24:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XLxjDj2Ae7j8IwGWX6qScfIcBz3BqxyN
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b3ea6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sE9hRS_1S9_EAqV7uWoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: XLxjDj2Ae7j8IwGWX6qScfIcBz3BqxyN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX5wSSTPNESBCx
 vXYNKQJ6p+QcqKC9uEPoyRe/NpdJoSEJCn/fpfbPcVmkEgDAvI94wb8GmPOxvgGpy1joLLtVAYN
 tJUNL9EGUOIAoMWBETq843o+iKiL2K0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEyOCBTYWx0ZWRfX7TD7xlMcWU8o
 xamMg0uVDiLTkrEbqdMx8MRsNtICqamu/icZr0Lqtf2bbYE/etY9FSHDAnMePH3lG+zofYxpBy5
 chAejn666W8pP3UacXRqGKTvCQ5/8GIC7U+ekmd0bJ0GKQveV+Rs2EV8DV7/4pBHH33TDlc3/fQ
 GAgNFBBGarKk21Is+2zxAneHyjkBLB45yVDqjWPhZNYSp5qjSjriMFs7eD5LSwO1iajjAGgME91
 8HzvBsOgTM2pQehtQBoYO1hJwQOf1NQx6tnmRog3FkX7YESPCX7P4IQJijjUyibqnjzS8eguSVG
 SlsWuUNmOiDy9dp36ZbpCacHd5T4VqDssJgpWwp3BbPLlavfEDuAmRdExyRhuTQbUA3n9KHf91g
 98aMvTRoWtOT+SbTH58aHHibyamBHI6K7qWesOBqsMUKSYIZ4gQy+PDs+dyRlqak77F7FdNST2a
 lY8pOGBJRC+szbOX7pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110128



On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
> 
> On 8/11/2026 7:06 PM, Luo Jie wrote:
>> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
>> TLMM pinctrl; without this the pins are left in their default state and
>> the bus does not function on boards that enable it.
> 
> Should we move the TLMM definitions to the board DTS file rather than
> keeping it in the SoC DTSI?

The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
these two TLMM pins support the MDIO interface—one for MDC and one for
MDIO—with no alternative pin assignments available. Therefore, the
definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.
