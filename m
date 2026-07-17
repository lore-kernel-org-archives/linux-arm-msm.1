Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA323321A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259908; cv=none; b=bEFj36WQnDWYimodvGqGjSkpvwQyEEnPKPajpmb+rdpM6+SeLSBhIwoNhufjwkqQAeGnuOQO+9ivVbaMUl6Bb+QHHwPf97dGhNv8EtyM/AG0uckP86alr0B3YoHB4Dqg0HC4J2KOb3he4v3Di/NHCm8inlSZ7fu/O4beVl1RVVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259908; c=relaxed/simple;
	bh=lgeOh69LMqGbdV7nWGQFWSEx8qferoZaEx5dc/0EC/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoORwn6FQg+Wo3uaXkxJMeL+siTTM5M4UIuvLxpO8N1qhnFLGoacAhr3IGNgHLxIazDitozFm/L/ZTPVz9UEPywYcx7BnZ0prxpQeHMAAkTGUTYkAbYbhpkhSM5cmIRk6VwLG4pyDBDeRCoS4IK8j6YCCzASdVCZOvkWgwL/Pjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lf2kAOj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foxrOsOS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lf2kAOj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foxrOsOS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33oRl314568
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sh62sm/bV4T4YCCFfcyf7I8t
	tuUk1EXYq7Cw+4r57Ow=; b=Lf2kAOj0i7RBlT5MqNnechPUgpZUx48j+noktMJv
	U9jTwlz8ksejWGC/LWyRnyhM4Cm/CgS5ZImIKvrOiRvRZa+qeE4EdSmipUfi48Lf
	/iT1K79Mbikw0TDm66PGJGCZEa/0EjvRCRVTfC9MdZA+WACShLPdV4OoIPoc8SL/
	7TJSSWZerPHDpZV2w6IEhDdmKaDVG4yLJ4BHH4BFy+5vij+HLofAKyb2boD0xidj
	EU0U+JvR5VdRdGryNb8iyJHd+7Cy2cAZvK4sfECiSwKJJzX8ExcLh5Be92YKpSMX
	r5N+atMYt2Bckvpz68s52577dhJ3gXjEYRaJ/G9j9dx0sw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8hvk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:45:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so6337261a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259906; x=1784864706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sh62sm/bV4T4YCCFfcyf7I8ttuUk1EXYq7Cw+4r57Ow=;
        b=foxrOsOSn1kMxsDlLJOl5mdqpaJ4hg90j4FoOSPm5BTHb8YVNNiIUnOkggtjoHP87x
         7PrUI5W6+MDqL85GhwJhziPQizmtXjVTQDiC6x2kSZbsbKTKxyZ86tgPp6ME6atPf1nY
         X4cx7R3WJPifiGFjrhk/0P89YBz/ZJ72IgOy/sEC6mBXh5W6GztJPah905n4ELxet6dY
         koI8izBBdtywa5gVevLmhVdyKsgubH12Ldd8lHCg+N/OPCVWhwkZPmRqnDBuBeUGD0rX
         MHuiI6jJXQBwH2Bh/3IvXLkke8vt+99j7MW7oaDWX8TUJUHzHoPfBa3DaE47kHnkHtfz
         +V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259906; x=1784864706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sh62sm/bV4T4YCCFfcyf7I8ttuUk1EXYq7Cw+4r57Ow=;
        b=WkxJpFkLW/Cstd+kiw52e2NfJ6eXuYBH9sravayJSku3GrsizYzda8i1wr1ZpB/TQb
         09tmNDstlc+6KkuMjdA6nsYfarR6E5LkZRXw3CHQpcN0Wf/e2trFP6tUS/isMUn/IERh
         wW1GIWSZyhmwPaaTlo4ESOaV+m4b+ohPT14JOcACFEs/3XM9+Caj0Uvjt0hKTrAaDKyf
         hkFE+wNVIA6rC5+w2fnyEiWCZSq7V862mir1zETM/qK1gl0M2M2hq7kVZBOJCF0OdbOc
         ie2wB7yKf90GnX1JuEqgyUXdFGr7u2wo1Y0fJCZLYKZnkFjBNCladiXabOoVj5w106R9
         DL+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqk/unk78Oj61A0bwljkSukfOL+j57kgOd7L6xb3yM2q4y0SQIr8vbaiy56vjYP6GagKMcCvm2YgyRHfyaK@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDJonIwgjGmS2IGKl3cU2folZliaWSqOngcbhOPgEXiqDakN2
	9NCfX4WHE9ZN2wj4Um0CI7wZrtebfeyHY0L5v9KPpPO2vNRZqfpZdrelGPu1BhUmu+CxYISqDeR
	zOEyw6DsMXsi71Bb5JqiH2SZBdPCy4feOBc+bsNZMtAA8g2arTi1BwNZlO3yGQdv3t7BU
X-Gm-Gg: AfdE7clhz1GKIsQAJKkdZz5p8ZETEvW606ZJdt8NqaurrEM9oWXnT/WoTT4yBsTXRJR
	NLYgnHO0/Lt86EBN0ntF8uWIY4oPa1qFW7twYfuvvDxW4G314FRmxeIjeN1gJ3YJkU4TgZAYDCl
	qjtGsV76aZ4g2c4OIoy/KY4ClYpiwxgkbcg31Nu7aY/T3cKGZUzQDL7SE51WfDzvazc7SbWRoQ7
	ggi1W88trZ65NWZYgtRbdH5not4pAVzf/xTDAY/3FriNCh5D5bWBb/CI47Wh7SwG+zrzO0gMMeO
	juV/ha85r20NIfcPa9Md0o3Unuwpwb32nocxeaQ+oCOzAO7Wfgpn0JqGsfI+5elb+CLBGSeblaw
	Y9Sg9MRyoUN3ccNKwLmkRccnOPJ6PaWNm6xTtrH2AREk51hM=
X-Received: by 2002:a17:90b:4a43:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38e4b44138fmr910032a91.10.1784259906059;
        Thu, 16 Jul 2026 20:45:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4a43:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-38e4b44138fmr909987a91.10.1784259905414;
        Thu, 16 Jul 2026 20:45:05 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcaefsm1779168eec.10.2026.07.16.20.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:45:04 -0700 (PDT)
Date: Thu, 16 Jul 2026 20:45:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
Message-ID: <almlPjk7dkWVAPxl@hu-qianyu-lv.qualcomm.com>
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
 <81c314a0-c052-4843-96a6-80d8036fa6e0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81c314a0-c052-4843-96a6-80d8036fa6e0@oss.qualcomm.com>
X-Proofpoint-GUID: kPK5z1bQtg-3PmSkOM4lRaKR_sEKLyg2
X-Proofpoint-ORIG-GUID: kPK5z1bQtg-3PmSkOM4lRaKR_sEKLyg2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXyqmu5r5mgTUI
 hMoEKw6dawHqmEmjNYdBvOll6KlY8lA8yeN/wK3nMPHxtqrauVQnbFvM1U+MafBKpVTmoP5rBR7
 h+aOw3kDvWk57lL9wwZ8xHOD/RV1zHM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXx7RzdjQFnkiu
 nSz0S1IJHq4RJy3J1q9warMH8h1ej//yIDK/ubIkvWVtkQAR4dcp1PKw6hKNfqfctqF1FFUUrG8
 x3HWb2M240joQIwXV0h/LZxnWTqswWDkxjUVpVBcX1vWK32Q8N6Q3qLprj0+78QjBfI8MfzKk1J
 evYjGgHn+9JLzp3kYcO6Hip+Glo7jZPZbX9hOoHM/cwl+lNq1Opk52zAnJmrNzcemezneFLC28c
 v8lU9OFAlBg/rBKgJd+6TfBgqe8QaSj8peZRQ3ywQQQNv49Prf+i15+I0yF2rlboHmjQ+6zZpNh
 wsZ1aJXEziEr184z18iHubBCmiL4WSMvDE+UsIKD7Q2HVyp3jAMSas3H5oL1eS5CDOvhNl0jvKf
 OG3J7S9ZvjUhUZAKtXlCUNtBF/cFDV/q6Kd4CTEwqh9nwEb136GtmZBeyzSFSRHgUokzNwrVeuq
 HO0Cri+gBI5o0g8pY3g==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59a542 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=g8wsVXef2bgNkCobJpwA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170032

On Thu, Jul 16, 2026 at 10:35:03AM +0530, Taniya Das wrote:
> 
> 
> On 7/15/2026 11:53 AM, Qiang Yu wrote:
> > Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> > clocks so that the inbound data path works correctly.
> > 
> > Without this, the PCIe link can come up but the endpoint can not access
> > host memory, with the host sometimes seeing a completion timeout
> > reported by the EP, even though the host can still read the EP's config
> > space.
> > 
> > This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> > FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> > platforms.
> > 
> 
> I do not see any such requirement in your code downstream, so trying to
> understand a why both the memory and peripheral needs to be set?
>
In downstream kernel, we set them for kaanapali. I met similar issue
when enabling PCIe3a x8 mode, after debugging, PCIe HW team recommends to
set them. But to be honest, I don't understand how this two bits affect.

> As I understand this was not concluded with design to understand the
> reasoning behind this change.
>
I started a mail thread to discuss it. Can you please help invlove gcc
design team to help us understand it? I'd be happy to have your team take
over posting the follow-up patch, if you're willing - this is really
your area of expertise. In this patch, I only added for nord kaanapli,
glymur and QDU1000, but other platforms may also require them.

- Qiang Yu
