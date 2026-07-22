Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580A2EEE6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719933; cv=none; b=KYigafApeN60QZzHopY327USl8+stXtcbjsPz8w2YrQgq8zO5cmdokzQLa64bHf4qg1pFtvDwaSqd3/MpaeBlnkwVb0Fk/W5heVc9w8qESWiZJZW0/1tkQnDQyY6bOnWKaWG5GyISFJ4bOug18ZpzSxWZ5VvzJXtBG2UDPqk3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719933; c=relaxed/simple;
	bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rE1YcT/tG3PdBqLmKbUMFnAPlw2nxqwu9oCxZyRowqWyCJgTZPE4Mg+ez99JS+a4H9XJRgU7MtP+2McmjXvikKmXx4sEpUqjJxgQbKAsm4274WScHbIU1bYGaND6dlT5aPbMxLR2RyFmnFvboJHRXRo6RGetLYRmq8nR4Nncj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGLkj2Gl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IvTOxBWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGLkj2Gl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IvTOxBWs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x1bw523807
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=; b=BGLkj2Gled8Qow2w
	c08wNVRVuOwwNcjRSzgbe96UVGxhcDpWg45YV1wIQPndq2xHCgCl9l3LLHsozSQ4
	ONfauQVnmFz3AEd9f81eDbDnlbF6AlHe2VIHebAYRRNvj5cVI5Dvr3jplsF7v+fZ
	Aw22psEiXZ0+IVI1NwabLx0i4MwtmppCSMDGIOWRdYVb/P2xPoGpPgEg0QENyxLj
	/A/rktWBChJTvWSe4TiPxaCxXB4Fvyavy6fl3BqnqJV7uXc2pe2OPFAz7GyrAIZl
	vST1Te6MYkV0GHdJQsoC3K3Gat0Yx6zBqZmb5Vjw6owUrJc64ylcSt9z4XA6FRFp
	ipb+zw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt156h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:32:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a3514f912so17376064b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784719930; x=1785324730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=IvTOxBWsNACs60oINtlJzCTvi8xK+vQC/PJRFZ9fmI6rkUr5gh9P9G2RO4X+SREVHL
         1OPil2ze48h65mbvKm+J6ByQ0PYH2iErZRQJ0wDJnUi6A1ZRpDkSOWqjCsWlM/epv01x
         EzKteT7Ns9DDo2RBGrr+z8pCvmgtEVPuKR8Dw8f/pcgE4baBxi935sErrZi8+jRW+zlE
         qdzKRk7/DkE/LyjKqyTof2SLg/8Cf2Wjq04lnxI2qDGK9gz0Mh7hm0XAcBEgaLVSlNgI
         15fA5sOyetMDFvp0YiFWWuWqTnv9zC8oskmHPzMw1OMR1oFTnXLfizLVcCtUzW5CnccP
         p1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719930; x=1785324730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXND9Sle9OaS3hHlZnm2qmNYfirIaJdmxVnxpKKxQuA=;
        b=KkqP8O8M5KA31vBvi0ogvMaH6FLvcjy0haQ4drg7/gVooo3QZu7l1/Nm0qjiPl7sd1
         2aY3Bv8LMoY6WQJteKIzBcDWPGU8lnilqKfpZIfVpaH+n9Crko6f5uC+K04zhQ2sc2c1
         ioycpVBDECUlFBeylrFfTNvcnANoF4T8rJCoZdafsafn0RrssUkhr+oBW4n6F+Ma1Q1K
         P9IF/nJTjgx8Bps8FZ8GQzr7msc5qTSLRrDUe8KhjLCghelZYG1jiNzakfwHcWJynu3M
         UGAJIKdJkXCF3EsQuAvSMERn6QUFbYVpwgiL8so8/PwOI3BpHyBA1l7xQGDVWZmYrFhq
         hY7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgwO/V8STlXCufE5mbpnBMvhvK8HLSO6ui4Dj30KCgNA/Lv9RL3T77INKqXyeg21/6ncKQXO/IsLL+4grQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwNuYrAB6SoGM+BX/7i9NSpcVhQ2o85gYurhtphydh12qS+aqmt
	zXjzqn2oiyjv/YwVwJdclali+NuyInhouW0dF4lpOGYEPtr+yvmAdDcLlsexvNHCn8GMpZ8ntwN
	ysx3pHISD3UBJdXmVgU1G70bHGC1Yfayo5OruRLrBRsruUlWJVtf6qjeS4BshL5FM/tYvast+Hz
	x8
X-Gm-Gg: AR+sD12MT3cA4/GyRNubZAu1ssqCB14jw8f0ZSbD4+A4Aqqll5LYEq2Yv5r3jVeZi0H
	UeDt/LLWYbC7//D3E2mlMJbNMYO1hIwFAXGgAlRp+aKW+yJ0JdEe38VUR5mH4az9BERUhFCpBs1
	f+jpGT0JaaySrDBL1tTYqQMopB93cJFscn5q+IsrkY0EDRTolavW60UUfR8C/h1MgIp6JrzStcC
	cDdUPJhCiGcDQ2gXp5tq1dqAZ9VMe8R5YItZh0+low6g9k3b/CWDeWFpDlExRuEIwzXVR2DBZyK
	8DWHi81H4YqaB4p7Kqpgx/MzcDuNJsUhdDoqmiuLLXGNmI5c0gr9A8PA685TolBDEb/4qKh2XtB
	EB6pOGXNljTg8eqsI1j9bJ2ptgibg38u4qA==
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23779018b3a.9.1784719930072;
        Wed, 22 Jul 2026 04:32:10 -0700 (PDT)
X-Received: by 2002:aa7:914d:0:b0:84a:6726:62f9 with SMTP id d2e1a72fcca58-84c292d0d55mr23778979b3a.9.1784719929579;
        Wed, 22 Jul 2026 04:32:09 -0700 (PDT)
Received: from [10.219.49.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175a29aesm1172711b3a.41.2026.07.22.04.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 04:32:08 -0700 (PDT)
Message-ID: <a3505150-0a13-4730-b051-2034e0e2ff3c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tv7r8hHqAoODA0P1TDeWFVMKlqot12md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfX1wmJ/4MntXQN
 p5+nYt2IepVpggVqEtCx1q4Yj5g0u8fzJEDOXJY9SmreABL6DzoFZeldh9IZHMQTgVI0vygG1sl
 j94OrZUT4FDF0+wZv9Go0WXO823XWanA0csNhOVgTUsFWhU1FCB32ShXb/mHNn9vrV0rAUOmyU0
 t8aqFYNZZ6YIeanHmJeHHURCB343li8dP05COAyX/DYB24r7F3SGIddhs3iaB6ywmxLT7L2Czru
 WDC7I1bnvEz9c+1aALe7/WFmEFymRLqSKAv6nWU6Kwr8gRSsdpuisDp62v2+FoXTW8TBe+yL0Om
 C5nT4B6t/DUrOKTWJ8EVu2yUoRetxwjKZikcsiITIddfOVmPTV+eQfoKYvYJMpRLCWk1dtrHpV4
 zlg4Olnyo+vTzvYxTkjSr0gVuObYYFGMTDAdNLI87xY7fBSL3HG4mwardwRWo8sk1UnapTXdjBj
 s1A0EqPdQ03u7zs6z8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDExMiBTYWx0ZWRfX8wS8eeX0ufpv
 SssxOVcVthvzfdvqy5+/QBVJtFzx0NpRJHCVDKpzbLJGYDHxusDEUq+693ioYRS54gekMnU41Mb
 MmoXuu/KfYaIm4sMrRs2P14EXJbjaOs=
X-Proofpoint-GUID: Tv7r8hHqAoODA0P1TDeWFVMKlqot12md
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a60aa3a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lHG6SDQFHwzuY-o0dyQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220112


On 7/20/2026 7:12 PM, Bartosz Golaszewski wrote:
> On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
>> This series adds support for LPASS low-power resource (LPR) voting
>> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
>> platforms such as Hawi.
>>
>> On such platforms, LPASS requires LPR resource voting via PRM to keep
>> the subsystem active. This is handled by adding a new clock ID and
>> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>>
>> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
>> dedicated DT binding and pinctrl driver.
> What is the merging strategy? Is an Ack from Mark required and the series
> should go together through the pinctrl tree?

Hi Bart,

Thanks for the question. The only cross-subsystem dependency is the
addition of LPASS_HW_LPR_VOTE in qcom,q6dsp-lpass-ports.h, which is
consumed by the Hawi LPASS LPI DT binding. My expectation was that
the shared clock ID definition would be merged first, after which
the ASoC and pinctrl changes could proceed through their respective
trees. I'll clarify this dependency and the intended merge strategy
in the next revision's cover letter.

Thanks,
Prasad

>
> Bart
