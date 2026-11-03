Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699146;
	b=uHet6wuOmmZ6ybYOpe1YOrd94ke13R8lMNEBix0h4A68pKLCjERg0HiUTUn0dzduC+n2
	 oLM3K/efEjiuCEKuHoR8oE+l9LPIIyxvBjiL2YOvAnPmGrKYkgk68F/gmZHSdzUJRyoV8
	 eh/lai90mnkFFDw7XCo8oa20BpCBrizqlSqI/54mb5+JLBp9HZ0yEzvOQsQjRMIQ99luD
	 1laIetX2253fPCXFiqZcsO20cyQ/a1npP8ewg9ZwqH+Nzj5lYiFSObIp1v1dWcxgkimaA
	 eyCQG/HNe0YOept3g8xLHolqDwbrEmHE9bjPHU1i9fdZlOGq3RTpxQzXTHe/wFCTpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
	b=2+ZRHPcrTDP+Pb1wqMAeOnQ9xRmofWEn+lTKlSGDq0WjVu34q8oOCvaNUh0TfAhnxpiB
	 i0RBZdNzIrQO0txrV65shKGxcBnw0QtVluDPuzLa52A9kJ/ZxA1/GSXixVDUOEGFEL4OY
	 EyWsfsK4ssJuYoqe4DeUShRZjVO/QW7mpQxtdZs97M8Ug626qxkSTdRFMQ3c6cErqVKkL
	 FLUFZDAnlVCKVp1mMcQqlTKz874GdjGcX+o/qFwU2a2bbf6/63Ed+gHSuN4wvy8ku0oav
	 HmW2uSv0kqaZSH8toYTS4oTfvqVCRtjvgtQoFSgvgCJQg0n0GgKEqOT+7vK+3LE89qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Fom/uN9J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0989606A324
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0989606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fom/uN9J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzKArjKr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38Zn4K2106785
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=; b=Fom/uN9JKIhHz1B0
	mZDkLS6DR6brE5JpHk4qmTzxX4+ts65C7+kAr8BmO1VKNVXxxMWko2pyxly1QL/y
	yA6/ZPYOLqUE1642Syd+Wed00Pti/DAwoQ1fQ6snCDfHq8zjUi/VLf6dsDvJNKoI
	chWhvzsjRoD7PEDStUM/TCvpxocx7/uShEpNOB1/Mc+CL6pkzQVIQ4qeqTX6TaQA
	nSOeOvohEfjJXfWPFzMILkCfATfCgSmipQS3q9AhJVxGYJ2oDO44mVSnzS2nHhEF
	RXEs6rkCw8vF3L9PThXHBqOnpzDg2ewiZgiStyHoyNh0faUw3jJ2WjXrKQLojs/o
	tE0a4Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99kmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:45:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso63044285ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699144; x=1794303944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=IzKArjKrXiSJUGeHRy1S63+WyyjzqNrLX+8THr+ned7T1hGmHOB7+bWqSGinK7YKGc
         XpBPvrZgFeRTvcK3w5ZZlzsJHI2Yya2R2iZgWQyr1pY6HyEb806LLQ9Xgen28eK3598c
         7TxFRa9HioCxC+BDBgzhO2spqnxABZL+IeZKlP2CNvIUc9Ar7gwW1gqSMNPMLp5JtpCN
         QHvUk/UJXC9MX4Uw7OF2bV0ByYG6J4yi8PJlrUShc5GdwC3cFSNGkz0rsESmrFR+c/Ok
         cYt8kCUyI5DvWlkkJHL2t2Ja5fqwV905jLdO4lst62SBFJLB0pEa6aAeHwR60ZFd109w
         W7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699144; x=1794303944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8sOx+p6rMas9Ylr3pOABBldAAKf/2RrsNbEzLmijtY=;
        b=k8mZ3UjNODO9Dmhf6Lvnmxm8fh6pKsHp5/wc7sBUUwp2PVRGslnSe4vgWxoPvtJJTs
         r3ZWeZQHv9J5KfRAK5ibaIh9HrOgoF27uJOOwDa0tR9ujiW/9S91tJuOapi5YWWNTf77
         A06hCIqfvQiflYjzy7siAvIR2djORm3QZq4Zv4Kyzz+fJaf/UWBvgrLFUG0JYfYnqQyE
         iGgEuZjjFoUhUE6/QcHEnfdha+8GGmWLbhK1NfPmfHovQO0WdLoDPuBm1usIPSP8bAw5
         l6Wsu/KeSOtErong/ep2zY7ifFSq/ym3nntnO3AKimnkCvx+aBBH7KmO+IkGeAIixmJk
         4WdQ==
X-Gm-Message-State: APuU4Z+aE4yJrN4Bdy2/kn02kznXCjXd7rlED4X7htirLRtRxYG7E15a
	4Sgus/5usG4NvhkIE/1TLvaKVxpN1jrSKa48vi4cVKH35rrJEHlVTTrX4zDSohvNioAzIkmP7aj
	4ZSUT5j5FL2IXcUcTJah5tbQ5dOK/BHKKUalHvuahpQLVFjqgEnrSQuyUJzX14yeLtbMS
X-Gm-Gg: AYBFou3An8GVrfI+oSgMMIBEMuyvAvjl0uhJcDdl/Oe+blxbDR0Kq1etwWnPDyLs2ac
	0lEN02neFAI2aHUIFjuIhFe13UzOGpIo1Lbdijp4PUd5LQE+k3qqUZf4V1WluQhnAl/xxylKZCl
	YZA4EGDmgKEPo6G02HaqIsCmlaOUQKC1nH0sl8RTdAl72nvobs+srycleaTFJgdhPAPQW0zpw2+
	o+BwW9I+HpyuPumRCelnE+9ic9CEnDnxkDPCLTh7Cc4ImAq4SdxdlvyX6ncfBZwAGtvKbRelNg9
	CRy+4T9F09zG3wquuxWSBFYlAlRFhCIqdvMei+cedKKR4NTxRAKiA6ecf1AHnZgbGreS1Ul6ESe
	JI9GSZR9kW9vMrQ8xXQxlW0UXxBpuk/bbsH0XPqLdtA4jkoLk9fqoK0jfvz7sWHLFOXZIaIUKsr
	o=
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895955ad.58.1793699143769;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
X-Received: by 2002:a17:903:228b:b0:2e8:3190:73a with SMTP id d9443c01a7336-2eb364892f4mr119895795ad.58.1793699143296;
        Tue, 03 Nov 2026 01:45:43 -0800 (PST)
Received: from [10.218.22.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927e856sm37288925ad.50.2026.11.03.01.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:45:42 -0800 (PST)
Message-ID: <20e8628b-4664-4b61-bf4c-bd25d7cd6775@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:15:35 +0530
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
 <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Language: en-US
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
In-Reply-To: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IW8s_Xlafvxtp1KraD8-Im4M9Wgk3MpM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX+3KD+UAbebpG
 /GMPS9VuS6uV1JnhUn9ZQgEsBDqtd1A7QkIhpnz9X1a2lvs+ZkZe0Ig9CwHfxhfZoIqjTezVih4
 7BJAe87kncz4Z56Y4iGdmO6TNJKU91I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXwCOqVsbZrZNE
 158+pBg2rvoPUOQufMhYyI3O8YYGpc3InZIsu0Xj+fpyaT45mRc5P8DntkQsdR0vlcOhC0HXd4y
 xQqLGSop2eUu+K1N4wj63q9qU8MocC4awIiDHmHVBkqJrbORsvQq/x9Gq8duVlacXGq7WBHi4F8
 gL+7wB8Qh33K5ZP1ZBY9b8sMUp9IRu3J8e2WNTo4ngelbmOL1fv3g9KZSmnO3/LkiQR1G/yXIw2
 iSKMSTICD2t5qEiAkL4ulJUqPS2TfRE6VObqgwyv1fwyDDjhmELlNJVxYv7UoUBOxEkwOziKFq3
 0IlI1oueu2/gOv1y+j/225vANGJcovi1CkewP86ffrBKdLmVvtHopBPgX9cjr/v4iYeVwT2Nkb2
 eweIiXtXAp2c++G8RWuir3n8bFrPMDCwAJJ8HhA3+T4jmpVV7kNccQfcQyXxBtAXOLqPf5CeJdH
 Vvt5yufL8/8nW9//Kug==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9ad48 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8PPq-ilK-3aRn1NlK84A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: IW8s_Xlafvxtp1KraD8-Im4M9Wgk3MpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038



On 10/20/2026 5:29 PM, Konrad Dybcio wrote:
> On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
>> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
>> when it reaches high temperatures in shikra.
>>
>> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
>> reach 115°C using the QMI TMD cooling device framework.
>>
>> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -				nsp-critical {
>> +				nsp_alert1: nsp-alert1 {
>>   					temperature = <115000>;
>> +					hysteresis = <5000>;
>> +					type = "passive";
>> +				};
> 
> No "hot" points? And no throttling at all until 115?

For this target, no throttling is required until 115.

> 
>> +
>> +				nsp-critical {
>> +					temperature = <118000>;
>>   					hysteresis = <0>;
>>   					type = "critical";
>>   				};
>>   			};
>> +
>> +			cooling-maps {
>> +				map0 {
>> +					trip = <&nsp_alert1>;
>> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
>> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> 
> Please align the arguments so that we have:
> 
> <&foo bar
>   FOO BAR>
> 
> instead of
> 
> <&foo bar
> FOO BAR>

Sure, I'll update the alignment as suggested in the next revision.

> 
> 
> Konrad

Thanks & Regards
Dipa Mantre

