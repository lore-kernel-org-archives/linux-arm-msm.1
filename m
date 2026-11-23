Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470961;
	b=ul5OpBpQrngCjCFR6TkD5EQgebpGh0J018EJS8DurmxkKGF2xkuJE2UsO80st6MSvbtK
	 4ZPHLDrs8gK7MEgBFzDKUavbGQhAUNr00oh99rCsmW701gmEGHMRpegvVAUUVBoeBQZHU
	 Gcj+guUT5EGNukIlbLlrc9+vN/hhiJyuHcTPaMcNxZ+noeDkCaVEzLpiJib0hDrgPRy0m
	 7eOtqf1tZzkPUgDfqYjB0vdNyc8hiF+sMfP50Ct+z8b05oE1eIIEV2gt95T+1E1o2Tc8i
	 MEl9Z+sWSYKHXdhdq1h2+HwDE5KWwr7ubjwfLIvJ7rp4+HUB4EkMhKpquBjHAh36eIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
	b=ecOtzR7gntp7SgrlDd/MHZgCd9nyanw85T+hncYUzUfhUexCuUgSanoKstC1RKm02GCi
	 geq6KPtxGG2R6FO+IomElNI+dUoY0tuSJpx6dFgUxFkgghOfvujB31pYCFkGV9C9vUGcw
	 LV0LSFMMdYirKbY1Fekfur1ZesL8NtLYrW4aoFhDJKSmEJ9HnPL9CXrhATTp8Mb3zM677
	 D96YRel6x9I/TROOBV9sGGnfZ7Ye85gT6zEWU8rYdNOvWeWqYNOpxcCZTPbY9Gcbhg490
	 JakY1ElUcfiwnRTVjQW71NC5/iHr6vfxGkNBzF0/lTX85EzYqiRNVapGEb+eM3b2UMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iR+TY8EY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iu8fcBnI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E95606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0E95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iR+TY8EY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Iu8fcBnI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYei1579746
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=; b=iR+TY8EYrJRphKgx
	//NbEud+rO3GJvgvkVY6QxgnYpFaZU/Zju/pM4QStFIgC5X4wb8oKRklxKN02yKs
	fEWocKFGXBjRP+kOkQLzQyoo0uWu4daFlg/hiP36RjyAWomMSmUVZZqQbdS1rVai
	yNOFS+VQTKizQSFK+UqDh52FUwb0pvYXzWU6jpcNmNLlaYwUArZ4rOye+88OdmCr
	JUbd9No4yTMH3MltAD8flN29FkdzzfdmEPjHk3ShyWLjaA/IACkEMPkLsoENgOP/
	z0becPFmRRp2SmxQgonifx214vwUTxwfT9S8EsL2+G9VnZYJeYUfPKxdVBTzI7by
	+ixikw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tj21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:55:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so617092185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795470958; x=1796075758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
        b=Iu8fcBnINm1s/7RhWcQtoLJmurJ5/O0gOVVrCAmU0LKpt/afonGkoBH/vSE2P6RqGI
         4dmkqaIKcglofGzjioj3C2rfJQmmwzk0H69jO59Qm6fb7itNPua16yOe5OA5mnUo5gLs
         uNCjJDAyCM2WFccvBihuGA/vPovRvkhTIa3r57X4CJ4D+7DziQFK8K+XCEa3g8jZiQUB
         CQZSyo74suK8zBytpVo1jbiY1nhfvPQMN/e8g0Hriyr0zsGCgtfwt2pQ9Umf8ih3ZEdn
         kmQIfB/pkryXH5raqkkM7vy1+ZR5FvVGW1CDvrYl0a1SnA443bmCnbPoRdDwc936zcsf
         bJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470958; x=1796075758;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltuEpeeCJZ0H8nUAa0Z2OFjeh8a+dq59B20UOPR5p7E=;
        b=eObeltY4QSM/6f+wGskCXU3h62+ooHohofYC0FjbJbgqlq+9IolLFE3SK1wNNLJ9hu
         w38sMMR5ca/d99Rdvu7bIFliajL6+jCG/EKpyOUbpmPsZLrqB6sCZMKn7WH8iXIwCvZF
         /QVdTo9oMXsOYxNaQ95ONYO+v6NHJi7/3OZjHYN0/gzdJbW3QGqTH2zdLwTaR7CVcqdU
         dlHzvw2Ds0xcYZmcfn6/W/MM4qjJMphJppqDcMTVD40RZAF9ZckuKv7rHsLdu1nJgX2h
         t1skH3ioWXxBzoQEkg/EWKkaBdHF6F6HGBq6HaFbXyyQePf3zW6NY+lkbKQQ8GHjgoDh
         7eFQ==
X-Forwarded-Encrypted: i=1; AL+hErEGxNtGB5bojT530959MTa4YcSMDSKhziPiw+l6d06mb9xvqtvj0ByXYSZfmWh84+AO63EAGVADAxsQccIh@vger.kernel.org
X-Gm-Message-State: APuU4Z+bvRfE/qYy8mAjfXxmUSYifrWAazmjycIro76g2B0tpvoh6bzX
	TRIkVbgbZVJMfoA0vWQf8n2kUizHGODjv5REL9emhrKT3NQhRMzUh164KvyKbCYkS97IcUZ1E8V
	+dWKnTjd8gEoYa101c4Qyb29VTKYji3rl91xQ/APG7FXCDRsKJ+KlrxyzsU5OjlN8e3+G
X-Gm-Gg: AZFdTZeL+6QfUzwYHJFf6SznsKBAhdjNwGtY5Jop5D4jvI4r8DlwEv/B0f/Lb8YzdD2
	QE3Aa/gnZ1ck/BVxHKgT7+WsM+k9RyOejODQjUB7V+VibcuTMLkkxkqumwJpXSdM3w2zZ6kdRkj
	cxSZ8mTVx3T6aTUwj4nApbweNowntiMBGgmW/q/EekaNJV0uCHgGdIYMbOxxrlKUcRvhGiLv2V1
	9A3zVagjHCjJijABrdafuwx8oFY4A4kTupn+l3YcVwchWmbTMbizbSmsTeUrSh8ChYxBYGF4xn9
	f1BymOeShH0yScmU6vwPH38Lre5MTNQwP7Ls+8Itm+8UVfL81qbk45uTZV1j0OTu/xUlobHd0uk
	zNgn2rhvtauZ1nQGgU3gGYckA9dZWhufBrhwUXTXdAj2Ewr3jvdYBYbHRrPrRyEkNDYmDOL+PP4
	I=
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr1929199285a.8.1795470958070;
        Mon, 23 Nov 2026 13:55:58 -0800 (PST)
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr1929195785a.8.1795470957593;
        Mon, 23 Nov 2026 13:55:57 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm24037890f8f.10.2026.11.23.13.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:55:55 -0800 (PST)
Message-ID: <9640ba5c-a538-46f8-a80a-385c0631f9eb@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:55:53 +0100
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
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
 <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f5Nexg1jgkRX_aXhLs5HaZOTj3pEIw5J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX4UO1yCBSeA9e
 cXpQOI0lKnxPOc3cQnnf1D2KSSNn2LWnzFtV42V6dgqas+zkWhzQAmQKQtNnnms58Z+eXDgdXzt
 2a2G/vBcG8KGSbYDq+SZ0by2Kp4smIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfXy4vYVPhV8j5S
 kTaXVuCAgbw8fHSGrfCAfSL7pt7JIjgODkzaMsem0K+TDPT517I10hOrKuEeOy+TM8hZkkfx0rj
 +lY3bEwZQ36hBVbbuviZua7LrUd8UQ5489Hg+AghYeJutVjELg+hRt/W2qZEKE7n8wTF6UR7k3l
 4ei0llMXrJLEFi8jPRnT5a5fY87uXj4XNNC3WvIP+MzaSBZiV9317ZonJQdhIlb6UtGRj5AH4na
 auqpsjawF3q/aLbdfd+RVTyy+M7Dzm1oQT4oP1RQZ1bW3IeGUaizyTvCug9c3t8PuJn96GjzeHb
 A+2EBfkUWcjEDK4NnU8Gq11jLWfadEgr2qAXzXrXfRXF0Oe4jJkpEauXCZl07n7U9PaJjr+fZ8I
 SH83gHPYwlE9I8bmtHUVvaUb1bdwrMWh0uxtGJHfTotr+01WCUfvriGy/XGvWUctoMsCD+FJwFC
 7f7DN5avz9Wm5CdGiNQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04b66f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2dp_lxLZj-RLOlf8FDYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: f5Nexg1jgkRX_aXhLs5HaZOTj3pEIw5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230087

On 23/11/2026 14:30, Shawn Guo wrote:
> On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>> currently used only in the socinfo.c driver.  There should no and there
> 
> s/should no/should be no/
> 
>> is no in-tree DTS user of these, so none of these constants are really
>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>> that part matches the concept behind DT bindings.
> 
> Not quite true for the start of the range. The constants themselves

I did not perform global search and replace that time and not sure if I
want now, but I can keep the few values if this makes sense.

> are not referenced, but the values are used as raw numbers in
> qcom,msm-id:
> 
>   qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
>   sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
>   sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

Indeed, these three are actually still allowed to use that property.

> 
> So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
> which is the same category as the older IDs you keep.
> 
>> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
>> header of socinfo driver and use it when needed, so later they could be
>> removed from the bindings.
> 
> I would suggest converting the boards above to QCOM_ID_QRB5165 and
> QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
> the in-tree DTS users become visible, and the cut is no longer arbitrary:

Not sure if I want to add that dependency...

> everything left in qcom,ids.h is an ID actually used by DTS.
> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 96 insertions(+), 1 deletion(-)
> 
> [...]
> 
>> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
>> index ba823a0013c5..cd2e8eddf3b5 100644
>> --- a/include/linux/soc/qcom/socinfo.h
>> +++ b/include/linux/soc/qcom/socinfo.h
>> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>>  #define SOCINFO_PCn(n)			((n) + 1)
>>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>>  
>> +/* SoC IDs */
>> +#define QCOM_ID_QRB5165			455
>> +#define QCOM_ID_SM8450			457
>> +#define QCOM_ID_SM7225			459
>> +#define QCOM_ID_SA8295P			460
>> +#define QCOM_ID_SA8540P			461
>> +#define QCOM_ID_QCM4290			469
>> +#define QCOM_ID_QCS4290			470
>> +#define QCOM_ID_SM7325			475
> 
> [...]
> 
>> +#define QCOM_ID_IPQ5404			671
>> +#define QCOM_ID_QCS9100			667
> 
> Since the list is being moved anyway, this might be a good moment to
> fix the ordering.

Ack

> 
> Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using

Sure


Best regards,
Krzysztof
