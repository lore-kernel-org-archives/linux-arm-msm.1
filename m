Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC0242AF93
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893392; cv=none; b=FKr2NPP6/8uH/rJWNyplIj5mdcRagA+Opf656uWsl3xo9FptK2632VmuXzzQszjb3fghh1V+J1DmKf02n7zypcIM4p3fwLX47uQSIKce2oq/5obMeqX5wfsL2gG7xGVN6w+YzFu5q2VcfGJjZ+5sc4y8lt+XVyTuwH+wwa5cC0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893392; c=relaxed/simple;
	bh=sQ5bP52hJaaSICUm2kfIumA2+NEEEny4Sr1SvkemHFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=My1MnKsYyaggFYU+IV8I2Z16wDkbAMTdX4aCj12CjSdd15t0R20Y8qNIBDLOaTkQpWDQzbFugK2EPj58VVo+tNg2bFQOB1MZ31bOiDdkY7FhwNfcvQ435P1eBW2Vjf+o4FIBXzK+h8LZq8MQT0Ds+QTC8zqKZ5Auadb2TO4wV58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDBxCCeN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JERjd1W/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDBxCCeN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JERjd1W/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADX3M2478968
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=; b=cDBxCCeNEwLP6kIk
	5odYqr0BAzRDnBmahudUV0Kca4hnMCGgyo7REfltO3+IPq8+Wu1tSXR/28Kw/k37
	RfQNJtynMbVI8i6LNNlr846jPUYKhh98wGXHsVeANFqIJCogFocMB27G+8l3csDc
	kR2eU7/D08FEPszj2aF8HBF12oeFfn12uqtCbhgNdSWgcYM5CB+n5Fa6cv5GSvDV
	Z9fxdKYmOoQUvNAwN6Hz1jI2SlpgRsgzSDFUWaL03ivJUQkaKDRxHyJAP7gavFSC
	JHhOznQLxNoLqCz8gyA2bXgkF3pGQKDh49nuuB16NzOU0sTFJ1XT6FQ6i9kLYapg
	EFjpaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx99j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:43:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93163ac056aso2175485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893382; x=1785498182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=;
        b=JERjd1W/Aftio6BAVGPNpe6Rw9xoyfr1XePzhK5DvgTomAXTyVW9IUAY8O4YR6Ngck
         nTdJdKyx2T7dX8vBldMcE4y7rzDDCWdQ3iLooGbbG7QhUaBf3Jvb4zVxdyXAbK24AfHM
         jIGwU8nlDXSKlzCNo2rnnsWq9i0rE/mDX22TZ60pZUDBSKFnpfqCEG67bjB15r60fYOQ
         cmMZ29GCWMkbEOcYHy9j9DKmBXe15kIHa8Y/ZCF4qfwxCWQydIGRSuQS6nrT2qlU5LgV
         97vIwq1ThIw/Mu/DN8LJYoJ7ABKhvIqeeJLg2E6OdblFmlKp+k51LlaCX9Z7yQWlIESK
         coPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893382; x=1785498182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yAXxwW20hTaXjkym2BKgDQnKa+6hryAXlCmzmNcVFEA=;
        b=hZS309trrfLZxOk+QG7QvvWeM6V5g/upeIh3J71hUAucs89zbxuVCZs67fmSYstfqy
         wlmKMjHJZCZkPC8d7VLOsaPqdsGo0W/vC92lDXzjYki/uFxBUThP+3X/t4eElPVwfnZM
         5o82ivZeOgN2hYstVrst5nQYfPCMxJ71VTshBerFKextUWlPtavIhyun9IalQerYolPX
         3H5+Jq26pQs8rWE9rwpLJCoX6p1jcf2FkSOpVdTkyBUvA5I/tpOIaPrTXtAvmMUcd7Gv
         blhVBiX9YoaM2yoBuXqYhJLwITDrhBqw/1jeaLbzzGa/Bu4j+QkX6wC4ryMPKYRu77dF
         uh6A==
X-Forwarded-Encrypted: i=1; AHgh+RqFOLQpFAuY5LjjsqXP2L4GGufHVpV1X3qoROEsi2UzTCXdmhgHFM+g/1EtHCtoUVu9tpeof333AbOaQtf3@vger.kernel.org
X-Gm-Message-State: AOJu0YzniCTL5eGTV6jIJajgTzMcw4/37YkBAS1rhsN97k5YL4ApT+l6
	WvMz9INHvF3+c3Y+KpB3QW395+tqGxNnteL0nsoTGHVq4GXTrq5AuYNdyEJ8kUcDaGg0VNAqxX/
	5neZQgMtBUOfUHMP6ntr/5TrC15clAkpvf7+vYLU6YOMY6jEIiDoZ+OdYCYtjdIEMAg7n
X-Gm-Gg: AR+sD13IkPhupAqEp918/NEpprNDO9zF/AOrWKynudKzwO6C0kigo2UVm6VZzpzEb0r
	Lkv6p7rERYrQ0AZrdtr9/kZVo+/0nxcgAJ4wiNBrHn6d7P85oy6sp1OUwB6STNQbYlSKZJmr6Cu
	pyPKr8mYT6Kg8+1tmZkjKwVoFS6Wtjy99C5i4cwAjDKoA4+9+o06PE35WOX2NCcowIwTe2r6NTQ
	Es7sIROPsaZfi/NCYPeNs6WH6uQw5NqgHQY/85KBm/qumVYsiiOjoBHGgaDP9DfXVkB67pS92Ng
	fMaz3HKM53PLgKTHR7XgnG9pHmy+GO0rcuipN5jMhIDBxW+LBNAUFZv3YcThO2zKJD9E7VGSo2E
	8RO2Y4BZoHknVO+xy5NSHuBVx
X-Received: by 2002:a05:620a:8391:b0:930:a08c:cf9c with SMTP id af79cd13be357-9315b4b184dmr311128885a.2.1784893382193;
        Fri, 24 Jul 2026 04:43:02 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:930:a08c:cf9c with SMTP id af79cd13be357-9315b4b184dmr311126685a.2.1784893381763;
        Fri, 24 Jul 2026 04:43:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f13c96sm337903066b.62.2026.07.24.04.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:43:01 -0700 (PDT)
Message-ID: <111bfc31-7f02-4875-ab58-e92bf1ccc44d@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 13:42:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: monaco: Fix CSI I2C controllers default bus
 frequency
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723114844.63093-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0iM0CQLuL3zEA3fBTG7wxSiOQ_48JO_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNiBTYWx0ZWRfX/cQ/HJytW1ZU
 /R9RobD/3vZ93vrJJcpbeHBhOzb9G9I12CAAB+9oUPX6ufclaDvIZT3hGAH/B7JrbYImKvJ7bP2
 m82S7hI5I7x/ZA2KlpSlvGz122amgHt7gbg/74tj4pQn8RSICL1ouq+YHNAjRj9Ev8cwoPL9voB
 Q1huUvbVeX8DHJZkUeZTDrkrjmrI1DRvWaY4ngvWDACNdaYcQyDUnBFf5bZIfv43SVM6x48gwqk
 tEuQK97VFP1fXXmHoUcTgnnGg8lCyHpSAH66ELEyEW9NFzHfyTqhoze+oB7PHECOh/aZrVj/W+U
 wh+SXDEv7T6eur8BtqWTUidDsDJt7l8hiyTplsUubxHrDwiAXxTl9MewNRz69lXL6/qDcnJHAt8
 JLTS35grZM426NVeUzdec/a0Ua+X6p4/fkTWSDONEe622J825c3qwnJEebc10dWodIz1BX0EPET
 64gC4Oxydl9GxJGSAtg==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a634fc7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ijbrBXpPH2tVBiyNKBIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 0iM0CQLuL3zEA3fBTG7wxSiOQ_48JO_2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNiBTYWx0ZWRfX0STbXptIITND
 VQWBSz6dJeQON41TzIcOeZqTQf3vmXCeuRCws9OQzWGMVOMvQKahdKcp3WaAtG97Ijafq0e2oob
 QK+uCqaM8ETTUFXDoQ+0XqrY0SA9Cvo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240106

On 7/23/26 1:48 PM, Hans de Goede wrote:
> 1 MHz is quite fast for an I2C bus and not necessarly reliable, change this
> to 400 KHz which is a more reasonable default.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>


I guess this is a question of what's more common among client
devices. I assume you have some that aren't happy with 1 MHz?

Konrad
