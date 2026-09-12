Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81498317145
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227356; cv=none; b=iSXjaqDdZpjN9wIiD0VCYa8S5XSqWbElKkPvp+xEw97VhwQF6/UNkqagrbFS9Z/z5c+Boz6hu9q2lp3cHsXfZuDyYiTJNCkuuSUsWBFE0ZTO3YtR9AJIeDx2WDCkM5apZTLVuywopofnkehyPtqv5uiKF8W2fFNn6LGjlcIkgGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227356; c=relaxed/simple;
	bh=gxcvj0KOnHwI5dUadhryMS9KAVUEfdDmh3EcnxfKxq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP40FPYuzs1+2G+fhKfw1YF3lS21AXuXD5LNQs37Y4f1DZ1g4KtX0gJBeMzUj4IDV2IHsnG4f5X9bqcPyf/HoXUCvwXfnijUEsQRy9hOVA0TfYCluFXOdWJjSjRA7zfdjGahqq+iXHN1fE+nQ0suRFOtyY6v9tFGNXKqkEyLyew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uh81rjka; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1xsRqMS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uh81rjka";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1xsRqMS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEecvu3644448
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aAA4yBz2x1MDnJxsSFSl/P2k
	omSZ2bvSIHTk8jsqx6s=; b=Uh81rjkayZAlNB03JSH2r3gRmk5jLSvbYfepXLlB
	PDnPTK6xVGjNA/9DCUUczf5fPfZQaHlHPrza/Xmxjq0S+z7nHwkxPtOdUXR7BwFs
	uJhD48Vz7rLatuOM3TV1EqmKvkdNxhC58mDLBNtY1NMGR1qWZ7300P68+gVfb14z
	/XdjxB4EEugwOWX+y3Ydl/4XMj0JFNB8PfWT8Keouzy3humvTYBpG+9saAz391L4
	S8lB8EYgcZPMQNCOvJmU6C5HQn6YFCYBh4jlh5fzVv7YQ9d0x/t+9lSr2LVSwJ5L
	KIbs0ADosdxq/1jrbZEPeSLhXqDXyxGUURCEMqMlr8u8jA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dh9ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:35:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9394ad7f64aso291297085a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789227353; x=1789832153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAA4yBz2x1MDnJxsSFSl/P2komSZ2bvSIHTk8jsqx6s=;
        b=R1xsRqMSga8eEnpkl7WD4PWqETTd1kGk7boTPXrTwhX4bHjoCk4dFO6J4KJBRQf3Mn
         l3u7C8c9+ptYPALcUSkZ+l3fUEDiaJWVGYRrGbKlc2M9atIzWjNAgUqQYwqjjcDRRIi1
         8Ag2JMOVGYhYh6ack4SJ+WGTZv0MPuA//7Eu/Rk4SbuW3za383xUYFlLcvhTe0fdugeq
         NZm/vF0NDnpQsE0a1TxhI3x7vCw/qUn6AHUsH9ORoQXDzbGWGlcoDUU6Na39LySfaTIZ
         UNsbSrYEc1tQ6HhKl/ouOXYUwLnz1Zj5QaQEQcXnufg46P/fS5u0Woz6hwblh9srKbsz
         jhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227353; x=1789832153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAA4yBz2x1MDnJxsSFSl/P2komSZ2bvSIHTk8jsqx6s=;
        b=XATO6TVVmO7EO4BqtEtFxczkYIADfF4FPJQ+8IiaSmcOgq3548nqKpek35smPPoJvi
         zFRbtu5O12u0Lf646BwGcE9oRE+3R1HQKwIF60BKgdQRtZ62t+R3jG7D/r8syt9kNprV
         hzIrn/Qc9ZXDOxBOmiJe+1YtOI+6X4yoINBBtF4lHh9VWzF5W1p2/g4N8cU68wtEVZPB
         kxWEyEdel8oioDa3zBxkLBKmrZU/ddi6AljPKWjqp0atpeL8dIdO2GHPYemt9oUtuJs7
         S7fBXTgMdwbYAL2YsYlckpuoqAM53MKjqwt2Oe1XL5pm4i3C3VrjnYgsPB/9DrZw5RCf
         OZLg==
X-Forwarded-Encrypted: i=1; AKwUvBzPjl+3MGHpz7DQ4yzdpGmpbdJ/lgX5G/M5D49cLavP+SQkppRdWxhFkIRhO3WeKGm5GST5JqQPSeJMyoPc@vger.kernel.org
X-Gm-Message-State: AFuF++nHMcFOz1db6oT0R6ew3YAxDoobAJLwkQ05xAjnfUeO5jebWzu2
	Un5aqAO8gDKj/qpwQPc82h/1D8ojScrqH3cjSTpqTsuVQzQ2o/p5RepcymwEbZR/gZmPzFv73qW
	+6NLRBMvJO1P6xxfdv0JfEW29qJjutPCH++U1n94BqF9Hw6DLulduGJ7+764VtOzGthzB
X-Gm-Gg: AYBFou2e6WkMrrv89ZtX5YrEqFuivz45P3fnltKtFAPoC1Pz9dk2g3VDD5NMg6tLSJF
	TMg31G+kN9lWdLIXWG1P1A6FYBBqYuM9b0uIN3yCyAXP7wIqWhO2SYwk6fnsXSj0VlOXPop02g6
	fkPO4X59FzPfXl8bo3jS2dTu0FwqNEVH78ocoXfu7yxQlcpVY4B4rW3S1j7wRXRUOtczrLbUQSr
	qMKeNOwKK0AV9KxOQR8l4gjbMRtETCL11BFgEdgm2LwMLQ2bRdzHFayrwH3FwTGO6NOeqEpqcXl
	vIyMrwJjAlpnm6UOf9p1zaPUkel8o6CFozgUjStZwk6z0j9Vt3xN1wZyEAZT1o7YjB7vyWhxBFG
	FeWXPJODIcaaVbg==
X-Received: by 2002:a05:620a:1d03:b0:92e:4927:2002 with SMTP id af79cd13be357-939ea28decbmr1485014085a.39.1789227352628;
        Sat, 12 Sep 2026 08:35:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1d03:b0:92e:4927:2002 with SMTP id af79cd13be357-939ea28decbmr1485007285a.39.1789227352036;
        Sat, 12 Sep 2026 08:35:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6cc11607sm63806145e9.12.2026.09.12.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:35:51 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:35:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] arm64: dts: qcom: pm8005: Add temp alarm node
Message-ID: <ah22mmvaofsqgivm5csfloqoru4quohbvdmdgat4jfkhntl7k4@mcwqyb6hq3bg>
References: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
 <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-shikra_adc_support-v6-2-e4b2da5cd55c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfXxnJ7Yg2U7Qh/
 +30XzA8rIFXOHXf3i2B6vkPdIsvJZUtqkwJsNX8sC1mrqkX/rh0Cxav3KyqnR7tQzpQbBcwK/jA
 6lVpsgjzOSvCFsHgtFK0CnIu8n3ax+3+YDLmLLZXEXYd/9W/euspWU+N92+r8JL1OjP87vGV/zX
 lWfBsx4GHv61bwyHWpEDicZK/aVakqqVOh6HoqJiBpOQbtfkOoVeKIlU7etqQdbXrRWmJceAvd3
 vAqTlGmjZXia+d2o/agqv4YINJ8NTtpK3NHORZXIzNwBr4qKn8cnshsUDRX5WdvBcKm/dpCafNF
 uOCWs8CiNAB+JqbSJbfVIVoelzAz0PDMGFp9RYVH7kV3OAajZu+MLe3T4t025yPRsarhqUpkb/Z
 um/z17TxEzzjkUDxjJyUT0ElTujg7W8ACFCYMzVQDTi/IWSEkePxESXJwqICkvh2nRDKRvWyj7T
 mheCKJHq7Ge5MmvuYrA==
X-Proofpoint-ORIG-GUID: Mr0-n9k__nn0NjbU9Oga3Rk1FTYTRxZX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyNiBTYWx0ZWRfX7f3gjqKk/Nqs
 nIeJLkcI93RG0UxJr8quJlzH3+RxKD2ik1hSYFbbvI1bNQ1kJgyBIoVAboohj89X57/0VVxyLB+
 HdxfgAM428fkYQ3AoZQdZ1DWxITiDHo=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa57159 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0iEBmV3l9DZ82o72BXwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Mr0-n9k__nn0NjbU9Oga3Rk1FTYTRxZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120226

On 26-09-11 22:10:40, Jishnu Prakash wrote:
> Add temperature alarm node along with thermal zone used
> for PMIC thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
