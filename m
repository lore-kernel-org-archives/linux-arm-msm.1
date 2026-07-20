Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC13CCA13
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535999; cv=none; b=EFTRqxb0TQUVcqX842/5XD5TkI0fLweSON2UxpLQF+VzEhxewY1MzcKNGeVsnMOIx4pGGW9S7tueAS/wwGs7+jSe2ihYKbi10Xz1UHVrv91Ds6fH/OdXEfKLxpM6XXkCHfwDUUP20WTIIjBYv15HSgJec0ARACHPzdhO/reFwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535999; c=relaxed/simple;
	bh=GBF7KrHy3ln9XS/ee3pZ1AuSGTr1FRAzjvSsBHplr4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6/un2Jgn2OC409tkRMyAICkFeFA/QMeosE62+bQGhgU+GHZava8FTK2FTobB7Z9anE2ua3gWa6CKoFvVV/IdrH9Rj7Ou90nKQiNgNR2SMFhVSe4Ti2nAJRsud/2tSPc1mN918Ne5GkviZN6lxzVUB9PtF2DGSZLT9p18+C9jT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcg3ZrCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwjTOtWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcg3ZrCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwjTOtWa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RSLS1520047
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=; b=pcg3ZrCNOs6Pi9EK
	2wMLBp4Xz/zRAuYQFmJMbg76lWP+FisAfhVcG93JAemwkL7E/bnAlupzIap3SF3y
	izdCeMP6H1dLj65/UjQIcsi/31tWJbRd5tmwILsBKm4CmmEJBlFUzXz6uqX6Obsw
	bdqJcVrVEckXIoMO63xQR4tRLnwHugGiJCelvKnS+2gDVasV23YezOZYsN5fJ1UR
	44hO9j3oMHKhngiIYtGzqDtjeqOPJ0Fp/Nkrdfu3R/IcOCl8jf5RPzZw6e8Zgd9M
	qA8qYqJomH/0ZMBV1DQ8vGlZHXUhCYq7kKUFYs0cwzCKN0z1VAsoKGps55oLKEVT
	kMYODw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn5ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so19236621cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535995; x=1785140795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=UwjTOtWahtLWWSg2afgt0juV+vKTvloL9GJUqV7PXU62IfgnmucSK3ssL0CfnGWNfT
         Vqre9dMwoMBGkpwgjk4ErMbBc/O8bJHkljPr4loeqIKrgrkV3vbA9GHX87Tc7E7EQ72O
         +5hB3+6mABP9Ij66CElJ1YfmbY2LF2fiJwwYgyDe1wS4My0C0y3ac0s1giwIYmxFou9S
         xDZyWzqgoTJi5jc1YPQzEiEdf6NUQ7b4hfqYEiM1jGo6T9eFWOaCOXiwXr4RP4pWFY6o
         ijt53FlQNCrV7ibrSsyNraZfHogfqW6SPq0MWpLeXBpgxKucVDZCFCZH0SInihNH9UC9
         yXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535995; x=1785140795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=S64cFdrTivXpRIoqjTgLiki/tEA/QWbdXM4T+jEReGNESloCNTe1f3H4Fptt0nqngR
         vRW2xuvV2eOcKUASDvtfyMr10/G1aKpSdXyzmX1dzos0SjDYocTyOFaUY+fDcvP3tCTF
         Dnijp2BQCZbgqFLP7n6TtuRfF0lBb10216gz1ImPprEXaZplfYuDzqSHNo5+lZxh0zux
         PTmhchc1t6yz1E9nrBokJQdIX3vtVpPeHywAGfZz9fFvgU/hZnnHs3LNUtjW4P1tBMua
         tZVjZvfqkCvoZSZTqQJr3S2HcgHY9dD93gXmSkd5zyEfZ3HsxMdgkux8FzSxkO7L8d3M
         7OAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeZn+EnpPyEpoZutQYkVoghCzqM+sktIqZOaSebzou2jpZl8PxeebFUF46HmhEtFLMQg42N6nKsgigGjmw@vger.kernel.org
X-Gm-Message-State: AOJu0YzsmKBylV5F9ne7NAyvHBJCl5WrKPiY9OLNJ8J1pRNJYenLSl0W
	Pm+1vTErFQzvJigxPRZfjoqnIWCYJlTau7B+fsesqTiPKYhwIhByrui87F9dKaWGtkq0xfwUBcK
	72mitD3lfG0RWzcwMcPqh5eXr8JtGH8L8EDtlDg4yOi/6yf3BvBUJnAoYSBVC36glMSV2
X-Gm-Gg: AfdE7cml5QscbAwvAIUiRpszuWqF7kRSgXTAhsKWsh8mvn52EhTak/3QHxGTKyu5jbs
	tBINFngzRgLWxy2liWFIYD8mVXHN17+TR4XrQqXbRvJtALN41mYib6T96eDydQ5qcuyl/zARJpb
	Jw7fnAOeio9n9eW0EgI8A+SlTVbtcevaAePnfv0tC10X0i+grbiYTBHwYzONe2P/5odvpiqgLAV
	JvBLzSyaZWrPLZxdt/cZmCieBq2ZKAteFBJsxPiIQcpv9gtHGddcNmEhZ9Jccd4R00uocYF8hvW
	2ANmlopgxRP1ZKlCBXPdlTnbe8at4K8Sn7nnCTjShfTNZcHoqpMEzF6Cfb6dNwg8wdARbpfUQgP
	F6ITv+RIdBR3utR8RSvSdDzmz
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968641cf.5.1784535995686;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968451cf.5.1784535995230;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfdcsm415561566b.4.2026.07.20.01.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:26:34 -0700 (PDT)
Message-ID: <acc0280e-248b-44b8-9300-86dd32b8f160@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:26:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX6u0qexcuXIT2
 fvvSV221Ap0G1G3RZxvHNddlR9oPjBNrpbEpXHY7gpCiMR1lusKdy+ScJmCZgJmK2muLqWeGHvf
 pwSkSxiSU4Ib1u6c7MwK69mx0TllZPQ=
X-Proofpoint-GUID: P4A0sOye9vW5JhQu2KEpUv4aFMyYHEbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfXyu7iL9GlLhW0
 NCIqdPpj+/jM/OeieiN9Fv4VuYLwrqDlJmGC0Kilz3woVynbXQ16fJkqczYM6Zz1X9+7U4qzKXe
 y5U1iCkfmjSJuerpmju5oJPCs83tHXBdYWjbJV3ufNL4iCmddRp/2T+dd0KtfD/G2CDIwCmxUl7
 EhsTGkmfV2l2uXFP7sd2Gz6/qfWnlkEB9AuS+UFDn2AcvbF77bKEJLfadOkcY2nRfv+iz6qftzh
 wglJp9BdaWqYUHm4NkX9gI6b/qsyBZFEhAyYGgaXIxw4vHOYmcL2EElbUHRWLfkCVGpSFWsVvWf
 x9AXczMDy2BiFoXrJvkZES0txgzI/xh/piBMYYy/2BAuk1ZeEbvZCTXvduOTntUKxO6nCSwPKDh
 VMoOqK7RaWKpStrNWHDfBEec0BJthvf223+ZY8mPnO9jMUJPBdn3YevGsLOTbIJIgA1f+yvEsjE
 E+0BxtVflCd+SuSsPng==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5ddbbc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: P4A0sOye9vW5JhQu2KEpUv4aFMyYHEbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093

On 7/19/26 8:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.

Progress!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
