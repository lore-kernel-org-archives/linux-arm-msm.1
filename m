Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306A23C1984
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789295543; cv=none; b=qcVZ4WGweF+KoC+PU2sQdUutvh0+JffWLLlXZ00Peq1w/loKPx5wwUhbL0LvzPqNh6kXjviY/hKc29JmtW7O+UlM6V615DNiNQSVEbhG8Ed3RrTQbv6GV+ZA3T/7JPflcak7O4OiZTRMuSNtrfg5IDJOqDB7wLxckmK8O9rh4JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789295543; c=relaxed/simple;
	bh=tHosPNT4fdBSE5OakR+2naVgGAE2PYaT5qCsKmvw6UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfhnoUGX61y3THRihRaDc+cuTbOMwTh/6/Femty66u1jAT/A1jN4EXPBhdXuzpTmrheBs6GeuQFYS4PbIGifkvQxn2b95XAq+90JoCEILqC8JVNc9Gx/S0teURw2J/eyB6df6VJ6wxCPlxClBziLb4ArwAJhA7o6hN72/WAO9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DjlRF3a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EE6g63V/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DjlRF3a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EE6g63V/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU4Q91526413
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 10:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=; b=DjlRF3a0oH/oZqUd
	sXxPdDvrvayU7rLuv9n8W/fBt75uI7MZorhxobwtNTwZWUAIPTgbNAglaqHNu/gY
	3itqSnnWoT8RFzuVwXzI+hCjHP3RfkapSK0/OMJjKinAwTLfGvQSjOS2Gwi2VJSk
	9CcACRh1f6M8lKy+dZWH/cqFVftH8bn1wemff/+xWwwNkqfVDrMMVS3vl70D9+Cl
	WpH5Bt/crC51uIfpOuza9LoUoNOXzlZS+jandBp025RgHNSMrm+Zbdcl2Qpw451w
	V46vo4N3pJQhwI87KuWX8ZmnlMN9fXEZGoZvmwArpEQVQn5uWYBFBUHNNZ4nB7Cd
	XwL8Ng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d31xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 10:32:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so480628285a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789295535; x=1789900335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=;
        b=EE6g63V/oCfdS3fm4BqY/S6LqrszbwJJzqi10bheGoe0dv0o4IX2otmqNX4+e4XG0P
         LHU8FdkNAID70rCHvkgNhPQtlVu/LJ1ym7GrO22p2gfzX0KGiZIj9z7+1SaDG1WScut4
         ievrHQmeC85z30AK7D0PHUdBsSV0xyOIqTH164BkIF1hdqsQCYP4ey5SBZGrTxBIbVUc
         nEIWptZwC6K51R0JQCZK7aZd302a62+t5BnGA5Wc6hXnipfddeAreqxhkDAGMkkH9BgL
         4soHBUovcqjD1b99cr+ozoEPzUEMaodTobMpgeHqi20AgtI8NWmeu/GfVHZGk3rLktm3
         UczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789295535; x=1789900335;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5vAKqT6Wkkpii4lrLSYCVCPovwE6ZV45z1ikvs4rFc=;
        b=TFakIdRFKsWZQCZSu9/kudMY2O8CprdamSmiaZMB7krnpI/u93m8w8PSMRlj9GtSY/
         q9LDcRtQolIZ6QG2ss2WZe8gkUqRfdjxEK5Z4Eu9aDPDML7DW16Rk5G0fLFipblLrCn8
         haFLPUElVDMy16WuD/qOeWO5T69y0v8xrrh1zR2+gW4Ph1td/cclRZIj4KPyTYjSFpJd
         hurDnH2yEGf5Q9LI7vfyuhDr7xXYsGtd9L7wSpae07fv+R2FIvf+82QyRbK1IUcm8WSI
         vLsOoLsY2ZMITqLSogKezR8/hZmfKePR5tAsQTaGnoS1ibeGdAIfkDqK7pOdjUCXxEGX
         zHWg==
X-Forwarded-Encrypted: i=1; AKwUvBzP6o/2dvlk+c2kqOViZqisYqwr9EzrzRDc9LleZ8D5IZRenJSaLB+hzyE0O0dx49Mct6U65MY/6QtuDpJ5@vger.kernel.org
X-Gm-Message-State: AFuF++kv/jGBFVlFXONYgSufEc6c1A1d1GG0hPr5SXkw5JpOTVwbD9aP
	qyIiiiT1BIKcot3czVcbHN/djfA4fMGNoNaZ4kOD1xAk/UYkUAxjwB35NFZiZdlsWSYFPoaxkDW
	b8fFqxFKAIJ6frw4uL1SON/50/ltvfOMIDHHBJP4ePSq7s8QYGYpCkBnm/aWWAmtHC13l
X-Gm-Gg: AYBFou3BYFkAfr8pm2TWnkSEzL5l6MIgEw/2pAper5WayYuIJSvcOeZScvwj8hF5wp/
	YX2nUUIJPMk2JJ7RJK6SfZe5FEQ7RiCnsKJUPci/gD4q5gNauN08Eh0upBdXb+Zrb/XMCAHKeoR
	l86u3O8HJDWXQBqchav08dFtu4oVXmOUuSegR2y0WkeCcHA7asvyW3q8iyk7Y2SL8m+Zupb7qCc
	g3YEDcyrYN11btb1k2JgLcRtN44JA0PphLGln6RgneckQ5kZBhiY7knR0fgM6acWVSxOw0twrfh
	y/wUsW7yTfOXd2SpIKUOYl9VyzHPq4M0ER6DSxyl0LOe7NGSuILmuAI3l/pyDGrrbid1OCpaVzq
	0mJjzUdUhHMLB0UoXbs+fpnztSTrW
X-Received: by 2002:a05:620a:4409:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939ea037da2mr1792431985a.8.1789295535242;
        Sun, 13 Sep 2026 03:32:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939ea037da2mr1792428585a.8.1789295534807;
        Sun, 13 Sep 2026 03:32:14 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm519682395e9.6.2026.09.13.03.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 03:32:13 -0700 (PDT)
Message-ID: <c478a074-f0b7-4eee-8cea-5f926b6044df@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 12:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260913085814.1509352-1-lgs201920130244@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260913085814.1509352-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE0OCBTYWx0ZWRfX/5bqvDUk/4Mt
 HnOKG5LWnwy4gk/6ryFzKPZ1pAE5/rTOPWbPWZsIjIMOX85x6DX3v9zj5ttNyP/qI4O435LC3Ta
 qT4ok0Dv6cjAssJoDhx0riZ0nyZDEd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE0OCBTYWx0ZWRfX0JN9v/eaT94C
 NdwIwMq/yPOYBU2YypqWe1PGD19d9VssvZJ7rb1tpT9YHXMeO75AKnBUR8j3cDMzlJjZvagXUwQ
 WnAzWabYLgPZLm8RiRsTktj9iFuAYNfroSB0c1130WrKjYBEhCfMr8CHIP5Wc+Xd+EFj07OKYBC
 kwH+0FvmrHWbb3ttEguhygF9pVXJBqYvr6yI2Xy9Qh+gOGWYZFkiy7w2KFX0nhZFCeTxiNmhp9v
 FCu+LSD1PsotKceSVjVkpQrPqSMVbUxVhwo8MsQHLl7BF91QJM1sNEqZ2028oXGCvy8h/2NvzSY
 C1Li2MEk2xa/jS8m9Ieq4zSjzYbzSHnetDR3be+CTuEAvjoRwy1qC8l16CivnezK1TtBEaM8DPv
 vuSL5SnN46jv9QFPYo2zekkKXl/V+qmCamZYZz1ZiyDBBSM0+SOqKOg9O6rEusyTYajkw7JLL3O
 u3iwkQ6I3rOpqpcxpbg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa67bb0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eqkjudQgZ73XcBGNVqcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hhP9Qw7Xx0M41qr3Zdn51eOKFdkyzNqV
X-Proofpoint-GUID: hhP9Qw7Xx0M41qr3Zdn51eOKFdkyzNqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130148

On 13/09/2026 10:58, Guangshuo Li wrote:
> msm_hdmi_phy_probe() enables runtime PM before enabling the PHY
> resources and initializing the PLL, but failures from either operation
> return without calling the matching pm_runtime_disable().
> 
> The remove path disables runtime PM, but it is not called when probe
> fails. As a result, runtime PM remains enabled after an unsuccessful
> probe.
> 
> Route failures after pm_runtime_enable() through a common error path
> and disable runtime PM before returning.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof
