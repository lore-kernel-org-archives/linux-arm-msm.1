Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797243DB651
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798070; cv=none; b=K+gOF7FqeodqfLP0sjA9K5z60VyKF7zVXbs45Bj5+kjHSQT8IC3ujMbEBcG5Am3PvQWOqdpJWcSjSVx+pXq392nOrHz8nhKqr5HlINpA0j7RppHe3ByxLF/zXWxDZwf0T+aoiGyS5yRZdL2L5glt9aNwEp80qVXnMgTuscqpdOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798070; c=relaxed/simple;
	bh=rx8AxAOChCv1a1eKaXFa3qJAaLTL/cK5UWcPpj36J7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJcOKywisYaYKZVjPLlv+CJi38/W4e4MmqQA1sjt8pajHeLzZUWEA0c7UEzjTigFNJVVNpGieQJ27xwDi64fXz8h7UyatNCdQ5rh5CIsjm+59mznuJfA+mG96ucA6q6ayN1R6wqwEgCOuGGb170FKuIwmJSFYScFYvz7mcD2jpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lxx7A6dZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhf6nh0J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lxx7A6dZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhf6nh0J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qf6Q3045134
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=; b=Lxx7A6dZbpy/G+Ob
	s19182Khe73cKtgoJUQNeADtyrlbvKXmE0JHktRlCE/MkmDZZCDI8IvAQJBjjID/
	mEBI0ouAFiEXQJWpbaOdAWdPiXTEEL6vIqqEfFMfSVAmSWUz7E89G1czjcg2jDk3
	XjIHIEzbbU+T2SGvbqiwsoNkab/P/cZEZPc1g9CJHDsVlIayF/QDNowyuMAZ7twJ
	jePCEnrRvKEriaLYPMolUUnunEiWMSU5siODPVtJ+er1x67af3660Qo9gR9V8F2m
	HThWzdXfXtGobE8TGi9jiO6t0rfchxMOjuCdGvlkFdHfiN8W0M4lq7bWG2/NSyUG
	mb5Sqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8bbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:14:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so1822841cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784798067; x=1785402867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=Zhf6nh0JBC/eMAsDFn2sxf1PbxunDoRplybKbFK5iF6M1b3KDKjZPWCSdJcpYO9ILw
         eg88NUm2/1Fq96VL/+QNkiXvfP2tAwhAdNmCu4WR1jnq0bg4ygr7ptPy3IKduXKuvznu
         IEs/ULjhxK+gV2a87nRT6nQJY846NsyGRx/z1VA+Tk8y2rUQOm55r1ojNOlzOs8VIHMT
         +FExmi41+EMDjWD95UMRtQDSOPSunNcdJCd3qQ6FLf1IRCr2wghO5WateEYmCCMsM6Wy
         CpCijO7tRrypO8cUYEGYp7qVDrnUwvjExBcKE6rSGPBSH0xsYTOmzCOoGrYS0eynJYtd
         rrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798067; x=1785402867;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRkB+zgOMtMFRit/EtrmCl3rzDG7gk0IKVm3j4Qb89c=;
        b=iWVxz83t431rDNeh9f6qr4UClj2i4iB84/3on/Qw3noq69tqoxYCCRPTkNxysOrnur
         cmuNSwbJAz5czjp7hS4RKfy74IXh6RpGJgj4mZaHauLRvG1Z59vSIXVqD2VeQS0y3e0H
         ooQf5nApepf8j66lahzeZNgoIALpDbXO9RR2VXIvLa5cfom0N/nGMtpRLPtE8b8nUXnM
         6csFWtVFv04KkPHYiZK59BAIqEXupSHGwECsq8ocUkuwHgWn0ljkt9DE45dIaeO2b3R6
         D42j5FkRLsxUftjtomSIbUW+UrbA7vlKEBb/eU+CkVhHuC2aFQKpYJuAYrwukDg4eA01
         BDuA==
X-Forwarded-Encrypted: i=1; AHgh+RrkxiaVA5np2QhNzJYi3aeSmQG3OvHjAbku304t2DWzqSJpgActzSvOR0EhCHGa3gRpxpIyM2XMU/EqDfbD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/LuUB3kNm4ar2chrgfN8u01mJSxFqf2N3oevJPjKSqkSFdrC
	hI9S3D70EbLTtj6gU04oUnsCZJbNPZMI/gYYNJWU3NexY/wqS2pPxTdiH/xhkXWXPlsT+7ZBOE0
	qdcjFV1K7y19QPe3hZNBtaxXE6OP4/ZYZwQZ4j6z3hMbz8CMCtZo+/nptDxJYGsH0mc4fo3KKog
	Vq
X-Gm-Gg: AR+sD10j3j4dpXDgR1DKVXJdxghXEj6Vm9U0rnzxr8dxREty+E2I29LJiYO0q/p2AIO
	RSgwrZLJp6g6yZGXZCbYAbbI6NU0eZ9kEomQTEyV4mv0xJ0cvcG6KmH9mlJgwTlQ8Lgtwl5vLpM
	s6/fN/X9oYDv2GN+kZcrOQF0kpRshaJnhgbBGXliJdXBSYrm3xKP+ziOKWWJ2p4tcslRvmDMQl6
	PG+6t4YhK8ur/uZJjyfAZUHKqKXs3mQ0pFmWfbLy7oWnJ8H+NDxgkPHs++W0bx9oKlNCeOcLz15
	/fuu7IbYZKo6Tl3KbyRFSN821hCjH1hsJVw4Y+eMGe+Wkv8ixyal/jo3/I39r+24WpUthYdBC7C
	8D36adEnXkoTBC3v6/3vOI/qx
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143541cf.1.1784798067612;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
X-Received: by 2002:ac8:5ad4:0:b0:51c:d8f:d77a with SMTP id d75a77b69052e-5283dd95172mr16143371cf.1.1784798067197;
        Thu, 23 Jul 2026 02:14:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm31670366b.31.2026.07.23.02.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:14:26 -0700 (PDT)
Message-ID: <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 11:14:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfXx9Wo4nETyT78
 xIZnVxUL0rpA3JtRykNfA82t5GCuM9hhaDAP5Hv2sxpiBItdApXmb+dyhCBxsLwlsHrAh5xgZb5
 WyJRje2J3/iv6XSCXQr1KVlruAFYmiw=
X-Proofpoint-ORIG-GUID: uj6VYarBOk28HpPsn6bBHGj01xfGwS-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MSBTYWx0ZWRfX6OrRFLAMybNz
 MHNhmy+ypqYXFmjf4TGWVlLsQVrJcdPbzgb31fh4ZuJ3H1s2BYLTK4pIsnxK7zm88W5Hh5KbwXI
 0izj0A/OvdCNiIM7uEitq3YiLsS8vjTYYf6BqyzZGBO3Ym94dPUoRuBz1vTewL/W3lPOel4Nz1V
 fvo2Ov143CdKEc3mf1Z7oWkyV5rZElPFyHyQNd92b8Kw4SuQ0PjkObFgLyTgomMEX7uqtpXn5cB
 3hnGBvT1xo3nJKMjSjPgzuwj6xLVepG5c8IkQDqbnXCG+joTCjfHk0nmQ026JkTOwy+rXQwDp2D
 BY5t/oY2NzKe61uQu1vDk2iEzK4GoC0wwRHo8+NQsET/NjDCqh+8Z0iAhgKwMTrU6w+UN805NlR
 YrM4J3RVN1NIlUOkNExLPOrVQSTk2qlqK0rKx8WDewxnoshqgli+Y20dKqcdyoCIefdoq6TER9Z
 Zpm0BvNy5KWfm0bWhyg==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61db74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gASrDC7fFa5pDp3QmhQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uj6VYarBOk28HpPsn6bBHGj01xfGwS-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230091

On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
> driven by the wcd9378-sdca codec driver for headphone playback, headset
> mic capture and jack detection via the SimpleJack SDCA function type.
> 
> WCD9378 codec can be wired up in 2 different modes.
> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
> each of which has dedicated control and data lines.
> "compute mode" on compute platforms such as Glymur is enumerated as
> single standard MIPI SDCA class device.

Does this require a different hardware wiring, or is that just a
difference for the driver? If the latter, can we choose whichever
mode we want (i.e. use compute mode on the Fairphone or use mobile
mode on a laptop, depending on what the OS supports)?

Konrad
