Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA053F58E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221786; cv=none; b=nuSxVocgHYZ3y0rUbJb1tiBenfNt1rxnnsHTz3HQ/zgSl5WOWVGFeGi7rs3PGMFjqKCOrIDnp/P86Wxf95llOWUUp8uY3fSIFdehu4mGYvP/dMPmTnJi39gnAhZPi9u4/rkfjUXi8nlBXmx/pEB56f6uTy0iedt8Zt7IF17TFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221786; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFOKgpZ9SF0VVIIIH9Btfy1ovS9qaDUSaf/cUGBO8GeBisAd2bEkDsLOaGd+Aeh38115Ec65M89yjsz6hnb4rmHau0lZpY9gPt8QnyPdaMJRdaoTwUqS7f64YNCISICa09t3xaOvYvIWZgBL1WHa7mgB9ObE6z/VoTO4AtTMleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpZBWo0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPxyJu1A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpZBWo0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPxyJu1A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2mTb3132010
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=DpZBWo0P6nm4tfds
	UU9baKjzzEiiarXCl6W3oHfDnpasoJEweOrfPb5JuSKOBcZ2fS9ZBnIkcxCGgb3C
	K12xMfTlcnd1KpymL8/+20QbYrkGxdr/K6mdjSqV8OWWvdn3TTSkZ71eEOl+N+Pn
	LwzyHmWslzOk/r4RsZns6THivYqj2nE3qS4XyqaMcFiEq3yi6gCb6xoM5FKUCLQ8
	vy8oUuGgOwmH7fqeFcg8EV4dpGKJO735RlPGvvxcmNXNQkY1MGtROe4bTv055PbR
	M/Dl2DSyeBy+I4tkxIIsGpBA7wQl7uZb6KFTR/u1c9AphXLf1TljGu/4y2WvyNyN
	lNf33w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg183mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93102454272so44380285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221783; x=1787826583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=NPxyJu1ApqlXETDzfpnLxrgJ/hTkiRzTgvA2Q/7uslpuaVLc0v4YhT2w7Q0quVhYU8
         2zsGudo5M8UcfnGmHbhDCVIDAliDURBHPdLorlg6Qn9Ndgl+nr6BlJaArfTCT+fMr7xu
         FdQwgH1jPsH0guj3Z4NzC6kUEvBuI++lCXeFeQoRX6TS4w10vc/QEIfij3S1/bfnYxTI
         qPU5l7lP1VPaLAzTJWesAaW3TDhk3WYZACfhA41EccsuoixjhA2yjSmF3z5hkDmQ0Fgx
         l1TKPEax6kFGIAtwxXPvc0zca96pTDABWam5Ow6ip7gfyjM66CFnKKoit2qMMd5cy2lp
         f2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221783; x=1787826583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=MkLAdMGFVQSneU1nZysKWi27thDxNDagMlCdR5bFDDKW4AZVaoWAJEaSbF3mkng7O1
         kOR+t7BH8wfb8b8cdiOtKIhlOnNUkCt+MZ70AmX3JgLakgDBKXL2avLaMVjDeme8Oxk1
         0KdkW/xA/f+d/PkcwNI9NjxmyxcLK8pYS27b10ra11ad39GS94+gmvIXMcuvZzdYwMt+
         dfPn4bddAFtsukCOgGjOAzIazEHO1sabH2EXOUbSvyIfcOBj9LP5a1qLidT1iOp1Tl4/
         ZIPLUSpClJ3ZGRK9BgidHjd1bpgFyW5DCrf8LOcfKvBIk5nP20gq5jsooRENL9/GBDRo
         BhRQ==
X-Gm-Message-State: AOJu0YzTEnbU4EGwudSIC5o5KfTCc+i35lbxGnWupbG7sDUzo4Q1rzw/
	wUAj5WcR11CMUqRMiXT0cNtEFLWCO+ueY2nFRoVqtksUK8IbtV6Wqf65V3GXFs0RfwgK862seTB
	hxC2q+FS9GoSjaSsHgOim06bNViTVxF0bAYiid9vfJdwaN/rB4eL2198L81sXc1RoRR1Q
X-Gm-Gg: AR+sD13KQABVsdIqj+kNOjJSiE8M3QobFIxq5wLKtrPEK5BbhvnnAhnztJq0amKRB99
	sUp0FPOmkqFzHAQy+UVHGIHKMT/wTOv5vtl8quN5el+Qh1f/unwIcf0exc2Z9lR/pF9++5UVlT9
	yZkjWkpH6xIJ9q8QVwdD8qHvSWKDj04v1mfEkLyO2zaEsXgZLvPIzJsiOi50Gnj2p9K6CB8AamE
	2DX89V9Va9EzoWyDO75Obm8jIkbqt1nvczpLWSV79WGZfQLIzoZWNhwGWeZo2+CLnsC7qFZwZx3
	oHahRxFx2x1tScCJ6nqnLPTZOrjXNY2M7ASFRrDfJi1eaaY+UiJehQQIZXZ0mRBubhaUj704jFZ
	MbQZkfN8ybbJlCjr0/1K7mEPB
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728474985a.3.1787221783594;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr728471585a.3.1787221783120;
        Thu, 20 Aug 2026 03:29:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:42 -0700 (PDT)
Message-ID: <30a9027f-f565-4c53-b1a5-137f63f2fe81@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-1-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: soIvUMMQAGO5LNQZk-QCskppsDoUpgvX
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86d718 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: soIvUMMQAGO5LNQZk-QCskppsDoUpgvX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfXwX+zm8C8HdPk
 vm/xt+Z+oNNs2lOvAX6jfC/pNNX96G8hKqpp1LWWCH/c3kCTNDfBeCvlj5IYqMHOD3sLZlkUCoP
 kF1/ZPeF2DW4sZz1YJobktECwJzWNsU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX8Yx3oCXwzY80
 NMjo6fyt1gnl3pZiVr1RywUEZcGjDUPE4na0IfhgHWUhgMcS9+dM/HkiGHpL4Tp2+jMwpxbrJ9H
 ik6YyXoCPapM/312fuBC8U9f0sV1HanblFNMq5LFHSgeK9nFEssyXGEpyVB4Iej9IOKtDULi0+P
 lS+mm7drBl4TZyyRDjoRoerZEvkuNIhBvP+Gi0qyPE+3l/lFBHN3SqMsy3FKO5kECUEKQr0PBKa
 xInWbx82lLt44EWvDFRw8pNhi0BmRCQ1npMkID7dGBkNhgy2bcSjVHqPipH20gwcA6ZvRGp++Ms
 t7e+NY9NCzM8eJiP/dPhLWYQu2YxqBd0qau6NIUV0Xee+a0YXhyJ01Q36E3WUsmL4Afd7L9h2YJ
 thot7SoJa6DYJkvgwYo2noliZsKViGxiYspwOY+D8fMOYZxUYKyeJpDDpMTJdvbTRRYffQK0QAd
 t8apUcfWyPpUVI5Hy7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
