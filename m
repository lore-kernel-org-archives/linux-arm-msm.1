Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504714A8421
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364418; cv=none; b=bzenYtoPUvfFkTUQJlplxdRxQgFKrgKe2tCbYHRQxYfHEpqUk2Zs4LPpZVURk/btrk+aeK8ysE9b0DI/fi+M/iRWDw8V3TzSqImNaYCQesDNnWZj92cK6j847WxvvaQyJFE4vMwSLfIVFMu8TXobJO5exmpO69ajO8JiaaaM9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364418; c=relaxed/simple;
	bh=M2iZKvRdwplPax8rxY3WcgzBwFQS3AeOHQatw9y082w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+evBDWiGlqYLZHX3VDm8DeGjEn0FeDBu9L+Iq4lr/1ev7A3PXPCwtUTgxDUpoEvExHyCJZ7q3OZT6WrzhGL2Arwsz8ZuDqcfTgEdPc7b6pv6bP6fuOqmXVx3rqhyJiLcjOS4cM6/AxnDJJ9zbye0jJlGhrFLnHhQhGChxUd4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h26UC4Ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/R4cGNn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h26UC4Ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/R4cGNn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZKIE2177523
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=; b=h26UC4QlKNy6XYp+
	hGK1ImMOiRwBNkVdVfljNeVwgP544n5HEne9AOzvSrLKrCWH46B9prV+wWuasgmj
	TXdYXf0I+NXY3nWlGHdMEywfM4QdKszpwl0aCgCRBpZf2+nWj2Og/yewFjP0ub3H
	eheh5mFOlWdinmQh8JDHSZrXWu5nKgF83MiFoB6o9EslHXr++Blc24vULW1W0umY
	Lep++EKgH3zX7JWvvX69UOeF/wf1c4P4HTOOjmEjVKnRUHoZrDYz/FsF2wUYg8c1
	N5QaYz3azcanEAeQnI9fjWpeRqbBo/F/azNQz02d7h0GGIM284MxAuduBWbknjEo
	AeHoNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh8k8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:53:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so3799071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364415; x=1788969215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=I/R4cGNnsuaryDPoRnzaMntJF5eCaf5a+JStr5isquNEwlJoEY+7DTJyL+5SpPavEp
         7LVsLRwSEyuyg3OoxCOS8lnE5kQSSt6dvZQ5SSDzz3KigdkImJUcQeptvHPPIQU/FwY6
         t47S0nNnB5jzfeGO0qdAhVZIKEfXjwoH7XINSz5JCcfB6QWRmXY+7DF7xbnXcwZa+blG
         PHsVaoPT7dmpeWZZrIdjtelCKd9eLfGdR4hpGv0JRI8WgTeY9iBMQhWpMFm8kfgrPg3R
         Oy5D+4X7b+mrkjM9c8l0SQuzbnMaxpPmlVSC5a45HJPTXfzkAZEagxa74DwlSJ99KSge
         hyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364415; x=1788969215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqru4wuRchVv2A67ZQa73QrFKsMR92K1b4x4sPPUIyw=;
        b=UBcCLE6TRXyR3lARD9HRhNoxHdvq2btU9HSBvTUuGi1vnFEmBKsF2Jwe6RaXqvdVCG
         /9xhCN5ArUY2acUGJw3N7Ak2FZJy+iQDg5BC6aFdggHU0dlRECZChWcxQRJl+bFoi/aJ
         Fv8ZGe8cP9Q2wCKMDncIdJ/8WKEf8/T3OeA2lHdKYMa8W4cEfmleswa0HUkC3MWs4ENp
         3Pv0FSVHNRhrxMU1RPPZtZ4dyLgh+5Z2i72gD9Vr7m/0739zgcLDJeN6eZJh8YNXY59D
         +0d5ljVf2D7kcjj+Ps00m/xC8nFQMpOO9UiSDWNF8sT8/HgCOwaUuP+6qDDHyLrmRHTe
         mmMg==
X-Gm-Message-State: AFuF++llCVyTCeMnzKdg+0t38Ij93PS6jhf6gye8VeIqmpBr+VF3AR/s
	iGPLaZ/U1EMbIsCrQEyFtJccFKKG8TJ9EZ3HaJuwj5km/g618lvxrzzUH288NkFW0bUG07upeSn
	rSMeXrHcigc27hpy0OlTUMYa09xLQOtU/2CZQVVXZ5frkjtqgBlmsr06WzGfJqYoHAP8h
X-Gm-Gg: AR+sD117OlSgWrsva1CtfyMB9LR4UolEiDoqDUZCv3viw752MiQk2ZGY3q811QMV07V
	v8jrXtSG9xNZ5q89I6ZDEbiEANM8/z1bweweDSrThgWVXySioy4SubqyG70oF2H1R2eenut9m0B
	NS1wbYHoVwefzI3bhZ0in7NnTqZGFlTgjXx23I7JGepaTeZ105H+u4IztsqTLpI7MxMGu9Lo2OS
	p/VZOCOF8iJPEEubAOLnuezm2bsM9UOzqF2f5Cs9Wvuf7qdoodI8J/iueOsUFJVpUsHG7FsavPu
	YIKPL9SQPXbWufGc8cxNCA7HVH/V6gZYhp/0hIWCI6SJ4bjf9naewY68Tc8kZ+73hxCMVKCgr2v
	TTl0arkQRhjvjXDXMtpQu4Q==
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40150151cf.4.1788364414691;
        Wed, 02 Sep 2026 08:53:34 -0700 (PDT)
X-Received: by 2002:ac8:5d48:0:b0:52d:f626:a46c with SMTP id d75a77b69052e-53036d5a52dmr40144931cf.4.1788364408715;
        Wed, 02 Sep 2026 08:53:28 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d7esm1289004a12.1.2026.09.02.08.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:53:27 -0700 (PDT)
Message-ID: <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4brylSKbMZ5H-ZMtCPRqSwHE_TOx3gID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfXxyHBXtF6wMkB
 Fbmx/9k9azNqbAkzB2cxKssRXpxMrZloGwMRJykSnGKOWqShyuVO3RKD+7SSR/39FAnrIQ/y4zE
 G/DXQu1+eI8wjcC6YsorqUsDmve6tbhM7VjPT9sUTO2MKA0GuvHJc6OkrGRnsTOJrd/aO0VJVgk
 OroQIKtMvKqqNVRb7IeCl8ofBN/Us3CLRTQIeCAvgxiPQ4dJ0bQGXIXRthhHKvTmTj5ghMh6ttG
 0yVNLBOdFEXwMq07Nr9NRRWw84UFYB5hJOfetYEyZ8wEkvt0rATstgcK9sF29z3pAX/eeIRF7vT
 f95N9QNpkI4jH/RJH05bC7ewLDbXNddMjcR0K5Hqu7GNxTUS00j5m6DK+gzz/zIxvhjzb4HY42S
 qFam1SXM2ZI86rGxy5giU6LV2lDkmZcMGxqHvK4j/X0bbD9MoRV9vqYzsNuE+OMX5sQUvEWlXib
 mWXbXjLmq49wFIqDTsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX21c1m1UebZmY
 xn4AtLSMDKVrDja+aaIeYPlOVTV6gx1oHMYfrf56VSGIPmN/4ss9fDnxm/4gTc20TIKU6BniR6c
 WzfZvkvHsQhZTKzXys8yS0rSdW0I2zs=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98467f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FU8zUc8beOFBw0TLZfAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4brylSKbMZ5H-ZMtCPRqSwHE_TOx3gID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020140

On 9/1/26 10:06 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.

Have you confirmed that behavior on the CRD?

Konrad
