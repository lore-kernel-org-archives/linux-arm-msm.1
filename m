Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1C3AE198
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371765; cv=none; b=PiqiBrtL5EENZn37gsksaYWS88y7UhAv+uHVWT/iKAHjPF1Po96/NCAqHboKGDiH1dnKLPytkQAaNPT7mgx2TIuQ/F8W+KBZovHm4tgsZclntCi0n2+JibGitFPzK8G+ueQOPxVlJBUsB3VPq4buEWZxgooNMb7YwWSDHa5HZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371765; c=relaxed/simple;
	bh=+Xgv1A1tyIYQo04kYDL62oQ7DJQJ0ukUjIS2GQ6e9qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFSOVaDhd6UVEcQNOmMTG77sfsCHRLMm702ZU1C/ME3OdsCTM2C8tfIvC0DWfWX0PSoL7VFwVbsW3P/XrnSt+YolRH6vsG0p7v+RXxFZZb6pEBpyO0iMcg9j0ovCWpNSq8Cg5udisZo04CvdihlQbUaeaoDw17ORrSYX9vcz92g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlfTLmEN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeuIVoU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlfTLmEN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeuIVoU/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ioB83901205
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XFGQubof2OTfl6Uw+DrwikAF
	xXdv49oU0NYc0i9jX/w=; b=hlfTLmENbKHejq5c1PsnEbjD2RXRw1g/Z8l8GOsk
	1N/60IDHZdDJWYDBInBuKi/3JwnsIF8ct4QE6t5av2o3CqYtqE7E5LZmn2oxboVt
	/dbnre4p3qAfPT+rAcoPPg6BuZ6w/1ZbY2vvIy8VDo2puWelh/ZTS7gttlARs+DB
	2m9vSHwFnvHranCE94fLyuvzuszqD9zB1yeRNTi4Jr7hmiKhmIGy2kQHVyePgUgo
	e+OwQJbQ+IBVhnKRLuaSlkB99QjwKDIT+JEI8cPOEhzycVPp5OgeORtwPzToA59W
	pLaaEftUhvTgwQ2rXQNR0n6A3pW3oWwSHe+9H+aGq7fPuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so596854785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371763; x=1789976563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=WeuIVoU/+4JiTQpv+qSVv5B+KXuCTy3UZ56jU9cguhn9nQmtIJ9FfH6HSCKrLnPOiY
         0LwRZP3Iu400br3I7UqMjyYcFD5oSInONMW0qmLIs9V1Kik+CJTrtkedjoMPG6Xg0cvq
         ax4pN8H1vW9o3VrCZ9SMFZQ9mY9J9B8dZOitk1m8vu8kKWZGSxYLUIK+0kpJ5+LO+s7k
         HdPehUCmXbudy8EkyG/fXoFbPQ9HZE/h3QxZ3fWopZmlJu4aGQsPR5KYnGB5E8Aza0gV
         QU830wBTBglLfMd68ps1vGN49U/pGc6x62vLLpQ4j4TuJaVDWYWqXaTxxV87pt7/v3hl
         dtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371763; x=1789976563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFGQubof2OTfl6Uw+DrwikAFxXdv49oU0NYc0i9jX/w=;
        b=TaoTc45aX4pzvlK0eEBVowdwsTvwhlmpeMuYgkTmULEaJw5RP+dnpV4RJyga8f+fm3
         yUylTR87LoypLViBlDkLWqojRKdgwpMSYUj7pwnxDzbXj4RtYdUd+iigtKUWxV3ai+J6
         lV84n8oGag+xsrVcWsiITGWjOH+1F5NkbsfJPDfqhzgPwTHw98Q7mUfUmiA9zx0Msiha
         uPOmJQlAvwgphPkhMVVaO1mDOlgk+dpoHY4+UB0Ak09q2E8cA7C/F5lzws4k/h1baKZ9
         uU1lEnUxuu0wrwybd+axrsZFfpzpOH+Eo8DMwk7/CPfAvCvypC6Z017pDqAsxY5WWrXt
         loVg==
X-Forwarded-Encrypted: i=1; AKwUvBwzFF9Ds11ZvI2OHksxJjjL0dfroNx/qtIYisXRGQheB9upkz9qXFfCGYk7wUk9Tg0urSKnH+iFrGd+dLte@vger.kernel.org
X-Gm-Message-State: AFuF++kIK7wthApdNuZY+WS0WzYyFNiIcYXTMlQ9DJm9DB9N2OUS2O/q
	0sI5yu9CkV1loRX0uhJHROmOL7ycgVCmApyaRVZz2yIez+UCDVo+dzMxfDxqimb+5/KTgaj5vaX
	VNTbCLo1MTamsy5UyW4Y1lIXG+cV3zMarQf4H8i163Hr5WZgLs4huAQHr/z2nbZ6Zrl1L
X-Gm-Gg: AYBFou2+H/XNDEjHidrZ+V7cHeZJFAMO46V+hj1PKKqOYkdjIwmvLlhCPXj4lUq4DZW
	x4y4/qY+WkZJW7+UTLM7qo3r+E/7qJKzX+mz6g1LFp1xroshFD5lly5FqrqFY2IqtdsnJFktgpo
	v+c/SlpXcvWwyAlFZMBlWd7Gc7/Ee8vY3ZsIm3lPv6Vv/c2h3RNbjnWfPyj3wQs8h0al/gpXVRi
	RplrXgZeWOroU7LvlhCCRCuTXNvC8Y5jRx7p/g/BnGOQtyhGBRIHy97mZYRUc4VBmbh5/zt9fam
	IbNPppKVF/MLfQExyzyswK5/5bEnHEtbhLEN6YTBg25CaQHnATC6mqhzHrxOnk5QtlHhYyqak/0
	Vd/w+VtzNFgwrbZY=
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544134585a.8.1789371762969;
        Mon, 14 Sep 2026 00:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:939:fcf1:5c27 with SMTP id af79cd13be357-93a18551fc3mr544130885a.8.1789371762350;
        Mon, 14 Sep 2026 00:42:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e69f053b7sm217241795e9.9.2026.09.14.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 26/31] arm64: dts: qcom: sar2130p: Add domain idle state
 names
Message-ID: <iongvsbeork4xzzumcbyur22lom3dthddcwevq52tneeooqx3z@dqojykfp6nbs>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-26-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXw0j1h1HBUFkK
 /UAbWCloGJ0cJtbDPxQ+Rf24g/YU8C1yEUVytPHMAcOlqbrgrg2jZoqLv+s7SCLSc1+k9WKrYA6
 c/qVAY4p3GpYz4Srn3rcOLRMePfLn5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX9Ppp26dtbe3j
 XuLSVKGIeoNHmWMtWUcUMiN8+GoHu/ksbVbSXn6opGkLj4p7n5AX8r1C9j18wUQc1kBjd9GVbgi
 E2QmUYhuBRu6P9FkTQuU20II+apcOgaSLD8cA77RgsXvqnYq2VmLvfkhjM+5bhxEU/PmxIuqUj4
 esqDOhYHhTvb5JQRBc04D26sTDcbhzd0S8ZuGLK798FCwlYBByogUv3ZrSzEvL2PIdONI5/Z6yS
 dyT791Ayb8IGFE5q53NqkNWCzQ4SH+9UurGcdqujG46R35LAq7wNMpmTWRV70JXpo+twG8dh76D
 NHYB2J0ULhxAnuXj4T+xxUFhA7xlchJdP2O27vmMhKt5FLzxIMI4HtbpQkNbIARpJiXe4O8YqxW
 L0e5//llD+55Voht6MKNshE0ZxFgNV2l6zdXIxijOqUbowBqCmKFIMqgFFKXg7aqEx/JYRaxXR/
 WQjDfuueogZvd+FAZtQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a573 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TD6BIY46XsL3USDmdLB0bNPg3RJ-IkgQ
X-Proofpoint-GUID: TD6BIY46XsL3USDmdLB0bNPg3RJ-IkgQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:58, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
