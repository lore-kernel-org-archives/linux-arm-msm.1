Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770986;
	b=2fDRjE1N1vXrk3F6VvB7vinWv7O7tCuqN/YiQfv/BmqLIazrnWU0pgzuxgd6zZRgVUnL
	 AToaLtORlmNeLJ4RKNTq/xmTHHSSAjxnm6qerKNpT8lkCNamfdPvKHjqkh168zUHbsaQq
	 LUha/wJ/dXox/N4zblGZFO8ZZpQAzanXiU5AJE3UUtsQLEbbVrv4n0sgVm0E5DNkxIAnV
	 gbckngbprnysPDVvbGAmGPVBJ1XZpykH/TCtEHdWgIAcrLhJ6BteXZi26W9OXWquiNZZ1
	 K+UxfRPpevlzCgfU0Ad1og+z6iiOhvJv2mXvRftj2BfTDSuzySBlrAx0LwS/UJ3HnVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770986;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
	b=BJUce3o1h+sSXxxXPyxqUW+xc7enFdqy+X2FM0o+1yARUEvpp8YTg7QOG6NmCH2mDxMI
	 Vix6ia5YEth1hBV/7lPY0GxwV1FxLAa1tKBZICV4vsbNSM2yT/Sb8rmLsY0iwroyuiCn8
	 Wt7bNxOkoIC5Ui/3C5fG/empGKDqpdTO2Jzciq+75nR6lm0pW2x9YuFw4fzWqc/ms1dDV
	 E0OyA2JRWd6NSF+AeLVXcBFNr6HLmm0prwhQO1nCrFZFLfvszmzOYibGc/SOhy8DIYLrf
	 4J/HjhaPGMyxm7fJ4XTBlK9IjvWtPEfieNHeNniySC5DyiajjA7TqPU/XXIy5gKxBbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h7a/XazE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0G9n9y1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0BA606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E0BA606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h7a/XazE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0G9n9y1
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Hu5q3118076
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=; b=h7a/XazE8FBb/WvA
	r64lseyDJH4D0lvjddy9criGTAeCYGSLTQ1WRdXiwTrF5gHCks9C78apUYIfzEYI
	NvrNAtNOmHrSjjk4Lba4Ch6TLI7ejt3ojPT0VMTOMQs5KmrH1ZMljmd/eYAFj4h+
	53QZ0j1aObEa2LX+HY4kul5TlGhGlBVpIFe2ubsuJjyICCoqtvk15TrciJOwdzdR
	SJYDeWZMPqkipA65SjHB5bx9FFSoiAtDrJ+/2eSn9GwJSmN9wWZxLKCkF5NQACfv
	T+kfAAdnprT3N6Ds3v8KikW4ZRSGWoK6orS9IpNjwmNcGAuqTrNXp1ttw9AETekK
	EWyPCg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8vne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:16:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso361120e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770983; x=1796375783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
        b=b0G9n9y16S4voYKJv/uzktEeyyCupLwFwg5SfcPI/RIHqBXvEJlkToP6Ud6FMAdlhl
         rf58YOdmS3imahF00HkKr3FPkqXYvhElHWkNgUIn/gJMEnOzan5LhgMgpc9eWGGvVDeR
         3/X6UPI//UobCTUEMzobMdaizh4+TDm33U+tYMe5FLoUnGU82COZ1yFZcvPjgwHXF3bA
         x+kI9RqMxla8E+W72pdasAgh+Ma4SJR4MjGZN3w+tBl9Y8yD+M4xHWtVv0nrmG3dXu6Z
         zOEZ4yyeagZ9n4zH2Kv2Ik3DVqJ929sXB3+sjiW991b3S5g4or2egNvoobDIqjo5tVwt
         g4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770983; x=1796375783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
        b=MHAsTXS++KUd4dEApDveZ+Fu2oMWH6p1G9QMQR+cSTxxFWY41eRA4TdkVaLb9PyISW
         ap2krdWqCpFtdOAxK/j+Pb4BMQOviBWyAF78JkMzOiZ22I2Wmom1eTcNko/gSeU63PEG
         iGLcC0BR7wSgYb8aLRJYCEJBGepr7T5wFSK/BIjF+ttyfenWnHiSuG/rEUJii5eaXDN2
         YvsD5tUhyQYEMHcQsVMKVW6ZSAWR8/aijjbpVXOlaKIKwvd3dGOwdx500xTxtDiUF8T6
         Z5lo+hwujk+jL+3kqbH/Ygm9esrJPKjGjrVmWvyDHz0oMIhaSIFxBZEteuq1zk37yCjI
         8HcA==
X-Gm-Message-State: APuU4Z9faxO0GYaIm73s+tzN9GjiLRtoBm0bThaU//LeVjKKKtITbRkv
	zbNsrylp2Uj6LA/vOSmP0ZF1t7qeAzrx80SBicqsMIYrDboUUgF1WulYP7NB5HpCWHz4maLFhn0
	i2bujqplHN1+rWvnyhfa4GUaD3Zg1ckzSdACpwj0lBzh86GYcQFLbLdRDRalH6kSRFmsY
X-Gm-Gg: AZFdTZd7C7tEclydBFyCVsffjb6GegSyzQ0xaEkHWP2yTOGmP53gAn5sIMpE6Ja1JJB
	pL0QFH/ij9c857CdsCy1LjdL6VvLkbSwosbNL4x305RAXZKtjXgnPygna/8MEyi5boDpUxE9pdF
	YCxXV8SuC+l0vd1WigTf3f6wHDe5Jgj3JXHcUpKjv4nYXEP3axDcUeDE3643Y61OSCn/am4osM7
	8/mAbtbXGfAaGoa7OkmH0no8hLQC96yaw66fyodVWazlEa29AvhPYm3HU92AThNBlNEN1YvIHUx
	siDxfT+fP+gaKecaVUSjIptIO9fvzpM32E/OAtsfABg2xHVBdslrnC9r8Gsln3UmTd1A0kgN+lC
	DwSN//xU2QEvppueQNur6qar7Irjex1f0/FBL12MOE+daN/QVh8qRULE7nH1MOATG3gWBZ44=
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr17415365e0c.2.1795770982676;
        Fri, 27 Nov 2026 01:16:22 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr17415338e0c.2.1795770982220;
        Fri, 27 Nov 2026 01:16:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3852235a12.2.2026.11.27.01.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:20 -0800 (PST)
Message-ID: <483774ef-1125-44dc-8712-73c0850386f1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:16:18 +0100
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Netrani RPMh interconnect
 support
To: SignKirigami <prcups@krgm.moe>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-interconnect-v2-v3-0-1136e2cc6e3e@krgm.moe>
 <20261125-netrani-interconnect-v2-v3-2-1136e2cc6e3e@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-interconnect-v2-v3-2-1136e2cc6e3e@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfXy/7LZxIyD/g4
 fR74M0TrPats3dRg/vTWqKMvqq2qo9OLSmtAoYSFc9TOLjemjQHXPl23aBmTELoiqLQOJhMiDbB
 173yP9QO+kqnuQDwGv5xnbSXD7EAdzDOiH7JDdblJ8r0NJJfkEO0TtrFMZSU3oVocfH9QGI2HXj
 6PKyCeCOG6kkFswh8aS+HxM5nzXtWzph2YAPfR2/f1eX1UfRgLWi2wulFoVyvv5xrFzaaKTcoHR
 JseCVqEcHORA1cVUTNGIsk1kTR+0DJ8FwVohjd4ogRvBHTP2dGoajfLZdDKK/oaGBa66gmTUUDB
 CcvxvLB57ZTJAtPJUBDs1y0RjdhHPwD1H684ern+PfY3r1TektVMwH17Mm7mSLY/nLQyzNRbGO/
 tPhV4jjDo+jQjwuoI9emTPDfeqrPR9H4Mgb6f97RhoC6DqkyfSiPlY+lmEKrJyWoLJXB04cv2AH
 anZQCA3+RUjsoBZjNxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfXy9yLhiMMas++
 xMY4QEj3FyCmJZabO6GI1bMcIpoO8++gVKDOmwgDKDCzYeTQ5T0uO6ZkCBrZiCENci48pxzM0wD
 BlHuiXGukfaYReyJjXK/2yWAsaV5mJo=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b094a68 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HlFBRxzNr9Pio0NObxYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: rBLaxc1du9RHlGoMoWaWAOqtbirRdKxw
X-Proofpoint-ORIG-GUID: rBLaxc1du9RHlGoMoWaWAOqtbirRdKxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270036

On 11/25/26 4:45 PM, SignKirigami wrote:
> Add a driver for the twelve Netrani RPMh interconnect providers
> described by the previous binding patch. The provider tables define
> the bus topology and BCM mappings used to send aggregate bandwidth
> votes through the applications RSC.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

[...]

> +static struct qcom_icc_node qhm_qspi;
> +static struct qcom_icc_node qhm_qup0;
> +static struct qcom_icc_node qnm_a1noc_cfg;
> +static struct qcom_icc_node xm_sdc1;
> +static struct qcom_icc_node xm_ufs_mem;
> +static struct qcom_icc_node xm_usb3_0;
> +static struct qcom_icc_node qhm_qdss_bam;
> +static struct qcom_icc_node qhm_qup1;
> +static struct qcom_icc_node qnm_a2noc_cfg;

You don't need these forward-declarations, check newer files in
this directory.

[...]

> +static struct qcom_icc_bcm * const lpass_ag_noc_bcms[] = {
> +};

Please drop the empty BCM lists

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,netrani-aggre1-noc",
> +	  .data = &netrani_aggre1_noc },

And unroll these lines 

You're also missing QoS settings, please add that (along with their
clock dependencies + please make sure the platform boots succesfully
with clk_ignore_unused)

Konrad
