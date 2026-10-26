Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997103;
	b=OvlpZ7MiSOmaX2JhIZHiG2++7EjDpk215NbFYAxZszmkX0XTLE3JKMMRlxMiCT/Nox97
	 Hsk+o6Gqvekqkd0Getzhwj6/xuVEoOmIM8EPOJ4SHD2kzgoox1HMeSAuqnNQV9t0LCohY
	 pen4xsS0GIMNOQl5rxVEoEytAPPlJ27QDC2KKVzHLpAfJG2DGRuKK9Bp3LajtJJ9qfCNU
	 S50izdxb5ccsdcKSAWLyjWChS/30TQDqTdhJNYkOAkq1tN/qQCW7LTmzxUoYGfnSkfhiU
	 pq8agJJuDvwmqg3BgIBi21Agj/zsvuOnfVpPG15VK+XJcY3sCh9X9IRzUftMpJdew3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
	b=abbNO6i/BShd14v7+au1XCA1Mz8uUk9GHrUzP1F2qeQPGFXbzWFTpR5rSegktN0n8drg
	 44s0p4bnh3jYaLEb/NCGtDPx+TqKplyc1eNYL6dRbEgyyMurR5RcRD2Jw1hlUxC6Ix1F+
	 O9tLYH3OUGZCeXGczXyxvF+qo5UCooqWUb8b52NkzFfQC/9rKYbqnGh23OSRNgSFGzo6C
	 eA1f9ZnyH/wy/aFD4APx1DsLn1ll8y2wR7kE+wekrSepgag13R0AkP1aDHwKxvnsmsmq0
	 nAcYfL8NSEPdOWQj6TWgUQkM+cNPmd+jDOvWcvnILulzcCGDcMgst+3hMgUIJuWCKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eg2Ts8/k";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD78606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD78606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eg2Ts8/k
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPNR2222515
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=; b=Ond4bT7d/9XO2XYd
	D6gexI/f1UnM23NhYQSn0iWE+hyBq1P4Ry9So30XS4D5Xe5Wk/qPglXGJKSMU/Qw
	2tOIKy542Ziy07Q5Gr/LEOblvKVXX1RU+xmD15kwe7ojv9GRGtJCF3WcdBYwZcQr
	zsYekdvvpKfeunB8rDmPPoc5i678Hlr1ffDApQJ18jZkEO5x2D6RqcQ6R+4dqovS
	9fBW+zpweKp8zWTgropoGb2TGd+a+Zxa1gWnYgPj9F/9va42YQn8953BSR1iPXzW
	IGAEiiIkWvzOIEJoa5/4pisnWma7oo/XdpJLPL28/ZuY63yUJ0JepNq0KL30yBa/
	ORDfWg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8w55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3662e7a9299so13998216eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997096; x=1793601896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=Eg2Ts8/kCe35YzpDLxXXo9pzNZptN2ipaJTOWdzCixkLYC1FIIS2Vm/hKoxrThfcLD
         yQvIdyLrf1w4qkZQQBtkvt6k7rX80scW1dXI1QAR4MHQ+xwh6NuXGUErnIShtrdZxMxg
         ik46YntHTzeUaaZ28fH5SlsID3UXBGc7/pyWPNzI0KWvCMZPkpU50Lfetgaagfz8e89H
         Yz23mtSyQUxyeTZoEmvYhgVy0jQVGviN0mbXyERUibxLlKWd1a361p6zYcneM7R80y53
         nNXLjzWu4ImKS3VU+gaP/+GDX24nM3S8KIGructeMZAmt9QaJVgzFUiny3ESFJRZTcVU
         So5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997096; x=1793601896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=KGeUWudE0bzo5E9GjrWTmhBnc3hzGKJhCTXA/HOboxaUpr47RBX8aakbTPkpyU1tz6
         tlPzZRdD9Muxn/DayNesnpy4ZcVtKBZ9kQ4sPlaCeqtsP4mVWEk0YEFRqTFDwgsSxtT1
         LCVD778Ckk1iazq0ohP7Aq1fxMahx//rdegR9U5DTJzE3CoMqwZVh4GbWKzY+0Itydg5
         Wu8UuF6Alp3YQnPZmPjUvpi9qoZCN/DyEaFLIFsFowzFFlFbcRASP1VQGQT4b9Xx0/4A
         Ct1pwZZA1Q8wIiDUX3V++UwFJ3nFTgKmPpnlbU8dqTpzR1kcVUKJCRhsAN/LnHnt3kli
         EByw==
X-Forwarded-Encrypted: i=1; AKwUvBwsOnOHtXRY24VE/rPB6TozizEDKuj4bcIKr++LEqXHdeNGmFUaqoQfeGs6wPGaEOh97lLJ5MwN/vHNZ8cg@vger.kernel.org
X-Gm-Message-State: AFq9FYI+zqU1dFWpL5N8SpTR8AHZHxtKkQLD4KKHqfGOvTZw7nFwjMmr
	HSHa1gf+8aCfsJ3hq0K0s4W8+Z4Q2CmJZhl0VQRJcUSv4ZZxkq7cJ0ZvZHYaJgEF3sL89QFogoR
	xtbwp88qt4Kb153xdjZA5hBdcyDz8x4+yA0hmz5taecefZWLgeYK2BXIysxvLsKOEUA7t
X-Gm-Gg: AYBFou3vXngyzUXJAZYtxC69fry2QtdzI2qZkMnlxYrurvLfD03SLz1yHXg8sWDJtba
	24g/LeNULIdApi/TTHus+MpSG0ePGURj6okaeWurI8s5yZWqUBtnf1yOVw4+Q0mUI6OGdnSfYUT
	uoVZAn7Y0SfKmS9nBLY5p5gtzcPafbB4pBJg48YjHpP1UDS4gmAwDxJj3hsu7fPgMuCEGem4dHr
	XgTZ3IR4V9UOW9waJ7YKxuxK4bkRtx0fW1wDA173g/yYA8nlfq+VCl4ERt4aX5+03m8RBN/eCU5
	37b96NKzVQkIN74iCWqKIJMAj0HJKRC8T6oGIfCTQ0VK3DdJ7New9g7Emj/4yibIBjI2hctQOQN
	Ntr+k9k5C6nuhrRBcEeFy
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097258eec.31.1792997095494;
        Sun, 25 Oct 2026 23:44:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097225eec.31.1792997094810;
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm14677674eec.15.2026.10.25.23.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Message-ID: <4a520c07-faa5-421a-913c-f75227491f08@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:14:48 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
 <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BVYxakTaNnT6_QYt53uhUAat-DXbai6u
X-Proofpoint-GUID: BVYxakTaNnT6_QYt53uhUAat-DXbai6u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfXzIGworw8VHiO
 IP8a/UkDehktT6YzjeS8IIdyTS6sZln6u11FEaEMti4A6Uxbm/thYQAq+51chyZdqkupio3oxzc
 emHQhSnas2pvVBl4sox0EzAkYtjU9gJuy9siBP0X5CAooc9t5KADrQmmsPXG3W5NRlJ0G67sQjI
 yFCv6i/AGhtvbIhq29N5WVsGYGyzz4+cs0uIaseSnVD6PG1Clg5COo4Ksj0O7c3aE7gC0xluiUS
 xDy+11XP1UcClwkThZx45LQ4mU21LWzCPDpNV+AGDrUxO8Vmq9HA8AesGh1aZB2whZnjCS8UcB9
 TzZbgB72s+BnbUKZ4PA8PPk+uigYTq5yMXHE8TKb+q1sy6X3lWHIoemzNHAUFGVmqWx18D8Kn0K
 4ZZGimy8L/JOebFhnNRUb5Wr4OKW8IohJ1Hn4iKWeq4o+/PIkBCMSMSSemmlIdDi28zZeJZtChk
 tCADaAwMlpyB2sq8aEw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef6e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=orbn77WvMtTVaJTH4VcA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfXxf7+aNCEQiRG
 v8Vp6W5AcPyb685D47fF/5U4OdTRO2SufTozQw9gIemUSswKHwyUMg3JwQ4F43UG4yqw/5mZcNK
 wD/Vu09bfLK+mRk970TK70lCTKG0UQc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026


On 10/22/2026 9:47 PM, Ajay Kumar Nandam wrote:
> 
> Nit: please keep the compatible list sorted alphabetically
sure thanks will update in V2.

Thanks and regards,
Karthik S
