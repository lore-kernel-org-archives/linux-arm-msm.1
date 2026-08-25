Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB53A873D
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787637587; cv=none; b=gpG1C49gIkazaSxCnf13EiYbNul5Y98S9XXm8cUfz+DTscKlSwIv8/DTlFVbXsWtPCy1aPmZ/0FYDrz8YDmtYzx+Tba5dlCe8nq1T+vgQDI4LL6KQU4wRD2rNhx9BykAlSj4U5RShivcvlY0t88Hp5/+17g8hlzAaixp/TyCKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787637587; c=relaxed/simple;
	bh=cnDQwEZaZ8xM92+1Dwva0mnpGuAv7wUEbbiEt62JQ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WEg2yTKg22ZGvTyrFpf1sHLqRSAssmOGcR0eeqS/x6ji40r855IcAE9kXZRYfjPA898JArfiw+ESY282uAbkvrMgI+YR6EDBBCxWno4zzF7owoWvAQIg+DZUNgPVDOlGGlhVvTi99DX0I4uLT1Sw+hSXWTQXpm+S++8H/Fc7kOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BX58xfdp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEFwWZod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BX58xfdp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEFwWZod"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R0i5125580
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NR8mIQnJX/pE0ZkZ3Kgop9x+ojlxMBixP8X49P3c+QE=; b=BX58xfdpop9wz8k9
	QYxXKwTtVnoDGaTzncQTGglOegoNAOsRTrw7ragHJJJMk6N9Ss9Iw7M8FDdUGKfT
	g/NUE6VRHGOQnWoQhaj9Gr5bPqWyH0UGUqA4UPwfa1L7YaUnSyWVjTdRNDPtATsI
	JyOBTPY+nEHEyH4gCHN5I3AW/Zk/0C+MxT2EB4WY3zjW6fsHAnTu3DYnEXhjib00
	Ju1Zl0R8bgtMej1e5kSJIehnEHCkSj4fkuyM/BX+1YyI1qzWFuafb+TjbcDslSAa
	9qKzkRY6DMz4Slff0nM8FdPcGyu8Kco2iETVnQJD/Eglb/ri64+Uaeg7QsNBcJpl
	OFz0Jw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8rqujsx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:59:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so58743981cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787637584; x=1788242384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR8mIQnJX/pE0ZkZ3Kgop9x+ojlxMBixP8X49P3c+QE=;
        b=UEFwWZodu0AesBitcrjPpSaBWUNaTEh2akA5nHdhrfbmxmRf+FRtQIf+d79pgmnacx
         IwrU82zG9ynbVfVP4gP6b5Uz1vA8U3FWTZ8EnCTG9ntLj86w9BSEssE3gfvBQw63ibFP
         MkP7/zDkxoC5vYDNtqL9e8dHgQXhwn7xGsKTvNOHJm4mpTc8Qkxb1P6kRbXwHtfb+kj8
         JXE+kq3oOdWxyjclhx24qowCxyDTjGTcb4whoi3qgq1djPl3qX5vbJXsW1SFPh0DVVz4
         0L2JIrAs9XaOk/bANEu9UBu87rBTpK0MS4J+othi6R1VofPe+vSmkYo9hBeLn7JK1sBR
         nq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787637584; x=1788242384;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR8mIQnJX/pE0ZkZ3Kgop9x+ojlxMBixP8X49P3c+QE=;
        b=da9fcTfrLcQm+nvfwXyvUg6vstwvNIgX/BdicMZ/8tWCluqzA8FJp54tf0uTL6xW1U
         lcOq5+emrgEqNHkdK+VBVnSAon4uwt0W74tCb4cvcG+kr9xmRuK6fyl36pADeIT6N0e0
         dZlAHDzkNWP5LEBtUDDw7SJWWvEuBwbCN6vA62dd6biCSmzvoQ1hiqCdajVoKpz94nqN
         YsBas/EXcvJqCQQC6wn+WUM8/PbVTvVkyWs9kbA71DGIi9DgbDE4/HUdkx0BGjyBXyAX
         6LJcACzGx+3OajmAU5N+tjfQAdI6AxyzKEiyOHhCL0GTdNT0PNqIKGoLilR0JsJyXpai
         WmHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrypxf6f1xqaUvQgadz98i2uGCY3DOAAXW+GavBv+7Q44NKFqw9jiXH0FKgvhUloQ+Hjf9ROAJ3/IyJNurg@vger.kernel.org
X-Gm-Message-State: AFuF++kh9/qjbe3rbCmURRQhm13ooMHF4TViiTvZr+l/7SiplKKFSHds
	Fl/7LgwQ/k1oCZKwFfwihpYX7elQSMNgE5nOUqwDondhppB8FpQPtxiQBzgWEWj1OYWV34VO7as
	5lU7aFTdYx9lnzFx6d2ZFe6XlYZ2k6M86dK1vosVbCd64ZHwqXd27GSs5fe6t6+ue+1Zf
X-Gm-Gg: AR+sD11UuIIcfeALIUqA/w3nnz4qr/avTb8+M3giitiAJpeV5lU6+28I7NP3C5S5xUS
	AMOAt0iko76dmx8sAqJPY38zD/R90st7iJ7ZdX5A5h9jQXllv0ohXPAqV3BNn/98bd25glF5ihO
	KIUTzF5L2UOntl5f/It0PsSuiy2LwaBcP5rIFoT3thtE2F6ld4wd/6JfkRzvLlXTIHHcHe4yyPk
	f5qe+VXdhKi5FO6Hw8CC8yWB5GPYk2bQE65T/YoVT4dKvLrkTgwJDbWm+RZuYpWid8rRcRMTa/q
	1N9/bigMv3RzFVSuhziybdyL8nrtyZGxqYWxLqCkS7UHqLIUxisSgt2WExBaAh1Qt5PjByXkOk0
	3LZr4aqKc9aekDNLs48xofAi0OdlH
X-Received: by 2002:a05:622a:1485:b0:517:8470:2d2d with SMTP id d75a77b69052e-52df5a33a56mr343204611cf.29.1787637584192;
        Mon, 24 Aug 2026 22:59:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1485:b0:517:8470:2d2d with SMTP id d75a77b69052e-52df5a33a56mr343204401cf.29.1787637583788;
        Mon, 24 Aug 2026 22:59:43 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm584713666b.24.2026.08.24.22.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 22:59:42 -0700 (PDT)
Message-ID: <7756a143-eae3-4b39-a038-967d358a1e68@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 07:59:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Manuel Ebner <manuelebnerli@mailbox.org>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oAnHjlyyEhgXEiAjIJm6sGdrs0sJrkT_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0OCBTYWx0ZWRfX1usErQ9iUbOA
 1zu6D0jiKeHuygJUIadLm4c5GQ29znhK1Vl3H8fk/ScS5wbwQn4Xs9aRiuYUarvp3hLj99dKjTV
 stVxn4qcRg9nf6YCSSBwBk7Eyz4PbCE=
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a8d2f51 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=ga-yU9rYq7GaUGPlSS8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: oAnHjlyyEhgXEiAjIJm6sGdrs0sJrkT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0OCBTYWx0ZWRfX8kZ6gY+bckis
 xALWcGM7sZqLqUIQPGz6+rzXUREuVk2bPIHgr5L9XXA8QZMSlHGeo9lVKkXVGiOonJCcAega56c
 wIFHSOPTK80TrHTXfAsECKIKxO6iru5Usiu+OAkQ9UzvOYTxycSLbCopbN31aNYI6CMEod6McdI
 Q+kwZr2uQYfLz0Eu1bXG3SYy7BFrW4B5ohqCVt+xjQRIszRDT+ZdmzlSLrvpFl96j1ydZQ6okAg
 vlJDKmnBIXNdTYuJ4moMld2nIeg0izy5mx2li13DEbFhshgtc61bptqteqTGOmwMhmqAo7xci38
 YYh6O3oipSgo3+FazvJMvt97VSJMGSBAAX/T9rVedTboY1EAnBoM50oOZ4zw2p4+Q+yX0CUg0RC
 5JEJavlWiRPO3XhL7Q5DhouVxVBMJhm0wOSjktgztVhbGOkImhGqCckCkIycYe/133apG2XK896
 OsJsd9pIGW7d+SXB/pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250048

On 24/08/2026 10:39, Manuel Ebner wrote:
> Hi
> 
> On Mon, 2026-08-24 at 12:06 +0530, Harendra Gautam wrote:
>> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
>> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
>> need a binding to describe the controller resources, DAI cells and per-
>> interface AIF configuration, and named constants to avoid raw numeric IDs
>> in sound-dai references and child-node reg values.
>>
>> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
>> aif-interface child nodes required by the controller.
>>
>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> ---
>>  .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
>>  include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
>>  2 files changed, 404 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>>  create mode 100644 include/dt-bindings/sound/qcom,qaif.h
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>> new file mode 100644
>> index 000000000000..134356114733
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>> @@ -0,0 +1,307 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> 
> Both of the links redirect to https://www.devicetree.org/

I don't think you are providing anyhow useful review. Please avoid
focusing on unimportant details.

Best regards,
Krzysztof
