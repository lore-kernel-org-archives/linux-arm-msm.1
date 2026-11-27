Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773061;
	b=XmebivAnF/lvz1eSdYJB7b/YAxm6JRVlavjRE4OFXlAZEwvYzpIPsxe+Oy8xNGcxi3eM
	 yfTqa1UTyMDFqD3JDppXMuiMw1i4q2Q/+awr1X7HmMU63Pux1W/EY1JxlmH0GEGjENtPz
	 vdDzjP7JPdOnlrVWM2b/n8WsESjthhxFqPxeaYZrdagt7DwL/fFWyzieu5K5+mxf4X5t0
	 Xn44FSMs1CJ97xOHCtBT8SQ+WEW/uvg/y3ccAxAq3oX/hWRZY54zjCio3BDpT8g+JBqW9
	 bn+KggjGLKWDqq/OFzQtVuCoikH2Z2w1+wd08H8Eep+y+T0tCJw23n7F4d1/FwqE68g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
	b=egmHm9ER0UWa9HcE2N8J3gfx1ka8OGpiu1mKKixwFaRnsjMatbUCiqrXYElzp2PRLRtU
	 iUNwZdzLW2pEAjMCpvljcsofwfibejcCB0jI24fSeWOuXj6z2JAg8FUxjrqnGZ51Ler9U
	 woriE0aaCsKi/dyXEoKQ5v5HfhCrcRhRA0d8DOmp95nA/JTBF4kFHwyoEAaAYUDLuOIQZ
	 FnbLQxEbq4GIlSkjxrEcGUD+ucJi480I+84ehP7KfgkfEUsz6VlPdZircJ5hTpp0mXGOE
	 5eswu9bf47ZsM4J0Q7IxBoNydYCD0aluBSPb+S6wIFH9mpB8O9Y9K2X68zX2WD+i7SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66626606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66626606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ae64XGVr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jpXlsv+v
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GdK93983894
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=; b=ae64XGVrDFdsC2dL
	t1qoaEHuj4sOmQrjztuSDgEtSAmiED4B/yJbpt4LmD/I2QKxe3JCAwjsBAbPQxgF
	BDFSjsmgcY1Js8BISsFGMrJ+WoMCFF0eN7a6ib28gMNobVKVse9odgvqrDPhu2KJ
	MmdeOcCS4TGPOj/dDhUUtLvFFt07ZwwUgjtvTA+xle+97EQ8TMed4z3nXgsePb6I
	XAXsIsW9YVokD/lg3Qcw3abpRLZCo84j20aEoF6dtMQHT7qBwu7B7alZ7e1YUieH
	GYq4Yb//Crc9urwpT0nIjHWPBwR7V/MUOn2tpKjI2UsH8xiUJC+C1KThXb73oD1i
	fFIy+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49actx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:50:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0717e54b0so55944805ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795773059; x=1796377859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=jpXlsv+vMpOTJEguY99AhFXxNHoJ83C6PYEobd0QjtKeZIPZmYRVNE4v8EBZvRbUB5
         ckATbqDwUDiM9JuE7PR0kRPPgZHU+jY3PwGASJq8wEwm0vxOSvAlwdQI7VdTc2zOuDTP
         cHRXVG38YDBruA9S/8Q6+kw/lbCZEkILBtTCkhEhY4YS72CKjeCi15hB6SKXnjpuXE3E
         Epo8iznUpdDEtmMlrZEQBAcqYADVkHOpdQCBY53mJYnSGOqrnGBu7D55yhuQ9OEOt2vN
         x6Lb/uCu9gn6GFdimJ1cOHgvfpqNSRPWf0VAEA2GjOnuGw7cFyOfhKX3s8tk2v6URm+v
         5DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773059; x=1796377859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A81/evmtXSXLzvLuiLw8StiMfkySlbyx4fD1Kh2PSYI=;
        b=FiL6fUHt7Fa6r4V3IMAnkEE0DmIjsBUmJox32EoPULnMwbiRbJITdiK+vlYcEw0b9+
         Aq4QAfQb9NbtVbr+TImP29VPtlfXjRRSsw8DSkCdcouzRw/xgkJbvLsp+UPK7Bkk28JQ
         Vm7qwASGgwt6ka0DeGjknm+kFHhuY06ZeFRGAcVtcTmaokY9k8dUR+cWveTOs3szWPSF
         /JrKmISaCtbnnlEKUSrZhndPZJoDeMmzg5YoRfRRCNdvCfzspxsagnhGiLnJFsmGAI1V
         w5v/U5lE7MaZifTDMMM2qNoEd9PljVVB6Wgms549NtGnaKV4+gpv3MYnd5ADGiNsenXg
         Ikxg==
X-Forwarded-Encrypted: i=1; AL+hErHfXb+JXYtNrDZdcpB391NC+4Dwx+B5uIa0G32zhXGs5oOshhJN4PDlWQnT2c8YPd4PCD2lQqhrBnXjHpJA@vger.kernel.org
X-Gm-Message-State: APuU4Z806cUxH27YvrqdwBmpn4cPcaXqxLLDYh7PjuRGnep9T18FW0M+
	fV7cB0OGSyVglatQRkv/SE8RaEvuP1fkCyQ2IDlzB5i40Jm5baO1c54sPE4ksbWKyOgGRbjZUlO
	FxbAvukZ8e3+3RXKGn5vjLyaD2c1+nzgwgagkJaPntMsLXXpk8AmwHhAA388cxRLrWdSB
X-Gm-Gg: AZFdTZcX/nYmxHQKpmfTueVD4I1Wpl5zdX9n/eoYmYxdwHMiK8q7KxmVGfCah2weVg+
	eBN/nODrGSEjvbCNTW2Fcrwc5SsQpWFjJ7puH2q6qLnsL9gwurE6qikC5oiLXTZ+KxsD2JMKiu5
	7SLblHK9sJxlRacsVRaf7bpFNu2Twe1KtW7FBiQd8aBJ+d9XksWCVExyZdGMtQXJoHdeob95oQf
	crAQ6MgbQmUjpgTlZ5+6pP9/2rll5Xazr7Mq4frGw8VuRXAmDq0QHv1LV1/jiEes750/+SiyQ76
	UFt9s2nWR+BQktNonUuntXL54XHy2YNUKbhxTGV6y63BJF/sdKa8ZhYED27IovFAnlP765jidcq
	5RHNpA7eKlpuUjcScnsRiyljHMZUI9odMP2nNXgtNxm5bTpK6X6x8mVv7W2/sPk2U58SsGUT6sO
	ENMejSpAJSrx6OgZ0tnFeZ3Hzzx00sWzNNr57SOTZd3s8rQ/Td3Bjkaua0lTb8xEyZb4Pafc011
	47d
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367462637.45.1795773058846;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
X-Received: by 2002:a05:6a20:b40a:b0:3e3:37ff:3797 with SMTP id adf61e73a8af0-4014bc4bcddmr22367439637.45.1795773058397;
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm11467784b3a.23.2026.11.27.01.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:50:58 -0800 (PST)
Message-ID: <920b2c6b-53c4-46d8-b949-9c50795ca15e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:20:53 +0530
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
Subject: Re: [PATCH 4/4] remoteproc: qcom: Fix bounds check in
 wcnss_da_to_va()
To: Atul Akella <atul.akella@gmail.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, sibi.sankar@oss.qualcomm.com,
        quic_srichara@quicinc.com
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261106184312.100-1-atul.akella@gmail.com>
 <20261106184312.100-5-atul.akella@gmail.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20261106184312.100-5-atul.akella@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RQ23aVJc9xYtJCZRLztsrB-yr_wLRpc7
X-Proofpoint-ORIG-GUID: RQ23aVJc9xYtJCZRLztsrB-yr_wLRpc7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX1dMnhZEHwidy
 qG9Ia7LAeSZhM9DF67zg09AloAdobQbomw8sPrgAFWxb74mbe3TZpjzsKtTqAfOaaujPs8xHifn
 iNWG/KPEftDOkBpaBlsEmIkqysXhvXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOSBTYWx0ZWRfX+vEvosa18t4F
 1WLVkxoyaQHxuAwMi/afESu7T8QSasvdLwPKhZrNB5JtTweKKuJqaSyYR1zNwexGotEzh4xx5ku
 H5u9LquTtFL2Ka26x8oJYIv0ZqntWNTsRLPiZE4retR8+qFF/W79IPlExfqN/b9D1C2E4asfiT0
 wMITvsZDH1X+C8lMSQV7nNIVdQIl1WRGdpNAPdhNPVrlKvIICGAX6kcO6Gzt7Jz0fzTjNFNxbbY
 6gT5oGBBDzvrssru01zBsimSGO6OCOLa7E6ssiKcsk/4jv96IW36UZrg8iocOXo5nEFR0E+2nPX
 0JVYIJ8LkCexmsp2HEE1m48VQvvdWpNM7Asz8IMVCn3q9VNSVCjrdNtvUuq8+ucqA3B2eWpZFF6
 aeHvrX8ObA020JJJnn17zdj5SQkNzQUAjpxVXGjpf20nW7JDSTySKhGmJROE9uhD6PVhdr7sj9w
 CfRreNkxnd9fcOlUxLA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b095283 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=E4ycadI1TCjYcBWHacUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270039



On 11/7/2026 12:13 AM, Atul Akella wrote:
> offset is calculated as da - wcnss->mem_reloc and stored in a
> 32 bit signed int, while da and wcnss->mem_reloc are both u64.
> For a sufficiently small da, the 64bit difference is truncated
> into the 32 bit int, bypassing the offset < 0 underflow check
> with a small positive value. Additionally, offset + len >
> wcnss->mem_size can itself overflow when offset and len are both
> large, providing a second bypass.
> 
> da and len come from firmware's ELF program headers via
> rproc_da_to_va(), and the result is used by the ELF loader
> to write firmware segments, so a malformed firmware image can
> cause writes outside the carveout.
> 
> Rewrite the bounds check entirely in u64 arithmetic. Reject
> underflow before computing offset (da < wcnss->mem_reloc).
> Replace the addition based overflow check with a
> subtraction based one (len > wcnss->mem_size - offset) so no
> intermediate sum can wrap.
> 
> Fixes: aed361adca9f ("remoteproc: qcom: Introduce WCNSS peripheral image loader")
> Cc: stable@vger.kernel.org
> Signed-off-by: Atul Akella <atul.akella@gmail.com>
> ---

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
