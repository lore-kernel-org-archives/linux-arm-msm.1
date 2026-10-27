Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090166;
	b=Bd1fL88YF7sNsQ86yB9k+s2A0gCh+mvTKkJEyj0cu+N/7gZaWXb+TSRgER2mmJD8nTnG
	 CndxkkTf9DqUaihXZqO6VTR8NR6rx+OSJNgprBrcZ9UvLL8LXpNmS3MTf0PzxHJl/0LjR
	 HScelSvTAB97lkyoenWJcKFS0Q0Fuy8p8FSroraFJz/sf9RsdmScsQZQMcbbeuhqEMMhM
	 aiexZpu+HRSCKPqaa2hk/oD1yOiz2F03wlYfxDTXjrOs32DOgHiCfWekcA7Gh77QnkSW9
	 rHJe0VqvH/kwCLs7kV7fYMa9EeJHtsZ9TzWH5iwu0r552ceOjQSb7dElynDBmtc72RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090166;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
	b=fLCapJDe8+mbXEHGjtc/A6sq4JLFm8JtF0rbmwB8n+1MAxry3LHooeQfIP0GvOMfurkm
	 PbUsS9ZX/Gh3k7xTgdsyKw9VfYlWtaC/iFP87wxzl1Gb6u+9rUeZo4XNwGAEY15aXAaKK
	 axsXVDJQj14hO7puH8AWY1KbZMkx1gTt0V+5t636ZAT6wmpN5+923uAOPabK5EAdoH36M
	 9eNCudHqN9QyTQ2Jkk/ILpo5TMxwJeBKaOf0Ye2tyeyDEkGQ3Uk+9+MDgFHD2JYaffAVV
	 /dlC1Jtd/zpzTO1aA1SemMGShyKNWDQPw7UxCpMw+ect95D4gxQQZ4vPMSxJIAFpjww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZl00uNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fsT48/+w";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1920606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1920606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WZl00uNo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fsT48/+w
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJ163950116
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=; b=WZl00uNoBQdnt2S0
	YB1m4Tf03HlEr6meEzoF81gMDGwApPhtgPSv3aF87ZFDmgbZ/mNQ2gzyLEiVHOEq
	bPfMm4Zh39MH5BUxtJXkMcGhB045stMayepIYGKzNHNW9Y3joAWMT6MGUQNamCcQ
	7qFD8zUYqfJOMcKLLo1vdpaO9H0ovTvduOPHdQxX8i6Vd3XL1BzNUaKcnq5oTfh+
	k/0/PbOefWy343XxdLWC2eGjn4z1cxZwfFW1vgrkFY5sOBV7olOPaytGmxyEhoqM
	3YVssJY0pTjEVsrFBhQ00voYV0SA3Gtqb236AckrNh9ggS0ToxSl3jEc9KnKssiV
	ivTpxg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jvj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:36:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso9154805ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090164; x=1793694964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
        b=fsT48/+wTIlGb7Cz561NgUocbwZbnONnd3475+kaLvBiWzQlfeYx2C6Qb9kdx1omBO
         Rjf0VmLraMsmKVKgHk8vtP2rgzcOgNA29rDYlNOggqWxtm5m82hnskjz2sHOV0+Bhum9
         UJaRXEGy6PSp14ivyRFSVtLgt2tf0oEb8UWPuRoIAmlIqUCfYsCwfiFbKkNWBLq6Haqk
         qnQO7aJqT0zXMGo+fAnDaUaY0dgctoMY89x7+G38s/45Jpk965kYW5QTNgWjbIRVYczb
         7+xDN00u7n6BQ6d/kj/GjFt3ksfrIKWs2J76hE3IrFfK6V1/7HU5A01lWqbfCs2oDsnd
         7TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090164; x=1793694964;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvY9IYbazDj5cgxSX575pRfs5F9okmqxLiTZfoAtW6A=;
        b=qao3SOxF+jzIseGOSFg1TgAMrljSNsDW+dOb/iHgjDm02EJ+JJTETjIB3qBc4WmJ3L
         5EfG7ML/VK9m6muE6PBKatYiMRIq3C1m3Yujp6lS+J7QtY2aNA8vSaoeQIEZnBT00Kcj
         ZAjUrMZAss8fLOl0gk+QdSfI3qa5cILy1xhPx1u12mJd1C9tGxFAfFC1P5GOMr13FGIC
         H+Kx3HqR0HGsj9iDXmv/vHXxOHjwpbFwDtbXyZLalJjDalYJMAM6/8E8NBpVc8Pp8iwM
         YE1NwATVIeC0v3n9uAdzppZM3cgar4xwr9CnMg90EjN6NGxOTqqMQtEPJFIjxEINi6H9
         Ak3w==
X-Gm-Message-State: AFq9FYJqPf0H08wgYtsHvbm1SCq5dva8fyIjWko7mm2bzct/ZP4FtGJe
	syBbnrcnvWPBt486bte5cH8RXaM6MIVoR3s38pPaMbs9sYKw83F3xMESd59FTbVSYLAoAXCs6OL
	k/5SPKtuCOk4BUpVSjudSkK47odJszexOeBuJIcNRCHp++sNC2NgwCCFjTNAaN0JPg9yv
X-Gm-Gg: AYBFou0J/aLFXKqUfYXg+Bpg8ZVMDc6quwN2OZntFk90moJeTO2W8dGkYFWqIGDhyVh
	JhUW5qFGaqj4XOxuaZORBKxfPD23pJ2ImaEw4y1jbyq8gHqbPxPM/OF9xjY/m6kPP0wYeb8iYCY
	76YdIh1jLlt5eZbB7GlyW8GIgNLCTEzjG1rqnlu59E0GM16NViTHdi+IwTpOJNTxoy6T4z69meo
	Wl5+F5Jv1MOW7uOCjHGrNVSoWdBn5v2U4KFdNC7/vTkYYmjjfh6pqIVJ7dtSj6Z5SHw7idfZ8JD
	b3SFbxr18EaCEa3YS4Wfsijf6f9PMeNb8wkrw8l9G0ECu7tQKjtGHyqhtoJWkXtRz58H6Bpv/IP
	zEN4EhOZTJReM9t7o0ZKxiJL65vKU
X-Received: by 2002:a17:903:2c04:b0:2e8:3a42:7edf with SMTP id d9443c01a7336-2eae3d18edcmr12346205ad.12.1793090164454;
        Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2e8:3a42:7edf with SMTP id d9443c01a7336-2eae3d18edcmr12346095ad.12.1793090164009;
        Tue, 27 Oct 2026 01:36:04 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be65f1sm5508205ad.38.2026.10.27.01.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:36:03 -0700 (PDT)
Message-ID: <ce4edb33-72b6-44ab-82f6-0efbf7111617@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:05:57 +0530
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
Subject: Re: [PATCH v5 06/11] phy: qualcomm: qmp-combo: Add v8 PCS-level drive
 level tables for Glymur
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-6-3848c2615d5a@oss.qualcomm.com>
 <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <08503be4-d40f-45b2-9f78-27f49125909c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX2ZE5XxbCuTm1
 aLgSdYv1LtobxfGRVk8viQCTESpClnhERaSiecGniHssekxKimxTkY/D7/N//h8VjyzgdJmHfsS
 sqtlylC9UCQf3Owx/lUNt+V9k0X4iSA=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae06275 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fDIfHCVy3xMQvtPnWccA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: fBtAJllP4VeylA2XNQvl5MzVyagAQWIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX6TZZafqq3hwr
 iB097Zf9JS7UXjbRUy1NrdoITJh1NXTXkpaYYWR1Soxs390G3Aj0oWnzsi+ltQl6OhdlS3e6FmN
 2WUVZyGPV48Wm3DpVAPnkfAr5970Mf9P05zZmTD0N/ia6Ufx5FAolw19uGlmYLgmA0qRIEVCqmu
 G+xTi31Js00cv1L1fliqL+OPfKPI40Mu7oU2HpJQECCB7KonGvbo9A42XEpqwi5aeWI4XIbzxAa
 MrGw4lNZYwAPLb/DrKDz38LzE5Kke4llkqz7Pvv7cmnxKv4wvZurxlaMe30Pg2sy+oNCEI34N8F
 Hj71i5bmBeUcaZvQkdYD41Ofuungtdyigr2ON96CYFMl16NAvRMjDJAe4+9Vlb5vZIRqDQg6a+u
 9M5WTb/+oZ7XAUG+G18A1o1yWPNuo2xESovYNPMq82aNnqWivXITfKxmeSZrhC3MFmzDzN7JlN8
 ba4zV7jSwrAA09YQ4EA==
X-Proofpoint-GUID: fBtAJllP4VeylA2XNQvl5MzVyagAQWIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034


On 10/22/2026 4:10 PM, Konrad Dybcio wrote:
> On 10/1/26 11:34 AM, Nabige Aala wrote:
>> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
>>
>> Add PCS-level drive level tables for the Glymur (V8) DP PHY:
>> - qmp_dp_v8_ln_drv_lvl_hbr3_hbr2: LN0/LN1_DRV_LVL settings for HBR3/HBR2
>> - qmp_dp_v8_ln_drv_lvl_hbr_rbr: LN0/LN1_DRV_LVL settings for HBR/RBR
>> - qmp_dp_v8_pre_emphasis_hbr_rbr: updated TX_EMP_POST1_LVL values for
>>   HBR/RBR
> [...]
>
>> +/* HBR3 & HBR2: DP2_LN0/LN1_DRV_LVL swing settings (PCS level) */
> These comments are a bit superfluous
Ack, I will drop the comment in the next revision.
>
> [...]
>
>> +	/* PCS-level drive level tables (v8 / Glymur) */
>> +	const u8 (*ln_drv_lvl_hbr_rbr)[4][4];
>> +	const u8 (*ln_drv_lvl_hbr3_hbr2)[4][4];
> Why can't we reuse the existing fields?

No other existing fields are matching these two tables. That's why I 
added a new field

Thanks,

Nabige

>
> Konrad
