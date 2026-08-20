Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AAD18DB2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201423; cv=none; b=feJfpR64o1KX/w4F747C1Q3WIYPur9o/50Z6d4cvLkTvqMGUZeuivDMAv25Sd36X/1mv8259pfKR4pAZJqbyxIjXdvZNqJB4o/CAx0A1flIqaF8Ekaelm2WZ329yiZG151SZFjGmaEjaf0feHEEsEdgi6VuEqCy9TQK/U3prkSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201423; c=relaxed/simple;
	bh=3euQFbvNLTsp2NnCKsS0YWj6dpCwksy4ahqqoiLa1rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJlkbbP+UwgwsCnDWx0t3G4bqn/qFd2OBx5xyP1qGyosF1eXbsnZV5MF10biBTq1lrseqlKqsYQ3mQ0kslV94d+/QsDEJrz36XKM+hUAOQOZZEtQ0wN1SsrEGjvEAaZCDm06Uy7jxET5l7emEvAh/XFgAGTJ04uKFjTU558Kmvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YH5vNuOv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BukrHzjQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YH5vNuOv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BukrHzjQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7XCs1987167
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WprDP7sUyotVrs/inP5w1FMYl+rlQHhGMOztWGLyUw=; b=YH5vNuOv7HxTZlsg
	cULbAyI9bJ3gpk5llU2ZHCZ5o9qB7TG1md20+Hpgu8GSyrfyQN3vKOAfVTiveTrF
	w/YpCNAmQ1usZuLE9UUugZvcGQPA7CO5rY93Wp+A7ruK2Iip08NZuRgkAS4l3t+f
	CBYiHrzdN6kij8l1pRRvFAcXiPEtzLgAHAtSp4GKvb7A0fAWiQ1x+Zz4OqtMVsgJ
	SaJbAW9Qr0Ezhxc+tQYlfu/3Bz+g/B9le+xsjKk+LhVW/2KITHF8lj4dcnReyP26
	fr2vZJU2U2HAPc6Z8YrksA0Z3Ms8EjbZ4eBKYulmC6h818izAuBKRUy6fm6GKbKj
	bfianQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esj34e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:50:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so36898515ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 21:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787201421; x=1787806221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WprDP7sUyotVrs/inP5w1FMYl+rlQHhGMOztWGLyUw=;
        b=BukrHzjQchGhSsl7uhD32ojnmq1T0UcyhtqaIxbQpbW2nyIAqvrE5q8eiBrW8aWDdm
         xpwR4rZWAI/Hrpv0d+QvAqGxXwxFZS34WXpmK9UaJ2YjNeUD3HcQIw/+/IfBADfDLBoM
         JLx7iRO11hjPw8S4CV6u0lHPu0eExmPM+Buu+RvfWDhXUzTSHnUzZB1tQmRXqq4/Cxwu
         lJBce7AhvaH3obee+JNy8FLbVb0xj77RjTndsckJIjVhZDAJER6Ogz5zSNZ52CrJ6GJt
         ciyE6IFyDo8VPgbGskqDNcA4aDLxYiY6zG4Aa55MVrxnvErDJYHAUGYn3ZJEIiEbKIsP
         qtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787201421; x=1787806221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WprDP7sUyotVrs/inP5w1FMYl+rlQHhGMOztWGLyUw=;
        b=DvrBTKIXP4qrdPjhz7DKCP8tY6pdn7RkXuBvt/8Elyi+H0R2BQCuvo2cicz3OiahhX
         JdJauIPrZ19En8Hu7JIn9+YnmgC/0sIhNNgYj4xYhyfWbD11KSTehpinitEvVKx9yNFQ
         MQlgsF5gGqdz09JRZ6rknr+ROegyZstC9odNpb7wNK0gor21sWJLam+YZkxXC2O2fizM
         i+tLblo8xcmGaSxxR+iyLYmDqZRWfjNQ9+FfwVXwkTbbsABmehDlKJ43qPkaHDiSmb4F
         18rYC7W3Sj+j4dWPsCDdgEVk0d3x+mpVzk9CXJ0FVBrZ3BNTo6N0CROFe1nC9l0urLUL
         L9tg==
X-Gm-Message-State: AOJu0Yy79DtNT9IO7zX44NhmVCQQ03OmGcVQ5mDdrJp6OaVe4qn8WOnF
	p3/FnIJmlMdUhyISKupwOqiM9Tn00kqasNEJ2+S5OaYn8mGUx68lej+why9waHCr1zj/OJ9cREV
	amQAI0vXt3O8w4fpuXlawOJnb46WtMln4tL/CutipLkqpkoMXL9pMdlK8We02kPkr7Vps
X-Gm-Gg: AR+sD12Sk8Jmlvd9B5/JJJ/9LfXjWLXUZ/X2OZeTu3XdsW1g4UNABN6kjASQ/RChlwb
	ypCKrBM1P/OVlSYl5kG2mRJ4gtNMCVVPh5Vf2kmKkOir8NUsh0OaBYMqDGgH6MTMMjb4OeiFaNY
	4n4Ut9pPiT+tmwQFAjDadHLzsBN8a+sEo/eefkcLLCUC2iNDBEQhu2y8aIUHNSd0va6diftBfq1
	lJdW/OZNLCBDwzE/e7hbKC2EyTzFpqfdAO/q7YJf9KUsQemMFMlKDaqncNgyav/u7HC9IhyAxQb
	jk+fvUAx50my5+dyNQK23oarqiItm9glLxKsRt2iOJzlX74yePLad5j6RylqBiSnvLVq5DeD/d2
	+qsSs0KN8spmgTNTEtCZGziHeWsqx8YyONnA9KHn+5Aet7qtN7GBAoQCRDnU4qDsA98g/+T62lN
	gX3m2KxqwcPXqqUA==
X-Received: by 2002:a17:903:291:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d5fd3c1973mr194265285ad.0.1787201421051;
        Wed, 19 Aug 2026 21:50:21 -0700 (PDT)
X-Received: by 2002:a17:903:291:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d5fd3c1973mr194264455ad.0.1787201420588;
        Wed, 19 Aug 2026 21:50:20 -0700 (PDT)
Received: from [10.149.122.146] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf13f4bdsm12571709eec.20.2026.08.19.21.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 21:50:19 -0700 (PDT)
Message-ID: <b6e174b8-be0c-4d7b-9078-75a0ba5a220b@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:20:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
 <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
 <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
 <282e3d1a-17d3-4fe6-8435-ac6241f69eb8@oss.qualcomm.com>
 <1146dacb-ca5d-4ee6-b7df-e731bbcb56fc@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <1146dacb-ca5d-4ee6-b7df-e731bbcb56fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MyYhyYOPSfFzqL3ch95JiVthWeRDMaJO
X-Authority-Analysis: v=2.4 cv=EaL4hvmC c=1 sm=1 tr=0 ts=6a86878d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ZTAHBudFxCM7PCH5DQwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzMiBTYWx0ZWRfXyMpm4w3tuLIn
 mJjOchFD5ctQdK8BxRwDfqrav9Z9rnXqOG+G7LLQNvfoNVLariBmwt1GyCPJiGrmXJ/i5JWngz/
 tiD1zVhALlL0UpsxMUw/sqv9QUf72LqRv9kzzJLQIQ7Yj30t9xy2xWyyVOSO0eEPI7k0cVLLVZu
 s7Lx/toViIrhf+jr4Am/C8sKLjtLCPMCBE1bRIUWYuyzxF0Y8Ep5d7oC9cfZrMWjTOVpYi6AHdw
 fHtpQVYcdrqxZ+dMPb5Vvfwjy200PeX5tCej3SIz/LXXqSaad3GJc2liwYwN1C3ZE2Ju8BGYq+P
 LqLWg8VR/RaG33A8jKLWQHxe3Pi5Uk42NCHIQdmBDI8FV4J2QsyXeK7HvJL3t1gakrJE6vD1sk6
 iqM8CwaLe6HbgSk7msN7+bvX2b4bwEQ6qJqy1AR8ogMNF2/E3622MoP3nd2+sYAFULfW8pRpJmt
 Bxjk9Q8lbgoUPdTVy/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzMiBTYWx0ZWRfXyLt4t8oUxaxJ
 PP+nvk1kZYu74q2sFzlN/YafQWUbi/2jtvl9ykrZMsb1hwLO79/Q9sDH0OlQsE4+Y6+PuDEznxP
 1ZrmrG8KFnheUQxlBgbRKPXMpCyxmkc=
X-Proofpoint-ORIG-GUID: MyYhyYOPSfFzqL3ch95JiVthWeRDMaJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200032



On 8/19/2026 10:08 PM, Konrad Dybcio wrote:
>>>> Each tsens provider has more physical sensors (16) than the count used
>>>> here. The leading N we take exactly matches the number of sensors
>>>> already wired to board thermal-zones for other purposes (CPU clusters,
>>>> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
>>>> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
>>>> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
>>>> this platform, so there's no per-purpose reading to include in the SoC
>>>> Tj average.
>>> What you said is true
>>>
>>> It also doesn't answer the question why that isn't the case
>>>
>>> Konrad
>> What I meant is, the driver looks up a thermal zone for each sensor id,
>> and skips the ones that don't have a zone in DT. Sensor ids past 11/15
>> on this board don't have a zone assigned, so there's nothing to read there.
> You can keep repeating what you said and I can keep repeating you're not
> answering the question "why do we only choose to read the data from
> certain sensors and ignore others"
> 
> Konrad

We only read sensors that are physically wired into the board's thermal
zones, those actually measure relevant parts of the SoC. The rest aren't
connected to anything, so we are ignoring those. This is what I am
trying to say.


-- 
Best Regards,
Anvesh

