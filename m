Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638AC41E6B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108311; cv=none; b=iyR32WhhMkjbDNwJEMDE61wJBXZNqunZFrhLmQVR1ZEXrskk/jk/l0tBnurPQzE67amL4hzINn0lzBs70C9LvH5Czul7p0AGtUeBmNriY1S55o2tISY0hWSeHIII5q678kGqGrx4gC8SDwsWbWE2BCZ5wKVFk9a/pz1BSvpJALU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108311; c=relaxed/simple;
	bh=841d5FYBA+uiiw5q64ZndC+xRGtfySpWCw6HET1TXoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZ/WGVBfgksJV1fOzt24biltJMtsnyGVi+bezaseE/JmTwjCl4+ZToUknFMajMdLbiF2yHguwCpglYtDGhN0ePgFWl+Nc6UC8gN/LHNqoGgzBEx1QmjeDwioS7GxiL38iRJTxCxZHXJPRCxgB37ZqVNOv1j+RQY0U7AtxWfIYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGxcgHTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtWMt4kJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGxcgHTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtWMt4kJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vZrS3464151
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iJNryjpmXiJCbdcmZCcawGEz
	28hmwGABzhorM5Josc0=; b=pGxcgHToG6N59Ff8MHXwVZgysvYdRwdPBUdX1nWo
	4s9Ws6G78hRFJ3xko66Guf4BN+AcZAUHu90U3ciS9P4EXTHZpa958ztGHRe2MB0s
	J41WZaHJ+m+Cwl0mQO2ByNF/aZmroMOvGlSQ6UsnagAARICzfZBSEfHV7zL00qWO
	1GVrLmVtFPjEfu2ULTJ5cXssUm9UFmy5XIvQTIwGgcTO5NXHUDdw9py7mg+ZzajV
	zBm28iSBySCAsYn+cBcs5ZteCTY4k/kUtFA+a20oBIPbiAztEW+SWSlzrHWiv6aX
	FlNkwDnkpKsqHu/5XyfUgZadV/qzZMfRC+YEcNEyqKA63w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41f3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 06:31:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so794616a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789108304; x=1789713104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=UtWMt4kJ22n6cUKBatcXL9KxtnRWLJq3FA6msJgtzoluiPhrNPnPkgaQ3znG7dYrRY
         Ufk2ub3ix9NN2r/s0PACA/86Pkl62bmOlpdzhM3Gk8Hqm9EthqW/yq1/7QZCy2MkmpLq
         GlrR+lZWm8zcIkSLkzbcayGhsNfiyzCfks5u7y8nfRyQowCbypMuqU50ZNDhKLMqebZC
         0C+uR2g35vUlnjYZQWkrkduJZUwGPy2l4UeqXmsv6ltm/ttmW7Nrjuk/djTmZIqX61hx
         6wqnAjqQTMIW8xw7vE+4hvHL7oQbRWEHsIZXPviU4xSJnn0TmujMnWlezSE3ZBvw6Rv/
         nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108304; x=1789713104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJNryjpmXiJCbdcmZCcawGEz28hmwGABzhorM5Josc0=;
        b=Ar7C0VoQipUsH0GS5fw7XN+vsg/t79w22mfHMqmMD0HrUrQO8f0J5LzaiAo9NFAH01
         5KoWTz/gF2ZOYf3nUnIOtq6ga6ylcu2iXaeG2JZS2BFgV6w4waPKt9UQsV0J4cdt0kNG
         3X0Y0cuiKXumkgtyoqw5I2PBfHS9Dyus8nYlS/nrWcnFYSFiXI/81IV8t+4eNXCd2hg2
         fSIEvfsuCuF+T0vcTvW+nVJxAp7AhTBfHAPH9AUCZuk1AzZoDRn5bHG6afBZJDCvDQYo
         qjmgi4a3B5Rl2v1r1JdEDTq5yN10Qlg4oj56pG0PHf8ncVk5qRo37UWBaRl2rnSVCptc
         O7Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwU92cp4kvo0S5s0s/LMNycCXtVC3I6HRGFmosUZyQocRWe4g9rQDvHKgOSW1vrZSjj3y3WuJxjtqSktgaH@vger.kernel.org
X-Gm-Message-State: AFuF++mFgQWeOG5xTPz8j3XJxJ06KP8fjASeX6gddJ3fPVyfbXi80LoD
	WUBixBPHuK6G0vw+tp3HLArF9W8Ne95WLgEaABDX9CyZrU/ZuUh5eW53AqgALHQ3adnn7v06Y8J
	e+VVh3stdS6xLUlmiY6PAbIAuDJPp1q0yS0YnClpvNu7SKy8UIQxgmzaqUCJ+jyyUe0Q9
X-Gm-Gg: AYBFou2bwoMoVDF/G97sEadpbhK2clSM+gaSOaZgz66b9BG/7Xeume96HK7AGs60W6T
	ACH3E/SztKTWnOReOJ8K3qVLg+4iYgWB3JwJHhDmqyTgAEQOBrT9PSwnS1KROd6soReOh43MTll
	kC0qJ+B+gesCSmJmq66NYnx++97HhiDCskeSVTfR5Wubx+NXf5krkr/THhNbCO2Q/fhTZBGa3+q
	O7jN80pI/D/pzQ36Yrp4Ai/vAJDO5h8d+g1M2gRZmXt/Mlz1xIVan7StmDLCODgZnt7/vSqg0e+
	kwAXnW+uc5mn9eHK07B1CyFNJGU13ui6sTBKLtSpCGe8w8SQHmxhNCrwzWBFRgUb0Obec/5jM6j
	z6a5KfVXyG0CS7hyE8JNGSFC4dWqlj8wB7dy+wXARCZw=
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440605a91.24.1789108303999;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
X-Received: by 2002:a17:90b:528b:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39d9c35a3ccmr4440522a91.24.1789108303439;
        Thu, 10 Sep 2026 23:31:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm6290797c88.12.2026.09.10.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:31:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:31:37 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, zhangfei.gao@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: cache: qcom,llcc: Add Nord compatible
Message-ID: <aqOgSe_Q4YWBLnBJ@QCOM-aGQu4IUr3Y>
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-nord_llcc-v1-1-30fd1cca65fe@oss.qualcomm.com>
X-Proofpoint-GUID: Hu4HNkPhFqftDANqy3nnyN9tsIPXEIMW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfXyEmR4GTpefmu
 RX6TmGPHm4mdV+AZjusn6vCqAdvevPOjKvzzR6szNIHu14IY4AMdJuyI0LJqJT7s4kut7/rj477
 JL1uioyKtUZZ7plC4lGDwYyo2NywMMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4OSBTYWx0ZWRfX1l5UhUsnP0v/
 krTify+WGK6UVlDLjI9Q8BioHz9xd+IM508NFtz65VT+4/eNFxNikeUJExBj0rrMi47xe4ZcSeD
 3wvIC3gUL2kKvj7drFFFFu/TupuEZOxi89iD+4ZVizbqiR4Si+luubOhgiG3rt+uKPQT8+qkHWc
 ULVKu59h5bdNJAF6S+FShhgC0r8W0oK5kA50tAUwrkDU1ZRaNWZLA3so5Wsti2B0/yfMrdi/dS+
 hvXcsrsprhllZ9Rx1M2pXkQvhAjbqoajnD5A5FlbCjyHSANFsi/TTs0XAlNWh7+nekp4F4uy0fB
 3UyXOHv33ugLQkcTepGD/nRrDh18NlfrdfbmBIDJ1uR24CinUU2rnaVQPc/n5VCpPZyubdkyC6U
 bW4EZ1HqsNquPsQx7h+5kZDxqX8KOl6emziYSl9GFLBJ7qJLs3EtJ7XSdRyymjvPAo3Zyu949Ub
 97pvbIcH6jN7Qb5TtSA==
X-Proofpoint-ORIG-GUID: Hu4HNkPhFqftDANqy3nnyN9tsIPXEIMW
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3a051 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zkjlvTYbJJQcmHsFOKQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110089

On Thu, Sep 10, 2026 at 06:30:43PM +0530, Anurag Pateriya wrote:
> Nord has four DDR slices with four MACH9 LLCC banks each, so it exposes
> sixteen bank regions plus the shared broadcast OR/AND pair. Add its
> compatible with a matching reg/reg-names group and raise the top level
> maxItems to eighteen.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
