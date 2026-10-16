Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABD246784
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144640; cv=none; b=cLplBNbiYmNJAuHZOniGCGMXUuIuxAFRQTJl8WGxiWO7mFtLud5icyU6Z1wtYDIwk0FJggtj+HDjmwytK0iVLPWZTRdW0GbdC5Yh+s9HKobRjnT3XbnVVnFtRPdPyyJR8Go5qyeYEB/3GNp7RkrZatS8Gp0z9cx3m40oqTGlE8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144640; c=relaxed/simple;
	bh=SoGz1wR1Wyop2Qvinvrnk3+hvBdaIxCKNnO4HMCC00g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TCdJfKQwTWdXBEeolj2FQbTfQ2AihugC0mNMGQOFGdQNpmMpWqCtpiAU08wx6VQZn+6sEVD52VB4GKmeaKZhQlp5Zdp0+1nPLYCHs7qq16j46pdtMLkN+SNLPPFfLIUo50eLQIG/+U+4/EpuoQtKDXCQO7ZGW0bA0xlqvFvIDvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVdD24u4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8bqxDMQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVdD24u4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8bqxDMQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8liI4921388
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=; b=QVdD24u43PumWTel
	YctVLY1o7YRrIGcwJaLWaaWHvTCPzmn5XBlaTC+kEWDuAH6XV/FiOmv/seM8tNDe
	B1Q+FLkykpmmPEGEcOkfyfZoztJt4NviHuj1OYY6w0Kh8NRli6ZAgTuaiDfekdTD
	FJVpXzHokZ0yu5KqUPmKb4SWIfBqOLYmD2tj7xsUXpa8aISTiX3uLXzrVFfMHGaF
	2prxEbQvO0PZ9kHk+4+DYBTduBVuh8T/qeHtafg13xCgHvEnVzbKKR32QuqaHWU7
	2978+hprQFDnDgOVoPC5XS3kvheFbARpp+jRxpkrtjLVYR0kJIzhlMIGWYDVdl3u
	WxWODg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3b7x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:57:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso4584885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144638; x=1792749438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=e8bqxDMQNq8FYwEDdMI1z56qB+1J0nsuZUZ9/B+uQ15quA8/WanVtk8Mwfrq7mVngj
         j+eu//bmZFwhkolHvQFiU0stGOMhdDBCzBAuHO4H+InS7oUB+a+4cZXx8hLyd3AyOMGb
         J+7blz2kNFSLdsYJP20cksDwYvBZ7ncoDjFcjUce5pxFuHYZvHhR4oFM7NTwkSVT8tcq
         V9NSfvSEqceoICMDAc84j1u/5nA2QJDgVmstpXTuiQH0tVYBq6kTVyGO/GL7lvVpFIYr
         LMPIxem6VK+0vFyOMfUAeVFD5KPvI/AVi4bq+19rnbrNtHEU5A7FRtbUH31jgaYj7lVc
         vPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144638; x=1792749438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEZuI1yyPm/8RNp/MlW2xnhdHbaQCPMJNbR/Nh1GbqE=;
        b=Pz6ZlsPt4jBBA8kGvuU5XdPpxf8XPGWzvrhuawKG9dYB67eHAWY2Tx4WTwPPigYwD9
         CMjXF9KPc4PNIyqQE43A8TW1Se5cFXYFs1a5z9dLxM+sxcfAKrb/DKlySSMa+IY1m6iZ
         ABAfeAx4GD0o6RN4HrJ/mXmuVIoP1+4cNMKn79ffax0Oi4ZNBSAGUt+ghcpFh/mgp5Er
         KrscjIREcM21VRUzWHC6Sp3VJQnbxa0JNq/8N1oZ7JcDsb0qd11vrxpdkfYlzQ3tS+iL
         6VdJOh/8rVqryBOjne9+Y3LOKEoV0X56KYhFMzltN3of9xfbQCiGVfk8tWqTxGUDwqIL
         bPRQ==
X-Forwarded-Encrypted: i=1; AKwUvByVIg4umqBZK5C7ww2USBui5t8xoUHgwEXHzqraL1qfL8D7Fbd4SkjglAohJ3KrRzlsGaWQJ5P8hZeq99Xm@vger.kernel.org
X-Gm-Message-State: AFq9FYK1FO3+6vMnIHmGoOxKGVdxV2SogtmJ96yzUIWeJ1GOf4fr8Pvw
	5Wjf3CCU6ZgEjOIAWROgwnf/3oRyH/UOHx/gXjgZ5Ko5ey9jKDswOVIN/D9O1rX6GDdfzHbyS0E
	aZi78EcmCn1aBH30Bi3bzqYSXQ9wZHslxmmXJri121wyR9lVeSEr3MulGR1dRp1Bl1Q2b
X-Gm-Gg: AYBFou0A+qDw0pZAlNYd9fJibo4QMGZz8xwoz9j1TrryDmpYLM1+nUFsySKBc0D5Jlr
	L82JAhItN0d9UG8SNmf07Kot9CdmvlTtgvKqSyHlNvr5C4RnvNdwtJWr/dx5dA/KIOeX3Uclgqc
	K7SikXN8McOfESv7NuyU6XoOxYLXpYe2lB3rJFpTQ9795EvcbXtixHh1gzKleHdhw+Tg2JFAsqQ
	YQNnqztPaSo3mKrZUGKMRbJmYvKchl/42UH0Pb2INvAOhGP9f5vkk7nKqCSyk10tgQ1cXG6BPPD
	caByoWNGkCvmIdyHAYLEIiegBAfMoV/T7UC2jGd9kBNnxQRDuR2mADNpPypcjxIBnF6rQTwCJph
	usb3mVwuveJStQsHNaZP6EA==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687801085a.0.1792144637747;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr3687797785a.0.1792144637202;
        Fri, 16 Oct 2026 02:57:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf98fsm54523466b.13.2026.10.16.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <2ee02f35-3dc8-4448-aa30-331932a40629@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:57:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: sdm670-google: enable adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-9-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX0WpWJUEGgjNZ
 evLL2TcF5QcWX1a20LteMYoN9eMxzw29BihhNlwdri7XkJJgbl1wvqzT4O9gaji3sODh7zghqnX
 p2EhnGGS8xfv+e3McAee4Iq4t7GI6IWrjVhXukplDKKJg14Rn8Jt+KU0pE68rxDFBFGtIA2efrA
 ZxpJkgxdJBX7em+ByXIiAueM30GtvzcPoUxMEofHD4mn4nJclh/spwnu9L5fAmKcOaqBsrAAnZE
 zIQfoi0PcpINBj+v7xWxk1hlTmw+M4Zsu7Y2debuFmpAw5Md6y+/UNDthDh85TfcHcoT4V381LZ
 6Nbd8asofzW6mTr0s14brU3Q/Dwgy00uPwicKV6Bx0a0QkbXLQwCKcvZBM2hD2Po0gz5wreTI/U
 7i67Wk46eIcy9UzZG/p6JdETQmKwZBq20ihAzVVY7WTpzcfNGzEHUst3j/NKuLS1W2oMb9JjbVn
 ehg6O4CttmlsOGLjfVA==
X-Proofpoint-GUID: m8E849VfPPD4yskIo0IB-G9u0N79S_93
X-Proofpoint-ORIG-GUID: m8E849VfPPD4yskIo0IB-G9u0N79S_93
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX5OA7GEsEHcLy
 pYlQ7wxT0Y0M+WhfFkdu0fPrXqNXg8HFWWbkeFAqFNmT59P5xSg1dsXrJvHqZ2/AaEqAY0hTcDB
 1u99i37Z91bYQmv0JRxbsmyN7++3HKk=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1f4fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1DDleCVHwAjOA7h17fsA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 10/3/26 7:56 PM, Richard Acayan wrote:
> Enable the ADSP on the Pixel 3a in anticipation of audio support.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
