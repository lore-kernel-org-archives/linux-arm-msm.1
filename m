Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F623BFE2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025359; cv=none; b=qc9TCYhRRKGl0lX7tbCuLSljNDYNcy1FF/tm26CHI1JLDVJa8V+7G8oLwHmYKpj5BFT+QDAUOqAtRhJn0j051SKnLnrkIXO10TZ7K9vGc+IgoT6fG7Uv0XkR9tTi+Ld2P6gGspiw2iLwAwro79BotN76xvbBeP0wLknpJc0zIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025359; c=relaxed/simple;
	bh=ubn8C0i/LhdZcwBCfJzPdJhodrnW1sUuabb94kkckfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ip6nChddeiMqrEq0Ljvo7hkpFWn2IDCdKClLU71yLsMHDbDve+h+G1j/H+G1U4BFhNLYYti4DI3DCOs3oUW8UAEg1tnq5QJjPK4he8kmXTlPQ5sQxa3yp1iWqKui6WlaNo8UEqAgem+/3gNkcRW5jnIPXNwpIvabX6xcLzI5pFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aaj4bOj3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6CPs1P7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aaj4bOj3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6CPs1P7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GxK64142736
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=; b=Aaj4bOj320dR5D6v
	wbaN3MPQjYF7rVVSxVaKvfBKpJ8GOJKqqXXmIuHRDtLeWXMDo2ruaBFkxynLt+SV
	WlPxz86h1cN95ZVKExJwIK0lO8gmcgVZWBjrjQXHfo+JnNPXlZrb5w4y06BzN55+
	1GkPASd+1H+uSiJbw8/tlJ4EPBoHGCxoTpPZknCodatO+Q5a2E8EsQJqpO62SzW4
	f/WKKolBeVtani6d48+SFbA1KX/N5YXpFy2FKE8lSCvVwuyXkxaZo9lMtdvioNiH
	THwvmmi5cDQBoM/b2ebZzuFHwZBmN2xjXjB0qPRfO1y6vwntHaV43ZmyJ9Yi/4Qt
	TPhYdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd2kkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 07:29:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso122949185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 00:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025357; x=1789630157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=;
        b=Q6CPs1P7ke3lysN1ziBfN9IQGg9mtmtgrnhyM/YeBV1JBxHRR9sSabZ1m5ksCOqSfH
         7EfBlQ2fK3WlCU9zGP7HH+HPnQ8sG2cesLRLiuiSiX5ZRiOmW1cBnqPzOOukd1fNCaxG
         7uuZs4tEP0XWT5KfHW44xXexhWjvuaRGbfOxrYZj7lv2T8vxDOaHY0Oc2X5jcxhaLNoO
         0JeaaSi5a/bHDU+k3HNKXN8ZhCvCZNrsa5PV82DCE08zimhTKAvzrqY5tghFPSV59KDt
         dell2DPwgSuZ+lK0A7MyMDim6ehBxVxQlL+nv+NUJ2FhLuSb3I//cFqcdQxBS5xbEeov
         f/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025357; x=1789630157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YNz9aQncJ1CZpH4BcRbIvGfWFPMmLPfprY8Gmu0G7A=;
        b=rhu0MQtbQK6FF6EX1+3rDyFOauTBWkJ3+hHP1Tt4A8N6+829jLsp7Aqbjvn4ITYsIs
         gAkjRX9oeUZM2xsPUUNbxwvfrm691sJeTq0RLab5BqbwWka2cR0JZaWgvPMg2XUdyley
         mul9obrgJUvqNTE3qpd4+7Iz0PqSHhMYfo5H24iLwC6BC2QdB//nk5++elvlbPDZpsjW
         USixHsQ88BqA7cNynm79nFm6r4tZXsrDF0h4aK1iTSSgQRv4MbmClFUy3BHwpSUx5gHL
         yTN5+BpCIn/S1m/XWhQoaguP1Rdr00LujpQULZO64JZLNpPU+Xtwbvw4BKpQLVWNo5jt
         DuqA==
X-Forwarded-Encrypted: i=1; AKwUvBy7xwv6ih/YgYY36OicWfFe0c3fXvbD9qRG/fmpQcmBFUX4bO3UWEsvT7F7EQdfAcbWMHR0J9J4YaZLu7SL@vger.kernel.org
X-Gm-Message-State: AFuF++k2YAgqZheVq4PzNL0/672HRP5Qh8ZiSA9AhbiaeBCuUkWSu4l0
	YBWX6JpiP+1ZhfvoKgSY0C/3at9NMjeGx0N7vS2yjpSXWSkvTKOFhs1dcc3/ncEG01hHmzguP2J
	fCLecEEf7E7MMENX21kBaj//ljYb9fMLJxfLwPWvL39H8/bLo1PhcF0GmDQ/Bp9yF+MGh
X-Gm-Gg: AYBFou2kNy28jgHkO2i33miz2JiHiQ3xUjBCVHLo3vhm5gqzTN86WiROpvwBvdX82qv
	oSr3cZewz9G4XsaSIETk64VIVjatM6iG1QM9JMLrvnGbA7o8muezt8FJ0/rDwKn4EwkFtXBTXFs
	3Rth0CfTtaQHNYnNyiCWUS5FJDwvJ8PM6kqlGZrHABi55zFLhZM5+hTvou5icMl5z49dJBf9IgW
	ot/TTtM+LdtvPX0P0s+B8WMo/kSg+OHMVW8PTVrb8vchn/nagFIyc/iBXOpeJwCCODiud43EaUz
	YKF4sHjNlJDKJJwxhynKCH0L5TTIQS1h2hDcfVqLKy2uaMlXoAwTGitALCxXS7PdrJ5pjBUazGA
	3aFmlPLzp75Jnu5wfY0Hm4Q==
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr3078276485a.2.1789025356650;
        Thu, 10 Sep 2026 00:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:8bc:8826 with SMTP id af79cd13be357-93991702d25mr3078268985a.2.1789025355527;
        Thu, 10 Sep 2026 00:29:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e9aec296sm586663566b.28.2026.09.10.00.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:29:13 -0700 (PDT)
Message-ID: <678b6d96-6a61-4689-afc0-363b7a6f209c@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 09:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
 <smgyk5ray7laj2ltwnmx3r7cfiouj4hyn7tyfmx7rpsrhu7kin@p5pr7wdoprjn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <smgyk5ray7laj2ltwnmx3r7cfiouj4hyn7tyfmx7rpsrhu7kin@p5pr7wdoprjn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: loZr3_iz6cIQYtwuzD-NGCOJbrWUe53r
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa25c4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=XiBqvqFe6rftMWUyhawA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: loZr3_iz6cIQYtwuzD-NGCOJbrWUe53r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX37BpX+g+4T04
 AcUs8oPpAIv28bhFeBhrsBpCpwiwK4UQI3UOsvjdcPhWU0IqL5UAdzTJ3AS5V5CfUHdvygJ8RCJ
 FtWoJ8xIt5S5zMmzu9dMCxs9k23w87I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXy2++mJZ+28jl
 XPtwpsxIVJBtFnqEFWXzMooa/1LZRE2nSz+TButqIDGhT//3sIFhGkw3M/oTIgu85q8eB/PJiqp
 IItA6RRJXwo8myKPZLPAGRvNIGya0at9kCbEzJ5xD2oS0V4xH3nnfoJXu5sevuIhTh14Bm+N4v2
 aQBLrEpjDRuxUB92E8ApCmT/duYdM9LYi9kCfyyp+6d+vsyOPSNtWCUgMSZxdB8d0a+PkrQjdlA
 FFXTMOIEnlsusT+1pH5xV9SAqIIdTAfhhx0Ujb8pyXwAllet00QKs/O0a/KKJqwcetNl7hb2gR1
 IlMxC2VkYnIuJhzI97Kf6IzWRmv+p6g884cZjh2cWupHF5SfSDjBbBO8Dhnbqqab+R8HY3EJJHi
 qw9MPq8aX9PjZmvgIosWZdPP6sHpEyktWZvDy2r7VTo7mpQC4eBHBz9Rdfbq49vZ2Gj6QjbIEt0
 r1DxkhAdMYxatq10cYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100080

On 9/10/26 9:20 AM, Manivannan Sadhasivam wrote:
> On Wed, Sep 09, 2026 at 05:18:18PM +0530, Krishna Chaitanya Chundru wrote:
>> Nord requires a workaround to address a timing convergence issue in the
>> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
>> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.

[...]

>> +static const struct qcom_pcie_cfg cfg_nord = {
> 
> Can you use DWC IP version instead of SoC name?

I'd say it's fine given other implementations of the same DWC IP may not
have this clock gating quirk

Konrad
