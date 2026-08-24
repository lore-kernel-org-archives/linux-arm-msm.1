Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2803E7179
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554171; cv=none; b=Hl8WfP19ehwPVbdX/cXP0yGB6+1spsc1kUHL51MtYc/HedQ3DLaB2utT6ahuDS7Bqrp9VHr3aqurAgIe+iI+hw7SGGbiUh+8J8DElL+y8gexWVXi6GRme6kjO9aKnKKFQhT9YpxSRCW88126ZbobyRJKNpUJXPUjJH1S/O9zLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554171; c=relaxed/simple;
	bh=MdgVsqytscDNoBcQq1T2DXmnKAy+0t/SSD8HWEOcbPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPTVUsSmhyYAEyTuUMA5rtt1AOt3KZXHaM3Wev5V7p+NwCWozgGYZu4LffHwsxMuaD8iJGIZdiP6whJj9RNTuX4xFqJBqV4AMUhDZLPT4189dsGdV4LHjGYbU6G6FeT3m9LgdRXwby+62Wz3Ls7x5Iqkbw3h/GPtRUadOpx5CB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfM1E5Xp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eugu3q0n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfM1E5Xp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eugu3q0n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGae1008312
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=; b=LfM1E5XpVDizC3qf
	MiFOZ6aQG9jGY5rDjbBb47nNlA9fwTP0/9ACGkODDLrS7TPkxuB+AgJGQCqYwgG+
	59f9d0r2EdbmirMkM4lrOgBJZP3+7lze13R1GO9xQGOCBZQrTg9YzEU68PsnedD6
	cUsEAsAp1MQCoomk6XrDy0W36xkdK/5U6YvDkdMn0azHMa8Hidktk2qOEH+sh0iw
	EaX8Ems5hYEsvpONXx1qSgla6LsYQDCJEpukDOaE1uJhpNTZaXaAauRdh4uCrj1u
	2LPlNBQuvI/xCd5MbblaiSRFgZeGWyN/GtkfmQdqh2zxNWRCV7BfXUQiElIyVqiB
	HAM/ng==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g74xhdj5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:49:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7376ea4bcccso62907137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787554167; x=1788158967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=;
        b=eugu3q0nZ6mMGBxahYfrijB+PRc9fKbCDUyte86OYQJqaYygXugh+xgoO2qvGxnRtJ
         GiIHu/ThrMXnz1olTkak6TtrYJ02O3LaND2zYhqHZewqAUYNR8mMlkLFVDd9SwshcASZ
         qPaHnCS0UJUUeqkCovAh5jI+DG5jHvtzhjXNWi6TICAn/qQXgvFPQJinkhr1D9B/Af8w
         0Z+ufA+GI2B5ChvNfcROhGRrs9TqQtJ14IBHaT27mF3D1jeEqxuw51FttVxt49/KzlC4
         M/JmRH4RC389rmKssWp//Gx+e+fpHFZabTyWu5kfy9F07rzwagC7WHtafNfxS3N9VoSk
         e5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554167; x=1788158967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dD9MZSrO17sYCLJOzYAgvl/pfHfIeh6MHwlSpI4G/Q=;
        b=DWTOWa2J9nDoLjjrEFH4mW2q5Jpt+xYkA7PuZsTpf5VF5OjM9u5E9vimuYnOGNCP3a
         MEtqdtfm47tN+kjEr8cklWkuBptl8WeIRp7Ug7kU7Ym/ZalE70nzh2JVHghU4l1tb+Xy
         Ol+ByEDf+ISAu5f5/IL9a7sRdqWy4fJJi8KfvbJ3jahEPtsd5JDo/PUrUqgImNxrSHcN
         oiVQIbEXq5aB6DlElvPirBsZt3IZx2INDty9xrQboJ8cMA6Yohf0TEODwazV9w74Hnrq
         WM4HyE7+ArFHYFxIXiUlB0RqxQ/6bUWem/9xAPhu1Wz6vyuh8/Unv8zWBINNFLx0biI8
         K27w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2uy+fXCgzjzts8T6uaBZytHwvSJGR1LNv5CciMpH5V57DY/S7YiwO3aMP4QItrGeBu49YLXGGILWIlyhc@vger.kernel.org
X-Gm-Message-State: AFuF++nseLOPxmqfC6qz2uSX4Aq11pSAU7ZlRRp88kG1oZlwdltj9l+v
	VmhmQBIVUUY54ee8Aq9rHHCXxOukR9P5OHd0UWgRK3C5niphNCn5BNI3ZQ5FF6kbXqY9BEQ3P5B
	F39B1bGXSMXQVMF/XCMvyrTQlbr28Kl7XaUcWKXjaRV5pLBr1YDPXs01Hk5HmgkNezkKv
X-Gm-Gg: AR+sD10yVSWs2mgFCGxXgXB64t/MsFLm2V3E4bDYgo34/Rsdy0xxC8+eF+4h86z6imB
	iCr9hyWITkDT733E27x5cWB0T8bpOCASXQgwquOKGiSbFIixKt8icpcb3Sc8X660apbg2FWHWxv
	RW6D0C6V9GX+7IEeURwxb/mnMc4IyxyfRJef0zxpIgF2ThGCwOHZMt1Rcie2zchPjqXXGuP4Rlp
	RHrv3e6bLNa10oCD6LRhwnRzeiAX6kUICOOaM0gC1GVcACIXCocL26dNlJ/u9YOU0gxR6Q424mw
	z7ZXCyMcdas88EN44BJXSTlk1ub36XCUd5paO/rMsL/Trc3Uu0JfBoeI8A8oqEeSigEfF0V0rQE
	PrCCi+elCV9gdYGS8ibX/+L9p
X-Received: by 2002:a05:6102:b03:b0:778:5579:c65e with SMTP id ada2fe7eead31-77a6434994amr2998277137.2.1787554166908;
        Sun, 23 Aug 2026 23:49:26 -0700 (PDT)
X-Received: by 2002:a05:6102:b03:b0:778:5579:c65e with SMTP id ada2fe7eead31-77a6434994amr2998268137.2.1787554166519;
        Sun, 23 Aug 2026 23:49:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e0126edsm7306458a12.7.2026.08.23.23.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:49:25 -0700 (PDT)
Message-ID: <f2ab67d9-e1e7-4ee2-8bdc-abf2e6b4baf3@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:49:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
To: Luca Weiss <luca.weiss@fairphone.com>, Job Noorman <job@noorman.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
 <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X3q3IjLg1nUQRaCnJB-rUieNfbvj2tVt
X-Authority-Analysis: v=2.4 cv=GdQnWwXL c=1 sm=1 tr=0 ts=6a8be977 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=2kaJ5Qa3FYFKpuAPAowA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1OCBTYWx0ZWRfX7XTP/3UKH2aP
 wfrqaCx0fbL0DyC17d4HAFUyjN99Yvs63gr4N42r3jCBczrxKvjigNMvuOBVkvtaK2wpIsXP558
 Qzu1Q+qbtJmqPuB27XtvAHJyUB4Crp5UFs0BGy+n3jBA9VRRdOUNP/4p4n/dyptgMD1l5xsxOeb
 w5FtO9RIf5O+mU3FHRYT9vmrgzGKtiB/mW9BDoxw1Mj2m1x1cDsCHX/wV9qBj0czDeu0lNsv+kB
 j7STEu3eFMQMTUVPX3JbQJ3dZIhNa0fWqLkB3apVrVMquoVrVX9ya+E0Ih8qKNZPwk12VIav5xn
 DYpBTjJsZxSlqSgohJe+UesCsU3fKMSPb8nEbA2tAwDFBpXh7hB/fqxHvw0flFCpgwtYnzPmZO1
 UgeZizkYgV59lCLC7dB5XfQg/fK0AZkeTmo3ukQW/PJxEuYKXL442+koXKZ7hQS1b/tgL8KQSHx
 KQLwBpkWYOGSZ6OQuAg==
X-Proofpoint-GUID: X3q3IjLg1nUQRaCnJB-rUieNfbvj2tVt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1OCBTYWx0ZWRfX5gSr37vzdw29
 rXtdM1jINQscdjCGzOKF0VohfTru3XzO5QtNiBII6c09Z1l89G2H6avbzg4AaJ2EmUAZLlbAbOk
 ILGqqkVPS5PsqGYvCVA88XHe2HiXn+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240058

On 8/21/26 9:12 AM, Luca Weiss wrote:
> Add a node and pinctrl for the Himax HX83112A touchscreen found on this
> phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
