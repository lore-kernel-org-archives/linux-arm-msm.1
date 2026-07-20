Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757035B631
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784521237; cv=none; b=sDpHJDudX0Pn5P7xTaSsgIHVR5JtmNYAgqgnwgghMG4ZXByCsUWrqIjR+8lQVfHSxVE+pbc0sKgWnGJrn6pi2QcdStrS4ggsIer5JcznWh+KXLXEiuPBl+vNoifVKJis8xbhc0xj88+zCV/ajpdzB4pN0V0MieI9fF441pH+Vyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784521237; c=relaxed/simple;
	bh=E4JHbghLLembw2CZb8ehSnFDHUhSgViIfXEj7mbvCgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCMvbVVpcse1vOEZaZU8VcwdKsbNUVE2T/e0K0UYkL9RNTFxdNeqjCKCDYkcHGc3nyGwAoNCJNQWCpBYpmus3g2vM+p2S5vk/eJoec+mFBUWGBEO7vMYYHezQs5HS23SpuDKG7rTOHWUJqXUNWgFxCaGBOqx83KMBjiXBfVx5dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DV2sj50M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkUfqx8S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DV2sj50M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkUfqx8S"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsStT408365
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RolAIABIrjyeU8IO7LwXCMI5
	qSMBP9towxnHjWGWVr4=; b=DV2sj50M6CbjX5AiK1zlBa/ceRAgJALFxh4efaug
	uFysC1JWUhHILHGTcIw8ZNuVGble8atrLL/dVZoeKdGhDlSoQ7fjpNXGc6e6A1QS
	9heKErjzjfT1+IHM6+zVMg9RObw0trmTqLt7sPxesvWifvKTdj1uiKe17wl9wGEt
	XTC5fTwbOJ00qkbLvsifIxHOwyGdBedo0z6A7IiiPifbnjKHZgxnX5fuz7YzcWrD
	yQLbEr88O/gzOq6vUTVYOm9Z8jYaF2XbWdCLXrrEzoFZPO3hDr+Z0mfH6omz+WkY
	h8DZfFmL0ZdCEFDkWZXOSS2ydJj23XdxumiDsGK16ng/zQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhm8r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:20:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811ae55313so5735469a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 21:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784521234; x=1785126034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RolAIABIrjyeU8IO7LwXCMI5qSMBP9towxnHjWGWVr4=;
        b=XkUfqx8SKOkWcOxKSJd4vUVvolVfUvuHPprBNi2ruXFzfbrNVeJcOf3kyldLKSkdiP
         87xpzd4gVaF4x3G5Q7PO4i/hXKU6th4r91br9Zb+d28cWPYOy85VgBgvd9s7DzRyiGU2
         5B23yv5DQwFOz4+UglkhrYNRkioN4gAvx6cLfwl2VwgkhLuk1yFj6wWMfEpjeugwsH8O
         NHplJDAP6MqSeLq3+/tLCZ33oHdjF3cZcuEYdaxGsqBgPwdz2el9kyVDHLq8osRoKDli
         TFTJ1g+ysK2KPaTkBkAFdeCsH6K+e2bG19sBfMrQzZiPWgbRXfrBgydCzpu7r2gxpTtL
         KQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784521234; x=1785126034;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RolAIABIrjyeU8IO7LwXCMI5qSMBP9towxnHjWGWVr4=;
        b=aIp7KGZIOt8jmNgIG/NPccffMUER+CQZxQQXbeShwZPEMqYExXBTFQ2uQxatjCpuCb
         NoyryESTKpB8BqpuPXKSAuxQK4cplTQ65n5SZtfsOJFrjrYw/f/kTuwS2ELZUG4ggExP
         HCWqIQublN8RHHCH0eRAEhYThz0SrjfSVFu6zSfBMRdkc0HXjsmeQE0+shp92f70fWX+
         JiH2u0zBuXK3MZawc00YWKNgfYDaHD9QT+6gpuZ6W8yao+VCzQbC/OVD2hOJON9b5LJ2
         jOVLqPu1Dz/RvjVANb7x0Jt0mwSgbbvE++KXNJB//K3Iuz262b2XhyyW2MGXg65LpeH8
         +Rzg==
X-Forwarded-Encrypted: i=1; AHgh+RqLwW2A6tgp6VK3kKwk+sU7zCdI3IK3gl0DniLsN6KKcLgCu3wd+OUtLW/ex/f8o2gpiJlxZg3NfpzLZh8G@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyb2Fry31tX7GEoN7nmdEPhzeLUY8cp3hSwg/aw09MPAPGX9wB
	4xFW6IO89bCoOdkOhNmog4KOk0Njzw5n3S1GPBGJeAXTmc4ulVZ5NlBtnSPc3HeFjB5GkEMzvm0
	MMoIiC2LB4zXMS4sHWtyd6HLO6sgoiO4A3bI2QeCPVKu+f9/PgY1pnV7PKrbce9ZZiZM7
X-Gm-Gg: AfdE7cl2F+PE4G716b2FocBZCsTYeQBUd5HNvmsCTgzNum6t1PCdQH1SqnZEW6Rm+VF
	LAXW9IYul6PV7D62TVbchfYyrhyi2rq/riME9C6Z9USOGpDtCFQyVhe0/8Ix1ul7uv62F0JMk+d
	mxtNYEBwCFSU9WIKKRMAbc2qP3a9WT5RzPyDkzCqVBBw20z5mtoh3ya4098J93Ti+qns5MK2Joo
	zSR3IgFwaoEkwgSyPAuwWeb/VLoJQE5brx9McRPOVC45FiGu6T+DKFFnbrwbxAIG6tLu/fOAwpD
	0osEWXOigbToi3/VPSSodEPo3MRcLP6nL4y4dhtmnFPW9h7OUj3Drx9UNtX8nDAZ6s3NdHQX/Lc
	HDdUsA+G4Dz7BEATfMZi6NqBQO/XHlZKj7ZESvv7X5aM=
X-Received: by 2002:a17:90b:4cc3:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38e4b43ce07mr13525054a91.17.1784521234296;
        Sun, 19 Jul 2026 21:20:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc3:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-38e4b43ce07mr13525025a91.17.1784521233811;
        Sun, 19 Jul 2026 21:20:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm27488878c88.1.2026.07.19.21.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 21:20:33 -0700 (PDT)
Date: Mon, 20 Jul 2026 12:20:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Message-ID: <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5da212 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fVJQK2QLqq40QL6N-J4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ykCpFSxcowp-BxsN-Lglf9H1SczJtvyd
X-Proofpoint-ORIG-GUID: ykCpFSxcowp-BxsN-Lglf9H1SczJtvyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA0NCBTYWx0ZWRfXy8QWqNerjl3i
 3ryNH/Y+DWX4ROwIwO95pr7rMq2G0tXeW4PIUkqLxVjOQ5IJhWvm0s5FmY/yendVuPmIhKSgpjn
 aOyk+OKVWyZSw6/JvbvC2+ju0AQkVIn2wbeVEWxTfJ9qEdfmWFMpShQJ63wGsTAjcC9VmcQt+ee
 gL2XDRsGmpKemSJNBdhWObFJNwYuZNqpEZa4hndlUT9ISXdTsKuibeFJ8l1SOzQxE/EgU5XxQ2M
 byIWnq5/4aalVGAHmoemyR1uPqCyOWwYEfZpXPR2T/m4kdpdEI8HHwbd4pRqJbvawSLgVKgmg0C
 NXtrzDjhJzqhw8BeQ0Ssqv2eeOyRWbEMIvGSF/ruBjJ/wGXalm/Ww0ZywSoDlzDyHiQLSP/Y7Gq
 KVaVGypSf9c0i7n+68If4dfYNCbvEhd60zH8pvCz4Fv8yQICPi24CdsEMvwrIFd7CWYShls45C8
 PV2VNdLiUG773nqVqjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA0NCBTYWx0ZWRfXxTQNLF4c9oLw
 RXcDxklx/xtL89HZ73Mlgs73bPsqkg+i3UMF15SiDGp8Eon0BdqXSI/5vrqCEcW5V0msgms10j4
 g4keOnlHswDngZfiMCuejVekCDvJ9B8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200044

On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
> On 7/16/26 4:26 PM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add initial device tree for the Qualcomm SA8797P Ride reference board,
> > which is built on Nord GearVM variant.
> > 
> >  - Configure UART15 as the primary console and UART4 as the secondary
> >    serial port
> >  - Enable UFS storage support
> >  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
> >    all sourced from SCMI sensor protocol on channel 23
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&scmi3 {
> > +	status = "okay";
> > +};
> > +
> > +&scmi11 {
> > +	status = "okay";
> > +};
> > +
> > +&scmi15 {
> > +	status = "okay";
> > +};
> > +
> > +&scmi23 {
> > +	status = "okay";
> > +};
> 
> Why only these ones? Can all of the SCMI servers be enabled?

These are the ones that have actual/enabled client/consumer devices,
e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.

We can enable all the SCMI servers, but I'm afraid that cause kernel
to map shared memory and issue SMC calls to discover protocols (like
power domains, DVFS, resets) that have no consumers, which might waste
a small amount of memory and boot time.

scmi15 currently doesn't have any enabled consumers, so I will drop it
for now.

Shawn
