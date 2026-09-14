Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0013D7D6C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383999; cv=none; b=p8K3N/XmUAigQWrsm4QWTcaqU5upxp//RJ9P8AwMmyzzvcWjrQGLaSvQqKW78b7VtB9svUjuVmjXNR+G8VKeJqsR1JBW46OYLOmUpnggraWbUHKxGqO0ZPbWiAH5GewVhe+7hLaXFDadmjUxMKDy8qiLHhF68zL1CvQa6ohl7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383999; c=relaxed/simple;
	bh=IQcctOlp+ZBNyk+MWt9pjtBT+n2ACcBUvj8zTzblXDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5G1ruHTH8wZvN9+EtCagQbX43Ri6LTR0sJ7kdPVNxRGHwNk/2U1f/l7qbBoRdKXauWaHj+esd7G7gG/8MWVkQMs6Qv2y5rJSX4b6KsXPyqhlLOuD0EoKWh2gm7g4KIRS9rQlvtC+9okKGgLS+m16azl+F6e7EVQkWWYF6RPcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WEaniymq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6axgOS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WEaniymq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6axgOS+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmcuA314177
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=; b=WEaniymqpGs7X1a1
	YXKHEC/bDwWWQU4ynDdBe+ExsVgbOrk8zK2zpesiiUJMlv/6dPxDjWvWp2/dQJ3y
	8U1MDOU65vpZdnK+lHMxSVEl3tNF3/a2/sNa5AHQx15aZaIV2QHggenwhl+Ze4I8
	2RMnI4/KGgHoJW59O09HJomooPMcZ/vltZEAgg6bdE7Y9CX/FdRnYG6C1N/Vgbq6
	tp6SYKfA/3uMfmKl+IvmdQbRoYxyWDzk6xnjYxoUE6d9t3iHPmSday/s480Wqn/y
	GA3/cxRX14EhTF6JsjgSdzMnbDPwHKWHYBt5TQL11xIfmn0+ZNXGYs5CJHWYTod9
	Dc3gCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c6acr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:06:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f8e7ff71so35254685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383857; x=1789988657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=i6axgOS+TneU4jG7eHWgzWAfsuULk6n17uJmZ3IKV8tFqhiKIMJqKFR8nN68A9TLz1
         cUvdL4LEmX6CT0QRBA1fjw98wLbsoe+taX6SdTxKK8GeUtmJO7PRJFZYWUhV0rJXqf6+
         DPSirbfTO9xOrv3cfrCjCvgYjNezwMDcNxvnwpE9fGiBLmQXTdqzN84sl9ZLNh6JOr3i
         hKpZNSoW/I16LybIqZFhZxd1316j9ZvYBTMLfG3NwEMhcSVWXku+odFRIqOVViaTYj6F
         hNNRgKvZs68jojiSZJdeQe+/4bnILQvlLQb5Id+RMwngQ8YOI0OvWfdXqB1VElHvl/cH
         Gwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383857; x=1789988657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGEVrjmYDS1bWZpB4m7GCOWzdbf6lUQ8abKKF8X5ntI=;
        b=CZYnhK2KxwrKZYRrajGw21xZkkApovOr4HkqBlIs8I4+ifVvUFdjMA3E5T0Fa2MW9/
         ITkKHSRy+YdJ9+CYP7I/o+e7mWLozFAqR3+7oUBsF6fuHunAcoqUrejF2omyoC3tqVnt
         j8DuKGkWUULfT/N3lIfqZCO3dwYYSY87LQHZhyi2um5Ut5QSTlsvXzqvcPLUxtHIt+M6
         B+belgAgOEBtYOKV0Fng3tm0OGzkeyzdc1YRDsrO13ipl6a9cfErGjaWhHYK5umQT4wc
         ZPCllnmB/+DXj5bnrWLuMibtQXS2VrsvnEpztWB23+G/V/eG4pYHq5JejFlJdKrJakl6
         DUDg==
X-Gm-Message-State: AFuF++l0XX9/plp1LIsNqmU0mp6YvM158HiEF43mxyxopuZPnvaoZaax
	wKztxrpwj/ZJ0hK8en8/qozcYGSKUwh+Z9dSxUPRfp9YbxjomvWOIWVUdXD8J0IegwBq4Rf6kJG
	IhQjCXBo40fXAI2lOVbkVpoaLqHfQldFAlwWupUoMTy7tnGTLD+fQjKCpl/J99siQmCRB
X-Gm-Gg: AYBFou3wp8SyHJ1Mut2cpYNIFMGaCabaB45H6j2iP/4eJucqXSO+tcSBjHPzJqgS60Q
	rclP7FWjfxQjcNB8Hgdl6KnJOcODuFMhzt8NRFAJRmr+T6pedwryLoVvrYzd1BaePssV+74CM+Z
	w068yGq6C6me6RacHlRq5omySXPd1fihSXkrrlqnK3Prj+a7GUCnObmS2VWipXkISJGwhU3gTcW
	00A1FmZ17XZ+8q7AY5XrHxQU3MllSLFCkQ2ZoYlOmBPaLKepWwM8fIrWUQD4yID1QQuCPaIp0V8
	6lAdyq1gdSc0E3+t1PBxR734+VzH/s/PpIvHKWV0nBEsCjlS1Gu2pP44AJKuqS1ofM4c2UxuVhN
	Tl/WrDCV0SrIBPCJtijuAWQ==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203888785a.5.1789383856902;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr203881985a.5.1789383856403;
        Mon, 14 Sep 2026 04:04:16 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9c7e82cc1sm3020828a12.0.2026.09.14.04.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:04:15 -0700 (PDT)
Message-ID: <f0409205-b5bf-481c-bcbc-45e56d9b9bc5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:04:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 73pFhGnJGJsvZdv4h1LhKtO2HawRBKf4
X-Proofpoint-GUID: 73pFhGnJGJsvZdv4h1LhKtO2HawRBKf4
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d537 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4mQfpWPmsH_nVP9DenEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfXyQfED1TpN0YN
 6m+zPkH1/MUMjI07rIWJVCQ7GQBcv90V/VYqwD1GZUlMtJb6v9Nkh8JhT3WZO8PxFRVM2NmVWzb
 Cf1J8bcO0ypOSiAg/gIcNN5gTq62K28VNfuJPZYXbKb8/+jYDl3RYH+fK1sM1uyY8g70uLWoYD5
 0loMw0r34e+zxpCor2EPBmY5Gkbcy+dVdHZ4qIiftPutwzDYlxADgFm6jhzBmsrjfVZfwYXN9Dj
 T56LiDqCOMCmWnxZz+XV6VK2qx7sfz+hv1EpEi1CYMij4Vyc/v1uXCPSe+4bdLWshUwcqpKl28L
 i3HMr2aW+Na07vMuK7MP3mCmmzRr3I1gGWOsnphbnttX3wcrNG1XN2if+LFdNSdl3LZHXMW2NbV
 9ZPIIscoGdO4yZj++PKt3wKnE4jutrR3sG03/7aLV+93j/4SKBaRQOJxycyO9bUXtZV6fljv7/T
 t8F9+v8bqaKnsj+WGJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfXyzgwl/0bV2Ym
 ZBe4IPTo0DM9ushmkwFP1xADS/KbGlbqjqTkXNqf8rqE4835itvCn7qS2+hU+wSkHJj+okKRunm
 zRjvKYFXjGIin4W6drXlCa9ftKeKm50=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/9/26 12:50 PM, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and bail out on failure, unwinding any
> previously voted proxy PDs via the existing unroll path. A proxy
> performance state failure indicates that the requested OPP is not
> supported by the underlying power domain; continuing would leave
> the remoteproc running with an unconfigured voltage/frequency
> vote, so treat it as fatal.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
