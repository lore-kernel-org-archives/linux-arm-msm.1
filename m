Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B8486B90
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871468; cv=none; b=owqBNq1ORnQHXT/7Mzo+Uhe14uFNxIc634eqINoWhnVOKZ1YhWyeVZ4ZRNGxZwu8Pk/sqQGyelBdAQ6CX338Gf5fE1+Wh894UnT0Z8sVeNmuxU1DZSnDDHqtyz5w+ivjUsTApccOLKOoPn0bdjK44uwiv6QykoWOg8EOQBU5kkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871468; c=relaxed/simple;
	bh=skBacWyG8sqPOZwfFEjjgU22nY5e9p9nHDoaPdYF12E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz0M0LeB4VZdix3HM9009aufPWdds7DfcOqHvhgqQB/k/BKEugVy6CluQnZrdszHDTWeaPGlV2AR0r/tb9p/1rozAZY7Gv31k+Z+hD3h12/1i1T6iysBUZRfMDEg67RQ9cHaKo+YGx14nP91j8K3dN3tN+OuhkzhGolTsPIXq/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=deA1ook6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VX2+E27M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="deA1ook6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VX2+E27M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691FsdF33512250
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 16:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=; b=deA1ook6/L8/w387
	M3pK3+XxAY2HN6tqzn0Lv5KDZqi+auYn5Vl8I8/CasLUgaTwjJf2Z/1CBzkgaqMG
	7YX0rghohVb+7UJZ/8m4FkKm+xY8BfolhziytDKT17qSe9IwhdVt+jV8iCnx+exi
	+jDdoIebiwHkN83QKYAcK/85bF5lL4XDLDbYmPk1F6e2T8kjMLCU4pFHyGh+keLj
	XzxcjOH8PWzwANmE8NVC0hby4rHpyNQ96ioKgYh0p6gG1fK4AuhdDCHkbRkMfoI6
	zq8VBxDkVu0QXZtThTptW5clXjLpV495n3FMK1bJm1HrDlg/4ZbaToQYEn2DuSTr
	5G9XTA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1quk8y6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 16:17:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b530df14so43652241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790871466; x=1791476266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=VX2+E27MveBHvf6IwanXQYQlP58vtFFShyLmnB7fE6zK70eVcGT+nbihv5/8Uc8lQg
         0zdxFELxMq1TuyBUaRw/eWr+k4dGGiHKfuTXyrOTDR1Qxyaczl0eAw2HASMivCsfQMvS
         vLU3JV40XWTmaWYjvNw8k04Lfry21dfnwTkCruNxuDhYs/YPnqIliwobW3bFqOD/vb7E
         iz40kdYNPGUR+1a33nmk79x9mVcbl0cD7EILK3UXdqkoSoOLaWUM7SkPKme5BVLYeWkI
         4GvO1WLr5HQiR8MO0qTDuaTRg62GOibrVOLOup8+vkEMWU05TCeIk2GqS/TBNZpix0vW
         MLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871466; x=1791476266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn13l10L9mJreC53wVZPdJvvDx7swzvrFZFrk8UgCKc=;
        b=iKRwi6nZOMIcCkdCso82VHI3OWLBP6yhIll2frBx2ajFVAEA3B6nOyTfLEC6Aufb77
         +xdO8oHfsq/N7tI1xi2K88LSLcL0yr6nAkU3BsNzt1rsZr3p/k9XEVPRG7sLOUHWPSeF
         nClFFJF1prNTr5OTQDBd4u6Hxy1r+MTCMEWhESHBpxtCiYkcsOC/ynxviX2hJCSD77wu
         MzYU7tTCQymTsDUvErzEMmJAUYVFuESEKM6NeWLNyUb0haJkuVS2fQ3IzTXJZxoH76R1
         tdhjfFUW9bCHqx461O+jykxlGdH4sZ089ml6g+/YPkKrq7tNFEqcxXwAgenRcuxspBNj
         cf6Q==
X-Gm-Message-State: AFq9FYI3dpUmVP7WTmSpE+AMEN109fItjNg4dMiJK/B5IEG3WcJ2pzeh
	Nkp4dEhmbR03r3RbvlZ/w9thCXj/57lqDRI2od8yVGoMzzlHQeLJheGjHPaIKtC49MPFRburVOj
	VaP4FiN37nBD2aCUALqFbv/9LYwtT/zG47qlT3ndqrZCs8U3UBtRdl6aqothpES5V+PRp
X-Gm-Gg: AYBFou0WLMYmJzju3xgcjYM4u5wOZf0wG9MgJq8GYkxxC9cspZ6JELphCJR9/aXkMYF
	YTBCnObpz7PUX5wfjgv+0gQWuDd9R9iPfDBkolQFtHI4uTRX2Vb/GfZd+VcWlt8G3MqgVKsPFCj
	B+MMUMzRIQc+4Bvfu4pX/6UZopYnzp+PzNie+B0vGAQMSMUlHngNokRlczf2k0oIwYqKFHrgQsV
	p+vBic4oQ9yR+2QADHiWHMc6S/smccNhdNLlz0RHYDPe9FH2V8l28LAuS2tH3YSmsNRT0QpX1Li
	2kjnNtmVvh1Mgx4/59niJJUDO9EWk3VWC6QNzWGiAw2t8oFoVDuZRrXUnVQS1ehvD3nNQSmU3Uu
	TXbwhAATRIZVlK3XU5yDgMA==
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130671137.2.1790871465799;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
X-Received: by 2002:a67:e716:0:b0:7bc:a347:2058 with SMTP id ada2fe7eead31-7be722c3746mr1130660137.2.1790871465289;
        Thu, 01 Oct 2026 09:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d36785sm191691866b.41.2026.10.01.09.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 09:17:44 -0700 (PDT)
Message-ID: <d5253189-70dc-4279-943f-accc2b3ac703@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX0jNUpBomxS8a
 tdTmLmAo59aakpMtnf94NjvD9kRskPC5feE3FCPJSmoSVnM7+FpshbXL2fn9JD4Kg9sYnbFsnZI
 kD2ILKBREo4H37q949ROkULC+mp4MXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2NCBTYWx0ZWRfX1dHgCqeEB4VB
 9IeQBjWh/LPDzFY4O5XcbXr1avbofXPw/kuSnbZKDq4YkrVy9riitnCY0t9BOF/qHlYQwzbfEVX
 xYAe/agaBdmNXaD9M7Gs5RBZL1b48NOk3kMA1i+k8m3mPCEfYSx9cmnO3k6pE/9OU2f3Nqt15er
 MC9qYPjFPRTTAGdb7Umh5TF8lzA0MEiL+0ninIx3aDxmGpcCk7nlxPEJ4K/8rwYr+jE6C300s9f
 H+xW88w955XWdczmCWEA8dju5bXX4Pen/1rO63OaPrFqItmXT0gszYM+88aml6PCTpQrLFiyPHs
 G+qt41UehZfv3IVKWrNPuA4go7Hy/xRhv0RAq8CEG1V39b3bGuCGttjIXgmLJdWK7XTa7HcCO7Z
 OIBTMpRuWmS8QM0mGpyZuiLaHN/hOjbpAk5SheAOoIoFSlPZ3dnry0fRXylMqaSGOwp4YuJaIBn
 ETQ4J80lPQqZbh8aOPg==
X-Proofpoint-GUID: TAg8kjzIdAVWfDhAG4DsDx8LCnb-Y1Fj
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abe87aa cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=m8Gnl63oPaFM7zqXGsIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: TAg8kjzIdAVWfDhAG4DsDx8LCnb-Y1Fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010064

On 7/15/26 8:23 AM, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> platforms.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

In case you agree this is desired

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
