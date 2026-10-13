Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2250551617D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902476; cv=none; b=J2seIj+3JUil2Z293llZlmWuuNscOm7brBL6vkdDQ52tflYQc8FC8zGreKBokB8jEi4ALnloMzwIDYYZvwPlK2xRF9lzWIb0SxvfJRirEoFoT3uFm7M8s4mMLD2kVyods1TMPUmXG2lKWvcjTvwGM84pKFHThUGSjsY+TtHm98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902476; c=relaxed/simple;
	bh=zstXjsOXIwstycTOYzDT8KSr1poySZmNcn2ehdXPKFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfhODYOojVA4XpWtJaA60KBN/40D8M7gFUurGrGElUoTcva80XILosod+KVeeiLJ9/8t6vyhghRcyfRhDeogKGDE5jGzl6nfeqNa0kf81gGeTkb677+hc50HRyi7y12qu16Luf3ytNSB8VcN3NS1uzy94o6s7zD8+QhM0ojSr9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfCgGIqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXaw8CJU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfCgGIqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXaw8CJU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3fCs1143623
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=; b=WfCgGIqy/maVaLuk
	K+vouDRW1v9tMEfYrkPB+I/kWR7Q9BYt9SVbfkjM19sbeHIXNrS2+HZcTpKx5KG3
	D4zCupspt2Iei4NMdjTPwqBrl//PK2zOGwkT4R6ddwXYbba7saBWNNVfqKpbre6F
	EvYs13flzNBn54VKFxY8Xe2LKFi+9auLbfv8iJfQuvd2pVIOE2uqnDsLR9QT/y9i
	jsmY8LE7Uu52L/pqY133bnyk2DnmR3UYYZ6lhWIaNRrK2LZincN2aKTjZr046q2A
	eQ2C7AePC0sEI6N8tYujeF/dBFhB0nXawtf8+GzJMwv36lV3Dgvs29CUcBy2xhMj
	K9jjCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg9dn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 14:41:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so41653485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791902473; x=1792507273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=TXaw8CJUHTBlCh4kf4ljprrLXlrCdanA8PhzSKkwlOeI+xOlCgkl3YjlEDFmCivlpj
         +q1MKpEwTZRVsO3/f7dIn55g4Rh8D4hCRCMrn13Ha69Y+zVuDR5/OcoyLV+uvabXr/3m
         MrPG5DSqwCvI5uejznmxSUvM5YJyCbTTvsCuEMqdWMRVHqtz7E0enY68UvdJMLb66n55
         rdLfxADlL6gehvKliHPis7tn3Ta+Mak3KtOhMox6bKiabGmraiddoPbnEGBvIE6UUUD8
         Nz4Pg5izlaRlsO7GUMl2gGymDyfGRWAYw8cGZEF/3ZaNeQLLjQfI/Pt7rSPuQmcFIW04
         c8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902473; x=1792507273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSC0VQWbRfgny7aR7hnJsnUF8s4Phgyw8fzCb0zlJWc=;
        b=Gpd2lIggS66qQK6HjEP0ybYdPK5fGEUkfaTEGrnl0QPrNHXFv4lJFpFVY/3ahtX8H9
         GkbOrTxE3TFhuon9ddlvaOLAvmrOHS4wiUsfUMB/nGrdDGE2SKEpHpv0pbiygEibjKzU
         rutH4I2zFL4jn+A+WvE1Kx9eTdoDpPGDMPPYl0xdvcfKNkD9eyee1/wW2zHgWjuwZwlh
         xtGzCeVtF7NamIcYWNMD7jO3eURaEyuo8gP+B0NJ45zF1/92GPnixlhPsU986coMaLr6
         paSqg7AmtuCBmKvlOpfSVWAEyAxYYocUk4LyYuMnGudS5zq5PVvAJn15RemYm2qNtvxb
         vlGQ==
X-Gm-Message-State: AFq9FYJpCKfsjj2qmPu2EM79hYb9iar6MW9hdqxI0q3RCUkxsrtQS0rK
	ipdYD16ZxhWZbX5mT8DrjoroUNlD/xLJtujiZszApEaFThf9soq4sJIcmqfAOHlHl81W3yXw8Wc
	rvu7vg7P2o6nVINmTflnVrvoPohxRxA3GGC5dh8GnRDyPBD1yQkKlp3EIBbUMV6nIemHh
X-Gm-Gg: AYBFou1hPQd45xmk04fdWTd80wY0KzYhw3tfVVerEAtc87MSfWuxdwyi2mzPAE4bZwh
	OFBF2tcj25fM+VwURacGC0xcgDVBNYlA4Es7hje0UG0Mqc5zFzgqzziTse2we4HT24KqX997+vi
	uOzW8CqCvbZBGTRAfkc5SPkUZqVOFXn5bL2FC7lEW/8oHGgY6meFDmCLau+nD3wNBIDC3EAb4hh
	lRftxid5MKmJkUJqd4mDDgT2UCQlbxlRXMUP2jdvt2I9FdxJvl6Y/LFexk1CZl2DoS8RVyIuG3R
	xX82FRzEJc1B/YczKX4Wji419KFlKIHMi143LgccrTQcuNVubO0VbrVacSKItPnpSqZSoSnf3Qc
	Bx3rpUzZ6bIpwUzCye4uh5A==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191021085a.2.1791902473245;
        Tue, 13 Oct 2026 07:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1191014885a.2.1791902472688;
        Tue, 13 Oct 2026 07:41:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1da0641d0sm1923980a12.25.2026.10.13.07.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:41:11 -0700 (PDT)
Message-ID: <3fff91c4-b831-410f-a151-847ea407acb2@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
 <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
 <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5cfe6767-9097-4005-a78c-3066a2aef1f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9nd4V8d1-WHI0fN1lMLdh2upFZYTknj0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfX+kDD6Nwx4Pyo
 ilxNgtOCEM4TkX47XzFoRfoQMSS62s0b2wNPo0FyP49VvQYsguoVUWYXB7OxzQXt03vG/ftLtU5
 HeUy1MjxhSGjx7rvkiNu8L/Sswg3Pxk=
X-Proofpoint-ORIG-GUID: 9nd4V8d1-WHI0fN1lMLdh2upFZYTknj0
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace430a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xRnL3yBE-CjZ_xjtVVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1OCBTYWx0ZWRfXyyHT3GEJ4Zm7
 5Rx6epT0tSsrtqJwce5r3dMaA0/DFYgfjQKEYbm6v3GdGd+2pMUaOZhfIAXdLoA35xEURicsEOG
 koKTnvbHPVBYcyXdltQ3nVIG3kpdsVvs0iPegzeKhE9vY0E1XWTsHSvE8LQRnxMUluH/kU91Spv
 e91MW7sQPRMFj69nhBa6oZK0NLBtxZpI1EeM6zGxHZ/WKB2eoydow4RSe4ZrssiOeRFZUBNJ2AD
 p1+GPaAVlNln5JErVxGXHzCewOA40g0WShRs2D1ETHZzDJnXi9YsLI2REWKmySMkC95gpOIUFTp
 SH2AIqzW3DKHSLv9VtCV7TTY0LkwEhIb/H8oGo5fnuhvx+WT7v79C+NlVBthdQ/Bv1uzQmwSetx
 eSfokNowVlqVhD42lmvSfYKYMPreMq07SQKs9PpPZYZh6vlj3Fsx2M+ZJvWxTWbmSb9nULzTOVN
 nv8ia3r1Opd+g3js1zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130058

On 10/13/26 3:14 PM, Kathiravan Thirumoorthy wrote:
> 
> On 10/12/2026 12:53 PM, Varadarajan Narayanan wrote:
>> RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
>> share the GPIOs. The board has to be reworked to change from EMMC
>> to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
>> and include it in variant specific DTS file.
>>
>> Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
>> and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
>>
>> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
>> ---
>>   .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
>>   2 files changed, 211 insertions(+), 64 deletions(-)
> 
> [...]
> 
>> +
>> +&qpic_bam {
>> +    status = "okay";
>> +};
> 
> NAND is the only consumer of this BAM. Should we move it to NAND DTS?

Can we enable it by default? (i.e. is there any reason not to?)

Konrad
