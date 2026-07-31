Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2D43CEEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785520221; cv=none; b=nwbAHMTvYdxPXD2952RCQPZLpGuvSR6N1Ru29V5dzq1otjO2GcZ7llXqeT1dUIupLjGIQRtZ5ibiXLMgAq8+0kbgbcg8dtOCJGQyLWccN2ydQ9XKDJFyQigFnN/dnxBJFeGZrLekQ0uNDNCHqvcsYY4mPvBj7H5NmdwCi6h3IHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785520221; c=relaxed/simple;
	bh=W+jYCexIEEQ0uU8y51WVpnMWkSUysalkAisSyNtFft8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7SmgIRJnwGigV4s49TPD/pxwp00cnVN7tRudSy5wqB1+mI32q4OiUQSqE1mstVwWYZeJ/KLfRStiGMdh8UbvE2bEAFoh1/J5zTZh3NUialVkwOkP0JyNVnfQOzG1nQk2GnKu/h1Je0PvzZEggIy3Vx6lcS9uNDIi42fv/fIUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WylN/WvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGlkblPy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WylN/WvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGlkblPy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO5SA070846
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P701Iru64K2mSQrogLQeosSLRzpER8DGLClpum85WkU=; b=WylN/WvWm4a3hQ7l
	gR3enDQS3p4eFfYf0588nOrDLV9/FM2qvAcZKlKQSflCDuDxAjrB3DQETg+96Y69
	N40bAl/ojeTE2hi8KKZXI39SbtPK3qu5zzx4i5NJ0u9nJUIiIjIywx5OaayQdh/6
	ZGOesjdSKCOTUEfxCqEsZaZIzqOJdRRYSkGOc/g4/lc3GnPuF1lBdvWFAGbP3fUB
	14ImkqtqENwuQskWBHX1IUXllnZrqmgSTgTfiynA9c8LG4iXXd7+Qf3Luk680xjy
	VpLzpKGCPQYL6iwvJvdRlY+ewaZJJrCihYNj5uF3UivstPxptN8WRX2rErHq9BmY
	lZdl4A==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqhqt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 17:50:18 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a43d32fa9fso1575785b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785520218; x=1786125018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P701Iru64K2mSQrogLQeosSLRzpER8DGLClpum85WkU=;
        b=aGlkblPyNoZ6V0flfTJNoZ8aeGzru0CMxlBYaYUI78TcZp0zMK3rYT+leXstx5uY4M
         0dcTRjPFRV/5A8IVG8KpNnDM154/gH5ohcT9tvMbyA1mjRXfCgOHkIfmkgDUibx05JdZ
         ZI88nKqKfqwu8gV1YMlOsq9YnPjmgL/7BWURl5VAhEM2nLb1Y2l5UZCDzK9UwQVyMuNv
         O28cZnDZKs/gQMGcVQDTdPb89slh5qULoHu9K2+aOcelpSA+XTDLaHb7En9TS1XSpbWw
         57edD3reE1L6Heq96Uk3/7sDLhRpsIe2mWwGcGwRfCd/ax2ckti2GU/TziX7R/eE9vgD
         iX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520218; x=1786125018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P701Iru64K2mSQrogLQeosSLRzpER8DGLClpum85WkU=;
        b=m+wsBMuag/NfLYA7hsD781zGLEv1XJ9LU5uC9PoAboyjastqzd/LEXAsV74CREM2nV
         MFaiTOgEIfXhDzTYr82M+fMzB0x4i6qRItrBHT8hLdqyMKbHjt7L7VTcB4JZ6FcBcM8p
         vGn9H7Niz/s0QN4wHih2MbZmMWMjrPCKA1r9g0hsAXrtYAFWIYqKsBW9PKi+lXf3OTyv
         K7ZtpRrmb3Up9ONv8NeT//TTto1L070nSNr5TiGyfp/g42ZfQUIJG2eoXKztLwaPZmej
         /buZfMtsDqwGHxtH87It9J1BL5qCXGDMbspTjkjH3yZv+nxUEESJAQgtq0RbB9YsmbAS
         v+zA==
X-Forwarded-Encrypted: i=1; AHgh+RqWqSbX2JdO599XYDDav1O8/kd9scBRSr1hRgZi9/mR/rAWwdbJRFzrtI+LwzRowZ4rnZ0xQiDEq4K0teF3@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8i/knWvy1oymnVPNZW+ZH25BOg4fbrJnwJyFrLo0rHyorLpO
	qwxCnQ7pFKM6u8rtNOwVLuwq8PBtU8KdoETGjvanmKfMyEmnU7At7nAbRRRKEPNKgm34WGrL92G
	po+bj0trO6i96/ANKzr56z1wZy0cUJqVhm9HB/pYy/YxT5Y4VeCvj/9Y8nCZiFhQ4HMaj
X-Gm-Gg: AR+sD11CVDueEi6ivk/TREKk/kBnPsyWohGLENtu8vsv7cxE6myiPAxRD5pAbzyN79Q
	KedArrl295WbSdKfKE/+7EFBQctzJg13AvCPwp3C2US+MI4NHoQGnOy8CawKi1Wxa4/ifE0xsUE
	cV1I0gYxf3dH6N0A+MZutD7104C4tRSPGfGbAEN5ZrCtpXB6aX35/IGtdDrCaegtyd5xhlp0Qy3
	0De3OtxggoSeye+LPH636SPr2/vZbRAb2gjXJxubbhRUYtJK2G6EZLGn29QMfkuJiMili1qvZnE
	dLTLPoZ90AEoQNeJa63kDfgu1yj9LxE4sK9OS1roxDzK1uVjyy4Ebnh98JvGCCsWa2/vevz+EcV
	CNtHU4GHun1qLWleAHeH+KdSBgQk3epw5
X-Received: by 2002:a05:6808:2384:b0:496:e0:a47b with SMTP id 5614622812f47-4af5e329e27mr1603415b6e.20.1785520217683;
        Fri, 31 Jul 2026 10:50:17 -0700 (PDT)
X-Received: by 2002:a05:6808:2384:b0:496:e0:a47b with SMTP id 5614622812f47-4af5e329e27mr1603356b6e.20.1785520217171;
        Fri, 31 Jul 2026 10:50:17 -0700 (PDT)
Received: from [192.168.1.10] ([122.177.247.168])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58933884sm1164801b6e.0.2026.07.31.10.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:50:16 -0700 (PDT)
Message-ID: <b5afd21c-4516-4a8c-bc8f-6598ec385d27@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:20:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: rb3gen2: add Industrial BT UART
 overlay
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
 <20260727-rb3-industrial-bt-uart-v2-6-2d100f30e202@oss.qualcomm.com>
 <794424df-4714-43a4-b4b8-e960998ad1f1@oss.qualcomm.com>
 <ce283ef7-2460-4fa4-a1f5-9757fd6b42b5@oss.qualcomm.com>
 <6d61d749-440f-40ad-82e5-e1e909afad06@oss.qualcomm.com>
 <b47345f1-1c7b-4424-9c6b-3dd02c0f4ab6@oss.qualcomm.com>
 <bf7821a2-d813-4f89-b891-9c26d228ae67@oss.qualcomm.com>
Content-Language: en-US
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
In-Reply-To: <bf7821a2-d813-4f89-b891-9c26d228ae67@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX+qllDezOznMx
 wywsQWlT1kEOF7O5Os9CXkcE93efF29LMbXGNKT6IDJQUGNM+QGRAyuQAGSWSbkDhEtyA5VA4TO
 vQYnullz30Nw7Ra1+hEif9C0EQRPG6kQoSv9zoENtXzam8jFtSJim5HSGCu9934i8c9npbQxKhT
 xH9NcVtEMkefeFoIGSSYoo47W0tpqH8u/oKRf2gWOBUIPgJxL0dASGxW31jw3WC6PNL2D9R+WA7
 tKQnBfxVBtmbgRPqhXPmzXNfWu4E/9JiAStsSRdiVQitqMqW/fLOzn8fkZIFW9CeY8ju3I9A0m1
 1xpj+NMU2IxIKtccuxHnkbLCKzAVuUqD/ABedtK8sNZIO4RXWH0v0FaASLFihKIRmU58fsEugqm
 uzQPC9TzFoxtfPQ2GndbrgghryG/ZXQ2v7tComEL6Jy/u2I/TX391NXS7YIxiR09v83+PQPRfDo
 Gh2a6yzfuXbx5TOCdzQ==
X-Proofpoint-ORIG-GUID: 55SuiYAFFPtSJvmO1cAfoBq1vMiOR8tK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNiBTYWx0ZWRfX+zLJwEH7kI0X
 hS8hqxGDc3BZ6nEbd+kLXgqjg0IdRYUjBeA6jubQioEce4rnchmlluDBVlIh3qbZu9vhM6B7vuy
 wrjH84HX+OsaY14HpA39arM3XbDvbD0=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ce05a cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=wVA5pQU3D6HtJETKl3oCcQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=sZyqPLha_0TG7Fz-sX4A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 55SuiYAFFPtSJvmO1cAfoBq1vMiOR8tK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310136



On 31-07-2026 21:19, Konrad Dybcio wrote:
> On 7/31/26 4:48 PM, Rahul Samana wrote:
>>
>>
>> On 31-07-2026 18:20, Konrad Dybcio wrote:
>>> On 7/31/26 8:53 AM, Rahul Samana wrote:
>>>>
>>>>
>>>> On 29-07-2026 18:01, Konrad Dybcio wrote:
>>>>> On 7/27/26 5:45 PM, Rahul Samana wrote:
>>>>>> The reworked RB3 Gen 2 Industrial mezzanine keeps the common Industrial
>>>>>> mezzanine hardware description but routes QCC2072 Bluetooth over UART4
>>>>>> instead of the default Bluetooth-over-USB path.
> 
> I only noticed this now - are there 2 variants of the industrial
> mezz being sold concurrently? Is the already-in-kernel one some
> sort of a prototype SKU? i.e. should we support both?
> 
>>>>>>
>>>>>> Build this variant by applying the common Industrial mezzanine overlay
>>>>>> first, followed by the BT UART overlay. The overlay models the M.2 E-key
>>>>>> connector graph endpoints for PCIe and UART, and disables the on-board
>>>>>> WCN6750 PMU and UART7 path so the M.2 QCC2072 Bluetooth controller can be
>>>>>> used instead.
>>>>>
>>>>> So is the onboard module disabled? Can we not just use two in parallel?
>>>>>
>>>>
>>>> The Industrial mezzanine variants do not support the on-board WCN6750
>>>> wireless path. The common Industrial mezzanine overlay already disables
>>>> the on-board Wi-Fi node.
>>>
>>> What does 'do not support' it mean here? They are physically present
>>> as part of the SoM, so unless the lanes are somehow diverted away,
>>> why is it not?
>>>
>>> Konrad
>>
>> Hi Konrad,
>>
>> The WCN6750 module is physically present on the SoM. What I meant is that
>> the current Industrial mezzanine devicetree already disables the on-board
>> Wi-Fi path, and this BT UART variant followed the same board-level policy
>> for the on-board Bluetooth UART/PMU path.
> 
> Okay, and do we know why that's the case in the first place?
> 
>> For the endpoint labels, I can move the UART endpoint to the SoC DTSI,
>> kodiak.dtsi, as uart4_ep.
> 
> Please do
> 
>> For the PCIe endpoint, the PCIe path to the M.2 QCC2072 device is not the
>> PCIe0 root port in kodiak.dtsi. In the composed devicetree, it is
>> behind the Industrial mezzanine PCIe switch, under:
>>
>>     /soc@0/pcie@1c00000/pcie@0/pcie@0,0/pcie@2,0
>>
>>
>> So placing pcie0_port0_ep in kodiak.dtsi would not describe the actual
>> topology.
> 
> Yes, that was an omission from my side
> 
> 
>> I tried adding a generic label/endpoint to that downstream port in the
>> Industrial mezzanine overlay and referencing it from the BT UART overlay.
>> However, when the overlays are compiled separately and then composed, that
>> label is not available while applying the BT UART overlay, so the composed
>> DTB build fails with FDT_ERR_NOTFOUND.
> 
> I think this generic description is simply not achievable today without
> a bigger plan in place
> 
> Konrad

Hi Konrad, Dmitry,

Yes, both Industrial Kit variants need to be supported.

The default Industrial Kit uses the common Industrial mezzanine hardware
description and continues to use the existing Bluetooth-over-USB path. The
reworked Industrial Kit variant keeps the rest of the Industrial mezzanine
hardware the same, but routes Bluetooth over UART4 instead.

That is why this series models the reworked variant by applying the base RB3
Gen 2 DTB first, then the common Industrial mezzanine overlay, and finally
the BT UART overlay.

For the WCN6750 disablement reason, I will re-check the board/SKU details
and come back with the exact reason instead of assuming it only from the
current devicetree state.

For v3, I will move the UART endpoint to the SoC DTSI, kodiak.dtsi, as
uart4_ep.

For the PCIe endpoint, the exact PCIe node is introduced by the Industrial
mezzanine overlay, and a second overlay cannot reference a label introduced
there. So the clean label-and-patch model suggested earlier is not buildable
with the current two-overlay setup.

The PCIe graph endpoint is needed for the pwrseq-pcie-m2 provider to
associate the enumerated QCC2072 PCI function with the M.2 connector. Given
that, would the nested patching style from v1 be acceptable as an interim
solution for this variant despite the concern Dmitry raised?

I am open to other suggestions if there is a better way to model this within
the current overlay structure.

Thanks,
Rahul

