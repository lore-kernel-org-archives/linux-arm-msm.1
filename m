Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812119;
	b=SNd2aP4n/pPLnmHp10CYzxeU+kB4/pZF5oWnVVg/XXlJ3qoaawkwLJGUeGHHhRTyt+s9
	 kEEs0XjkHaHMxx4XMECovV/pVOTSwUv6IyJEt7TeWn/tnykZT6TN2tX63kP8GlgK/aU3h
	 lHx9vPYWfqnVAqJ8fr17tLhYg06O/jOkqWQsluzprn9j5QVswQso8TFfvXauekqQuIyK9
	 atYfL0/QU6/MEGkm4Xud2qfkOf0Rcd5yd3pQ9m4uaZ8h8xLPJqc+DaXUdHsdZg+s4OcMO
	 ZCIT5oAUTiUgRq0l8LhOzZO0DOQOKNuqsgyLdIcvoX1hv+WD6rLsg1+N3H3hf/QDWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
	b=w5fmUOv+cWbvY4zMaq693ZHSQzPvB2xPPn3huH2vUWMEg3SWRUwdnrAAiuq/+sIRiraQ
	 KKbMhwRkTqeo1JmVP/ouXcY4PtfAFf7vBDN4VSc1GcIC41P4AiOp+5IllBH8Lwy/epdjs
	 xOWIN9BPGvt1F1f22/GchyCN4EbCU3gWZjUCYzo8WiJrshkjo36yHyb2foTx1rpfgH4QS
	 TevPSt7Bv0OqlHTPlKNjpsg44A1bENEM/EtV6EAubZjo7HV8t8Wel+0DoZpeivsciXhoK
	 VC829v+3Z+yi9+y7zf1YKKdcTPbnXsmimR2vNaepsZBRFNnZ36Qe8uEEuuUwHtdp8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LUgxieCU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34328606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34328606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiC5mAwZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LUgxieCU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5M6bP3177815
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=; b=CiC5mAwZQuhjA/3S
	vrccdDUJBeR/HCw0avDpc+baNEZLEHdQwnxrvTbCZwJNprg2nHmcy7AmmLoKRCk2
	VST4d83JLMhkAgKwusf+MBUj5UgOIt+PeNKoG3qvaaDXttwrTH6YiIK8eMLBLdMr
	yeiD1Z0HPTKTdPcuXQTJjO06e27AHKX/ucdjpFzB0HKm/isnMJLesQ3pkZJmP1zs
	Bf55cEGE/FxR6WyXaGT5zkdrHGwRUfWl0POTLEKNIDS3fFlUbOs69nfcEfmUYMqO
	UoNDDVR7KcFS+HTZQ/1g6TDwouAeOtJSlygJWoolxl+FSMPoOjSEOmnEZK+4gRjF
	VTIs0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmcd5q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:55:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso2631866a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794812116; x=1795416916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=LUgxieCUYdbtlQvH6wQftEsHlREDdzIVDEGwEZvM4EA8ttAOfsV+6e0tlhwWjQw10z
         dFwbJNHmon3Jo9P2qNZ3LXubMsN18OwW2mwlV1384Cf0Vj0A9rYH4vf8aVSqOJDHu19d
         eBViFWDt/hnTAEyaTpoED6ooRv0Ex80XTm4+v2cfEGmIL/DyQiI/CeGI3TC4JIGgi9dI
         d4y0ySv1HwCIotASnbVYkeLSxyTm3oHwKoXhHRhTfFUe7JwT+JMH08VL03pCpf6Yh4At
         k5jYnXsh43LlMLRFyfTayH7bA947AsTjwt4vIRs8u/llO7OcYnuEeZyxW7Aj4e5mpW80
         VvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812116; x=1795416916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M04KcOfwG9b8qc/Tzo6l+/Fn22+OnPocu0yxZRNzOqw=;
        b=KW/25FHSr2AkEnC0Va8YovnQ8o273b1kvugwRQIm0ogCJXuWPZqv/ceMQDfWv7OoFu
         t8piiaYxeKsjS4DIevhcxS03Lb9ppC5Z2QB2jHWEXwldwHCdz78K2pxTQF+7sGSy+gjB
         w1kB4maYlQTmtDOj+UsYItAq++iKgwfO5nSsbJzYExt/0kNbEys02c1fiuLtMd1OLRvK
         7adkinTSOkEMGitPNsjYyzlFVVRqjVBYKFhcQT09hs3LD7ocozrf+nuDX6nWuW3Oo4vP
         3H4PIYjv6OxJ7v5s3fYDt/DWLyLjDAuwtOaFbl38NxzwWozG3f7I0q1roebSgk56d4kt
         Qb7A==
X-Forwarded-Encrypted: i=1; AL+hErHQsqTmRrGw9FpSqkJeYC+YrAk6r7svKJ25iTdsQ41vI699NPuFnXgSMlDdgC/1RRSmjUNnH4cODQHrdR8P@vger.kernel.org
X-Gm-Message-State: APuU4Z8hBBQ1ABGxFk/yzZFYBQODfyp5sL7exuQVbh99kQi/JqoMoZHD
	ABgqTDWcQTsrEfI7wDNYI/SLRM6e8nYvg8nKYfX+H7/wnaJ7bsO76zaQDWbf+X4TvKaV6E/JSeX
	y0GCJi1ODFnpuFgxj/s1UQpNt9XTbmK+In9s83fMZhJns2XIxgiji23PlxHo1Hhis3+R8
X-Gm-Gg: AYBFou0iVaBssMabfR5ameW20zQIopgOH4XVbHn1qgItRVBy2FMiHmQmA4X6tKt+okA
	AGycuTh5b9mqWjh+28F7Em942bgqX/TgzJ4ve78FzAeDDLDuhUqz9oSvhfg4nTJzhXZ1To1FgUM
	z1kWwkKwf6kRT2rPngivQCwAKbnO3SEdamAwL6GYGNEqnwh79bzDlaKzLth/z+Gu09QCwMQcE5O
	7PnkCqh81avRZeYezqlF10xJi7D6rneSegn73WLeIkvpNlqvUfhgktUZMmYvIcC+0IAPObiq3Za
	bQSGmMwsJ7LbWFgHyzAymdmnETz0QKa9RFJ+Y9OnbgmzopDmgoDG4Ri4a45vVNn52Ur5BO1UZY5
	bXQ87OndjdKj4jSKjL5czltLDLDqX5F+/J9rolil+vglMuCgReBi4jOEzqGSLpnw8kBWhRgQcRD
	Sm/Y3u5s38MW6HywjZSAb7HNcV3Vj771e/NbWLmNHUUBI=
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667893637.19.1794812116546;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
X-Received: by 2002:a05:6a20:c998:b0:3fa:1ebd:2216 with SMTP id adf61e73a8af0-3fa1ebd2b12mr3667873637.19.1794812116086;
        Sun, 15 Nov 2026 22:55:16 -0800 (PST)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2829dcdsm3208979b3a.48.2026.11.15.22.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 22:55:15 -0800 (PST)
Message-ID: <01333b29-8739-4791-9339-45a66811fc51@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:52:56 +0800
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
Subject: Re: [PATCH v17 02/10] coresight: Move CS_LOCK/CS_UNLOCK to
 linux/coresight.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        songchai@qti.qualcomm.com
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
 <20261113024935.3173715-3-songwei.chai@oss.qualcomm.com>
 <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Language: en-US
From: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
In-Reply-To: <2246263b-a872-4a65-803d-ef1e031522f9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXzS8TFt8oY5Em
 vpeEvVMeUFVzebWT/xohOcykL8tOI2RrSlPmKRxy32g3/H1rbZ1v1GCkXJVCqH0scQBygee3e9X
 pQRZvtn9hhx8HqRdPU+ZqwVzzlcZoKU=
X-Proofpoint-ORIG-GUID: ebmbD9bS4GsoG1iBSPFpzHPQ91iIPR1v
X-Proofpoint-GUID: ebmbD9bS4GsoG1iBSPFpzHPQ91iIPR1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNyBTYWx0ZWRfXzEnuJSXLB7vM
 OEzAqnAajt5dfiNAkcJ1PwolLKyHBEHT8zB2h8R44f5JE4GOR3/WPAWN2nC32zh76ZPjtqyW5f0
 ARbDUGHFuIhZe+jiUDLO7p9QqWyAD7EirLBJNC+KsaYFisj0hWX4yr0dfjxjMLrBLMVs8iVOhn8
 /GjAg1V9fQhq/YW6iKykDiDyXAPwFCty8rb+Qe2cPQKfGgYtrSF12N3BR7ta0xo0Mt+sTh5AOCa
 o3he/Z/n10qivuq3pS0cjqnpURduzi2dWCuLhFaiPlJOYdeMhjDPQT8Sdp4GUKvnpLBUrseAayK
 Z9jEkoHLhSPC2LOzy8PWqEfIdUbdoxwxk6cAP4eKrpGh7oFa/accFbPASOTeaaA91xAnIrNwIuo
 YgUzNtdgRwAMaCl9bJQzaDg8gJb+TCGdA6/tZlLOhzkeEuVj0H+hIrsRHW+p4DLTuSaNzvdxv8G
 TMyTSVUuHFMqpjVOCmQ==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6afaa8d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=HS0qQXPI_2Gq0Hqk6xEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160027


On 11/13/2026 6:25 PM, Suzuki K Poulose wrote:
> On 13/11/2026 02:49, Songwei Chai wrote:
>> CORESIGHT_LAR and the CS_LOCK()/CS_UNLOCK() helpers implement the
>> generic ARM CoreSight Software Lock Access Register sequence, which
>> is also present on non-CoreSight-labelled components that follow the
>> same architecture (e.g. the Qualcomm TGU). Keeping them private to
>> coresight-priv.h forces such drivers to duplicate the exact same
>> definitions instead of reusing them.
>>
>> Move CORESIGHT_LAR, CS_LOCK() and CS_UNLOCK() into the public
>> include/linux/coresight.h so they can be shared outside of
>> drivers/hwtracing/coresight/ as well.
>>
>> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-priv.h | 19 -------------------
>>   include/linux/coresight.h                    | 19 +++++++++++++++++++
>>   2 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h 
>> b/drivers/hwtracing/coresight/coresight-priv.h
>> index dddac946659f..0d3f6229b282 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -23,7 +23,6 @@ extern const struct device_type coresight_dev_type[];
>>   #define CORESIGHT_ITCTRL    0xf00
>>   #define CORESIGHT_CLAIMSET    0xfa0
>>   #define CORESIGHT_CLAIMCLR    0xfa4
>> -#define CORESIGHT_LAR        0xfb0
>>   #define CORESIGHT_LSR        0xfb4
>>   #define CORESIGHT_DEVARCH    0xfbc
>>   #define CORESIGHT_AUTHSTATUS    0xfb8
>
> Move all of these register defs above to linux/coresight.h. We can keep
> them in a central place, in linux/coresight.h and drop patch 3
Confirmed.
>
> Suzuki
