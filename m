Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832366;
	b=N5avg4Zw9Qkf/TbgDLeCHnbyUGG4bdChpjeFm/1qQK/FoWHMhtn7q/afFvh5vnK7wwDQ
	 rC7WjN6wokvpZbyTSZe0dAkdUe41ux3WWCRnh4SDqQLvlzQKOxME3hUVYzC3r0SfGjMgs
	 eWbm2Pr+ApQDxP5UzmrcsyjUUlsU6ZiNLz02d+myqjoi0IWZYhp12iKVeLcOvhifIdGZn
	 lzIa6iuSEbZ0ZxhDK1t0nkVGmIzAPmnnUdoegLD6BdcxOPn55u43ei6tHIcvX0Xd76yJe
	 SF/Xa4grz//Usdz6OAd5R0rkpSd6+Ta0s6ef0BfkCoFmSm0O8q76rvii5LbZ8S3h0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
	b=2XeP4b9X0jZ4YTvYqBuURGVeG29qeoyIXwOYPi1iSY2atGoPNBhJ25fBeA8NOlSlcRxY
	 LajO3KmTIYDDQ+qqYayZptOWzKePZsSNFskO0PIsHbSjnHppQZ5I8o1Yh/Cj/TyGlRcTT
	 T0IIsf3ascas53nBDrYinFhXUGqnxs75dNb0N6hZ0h9YGGlB8TghnOfO1jhM0JYEsHAZC
	 gxlUMFKcLyK1Xgc4GHvvVO7iBd51RSSpNPru1hZaDt3AKSRqEATb7brDqboATr2l+2llj
	 hpzlDukThRvFXbOxSPy5ciNPpg6g9gZ8R8/UcTIeotgVTfDDjzoWZ0fmIlGUywA9pKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9402606A33E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9402606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RNC3a1rC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQVeOJS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1Bwn3770870
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=; b=RNC3a1rCFItRQEKS
	NsN3B55/yQpgxTY8JmxABTsBARg+jQ+85Hz1JCyNBbPbMUStFxS3vHf+5jwUFZVC
	7RaWHqWeLg40NFhzQFRsI+ZwdsTwVI7g7K6AHST1Odu0BG6JQMJ3sD2VHHm2iAlA
	cZHO78ZBa5WveYkC0yGVzuNsjzg4EPEn3TsdZUe3OTS3hcacvhmhQu54cXy64PPH
	kMxysg98xx/KP2/AFgDEp4ZCvH7+OZvvPDp9JYq7SJv5kp7yRyzYEObaTEGVuTRN
	kmYJOBX+LUqgqJ7QXcZDAjRmZGDu8E8He42maR47VXAq8qXZRE1iUXKPsPiFULIi
	p30IEQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggn5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:32:44 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso1174310241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794832364; x=1795437164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=ViQVeOJS3q76jgQ/AIqwaFL3aCc7toq+ZnHN+zMXXOaHNCvcKeOaZD5vPTD5Kbvmd7
         aPwPwdzViMOMZftvlwH9cwU5kIbDL4vpPgEjho5zgZZin1BTq41IH9+IPd9JKU09MDoA
         2YBicTKbQuLYo6H9juXiuYV1C4fcJbS92Q0kPjYBA/rCBKZGr3kTf6exPZtVlKPdZSvD
         xSVNnFh67MeuwNX1rhdhXiUCwS9+bJsUA42J2zCY0OrIsh3BbDGQSMr8Am1t9jxRqvNx
         2POQdsJGhJHul7QcYWbLwjlIAh2k/W/uE6upPk/eaAM2EnCiIuTMd2BtHx+9T3S3fP58
         GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832364; x=1795437164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WII0MZe4V8AB4vNIJ6rCrBDurHS+ljsTGBO1qOBgGTs=;
        b=urJv1lWDlwh+lRnRJlyTULx1o6G9XpoDWzzA79M0wWUfFUUwcP1X+bezyi4NJbSFXk
         tUUl7k1sHE4G1NChwfhuyIjWP4+jo80jEjPjzWQk6h/jA0Nc8Vtda/zb8dQNowrVzAl8
         8XcteplMrgI2aQ23b0ike1Ls+oXA+9QybTUD+ywlczID5MfTNb/cra54Mmti2X6tHAa/
         qEPxap6+kNxfEr2RFBctSDzgOeqZEmIz6O2fphWA82bnOc0e1zNkFaESw4lg4VCggFjL
         LRvqRTi+MG0ez6PCsKIqkthMfjySdZVDKjDOJV9Q+LZfaoOClBN9WczfroWOaVIhnpct
         oSVQ==
X-Forwarded-Encrypted: i=1; AL+hErH/BeFDC+ItdVOZzBpRoDnI/sYgMUh8NEIDi/4/cDWT8TTT/4Av04QIa4FN5yuKVZzQkXjen5slu4bnT1Rw@vger.kernel.org
X-Gm-Message-State: APuU4Z+LSfjvJEP1an6LZ+LaGmuTg+l0BjHhvNPMuKtAXK8X87PDLIdZ
	rh2bCtE/EU42aRuJ0uIGxwxm81lvOmDoww4PD013h6tg/6jtW102Tz7M57fd69IVpY0L2ISMxbe
	rQBMaOtKEJ7wR3xOuDbQ4tWEqOl5apgog4+9fqu4AWCP9BHw2xtZhlsPlW3nBnfmc4u6R
X-Gm-Gg: AYBFou1loUzq0jWZ5HU16j4z6Sa0rkTULVOIBNWoZMLDu+lhsoPFTn15fl1iudwSdPq
	izkSZ0AewDZ6e/TSHHi4kiXY9NMmtfitIJPGcK9IC/cDyZprrf4XjtYymOnBLTkFkso98hupX8c
	zInMyKvcp/Lo1mYrjA87AWSb9RoVc+yVCG4e2VHUzsdKP40zzKJnr8bmIelvtmfOfeKYHIjQ49x
	niXZm8zw9KPMgSed6RYpz4v5eOYK9wqAtPSFq6hikGQix7LtIB8eRpOsjNo/1wHHYR+yFgUYnsD
	70l7LPkUimwhWlwwgIjyJbc1kzVY4Y91b+Z7zFSSnHN7bhEynlo36dxRPLvPLb0pihkR6B/kmEw
	Z51CgXmM5FF/jz0l/Q3lA7H7FOo1QoX8qNBNiJAK/d0mr8XRWYX01YpzsCjgNrty0r9klptgOcw
	57
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888661137.14.1794832363914;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
X-Received: by 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3888630137.14.1794832363350;
        Mon, 16 Nov 2026 04:32:43 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64c4f6d8esm6654021137.9.2026.11.16.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 04:32:41 -0800 (PST)
Message-ID: <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:02:34 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX4nRlNcXpD25V
 WPrBpi6lEK7Y6DMkH7xufCLKy4h4d4I5KRW7EbSlfEhGTREVxISNXMKkltCNEZPTMTYQQjgk8Wy
 dWiJNr2IHhk109ejG/az8LUOpMFHVq4wLE5OY0f7UJ7eoCXPrj2eI1foLoCC5+V1yeOQ92bn9n+
 kNDUVVjjNprpPuvypOWmZC4ZFopH9al//FW4e6YJYK87Z3iLnXgqvWGXluf0QPNTrfbcHXWZteL
 0AmITpWHByMKH+w3l/pbO0RdZ92Y+GhULPaTGExSEnkVOZF/JDmFxym8hAKRCrDDW2iRkMIL4/1
 oiQmt9fAWkorHsHHJwEt5f49VkHbVs1F5olQogzy2UENqHEW+ffHSYSIgm6HNrcFK+R3RbEVR/U
 cFnkad0qv10jaNr681xjdBbL7Yr4k0OG2vltHt6AnrS7YAx+UL6yf9D0cFN0/zdKyWkspfQFFKQ
 3lngcK9W16BCBDuA2oA==
X-Proofpoint-GUID: StPRg_LCuVzZcPTYFFf9Stz9BFIzItc7
X-Proofpoint-ORIG-GUID: StPRg_LCuVzZcPTYFFf9Stz9BFIzItc7
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaf7ec cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YRl-4mzKpuH306CQ8RIA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OSBTYWx0ZWRfX2I736VkCs/5Y
 hoHyumu2YC9mfJgdiRLqiBUFNidz74Xv+oYypcu3tWoZnkYTitO5sYlM8OeGSXYVyHkYgSOiKU+
 3bvk4R/Ikn6az4MHRJxwauS/rlHljfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160049



On 16-11-2026 17:52, Krzysztof Kozlowski wrote:
>> It was not used in-tree yet. 
> That's different question. You added ABI and that ABI could have been
> used. Was the ABI ever correct in the first place?

The documented ABI was not correct: port@3 came from the old X1E80100
resource-table mapping, not from the Glymur CAMSS port layout.

-- 
Regards,
Nihal Kumar Gupta

