Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610854;
	b=olqDL1wlHd9NzAQtIXj5en3WVRx10mH84T6ZhJxswI0L7t1XWR6X2NBgl5gMgRZ3zEhE
	 xLTn+XO5ZUNzetozPO1NUg4Ig7Wfo5C3TadQP6lxRr29szqZ/Ie2D72fpCcnmMO2BFGcT
	 YiqL5uMzhqXW/Y4r20v3xVGoIGwvat2nuA9JNuR1K9pjpE/JURHujyWPk/fpscnedz+vg
	 27mqZzLS02EFUInTqd4e9YebueoXWVJgT9lxKE3FDwlUFwaQH6ihsxU2TbOrJyqgsJVQi
	 CuUZNJ7eHxih3Mx+uyozFIqofrN48BxYrqxB2M20fXDxnNq4A0QwYx1wlf/lZGLLdIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
	b=GmplwY9mTdViRScTSYESiFbMD20PqdDyQP3LSKOzS1GGVQ9nrag5e2hwXuCkrFaaXsvx
	 6IW2lWQJ5wNjtZliynUsTaqPiEOoTHIry4PV03/08tyGBwXjwgTx8UV0cCc63Mw3G0/yq
	 bfdFWJ8pFYv78SELHYu689oXW6zWOv6ZVhcTJT3mMd8EsK4jsiE7+PF8sbWGK8p8xqaUy
	 gw2Vvyufz4/UtxoFMFi+nsryCysWAR8iGcroOCJxia8NXigFZoODfgi7hqeuPvynxe729
	 FQp3rk9iNj2+XYANnx4pzZl1UJ3zmeVQZuL2ZqxC6SyrGGsyDEPY1Qg/XoVG/gyK/AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGd4V5zt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+RV5ti7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C9606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031C9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGd4V5zt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+RV5ti7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ADSo4039441
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=; b=QGd4V5ztbHThHXks
	RgiMX9nYoLlIvuMh4gzZPAQDISoGFM3fn1DcfRJfpHJngYVkNJw4c1hg79IKEP5n
	sflUJ+66mWA4qa3fWhqrxFCHSIrFTPuC2R2HWHc/aswtKYTCE98hCIHZbNazUm8r
	r29ZdwZ94Cj3qG9hysUbr/qAXOOFBu0LRhYH/llXGro/FhbGaAyWUuZKE5HxVbJJ
	hsy5ztW1hYD9kt+BLs2cRs/FZrslux/4gvmY2zaEUcWAOx899CR1U9Kj9o37ZeVF
	9TreAwtWeLrwmAE3v2l1d7YWTWMTZSOQBG+0fB/CXDugAddD0mBHKF5KTOglk2E9
	bx/PRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18b88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:14:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so6229150a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610852; x=1794215652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
        b=H+RV5ti7tcMa/1Ua9HUMRc9nOOSEzfDWPs/D7KIBguVrFDouF2kzclSPXygbDufpFt
         cL83PQbJlmtYXM0J70xXiuExfdX3YRZ6uXvJJvXK3R9uCJvgp6ccRs3hOGyUMksfcFVP
         O6d77Xpi/aTiqVvGz4eJqAPbicgFNk/vd32x+ofQhu3fkuVmBoFsxwKf7h5OYG3Blsd6
         00WJI6yUSgTvQJjlzcqnv31oPi/w8PAPRZlTIwmqtRR2J1EwhFjvKzh6oe1XNQnnUpM/
         UFcQ1g6SkJza7PNmJcpX0WtGA8komu4j9nCMjszr71utQ/FyotbGpxGwkBANuUWLTB6i
         y1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610852; x=1794215652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
        b=BJCsPbcf/em26Qq7ElVUQaax/8GU8iBPlG9wkaZaYWBgkU/AUTxcKPl6+aQoS7VlY9
         4rQ6jeJQDaP/JkD0vyX2rKfEjo2xtqSdWYSTF6amKNB1tsSxOwzudpKfvJNp6Ku6oLDA
         p6ucw6BhyuQ3Bdvyf+cu3ScpTleAMmVO2KmeKXzaFjgrBGqRAq0MHU+kitp2mL9MGwId
         qi0xefGgox8qf+Biom1aErvGzNiL/Soade953HXVijKGCyX+dIQGh9EAMY/RRTolFhc2
         QmtHjqrj5pUYTbhRyr1BvEi7bpN2JqXfMILkykn/ONHKFSWriDKCPMyFs3eZ1F8iZ+9b
         p7Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzgYVEL1WKVFxuTvXjSSZaoT633MpCW+5iKvcq1Ut0ffS8dCboPm0Z2TotTr7UI1UKpnPNeWBmb2Sdt8BFY@vger.kernel.org
X-Gm-Message-State: APuU4Z+pB+stXcrQ3HsgPeBwCSbSwLpAcKS3RS6YgLBrEA3GfMuHPleR
	fKylQwVKyF28CRonI+72Gafn3DeF90siADd8fp8JpTOqL8bLJYWlpDMOJ/+2adJX9fBq0TSaLe0
	Khm9xiN2yvlAAC9vQmRUQEqY/xwUphUtXn3WgOQnmyL36a+2OelsrKri5ulBv9CEVPiTB
X-Gm-Gg: AYBFou3TyJ9ISK/ZmrxI1awYq9Ls+TkA1vjOCf9PvCsNKpLKk166uLvTCk1Daw3VnCV
	nymDbgkvycLfeLFTS+G0VBUzV7nRODDlkBCPvGme77jRntUoH78F3pDLp67bh2Dk0My6kbJw5vI
	nnd+lRLhblk6PkOn4XXEk757XbUUXE1JZSY36KRBjekEx64/ShvR3xRKNjhvgHRIqehKHvhzXM8
	O4Y0v23VQtTpn9AFeSVR8+qH+7oFSPpj8vLJl+apkPBjM3SdGJHfM41XpzmyuYjTz8HtU1UAdhJ
	T56iBroU9BuVZiUeSModqKpCofNaEloRxYkWYSTAH/wmUHoMbNltAsAcQton9CvvfqpjKK/z0d2
	GN2iK2xbs5QXkFbh6RoUaxR5CpnoRiatuW9r88G7RFe+QrxTVuHB3FX/DBucUU2xjmXCEiJrODL
	2FE300XTk5Cx45qq8hWlTJlGkoSSRT32G5
X-Received: by 2002:a17:90a:c2d0:b0:3ad:eb34:4c6c with SMTP id 98e67ed59e1d1-3ae897c886amr7951689a91.13.1793610851695;
        Mon, 02 Nov 2026 01:14:11 -0800 (PST)
X-Received: by 2002:a17:90a:c2d0:b0:3ad:eb34:4c6c with SMTP id 98e67ed59e1d1-3ae897c886amr7951656a91.13.1793610851159;
        Mon, 02 Nov 2026 01:14:11 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm8529437a91.1.2026.11.02.01.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:14:10 -0800 (PST)
Message-ID: <23f27b4d-fe83-4b4a-b358-db89c54e6f2f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:14:04 +0800
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
Subject: Re: [PATCH v23 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-5-95f250b18612@oss.qualcomm.com>
 <af3600e1-fc1d-42f4-aed7-380d9546b910@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <af3600e1-fc1d-42f4-aed7-380d9546b910@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pzSBuoPVZxPmE4b1pn3LZt_N02fKz5uS
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85464 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hZKHP_SayGcxdSv64igA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pzSBuoPVZxPmE4b1pn3LZt_N02fKz5uS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX+uOzjRc3v0BR
 5olM1CDQq8S7EazK5I2GiEWD1AW3fBh8P6L4nl0VbCx0E9oGeiIrA7TNLG4ebTdw7HPzJupCuZH
 PgfS9reAneHEKbD7Baqz1i8gjjO6zd1SLrwMdEX2ePKUyHq5qwsZf2huao83vNoFkDH6rsNqeYw
 HJUjBucaM59TzQ3sQqi/k18jcNzTAsVnTubf/jTZzm6xLufqenEa0oFg1v67oAus4c1RoBbbHn+
 WoolDm5RHodC2q8uZP09zXRKI2TIsJF7v0jYEFopix/cK/OvO13GnAFm5+cxeuAF5lmu843frj4
 GahezolaSYmDRTCul2z19RYBzzRQpkBlEmGGdA0SNBPzI9tN1eDRysyude4tZtmwcI2IrU2ILSx
 KPVzZamOpm1aGwZiyw7d9NSPDGh+gOhw5z0xSuJoy8AGlSATB6kUqIGhCO1cioI8lofRM+8NwD3
 GB6SDnlcmSd/lDCAUPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX/HTZz2Ov4fZN
 7AKD+pcJxr/bU6SdzTZ2uUQ5DZj3TjQ9iptxVsLiQUq+vgKNYEvmqG48RbW69CyTMKJ8h5Xbm8a
 Io5R4BR+bOUiE1u+sQiknPcNmoq8Mvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:52 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
>> platform.
>>
>> The Kaanapali platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 306 +++++++++++ 
>> ++++++++++
>>   1 file changed, 306 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>> camss.yaml
>> new file mode 100644
>> index 000000000000..dec451fc940f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,306 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 14
>> +
>> +  reg-names:
>> +    items:
>> +      - const: top
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csitpg0
>> +      - const: csitpg1
>> +      - const: csitpg2
> 
> Rename it to 'tpgX'.
> 

ACK

>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  clocks:
>> +    maxItems: 23
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: cpas_ahb
>> +      - const: cpas_fast_ahb
>> +      - const: cpas_vfe0
>> +      - const: cpas_vfe1
>> +      - const: cpas_vfe2
>> +      - const: cpas_vfe_lite
>> +      - const: csid
>> +      - const: csid_csiphy_rx
> 
> The common name is 'csiphy_rx', the clock supplies CSIPHYs and non-CSID 
> TPGs.

ACK

> 
>> +      - const: gcc_axi_hf
>> +      - const: gcc_axi_sf
> 
> Unused clock.

ACK

> 
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +
>> +  interrupts:
>> +    maxItems: 10
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +
>> +  iommus:
>> +    items:
>> +      - description: S1 HLOS IFE non-protected stream
>> +
>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Global Distributed Switch Controller 
>> for IFE0.
>> +      - description: IFE1 GDSC - Global Distributed Switch Controller 
>> for IFE1.
>> +      - description: IFE2 GDSC - Global Distributed Switch Controller 
>> for IFE2.
>> +      - description: Titan Top GDSC - Titan ISP Block, Global 
>> Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports. Each port receives the CSI data
>> +      decoded by the matching CSIPHY.
>> +
>> +    patternProperties:
>> +      "^port@[0-5]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data from CSIPHY 0-5.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@900b000 {
>> +            compatible = "qcom,kaanapali-camss";
>> +
>> +            reg = <0x0 0x0900b000 0x0 0x1000>,
>> +                  <0x0 0x09253000 0x0 0x5e80>,
>> +                  <0x0 0x09263000 0x0 0x5e80>,
>> +                  <0x0 0x09273000 0x0 0x5e80>,
>> +                  <0x0 0x092d3000 0x0 0x3880>,
>> +                  <0x0 0x092e7000 0x0 0x3880>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>,
>> +                  <0x0 0x09151000 0x0 0x20000>,
>> +                  <0x0 0x09171000 0x0 0x20000>,
>> +                  <0x0 0x09191000 0x0 0x20000>,
>> +                  <0x0 0x092dc000 0x0 0x1300>,
>> +                  <0x0 0x092f0000 0x0 0x1300>;
>> +
>> +            reg-names = "top",
>> +                        "csid0",
>> +                        "csid1",
>> +                        "csid2",
>> +                        "csid_lite0",
>> +                        "csid_lite1",
>> +                        "csitpg0",
>> +                        "csitpg1",
>> +                        "csitpg2",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe2",
>> +                        "vfe_lite0",
>> +                        "vfe_lite1";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_CSID_CLK>,
>> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
>> +
>> +            clock-names = "camnoc_nrt_axi",
>> +                          "camnoc_rt_axi",
>> +                          "cpas_ahb",
>> +                          "cpas_fast_ahb",
>> +                          "cpas_vfe0",
>> +                          "cpas_vfe1",
>> +                          "cpas_vfe2",
>> +                          "cpas_vfe_lite",
>> +                          "csid",
>> +                          "csid_csiphy_rx",
>> +                          "gcc_axi_hf",
>> +                          "gcc_axi_sf",
>> +                          "vfe0",
>> +                          "vfe0_fast_ahb",
>> +                          "vfe1",
>> +                          "vfe1_fast_ahb",
>> +                          "vfe2",
>> +                          "vfe2_fast_ahb",
>> +                          "vfe_lite",
>> +                          "vfe_lite_ahb",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid",
>> +                          "qdss_debug_xo";
>> +
>> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
>> +
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite0",
>> +                              "csid_lite1",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite0",
>> +                              "vfe_lite1";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_mnoc";
>> +
>> +            iommus = <&apps_smmu 0x1c00 0x00>;
>> +
>> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
>> +                            <&camcc CAM_CC_TFE_1_GDSC>,
>> +                            <&camcc CAM_CC_TFE_2_GDSC>,
>> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "ife0",
>> +                                 "ife1",
>> +                                 "ife2",
>> +                                 "top";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    camss_csiphy0_ep: endpoint {
>> +                        data-lanes = <1 2 3 4>;
>> +                        remote-endpoint = <&csiphy0_out>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>
> 
> In general it looks good.
> 

---
Best Regrads,
Hangxiang
