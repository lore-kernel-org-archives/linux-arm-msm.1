Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F166F37187B
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992082; cv=none; b=Gw3rmhlXHiFzbtW1Jrre+DDqaByyeDDP7Jd5g2UqOE+56NH4F7GGkO94gm7PFhrPtLmzhwufKKGpg8QAUl6eTj3wKfwd6pX0N0mxCAd3ySYu1dwv2D3uNHyFhxdt2WovNItG89VM5E/XhhUumCGd+yHoPmUTWOFSLhd6W3aO9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992082; c=relaxed/simple;
	bh=eXIt2tmg/N0xDGKLm+Npeo9hX7Y3I2u0rcNSU7afg9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vj8tWOWLkxWIR7mI3xNRGIUjj7uLB2xbSS3cmCx5hcFgNGx+DiqSoCb1oJfRp+2vG68p3zbmn78e8qphnTJa7sSbcJh7iuMAl6YLoDp/R78GhnqYx5Zz7av2vATnq9YBggqLwtCNUFU1ik26qQI2IsMmP0jR9P4c/sH7kAyG8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLwGRn/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jay4yEpz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLwGRn/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jay4yEpz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4mPp1129686
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=; b=bLwGRn/3191G4fr9
	rF2LR3Szlv6YOJqdwcvRd8wgJstsq37L4yz/EIn3brNbdaiPk1q0JPSzInaI1IwC
	GBphQq9IL8iHW/ayuQdMvpSkZPJK+489kcwg5BnRuHZad1IxDa19yL23jPqG9JdC
	QyCfFhFLyrnubxz5vUo4S5N3CphTuiUdF2s9epvRKSVl6242L/C5IVSa0tREGk+h
	tzLC/XbYplU6zkQPPrSOPQgChgjJK0le9eMgMXDcWe8gYgStQXJ4PW2UqZxaYSv5
	0LjwWb1qJ7bf5ksjwLWLt6wyiN2CdreZOeuQ3ATfIAeo9bimY4yC9F62zk7/5WkY
	9JdIvA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg6va-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:01:20 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c2cfa81c7aso285541eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992079; x=1790596879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=;
        b=jay4yEpz+Qjzm/AsRNzjRWlqQPHME2iTTxVpoE6tiL5HY/110ICdNNF5fIE6vBSCvM
         rJ7+kvF0sKAWhSUZbJ0fDrxsGj2vP8a4pqDJmtZ1VyLWNU0evO6QvwglEKgHkj/YYEN3
         m9DI/QEO1ZGj+mIcMqj0PNSiC+U5AoUwmsTX5Cy7MW8ORhAXw0tvuHGb7J/CbrFgKFro
         u5Yu53N+4C7+uP2rSpdug76TlEddYXvFJRXjaWrDJ6kSPGPe1/xAHracoEDj7iadlsDK
         PjBODx7U5uUQLD4EIqLlmQ5lNmoViJuT2oNq6ZFzSQdNn+LAMzcZGDuqXTPD8MM6T5u7
         JWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992079; x=1790596879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu8TavBZPunL9lmRW1fCrNQV1BaN0rGo1HZjQ3jlnUs=;
        b=2pUxAH94DrIecm5bda27XvB7tsXMRDIGGKoOlPSn40jsfluuUz9+MKLOnOoXCOavEO
         Pe2dHLnq93rhhpgHI49QixW43mn2OXqAspBA1rj2EdciCwusEXEW9+VqCBK2zO7CDGrL
         bcJYQfj96G6ow9SWrJf/9HeQXpl3QNeOyIxd6iiYwFFizISaHB2NIaOR31ngPlYAN6X1
         xMCmiAHafYD+606SuxurvsnObFBZzvva+gNL1F8SdLqvfR1BYtPdNGIcvB3BLCn/y1IJ
         EDng67YC2vxHCx1XNIqrgNV20EArIbFZUOWsxhVAw8aX319zA3qJEIr8cpP8d6FFquET
         RBnQ==
X-Gm-Message-State: AFuF++mhVUHtF5CBgRUDfsX1vjaOzw+aBit6d7sGpYuNyS0sBlVbSdYW
	pdlks+DKGddgdzqMKw2nQaRV2kk4PQSwBGyvY6RG4JqQx2acVzFkRmVB7bzssI75YBBNdxTR5we
	vabtZbuyCHz2x0QpOxApnGsW7vvL/MJjEWTVZqn8uwtq5AHAwrhDhR39D7luzPn7MpAtj
X-Gm-Gg: AYBFou3zvUo8+mMFL+vh3l0KodRqWzcZKb7XtghQ87M8IaZTNakHG6a2FmSLthl0mqo
	yiLvpBTva3TupWNnXtce/IFL/Z3tKEYvWC5jBKp9c17Oa8yI32QSh6h56cZGREEs+VmL28OCP8U
	bBzQfNvpPwtEtMvhvm/h6p/qyTpfxeuPWkt93SXT0J4Jq9NV4Z5AXAQPvsmsDTvTGhTJ28bqw5v
	uyVTL7ppdu04ere/nH9DuuM8HkIKXRMMJI77UtHln2xnIS8Wctber9R1oILkeXItG3lvoHVhJI4
	QN+TKyHy1e5uTbsGIEf6b7TIW/m8NzWS2A9xTK6aAkdql5ChWiD3jWcRFYrVqzi5lGGCniqxZrs
	1BBZfJV69Rb87xU5Y1fqXBw==
X-Received: by 2002:a4a:e606:0:b0:6c3:7fb1:b0a3 with SMTP id 006d021491bc7-6cb2c74c026mr7257097eaf.2.1789992079246;
        Mon, 21 Sep 2026 05:01:19 -0700 (PDT)
X-Received: by 2002:a4a:e606:0:b0:6c3:7fb1:b0a3 with SMTP id 006d021491bc7-6cb2c74c026mr7257049eaf.2.1789992078610;
        Mon, 21 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3586b497sm288523966b.42.2026.09.21.05.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <3e4fe959-1187-46c3-a140-30b957335134@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:01:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix missing PDM subdev cleanup
 on probe failure
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-b4-q6v5_mss_pdm_subdev_unwind_upstream-v1-1-ea6575aa42db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX/nn1oST21Jzh
 OpyBb0+SYaJEJM6P/1nlfmCCjCzOM/ezqFaGa9qksoMByNhqX43nt9Op2oaumC1dWr5KogYYvpg
 aUJ96Nfb5yyHlvsW6LjNDMgYPjP2Brs=
X-Proofpoint-GUID: OJgxoBHY813mXbUuAbimz8xXnvMF5JXN
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11c90 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2tNI-Mfp58oa6H9YLMgA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX0TrHtCrwPuia
 Ef4B+9ywBFmz+Y/uX88DdBU5sPuFBZUwr3OaUIZMomzh+0g1NZLbbLjT/n7fyPH9CWdWrXYLvh0
 1yTR3CrpxDQ32bxzdMXTRm5L5E/P2Rhx+6gN8j5EgjZNSbE2hgrTdUmxfYvD08fk6i/XWfP/GKl
 ovI9T/2ilmp9cU/N0+H13uKU/oYVAhV55fTKqq8DJs8boYm5/m2m5RsDSZ06TQ9e0AFJyNkuzrL
 k4wpKkqEOukWfQwOZUKAU8B8jR+R2sHuRKF4AU6UjZAQHn5u7b1wyBtQVhb0tz5H1ZT1WyPSeJf
 OlrT91T3xypJNb36u2X1paGz7SzgMAreLsC/w4oDw/ulqDH2Bj/TbK3D1os/RfuajtYjjlAn6QV
 FB5kmeM3JhnNZdxQ5ri2dt3zxRv/uzC7aBGrN0+egidRwwOmqIVz3hLOx0LEv1qU11EGiJj4oP5
 c1kprjYdRaPN6BfmgIQ==
X-Proofpoint-ORIG-GUID: OJgxoBHY813mXbUuAbimz8xXnvMF5JXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 9/16/26 9:56 AM, Anup Vishwakarma wrote:
> q6v5_probe() calls qcom_add_pdm_subdev() but the remove_subdevs:
> error unwind never calls qcom_remove_pdm_subdev(). If
> qcom_add_sysmon_subdev() or rproc_add() subsequently fails, the PDM
> subdev remains registered in the rproc subdev list.
> 
> The three sibling drivers (qcom_q6v5_adsp.c, qcom_q6v5_pas.c,
> qcom_q6v5_wcss.c) all correctly call qcom_remove_pdm_subdev() in
> their probe error unwind. Add the missing call after
> qcom_remove_ssr_subdev(), in reverse order of registration.
> 
> Fixes: 5b9f51b200dc ("remoteproc: qcom: enable in-kernel PD mapper")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
