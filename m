Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF7A3B6C08
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735406; cv=none; b=lmM+OO6FUGmG0DevPSrVOnobP7L/Ll0wSHheTXivKYgNFEyhagfxWZE/1iqt4TbUb7KIHSFjAWWA0LTe2GcqVWepuDOcXOhdN29roQqG+ZXdLFdW7zWEPdFF+tU169Bh6z5X+YB/1VWB4aZmoZkE5UxbFejrZuyineQUAoSqZu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735406; c=relaxed/simple;
	bh=AyjFtY3csFRXy4H6R6hXVNcIxtFQBFu+h3kPvhZfDSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UXYQ85CzBIrt9+sNtG7MlYUgcLedkxy/me62sJ4qfNgPFeLAb7Y7ZnmStreqi/i6oUo6tMAbtabIihgd2n6V1fE45RWmXEw0cec731y2p0orLDk9BzmwRrA3ShF/7qso0Q/Gc7NDFsBziNbt2FfyhsHyoBewm7S5swPC3FSjdk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6P4q7Pj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEWiEaRD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6P4q7Pj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEWiEaRD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RhPe3689404
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/67xIR1QaNXv4zcrkqRbXir482ph/0rua1g9RHT4gQs=; b=I6P4q7Pj6hK9tYdX
	8cnqnfwuHssjybjT50xZr19g1PygTMi1NrnLwyxdSiiVhmsfv8oJtNFlVE5vZFp4
	IPq2CRFY8LE5WKVEg9fvUtEWGgK/mqXx5oh25WUByyLhgIkWZEJqQ0dT0bpX/zFH
	u8aJEJm9CM4SR6oH60b/A3Yt0JjFgaqZ87WIZvIZy832mVc1VLvb6A7lBSi7lgke
	wMgXnw0ta7OxI8We8t0RDoRqJ05m5LQQkDrTng6V1eHG2OlUhASB4iZwCvia+/a6
	LLxdx2nBm1fPHcuEyQsjXq2rqXZqXhQt8ybifYV6joD82WsEGTgOx62TGtw7OGQt
	uW/8/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn33n8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 09:10:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so16613185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787735403; x=1788340203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/67xIR1QaNXv4zcrkqRbXir482ph/0rua1g9RHT4gQs=;
        b=VEWiEaRDuxGPhjCfcD2o/YE0EbjAmC+Pa1eZM31NVhKK5YLsT0ppaJz28tOqcJzkYf
         n4xBhB7KFi5/TJnzb6QXgd/fH4daR/a+hM3/XNcMRgNlwd4Skl82KeKRJ93uJ2mF++YV
         +yJwSEFK/dUQJkLvfgnTORZL6Oow6sPMSktPCXlAkxKzJyPWSg3mXMc9qc9myR+GU7+X
         vIEhPQ6Aa5v4rYP0wkxHP4XQN2TRY3UrW22wPx0CF8JZzCeXtHPuHT7k/EhbuPrm2T5W
         KTaug1AlTil5mqSJHJp0bCwXRJv7jWHY1aP4hV3OckwWJiBftcmuGv/nkCxNQAsrnEIg
         0CXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735403; x=1788340203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/67xIR1QaNXv4zcrkqRbXir482ph/0rua1g9RHT4gQs=;
        b=eL+HpNKrFjO/ofRsh3O+0c48XyOJkYRN0UU9LSfJMneInRLgBHta1z3gVa4tGm5KXG
         3HOu5N7p6OsKYIfNlu+PKM+Mp5ZXuJplTF05zElLem5mxe5bMuu5dMJTc7v01n/rgWDz
         jqlqX4Djf6IUsi3uANIlap/KtdEDy9R8NykVZdyaDxwjH1xZNLzpnicVHvhyL/SuMMak
         lY65L7UrO7gaQv1tAX+Ubfo67F0XoHp1svW0mEzIKUXAcYjO/QyegY3gLPCaZHFW/+br
         Ae9WSWCCYllis3fwFqkr6dQDvaUL18M92IibbpofjEnCE0JeJmpuspF4POjw+MjtGnow
         oCtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8o9Tk8roAUpnxupR42P+OGsrAiGLoQSNrYuu7Iv7pjiNmpJsTzrpGzv2gIV7PhW8/AYiuSTrSV9raX+/B@vger.kernel.org
X-Gm-Message-State: AFuF++nvXnoLCol1hzfaPBs/4HDWgvwU3jzqrtV5Fs/LjQRpSwX3utAl
	H5p035PvKC4T7HeKEesePr52MG7l2HXdAI0iDrViNph+59U0v3f2dfKlx6/aRay7irxzep+Kw1W
	i8XtHmJC4cerEftWxtrlHljteZ7Hb4FCaSSJ9tip/VYCesconT2K7YtGWS27Kn9tr+7CW
X-Gm-Gg: AR+sD11yNzUU7FcfghB0IiiDKpFZdmVCP1X91hAuXCkLI2k56jTaia2T4XrcddSmUuz
	D8wB2Gcr/NBrvnXqjXCZczaQHNYY/aEQj4dFkuFJTHmS0497VSDg8hvY0XnLKV0LGpBi4hM2FHH
	I9kGWxQur8WPNaoFzl4hwQWhdSu5SQ9NDmqzvvy5a8beuwf23ncr32vvV277lRfXW2iKbZFMZwC
	zfcx5QMJsPddRI/GOtqgaYoKnRD2S240Hs8VHwvehLhFM7umGUpFRaJOySWPBYJl8Pfukjd/PSt
	BwP10+N/lKc/5VFvQs5AxdGFQl1JhUjPtHPLbzElm7gW2DbX6JV/B1mDc4CWcm7oROTDZHCfS7u
	63wwkvM+ouLCBbTYadFwoYxY5
X-Received: by 2002:a05:620a:29c6:b0:930:a08c:cf9c with SMTP id af79cd13be357-9378047c47amr325232485a.2.1787735403071;
        Wed, 26 Aug 2026 02:10:03 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:930:a08c:cf9c with SMTP id af79cd13be357-9378047c47amr325229385a.2.1787735402629;
        Wed, 26 Aug 2026 02:10:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a73041asm429028266b.28.2026.08.26.02.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 02:09:58 -0700 (PDT)
Message-ID: <2ed7390e-54d8-4658-9c61-1892cb927942@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:09:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Check clock-output-names count
 in the multi-PHY driver
To: David Carlier <devnexen@gmail.com>, vkoul@kernel.org
Cc: neil.armstrong@linaro.org, qiang.yu@oss.qualcomm.com, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825225729.230493-1-devnexen@gmail.com>
 <20260825225729.230493-2-devnexen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825225729.230493-2-devnexen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pOt-bdritfsDQv8s_-1UWtxf_Tj683UM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfX5LsfVmxhrTDj
 KJoPdCJEar+6YJUMhLEP5PNWoyi75BvSUQypBvJKBpJiwM3fZIklaxHGk0JvqmcWcCxWoUZ+zaD
 1lVTt1caQiviHot3yV75Zq9h1QVHN+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NCBTYWx0ZWRfXwI3q06/kAu+F
 4vIhz7OogcHfFWcM+FxOlGpruHSdRVxMoeEXbIEUPSej8UIw6V5RiQakwtjwif3p6S7tgfcxn/a
 b7zK50QKGxoAG6NhAXyeLl+g8Jq5sz5xcUYYMTKETkbmyJOou5KcrHzEaMmy+xQQamF+5TZV3Ln
 5MdRMW0JLUs2o5MMADSN8KEdkKNrdoP6f6Mg1yaHjV4qCOdGW2GHhHnnPRq429OY7HiiZnJf/Rh
 +V4qA9oqDJf1QVQD5c9Qxjgh/EzXpeH4JSEYxv/d29DnA1RXo3cQJTzL85dl06jGDufmkDGI+UP
 LZgy6SthUxqThjr3kzyIl6JG8HObk34kuxDI2ZTF4plNELeV9MRffkBOfmAk2lfhkh5kfofTGcX
 eb67M9Vz5eQVVJGY681BdOayvJHrFFoY9L+RMztyUsVpDd8BaU7PSlN3IzlEQMic6h2T4XKorhP
 TnF/BroxFgAp3/BVSWw==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ead6c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eT9KoEPgEedj0qRXDQYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pOt-bdritfsDQv8s_-1UWtxf_Tj683UM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260074

On 8/26/26 12:57 AM, David Carlier wrote:
> of_property_count_strings() returns a negative errno when the property
> is missing or malformed. The value was passed straight to
> devm_kcalloc(), whose overflow check rejected it, turning a device tree
> problem into a bogus -ENOMEM with no diagnostic.
> 
> Fixes: 1781be3c8a5d ("phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
