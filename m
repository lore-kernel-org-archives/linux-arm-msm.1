Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687471;
	b=lVkv48xg6U47ut6+E/qxTL04ics0j4leBNDvIjTRHZvNUgKVG1UONjIt8dhWs/KN6Mor
	 2cX/DoCilD643Qe7M4p8aew4ADD62HAjEk5xkDyVAeCIzFg20UsY3SQjYYThwRJrT7NIg
	 Tfm+pxuXRij6yqrPyeXZS+O1MviAudN+JQnJo71Mf6Wen/ey+UJJy9yBNqR5KnaHE0nfT
	 o4WzccFLx8XH9kduwlZEUR5pvJ5SIeVkKQeK8S+eNmF4S9KnW3EnZLXuaZYbowznP9A1E
	 Rkq4VkXK4ViSpfaEXfyYoP9XiEOiSt5r5ccGtK09UyS4VNIeNe51kK7Jnpyg273vDnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
	b=SRAGcsKozg/XS20Fif/Ra66AlBSeC7s6O64AKIrwU03cApH9yRgDluStcSHl1XrNwdWU
	 Efj5Lk3iqzM+MeNQC68gmTdgWZj9mUHrMuyQonxWwPRk7DQndZ+k1POBNgk5tHfaLNtHV
	 BUEEw6ACV5nKz2aKNJ0pnfTHmw9QtpPxvpkjWZ7PQKKijtHaHrPWjF8Ee/qtyA4f2YWIc
	 xHlN0aN1VMl84Y6gwJ7DwFzCwdaTyjCCARdciBO2lM4bA5f/Li1MIc6u64vDcsthe25z3
	 urmZ4riXMb9+gexNvHsXO2lu3fyx30L6Rv7TOV0wPingJHP/kMGsdZA2hQr6Vl1An6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFtC8iDp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ8QvavS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CAC606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CAC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SFtC8iDp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ8QvavS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3QA1682482
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=; b=SFtC8iDpYXhV1ode
	fvwUVn0JHQzdg33UGZ+9z2IwSp1abDbcSYrYggwCH93pOZxJcklPpPtpjA/pkkVm
	rkZOevoDeyQKjapUEBVvZRToOtJaAXsz9JPosZpprfz4J/x3aM/V1uY5PSREsbCo
	mx9o5SxrzrEbd6CcU7dsniPxV+2I/9WKz3TuMPDW7MwvOJdx+X55CdcCSXLhvnLG
	NwDFP7DSpTaarFbmX5GUb7N0pOzh0t8T6PZ2lGqNhOfZEWsu+jFi8Ui21isp7dsX
	bkDrMiqXesUhAc6WhoKcx+ODDFT49KX58FO3gjPTUGuhFGGFX1bugc2biUXL36NQ
	CRI7jw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekm3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:04:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so1331848885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687470; x=1796292270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
        b=IQ8QvavSIIezMCYC6Zv6UV1tvAGF6FgPBt3lGITJo1wkg21QgyljM+JKH7iAVp+z/E
         toNZASD7NSDBT4N1lDBoP1yd1e6UWmTzjADjUMw5jv5kCw1VvfNUnlgQ1P+2T5zDt2PR
         lG5erDVvCQtZ97/FPUHWa7Fk6godOk1E2dfZ+ALUfEQxjYxXeDhHefPCJuCx4zgaMG7u
         EVtPLfVTlD8dXmyDHPHUgJmL5a7Wxr0Ysg4SLcG7Au0pJPsTHLB3oy3gaCGwE7Rhgpss
         odpkv1GRmH+NyZGD8sxqj11nXR9NHpN659HzGprz/MSb+XETMOCyc/2Ce2BQPmYSvHHv
         QxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687470; x=1796292270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9q4oISP+d48iEC4VDxqm6KhZNMHQhm6ABIrAZnzI/I=;
        b=OqNja+xYpq0WUUH5t8AP3610ktjWvPXDhkWFsOttqOf++g6rTT4EsdAl7sPwDt8Gcx
         iFMcWK4ts/Gosz3vW7P0MWYZW6SDZGpF2QaEYfSDwduxqJtIdsWpmQloO9y5JkSf9CPn
         bJkoySi5OC+W0WR2CBKd/zjgMio2br3RgeeIOHvur6+yygjggr3yGxi9UOrfiClfUYfu
         S6V/IVAsCabVOA2marOe5q2SKDmZz1g1yUBPgQfxDEA3np7IUc7Jm2ZxnzWJi5yOKn5g
         oJUBgN0weNGNo7ngqtclZSu0qufAzqHDftA9uEb2xJPe4wdXztomQW9vydiwVeQkpVZ9
         7KRQ==
X-Forwarded-Encrypted: i=1; AL+hErE6r/ZYEgPDX6C6P/pbDul023/ajO6UmnL8N76CQ/VTkw4tWGrcE2/mq3MvygslPNG9yTshE/XEuxO9taWe@vger.kernel.org
X-Gm-Message-State: APuU4Z8nFHQNYOq38gkqJ4Cl9cq4HBtRrjAUxgULaq2Z1Q1WdyV6f84V
	H1X9twAcfRPRbaTPkxxbAuoKQGEex6HPVYmTS1apiuXaQbMv/VoVXx/KORhjBl5DoDZwqyP2KR2
	fZiaRXto7mxTbT5c2b7gQKxHKMGcgE2aPAxRdgw2A4hKVVbO91fWytG5cRK3dzrhMiASIrM1yMR
	Ck
X-Gm-Gg: AZFdTZcZGE+LYcw+P6GXkyVZIFSmVM4uAiQd3+zC1iDWFr7T/jXddjWjFAUdM1Tiyxd
	YZ/YTMmyY80q93l0rQMGjglCg/XMWQwi+KjoZQ5UU41UvaYEgl/x+U2FovIXJ+hIzDJANYZ46WN
	Du6M5gefFIztfa15GqxJXNksN0ivlHcCeOcMW/ajrkiKvNaNpv+WYVHHNkgKJcPUiN6c598V0iC
	ibw1anqtLeNMiBxlFNRNYWGoGKYis6brjZI9PwVHsaWmpLsoMqYJU2tNQkH0QhYA+VGxOpVf5YE
	NKP8xi2l45FBzWJMyw8T5EmdtluYlLAIv6nPilaQyL74phlh/EmzE3WylkwoH0t7pVUhaY0zRMG
	yol+GH/KtXzI628/FuOfXm2C94qzrsnQIF3v7rseUcKEtFqJsvMIRzlLeFWOmOWyIeHvFMe1iGG
	lJ3Q==
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr3216365485a.80.1795687469561;
        Thu, 26 Nov 2026 02:04:29 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr3216361985a.80.1795687469034;
        Thu, 26 Nov 2026 02:04:29 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c513ae66053sm735887466b.19.2026.11.26.02.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:04:28 -0800 (PST)
Message-ID: <fa4d15c9-8657-486f-bf63-bd1290e4ff39@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:04:27 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
To: Demeter Barna <me@fromdisposition.org>
Cc: Michael McAllister <me@michaelmcallister.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
 <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
 <8832ef4d735b3fcdf48a2bf2a9997975@fromdisposition.org>
 <b9143689-e390-463d-b486-ffd468be0805@oss.qualcomm.com>
 <b6287bf200500db6b8f358b22bfe99e7@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b6287bf200500db6b8f358b22bfe99e7@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX3uXNe6lGIKyO
 zuKAF7ZJX1/gIdZl639TZ7Zn6hoHg1cg2PyPQYcBqDk35E67M0O6kpWbykKn4GQaibr4R1D2oyw
 6trxrWphFLbTYg1/52RYg0ifP5cWs8AUkq1U/BI7s1vvCbve5yUL8xf+MFf4n9lzBqZxbeIsmbP
 2zxXrBeuz0jTl/c57PpASNvv/zv4Kk0ztBSKdHmSkUyv6JBt2Y/NrOV/KusZVprXLu50nkgOHx5
 Z3t+wx62gPocYYGDA9+7iuFjJFZ5m79zY3cUqKL/FiTnWyanXBSwjQ9NcMuohQS5JlhVph4Crch
 tMGqRIpQLn/fqLEkmCBM/gatQBcAoCr2RKHV6vSTMU7NLQZNuFP8anDAWXkf3uDynTjU/os3Ivs
 FiJRtBnUSwMtzsc2VQDJ7/hKY7PNUr4t6U9m0SyqUKNq50U6rppjK8CnpbY5Q2jb9YEjFaRf7ly
 mYlDZAOKJUFhVir73yw==
X-Proofpoint-GUID: G8kj4YsoyGpaI3GZ9dDMy9Tqj_l7j1WH
X-Proofpoint-ORIG-GUID: G8kj4YsoyGpaI3GZ9dDMy9Tqj_l7j1WH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7ktCG3j1Vq18
 1xmufYGQ+AN5dJwVi0WFPp71iFpXHHO92Zhrz0YFdRBezm+LPoe8B8vJbLbhuQPwrIEBs0uZFe1
 eDkFaZNSzJ8RpvSh1LC8IfrntIQQQyI=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08042e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ji1vl-U5_Nbu3xLppSoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 11/16/26 4:49 PM, Demeter Barna wrote:
> On 2026-11-16 15:02, Srinivas Kandagatla wrote:
>> If its easy, Could you try:
> 
> Tried it: mode 0 behaves the same as mode 23 and as without the patch.
> S24_LE playback is still 48 dB below S16_LE (the same samples shifted
> into bits 31:8 play at the S16_LE level), and S24_LE capture still

Thanks Demeter for trying out, am back to desk now, I got hold of db845c
and tested 24 bit playback i hit same issue.
Digging down, I learned that the dsp does support 24 bit in two modes.
1. 24 bit packed mode (S24_3LE)
2. 24 bit packed in 32 bit word but only msb aligned.

However linux does 2 with LSB alignment which is why we are hitting the
-48 DB.
Now I did some hacking and added support for S24_3LE which seems to fix
the -48db issue.

So i removed S24_LE and add S24_3LE rather than removing the total 24
bit support.

I will send the patches in next few mins, I would appreciate if you
could give it a spin and see if it helps.

--srini
> comes back in bits 31:8. So the mode doesn't seem to matter on this DSP.

