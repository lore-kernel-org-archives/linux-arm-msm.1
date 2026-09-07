Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247FC3EDE42
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779065; cv=none; b=Zyhgau6OACXLYocAoXZ4sggXWfPhbHIyK1l3YowbqWz8QNQSD8Mj/E/qqrTn8rjy85iUSK0sqBDG6XvNuMbNaGFBeG/ILCNhqVWjq7oYzb1ti8IlUd+rcqkdo3MfzSS22fbecmO1jdOPgeVde4xb+qPAhp8p9ndMUGFEclWBssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779065; c=relaxed/simple;
	bh=fUDCEYxySoxCRaRhUyorwv4kDhDUQpIZplJBgorTcpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGKCsXA9WuqOrH1Y/7xeNoqRuFsbA0+Rx/gdLro7z+zERdodHTAmA8lBzedYe04rhQZzogi9Mlz43jAsBVUWwmnvYNUwHDvovrCPnmD17wGCFFgJkUFsYBjmffxSlLF1NeAQKWlr+ZNx/P1sh+RXaUsyqeXlwdkhN7cEmccxbNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7vbh3pX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hxg+f+Aa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7vbh3pX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hxg+f+Aa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amxsw3873266
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KU6so8CejBjFsi3+BBcs4GZz
	l4XTntXNI65b62R9Ly4=; b=T7vbh3pXv/qx4qvUcQMgClITpuSSW1czzuLzhMSV
	7CJdYy46p8R6qnsxZKopWMYY6Eebs5eQpKRc3zEd0E0bIU0Eik/jAuyZshcSD4lV
	p6f6V1QZd9ZhdSQEuEqJ9Elu0kdCDIXw3iVYTdwtcgmrawHzV5+bwNHffCONwgdD
	bkKSstEvIoc7RpaSlxbicClH/gXn6xsaIDJ6npdab28qqWIjcdDt16jhbl/pbfVW
	T7TVxvQcxuq07PvhnS+bBgy3MHxbu9ClY77dETCHFBXp20UjrLf64S35EPPSXZmb
	Zomi2EYb+BOEDVhmBp9TOnTpCDkXQ1s9lLASrxHKJkTZOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1q5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:04:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93771aa0379so700124085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779062; x=1789383862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KU6so8CejBjFsi3+BBcs4GZzl4XTntXNI65b62R9Ly4=;
        b=hxg+f+AalBj0fcji+BVSUTQoXTvT34FpkAElHMUd1CEs5rK0uSrzpMHThMhO2Slcjs
         vJkXX5zZsflI7EvYbLVN9lxckL1PmYmtWq+yWVB5QHzNifvavQPRcwTlO6ZjLub0u26l
         4x9s7AxSrKj/8J9/UGPVuWOMm4yHHcD61aT84HB9RLCH+3dsIBc+HyJc3+6GkEx0ckZF
         TXxouDR9hr013Z44t9PctlSnQXjV1Jj/XK8UYmaQFQ/e0xBalg0LThUcs89guFOddoUa
         Yg3dpKsVShCUcOMb/HF+E6xjsobmfFQKB9rqdcmY1KBqlGNXBB6NxnxbYEY7Cj0otG3Q
         WN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779062; x=1789383862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU6so8CejBjFsi3+BBcs4GZzl4XTntXNI65b62R9Ly4=;
        b=q8f379nIzkIL4+0+8tQfSn9eoZ5KcBaRnmm8naGPLPpNV6Y0/IIrBo0IbV6Io+Mmy/
         t2T1b4ISvnKrTwvMhA+4DZRcDOOac2ZW7RnyIO9pUQ+r7Dt+9VUDlv9yT5VhR9Bduv2X
         eEh3Rls1cMH8mgSIu/F0JCeTCqM1oT7VN7dHTKqSp5pnTV2pdH7YnK+Wq65GJjJV1cUX
         n43V1Lv1tSSRyx3vCfU6CUHBPyGomx+pAcRp8fiPrPyi0KBjlFv142244yb0pAWL0ZMt
         Jy1bEoJMDNPot3zR/vw6TrwX668VA4RBIV+p1KF7ZotQFQVHUggsHEq3vjHkPqpX9/iw
         zC3g==
X-Forwarded-Encrypted: i=1; AKwUvBwd29pDfrEFnI3c9XE9+zqpauzcuMqoBLjs4zsoBDk39R1kkxyrK3b4s0agQW0IY/FHTWi9AeimJKhSciaV@vger.kernel.org
X-Gm-Message-State: AFuF++nsbeR/elRVIVSNW2H/OOxuwyZfMBDJ2F3KyzU7bfFJWc5FgoSq
	1u92GHoq9HsBcQ7mhsHi21NO0WA/UMiDQrIYWZZgzuJekvlMZHIWXvPW/9BolDo5a42SeQgy/Mk
	gm5LRpf7YhD2ieTMUIp35nUKhlgAglFhszx/KXReGbYK0qa9hwxR8jzlt2P/8P0KcBq5L
X-Gm-Gg: AYBFou0Dk2VyQSUAEq7PZ2YbUwNPsdB/i/FB4zxTaC7zpZIRjVAgeAaWPO1uKZ9WA7F
	avZ7xWxjh3aRH4HqusMKutAC9zY76dMtJ6RWOX3jsuLFFedBhkBTWcEDsq2QOmkW616r+JEd2AR
	1jlErrocctsu5Ts3ctxH8d6/m0OiRR8DT5mA9cetuUPPLTkzS2pEjo+fynJtLKKkT0GFN7WBqX8
	nmy2ep8or38ykbz9XvXEjFqRz4FrWAvZvj0njlxp76uDCRYj9SmIexNTNu3fh4OBesb5G8prt6p
	+y3XEMqSLl5XMcILm/LBeuhVZCI2VupVmccdDXMH0YK5mDWCz9bWjhHY4snHIz5Dk+FsWb6sMAh
	gXVIKgUXry/vN
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id af79cd13be357-93980400609mr2799094485a.27.1788779062318;
        Mon, 07 Sep 2026 04:04:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2855:b0:936:eb7f:d2c7 with SMTP id af79cd13be357-93980400609mr2799080585a.27.1788779061607;
        Mon, 07 Sep 2026 04:04:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm27092081f8f.32.2026.09.07.04.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:04:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:04:18 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] interconnect: qcom: use 64-bit SMD RPM bus votes
Message-ID: <fwhzhkt76zmpdbaehbiihulokhllhvb2zfrajmd4ovme6zqm22@ujsrm6yvhxsv>
References: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfXzqMqbfWbEhFb
 GstmY+TCPogc/cBGPW7mHU8AlvjwPRc/vh56RlWJqZoue7NZnOjZkiIUNIWijIm7RXF+aMJQ3KU
 xbdaAoNVLoB/9lIKlEig10aQKe9uGAXmsBk1Kzt4CJTyTaJHFJUC8ro0hLA+kwuCD+W7VhDs54R
 rNafvixfRUb3t7ftRK9RyXeoxT7qA2WB4/0HBR9JnybiULYme3JyZQAmnyKFL43hDTiXMJdWkFa
 4Q98js6CiVU37xPqW4qYcOBhKt14a9zCvUNRRqEBJx9nMXSfBZm8REh17vvWQ7u0tOYWXMFPGKI
 lqJugQG4IFNBJzAszsE8bSQMtPMSl9ZzZB9dnXiY6klLsL5OgNCCiCpJgAQiddfAPsNn/G9PCwh
 MJL7oUbt5/gblJIEwJYJsoF5oAEc3CKbNirEN6G33vS36CJ3RKfaP4lCN+QcJsLtiY1KYocdaiA
 +f3tHnRXn9Nt08RVawQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMSBTYWx0ZWRfX8PJB42Ud/w+q
 KqvZP6hBCYzJK66inNuTtRTtc58p8tMv1VQdkRJUmzWlEcRZP9MspG6hTO6eRpm6yEroM+b2yG+
 RtIbpebSRBzAiEuNweGNqYbZ1OMfvfM=
X-Proofpoint-ORIG-GUID: ao5Hz52567iHUJH4x8GvtZxgA0d0k9Dc
X-Proofpoint-GUID: ao5Hz52567iHUJH4x8GvtZxgA0d0k9Dc
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9a37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zrAAXKNDYC0mzo9CIGYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070121

On 26-09-04 13:55:37, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SMD RPM bus bandwidth requests carry a 64-bit bandwidth value.
> The interconnect proxy declared the KVP payload as u32, truncating
> votes above 4 GiB/s and advertising the wrong payload size to RPM.
> 
> Use a little-endian 64-bit payload and accept a u64 value in the proxy
> API. This has always been the right behavior, even on msm-3.10 and
> 32-bit SoCs.
> 
> Fixes: be06f8e7425d ("interconnect: qcom: Add interconnect RPM over SMD driver")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
