Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786857082D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278175; cv=none; b=U4KmDOSjjGGs88SYJuJBcmS/l2pZvP3cHT4nEESBNZRbaMjCwUiVZTEl/jXQ21xm/wlw+bMIwx7gkro0YSWQmNywyjehcXmAKsMIMHj3LXke4J5r1H/nsFpzN8GQ14c4nhZyN0oGw+Tf6XgkxdDy8MhQbpXr4RQ2DlGHcL95taI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278175; c=relaxed/simple;
	bh=T17x5FSYTfh9vCvsdSg/wE+KeD5tHNDbO0VJlhTCAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhArepYR43gzOgm6SB1Bt/lsT6mo6BfgmprjhERonar5iWjBV/El4H2YCDn4Varlvv7Q8wJWL2y1igfZKZ/24zlUy6W3ZB6Xzp47NNrLHnnzZ5WhpAq1yladL0FKWRNC6mVHnNA/jQ9h6Si5hUV+A5xd68BUdF1fmpqQS3hnyzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr/SLqMr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j597IUQA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr/SLqMr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j597IUQA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGBt1160823
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=; b=Vr/SLqMreNIHAIwV
	1HSyJYKL7VP7PBforMcctbIZMxh6rqr1XMRzGqmD6I2M6f/pIiBGWqKaRG60yxek
	Ro4LmGA2TewYyF5qGR6yZXVBU6/sRyNOKIjG8aFTMr9l1MMIkwkp+GU4rPmV0lJH
	fJJtOLA8Utz1vxhltyOBkON9NpbyplQEyz7X8Ixou5TUdkfDGur5cSsqrw/Zw+3j
	V7YMyP0jjP6h0itWAMDDwqZYSsBG/QWsPH+J5QfNo+uQM+u2uKSYmnQhC9hUPlrw
	TpDemOjwiaQeBIwc8CbhriXxttrq+d1/6WHXX2svbREqe8/4RTt11OsPbFq5twrI
	AOUyCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3aryw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:49:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b81c13b0so3166785a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278172; x=1784882972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=j597IUQAX8mnMyHoaXWbn/A2mEZzGDG31/N9ybTlP6Oepaty2vGD6ChIaMOVLngAW6
         +DdWM0j9NXJ6H92ZOkaCbRDyHcGFh4vTTyMznpzrhipF1g345qbtt2JQPV+fNgYs6KWL
         8d6pWNchZQ1kZ4IibGgaUMrSJ0fuKnkW+eKlmOr6b5f/WZaI17wQpUxa0nrrFcPkN1Rf
         HQX+pPKA6r1D4axlyqDtFZU1pc2/F75lEXt4noz86W1SsC7P0whMikbDdJJmZOvZ8wbu
         REH3EOmEw2/YG8U4sYSuwvtpTn4oRzvLzXL1p9SBAEKAcDv2dnID7gXiPtqlCwO7A+Ro
         8B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278172; x=1784882972;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kaPio8JVQrLCtYd7AhcOZiz6hzao8PNpTKSR1pBSvko=;
        b=NM4NSG4ovNOjlpItByvR1UaS0SoL5mfwxDHQujohmy0C1l8bEGm113Ks7jxV9PYb3z
         jox7iJRg4E0zh7u8DQ5PoggonEmKChXgd0GKZmmhaMMNGiOJ6dGJUamKezn071PpNfz9
         ZcszdOCO4ahLaYotYaulnsmrjo3t5ntkD9CtL24hOz0tVW9gYg7y0kUhEJKovDjJeMZv
         MVwe5lwmSz3QhKno2AlWdFkXZ5sr10jCV60x56WxMne4xSBd+tBpnvwSZDGYz13h1xXM
         wuaamqtASri4KjTW8IX1X5iHEFRD9zCeh0hdF3B6pDok5um3FkAYNZldaUQpDUTltREj
         7siA==
X-Gm-Message-State: AOJu0Yz+c+Tu6VhJyFfyU3RksCJmmQAMDUveTUlnmXmuSlCs2hGAup9H
	yGLV2kPSt6scRZ/WUD39J2mLNLnjIYBivitSChJT6L8URtyMxVVYjgmxABcNTuByc7Mt0gro/gC
	solbuTu7KnHWtjNRgxDB6IouH0KnsFqTVlt80vS95sy+kd0oLFTy3wvIE/w9lqdaNx/bI
X-Gm-Gg: AfdE7cmGToQIrLu7ts0J3tu0FxbBqppEYO/0U1qgTKS/liI8QWOXWxhBOCSBo367TV7
	BewAm4zjO2SlZp9r1TWlxbH49naUHdYJ91gihMbjd+Fyk82OgRnGAZsRlor6eIKHaskSkBMAK3S
	Kwri4i+OFhSTBpmb/stewOE8INGfoqaB/rnqoxIFToXR6Y4Ww6Qret6Zuhj2qLpHc1PdJDiv/br
	liHm+fkv8KQlYh9IHdtm68OtLCZz7G9OJWypXH8IN+uo4HTst8WcxqQfOHc9qTzXDifyIp7N4tS
	AGl9dB3grYsxt1AosSILycm052MXzEAvuqSmi/QRP9PoW3s0FQC7cLhjXuO7l6boCMBs32O+kX8
	ZVwa5jyOLDtIzTY//vxbjel5E
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105141585a.4.1784278172686;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
X-Received: by 2002:a05:620a:a712:b0:92e:6199:9fc7 with SMTP id af79cd13be357-930b418d109mr105140485a.4.1784278172259;
        Fri, 17 Jul 2026 01:49:32 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbc8acsm317537a12.18.2026.07.17.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:49:31 -0700 (PDT)
Message-ID: <ea54070f-5292-4113-8e3d-23caf6480e79@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
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
 <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-3-16f70227547d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX9LhzJtiDJnU4
 bWzGV0W2V2nQgIz8UO7IrwjbgpKqeDqo9/g5eZNOoVxhb+SjcmSI7B/AAvdwUJjxPrn7hdc8ntU
 8ltn7rbL06qFE6ojPRt+gEac9QAzfY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX/X0u6WNRNsFG
 TZlM/AhDK3SCKkTbZNiHk/NltOp2kutkMIiwypgqtdmyXiJ6tUEs6qhVtoXAKk2JTX6wsI23vuv
 6h7aa8m/INEqibjcqQ2YBLrhCYeTiFuQyBu4ntsffbPo5+CM9r3bkIdc1aT6oNeJ32aOZJ7xHiL
 B4Md2GAXeFdmKcNwanIAcLtrqIcpNZaW3d+tYfOt0PUQPXRDzB+iPh6iGD1k8NAzNhETSqw6HvT
 hh/APlhZe4j2qbA9Fyu7jgVBxYjQ3eOCxTqMm4EBs3Ek5cDrSdJl8s+4jkDjrftblB6FD1smUaQ
 l3YM7180jNq0ecwgyTX8qrXqnTev+zqI99r41Ui+w8CH/fzapSYYbyUWua9HlkJoBiJQ6/CTSEU
 KzHPGy4bW2opaJN3eMnWCSTKIU68tEkWQXxNgBz0CQ9EVCCZSuk51yRFDuW+4qdcpei5LO+MxJn
 b9/F+PHzroa4R8ktxBg==
X-Proofpoint-GUID: SBPB7N87FaHqR4D--yZ6rO-tKn7DG7eB
X-Proofpoint-ORIG-GUID: SBPB7N87FaHqR4D--yZ6rO-tKn7DG7eB
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59ec9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_LHxOxAbYH_kBMrIm04A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170087

On 7/10/26 8:39 AM, Ananthu C V wrote:
> The currently listed SoCCP and SoCCP DTB reserved memory regions
> don't align with the memory requested by the SoCCP Firmware. Fix
> this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> memory region requirements of the SoCCP firmware, as described in
> the Glymur v21 memory map release.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

