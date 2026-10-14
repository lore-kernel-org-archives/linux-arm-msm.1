Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FAE4EFFCF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982357; cv=none; b=SyDW6P5g0Ul69b6CfAKfXgHnDxsyxdFa39M4NuTw3sk5uXONe6U7D9DQ84D/y5v9KVNgDSMb4Mw+QF/3Pv1u1uwhkPfE5/oC4+/ZrQaOyGSNkmRbHP+27ZdzaD0vcH43upgZwkj9G3cYvpbp2jp3vm1vpDEYgUnR59lqJyhMsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982357; c=relaxed/simple;
	bh=ggIJpFtBbGEOkh9+LAMjApcVH5QDsNsEeUnjHDyW24M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=faXVpr3meUq5RVEQ++cEl4i9qb3H9bT7tZf0w7W7gRM9Zr15UaUiAnXaNkzhp0EKGMNWahAbki2zs4DVPHPPmHUlhlx43cEUh6Dw1gCIYfBNlU7KckkYZeC5mjRN2D+r89nwSB4uEmb7nGajC1MATnVBtDBN02bDroQlwBIPHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIHBFsNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeTOiMRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIHBFsNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeTOiMRw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBS4sN3366698
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=; b=ZIHBFsNfWR+rgZZE
	SSS/paEcFVjnSHJFVuKa8I4UXs44sJTgB/RoqL8DlGwmm/3R/PjrZm2Kr5ojHrti
	dWUBexYRKSW/kx7YPFoCa2m2IW3FVJR+dJ4QSAe8azX6xXO689NTWwqYgFtoQcDH
	MrbSJ5KEsHBtONGueI5V1QeIOMGtwLB72NzsaI/gZo4ttjNkY0beCTZjmAwQ27Tq
	LHKuTX7h1vFsU19joWqcF5jCTDzKKjE0flanw7LgAE0SOPvZ9cvqwz/LuPObKxkz
	UHpChVQir3idXbuTCmyIpD50LhPVlY7JjjTVzzshL3JfBuZqPhFEwbaRQs0pxQWW
	5A3D9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4621mv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 12:51:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso53302485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982313; x=1792587113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=UeTOiMRw04F41y0j5j8d8OI2BXRyc/sUXMYpV7PjhJ/GiU5JIeNqoFkMJZtr/yGxM5
         xFNL4tDf0gwn78nsOmUyHWP65NPbrPXIXeDts+eeCp09zDYl6Y58BS4D5ExMdYeZ43iC
         CURFEcKQdsgwJ93+Id17cPex5EmVpUX0fJynTivSxhpjVI7+T8QSX8zD1OcZM5Sgyucb
         0EAmkNu0S8/lHcvwcmqWpi2iOI8HLbMn37D3+PRFfdYaOm1p05BfyWAShxElImqAzHgq
         RI1hfvksMQ91EYh3H3KSram+CBC7zGeHWqrRg4pybYmbsiK0VjhCqFJcJG0h12P9sqBC
         bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982313; x=1792587113;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoL13luJ5wOMcRgov2oFovA2g24ZYuiHZYrEI39rqsU=;
        b=DO08WQeJzFqhz+1baWA4ydLJquPXlZwEOKFJZLiJ3Ck/NJm6+L10n8t5ZEeF3zzRQM
         Q3Vvu220vqIe5Z/zGNxoopzxGg1DYGBASF30DGpxMucyCbe+YAaMYfhqXH2RMyDaVZ+Q
         eTzFeH54NXSJtwYVMgpAe1Q5g05oZGmt+NRSB+rF3sQOlICAeiMI3bFejxqGxYKel6wE
         3hGVTTTrjFng81e2zQ3P4C+MM+ZK03tn7mcj/Bf6nKbZaE5jolhuj2UvpqY8PF0Q1QDC
         N862ecQsGrRlx6v0Ajdg70zlfYi+XNC6fDu4JCkKzeZqR4p0CYVn2g/iCCvExK+98U2C
         0CTA==
X-Gm-Message-State: AFq9FYJ+EB+Fbk71OMAO+kChPeQxm7V67+tViIW7Ob4sbeKkBJPC/UgI
	/46K/DdjBmRL1MMNYHzRWCXZqKvcYOnEMfecFrLLCGKwXe3PoPjrRhzPSrJFERvI9jl/d7myA+/
	OIws2iKMksRKF7NIyuwPbK7U1Z+XswP+Fi/4Ots6/ys1pg5hsEX11Y6SZzyBjuwFXr9hZ
X-Gm-Gg: AYBFou1tYzj2I8kQ6aimEwYaZW0EuQb79obovQeAgA+YUZy2IeWk68oKC0Pw08yL0OU
	Q8fqbkPP2mN3LilB4R6LRZkUJbMb58bSuCyjOXAD99Gr1C3/xyCZ/aYPSXZKM7NMJCgHV0/4fBi
	+OZBUzQ7aVUrx0xWsp6VJErT2once2yHfXOiITBn6qHLpOX56rxTEzQBFHcWd9BeLU+F9az8trJ
	74c0TM7kRYEzNcEXgpV+9RbUidvEPRGd/1funsrXoQyQokQY9Blz3p9uyVLB2Pictaa6TY9GIyC
	1FObeaWA33wThsR9jhJlR6SfiIF79jangkx2DeABnBsIVfjuH7+De3KYmUlImRorNKxz1XmDT+S
	KJhCd1/pDYeyFf1Ry/R+Emg==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132808485a.0.1791982313182;
        Wed, 14 Oct 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr132805185a.0.1791982312668;
        Wed, 14 Oct 2026 05:51:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839764sm1094637a12.7.2026.10.14.05.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:51:51 -0700 (PDT)
Message-ID: <292be478-dd1b-4ad3-a5af-5df6e61bb89c@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:51:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
 device-specific pmic-glink compatible
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261005164303.1208127-1-zstaseg@gmail.com>
 <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005164303.1208127-4-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IoRunXs0eC-gL7-QCprzFzVyeLo_OnWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX8s8MZscnBWV9
 +uEKnrKB0cArWNe+FZuBY1cJZW1ZX8CCBrQ/lTT9fF0bLR6F/LBrSBqIpkWDA1gTXNRa4Jwhgt6
 6RVbIrMlc4ApLrzrTDuxbIyzNkJtorvtf7zgnDpk9BL/aGBY2lZOUo6NQWbWkWzUIh/612xgHGt
 DNA9vDjWtMBDnsGFQWT4cBSpMjMrib+I2YJN+hW8H7+vgqGnwDTvCtqQpD2A0PXjug8An9YCT0z
 7ZlCyQMu8OASkOipoERYTf1R6f20tkKyikAYLlA7ohM9DwDyRZWf/AezZoIc1mXTqz5tJj4IiEt
 P/7M83Xryg723AM4t+374amGg1IIu3A3WFUJlEmdmyA9BPXjJZVIDZjDWt32XWC62eWgnFwMQMt
 kO7HFYvRFRQG6IDx4P26p40sep4mZcPnot7uvS6Zbnei6QjVYlY8Jwh3mpLJNMbFZPmXbGgyrlt
 8AjiQ1bwGwpYyLZmejQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf7ae9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=EvRZl4TTolMPfV8XnZwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfXzrS6Uof5/N+U
 icuTi32P3K3LM0GmzzKBZtoZoCFP3BL+yVyDOQ2vLh6AmjwiTMNZUgW33y8IpDKWeiUmtk7klwk
 9K5QyYVq2PDe2sj8IxrR/t95aqly7t8=
X-Proofpoint-GUID: IoRunXs0eC-gL7-QCprzFzVyeLo_OnWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140051

On 10/5/26 6:43 PM, Stanislav Zaikin wrote:
> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
> qcom_battmgr can identify the device and apply its taoyao-specific
> battery property mapping, required because its firmware shifts
> battery property IDs relative to the generic sm7325-pmic-glink
> firmware.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
