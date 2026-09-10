Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D7049EC41
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048263; cv=none; b=ZU1wIZmYcwbcEkNnYtwPgXMxx/cPFsWGPSoWOElXn+36J+cb0R4tY8fZd4vr8xGaSxeOoWx31W2ZpM1lAMZ6tUcS1npcLsiJ62tT1YB5r+3CYCb+c8/T8AJsLCbyh27hcfRXqKk+y9XKTb2XGw+qbL4r8Fh/8/BEvDgQNUTvp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048263; c=relaxed/simple;
	bh=lrHkqTeo7uD619vM07k5lHCSbLgFJ5tG9eHMHhzaDQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDMh2FplN5v8iBVf/0bOm75EOBUTD84FS3+dhQONdy/DUfKwlvSwMWMClow76u35E0OSx7XBAdHRgaUdCTFffmKDSpUxnzeUR9i4qucrKGppTLfV1DMcKqtTtOU1JQlp6UJANgGbIAu5vW73+ytj5Nn90V8XBNPWUGdwcJcqqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZtfKN/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ou2g2flJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZtfKN/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ou2g2flJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7evG2029394
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=; b=JZtfKN/VAeG1gUUt
	xrr9OspZ8ehqwBjMCh5BD/mSbIGdf1ZQ8CB+94ewwhW/R28W4Iu1fSVPmT6IOof0
	iR2k8hknngnSXx3MwgxeW0dHJPPndrf8iYvICtMGk3Y6gWClLHsN3+pA6Hz/iQek
	HQVv1icAvn5eCPJBlq7jsYqqrblStHJBQ1UvUlgqRlfrScUHxxDSsRDxIqsuJiZG
	ki708fbxIXFZFqqJOOSTnHtPuZNLNebp3kM8XT2QSXEUHDlHwAjIPdPCIMnWD/N6
	eK+MjIHlowF0SSVCtLcBbi9sDnrW+Jnay2JMA5rEmrXjtds2U9ioQxuBHfjXTke7
	H64OKQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc37s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:51:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8663802b58fso4249005b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789048259; x=1789653059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=Ou2g2flJ0gma5b1NtDrqmxEP8FBBvOVYGTq99xLEGg8h1Nog4pmDPdDB6w2Ex9JZLl
         hO1tFDQT//n8ypS9fnhrtr5CAY9ZJzAtKxnw+kwTCPcihCR7a4ugSrtFOKzRMpcaZo1m
         qWShAiHwuU3yOjU1TpnPD1VILU+z5FFpqmkfEd2yXfEkdDvxNl8/XOZtCwgVlx9GTc7Q
         1C9nJlXIGyB1GPLHF5xjRaRUq+pkwrE9C8ANm4rlV6mnBcpD7Ov8GnSKVQTUtqBx6bEk
         /hxvm2Eu3ZVUmrojyHCRnOTJMNwym3avdFy2liYPsjMQj7OGG9uIljHArkSnqlB5LIM0
         2l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048259; x=1789653059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbfzeIYkh93I5t1B2s81xlBjd1elN2hz+aDhuBqRHnQ=;
        b=hUbmsyX7UTt4j2i1BxOHGP3Zleg4AlwLMSZzghHwAPpGvMLbLFSjQHEbF5AE/nlQlR
         lUMp5wmooq0NUTCYymuzHTAVrstZ0jW7AGzSSj5QpxgLgavWabkXAkqzhuylEYcmSV6V
         DJCVzc5tLz66qhBY0Ru9pDMHZLi3vOxWnicIQLWF8OjXnXgPM1xRaNt55ojTx7MuJwcv
         yHTnG5LOa1TomtwajAEjqS56WLHdC8rHxOIc7B2HSkLj5+esYBmNOKD1+ozZU+D52VjM
         Tf4jYMP/wGgDexhouZeFESoKNj5zxNErLz9NkkLj3accJEufKDEOd8UJx+u1kolRqsAV
         QVAw==
X-Gm-Message-State: AFuF++n68SlDuKOHYUvuqJK0n+muusDXD9bvp/FvTHtRy2tHbuTB5LTy
	IU8/fGM5vAb0PPDQZYW+xLRM9IW/jyFzKRkFpYTDFGHs7nrEqz4Ss9aP2PgQ/VeiUIEVh6wyv53
	joXfSszPYfsr8HQ4h9gFGPDMzQOyisoCg+uS7ivhTLI48DuQ5Jp5W3x3MJQfby539IGd6
X-Gm-Gg: AYBFou2wljhPGIzm3hOX34Z1cIPtU5UXed+0NcdA7C5S+vNpoA0VIlXzIPCnKTfv2bC
	NDwBbtLpHbzvA5GDanod11Hytnd9Xlekasv+0mmrqvFOK+AEvDpX1AL82Dl/IXrHexnBjML2ZjU
	Yc6Cx3boFmTJU/Z7aZ8XHsy1UbAWOvl7+n+Z/pZfen+0Qt2dd/kj37ZD3f9gFXgC/c4gbPV4ecn
	x55VYzNCEKUvUrY4kJoxWqMH0JyNLrIujfH94FZLHV06jm/b+ddzZuwcEIdr0yJDHQnQd1PYkUb
	zo0LuZgRf4JVoGR74TP9Jn/psFiwjS3XWkuk0D+sv/EC4ShypfrJ8eMeUPi9gVmu4gMAh5aqe++
	sYs3g0Jr5aoL/hj5mRlBIOcJ/0jk=
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547199b3a.9.1789048259343;
        Thu, 10 Sep 2026 06:50:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1489:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86945e5fb8fmr8547100b3a.9.1789048258767;
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Received: from [192.168.1.83] ([117.64.75.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-869a5b727f6sm1015221b3a.28.2026.09.10.06.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 06:50:58 -0700 (PDT)
Message-ID: <c1bfe656-a190-47ed-ae8e-be01b81221e0@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 21:50:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add LLCC configuration for Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, shengchao.guo@oss.qualcomm.com
References: <20260910-nord_llcc-v1-0-30fd1cca65fe@oss.qualcomm.com>
 <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Language: en-US
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
In-Reply-To: <20260910-nord_llcc-v1-2-30fd1cca65fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfXzcA9ZhcY3Iy3
 SOO1hUA/nPVxu3YzxEjtjO2EL2v4k9jNt1oYbGCtDSTBgpv2pgfdCESIO/Pu2Tf+iwSlMI/JY2Z
 r8WkgtvV+wJXy76yAw1o/IuCp4z8G+QPsewi+pX79HqUgR/Tp1pdatwKXXQ4+IUHAMoBNbd/XjB
 8fqct/H9oHZD+DWDxp2gR0Brp4XE727J3JmW5mLDOUFfqUoC+gkTjtefYY1br+S19xtIErDrZhF
 lI3SWf265jRs47f3kC971iL1AS78qYCyhcc1pWm25NeTgFR/14aRzdFdJux1ruJ9jDh6BKU+q/j
 nX6SMW4pIIzrcE2lRbta+RvhmzkPvp3dwM8fFCZpwBi/6lgY33ngps188hsKY9Im+NeWpKKR8qY
 2Bh3jyFyHS2XfrVBucfWyN2hLJSFAa992ALl9x15dZbezp1S3qTi7KIjEfFJlLn7oao1jtmO666
 MI/6/2kXr6zogJpMilA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2NiBTYWx0ZWRfX5KRpdh0G7n/p
 tBSsF3nCSy2LPk01O1bfd62vU9k+ZfwajtwnlT9RBVgRuMX1Qj4EuWoy/7Cm6k/CzaWrRj/Rgex
 W6rdEElDUlHJGUdNWfvgNS7Lbgs01Zs=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b5c4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=KiVCl6X23253Cl38wZou3w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OxrQ4fpuk6iiGASJZ2MA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: a27rlD7vBl1LF1QikXQmPO6UWa06cS9o
X-Proofpoint-GUID: a27rlD7vBl1LF1QikXQmPO6UWa06cS9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100166



On 9/10/2026 9:00 PM, Anurag Pateriya wrote:
> Add the sub-cache table for Nord, derived from the Nord AU (Safe IVI)
> SCT table and limited to the POR use cases that have a unique SCID and a
> usecase ID in llcc-qcom.h. Nord has the CFG0/CFG1 pairs and the full
> ALGO_ALLOC0..3 set, so it uses the v6 register offsets.
> 
> num_banks is set explicitly because LLCC_LB_CNT in LLCC_COMMON_STATUS0
> is four bits wide and cannot report sixteen banks; a wrong count makes
> the driver map a bank aperture in place of the broadcast region and abort
> on the first broadcast read. no_edac is set because the bootloader
> leaves the LLCC EDAC registers locked, as on Glymur.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>


Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>


