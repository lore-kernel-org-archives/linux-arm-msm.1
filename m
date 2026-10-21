Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792554105;
	b=j0zyFROtQgnZtqzNVVSwUTyocUio73onKEzGJgslsCQCC8Xd9J6l7hKQIsL80SXcs4zr
	 +Yo7YjfzhYtxuet3DcT5QpgWVpRV3cgJ314mHRO3/VGal6YQLittW6ck46DFypgOfK6r8
	 yEOkJLncB3dzPuzbXCYTMZdleWS/lVxj42DfD+IX9JcWKdZlWw3RJAno7uzv+U8YYxkee
	 IMUg4t/vxgGLwfZ6BvVdavNHZ1Rnwn90Ome4BHIH/eg3msS92kegV+buABYjJC47iqZAp
	 IxdLcvcPH1wKuusy6TXzLTk45728m/i4X7KEObTHF957jz6wrczZNEYvNvXaoSIUZkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
	b=dzoTesSF2t4mcLAAqE+mDgEbKS7nkfLtVZOq4WRJSEytGo8OUa10wuosnhhJC2ko3CPS
	 ayegobMGfB/yVpd/aGbFQrX+xkEw3YCQZEd6cNDDxWHnyw/7GJWchklk5B7GhQNwxQufo
	 aiuG0X5Ui7p91KI9tUD27WVY9PkWQYCs6/wNuSKTzc/FExttzbVakv+EMre4x1oT5zr5K
	 /hCNWKFB0GMVglTgqyL3OIYT5OJNeGLVljDIBdvhT1m95Og+yKXVpVwK4aoTY+t829xR8
	 zRjRNPOv+O+r/vKq9oVU5VBYXmoUHQbfjTBuE4WRtPg6bUYKJIYBTY0N/4TveEhUDLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2D606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B2D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vssd5sII;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcJeIcHc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L2wecl4081513
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=; b=Vssd5sIIrq4j8ts2
	ijkmHc7MV0i+ppTspuxGSeXl/ZH9hsFZ3HwCKL8402xJXkPgW6jllrGqbPa+afbk
	/1usO2KZxw7ZWF+UhVts1cQ26Ewagw09xYtYXjCzXlqmrGho52GS/vTIbsNzRAiV
	ozBsNyW2T2N9qOI+UYJTUI8FToxlgY/go1Kt9EENR2IGrhWyBfpOOxwzD+IDxq4x
	Lbo86PHKV6K8irh+5hYZkARRqsJZCZq3q7Jfhg9XWEB3M5AEdkcXwvPk/GlnFxLO
	Bm8tqNtDX26AcZBX71YpEXDMWpoiYC5/HJ4k2VaifOuloot+pspHckXLJzMN7sfp
	qIaVgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhtyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:41:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so471937eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 20:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792554098; x=1793158898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=CcJeIcHcG7oDszfV09U574nRRY69IX5wtr1qG2u+A+7FlbMujc4wDKqWUoarzUO5D6
         FgIaA9TbK32E10WfJH0F78ozHHTDZC9J1fKS3bQiy73JaLCPrOqvS4TOXoj+aUxw7lwu
         iiFTrJRdvD491zUlPKBlNTPDPI6cI+7P++l/uDLhCZHx+NcCPmP/CVFg/9G6KSJS+Ba7
         DS5mSgVohhQdWUhoPJpqyXwgPoBpWN3vRnz8Cq1kCfyF7r87EzoMlw7S5jW1vwuEYfl0
         u++FlsP4Y2V2tDPUEukjwmuii8ah38So+lB8veCXiDVMUibG+r1xEqllGX3opWM/V6dD
         s/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554098; x=1793158898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/poii7ntCkR5hoPGaSnYaJo+ShhLQXyXUGSuRcNbA4=;
        b=S2KTXslLx1yhJMrG+orfI9+qfFXGWwTcyj7d4enM9vRwRQmZw25hTgJirpuBnyy4oj
         RBdFCU/+26LTIrKSMtl7HPhWTrHVM4SEnc8pSC8rkyIdm9iB370mlV+6WdbhD219lPnV
         ajMgXnVhOOR03d/nrtsQxEGe+T5zHnr3ocrbv/AYWJOeHlviKviln53P7GTkUxV0TtmD
         1FVf0mbAodHWNGrNXougjIehpqv29tMtDBWxdswMbkwuyoaBt+eHzk4s3/qN46xXnqws
         cvIdLxyXk1wUJemAL3nukXGZmu/7Sye75pugH5556+7xQbQiHM0DI575q7Ioh3xcA+My
         9UJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8p4GrHlHDxF5Aie8Awfdz+RB/AHlREdgBDwJWEKl2tAUXTve+A2aZSbhPteExv5fdYRwXtxVI1lq6gJor@vger.kernel.org
X-Gm-Message-State: AFq9FYKnk+RkEqUcpgLcCEXloqHgMNbhxzGmK9P2qL4sL4Mg8lfCguT1
	UZldk6emoi9IiiFbkM16qZMNUa6iMVYVZWAj/b4ZBW/m/1ZXsYDjO8xlmgGOqe/Qq6pV/03gGqn
	vVHDYsfVIi6PeihmGp3n5kflPYAOWqtjmRcGpWzmv4jzN2tc6wEYQu2B6aKU3r/dWM7qT
X-Gm-Gg: AYBFou2awlvbyyPK/0IidYbyHqE3ZcnMHeTihr/j8cCuOgvVXhFUCr1NOHiH9Byfv9V
	K7RnzW9PgZhfXM9xYLF/0M4TBqwViWJ3VHREAopLrXZ7fHebvwAOMsGntWCkV20xdoKntNCW1Yo
	o3rzXdFna1xIffc+UaocZ3CfVTaGMG+kBX694BQrVP4Oa6bc9zrEUbhh4iysEaZBOhoqUtvth9+
	fZjun5oVd2PrEHEXA9ulmIbp7c8mD7PmM6ZZPr9fSKBSqyIoLdmTfY/oz1jNvE8oEV42G8m76j5
	CUT5nt+/x5ff1SVZO9tF+wyn1IC/PGucVeXjcCD/XHwFCGdldZ31LDm0/7LehllF9LjbE7bZya3
	oHUf04cAtsWJgLhtMeTnQuuLuN+XGoQ==
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236459c88.42.1792554097922;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
X-Received: by 2002:a05:701a:ca01:b0:151:8280:2c1a with SMTP id a92af1059eb24-190a6dbd524mr1236425c88.42.1792554097382;
        Tue, 20 Oct 2026 20:41:37 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm3336442eec.11.2026.10.20.20.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:41:36 -0700 (PDT)
Message-ID: <92c02649-454e-4b68-a9a8-2371f8a6e5da@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:11:28 +0530
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
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
 <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
 <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <708b9edc-3ee9-49f4-ba62-9fc2806168dd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX87+fQCJRHQXQ
 nIzoUvqnQaJFlG3iAxdHGT842BrsRtkOiHyAmoF+93wld1HOYgau6lkkhQjobUCmDovAFxjH7qg
 eCcgwBRxGOZGC1HCZpqfRbmaNKS8vRLhJgXYqXsp9Cmxev05z2aOT5BYOTnpYWlCGjh7XGjbWc7
 d3xzqXsDb98XhNYaHpqAxAgiLAHaziY5HRutF2Mu8x/rKwftiiDUCci/qNehfbCeFKG8Hd4RWxb
 ix/rk0URUmWB3uvXgQKK+KWhbFI99pApn/K7BFYR73vvUpgmAmpvA2FcodVeBzJcVvV782wfxmt
 7D0I7+TDPKXk0qT7mzgike7DSZWnzPZtplK9+dW9UDyZgAW2mRwaXrBVSVj2A4ODLlv1SKr1C4/
 ItOWB274CzJ8R8yeiW/05TIHn3vWFALZcTW57SapAA0j7mRTgt6jm1MAixFDzLFsJ9iLQAvdjra
 Jb9J/bJEkX9k/eVDGhw==
X-Proofpoint-GUID: hbAoDZmgUD_S23P38tJTfObJS5qmBG9H
X-Proofpoint-ORIG-GUID: hbAoDZmgUD_S23P38tJTfObJS5qmBG9H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMyBTYWx0ZWRfX0OqGUfNE7Pez
 8V9HmPBmj5rvnbDlugJxKWNLhnSMptRyMbUDf/UVpRiBr08zlybX7V826iq0UVjijuyTVgPMEbg
 WKFMQKiznj7Wp/U03QPWnsyHqucluVk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad83473 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TgBa4wLDfMOKYiLJ7W0A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210013



On 20-10-2026 11:24, Krzysztof Kozlowski wrote:
>> Krzysztof, should the binding example mirror the SoC bus address/size cell
> Why are you suggesting in review something which maintainers never
> suggested? Or actually opposite to what some maintainers were suggesting
> before. Code has correct example.
Understood. Thanks for the clarification.

-- 
Regards,
Nihal Kumar Gupta

