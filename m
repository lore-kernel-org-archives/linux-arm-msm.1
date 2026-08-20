Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3E3C10A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221793; cv=none; b=P9XXEQ9wbsAobTXxOvx01a8BQrnnl6LFAZElvUcUvOblJ36WHfc4SJXTWxF/do71iolt8tHRaDjRIq6omYlOpk+Bn5VP3QoW++KTNfAU1r7NPs1kwtrcbjGIwpRA1931Slwhjq0WBaujDQsQmRc8TW/env/QB7VcOEYEg6Xyl24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221793; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNcKNkZ4i2bLlF+zAuBSr1XysooWYo1uyZRiH5G3To79Xb6JhMtZtsHesmG5F9di06Lrj/76SNxCQE6L4VKI7IpoQwgRTxK5OeU+uuyEzsFmfMFC6L2GKd01F4ucwUWCJBEC/j5A1ZH43FEOq6WOSoX5GIvaq5ruY3dSl6vYTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=COFh6Nnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7rcStHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="COFh6Nnb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7rcStHh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2s4H3132160
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=COFh6NnbWh6jiKyq
	9XkZe5ek01WJnmnkvb795+Z7wSHV7fBpf040OYxpE2fMxyK0faGXoXaTUGaTDS89
	Sdd23s7gYP0KqZXaCLfL7CkyC9ioPyqVwmeLwW1cpXpDtHijXodkFyl8yuk6TujK
	Wi41WicRKJ96UBk6fYLzOv0pwjpS8KdDjADpE7xWYFdhTG9mbUVZ6bbXn82EIArI
	C2f2UHR8CCwCGEJNNlE30Jac29/gXVpzK2AmRUMMFKa3xS961QYF9wBUNteg1baL
	M6HKhqR/Nn9Q78lMu1ychc+NTT5QgJE0tCo0n3yjsndoNv3d9Kn5qF1w0Iw9jhkQ
	lOqFAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg183mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:29:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so897441cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221790; x=1787826590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=L7rcStHhzzhS28OpyfVYus7NHonFKDu68JvkRk7Dp3qvjjyPs5usgdg4WIpXfzdtOH
         w35VaVP3a9F7+aP3xQsTYCiglSBQNC56G5DeKfboLQIzfU4OonOXjn0e0z8406LCTP5K
         ckrzzGfOyL7JieRMtOn1rXd8qEsSgU8KRcwXFJH233h4VKdXODVSw8jZ/jCwYT0mu1YJ
         2vtUDPwhdtaO78DTyO5J8rdipIL49rmZv0aLDD9f9s7bOltwC/fOo4WZeEQ1wyVavjoX
         Yu/L5hJGziIJOl9rIjGPCnxGMeK7wAreNOOfGPYKDppgx9SvzXlXiUsEH5tnUALIElC9
         dHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221790; x=1787826590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=OM4qc6iSdbLOTwdRstgJn7rZy8HlMjVNNmkMpDjJNKxguenGJMuLFt49iSoATYDwt2
         jem4ZXph9IzDA65S7YrBD/htcl0AxGKe5eFDkZAxkjwYjVud/JsxtQlSBGUOzySIEi69
         c85XIDVUmPwPg1t7w+8xEj23JnjAzpRqsN2qecN/lDBjEZFz7esT9y+i3HSNE5WkVw0F
         CgVbufwsKrPdrxwhcr51XwC40J5ZconsmclRzro7jSNlM9PuUlWRQ5q42c/mIimJjij7
         +jjBn8sQUMLv/MujFyzahJqxmhD/36FwrCdS+zeY8J7sxr0+E1gOW7s/wafoNCn2vYzJ
         sNcg==
X-Gm-Message-State: AOJu0Yx2N65STSz6ZQpG55CT5UM65GsMKpxo208Nb147TWXMc0EtQRMQ
	HDGbjtbWNlHJsvHqNxQLKl9Q4+6YN3kBCw+D2WJwBCbhpQH9Eud1IM27D602AvMslvuMLVV5iDM
	MnGBMMCQy+uTDGndtSD80VuzT2t3qB3+NOwzrbyeSJLohPlIYQlAiDqgTQs8c61OiNOb8
X-Gm-Gg: AR+sD10ITad8gAwe+B+dwfj3sa/ge4A7mEy8X9pjg/5rU44hGr75cJmmpAEfNIG/euO
	dBZxrvN5N6LjhZDsxxOqX3KAbLHh1sTVFxkgsrp+QRrth1vwShXiPUS2wuM9cKVOvPETqT44Ua/
	NGRtvjm8kqWs1WpsjXbUVMhJr49EJEcRN0un1PPmxAkP1Fh79cev1s0L6aiBpncMj0i9OADiQ6f
	B3y6lzGCspc1Pkt9UkifhKpBkS2PhCHIwXv2ShHbTEIKXwNoA1nFbYx61jVD4FeFdV4UaPonS1L
	ubY5aFU9GOuFQGWJJbSD0b7KjT1EnTUrvbDKdYSDksDpDKldZRcmbyLvSrwKLEoV76NS9DDHHih
	doSnaR+SkcJjoqc3yis6yEh8Z
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr76568891cf.5.1787221790605;
        Thu, 20 Aug 2026 03:29:50 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr76568691cf.5.1787221790249;
        Thu, 20 Aug 2026 03:29:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24589e224dsm52452666b.2.2026.08.20.03.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:29:49 -0700 (PDT)
Message-ID: <ac7cf390-8135-4bdd-9fda-8ee5fc31d3f1@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K8XSOnfz-I2AO3Ico6Z-_-Qmi2swtiBi
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a86d71f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: K8XSOnfz-I2AO3Ico6Z-_-Qmi2swtiBi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX0q1UdY0qWiZW
 SYsFzwsc8D99zQOACRmknvqJ95grXsRWPbT5H9S+oAysuw6FxRZmzST1wfRJf1LYVqxDxFFs825
 zI2o8SLmBwzDZJjPfqtRr0qGtdDultI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX0qygJxc9VuGg
 oQaxm25O9aO6eSBHvjjf8sUrECWU1TugErUUlpGfVSyMGrFGwMXD+NE8iX4oIPgyHXAuCDnmzs/
 84ir3JyekfHHfcGoimrN8Hup2kb+GhQtJfJKtaAa3NCFmVmPizZBzRShyklADcVpZJuDHwksSHN
 V+7snu5+JPMClRHK78BRR0jHk4BBUXEb+mVjt4k3b4RgonoSgn6raBjI05pKBsf7df/WkQqDiP6
 KuTStPkyXVsFzOypnWOG3N9oVrdPbJek8aCst5DMRA93JkmMWkhFCJgSoEkuPY+WW9IieQZZL4x
 vbvLWpGyk3immZm0Wkr9T370CO7or4wHqBszXm+WNTZCHfvKXLT5NigeJ/7oOroUcTpv01h4CJO
 M/Z/CKCoYSDPdWsn0lhIOvumCE3t8dtkRwQH+Ezje18hE4zhcGdQbbbK+0nasQyaH2fQkB7Daac
 jVazsF+BZ5P3Yp1JAyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
