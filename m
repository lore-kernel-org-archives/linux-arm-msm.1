Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022063B2D0F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785389704; cv=none; b=jmn3D12f4/tS2M3GJYQjGLiJAWA4vZHcWTc4Q2luG+4y2tWtxpfMNZJ9kfhg6UvjEbTTt6pcs4A9z57hya3iGs0bOXRJG38VKN01BqpidtfsJDAXYiHf3WGftDDX6zpm5HXZUvPuYZhhKC28hICY/j4chkcsr3r/3b7YlONOj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785389704; c=relaxed/simple;
	bh=Ms4Nfskcnhq/wm03qAo2m5NydjTBb5cn4qE/+3+mS3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXZHNwmuiwCD5sIC0YI2akzMK2AFJtaSh+I8fcrskdSM4cJcejTSuGWCg44raEOHxvWXeULdpg42HXLdjl6JUn0Xx7wA2VVwwUcdkhgKGqsPGzI0ZGPqxMVDebBmfB3X3V85qICpmsjIF2VFpLJdoODsMFf7HJ6ht/NWuFmzJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzizE/rh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkyB35T6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzizE/rh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkyB35T6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4vZ1W043065
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=; b=hzizE/rh/XEp9dlS
	Azy0hiB6Zwl0iRJeAjCz8wPoNhni9YxFyn1n1baTZ9dydxl9easl9g3uEw4asx0/
	nYbG1ryH0NL4egFs64R7Y97IfFs4HkJTJsgAwi0Ol4zZGG8jhvSdIaauRM14ztbR
	knqqmX9I7pjFvZ6LWIl7B4bNzVwDmXXqs2F5Sq4MtV49/oFj5+qmCAr/EoU2jSRU
	WVVozHDopj4fes116hliJIXxsUUtIG43ISqsAq6kTGv7yr2fvOL/Xia0xDxihHYI
	SGBBw7biqX3FU5G6Xu6hx/O5z5PtYiWDjHs18yCoV2TxEAI/lgp/aV0CIY4t/vo/
	N8LdeQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr01y84mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:35:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84877b362f6so3127178b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 22:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785389700; x=1785994500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=DkyB35T6K70ChGbLkZuI9kLCgnbn8i44VaLhL4lGPvqxaQNTdDow02H5U38PdaaA2+
         zFntSszbEhuTQZ3B8WFIV6ECF1h6UBHEisUxrUUa70Rth5djOKmQ+aKQLWngBCl4WqnC
         74AfptiZZmmK3KKiV7RQHi+obwSAurXqkCFfNtXkePdKKsbHXn2zpdG+NuXuMI1YS1eD
         mjRNh/hgak14poKiID1X3toSNyJAOYXdULZX4TTCNFBujQT4iJsa8H/nL9fo5k1o64PW
         sIMqVRV0TVfhI8pbQq2tX+fGux1RtX6yT95S2v4cAmPyH7BGJwwz8DsOtqsOtq+DW1GG
         neow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785389700; x=1785994500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdwTUq0WBR1EyoXM/rm8sZcwzV71AIDBSxmFVUpT0Tw=;
        b=aDMjy91ZZFS7V/thm80vb5/X8xzh08sd/G6AY//E+WUR3BFd3oCoC+1kr/1vCaoIQN
         jFUXyNVZdFZRGHfxJN2Xx4V6qDzyP2wKMV5w5o13KXK4MzflX6+jGKVYQrzoNLRDSXPt
         xbqdjVS4xNT4SI4UW/oUH0n6IbB1G70/16K7wyJF659zxatyOmD99ZrzNH6vvA/XXESP
         uw5JnmNI0u0tW2EoY4Kx3HGNQCWZFADWKNB42iE4+uamAtIjaD69gkLya/CNXp+FrgCc
         /ggA4gS8skhY7IWDx4dHliNvbgtbKfe3uRf9RFt/Vl/L4oODjONI2tC8NvaaKXlhnLiI
         jYtQ==
X-Gm-Message-State: AOJu0YzCjNqXC0Qj8443+TrhRoFsAmrprkxswQan4DgBvuONcX22n1I5
	+7KeHaaZzReTKKWi39wax+bElR+z15YdZEmYSYnXjzqDJeEs31M8PIrO22hP9ji6tOQT7pMM0a8
	hWP00G9oVDY1Kbj399ecV/2YNEtoYPctgRNYETPSZtFz+y9XjsWQy76IluuJ2OS41Y3Nr
X-Gm-Gg: AR+sD13YCbBJygOZQ89bXF12USXTd5W7zThOtHilAjHak05PPDW5MTUcL8zX7C1k2U2
	1vG+rd1krlpLnGabFbjBdpCxesAZIe2WfvmAK4rkuxGuSCUWbwsnq4YDN1w1EAI/kzrIFaWwLnt
	EuRcDEcQ2MI/sI/Vcr8G6AHIvHPpa86t+oS8gcP3BZk0fDbQWTNdbc98Mn2fiSk9LKd0YNMfuyk
	aTpFvtEgOOO1zBffl58A2rESygWnVhgnFveMl0nz8jb0gtc0QcdLnKkGo0Jvoi6KZRQ4Pnoo+yx
	NrtBmmH0nv9wGmroY/YODpvmowc9tSpUqYNhWyFapl23Be8r1lYXswNLBJSnkHdj/HGI7bxY+7/
	tHvQYBt9rqDDQ8faeV/msedvhbalHng==
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338792b3a.35.1785389699843;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c84:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84ebc3cf6d6mr1338773b3a.35.1785389699398;
        Wed, 29 Jul 2026 22:34:59 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm2342241b3a.31.2026.07.29.22.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 22:34:58 -0700 (PDT)
Message-ID: <02b51d6d-0b65-4723-b1b5-307726c76fa7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:04:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API
 devices
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
 <qTmyhh5ukxu4BQAZXvNyyUvZxucwjv6bNoe2v30cfjsdhuzg3ud5DZzGmSBlYICc_POjXS2sSvhbRop0i67mxg==@protonmail.internalid>
 <8210513c-288b-4d02-9688-1de10e40d9f9@oss.qualcomm.com>
 <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <25ef6b91-62b4-4e8e-bc8f-8400dc293273@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ue3N1fEn0HfU2WnNJ3SU_tPHkoD7i4-9
X-Authority-Analysis: v=2.4 cv=WPdPmHsR c=1 sm=1 tr=0 ts=6a6ae284 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=U0KInS6uA2ESEJLtUTIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Ue3N1fEn0HfU2WnNJ3SU_tPHkoD7i4-9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX3ZOUOvNw6HhY
 W6F1+sKtMyX824LM2mpqrB9H4DmrOrbkKnQH4XjQb9Lbm+yNlx2unBaewSO+mewi4ij04oDmDCv
 M2iaVRR717hPHsYxQnKQEraq+n9ATa+SgeYVXTLkCBMhKTUPo9wlnokOXPCcyB0pSpNXGBK4UUV
 UUp7gziAlVeUMsmYeYgTWT62nLU3PCh5Un1Wx+0VGop51gMypSbOmVn4yUq99oXy/RpruDQaLHx
 tfBw4pxLuayAsO2pS0Ms5kQOFrAAN+RkAusD2ysMbRzDMBDvBlzACoekodERaFmuFLIUs6u7cbg
 YW/c57UxQ/q2Z6/XVnjtUP2VYGd1gNALhzkGliH3S5KqAHyr+I5DWGP4MoQ+x4QA3uHUugxhvcR
 1tEbN7LC2nkrvf0TsRH1fiwP/WmvK5FMZcSbEvz0mPkFvszBFcLWQ9LsOjFMMEsFeMqEICcpZ5P
 4GE9tpnMrVmkLpzb4Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzNiBTYWx0ZWRfX9ANum/jesUPb
 hCQlzebN+nop+12f1utLn5C4PJGHkLfiPMEL1xatalqb1XdRjRX9+KUGrfYnABELiwFx64G7KjX
 QC4QWbNqeTGDJ80jY3TlecB0A9mJlr0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300036



On 30-07-2026 02:01, Bryan O'Donoghue wrote:
> So I don't think this model is in-keep with established DT practices - if a driver needs to parse a property it needs to have that property in the device node it handles.
> 
> So with data-lanes per existing camss bindings in the IFE/CSID node everything though should work as-is for you.
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/tree/arm64-laptops-v7.2-rc2-camss-v11?ref_type=heads
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/blob/arm64-laptops-v7.2-rc2-camss-v11/arch/arm64/boot/dts/qcom/x1-crd.dtsi?ref_type=heads#L947
> 
> &camss {
>     status = "okay";
Thanks for the quick response, Bryan.

Confirmed working.
Root cause: I had data-lanes only in csiphy4_in_ep, not in camss_csiphy4_inep.
CAMSS parses its own endpoint — with no data-lanes, lanes_used=0, vep.bus_type
stayed UNKNOWN, bus_type check hard-failed with -EINVAL. That's what led to my patch.

Dropping it; fwnode_device_is_available() fix going via your patch as Co-developed-by.

Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur-CRD and Monaco EVK

---
Regards,
Nihal Kumar Gupta
