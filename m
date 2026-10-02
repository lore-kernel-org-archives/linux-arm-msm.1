Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD90A4FB9CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 17:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961746; cv=none; b=deAHvHF7o98RQa+PDZREx/18cQEbUFOaP2royUG8+pQGLca9LOhT7U3EqbkbYMad3MLdcSa/rIxFXVQkz/Y+NJ1p2A2KqDil4qMH+Vtp9GW09QPTZjbKha51L3j1DjBw8BQ8nzjPoR1mdJwG9SapZLdQTTP9sQHizQ9gjHFuasA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961746; c=relaxed/simple;
	bh=wfkQTCtihLuQmkMLSwbhTu0nmBiQEOBAVacLI6it58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPmG5S4qYlk5vdv+/GYvv1z5hBUC6SGpwaD742u1P1cTdXbh8Rf8t8If/mOnqhRTJ7U6xUDPKWEeUX8ZdYjfJZ6wKz03pqgxYmYgksMejX6p35D3SI17dWDV7qoURYddcYNbXk10M0mnBLzubOCCGcAAUEIoiTPyPSaHAOCkW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4b6DvWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxquiZya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4b6DvWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxquiZya"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H68V62514185
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 17:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=; b=f4b6DvWMKkZ4SuUv
	SMc4ECK+16+u/XjEnUJDUXU+RI6+O5P66DCqWtdKyizQolxNe3p2Mwck6Wa8oaD4
	wjPrFHKxekDCVFLvUR+cPZQ4MuUVYVxQdmhivEcKAdEFbdoVkQfk8IP54PHrbrfb
	kLZ2gCEFqeVdyyyVanpwKo0k1SSsDj3FD4robtkr1ahtQiimE+nwOxNU0zHmHMWo
	vS6wb3pslb0tUU0UTYd1XCgMd/U7jXFFNT/N0DGbrOsU+XZ1lEp9zxQbB/3HI8Rj
	ji7jgi9eJcxAemgb5C5ur3eIUgt1EAAoG9ASxaZ64nITp7dCN+J23IYuleYZwOEA
	iNxwIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj01kjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:22:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so199160a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790961736; x=1791566536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=JxquiZyaLYW9rEi2BLzsb9xykanhQc9wqF1DtFB1YKeNcdh85W999oi0wS43RhXPZ2
         IwBcdZRvuFWA7oTyRcNQ5GCaRVNAVDE0gOl+XeXyuqx/CclivNis3HyQwAuvvAKM7guE
         uTFZPkDEfqPGn+hIgVJX1vEp5SoYHVCVKd35CjxUwj9SPS9ayMZtXA2h/0GSr0AYGFpL
         rUsTdrvX6Qz6JxaeQQNJnZJchmnJPzh4SX4GAj5qYQXBAKdXue3uPmL7e2R4krp2Cfl6
         0n4wgTqcMuzSfqsjj+omFsiqp+PSmz8ba1O3NxKkO8tbJLcbSGhJgbbfQ5fsm7lOIK5a
         Wlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961736; x=1791566536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR5tyXwtqll8A7xHJC6SBeUbgFbK2QmhJ4Eo1XroUTY=;
        b=SAO9iuRgRFes2tFs9jRajHZ0CwE5stdcYgwfj01EkroI8G8Eg1VAMrA+R+ZdGoZxxW
         lMpmbwn0Irw56+E5jo2hrhRygwNrR0ftuEBpeUYPo0dDFnQn8QbhX734ccDqrd+T5RdY
         5mBc1GErhMHfxVKetHvyMsy8GT+sL104aSuvcU0HHx+dU+4oi2jOLSIKKxIRrUaxGsWa
         J5nqFYKpi+YpTDsbAuAHxvXPYA2l+jHFhH8FeUpI2U9kc739EmEtPEAABNMNMCvabwni
         xc02dZxhV9uh9LVIt86/TEfVkQ0GFwOB3S0ymhlInOtT4RA1mpMnEHpX/5N9lwhPNfwW
         Ocuw==
X-Forwarded-Encrypted: i=1; AKwUvBzbiRjD6df35u6whRFywMrG3c/zpfsFmY0LJ9n3W2LTqkJYd/OLH2Z3wDy1e9tp4N+IV46jR4hzcFdiz/4z@vger.kernel.org
X-Gm-Message-State: AFq9FYJPKMuSlxRU1ZLWca7KvCoWJrZovDl6hPDBk1HgHruSXqdAeeZw
	0WfYn3OseEMFIBVN5m+CYnMEwnWdUQVmSqZu7u0HY6JWVeTqpervaQATfmRN7KUBwwxIyvwdjZf
	LthRO5TVbLPnbYgw56G7lXeqdhah6d9rJefkgG52n3CiFQDIPMENkxRwEfmdSRXZzyppl
X-Gm-Gg: AYBFou0KGWWcS1iVya2aZoStdnxnq90oSyZAnkPBWAWms3VD4NHwg3KyTpqz7rMrvuZ
	oG6JLyE6bnn86YRWSXoji09CYGdh2Z3nsHTFEIzVfCAU1h0kbsCBPg/bg0JEA4tCK5w7rf0DTAm
	zICviB/zPz5yWQnLlQ7wcVTfZPk4hvoSnNUGQ2O3bDwBsKsuO0GL3Ka5MnW391aYAgV+o/HZpn4
	AVq8+oh7wQZQ2TK5C9wF7kd056T+olBm2Md/WU+fRWFiR/PqcnYvG6Ie/Dv5Pt6SiJ+XpWuxyMA
	uMzRwZSHvStwrpWNlRY2s3PEz32gFnBQ/3K4CDVMJ56Ryz7ON9GZczFoDG6N6KR3mOW1eElKJvS
	ZZmxBJsaBNtzl9/T4poWShitDG+Pn
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609532a91.6.1790961736196;
        Fri, 02 Oct 2026 10:22:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4a:b0:3a6:f90b:20cd with SMTP id 98e67ed59e1d1-3a6f90b2630mr1609499a91.6.1790961735611;
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f43a12c9sm10811502a91.2.2026.10.02.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 10:22:15 -0700 (PDT)
Message-ID: <3acac1a0-a64d-4549-946d-874df45c3dac@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 22:52:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX2wZXu40zHmNV
 7yr1zX/FK1Yg3QELqsphiIo3R0YK3K+8Crf10KkgvsrF+QV4RjtbxoghPqYtTKwAn7F/r+1X9/e
 VEraSgpnWgZ1AHXiEPapKQaxzddv98A=
X-Proofpoint-GUID: MaMQOTKq89FKXYljXyFdSU6vwckaeyjZ
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6abfe849 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=3s5aCXBOHJDmPDD1+4kJVA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6XYEiC8ceDmu1LDSX3kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2OSBTYWx0ZWRfX90eeyRpa4DB/
 nu7+nOCDyjNVW5sFzkptohLUcaviAZj+jMO3MH+NX+8XeHj5Nwq9evugPTySWKOcJ+mBkQxBwQh
 MOge50MXRl82f9i330DlGF7cMlCN+IFP+F8vM8WPPZJEzjwK5sGZ760fEvYOQq6x3IdCYVKpWgq
 ygoVu+JLBzMoQehxv7i7druXvejsvQ3RrG6cEK1SZL4xm7h2yNJOkcT+T9klRM+wnkVQj9FxX+n
 11+pny2wCfEE9XCl+zM90/f1FPA/jVr1DjwHF3s1uc5736x0djLEjiJw989Uq207HtYsDuqxxAd
 ayG+TsVKyFQjNhXjGz9eti6jHmNBXH6LV5RS1e2QhwVFmrkbi4FbIVYRPUo/tkFODeUYTtpWXmZ
 76MsjF/mcr+IoDqWJ9exDikAwQ5jxbbo976NikNlRV5PfYaQfaxzuidLNLfz7J9NGzIA6CNqiEv
 r6sWe8zsPAmslDNqV6w==
X-Proofpoint-ORIG-GUID: MaMQOTKq89FKXYljXyFdSU6vwckaeyjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020069



On 9/25/2026 2:16 PM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig          | 11 +++++
>  drivers/clk/qcom/Makefile         |  1 +
>  drivers/clk/qcom/lpasscc-glymur.c | 68 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-glymur.c

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

