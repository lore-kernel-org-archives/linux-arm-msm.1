Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED43345EC0
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789313111; cv=none; b=HW1gBxUWIOspgoVtl/xpceEgqUfxkB4LDlt0ggX+LBaWu2EjufuuTclp0zrcJn1txDDaEh9Mg/LREiICy2RBv3c3Y4Qi48QUwRLOFYW0IOR95yhCAI+sd5M4ryV6PWuQK7GATodsYO3nj3Oem2s0cei3lonwi4edlO/slLq9ZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789313111; c=relaxed/simple;
	bh=ld4R1jneXBW1hGoO0VRUWX/Y4qVOEP+XupoaDss+ItI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cEyeLgftcWDF6YOnMbTiuEoke4uLJPR/YySrB0jpT9q3wQIO+2fbvmLXRf7Qb/vhOAiZCpuarrWPbpZxezn5yhdX6ZJ62MXIViGKjiqQa3ELysCP+8s/o3qELrRqvBGOY4bn19hMAobnM/cQIKmoP0drtYP9kcJ/OeYZPQwA1Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UClpXggN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfSCuwFm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UClpXggN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfSCuwFm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE040H1251573
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=; b=UClpXggNDGnUoju4
	8s7pg2DMW+aMyZIUBvoIm3xqhEDNuIZ4G7sd4CZmdYMnHd9zDSUsG5sjzuWrZDYg
	qcVEOykNpnfBaM7ZnrgJiKY4L2LJZCYnSRsf7WlQ/j0Qy1Mq+Li9c58BMLT5crGK
	p24eMVk9QrUCvPcDchUlxN5jCfOie3h0kC2kYxMJblMD7ubKLtio4iDmTlsw66xg
	cyLXq+/xwyLLBs+OnBgqkVROVXdGzl0r8tcDDDGFaQ0xLcMvAt9PNDekthiXMMql
	YhphqN8MA4xiN0Yy9MKDIVHK6ojMwvU5xHfOmCySmeQzZyAhh/cX9+QiEU3mjX0F
	jwC9Vw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbgv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:25:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc132709c76so3234481a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789313103; x=1789917903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=kfSCuwFmeAoDKRa2E6ut27zPUILuazd2eQSuCF56wpXRAas+N5VntdtbODwIkYSVCQ
         t6qhgXGPivLu50pzNGM65Ka5q4TVtCpG8a4cCiiCvW/yO/d2MTPFXT7KU4Qd+ocr6E0H
         PEI6ZRG+mRNIKRE4HwSE3wKhJVt5rvAH3fv9OkADUvuG6dR/ewdEF9bgzXYnCsQz4vIU
         mNiq4WUWxmq/NgeI5oIj8uuO2zwTYNyo8pmPb1n1fVcqJ6Bbq40zdQpdAArhX1PtYetD
         zz2v0JFSCZ/VcA8xurDuX0gYtjSeIq3bcTkPJkPWf/OIjC20LL4ymj1GIAyRV9iQ6xGM
         amQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789313103; x=1789917903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJ8vr1mNWBrNs+oy+VzKW00DnpjkO29odTofhcUnTGM=;
        b=JDSH662+NeESzoXo17odI9a3E/HdFMUkfHooIsxjxBsH0+z2gru68cIrxk8qt/JQL6
         6HyijkpOBm4upgLqoHfpf+VQRYr8RJ/BscU7x0jj/6xMmzDslkbGcSZUtPEW/fq+ZPjt
         OSM5v6qGxSsHBG4MZMeDhjwEq2zJLwso67aU3Ie279XMXvWyLGz3atj8iqZzzSHSCAFx
         sm+w0OVdFs79o/vB1xlyt/Gq+G06WNb7jcwtOPtXjP01XPeZURIZVSI1nXAU8is0O5C3
         lPxzovDKzL5dssIL5tBeOIhekrESZ8GleS001gcXbZlg2xrgpzxslwIsMNQF60H+D9hN
         muRw==
X-Forwarded-Encrypted: i=1; AKwUvBy/y4QorJrFyfqmxYsr7kEqz1cALEBLXsH06fl3BUsfCBilVLtwdtaIIOA0l5QoFz3UkSG+d1h4KxN7czVk@vger.kernel.org
X-Gm-Message-State: AFuF++mesTGKJNsOENgnYId/OWXS74JtjHunwmPL9VSV/7pnLNoIc1Kp
	YT9Wt4EJrOU8YKTHZf2XyOLSUk2j337aW5JMwGTM0QsfC7J0ebUMNmUIfUcInBBXRtLiSfDsPZk
	oxqmKcg7jStstWpRomY/9G97Vak8oV4mez8ONKbf1XvYAlr359WV8CcrS+Len46sled8J
X-Gm-Gg: AYBFou1fEKV7QrR0gGHnLrOkpc5bz8MuvwhcU0LtbLuRiWrIyrbHJMttzAuEKDDl5A5
	PGXKevPS2/4PMGdxSPYcMeKa30AcmEWtkKokWtpsViGQLTgJ2WTH8dmdclTqDZ5uQMoHyXz+CkA
	SECqqfPgWoChoCq03kDpNww0SE6GvUpC+9oKkE+KJhgx/RUNyIm28x8pHJJBAVgTQPsq9BdI6Wm
	IFsHG1j5IgwXTh+4nQPh9kRdHGexM1Pp+8R+CDC5oTinKI9hpAkRA9nZ0WEIPaD16LN/GIulOa0
	8sc3c9zWe/MFY9dfUemK3Q4CZrGq6fXUFyzvs09PkD0WJkTY07mCa2Z5+FPO0m7qbePRfL3mOEV
	sZ+h0rmHF5J4hGpw+VuSyegLinx3UTWslzEQ=
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011610637.17.1789313103240;
        Sun, 13 Sep 2026 08:25:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:113:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3daed31ac42mr27011548637.17.1789313102860;
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.232.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm19916161eec.13.2026.09.13.08.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:25:02 -0700 (PDT)
Message-ID: <9345454b-4e31-4224-980c-0066c912252b@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:54:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
 <20260803140222.GA3188037-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260803140222.GA3188037-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HiGEBld9dXYCCLohhnlM741jkj-Xn-rs
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa6c050 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ExSUBmHX20r5BGnuCy1yUw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=q4JZvQwPHRNDhfj5UpAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfX3ids8A6qbO2V
 vrKgVcpf2qP7K/6NhNdVH1WAa6HxpDrqf2fCx3ofW1w4c5ObIhCtDLWWtysnNOJe26rcKz/WMHW
 xgH4xB8r5VwBkavyvA1OzXP24f4n4lY=
X-Proofpoint-ORIG-GUID: HiGEBld9dXYCCLohhnlM741jkj-Xn-rs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIyMCBTYWx0ZWRfXz6NwgvlRRMBJ
 +tZ9KqkpzYJnJRUr3eQQgSZMx6tIPMWIjje+CY9U+AktksU+q9OCRXM7sjsFf77+nW8KYsD9LAZ
 Why+D+GUfqcj1pQUl2J2eTVs7OUtXlPZ67+L6e0pLfD46qKcsNQ9t1PdhrxxOeWXLR3ZZjiM9Vh
 BDSxxkZpuuAgVnl0csw7lx77OKySJrp6aZyQmkfq73ZnhUBAIP8UsogMSAYAOKtBjAg20hJ/ig0
 A63ns8zMX3fFjPHSqhL9oz+ZV04wFPMvdR+ExWxAn26iVCG9XQxc+/CfBr5cH56nWJTCSkW3x+U
 +WtZ9+DvRyugp0BGuYsfMN4aNWl/2zsR0QYzrYFvZcFWZ5jOB9RU5ra4nFi+SCh46Xww9ugin7a
 0K/SG0xW3xYwBZWjn2GeQ+uJgte1bUdK15Gj95IAWL27tQqKnNCRmNlRZnDVKCFukB76Sm/NG9L
 gVD61buooMNRL8dPyoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130220



On 8/3/2026 7:32 PM, Rob Herring wrote:
> On Mon, Aug 03, 2026 at 03:13:36PM +0530, Shivendra Pratap wrote:
>> Add bindings to describe vendor-specific reboot modes. Values here
>> correspond to valid parameters to vendor-specific reset types in PSCI
>> SYSTEM_RESET2 call.

[snip..]

>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              const: arm,psci-1.0
> 
> SYSTEM_RESET2 was introduced in PSCI 1.1...

just wanted to check on this.
we have a max of arm,psci-1.0 defined in compatible.
SYSTEM_RESET2 is already being used in some cases with "arm,psci-1.0".
how should this be handled here?

thanks,
Shivendra
