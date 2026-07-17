Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1311ADC83
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278231; cv=none; b=hRyZn0WopNKk+DVfCLRyDDNG5hPh16Mm3JStSnDJujSXKwY5wwPuf4cI0gvCAWmyQ42Pd8wLrbWKFy7UCRJ3Uq/JLbu6C7HX1tUoqW2VBf0gw2xjxwQxIcold+7rwzIhcDrPsgc1GxGVhAiEnwaarUn7812vlTXnlztLkJHUO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278231; c=relaxed/simple;
	bh=oKGmd9VKITYAgis71P4kQGwc4rXok/tzjeOQCJucBHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aii/NsTkhtujL2Z0KOnvuksJ91RlP9CdGE2GzMKTVGD66hhxSvpen1XMUmnBLHs6eeL6aQYKQ98e6Sxd9mNqzZ2aYX7mT18Hp9elPbiW2oCncxs3F61S2gOsD/gVt1wGyDZrH94MnYv2cGqX2Isa40/b6BFQY9dIiGkZaDCcn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meGs3FhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hme2WIWn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meGs3FhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hme2WIWn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cvtS662142
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=; b=meGs3FhDszga7BLA
	U5tmgAPuL8aaJGrRpyOVZeqV4klE4ljmPghPzo4jFAOXSjJTama2dhuDt9eGBAb4
	k1aPMWKeJADPBzT8W5OXqSVm5zoLONijScDI/Wvc8+736I89g61+FI+qPK4iFETO
	WV9AE5OT3SeSkfsKE7PwoNbTWC+JCwmNtuxpzlur/Viaq7v8ZjfI7LB5SnJ0LeZi
	3dJmmkZMo1+2WADAb1PppwOy7myfF2VY5taDjKaRgKLrDwSu5sJujLgYZAi6Jvko
	ooMJlJIi6L/LSsTjR+ML9Q/f1vSn4H9FZZ9CefUwLL67akgPdCN8PDYuTmN9lbJg
	dniOSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9kjnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:50:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so17694861cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278227; x=1784883027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=Hme2WIWnaG0MK5adiNwDGrFaimIdjptyODgsjFyMUW2qBkuakbiWMjtQEG0Gl25oJi
         aQH/snNuNOWAsoOnNUu69S11Op7wOUQnxIQXeyRrV1QeEH+XyFvpitrKnEgpuGfBYfnX
         Am8W5lXob/he0Nh/pxtR4APhtgjZqIwTCVPlDan7TSF+6vkVgdsabLHgzjPdQH9T6n/d
         93NiLmews3vQho9DK53laxqHRVgBwZ5ETAk9e6hE1PFpHzpSl34YhWmq3RWzIMiRQPzN
         6zzUQmyX0KdO0hLpdU9t0Z5U16CRcaZMiV22ACAMNyaKk0Cfon3FZNiBX0BNqtgtUtWG
         3WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278227; x=1784883027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5U3C/GjAzha7ZrtVRpecfP8NcD9XDmgMj/TS9PpZ8Q4=;
        b=bTYooJOdMp2gfqrFMXc7/CMFtzf2gXokK8BEp0A6G8P0YaRSw4rCxucMj66jFdsunh
         mxQ5Y5ixtIKxdMii+0Mz5gZ4tmrRuCi4SidISAF7lXnFWazf1jHNaoOAXMaEoNCq7BuU
         +wr7/LoUZYU2X2W/FHOZcmZcIHsJA2+epfyydNpFdpEijms4nwMKjdn3f5ktnj6l3bEO
         XH+1HKGjly/z1LnNOePIvmcafePUvecDXgLxgZReoEUnsMuUy+i6CrjqMPahouShFbCF
         GDw3yNeSBf/+1hRvL4wo39gfWdD/zQERFXEYcRZ5HU6qfa50Bwr9Kaox8lxKcFeXIkRd
         ieJw==
X-Gm-Message-State: AOJu0YyTtB2CfXHJfB9X4lr6Cclsw9gFgUQm8FhkMCbkurtbUoEnxGCl
	/dKIn6xOQUovqc+Zwn7vgC4q/dk1anA1j6qmyhYFuZlGX9pVrr1GQmi4Vg8OiQ/vRbf95JcMTCW
	87W/evViv/BauTV/dh0zBHTco5PwBDdli68ieipvuwqocohE5JpxeU4uMNdz08rad2haZ
X-Gm-Gg: AfdE7ckUB4onPikCBEMPTZV5djXIGsOP34TtagxJkqSH9n1A3XONoQbmSRkO4Wrwj1d
	v0t/yKoNL9pQS7zcp8D1aO6dO/zuDppuGOUDSWMiX3kvVSDt6rK7YQCrqGgP5D0dAPe37dIEZKW
	FlsUwPwhWIGvdooYRh5o4zYN8Cy7yV+6vJ3CWkQV7O85p2rfoY+lmehttwc2Vo2ZaDrAjwOizM9
	9UzmJF+CLvBnT7Bxz4e8vrctXuZCl5/92utM6ctgsfWXX8YaByFyC1aqOOzMronEtOo9+QA7jVl
	/2dC1VbdDh+yVER2otKdwMrJJt4Rh7TZWPlq/X7wENBJpBDh1iHHmOD/hN+6+gFurdjrva26TEZ
	5pFhWCyuB3JWhgPy4sFrIMw8V
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960431cf.10.1784278227314;
        Fri, 17 Jul 2026 01:50:27 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr7960061cf.10.1784278226882;
        Fri, 17 Jul 2026 01:50:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6eb22107sm357981a12.0.2026.07.17.01.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:50:24 -0700 (PDT)
Message-ID: <7cc35fc2-9fe7-470a-b068-8b088cf1fbe7@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
 <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59ecd4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sWIZHQe7GSxdn9xkVP8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfXxjy4/Xp2Ty3t
 JqHVnHUD7HvOZ/vF4UvQK/ZqsIbgVTPnCChyTGWrtg80H06v86Jsk7M5gh7kKWhPjHAZBFedmVP
 rd4VmUETkjCXheJ2rDcRM0KHFAMjF9a7p6V1Zh3ysmURnmdk88fVa9f86CAtABSuXg0SVCC5xeJ
 uxWszNYYcwr99Ws3OTXDDqex2YDbY8aBcRbJbWRdoRVf2vzxigWhe/p+09H+1SJEfgrM3aCcmXK
 0yR2h6B4mYOixsVmsDKc1gMVN/Uovgubxn9G9VVUHGfy/gyevCwF9YPzXYVjgN5M/k2kZ0LW1Vs
 IPw2vN8CWdUePh35n77VrCWrY5hAR8qdutKjJhSIWuwx1zzV9isVQOrsDbQ8M2kUgOZIraDlDPD
 mTUL3kb4WhgA0o6bZzFeJ7FabRpeVQR1SdPpTjKOHFCkBrIr7h4CKem1D6E8MiyXSBU4yBRNPxD
 5jmultnHsetXOLBr8UA==
X-Proofpoint-GUID: OrWALCwZfIIoc-ObOGsodUK2kEbHEwYh
X-Proofpoint-ORIG-GUID: OrWALCwZfIIoc-ObOGsodUK2kEbHEwYh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX9A0GcjzZQ/Cs
 f5RJYN59jgLPEuX5/uckDm88O/dprxt8NyUK/jFoZdhBjgQJsIKz14ZATaygAjan8JsxR6UzSJM
 SEexazTUjyceaX/V4Ph4JX/zdGJUwPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging, and various other functions on Qualcomm SoCs.
> 
> Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

