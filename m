Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD847207B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386226; cv=none; b=ossTkll1GXmMKZX+0HjziwtrYTgCOcYrxF5/LIPLWOLvuMAB74z2pETE/3zgzcGb1A5HxG2BoQAGr2PodFXcdoQzH+IxFscU3yVnpf1el4ts/gOwuj3nhYyl4GG8ff63lvahWytbSyb7nuC9WmAPsqmZPc6m7HX3gJkBgPK0Bdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386226; c=relaxed/simple;
	bh=prf7iyPR2XBUzqid06V0xM477LySQ+Us1jpo/hyezos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ok8wd9FUgmsKIWrpwHMHZHKT0JAzk1AdhqBxy2WQETOSgVyTehsd+P8btXGN7eptHxHTQ+mhUC2COnoqkDdso4/jPXhs+BV+G+21YJ6aPjrE+0amH/Tb8pvVxz0bdXa+n+/qQVzhMyIruLrDZPAvgsCafU+XPVP9DZdodvNT8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQiv9K4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evNdbihX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQiv9K4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evNdbihX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmA5v377889
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=; b=PQiv9K4Y+mb/M20R
	mTuwQP0lvOso/OMWbd5kr04iCXIwsljRo716lFzKRpGoyhhRgztKYLu1w40+ur6y
	pPQhGYbHfwIcEqWvVzm04H9Io4x/aTsTrqRg/mvKr8y1IVpIaudKwY2CE+iO+j0b
	AO6yyfjxEw1KVkGWjNG+t1t1KPf8ac9GXVLD1lVLYvXX1alwGQQgP9CayM6YVbZ1
	Jbhp598eMDDUD72c5N42fmqu1qVumo97YXfE3XCNQK3oQaZZ1r1um/f7QeTF/U3d
	IiXbBeoNMnyLvCqjvYPKElxvUa+Au/xv7ai7/nq+gIgvC4oesuYqGWY53xIg/Fag
	ePBZTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8gp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:43:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so591275685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386223; x=1789991023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=evNdbihXgWKSrIiNXDvPD28kfFrs2uq3yz+EU6/9eKrl4QD4jPNtsyuprUqCEGsgNs
         4jxYOmB0x5zJauLZ0f0xw2TnKY3hQyPlmlk8nDO4rWrD/f0D8qZ80+mnNa9k1MvzAbAF
         ItwV3yVmKDExhbWkdwrVjCL0f93BiXuL4W//uw6kTS4TsT1JxG+n+GFbInTXZaospWKd
         6/K0Uti968w3eW5MK2SvH5xu4Nu8J6n9nzxoKVGimQodCgymmu9wtgN2aCrYXnoEzJGM
         dwHWvD7pan6Akf1WmQqAbYem3OHJ6fGY3mJrw92q425wo4iRTxWZlVIENuKRRjwcY4zL
         1+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386223; x=1789991023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=Bjk2VEJhdnyarVWevi7AKLpcsFxv0W4JVXq1YtjMNY55vRcDaBz5BXJPQ7nRt6+k02
         0vqxDMGEx2RuhvHJdbljsClEgoGjWyTUTqhQlokr/26XQKVHItMj+X+OiAzgPmwcs+lg
         j5K8HO/L3b5PSdb5Bx6JL9h6ru5MEAWyg2MEVnlMyA9jIVB9oMqoGKcMOI972158u4/m
         IsPOwPFm6JqDpYCSG8zir+iqP2YjlwrIzbVMmgzWBrkS5LMeZu7kY9e1kbTRInzAoc4R
         Gy2KvlPdHz52/S1Xkh29MV+3RC297+PRw/+4ZtMAsEp8X7JYAHNDdpzE0gIN+2JElJZ2
         Ed5g==
X-Forwarded-Encrypted: i=1; AKwUvBy7qgwNbn7dZbVobkJHfbg2t65zyYBdR9WBYoyzT6dLVx9/b3gsgw69yDW5z4jBX6iJH68hMWOf8beM4ybn@vger.kernel.org
X-Gm-Message-State: AFuF++ndmVrPFfc1en9a/x3kqKWdAXGfSzU3d8/1cRx4XYa5AV8hciCy
	exz3pjGQokFlroY3ZcB1nA2eUWvz0eCIGT+YkgZIx9DCk982YGo8Dix8ogEfxUn+QEsDm+hinUa
	v7j365TtKnxBnPGFP8vNdm/Dv6e0Kgae3W6545cPG/5zQNM2ftApGa6JGcDz6Wwp16ekF
X-Gm-Gg: AYBFou0Xz8gN3fO826uctfUeEcm9rRkpa5kOk7XkivSVJxKSb90OilfIdTqLECqP2YC
	J1G7MOM2Y2CIBKEMFYc067L400bn/qitjJdFMpOkYR5tw3EkeVP6wNXpOWaDXyI7l8nv+SItduM
	DvN7h7Ti4lk9VA7gMO+YVWRvQQg6PuruzCSyLVUPXYVpT/Lfr1G71tCmyiAg3NP5Gk7jNSkbqsF
	4c6DWDICvXiwheI2f0//mqYrUlgowbIfgrVwOL3SreIPd++5zFauuJMJKvlevyzKy6H/oMWyPdt
	bQwKm8ACHizbtpzeeafctulh2OjRvpt3a0oi++JxzqJ0Dqz7fH0PcAIheXyGna5tmCmGxiOuQ+M
	UItvkQzMp5bd1LJqrbQJARhkKQpw=
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297217085a.4.1789386218138;
        Mon, 14 Sep 2026 04:43:38 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297213385a.4.1789386217758;
        Mon, 14 Sep 2026 04:43:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm413973466b.1.2026.09.14.04.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:43:36 -0700 (PDT)
Message-ID: <4063d65f-65ca-4199-b1b3-4eeccca225f1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX/ExYzu6LzfUd
 /8r4Sl2r2vWi/j/5YEaaqV9UNnH//Po7NIp/F9OOpvH324uAZ+Q2VtTq1f6y/tfiiPQ2ZYLmrJC
 RmM48hxcYS+C9vuYQID0PsF+lyc9K6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX+r2lq/FliB8M
 UIozM4jwOA3xWH2To4n/B24yjnDaRpkfQZMG+6wEa3UYrp8LWQ17H82HJJtO1gfTrKE/23KhiAJ
 TLY0ARXYj1NPaX9reUt0OyPFVjGmrcuH8prNVWY0esXBTyhUhtRu86yHIXuGFn/jx+YgCqkUKSi
 y8y/YCucXxCYSExEfbR2U+CTnFk0b47nBl+bq8w6VI3k/He+iByDF8/AqgPpFwf8JPqBam107NS
 Fble9NIvtkel6yoU8/Pg92588wBHiAIVxInI71L7K0soImtVxVqTOUUGskQFN9iul5pXCbWCZTt
 P/9lCfYN4KykDMNxbDB2bSA6WwlZLaRstzbggkC127BXPuvJJ9xPhLl0y705rzIZ7o7BnsPU8ZG
 XijZoSIGHMKJgUZ5w1TbQT/ZGgvlGLAYPfs8+rCqP8Qkj/rgmwnVAoWHhspz7Ilk60JFTnjLx1c
 ngUbACQoAURIpOvv1Ng==
X-Proofpoint-GUID: Sri4Rk1R-HFvxJkk_yIL3ILZtCqTB7VV
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ddf0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ObcvWzphOAATiYgTaMIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Sri4Rk1R-HFvxJkk_yIL3ILZtCqTB7VV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140166

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-macro-common.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 10ad68201..573b2145e 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>  		return "v2.7";
>  	case LPASS_CODEC_VERSION_2_8:
>  		return "v2.8";
> +	case LPASS_CODEC_VERSION_2_9:
> +		return "v2.9";
>  	default:
>  		break;
>  	}
> 

