Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768719;
	b=n9QkMDW3UJwYS5udfWzysMFNLE6ntpoH5ulQu5BIA5PaQVoqcMcHwvvKj15C4DsbtEOI
	 06epKnOe2y1JqDXDJSwhZjsb7LQSnoI5uElENjyQfka7Bkeh/hFQ+nx5BYsLoI7IAnBuS
	 lukjJRBm/Kool9DwqL1+6iMVzF6Kz3HjKecJSwwPDBs7RleDJvEHVBUaoQHTHJVWQjT/l
	 HBFdGJOKnjkwzbNR0M3rDGBIRSzzvm7qEYhCUO7jlrYAq3MwpaVpMO8K94Gl7UGk0DtWw
	 pGXFfsiHBquO0ra5Unt/U2cHvE4wfDtk4BgNuVLVsLufTuAPgmb7x7BMghacPZg/ztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
	b=RpbckB+qIfXlUZgRSYpHvoZ2MvlOwfV1gIYeTTqJu0GH0+aMWxyAH6O+LMVXPk3SIM5J
	 yTY63tmZf7U446xrGdzf4XjJdX7Y+ige3rBzOPu3XmtPG+iuSMg8B+BapGSeR3M/tdeei
	 V4WTyY+F9UR4wccIUmZ7DHYVptn20j9R7h73YECfzxycdD60bMOWveEV6yewwNvmP+XQ2
	 ytIu0q7YmORvHMWnCJz1R8Sp4F1FzHKStXM3M2fXlm7Po23ShRStny714FFfx64ldMGf3
	 MdtrMN5UsICsRAIRDAuNWdxFfGHKUJYo0uJRSrszMCEsrheg79K1NuJavXxwv7H2gBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF6606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ECF6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTyPVBKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yc0Ua7M9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H3Xk1076540
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=; b=ZTyPVBKFf6tDcZS3
	j69kfanIfq0zT99v7awhutNb8AEGt7nf8GIY0VAOpuTNzh1bhCUSBQoctr8WRag/
	2G1HrQA4KC9hlaxz/OL7bABnSt4YVGXL8c9Jw6SpVjf0WXvs/AEnmyj7Ttxe3+LZ
	DQVl+svr3kkwl8pELwitzqTuVEEnUR004qH43ii4KBOhG3oFEPB7r6M1I+M3FW87
	eFDUrjnf/5wR2DXvWqmKUVt/bF2Ki1kraRRw08AEZG6FmOV5vMlMT1JQQfiePK9u
	6n+jmQEGexaqqDJLB64/b3JXWMqcy2u6Lib6wYiHdMbgRRAeqzH7x5EuBEC61M50
	4Rzdpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55t0ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:38:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c4997063aso21464631cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795768717; x=1796373517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=Yc0Ua7M9lQ8To9fWdrbilqI9vTQgtYb6n4IdOcdMuWFxeNtsgnFGcHu6nWCAF8u91k
         7jhTeCisP/dghy1ILzJKVhurn8NUQFBOiLpeWXe5HmOgnoc4l7r7YwXwHmH4E+6O2nD6
         QYLyEBJB4Ojo/0BeVN9SFQtHoNJghR50Hb3vertIvzXsY2TXf1rLxar5J8Gyhn6nFbv2
         McXvyuQdYQWrz5VPnE+Ql1SFG3ZZPBWArFkigitQgUai5nNHBeB+LhnxfxhcpqI3o5A6
         K/hwp38u9a52Q3pyCCKuMXXgnPm3UsIau+MAWWYvrSWkvnNRzkw+l1jgVS+sso5HPIzv
         6fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768717; x=1796373517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1nrmkdIdosVB7bTutfD3YeZ3F7cCsI83HEwD9gkp78=;
        b=lzZfVW6wC9aSEwGB74srF9wLDmZ5TBytrby9bevaGgpXw9uPLfNJ0QC+luGJwNmTME
         v+fVeHPauwpxLexj3f7f3RqQYrurSomEhSwnGEMUp5PQrYMvYHi43eCs4qOX3ntpyF3j
         WymWStOP9B9EjNW5WBWlGzONGoCec3G1I08Y12oWH/fJe7KUQqGyiQf7lqx7SXqGxtXI
         Tn5cdk3b7vgPcVjihX+ApSopwC2AeZvAhMEF2GMCdirxZj9+3afnKeTZGiCq4Wp5Ee8w
         GoyBJzBG39H5mwyWCm1W9nvET4vEvxDC2PsN1nq780hStRA6rx28NduQUMl9gMoz/CUM
         QLkQ==
X-Forwarded-Encrypted: i=1; AL+hErG1QuVi8jvurtQKKh36FHAEQWntmY0munvzkyy4jHunakBsDkzC1h/+T1BuvlSTyOoNK3Py/iZ1VX2SPEBM@vger.kernel.org
X-Gm-Message-State: APuU4Z+q6ztzueIdc+8DLtxHi2cXArqwEqv798KgaNEfzTemf2/B4WXW
	oQSDPwtdw1IwBm05FcAcv9lTJ2lxSaAU0pXdcjN65tT8d4wohpa55FLi6aCJVYw28r2NL//RtZ2
	Jrro4P+qLI3c+i+mphD8moCkAiayJSayPqocoK8smd67MbSdCG7DIrZ23FR8BRazNlp4d
X-Gm-Gg: AZFdTZcgw6JAnHwfrQx5NqZkjJPd/pDKeEUK/Lx6zg3UAUaEgUoaqLoI3jYD48GabdN
	78N2vWrtyaH7qtvqGRdEUR1/pj0vvnVJFlwyBUjDd3pmbXHEcHzRHlCBkCybfFxtlvjMRHW+uKu
	BjpT90WH7fS52x4j7er4RI6X7to4idr7gmJbbhrJxZ4G6cb4qPCgRfLo5nhkJ9ARpOjqiV3DiH0
	GLfJwi18521QUtK/zN3sx9pVFcYWUzFhBNyI+3VLSf/BP6GAsn1q2i4FbXkp8jmdY0RWIlqr1r3
	hnBPLlWeHdJTlBa9ZvCSGVNO5x2ttOSG2SE8NXB4yyTlZZL1FaaHG19V7hhsciyfyzgdKMqda7C
	4cVZQQWAVtYPP62PINldsZXUbxjcGHd5lO/6amJtx2sczndlnks5xSQMMc4mVl50HmT5R+0A=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421017985a.5.1795768716774;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4421013085a.5.1795768716319;
        Fri, 27 Nov 2026 00:38:36 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeca720sm838130366b.53.2026.11.27.00.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:38:35 -0800 (PST)
Message-ID: <dafa31ae-33c3-470c-bfd9-ea16cf34f583@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:38:33 +0100
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
Subject: Re: [PATCH 2/2] pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux
 functions
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
 <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-halliday-tlmm-gp-functions-v1-2-b8543d6a83eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX6JUv3dsPUEMw
 aJJmaMdc2+RMmEHPwcIYZz0emqtNnCq7GfqB/6+U3R1uAAgu6lbJ2qSADaYHXXBTM/7dUKb1jlq
 YpmdPsKqRoEpKyhLczjN5UKuNc1+hUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX3hsuIeLmN0mI
 2l5CwOn05/Q66/pkzW6s1PXauKekV7lp7w/Rt1OWvJiaDpqoq4jt199MDQoWgAl71OBJ7PncfMB
 5XNSLlcpLKbTSXr9EZZout2Ck+8oiq4OZwSQUlx7aHQbTP9On32HqEwBAxcNswzUPhky4ppMd5j
 IydMl+omZ7naJGuTaXqKfqdo6Z66bHIyWmEWCbr0sBEGP5rsm5lgQEKra/OjJ9ev/SGOoekpF5T
 +gZEWn30G5yQEnZmHUfg3P+iHnLTkttyZrStTtoko4iluRH7qDn6Md5hqUCSnVo24digy8lC0HZ
 9WcRp9zqL1ZpA1dVMOK8uO2G1JTF8oX4ojOfS0pi5ALTbHF46n421B2QUjq3dkG99/s1dbtq2NT
 LL8W4QnxkuP88eZtpPrW0+WTZdvKZLdRhluRxH4zOMiRg2NlEtwuGlzTNpxHlrzPk3WQN/ksJ/h
 FCJiJ/t2L0yciTFZc9g==
X-Proofpoint-ORIG-GUID: igM0Nlnr2EG98oOdeEhVDyrY-bCujvC2
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09418d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uTCT-FCyihPU-J8YwhkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: igM0Nlnr2EG98oOdeEhVDyrY-bCujvC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

On 11/26/26 4:22 PM, Stanislav Aleksandrov wrote:
> Add the gp_mn function on gpio63 and the gp_pdm_mira and gp_pdm_mirb
> functions on gpio35-37 and gpio88-90.
> 
> Qualcomm's downstream pinctrl-anorak driver does not have them. The pins
> and the mux values were provided by Konrad Dybcio.
> 
> Link: https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
