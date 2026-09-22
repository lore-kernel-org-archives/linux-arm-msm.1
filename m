Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA02475D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048917; cv=none; b=jJnq+LnJ5JoJTqKxbHY/D+RENBvYU2o3Dr0h2j0i3kBqTDAmcqlLXfX/wmUNuFmTi6MPwQ+XLIqyq5mg/2HsCCXh9qHo0mR/hR8eA/V0JdsLGIIizklva37dYw5Oz6ePHRG+D5HRJQp1+uyyamB3iUDlbCA3PcdLQ6oz+AUNvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048917; c=relaxed/simple;
	bh=4hoygNQoHLisXaQr1qmPxvhAeUeG/ON878NKWttBA00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEV58A/+HAip8efrgtVB7QE5CfNwqzDTaH8C0L0NL9iPjb6/8/2YRxZSDqiXdyAPD6vyfruDT0zjkMONWXO4pJX6gI1xSyqZO72qQUOZOZf8jpYKB/ASQmbtC/0lDzhAPxDG19zjZzHcVayOepHhyo/n9K0Oqvfumcx+c8kCZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FavHGOcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSObMURD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FavHGOcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSObMURD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0Enlt3186204
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=; b=FavHGOcdsCIBriaB
	MWpiaVpt/K8VPP+ZCahQRIgvuSojAJ22bYQkEQlH/cmCc0Hfnt2yuXYBSCbqmokx
	hZrulTNAVp/XSg5JHSO3xLQZxqba2SvArKFJQIsD6oF0mhzQukB7DoMeGLSOgfB6
	LMxp2xyxRp0ZEGmIEboCYkyF/ImxgWlO4bDUFwMARsg2nZf7BcqepnQHNuR7fQmP
	20WwksFpRwb5oA3F6YLRwBUDyvVul8u6G/pMNOzGW8etvHz/+huNC+I+4u8yCYYq
	3rJXUHFpsYuUCNNTW8YMe1IEU4k7ETNRLkjmLIBYeqU2RWRF/4I4vxsPjpL4PXlG
	1gQMKA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gueybgmve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:48:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso5165810a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790048914; x=1790653714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=;
        b=dSObMURDTgBmt35PULszUx9t2f35hUBiz+2ztuUXmthcxNqxoDFsJVzpFI5D49f1Vb
         R8no8ikralaRxFgQAYm2B3dIWJWYAuimeO75fl19cHfRMuHwq01+CSU5p/JeftAdOf2Y
         J2ba5LCJJSk6b5DJOHBzFvtW3d0259BWEPvJygX90fZWhmYfd2mdBKjcRvbs+sdR+HTz
         ph3t8JDpvAerJN44PsLbpddAoGxqZul9keoUL1oVGdSc6BnTybUeTa90YZdfUtSIwpcb
         PkcfGq/O9U7vpK2wJWuGBFNJyXbPEHIQmhNobz56464p73wsBc5i6rXhDCwxpm2g325X
         1N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790048914; x=1790653714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+P4tUPyhPU3NezjUV2dp1RRkcsCE5jw+9E9ZGwbzTs=;
        b=v4BbUMKFIjDSMNAn0+z+T9TFZuEuo7Meqx/I5w4RbLmlUWuqAIPac6pSswoSI5xQjV
         cnO+5l7RSsQQg9j0r22ltdEtRgqZ2ywCTvx12BqxcI9aqfJst7HGA8IEQ4G1vvt5LOMk
         Dxi2k9Xlbf6+LuxFzQIswyvrpH6Oqu0+A9WxW2QXH83lnIYB/ZuBZBGOu7IIkSJM0z4f
         rsycjrPS6f5VTmB0mziR0/5eTMs5/M0TlsCxjm/aVXJEvRi8MGCBUo7ksRyJhW1Zl+C+
         16M+8iQhZNpWP9lV8H62pI+DtNoiLy0/MShRkAvtXBruOVj8z0bki3ohWBnztRgUH/41
         4XdA==
X-Gm-Message-State: AFuF++lWwziqxdj+MViDBlox0qzVkqq9JNkzuummatC1XVlocl53Yh07
	d7OekT+LL7PtClO7fvU+hOtV65W01d2qamYGWbw6zjqniC7w05XkFFHt+ErkJo9ySGE5Qw0vQ94
	Stx32zWBOfbHk2HBCGDWSIjPwAiNXbqRg5kkOlWnoQzOYOJcEMmGJNvECPMgdnxZfBQTe
X-Gm-Gg: AYBFou1zG5483nHmYnef9UpjoDt+4KnuGB2vojGMOnvtHtzlb31jTZ8zeGjNA4Fkrca
	CgoAuW9SIChOde0bgHDMU4CD+/Fg8sShRUZaHPNxC6OhOp6Dw6i6Wn2ywkB7gdHpBpyKuimrwj7
	9HH86mPaE/xT5GKJddq2xKqQD9OOLXLpRJSZEQqVd76wwuW9+TX68xXkX5ZOx+O4XPAPqncq6fT
	2k1dNe01qjx8D01t8FWTLRlXS8VdS9V0rcd4GDbnJgNoPby6hPad8tEsRShgR5tMIzGlv4ROdPu
	6zg/1nAuU85HpG5/C9Tohctp4zTuu2xHGUUFHTaOt/AvYQSzoLZ9RidaCKf7j0MpUZacYpP8168
	ZK1GQ5pusxSi7nG90/NdojgdcuvlVBiHAmpaedIajPXv1tINYjkXutnFhDQHnEsUiFeuxGSkl
X-Received: by 2002:a05:6300:68c1:10b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddddbdd505mr1962281637.0.1790048913604;
        Mon, 21 Sep 2026 20:48:33 -0700 (PDT)
X-Received: by 2002:a05:6300:68c1:10b0:3dd:ddbd:c5a1 with SMTP id adf61e73a8af0-3ddddbdd505mr1962260637.0.1790048913060;
        Mon, 21 Sep 2026 20:48:33 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a317d7sm157989a12.16.2026.09.21.20.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:48:32 -0700 (PDT)
Message-ID: <495a47a3-ac6d-4002-abe3-23b85b2f2034@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:48:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: qcom-hw: order driver state before registration
To: jaidevshastri@vt.edu, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
References: <20260921-mb-qcom-cpufreq-v1-1-b5943c3fce18@vt.edu>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260921-mb-qcom-cpufreq-v1-1-b5943c3fce18@vt.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bP6Ds/+Z c=1 sm=1 tr=0 ts=6ab1fa92 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=z3JUTzfoe6kKmln8kWwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YVn5Sks46epw6JQhMcsieLYOHas3lF-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MCBTYWx0ZWRfX1tDGb6OBgW2M
 5auvuuypJXkWXAkt3kfs4ivmAsF453JVzbcIS7+tjV7Ef5SMbV/TeBT19MlpG1Z340aIjtWyZd5
 Q5hZCG272dfhTH4/DioM5/9eaSe1P1rUBefXj+dQlpJj5IkaIDfFNqbbxQRAR2iYTRiFyCNSNAC
 jepIyKKDxKVes5TROEqatt5xxpJTzzV35eHOfBB+QzbZcPl2zCDnzi/b5vjrvhM+9a/1WLSEHr3
 fg5Du58+NmdFVytYD3KXGmvNWc2IKsDdrVO9GF3vdyxBu/jZqqPHuFlnumirnT/WDcbqPEAbPkr
 K7E4LC4ynHxrQWZY/6PC9LDIg3o50GBqRHWNM9YqI5XCJUqmnBBdRlWbRk/Dytr7F2FEmcVYA9K
 jyuc8Fs/Jmz72DGqcgyYw6XWIEocSbRfR2TwYY+fXkcB1h5P/8/GKq+xeglnMP0NPG0Qwzp2k1t
 kiTq1Z8lmpDouynfN/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MCBTYWx0ZWRfXyH2KVqglBkzn
 oEIAFrqcUOSCknNAlYcnlKtWF4Jk9dWZYMD6LzwrLR+ZiiOLMq54xFJBz3zGupZO+LeWZFf9wJc
 qB63y+l14tJUIW3GstoSdT01bVHEz1o=
X-Proofpoint-GUID: YVn5Sks46epw6JQhMcsieLYOHas3lF-B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220050

Hi Jaidev,

On 9/22/2026 9:11 AM, Jaidev Shastri via B4 Relay wrote:
> From: Jaidev Shastri <jaidevshastri@vt.edu>
> 
> qcom_cpufreq_hw_driver_probe() stores xo_rate, cpu_hw_rate,
> qcom_cpufreq.soc_data and the per-domain qcom_cpufreq.data[] array with
> plain stores and then calls cpufreq_register_driver(). The cpufreq core
> invokes qcom_cpufreq_hw_cpu_init() for every policy, on other CPUs, and
> that function reads all of them with plain loads.

It should be not. This all runs in the context of the same thread(no
other workqueue, kthread, or IPI), so I don't see a need for cross-CPU
memory barriers here. Even in the CPU hotplug case, the relevant path is
already serialized by locks(cpu_hotplug_lock).

> 
> Order the stores before the registration with smp_wmb() and add the
> matching smp_rmb() in qcom_cpufreq_hw_cpu_init().
> 
> Found with MBCheck, a static herd7-based memory consistency checker.
> 
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>   drivers/cpufreq/qcom-cpufreq-hw.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
> index 874ff3fb9..62cc1f403 100644
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@ -554,6 +554,8 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
>   		return ret;
>   
>   	index = args.args[0];
> +	/* Pairs with the smp_wmb() before cpufreq_register_driver() in probe. */
> +	smp_rmb();
>   	data = &qcom_cpufreq.data[index];
>   
>   	/* HW should be in enabled state to proceed */
> @@ -738,6 +740,13 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/*
> +	 * qcom_cpufreq_hw_cpu_init() runs on other CPUs through the cpufreq
> +	 * core once the driver is registered and reads xo_rate, cpu_hw_rate,
> +	 * qcom_cpufreq.soc_data and qcom_cpufreq.data[]. Order those stores
> +	 * before the registration. Pairs with the smp_rmb() in cpu_init.
> +	 */
> +	smp_wmb();
>   	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
>   	if (ret)
>   		dev_err(dev, "CPUFreq HW driver failed to register\n");
> 
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-qcom-cpufreq-42f15afbfa4f
> 
> Best regards,
> --
> Jaidev Shastri <jaidevshastri@vt.edu>
> 
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
