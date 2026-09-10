Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CE3A6EEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025905; cv=none; b=YjtJ61DBWkm9+j8F/b6cbLDm1i/rqU0XAUvkJsf0WQdUbMcZMua0O9PhgLGM3g+szjSD268lTmD5TPbYISPJh1FbwerqvOKIoqsBcRRWglVaLc1cnF39DLAIzRRbAV/I5mMZGJgE15ca1FqgpCmoX8tVv2Yvk6oHzhRZMplo8tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025905; c=relaxed/simple;
	bh=yFx8LJ2aOskQ5Z197d1d87Hlzz62gvVdXK9GUbtNQiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzF/QoR9LA8aMSop4inwNVE6InIJcIwQmHA3R4T/579SaW91rdSxnh5qNrV4eFVshobRf1GyvioarfvIOM3sOuLkFoOCwNG51KuBXaOwj5Zf/MTT9aX/ooR4txoU6E+YOWQR3DlaucYFuYqEiQcMN4CQrRngyaskjhzeftBK/ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ict7Smoo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=If7kV9cU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ict7Smoo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="If7kV9cU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5HL6w2974614
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=; b=ict7SmooToVev/87
	kEaF/I5qPcL62JfNAc+bOgPli/WIhWXg/Hwyb8pJsf11TCh6Fp1L7dQYPL/p06WM
	QNrh65a3cKtmU0OQLTf9cC0KrxXBVRXYOcMI+4pNc/ERijfYet8eQT27PRp/Y4F+
	HtqZXJKl9V6pVgyWN2Ufl1Or1lE+yEeVcNFIDGbvgHaNQcC06rmMZA1unbF4pe2w
	aZ8wlAuNv+CXa28W9QcJBT2WIn//HYZYNtx+CmeeGEKkUZ0Z/ZqD/+DK7WeouHlZ
	yKMtUhvR605U3MJ6vzyw+TSFmtt0DW508S1PpDBFFp2CpJUpRpgf29oaJPLvW3x5
	A9QV5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2nku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:38:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso13136486d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025892; x=1789630692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=;
        b=If7kV9cUdbXQ2Yg9lJgkQkA0MC6iyER7SdRdwDVxlLvNAsyl8gWif7moNnZan/5fnk
         LW+WalsUVVbK+6cmshZiUSuWwmX2PCRT4yr9FZc40hCFzBEXN2QBZRVDVdg/zdBm6Yay
         MEBCuTEhfsMV8l2P9IgtaIp/7DRrtAmmYaLvWyWlMi1IlTPoY1v34+55RmlYk+XEeHMU
         AVHHYlgfPiFautIi9Yz+0ZSV9PrX0VnlDW7sWYYSKZNHRAibCPJFPNA7F2QiuXTpDozv
         haiT17T4c6Y7Tm1vlTHXnl6QqQ1G+Id1tmEb8efdM5FThPPIRbnsl+qy/rD5mgiFIBjs
         FKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025892; x=1789630692;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpoNQYrLBIJhuLHAlfG2fUBcoGRiViUf1SVLvCEmnmk=;
        b=nlxB3qjtn5P/HJF0Stfg2N4nSvzXEvm7lkpBPKKe1ogRnv3fofxdFxbw4/YRcPgD6e
         8lcGCQuudc+sSycmDNS9CvtENadJMl/srkdm5nX77zyJpry4lGcYY0vFZgWsjpSHoE6/
         WQ5p8cZGk0EuNGdWrNuPBAURiZW37UeVo+FblKriJMZjxgLBbcg8tq/DHtd7p0I+x1wL
         q7J+V1PHfjLUpzUPYLs43lHJFWSRylJSwkD73HQP/RLOR55CqmVa48ZIpn41DMtrXWgE
         AuVHnuCKGJ5LJdd1agjI+6D89JMRmqmb/YM0qenS06L6gJUWEfbYALMWqCrPIPbtkNmu
         huRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvdbAlG9oCeSCAEDqUfMPmlNZ2Pf8BfkC0CDHCPJ5DdIS+ddLYzg/rKu5dcKYdylzOuWGIVXALrNmxdHl9@vger.kernel.org
X-Gm-Message-State: AFuF++l1al5E2D7uJY00LFsjbRE0VcA9stPaB59vWnvM3jxe5Gzp11GU
	cysUJIJYfBIA6F6h/vm9S4304M4lGk85R39L7zHJj6zDJ2Ue2cFrwbKOg5kEYSP/6glXFx1Yf0u
	57uPJ6WVtx9BrYfjXAj8LNbvMMG3qGpFPP8AnLBpWGO3TVOrLbUBvM65nFntnGLDeNot5
X-Gm-Gg: AYBFou2QBFy6hC3wpYDLmh1h5FOdb8B/H2vAG9+WbT7UBJ1py8oHtl4RtMr3gA8k0DL
	KWZOb0X+5Pc3wrnM9Kk28RRBL8GItPI5VAyjbeAkw1Ped948bbOzi+jKd8KAXaLeuSz85JQKskY
	Q/+Ol1dRnXgUtjQ2+ThA8XcS7IFmrCFJL4RjoBGMrGoGqWxB6xYHtBt4pWdv94DVFZGsPqKXFDz
	1nGwObjufvqU6cSakP62fGFiZFbRMn3l9ndrMzBMvG5aD9KvATdnl81XknFDl6O50Gc3y/GOs3i
	XR7MT+UtxRJ5a3r3EVZN2eNazFEmtJiTLfa5xyAEuNcgDiBxh21Vq1kYNShCKS2RAggu3uyMr23
	IXYTffJyEaLhk1kLbxJ/Opw==
X-Received: by 2002:a05:6214:5c47:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9104796275amr329708376d6.5.1789025892451;
        Thu, 10 Sep 2026 00:38:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5c47:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9104796275amr329705556d6.5.1789025887275;
        Thu, 10 Sep 2026 00:38:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca88fsm708891166b.17.2026.09.10.00.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:38:06 -0700 (PDT)
Message-ID: <9dc6664c-616e-4a8d-8cd3-9a790c09fff9@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] interconnect: qcom: icc-rpm: Don't skip small votes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
 <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa25e65 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Bsi9rA6XVeWCVWKWEHwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 8LiV6WtbGihRRh9dIunv1LyrdNxVRo3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MyBTYWx0ZWRfXxYF8U1WhHLsX
 pofTQb6YAV15DJSREOPdld1w4YjitrFnSHglsj6tk0tyjV0S1mv4LD1/qb4cv8LPWCUOrbuOCjj
 1N1wqvQ/OQWPyEOEpThhxNgjcRbOaUthSLS7+IfWSo0gdx+MT1dc5tYkp3GZ0EEyCKCZkRdS24W
 EkauDpr5PykxMGyTwtnsjSeisJxwzPRRMyKXtzKann6/FXOZwZVwKMuQCPotS9BLae//gvrt9gA
 3XUtaC/BAdJl1KLTF3oqdSgAmk0x5WsnAczKU7W102d8iGLKvylsFKGjHDNCm6UITsWScQQ6QjH
 lRjeax8yonojO5TouIpdt0yebesNMnjUB1zlWc0F60ApTYx9nszamoeiuTt6XGuIyy0Jv5X0S8x
 ldaD2dZGFTCLLv52El9pjJQXB8GIc5p1nEVpdMTUJN9d/JCgkG0xYPVz7lftp+5w7lCjFsCLqez
 RZrdTdmyFeErdWq8QAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MyBTYWx0ZWRfX40jVdG0s6TtW
 WeGsSh73YzRdUzwCSW0EjxBcffoAcQt7OOXKrHZHr6yQLNzqakSYEOmfp+HgCNto8vGxcYjEFDP
 jmJG86KzJA7QzQMhDQT6jLboSlDV/7Q=
X-Proofpoint-ORIG-GUID: 8LiV6WtbGihRRh9dIunv1LyrdNxVRo3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100083

On 9/9/26 8:38 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 09, 2026 at 06:41:55PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Small votes (such as 1 or 100) can end up being rounded down to 0
>> midway through the calculations. Use qcom_bw_div() when dividing to
>> prevent that.
>>
>> Assisted-by: LLM
>> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/interconnect/qcom/icc-rpm.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> What is the reason for the drivers to cast such small votes? Isn't it a
> mistake on the driver side?

Yes and no.. the interconnect infrastructure on RPM/RPMH is a bit
"meh" given it accept kBps values that it then converts to bus clock
frequencies in MHz that are then clamped to one of the predefined DVFS
levels. Many drivers want "level X specifically" or "anything that's non
zero" or "anything just above the first nonzero level", but due to the
differences in topology, that may translate to different values on
different platforms.

So 1 was at one point deemed okay for "i don't care, just need the
bus on". I'm not sure if the uses of it are valid, given that doesn't
*actually* reserve the bandwidth on the [most often] config path
while the driver may hammer register i/o pretty hard, but at least I'd
like for that to give the expected result.

These "safe-divisions" are more meaningful in the RPMH world, because
each BCM defines the units in which it accepts bandwidth (may be N
Bps, kBps etc.), so there's much more potential for truncation there

Konrad
