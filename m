Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023950;
	b=jKzipaiC4ZXov9DLzK06o2aSEjfKuQE3Jf9HpnYOyn7l0lZfpVgggvnsa/XtdmqvB8fr
	 SM38Im+MLj14CTO897ZdcLo3Jr1+9fybi69u2INQfcsGPap1kNCzPdJwDrel1H4KE9a2R
	 7m7YcrRxbEMuEm8d2VUf1n3UOJYQmJUhZRzt8Dsle2757GXqzb+PZv281xpIbzYswWMH+
	 ibbHzwHcpP6kkhb6GewrUTz8AdUowIPrjPAdjZWEbu5W1Yt1A/MXCYwyPGZe1hW5o8wic
	 I/Z++Jcf+EsoN7yH9HrKSUwVtgtGAD4ctkef2WXQnsmhBqoqIlmLVjg3tLr3F8EddTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
	b=HgZB+7elPWMvMfGNlkhI9i+eh2xBcJdsqFj9tVJuSHfgkKFPA1UrfD0aopLzC3tu1SlI
	 Z9ObpKIjpyWp4te0J4nAfOiS6GuyEAJ5iROSSbh/dJmsinlNKm2SxRKh8tmQ0USBQq8EJ
	 qFsxlLhyPj6Woj/vCcXoN+rJrdGOrmpxrx+VemMmufoAX8prOuXMmACLqzSTyBQxTOFOs
	 NVXljhWSQy5LpdtPbaI3jUf+GgqqKWFZf8AkFkGvM+Z1oeP0mERalgfKfOGo2WDWkZEPd
	 /J0WMk0fxGrUc5oGjOwtR2s73xOaoU/yP90Ntw4HYe6aR6aX45lNl0InXANkMxFBhqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C228C606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C228C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D10w3nIp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWwrhlx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtGx53050539
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=; b=D10w3nIpFbkWiha/
	pHUGRcHj1bLSKe4AoVHQsMWsh6p1u47njClYFwQiltaQWWW6Dm0B3YeDkSQT6uWy
	84srggUKshvtPGri1NjFXY3pHmuducFV3fS7V06NTH9RGs+HVzG6CqU5EEOM5+3Q
	5ZXk7oAWsN72nDz2qRNRjwSyQgSaPhD0zg/cz0HK98KTyr7B8BeyTzKlyokhGatw
	4GSbKNE+7AyME0V7MoHx5XGarCc4juZ1IlTP8cypOPuCHfWVZkIC1lUVrUzqpdci
	nJHeHFqffJJGhHPFT1aVG5MyGcyyCpijvgrPzLXrR2p1/texYRCoNfpLFbMj8jUk
	/rgSCQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddagse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9909853d264so140862241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023948; x=1793628748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=SXWwrhlxRncp96F5A02KR52zVy9QWnWaiIPY/IQ48RHmxfj9uqPISmSgpkrMCARO4l
         28LinqX/rKDS40sLj6wz+37GPiwDL1MxyP+zbpDExEVqVEDehdjbNNQHDa91NufVonrE
         38L5Ow5zGj+h9uMvsCPI3GhSoqA1/aWNakiaDPwMqyVgMG9CD5occdJCMU9OsQn/j8e7
         wIuOr8vZhKpJrBf+rsKWjULIx47Tg/l791V3PYKNhqGbFkCi2zRS/eQ+ivS9hbihx9L2
         iBzD/7KHxjoyxOde4g7PHYx+5QiKSficb7YqiK/gDuHBq7m/Ck90YSBtj9+OECfwUjok
         1msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023948; x=1793628748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+S+mmWNNAXdCfolmnPRQKSIRG7gGMdoVyK8C7u3kFI=;
        b=p3NrNkmVRcZTyU9JJfsLXCGryH+H/fou3WkwtIATZdDBdMFQbvTCGCly8v4+ek8SJz
         GbpA9hWUJw9xY6W88mBpKzANSwERZbEnfzDPUucQq+Lw7dLmie7ekCskdpidHj7qHWuy
         DCiOs8RUQ3Onegbtxc7tpRbz2wO2uJQnZcptdd8t8nua+yAzNT0u0ElIdLuzjPIQDQFP
         vIKOFF09dqpzvkzTO0uXl5yItC65Irv38+B82BtXpwW4VbCRtSM/uIFRYA0c6U+u4rDA
         eOvw12n1T3d4HOOuq1pamBnXMW20QV07MgJBF+SSU/Sk89/Ep7LnWdKBkmTAlzPtXWvy
         CSwg==
X-Gm-Message-State: AFq9FYLa9w/gPgtWI28IJtzlCuzY3VWw42qQ4CVOtAbi/sYvjeRVRwOi
	0ON72z5Pw0CeuMs/5+r8E8QruGNGjYOsbTMH6ULWWA0yX0gTBZOxcIypWo2gYQmbkwp9MPnf93y
	wyuZqqlcK23pHy5L0f+V+kkxlNsxnr/bneFqiH/qrA9qDCl4uVI0YIaINSuq6jueFuDDz
X-Gm-Gg: AYBFou108OQSbuMVQF1A5Srp1SpzsZstzkvfGD6TBIcRqIDMPWthPMomPekI0Mg40Wo
	jPK7EPhFibHk2MQBGyxr9KfYnhCx1qxzMj8H5KEdTT830qr2HHb3hJDS6XusBKniMQd/EESlV7C
	IdEahrAeHPTaWotDCvyo2pO6by5ePYDmY4NR+sIQ6quvHjfqBjDavWn19eHA2IsAg9mq3EY2Wve
	7QehUIjW6jHzaCB1FQbgIcM2a7w3HCHF/sIS7o/9cjhoesvBxo98t/VIjsGjjEJEXmBgR3Xydru
	9a2Kw4jgSOF/YGkAdOHO8tqz077/nXTK1qslVVBk79gBR4VX+OCyv+vBg9/edliRUcLREo25HuF
	GPp6ye3Utk2h4RVxKctExVQ==
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934422e0c.5.1793023947995;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8c:20b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec2331473amr1934356e0c.5.1793023947243;
        Mon, 26 Oct 2026 07:12:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm324825266b.87.2026.10.26.07.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:25 -0700 (PDT)
Message-ID: <52b1a1c4-6e04-42b1-b868-2edb132d37d8@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:24 +0100
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
Subject: Re: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
 <e68177a7-f2ef-46ed-a468-15d0d9421d98@oss.qualcomm.com>
 <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddefe6d9-1a75-46f0-9ccb-10766729e04c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QtM-HLiJuLfRxoEf189ltSVkvCQ2n3oj
X-Proofpoint-GUID: QtM-HLiJuLfRxoEf189ltSVkvCQ2n3oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5IT62yQLFPzx
 SeLc/g7y1NAVJkEjDXmzpGuMCsRbcLq+HwSC4tmzLph++m6Smn/DJDn5vxzgR7NEWB9QIIJm4nv
 vSYxW0W4l2tcdU/shG16jQA08s7f+925uyJdeHS9g6/d2xHgedQjr1KfdUCQG4yYlP/ADhg7BfX
 iLAoWkr7jY59ufe77CDTALxWJfp7tl9h/yo7MRX/G+trAJUwp3rWw8D1swO4HIuAj7dkEHLoSxz
 BZcZ7Ql6PRqP59F+4qM1L0tI3ktl4m4jcOolTNFRq9T13ppa5oRXWxpA8mo8HUfYxnKoamYJb9i
 eZ2QK5alX82POmG7PgeLdyZM0BTLJa1kM3xt8PjJyF1U/PB5pI8Zx1HqtOLa/71uCDuyuRIpNNL
 CdwfT0EsyWjZOJxkWAqtFY8wbRxRNZKYGB/edDVntR5ngKRhB3MNfKUXOxu91LmFC61wXIYIywf
 z2KvP3efAqg90uZxCfw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf5fcc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zrBrzXTul4GvSfT2LqoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX8vf+9zUIEz9A
 sIvOQEXo/+q28aRmyBZ6JYvsz5FNkbIRyr5UREanTn7qJBhRbA3N86WKSaPmSIBEsuzOXgBZLCs
 pKNg19s1NfY4AcbrvTN0nk8r/KgeYes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/19/26 7:01 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:35 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

> And another point we should note is, the MFD cell name
> "qpnp-temp-alarm" used right now does not bind to our temp-alarm
> driver and this was intentional, as explained by Johan Hovold
> in his change (mfd: pm8008: Rework to match new DT binding),
> in the last paragraph of the commit message:
> 
>     Finally, note that the temperature alarm and GPIO subdrivers need some
>     minor rework before they can be used with non-SPMI devices like the
>     PM8008. The temperature alarm MFD cell name specifically uses a "qpnp"
>     rather than "spmi" prefix to prevent binding until the driver has been
>     updated.
> 
> Since these changes are not yet done, we cannot use
> temp-alarm for PM8008 or PM8010 over I2C for now.

I read that as one more reason to shave off said diff

Konrad
