Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752562;
	b=5SLC8L/xG984qX5HaczMpagF7D7m1NTMpLFyeGvL9SBndaiU6tQZD+eeHo5oTXZsT/ti
	 U3NKDJd1GYl33UDvYZFM/vOh7MojXr4jaDXj52ZNUBcqfGoEZKLDIWOcykA3HmTeFDH8a
	 KpXPrCC5PtkWOcKrwBFTN2D8uXxj2VBRKufBM+n9nY+ViKIzBc48FR69qQKiwVPf4TcpK
	 2Imj+p94jfXvWtKIxUXM6qOkBRrn9wL56KD8Ce3s70MFgiBvTJKphVRlRerj3c1RsNjys
	 /WI5mqOdTX9vXz6W3CSVxwakhLsIqlZnMQ09yv3jc2JKLw8zMM1U2j6baGsMgTr6bHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
	b=1c5eBMf7UsdesTLspUjPe6FQWHrrlUaijU3QMQS6ibQgwhoB/pIyr6O3kPWcYTxkHNI8
	 aCal5tcVMb/8OWmUb0T6FWMiqGojKqIbI24qhlT52quwYLFPNczy13OHq2JMidNJdaK7u
	 Kfu03Ly41GNigMaWTekJ4fyUjCrKc833xXipQMDeI1owQ/6H11qUhdecPkJ7MojKnB+Hi
	 eQyQDnmnAnXkJmVHwU00yZG4lSj+cFerzhKwUgIZl0ES5WTIM6Trjv0CmzJiZypEY8eLw
	 iFIGXF6qsrNXZXq518ViRqu3fYl8/YL09bwZJbk9oSX1eZBrrzHnL3zbTB6IIm0R+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E522E606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E522E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBpHfLcZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bc10VNay
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYMK2965961
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=; b=NBpHfLcZLEzJTtxF
	l3MprFIzMvt6CSzQX73ZK7PUCrx6178LHmXAYHBQ67grkua+/C2kPaaQ2vHaPg/v
	QpUuMmdj9zOFu2AOK0z2Pw26PrXuJgOx8o53lmLgVQKSyVIZRE6h53fpmkEaukPd
	1fPyVWOzvomnoFewq2JF5z11lniSknx9DnD++5RQbhlKCIlrCQq5pLUiVS71dkOJ
	aO28pX6nPbxwsAjWm2UgCijj9xtc4VX8aK0eEOZ1sUFQUezkWN6wlQXTI+Oa4EMb
	wJEDV+SG9tbwJOwEKiiE6xN80K8ov1GB35EO9p+2Ma/owRwyiEmP7r5L2EDBQCO4
	eRvArg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0ktsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:49:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so137715285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792752560; x=1793357360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=Bc10VNayHO3vSP/nvk1Vg/3giS21EEKxaNiiz4h98NjVTjNPFcSnIn6rrl7piXPHDW
         VCDV9ITzg5zF8Lae6VXmwGePaxSYG3Pzs3sYHGRs4eHMdAl+fLhMKLONuIV9RzzBSfU0
         Uegrxv09Cz0cJvGKL0N35S4L5//VUPzH8j2StBD28Me7N1aNgA0xDYFp16UgPrDD8oug
         2jC3HInYzzHE5/k+vuP2NIQEIVyNomVR/5andRHZ70kSUuAXu8lMR6rQ3TKoPSzhX2vk
         UniMg+OiIxHbn8L+hH0MQXPIq/t0h9/ITAtUIOk39GWhWUwa6c1f6WOwbka1gDqRux2Y
         o4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792752560; x=1793357360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZ5+JvXRLfRJQ1rZwOfbvS5thaOJQ0x39UJIXgliOA=;
        b=QulGjrVWVFrrA1gB9n+VoWVStrywOv0evs0hVQdp0jH96jZOD4aT7Cw+Y3FL9KZlt8
         B8mbvtK8WoZ7RFW7zxXdTmUWkfbjdB+7oFduaNiRITeR6PPPPqKoPGeE19nnpHo92O8U
         fddOL3uF5jByiq3v9ikvGgUWwSWE6E+93oRKXYpsuyXvUrwEVL7wnAniZFpvbsCcg5PI
         aW55MWHXhAeVL+A21pAAANJ5UK+Wd3iqeagGonY50IjMZ1FySk7fpiyV0PuQxPKtFh31
         m3why5jBfops21qWaaCZoi+I8/D6++ueVI/gf5quXiXi+vkLCLeSplWxlkrqDRRqyxPs
         MFCA==
X-Forwarded-Encrypted: i=1; AKwUvBymNHd7aDLq+hOLs7NKMPUQ3IYAYsxHrikqn5iB21zks73Fxpx9LWYoMCITpPAvmkLUyPvqbcUiJABRunl+@vger.kernel.org
X-Gm-Message-State: AFq9FYJc+d1iEvIqAYylPKc10SfT2oEHxVnuYS16OYWjIQLCh5p6Yq8T
	Xe97hKCqdkRuTL7Z0feMbjxdzxL8iEEXKUuoNmntQu4En16FqyFUZc+4ImdOhm/IVq2LrnZOUdK
	3Zhs41zFPXYW8PP7QBSrgL4ltGJpHPxfGJqScx7k27PK5kRiflovORf56G1xK8wqPG1oS
X-Gm-Gg: AYBFou0pF6MJLyJj3ExfGNDq7q625t8FoV6/ToZDC3vSON/gNEQjSg4h8qzstmK/L0t
	UhAXiizAHLCOxQjT6TbdGCtZ8BmYwudHXt2+T7yrnn0pL8pDbh9n8cSqnfHsQV+wkSOqGX+ayfZ
	yQ/+aZUAJUGGGJnVP1E+r+Ejy9De2ScaVFjThKY9+/fD7gy/pu1wnvfQ0WAHzUJ6uRonGRI9jVW
	OqW3rhL2ivkr2omtrNt5PuY7/UV5EWSB2G2ZMi/yeuH6Uvt0h6MEp61scyKC5UFEz8ynHL2wFCj
	NTA+CFlWUbIDRfNSLggGjhSkjlu7wfk1rJbSmjr4Cxr9BbhgmR9Y2oQCA3LkLj3JksTOgoDFtwG
	GSa4HJyr8EhgqOx3PyRkFj3GfDbWblAprY0D0ji3YBtvMBIK6WIjl8ShVpkxilw==
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320614885a.47.1792752560123;
        Fri, 23 Oct 2026 03:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:939:de6c:cb45 with SMTP id af79cd13be357-93f6f85dfc2mr320612785a.47.1792752559716;
        Fri, 23 Oct 2026 03:49:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3802610fsm4407066f8f.14.2026.10.23.03.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:49:18 -0700 (PDT)
Message-ID: <36ea62e7-2dd4-424d-9326-1b5f270da00f@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:49:18 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
 <atsmQqSOuqp1LKw8@linaro.org>
 <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <6ebd380c-1f32-4ec6-86be-99631db4958b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pcy75GFc0EEt8Gjjh9sQeALJfYJPKvxz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfXxueenjicGQmU
 PhXhBl22FUVTPTsBbYbqoTj0EwmjN1XAYpjUYvpgQI+8OYlW+lT/RGU7V9dRNV5EeQJBXNYQwsR
 we2l73xlK4+7bBaspd+Q0l9BiRQruSwDThduGGgkPTzIbrWhV9+pmGt4aDpvvuX2ReFMVTYfM19
 7UULjp0v+KeTSHmWoQkKX6SLAigJpeQ+vBcM7YDPCjDCf43JCR4uIME89k8hSD4LvEiOegiOZJJ
 31puhZRVlQ/al11RbvZuejkY3pJDlE5vgLbb819dlOwD9sQ4gM4WmMIBMoTfGA9cvnrCCn+Yrhc
 ByoV2WykCUgHGG/X67V2BpyXDO8q+YxNE/FD5+dRD0MM9XtHLI/3h3xcadZzDN7rP7Ej9sitmz1
 AnueDa2EMqPkAILmGf8cYZzuvXAF0RNf0NKLdU5f5yJyzq0LeeBY9xels8FADKkmCq9UUtQoWqW
 WZjft1FTRq5m3HBJnJQ==
X-Proofpoint-GUID: pcy75GFc0EEt8Gjjh9sQeALJfYJPKvxz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MSBTYWx0ZWRfX7fhdpQBdk47L
 /sGJAP7XHHjQqipT5sBpFVMr0bw2grcM6G/r0JnOBb7GCDP50TUr+x+CefGkb+6E/UF7ZkBDW/b
 Be/3H9X3aucaSkJ06J549Oy4ONY4108=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb3bb0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=agzqCfvS8LjcRQY4D-sA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230041

On 10/23/26 12:47, Konrad Dybcio wrote:
> On 10/23/26 11:17 AM, Stephan Gerhold wrote:
>> On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
>>> The ThinkPad T14s needs thermal mitigation under sustained workloads to
>>> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
>>> monitoring is not yet supported, so use the board temperature sensors
>>> exposed through the PMK8550 VADC to provide mitigation now.
> 
> [...]
> 
>>> +		/* Sensor near the CPU PMICs. */
>>> +		cpu-pmic-thermal {
>>
>> I'm a bit confused by the node order here. It's not ordered by the
>> thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
>> ordered alphabetically either. Or is it still the old order from the
>> previous revision?
>>
>> I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
>> order would be our typical rule.
> 
> Thermistor index is what I'd prefer to go by, I think it makes the
> mostsense

why ?

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> thanks!
> 
> Konrad

