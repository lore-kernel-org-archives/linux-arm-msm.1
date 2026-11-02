Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616253;
	b=4baPqfBtQTLyAZElSUG7cth0jaY2ZIiHY21z4ij7q1HyaZG7r7fZ2Uzfsl+0ya0cic3X
	 QeOsW//q+3E1T5f4UhMH5T510NwzalGQgLGzd/dhJO6HpZNR6oqN5Tg26w8NP+cXUzG4M
	 ZpzYChFLcrOO9eSgVrBojYPKL0PnW7FSKSkjt8AW7WpzF5akMJSlVBje5ua8RwGF1UotQ
	 YyEFEkis03hOgVkoX5JP6vKj6kEyx1kM4OVxIHXEoSnGPM579+cfRywqRQ9Uh3ZEGd3RK
	 Iv3dOQf3dMW2Zo/cyB/kLJMrLRmIRyRJeN6GnUPKc+37ehpIF78QWy4HcQvIrnDwz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
	b=yt9KxnGApaDEovrqzY3z1TevGgo0PO1+b4Ip+7TqiFj5KMTUgrN6ududoP0ePw6lV79m
	 uCOmqXSM5AIjrE3T4dWSdd8QbaT0HFvWXtvpbIQggzIQcgQmtlEexZZipn9F4gvRBPmJB
	 6npjESqorcm5nUnYCBl7CItV0hlLN4eDzvGj/5KsIdShtUR+lfZ2S0F+ePBgqSBRyFjev
	 eMNv2MoLTwsThiacNtbanYinrT4DWOlVh07LtZGpj73sJdXJzqpiPj/rEJjLxOF+fk/uz
	 eSIA0Dvg8zezCtP/k+zQif1fH5FD6xi7InpmEqttlfNBDXHfoCLm85P+e+prTt0N12Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634E606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7634E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMYI1821130
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=; b=Yfb6bG7JJSoN0KYz
	s9+fJb1m/gh3bdTcKqBByr79KI0B/wJLFd0eHQgzsx0m2fSdDFPX0Xzc5jFJ1LcR
	zIUesJnAPFtg1wMy6Liyk5bMPj6NmOIPJxa5t02sNmZwSpttA7sGw5nHe/sdRzAa
	OroPaITQK/PJgevdTFvmWwdoFlFvI+7nXoRnOoTOTkTYsq2H2+etJ8UxiXktj5hD
	iUdatxcWjGcrQnEM3LNPoD6bq7IXZpQNl+dd0upgiIguzk+KnSA267UV3X5IWcT8
	zB4Zl8nJZtkyiROlFm46x5GOhj7zAe4Lh5yemVN43Xa785fP1duErA4xPyg1qCU4
	avs8cg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h92e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:44:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ca23ede8fso6980636d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616252; x=1794221052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=LIwKAWv4r8dBceVa4Ij/2xQCJJ5zrSMbd1kkQsQc0ohXuaZGup21jQzLYSY3mTP3mY
         CxMPlkcJHb/d0rEwNJrdvsONm41K6gQDVCP4C5j2dmTe5vCMIcadkmwPM7fDu0pjB1uk
         cdbZ5xNSpi9y3p+lSuvsD+Ggk/EMzCHNl4PvFwpOwQRArq9L4etdUp6AqzuT39DvFKKx
         fkt5hfQmjPlBXOSsN4bLRn1APr06mhG0oNADDRk/xMAXdBePIGuxAFZX851XonU3KXt1
         SyiDSzUEx3yDFl5+uEeR+T2W4BU8tIkOQbQgcV04AQO9oXJga+ewIwEAjQcgkcmqo9Yu
         yYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616252; x=1794221052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=huXW+5wIMyye6mc6rmjUn+BXgpyXiB+s8CmjHtTgnq7/j8Qwf2Tc2lKug7T19ULF3D
         +CUd/eAhO6zY1LBcd80KXglfMvEXvJ1DLltqeYcB0Wr/AKCkTUqJlySiF1WFs0CNWzNo
         pmDdGC/HOKrIdwlGYYXjTz3bQu+NFNyi48T/2o6lENyXpvzi4PpIguK4Id7/LeqeAmJq
         cvi3NCRQaUn6JvCI1FqRqhw2cvAIJxWXqNy4OkRzoBs8SJRxFC0Az3NlN69UL/4egAPb
         HX3YSCIgRWryuZxDhgwvLvgCXqFbxdoPU7TY5cJ9jIHgAhULkiAOo6n4Vblid8DECDa7
         kong==
X-Forwarded-Encrypted: i=1; AKwUvByHhF6WEn8erptkQQP7gpbS+Nzqyz5V3xFVZV6/Ep7DBd1HnYA7QlmhFLRhujZEtSgsYkDe8gtM4+dK10/X@vger.kernel.org
X-Gm-Message-State: AFq9FYLZBWmpdkUxgc1XdMLq3NKWaWBFmBJpl3FjpDPMrds3MNy1snXx
	mY2uymwoMATpHZGVmkxIjbrZCGnE/J9labi/1Pol3XVP58J+fJ+oVtvDI4/hA4/v1/gF0OHK6W5
	nxc5nMxRC35nLBukXMmHEOAyzi+IQpPZ1XMithCXs9J4pcpj2boh2usQD2ElL6vE5PQniZeS8ej
	PY
X-Gm-Gg: AYBFou0u8/AIezK95hmasOLgtIG5IXZPVk0UzZGBY019PNa0SQzvTEpsBzOnIFtaPWw
	SY82SjnXClcfivg9pH/xaVIKQjzXMP4267qDqx7OpEIXsAgNhL9LWwqEpOGn7mEbnYu2ecYoQy5
	A9RmkIm7JXyE2oQraG7AO5WNKPK5LldcU+7jrmUwqIVQ45Yp1oHIcLJYUbu2SbLBg8CFEt4G3F4
	H8LxBtS76uIHEZYxqjJIGpPCCY+O/z2nbr1902c8jO6ChOh5m5SgO/OMsYoef17F+X2ToQjY0zk
	nxzDAdKhMqWFjRRD8N0FkAryzsKRLHSMsFBz7z27EDY93oQNg6MNzytMgMc80ggcYcaPdlDqKxR
	OouIWaDSIWbL5mbe5fIk013a0NpNoX/DoH+qxKeZdF40dWx/bmjeLb5hIw6UvaHoVQHC/raU=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772174385a.3.1793616251661;
        Mon, 02 Nov 2026 02:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772171985a.3.1793616250987;
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm374997266b.4.2026.11.02.02.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Message-ID: <f4c2b984-e255-457a-9b39-f797b840cac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:44:07 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Amir Hanip <killdeath104@gmail.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, a39skl@gmail.com
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
 <20261101164930.17976-1-killdeath104@gmail.com>
 <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: odvv5jdJl51GerHkADEZDnrqh3CusB3n
X-Proofpoint-GUID: odvv5jdJl51GerHkADEZDnrqh3CusB3n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXzcSC1Oa2VNgi
 HjTMG4uHCofgtuGhtJ8eewiVDTmLPqSmS1i4I0g2x/RqZfx2Zc8DSXZfprI8hWfAMpDexCRC6ZU
 LkynK0V61/nNMfQOYhgVxdrf0MCM3Dg=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8697c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NZJFGjKaqi_mDWV0rrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX8f+/7+poK7vZ
 c31MkVrfOYJTBZWNhZ5kVqBGK8q2j1n7afpsQE1l3f7Fi+JJANB3o3ZQyMaHkhCCyVzzWGeqaSP
 /oYPsWCAtvrGVsY5c25Xkv1GorA5OuORruDcMcOSUn6v+GxqTY0h25WwWhKycmMV8y7b89nGNOt
 jWEE7eHG2tTpdRMMdUoMDOxp12BK4LTnCzPYAlczfcj6flGtrdeYO6Rcz+C8n1QUDNXUoT2XTnn
 8QoYBCtK4n3rPgegAXWzq0j8bHcrgJUpE1T6XWXQghlp4aqR9Kz9OIi9dONg6GlaAWmzP/NabZa
 rp6k2BYA8W56pR7ghOC5uD2P3Jdvw/SA49iaYOJNBAVHMl4C+fi17VNBQU0FEK3lolt6MHD2fEe
 XVY5Oi9su9eCeSpjau/uH8VlX5KFKxjoMwGe5H1ahNi7bqTwHTJ4EcU3CrNrm9+Fw4zYWvyAVz5
 WgrQjQWUKPiNHUYblCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

On 11/1/26 8:44 PM, Barnabás Czémán wrote:
> On 2026-11-01 17:49, Amir Hanip wrote:
>> On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
>>> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
>>> (lemon) basically is a lime with NFC.
>>> So i think it would be better make a common base from lemon's
>>> devicetree instead of making the same devicetree again for the
>>> different variants where only the compatible and the model property
>>> will be the difference.
>>> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
>>> for Redmi Note 8 (ginkgo) and 8T (willow).
>>
>> Hi Barnabas, Adam,
>>
>> Thanks for the review, that makes sense. I am preparing a v3 that
>> moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
>> and has both lemon and citrus include it. I used the name lime-common
>> following your naming. Happy to rename it.
>>
>> Plan for v3:
>> 1. dt-bindings (unchanged)
>> 2. lemon: move the shared nodes into the common dtsi, no functional
>>    change intended
>> 3. citrus on top of the common dtsi
>>
>> I can only test citrus. I do not own a Redmi 9T, so lemon is untested
>> on hardware. Instead, I compared the lemon DTS before and after the
>> split, normalized with dtc (dtc -I dts -O dts -s). The only
>> difference is the numbering of two auto-generated phandles. I will
>> describe the check in the cover letter. Adam,
>> would you be able to test lemon once v3 is posted, or look at the
>> split beforehand?
>>
>> The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
>> on both, so they now live in the common dtsi.
>>
>> I kept the following per variant because I cannot tell whether they
>> are real hardware differences or just differences between the stock
>> firmware images:
>>
>> - ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
>>   on lemon. Both regions end at 0x55a00000, so only the start and
>>   size differ. I can only confirm that the citrus value works on my
>>   device.
> If there are no overlaps the bigger range could work for both of them.

Waste of precious RAM!

Konrad
