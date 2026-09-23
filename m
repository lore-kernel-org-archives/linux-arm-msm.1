Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A796149B21D
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162305; cv=none; b=DGVJyT8e0X1YvD9+Q6HkmKAFGvatT3Wm7eT5Vma0CJRKTcWWvObD5dyEK49UqdBKAo0aDl2nawUfRVl+1CnVulsydNi72K9kwq9MGZAqSAKiZ5X9xmKJ5SvETTPhaLzncIPTpv/HMJBTqZGOAWB4EWnRWVUrH/glHPE3/FaukjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162305; c=relaxed/simple;
	bh=maTSaclQ16IhwN9YZzXL2nmAdX43DWT4iQJpYDEEsAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hc46FBKELmjLpzv3lB9qSCV3LZEp8vybhNIAIQp7WqhtghPvXReRT5uKvJlt9LgtcbEPsSshEtmmEDaY0w0RMdzBLpe1Jz6Ql96dtYEiucfv18+genwgHBqS1KFJc49NXW5IgCQSdIKqjXUJUVvXKTe+pZsiJad/hhatjIdWJ/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6t8J6vi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y654ajXt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6t8J6vi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y654ajXt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2kb43087121
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=; b=n6t8J6viQBHuQx0Z
	pC5UuZ0f2h1zGjtmqozBoFR6EJGtFqrxr3pReq3t6R9bTgqDm8QOUBbEXArJVI8z
	3g9ZjCaLkUdpMLuAzbd4Zl7ugBHCJncyI/aAVZeZ2PfnTvwZU4n8L6Sh58dzcFXS
	nf43IpxmpoMhPFDIC1nrz/q1+iRnsq7VLOLW1cQlThBagT9QvgXs1Pjg0/XCXHeb
	ayz6Jiacpkgs7NlXwhxujVcp/RY9MCSBbqgTTDVZ85CA9NfkWQnmcWfuf7GluAL0
	HjxKQNAMi3jJTca0PKPPYEPaF2dy/c/ejtA1eLtMH+F+5o99aazUgvX4UOTwsxI9
	1B/LKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8gv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:18:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f4002c1aso15405585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790162302; x=1790767102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=Y654ajXtU1bZPfrfGglGWIWB+Rw2o8c5SNcnNITXW9YN6nag99Th22pIQ/qYcK0goA
         hQDwvIXawqBCaEb9COCwM9pLiyLtZhf30UYU4sXknOWQvI3FOYxQI31Mvf/ElQltBUo/
         6QNSi9XVlYQVMfHtwIUOiwPNkHGNmCHiRpbaTLpePz3+Go8/g+UpcElFsduKrq6/Wd5Y
         vGljh/5yhWxK+eqMeFs1w9nrNe4dwPiNlYretKbOqZZWmungGcNdnaBk5cDi1QnjNLP0
         Uk8wpNGzBZTcaDkZrJ7LuXa4PCD1gHDIbYjuTc6klXatdVeuFwBP/BXu/m2DuVh/qw4b
         zr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162302; x=1790767102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5HvJEnsTYcbFbHF9VSG+7AqvWxgJBjz8BE23CP1doU=;
        b=0Iyn2t44awFZK8udA4CKYyupcOdEttITF5uvU2pPFfM2SueR3v5Vr/gmYPo6NVi/fb
         iSqXW8KGZtwNSDHtInwNgzWs3fyWE71RrjRKEvGbLNV5HlFzFPYlXtnI552/FN96fCWO
         HvbClg21/9Wp0DHQpYL0aAmoTNESTk8go+x6xTt/t5AyPmbFQslqU5Ve3xOnjelhM3VN
         P/VvY2uzY1Ms2toRAnTbqiw046VjFB0K9lPo7GthFFV134xJUaAtUsv6oQYaK0JhIjbk
         apt5GuUsRgulnp982vmpbP5gj0lsHW9FzcSCFl9GCG8tscJYvgx5JQi6PIE9Ahr3e9kW
         fGAQ==
X-Gm-Message-State: AFuF++kjvgr3s5YP54trRL8/g+j20r2p+tDZrY69OclTT65fqIHu0ioU
	MAjzVa9k50hjrMjRmT9C6jTAayh4opztu8OeVnhv2LTD/NLUR4qT80UpfuU2PDnpatuzUFnNcYu
	rI7ezL9rzH2JWSRa0kl/Q5d0SeK5x6oPe1BJMC7tyIh7gxK0ZfL2xuvx2oVAwphWLFJYBoSNtKc
	sw
X-Gm-Gg: AYBFou3naXXmsp3oOat75VJafkxS6fbvUXFU0oY/PTPQSW7i2v2WiQP4K364O7Ec2XY
	NlZOIb8CyiqOSfL9x4srBlW54CYLL1C4zjWmrel0B//9wm6hX9xk60hI8T25qOJstK9mAN5mF1m
	zPfo2qBRu4Zu6zsUjIOLOL+THg4xVLMduVuB/jpVIYqwxXByqMj+78rlAu8vFJ+/oT36q5Cwx8I
	5q+wIjvqTSOHuppyNJa2v1AeKS30Wz1Pb5QSCIzKjeIpSBZtENvXA//SX5etdgdAcf+rD6whapP
	5tjuM4S5bS5npSU9gJY1ILxUmQ258qfiBkWZQnFYM7qi5/095MIbdapI4r+ebb4IEue4qhgMXE1
	HuYYBJH0bTzqj0AEJLz88LsXE5MCv0o53
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336214485a.1.1790162301572;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:93a:19cc:107a with SMTP id af79cd13be357-93c250972e1mr336210185a.1.1790162301150;
        Wed, 23 Sep 2026 04:18:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6e3677sm100600266b.62.2026.09.23.04.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:18:20 -0700 (PDT)
Message-ID: <75d01a06-b943-4dc8-85e7-0eb578bd0e27@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 13:18:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] drm/msm/a6xx: Honor perfmode_bw threshold on A8x
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
 <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-1-0c3c79a1a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfX/+Oq58+AMbNk
 jMTPuSwzx5Ph5m7HrmHUnMF5cwhxW3vgRRdsOkd8eyWT/z/fxMdB97w/BSJttRzUaY3BCTorR74
 A3m8iBBac0lNgFj6h87Ufxtdz/ff+jc=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3b57e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YJv5aonfaXPMDC4gfg4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -Sm1HtG2EIVDMdULpjdE5i1p59rQLkks
X-Proofpoint-ORIG-GUID: -Sm1HtG2EIVDMdULpjdE5i1p59rQLkks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXx53QD5u9KVxp
 t6+zJCrNZ+cnAXOfHyyEjTtAPlaF1twWzKaVGPfRClDUqsuzQmp6MlRcTEndnQTI4MOjVuFlv8y
 /OolZsfv2QzShf9smqaaogOd+k8TB9hH7ztngHvjEqksHW3gwh5Y1xDfE4DqLNTCE4FLGln3zAl
 RCbDOKHaDZlKva7yV84kPzrKpr/xY3MOz0ettGQRxQbkdCpiejtKPoh8IObIJP6301GjGi7j9GU
 2nz43uxZHfOzx1x5/bs5CncYOPB7iZHwEYpEtUdPA2x4gWISSMLFVaW9I3vtVD9XQRGA8V4iazJ
 xaOEbxsClJ3gAXLrL2tYm+VLLRdQhKT/OKwba0IyarTn0TVYi0XqGpF8vQBsGMw+wCKuX65e/jZ
 LxaqiEcvrFtKRyPkRo7KdZd+7QR12xxbnz1jpdYVdht2mfk8oeo2vS7EpugfarCVYw2Ik8j4Gre
 hKrxTX/ICwuyUv5NAxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044

On 9/23/26 12:25 PM, Akhil P Oommen wrote:
> Instead of voting ACV for all bw corners for A8x GPU, restrict it to BW
> votes above the perfmode_bw threshold, similar to the A7x GPUs.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
