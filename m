Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A841D11F
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843984; cv=none; b=GhO2J76sKMIO3eg4LL1J5iiu3WC+nTwjg/vv1ybrG/DyEMjEeyLbdGBnHCPfb4rK8FkT73F0LT4ZD6+dRQ7LnQD8dlBi1aEfd/QugrM6adnKNmdJiYMefL6U9LyLJeAqgq5xlefFkoB3ga2nfzlUslYCH9cwUaHkhlay8wDqMbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843984; c=relaxed/simple;
	bh=2jY4/kzFvO+9VqBwBcRKev2G9WIAnsbUYz9bRalBVRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ETzLRa6KiNmpwD4OH0hXEYHXa+Ej+Fra7Z0xw1h7u7aGnqYYpX9IVb718Ya4+ka4oUs6ktgoBvazy3sSSwtrSqJNq06BReHG+szIyiI2OCgWCepVjmw4Ce9hk9AhH5KoT06jrlI7HYPm2ZMdOhLrGUixevL3Jb3eIfLT4CRgVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETWx9IT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hjj3Yw5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETWx9IT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hjj3Yw5u"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfVL1511891
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=; b=ETWx9IT5nllmdrbl
	RoogQStucaNfYJzhc9Ow4zGR+FZk80CtYt2A6wScmm7A9uQ9lBHW+NaYiTICcO3H
	y22UQvfi50+fUxXfJgMeXv2IVDdboT9Ae9/frg+xIdXH60YvB0HqqQqSN75BgISX
	ZwQ7O2ONmuZKyX3Z+q3bviFO2Mx/pq4kUyGoFwwZ1rmNgyenMjnjHMXOwCSLudsF
	Tfg0CCRGfiPiodsdEZPl5V45XofHw2wurHfuLFlamfivRMfZJYy97HNDSUK/CXQf
	O5VgZV/3ADJ8dRE3N4y5UOBlV9xptigEg6E4M9rlyjEE7BzuDfMG7nALe0ZQusAI
	+j/JtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stmqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:39:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso84181385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843981; x=1791448781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=Hjj3Yw5uGcJyFu2QcRNJpmqhr+EVWmD9GvCBqc2xmiNGdieQkBZH7rVOimcZsbduhE
         7U8ymDLtrSS4Y2pjBRQ9fAndPD+du0tKkozZF5gp68aSavezozO8tyqw7BPMCwlDxV2W
         1xNnuDKZ40SwH/4O6TKQoqOj+dyD6ZrXVSNdWoZq05BbaeKM3TlzIPYBhtSvptE6oMEJ
         NqI7oQdDTKwGTQ4IXFNaNlvUSnHp5fTEvybmCXb2nNpXM9wm2HgLWXyTADaVcxafFlCW
         32BDZUmU2JdZL7wCh3oHHfz1UE8/S/Fftp3Txx2QYczw1Z9QGvS9yBDy+Bm9nd23cb7Z
         KLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843981; x=1791448781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ViB2hPkPT+eeeH4k92vbHVOqiR+Ad6cvNpNGQw+EvoE=;
        b=tRz2LCCVK/rckE4+vb/e/Ph8XXfAAsJgS50wJ6JOysrdptGgyOHWh+LCE3G7itr/eT
         ojUMnk52B/lHplzcPEXSyzWKIiRDLoyc8HHd2jiTIeKv8YomX/rgGDKmDBob/yZSlI/M
         tWFQT4h8CGavh8JE8AwNOlmQhaCEZNBwlvemLqfXHcJ2H+NzWihu2ERQfFmSp4aL4hLv
         WN9bq/16dTsLm3OHFNm1xI6qGJQp8eNGnvMDQHTBFh2yB3UJiOKj/Hg0fsPqurhLjq4V
         vA9/2UtFSTi37VV1Aboqd1ZboMHdnGNejGjIZozUgTqAHgpmO/ZS/eGTL5yPfZPgc5jr
         dIfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPSLRfPDzRBq2Bi7oc85/z+U0gT8i0p5dG23WSalJBiTL+cwVlLYmtEfLzL5AYjIk/aLd9WBeFSLHKWryG@vger.kernel.org
X-Gm-Message-State: AFuF++mQgg/3tYMKP9Polnm8RqoSCbnpG25ljV9SkhI7lLl2S8XHb4jj
	SdS6GAZIScqVgJHp+6ZA5ELjPaEWxPWburNh96NN4+NRK5N1idOOvCmq6KvWlbTf3Rqc5oO/1wB
	uOGIFnfArNSa28ggM+Myc38X0hB8iU/5wXJpc0AByFYtsrENRT5Tv2QhFMTV2rkiNzH21
X-Gm-Gg: AYBFou3QnRXMC1jR0n0x76S6DEdgLMOIFS776uKaIwqv2ZRFSJnFcu1m4LeNV3m/581
	sQDcTBHZ+VULam8SmIAbPlQbQWgjUmIyPax7wNJJaAvxCMdulz803jmlv6HJHHxHH9pbjAcpz7n
	03jcR/ew467PfYAezsqChbEXs74tFuFwwWBJ9onz2jfAS847g1Qw79xOCp+d6zJw/gMRKznuU5j
	Uc2g5YG/ud4vDQCJqHnY19rmwfHJAUvq9KF5MtW1dcHLB3qweO8RSLMloQRczZGFI1UkK0Za32e
	JkawIT+Vk+LEjhl+Vm5FCz4K3dZ3YH+A62vQZw3Qq3cYsntgYYHqq6q8qgPF5JHrixq9rwIOYqb
	orp+Fh649CvQioT4ZkxvpZA==
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717454885a.1.1790843980875;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1990:b0:93a:14c:329c with SMTP id af79cd13be357-93ca95f973emr717451385a.1.1790843980369;
        Thu, 01 Oct 2026 01:39:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31dd9fbfsm109857266b.71.2026.10.01.01.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:39:39 -0700 (PDT)
Message-ID: <b1dca609-cc63-4698-b760-bb47646687f5@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:39:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sdm670: add digital audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-11-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922015801.32373-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX58R64Bggq6u5
 1SjU+npF+0QFh7P6ohZwMPdHero6boiJ3FdRdFu9xDWJP5E1UwJdW+Tl08vEXIpnYlEZS4uQPN8
 HcW8b77//SO7R+pE5RtIm3LZJ8NmGek=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe1c4d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=GbMiANRL7AQ389lSoXQA:9 a=QEXdDO2ut3YA:10 a=Ql4v02ufxVEA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8gq9iOGSIrVmHjEat-LryE2hAO-sL_E_
X-Proofpoint-GUID: 8gq9iOGSIrVmHjEat-LryE2hAO-sL_E_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXx+pCIFBxjcAU
 +2KKDUlCiZ3t9jvRqTw277Vbbgf0OHtPjBb2SgmsFqyzMpPk+Qk0uwFrrxgfi+V74XrEtthC+Pg
 gmPWh6n7bKjhWxLJxF2medbKdzgrCQVE0F3W7zXFbAotCpXXUO3hVfHUzZ+iQpLXAqq/K4VvdRm
 5g7StNRXLwAS3biPRyLSNiQey5cJu08IrmlA2SNcI3jD8t4+EfXocG/T3/++swW9xel5Fvqbzwa
 JXI9dEejR9ZQnroDiriY33AutWUKWM1AItogM7zYmfK7Gu6J2x9k9ORLrosa6zRJQilcOlSvyf5
 oH+Z4L68NHjGfiAPQdJq1ruW/Cf9IiuGk6F2dgWpBkqLMo38KVkHmvGdxJf2spuBxYmqMKVyZTH
 r+7zZ/3KlTbGC8ZlaJV8iTpy30dv2c7pa/vAW52PF5QB39zuGqTJq9ddfi26e1rE7W/SMsdKvrt
 2wlOaf9Byhb6LWha2mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

On 9/22/26 3:58 AM, Richard Acayan wrote:
> Add the SDM660 digital audio codec to the SDM670 device tree, as both
> platforms have the same internal sound card.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Please introduce a SoC-specific compatible for 670.

Konrad
