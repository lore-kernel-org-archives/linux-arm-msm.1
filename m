Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB0F49E5CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436517; cv=none; b=elgqD9bNbqukS2Km0fvGzC7Pd2R94Cz6NByWu1+SIFeWxyiMLjB/KMj20sfqXqBYRuX+cctQN+DEbxCggn8DAaic3cDpfSI7Q0v1fRZl0jVZ8yZknyPTKuCcPKLX/truuoWKJrDOxogaa1NzjVR/kzp7dv3zmxr7fml427utzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436517; c=relaxed/simple;
	bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHiF1CCwjP1aTeC9unYhoqDrfEG7x+2gDFiq1hPZEsbNps9wSim3evUQI+y+u5bv0Iaiy8RMWb8sV3tvzk2ngnZMtsbZuOUUvi2wkgEV6jm2L5EuOFINwKaXP1YxgwwjhAjx0stbcPXf/4rSVsS11Yu0X1/z/zJxs4Wv0ympGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+9TsFqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiHivbj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+9TsFqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NdiHivbj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHBdY440196
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=; b=O+9TsFqGE6k363JD
	9dCl5iUaVqdw+Uclh1Y9mEV2kw5QjIsYEQHsfBNouNDUqBNanKxnvoO4qvURVb6Y
	tweP7l2SckV3qIF14Dg0GXiNhkLRxRXd3yr/3jdr1ZrFuFb8Y5UX1OloNRpOU37K
	H3GP4s1mYIa6oARjHZZFEf/wrUYXYggLVmkZYCRVfJQ7EyHzUmzby4kHAksf9HQC
	qUhjWwtipBC9lBFl8PV3lOtDCmrTLMwgsW18Y8QeZ7MWpQr1cUKTx65o3cD95G+b
	T5yMZ1QreIlqU1Aock/D31wolgVAx35NBhkL/P51lC5faZTW26HmOnIVcyoEqHUN
	EsnO+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p70eqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:55:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso54409485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436511; x=1789041311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=NdiHivbj4d7vqy8EIhZVv5+1etzmuImHPH2wiTt9O+95O5QBt63FErV+9MQJHvvKuW
         z9++AwvCppxW2W1XTgdj0iMCAgm0lRA14OLVVjNBnm5KvXmMstOs/l1YgnqeOof70x7W
         15i+8OeHKjmEzbk3myxoQmNJ+FjI5SM2I/gs95+190q9FeRpx19h6L7RgoTk9kVWI7wm
         UIOycGXKHMZRVlltetM5fiDuaZ+2tOWoMTCxSDTQnWmSKOxHNP5dt6oSnnr9euWPt6bn
         0P2HUaTDNCjZjO3APxBwrmwgNId4MKx8RQI27m5AkfuLrd0pYgwZuy8ogm6sDLeQHA/J
         MWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436511; x=1789041311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HE+3NgHU+iqphVmzJvVd/qUCV7WGbAwNsOGOo1O+UOs=;
        b=iNgjbOYoPXBls8mh2oM4eeywaPPKFtiphfAmriiUgbowmF55OClOYdnnpH/B7q9hFw
         KxIKgjjXXVwFnWUz6TxVc6n5YbYNDTpLyRpE2WLckvi+04yURyIBA3iPTd57yJOM9xEf
         gdoauwkZutOX0SOP1EFM6zQKLvq3EjDvkR8WIpPEgFJgPgJpKYdI5PIhx6Bi8nJF21A3
         fsQejbkGWb4KsMWNfAb1OA4pwjpy3jJtb5uOnK2igUMEmeDyILlG01Xad3vG9MougADY
         e8CURVHZFqBNJwVQlWdBn3/FYZgRp7dbSelg9B7M9WZ3LL+xcIBox7Wp25/eT+0+nXTT
         6lOw==
X-Gm-Message-State: AFuF++keKujl4vUIbFL8MX6TAn6OaWpviYQoJ4hfXccVbZZ3N59PzF6d
	bm44csxFbdwGX/BTpUWWA5us3+2y62SRJ2qGsURVy/uouUqWscEZw0pH1axH+VeKOiRJ8UnT7c4
	DmOiSb6Q9SwnhqDMg0illFPbOQvszEFapZDUP3NWLww7jlTJipzwQiEEwxMTJbYKQ6yqx
X-Gm-Gg: AYBFou1EFbus29EmjOPgD5CgNe/A0Fi47UeKrTjo+X6U8INFVmjJF2hSc6fSBNR4FL/
	7IRhaLPP1IW19XVCUiBDWjasr6RFcyOw8pZoaTpl9bnT4hkCga7fpGg2MGqjkj+Z9vcMMsme7c5
	m0OoLFvTMKPHTzJ6RaaBHexj6drZdV4GNmdFvt9bgIhWwpypT2HvYyJk8F3FZgFjbmVd1OzuUtV
	lypD16fgE5AuIuAUNVfRqvF/Yf6tiajECFZnOx1m9euflUDKL5wxyJPOoABXXiAOfWFHdS/KPDh
	2jNe7O1ShEpQCR9GPSvTrjvEy7qENviGJXHGBRGMkw+v8vLhnIm9en0zwc3Fpu2lZZi4QZEUEaJ
	do0k48oa/vsItkHpU9FSKxg==
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848199485a.3.1788436510844;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:939:4b2b:b831 with SMTP id af79cd13be357-93960f5b7dbmr848193585a.3.1788436510224;
        Thu, 03 Sep 2026 04:55:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm88150666b.59.2026.09.03.04.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:55:09 -0700 (PDT)
Message-ID: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Vq5dQuQEkip6v840BgQf4k6dHdKNQ-7
X-Proofpoint-ORIG-GUID: 7Vq5dQuQEkip6v840BgQf4k6dHdKNQ-7
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99601f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=zIksogJa38HEA0Sl8gkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXxdwNTC0wCjtX
 rScUPJU8r0I9EqIJc5sEQOk3EhUKDYLiDQmFyamLOco8uMfYhMREAJmy4TutLq2W7oqRkZXRsEn
 j6tlzLj44XLBQDCd7FKn5ep+Aa7s/9s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfX04Fgw8wgToow
 nR7RaVE4b1kNV+qu7YfL//vw/LjmZILmosZInwCzFmjV54vZshupgU32/jXQuJgHX8DYjQWGRrK
 Kuv+7mwNAlvyoBHbXvgHrC57kZzvS7//qZBGEUh6jTNQmJAUcKmJzCBOveLvoGxvyauEUW3w7j0
 NZVF5ZM8d6OJrsNNExiTABJ0Zcdlzbd+fxm/f8Szb4SplBcpt9NEC8jtkQqZppZ0UT9fyrZLlMl
 NYi06fYqHljmemMScruqB6vao/a/oB0mLR3GAY4amxlerB6/bszts0fKNn/0s3yr/d4DCo7ln86
 IBohHGWSGKsSosxqT00dY+6KvUnNpLqKqyx0WPRa4MJDpY7YHovC2NAMhoACWBly1mxSL7/aBRp
 AbpV602c79X9AF6v162Ozf4pUs08ej1OBZfTjVxaw6YKZ2Z2sMWH+GtIqOIRsgUBQ5rBVK+aNnE
 PXy2FadwuAqb57SVD5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030103

On 8/14/26 2:48 PM, Luo Jie wrote:
> Most CMN PLL output clocks are derived from the 12 GHz PLL output
> through a shared, physical /2 stage, ahead of any further per-clock
> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
> This /2 stage is present in the CMN PLL block on every SoC supported
> by this driver, not just IPQ5210.

I'm not sure how the mention of IPQ5210 here is significant

Konrad
