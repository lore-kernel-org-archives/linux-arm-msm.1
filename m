Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F98E4746A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786557405; cv=none; b=Pdd1ZUUIpkc5kKAXXe3sVKlvXrisOuECH0tHs5oC5sGydGW/3uUobUcGuZFlhXQDnx91++efF2t7Ynpm2w28h/gp+R+HPacKZ2UhB0RV48d9uhhbjcxk+7DF3oiR7pYKA/APXGAv9u7d+zqtbLo/o5awUMXOzPAk+nN25vPaGRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786557405; c=relaxed/simple;
	bh=Gp4TH8J2hlZSx7L5r/Nnct/d2wVRd7ZAb9se+pKxzz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4R6lQu110TrV4TSD0jhfVfg7LtKHc6Hl/bDmmxYRIVUXDFskeyl/KAO1pWzKdnu6pmajeU6cJm5BMd2U8ePQCW5zvKl+rhU2i6G4g7ikYThpvl4X9bINFG8tu3qisDbvu5V6nt1+NAKfp1WDwfR21nKazgD0dp4hpk7fEZSfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YnCOBEf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEzwIba8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YnCOBEf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEzwIba8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGqAd83164972
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7aPqzXzK+bffdypT6w5RZHf4yVPPVyPFUZRNwHMo/0=; b=YnCOBEf4xA0Xt3w0
	OiorpC7j/CjhdLOuryWiCjYc1KAtk3bOIOYW2zLjHPJIKK41LLThrTlgM/A7BdiR
	B9K1jcUq/bGeX/auKpbVM/RfZVzmBsXYEMYmu1jblrTz+g6Yhn8P9lGEg6cCwHMf
	4ezn89XqFRkAUyjFQGhfP/Vt1zqeQe6KY0rjYrqjmAz81+xoXH2vK/XpWlasLxKE
	i5d7FxfmvFjWZegc42e7sq1SxVw4Swsz5HHVORl93ophCWOZjvuOeipTeXRpxWyp
	SRVEOB9wHIrLfApw5onUzfWAeq7sdxUcTZrn2HHHWdKJCV05iT02V6x71czSMSAw
	yLQY3A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw3dp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 17:56:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso1657008a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786557402; x=1787162202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7aPqzXzK+bffdypT6w5RZHf4yVPPVyPFUZRNwHMo/0=;
        b=hEzwIba8auKrKhyR7tyen8nrBKoaSSxPsd0V75feE+IXPyuzm9oQfIs/6dRSgnqZPV
         s79GxyBVop84ZWY/0hG8RxGWRo+ZlnD+Ku0bqQUdq8ZuPCwxDQUFDnZZpjJeBzpy2iJC
         cQTyiW5PrS/f7bzdrPYco9GLVWVTjJvKl0Ng8mslQ5tM3buxN6y029NyguaqSWVBYG+M
         NZfQkPDKcrgQ6JDHRJ7tMEIEkPf3jbhYjCvN7gM9CwMQUAnqqLczuNum/cWudvTPM0Jr
         Ao3FVK10z4kaypmvAFVqpIFKOYrvF2atgbAj1/0Qak3uLgCKq/3oPFAbYbdklHUZM1Fo
         g1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786557402; x=1787162202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7aPqzXzK+bffdypT6w5RZHf4yVPPVyPFUZRNwHMo/0=;
        b=fyRnB2tuFOgx4RT4LXeyepassSmkiXgfPheVAHyDqbB+UTO+RNFr1FM6ZsDEPqygik
         /FwKHDlvuy6C2w91ieh2CLY8BgElXIhL/I6DQHPLBFPjnZmtmLPiMdLWGH7/Z8eS2vgh
         yqiFj6d+hhONel7W+UYShOyEAOzIwQ/+/JxbbApwoR3w8mp2SCttWavG9GIIMBNgF7/T
         TjHJ+7bJK0DCatDuVrd1qszrFTqtmhRn4Q2R+FqRgYsLptSf2aaOgTULzS+D4awQ816t
         HzPpQnY2NmbIlLrQbwk1ZD7fpHLZZxXwVfbA+YjJNuXhl4A4HIMMn1lbgAyjJ8T3NWNZ
         KTwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrScaC/7jfbtVIX9u5BHNVs/UOmS4LBXrdlJnniHPsFyQbaF45QlIfIP7JRikd+mXQWUM/TwBiS5z70Xqgq@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQsg5MYYpFyG83/g00oHz+tx/8SAh24GYkmr7OuxvBaUgEgSG
	eBaW3+FOIQWAM3Aoa8sqMYfCnz654Ng98wHvhHQxrZ2dQMToOfI2djhGuQATB60M59ACzWanULC
	6npucYziznFjuYTeZ1q99TiuLcTjSHlOuqEEScGgnjycUcr3VO8GXG8QvVgjLDeX1VG9t+S57GE
	Po
X-Gm-Gg: AR+sD10J7Zi0gTlMtlVf8N0qgJSu2xapNPpQtZRnYwO6HJcwIjGM0bxvA8urwtacFhD
	pdpqfTu+hwUzi+EuFy0JcY1/NusFvvk0TJPH0TcZGzZTTlJzZ02nxt2cwOgfm6jJ3uLtN0Puubh
	iTIKXcByu8mAW2mRpB2QlA/y8ueBh3fPpsIUxt8RAfd8hQaeKeCxMQCpq819glhNLyB6BdKYELt
	mTDN3we007v1UPX39d82aima4lKkN2tPrMgPs7SayxPGw1bAtjPMYHwGxUAaZnN9YJZZnPB9hUG
	mtecgyv/ub0mdk4TJ1sfDxg3w95CH06KDChgM17AYRVLQgWlNx+bqXIdruhxvwaPJJMHUwhTvWb
	gHju0MSJW32LUCnzanp4mWX4C4/q3Pfj1hoE=
X-Received: by 2002:a05:6a20:cd96:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3cc553f71d1mr184952637.31.1786557401811;
        Wed, 12 Aug 2026 10:56:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd96:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3cc553f71d1mr184894637.31.1786557401210;
        Wed, 12 Aug 2026 10:56:41 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.104])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef710cc24sm19799a12.20.2026.08.12.10.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:56:40 -0700 (PDT)
Message-ID: <e75f64cb-26a6-4b4a-9dab-6991634e2a0a@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:26:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: qcom-geni: add I2C frequency table for 32 MHz
 firmware-based SEs
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260812-ipq5424_i2c_scl_updates-v2-0-e09cd39d01d7@oss.qualcomm.com>
 <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5424_i2c_scl_updates-v2-2-e09cd39d01d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0NCBTYWx0ZWRfX60icWlwMLB8o
 qwaVaX5lGJcvqgassLe4dfZfZd/nSWYMwI9gktVOodFWGNuN8SiNx+obDV4csGUyP9x18NcJjje
 rB3YG5i+0wbSYi6aK2hG1kxdg7axgb4=
X-Proofpoint-GUID: 3zABV8nB906S0CLmbXKACeeIh-JignWU
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7cb3da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=hsRoOqe6K9Dtf6G3Ghy1+w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=eXSzwYDvwnVE6XuJA1gA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 3zABV8nB906S0CLmbXKACeeIh-JignWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0NCBTYWx0ZWRfX5CfG/JquP06K
 8A1RCeCc2NlQjlasVEitRVRBkQAfoJvUk2jWIT+K99wR0k1yDNSa7YHPfNHTEp7eljF6OBsji88
 yBwCOmfPkV0d56D6bMBzB0+Ye51JJO5bnwLEaogIaxO2zrNTUfwlo5sJwZYpu/d0Vokc9N/FNF0
 v65IYyyKxDxzIZTnODAPjkpMZR7Gus2v9KXoQE1CWc2dhjHkNZTC3tGD3RkHrUwG3fIrvCfvl/u
 ZzxRT8X3pbsEuWNeJoQvtKmEZqdRWfyD4LWWp8Y1hggetFRj1GX7C5n6dLxp8DVPS9f9NxBEYpH
 ep6rkX7/ZRgJcCorS/tWjygpphmIzWJa99prxfGQExOnYrAMxlca3sH9++ExuCRD/DVVqUOtSa5
 8kQ6r6xPxMO6DKz/6fxH1fU1NiK3mx3Mod3AW0k3mTGjy0SYXkXkKbRSstKCesBzfGLjQfvzINv
 krtCjsL4Rz821ytKdwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120144



On 8/12/2026 2:00 PM, Kathiravan Thirumoorthy wrote:
> On IPQ5424, the I2C controller can operate on both RTL-hardened SEs
> and firmware-based SEs. As documented in commit 506bb2ab0075
> ("i2c: qcom-geni: Support systems with 32MHz serial engine clock"),
> in IPQ5424 SEs use a 32 MHz source clock.
> 
> The existing frequency table does not provide the required SCL timing
> parameters for firmware-based SEs. Add a dedicated frequency table
> using the SCL counter values recommended by the hardware design team
> and select it for firmware-based SEs to achieve the target bus
> frequencies.
> 
> Move geni_i2c_clk_map_idx() from geni_i2c_resources_init() to
> geni_i2c_init() to ensure SE_HW_PARAM_2 is accessed only after the
> required clocks have been enabled.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
