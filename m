Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839D04D599C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644672; cv=none; b=OIwEFyRHYABYh2iO+OiO+Dc1xuwT0IMOLZdcVBs2YJTzvQfBYYnWLMdWysRxrKRXbjmkrYGbp7eVw8MMVHlf2h6BrxvZZzwICkq2Gxt8Z2PXHq7fGqg1KXqZtDrBFzKh1+2G8LLEO/tle6vzijeW4pGHzMZ9IKya0jBRAwb1GJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644672; c=relaxed/simple;
	bh=5asFxGk9bIrytuVDelb/mNGUDArT2gXkmHC1Br6tnfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ViKaKQBkQVWEs00ml8nLYg2Q0tbg/b6ZUXaaOL6EX1xdDawRi1T9IhmAkN+RjrIqaAcEdl2VyP7Lz9AZuQDMCtBFrnzW0Z9mrLgLM7kDOsijfP3l0ePj15MAM20rNks8Q3Ao5giY8Axpd9pbf8PP5TZQH7TqBjgTKTHeKAM2NRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG5RzhYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOe9HgK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LG5RzhYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOe9HgK4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZojU1862999
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=; b=LG5RzhYhPVRz7Pne
	mYl4S71fkLKWBFVRWdCtDHIrix1H7V7/OvyRE+PJqPiLlmalW+G4T1ohZyjOUjrj
	rjyEbwzAQdr9vGeHjjE6KwhhWjgiDBlsU0F9cNWQ3AwGBCmiy2u+DrQX/P74zOFa
	0Oxo7X0srud0DDdxs3MINQemVHaGxPi0COSsg2NZvpNTTmbT7rkw+b7u44BMv4uu
	qttKP0NOXDo1RcyvL70frGpqkVIphvWIvshykSQnDxm4i62MFrnR++u/oCpfOXvR
	FDxbXJltClxpFxGGz0yqkeT2vWcJgEehLEZ6ZcG3UKCQW4LLLb+JjHn4b/3sKXHt
	kdvtzg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6av04u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:31:10 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so28050e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789644669; x=1790249469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=;
        b=DOe9HgK4NFYxqtxtv1N05pSEUzYJnU0A6aicF7GYNhya9U8BkqD4DdPc7r0Z7yKRzq
         eYPVutfzGH7mFfPzySSriqGo0/3+lLztLp/gXs5A5BBqPa2HBYeC6IsP3YoaMxg9yNfy
         8dFzSak8HAvB8VK4rNKHxxniDiws6oArhDd7p7u2HLWC2NuCmpcsE17QrVD0SZCdf+pb
         nFmFM5t+ggs5fTRm+6+tDHZMORN0DfziREwH6DVxXjoQlHXQclQ1CK1FJ5rPmxjRSfvw
         qOPqFrp8u0l8VscxszwnhcZaK6zoQSqlL2jWzZeJDOIofEG0G07ne+8UfXmFez8YlIk9
         6KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644669; x=1790249469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=;
        b=EJXixpTKL8PiuSSHnxFWDquRTet26KXB3tJCCJVcj84uQqe4dS/p0UBa2C6S9RNv4s
         4ew3wTvvPdZargzQNlCZKLlfaFGBCuxjVN7ie+Jq4Gem/xPKWoIABb4Hn3Y8u9Xnl67G
         nAmF0ZOdDwTEtBrEO1pZm+7iLYlNlCOTsyzxk8bxjggFjcnAVeL+u+W5ygGnRpawNEGK
         +PSFHrh3yJzYDdbowpa3UUKCu1ae7XuW6ZJIIswzRa0QzE/7Pok4VXf9mZdu+NL6YGkW
         80+aAAqMnFM3HdOB08OJszKS9sdNwXFGG3q4sKIMqPmAfCqUaLHGYm5PUbFlfqHI6drT
         ciCA==
X-Gm-Message-State: AFuF++lGLrpuTpJN+QrRN5WwRLgH7ueWbvwvCATYUdhs3DIonibm7xB6
	te9Dbp2FFuvkvftP2jiLUjlFPy2ju7rgDnIrZ54T6UkuV/+ACHDJrtE1KK23WiPSyu6Y/JOD1Ll
	w/JZzPtZMst4xzgI+rtlrETc7j79SR+d9gW2dPnNbHb+VNSl7NkoVcYtT5UiA00ZLHB2IWKgPSa
	qA
X-Gm-Gg: AYBFou0GULau+eff1wFsE2ljvnzVM+udxE6ueqShgzRpvvO4OFSnoY3IJyfOqjkLiOa
	pVCgwRZLkHrp2kfoZoxl/cu8PEDSFj01LWxFh+/7oKFmFWjiJDsGsUmzou+Wpkeh9Zn8mvMK8tp
	YEjl6wb9A+vVoekiR+YwP7dh47+O1NtDdHwKYsTI8ig4YQ7rmY7bif4dd4V7f726aWIYo1lVJFh
	hT3uBGS2dwLGSJJ6m2Fi68Da3iqv6hRh7LaDbDCcOAx48/2gstS7YQtb6YVZkqaXLu4/K09PrV7
	aO3MLVq2/qSCkL+q7dwIu+l/2LonLrwAnaVNC6GlLgytnDDhXJa3mmcDFFfaSMCcb7IX6qr7B4L
	6OdAy4cU+AWNxROHY1pYtaQ==
X-Received: by 2002:a05:6123:5db:20b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9af97cca4mr99433e0c.1.1789644669453;
        Thu, 17 Sep 2026 04:31:09 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:20b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9af97cca4mr99398e0c.1.1789644669018;
        Thu, 17 Sep 2026 04:31:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2b0899sm3438219a12.31.2026.09.17.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:31:08 -0700 (PDT)
Message-ID: <6b2c1fa6-5bf2-4c1c-8046-929576ddbc53@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
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
References: <20260915084901.56622-1-zstaseg@gmail.com>
 <20260915084901.56622-4-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915084901.56622-4-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7kWC7U-3sXQImgNz7xYhCqPIW87KqeaD
X-Proofpoint-ORIG-GUID: 7kWC7U-3sXQImgNz7xYhCqPIW87KqeaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MCBTYWx0ZWRfXwSqUfp6plhsS
 x36DMcxSseGW6Jyv13mSTentbMOqGYa7C7CcLHQFbDFTi3HOaQ2B28AzuFFpcF9AiQNbjtNpwDh
 H0HbJx0XyUnyQiy+3Gas+O+W7hfVcDo62mfzkmBnnG8KAF9+5RKBRaCKra+51/WgbjKjzUIOUon
 alPI4XZ2oBR9PbDp51wFB8WVxGjOV4ygWAE36ZdJZOUO/Ttrmb1KBGTDARuhXV98faDCaQZInjV
 UbqBnnxlMcWXHubqQ9kZ6N65Q9XXzbMxeXsJgE1sqItrTGuNxEVwBm+7VSF+vHHA4X7W/DPUzdQ
 F8/djXK0iFE1UeaF1mEYyD982gl3mfx9gYa+UajXSM9EI41K3qO0xBQ5iSE7OQEdNn6AMvaltN5
 Hxfu3lpUhjmpTMEyJ+YKX7M6t+yZI5VCbLZUjymsx7WpykTl0VGiiKANl1DK9sCUHkdB/Ubzg9c
 ORY+YDVXslHRR8qQgiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MCBTYWx0ZWRfX8F3RLCKmqYWv
 GuJFOc56OIf4mJOtxzNKQ+tDqPckTKIFaAHeIyFpnivyAIb49LB0AOgJEURIWZ0vKRfZO1nK68u
 518nqvG+AJIAsF0vF3NobQDkfgrpCcI=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabcf7e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=3RjLFqqlckgnW3q9yH0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170160

On 9/15/26 10:49 AM, Stanislav Zaikin wrote:
> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
> qcom_battmgr can identify the device and apply its taoyao-specific
> battery property mapping, required because its firmware shifts
> battery property IDs relative to the generic sm7325-pmic-glink
> firmware.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> index 6f8bc65bb99b..bc4dfa49ef38 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> @@ -72,7 +72,7 @@ key-volume-up {
>  	};
>  
>  	pmic-glink {
> -		compatible = "qcom,sm7325-pmic-glink",
> +		compatible = "xiaomi,taoyao-pmic-glink",
>  			     "qcom,qcm6490-pmic-glink",
>  			     "qcom,pmic-glink";

As krzk points out, this should be a standalone single compatible,
because it's neither going to work with qcm6490-pmic-glink nor with
qcom,pmic-glink

Konrad
