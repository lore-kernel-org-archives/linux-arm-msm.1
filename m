Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082844;
	b=zGP/RcwUV3n34lyIAqq6HFFgC1alE3EmUL+RWQT1C6Of92GJUdoOZ+H3qkOdszfAaXGl
	 FDmns4gHvTL44tebgUvizMUo3O2Z14QSwjxMAYNtTqKlueRtNbfyLQxB+v7ALJ0wfZ3Dj
	 GDqS+QC7KcHm3ln2Vr77u27tbqwUXNh5YcneVk0tRQuPq9Y88DqHraO05o+OElBO5fqix
	 fAC1kqFXbVpOhOlRNavsNMgtUzAv03NqOSqqHh3cgEiWSfPbBc1JqcPFnMv7x/Tbq2BR5
	 Hxm+DMpoGqElDiTZtCtlEmho6iX76BPK81tBTWKk3akd39XfK2XOTy43r39ssrXV5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
	b=rw3aAMvn/cyJktlxqK0512bhyYw/uqIeHMHTCDqcWzRLP9PUSvTsUoEOAwivYfJWFyP7
	 h9T/qySCUXT1CdM7kz7TQvYRha+0XF6nzeJfMou07bqmCsnKJ2C4ierJvWkZbGxDXBnKo
	 a4tQM+N3ybtfUpZF6t2phQ4d0Vu+Nqu6mX+mTkNTytuKlJjI9CXnSyQCUQwSzvpCQzULT
	 ahiT4PAiEK2SBvfctTqpxPB6BLaCR8xWXdA95zMmb7bktyJGxqoLF9TFn2qGP7LGzUWrd
	 Wv+7a+CdWw6Fd7NZuJ+/RzBhD+sx7qvslwoZ7fSGppVfb5QPwuZs0OGmD31IQ71t7NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5m6F+dr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mm3BCJUM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904C7606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5m6F+dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mm3BCJUM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJNV3950123
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=; b=g5m6F+drEHQbgNHy
	PdD/eoai3n3Zr7ZOTf5sb5iN1PqIXksIwhCzg3Xtya0lrXb19GZlI9NCAWnF1fyl
	+id/BU9W+R6wI+DU1TKG6jPyLN4hT8hXezSFPvHnHDOarSjzJ3BgwaIA03spEyD6
	bQlXNZomSGWrXBqzgprMSqfVqkgg/xYYuVG3AVuFNQoPH18AfAPUN706bNIsfYmG
	lvhg005Lf9NLbMqvSWx3dKSr+pD67iQREJtf0eRjYygaC7PXWqE9IvckZYyJq3s9
	q0pterFffdOCDi/onRvaZUAJtm3oNg2kys9UezdXJWV2b3Pwv2Cl5vQCPK03Ep1O
	wJ34zA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54je7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:34:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso5985716a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 23:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082842; x=1793687642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
        b=Mm3BCJUMtzIz/7AEdB86oiDIG+ymZlln4Q+zgLFFa9nD/LPQJFfNf1FeByLYbv1cmm
         hfQP3UHgiDQZ+G1RMVomfpkTMo0VcWPxpWKpJfrt0McTcHZp+v54Apjedv9ReU3sRtzd
         VpuB6G5hNozt9Kkne6EO7zSN4kl8RkRGnQYDDdja0uMSxGwGxAei1TcFxoCAxWRR74TY
         /ZUFSGXw3wCqzuXhSPEnj5QhEiyiC/BUAo8feNYrRBbYpxBM6a59JRYCjf+ojBIdbmZq
         hWiMVHktZYOkwX1syED7E8lNunbPJtuD0fqIMgQ9AfmqUkkZdcLoCVrRYlwgjf5Ao8iB
         zSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082842; x=1793687642;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
        b=FfFLdZb3KqfslzRzO+U/ErlkYEbXHDCGZvjtOwH4dd9ZF2J7Khr4P14wDDxYCnc6c3
         LhZYW+P2FmImv4/Qti1OVZLtNdfCo4yKe8DJZdupsb2eTOxTDBME5mtBjOqMihyD+ebo
         mVSNJ6AfHtMO6wFYQWTc4ORBNzl5H4xXL8l1hFlgCTb8e3ifVojC8DBmgDz6U8SVDg+6
         DUwoDvjmC4ZfmIysvSrw6Jpup0S+2viZPljnTdO474OGILFBRl3PbVMJtoThj5irlqxi
         w9Io0vyxz7dbgs+A91RZxWHp06nC9lQLf0HreDg3HGEdwPblCi5h2M+E0bfSx/pMQH1F
         YjaQ==
X-Forwarded-Encrypted: i=1; AKwUvBygGaH7TLxp1SsxwYAINtpDnG2OXn9RI/nhM4Vr6JCpK64FkKfsrwYu3S+xDWRaaSZUBC/T3cC0TyB/zaoz@vger.kernel.org
X-Gm-Message-State: AFq9FYLGjecKF4VB4sns5izIP8Lu/9PPqHTXfmMwCjitAYth54iH4wgF
	PWg6Ved3l1V8NskI2fXI/6iBQWucUkBu2zOAOKosieeX8LyxqIQgj2WSC1Xu+1qP5EWsOf95vxG
	hH8TAwP3t9ZTQ3BKTjLsZYrXOD33FP9dXB7b28rFw+trX80A+o+uQAISk/b3L/SInvEaq
X-Gm-Gg: AYBFou2C2CytNBMdl/TczZIaBYfIIelDH1Fv/6aB9sfwhkCsHtSmaE0GJwBNAmREd5T
	BjbYK/E4NMpHFBDFVfZTv+SoFoK/N7Fjt2nLZOagjO0Tv013aVjLKgN0QEdmvnKAifrJIQ/r5KZ
	mmEnPsu+zGTdfZYncaQ1WGRJOdOeXCYgCbj3Q/y95paj/gueLh7NrjjV1++pmOgZmbzIzZ7Not0
	BOX/D1a3u6uEUt7ZG5D8cU2HG9+Jkd9r5/kd2U2WUUUH/nM/AGHb4PM/QOAMaliK1XmVqOjsfU2
	a0fTjR7vVWA3ne633QAA99aQFXhNR1o4G9/HUrF1aV+XK86OLfe5HNTZ0OGBMpM3JvEWTC2iMGJ
	0X+zo0assoUG88IsIRHx2oytaCQ==
X-Received: by 2002:a17:90b:3803:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3adeb101a2dmr7179870a91.66.1793082842033;
        Mon, 26 Oct 2026 23:34:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3803:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3adeb101a2dmr7179851a91.66.1793082841527;
        Mon, 26 Oct 2026 23:34:01 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404274b2sm2238992a91.5.2026.10.26.23.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:34:01 -0700 (PDT)
Message-ID: <236471c7-cf05-4019-a590-b803fc471484@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:03:55 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for a TEE agnostic Inline Crypto Engine
 service
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261024185602.GF2553@quark>
 <b5cc804e-0f73-4ec9-88bf-ef6dd04eea83@oss.qualcomm.com>
 <20261025171903.GA2212@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261025171903.GA2212@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX/lqlIT95iFTr
 gAyM0WXqi3HBaq4gzBJ0d4F9j/nbyvm0nyFOhTCeoa+1MFUv++2Gvz8g3s4j0I7szb2YS6kWMxP
 L67WRW43nVIPnVfOzKOAjZesVaERd48=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae045da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=_ITZaPDcee3h4uv5GAYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9_p9RmXce4CvRxO7yoq6DHY4MSOGhNhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX4W1zFTAr3I1e
 U0GSb4+Mp1joRgIzyKOvSxUnhCWHBl7tSb1fKU/DOP1IN90unj+aOT/BQwbXYcpF8eBOWEtQz5D
 DHfMq0z9BbyQaUqHZOM3Yfmc/hxDMUZLk8eFF60El6jP/1ESqWXtgUEcMM8uAM/I9gmfPFL1xN3
 t/YoX8ODpy9JjN5rOTEU08zewtvm2/B3b5tq3Xv2uV1k8m1elyPHhmVzWrtu2AWsA0281uPWukj
 EU8CNuZNF/qkaLAh74c/drmzW2JIOZ7EGuYEcOPkkGx1P9NhldvksUlQepIjTbG1tah8ZWFYt5E
 1Bcq7+vVCoaIryszNordrtuqUa+6WjC17lUegKXTjfQBDLm+GV01pwHZwiW7nhQx0xBiunl/Jte
 rpUY2EyiZVzm50xp0578SZ0ns0jaMCpCreAEYc+OiwTqFnNvRcpxbRqntJnQEc5L5YEqpV9bhqX
 YqY9cXF6fIMUtIDCrZA==
X-Proofpoint-GUID: 9_p9RmXce4CvRxO7yoq6DHY4MSOGhNhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270025

On 25-10-2026 10:49 pm, Eric Biggers wrote:
> On Sun, Oct 25, 2026 at 10:16:49PM +0530, Harshal Dev wrote:
>> By moving the TEE call re-direction to a separate middleware we are ensuring
>> that we only touch the 9-10 lines in the driver which depend on the TEE firmware.
>> Merging this functionality in the ICE driver would substantially increases
>> the total file size.
> 
> Again, it would be simpler to handle it directly in the existing
> qcom_ice module.  Yes, there will then be more code in that module, but
> then the new single-user middleware module wouldn't be needed.
>

Sure Eric, I don't have any deep preferences here. I will move the middleware
to the ICE driver itself.

Ack.

Regards,
Harshal 
> - Eric

