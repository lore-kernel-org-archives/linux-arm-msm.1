Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA24FECD8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061079; cv=none; b=pWyYnJtRqAfidoGrMewpJs8ELi6PfV0kGTDvs5dt1PGcXYwzZVd5ji/r46ZnRmRqenI9MOnGlx083SJ1co76LSWz37nJTYLiphyNm+KBAB6FUBSaOOwSXVgm1JbTCgbv31Dp6CUzWTvjQzh8xQsVM1Nl78IOrryo/IYPpZHf+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061079; c=relaxed/simple;
	bh=pjmB0KZlmblBqUhkEx3AkMCixjS/J+z8FmoDfp/UB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMMgMjLUaFgMAkLJsW9RhRCR6grM0Dpq0TUPE3HjSGBNRWqdIlIwRDRkBbPm7tvLg58Ie80V+bsq/TMQD0CMCJwZ0QGjxN0oTlwXqPqInb3BKMEdj8b4HdyxanHCuPkvfPeWgbdwzL7Ymdn4ZM2kQC9VaVfUkRcWjy4P6QRpQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chKRnG5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8VgVAlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chKRnG5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8VgVAlM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jO5d2114138
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=; b=chKRnG5ZAvs4UbHN
	fE7gXArvvnJfVCAcXdqPVAkqozgTYu/5pTFUljvjqq5YU1qfakhtvue7QSD9Wt/m
	uyxtUGXIXgBV+p+7rX06Ax3S0L+X9iD0pIhrPt9dLcL4GgpnzwMhBvEZOnnP6tGj
	8uzSNNbcM8+qCn92LMrFzVfmXjPSrjPq2db1e2+BYWWupH0MmJLWVN6mW1XFSo+b
	E5PPL6wqiIAwrx8F5foxc6S6mR6bYVeZrXML5AZAENh9osUHzCqdVK3x1C/yyWLg
	BWR7dmD88bRwxYZOXEfXII012rP2icJ4glvo8/LvhBFEXBKV/6TwcJWeHB6LeeBK
	NsqG0w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyamdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso7732609eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061076; x=1792665876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=F8VgVAlMkA9XSY4Tm5bI4sKJmmebfslRPddRI9n2LoPD1tceawlRNyggpMN60QjhKC
         CGMhHw9UKd28U9hmAR4W81zu/47KNWCSo9OgPRxmpO0HtXTA8CTsbCeR159FixulhXPX
         qzMOUlBbW0C0yLFQ2/HC/uJuTf6hHs0TXpTX6mUM0QAylKbmWmFMjzKods9aAo90TNlf
         IObuNmMNYGhrXvpG0XNPzr+cEQGjFaCtZKyzK/xOC0/qMWBhlc3ro+kuWXYuQcJcZp6F
         fgP44m4k3FQPJqP/HtQV2z3ssn7/1ISI7aOk5iiQWWwBKvSYemRlP+IJspik9/rICeI8
         MD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061076; x=1792665876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=Se0L+403d6n3IAi8k07dRQtlq4whbZzGXUUt8qQ3LAQG8W5YwQCCt6BWoXgvko3+Om
         GHWSyE85HaJPvORgaadmNiE65+DpoRvM0SrLK/BLpVw/5g/CYR8BX7jUC4Sbw0QicF1X
         GOcBF9tUfnCKQba4Hbjq111NDYlap3Vg0RoD1aYYl2CSNGEVUdzdX5Kyqsev/8a0lHj9
         Yp2Vx3X4+0S+q/NFAVVI+hJ6hVoHIN3yAT2EjNYmQpMGRHO93VO5OVtToA5de1Y/dCp4
         nX1P3OEefI2gcm9iXZu/xRZwTtJZvmuqbs6eDm8H1CD7lAh/ShFjDXVDewmDyertq62l
         ly8A==
X-Forwarded-Encrypted: i=1; AKwUvBxu6j4OeEVsV44TYpQZioggcV/7mCEHrB55jhGICRBSqQ6f76v352V8dXPZwvkvAOvILh7WYrRCjzckeIiu@vger.kernel.org
X-Gm-Message-State: AFq9FYLQVS25KD8BEX5xxNdStYirCNl2bNgWXvTXjOoYGsOIN/HopjlN
	4kWFUDTaEE2eg9cHiLkteIpQb3wNJq2eX4MxPSyOWFH2lWSqEevCOm3db3x4O9GTQwYMDC5kUo7
	WkbR28btoMjoDZLneqXr2tRCGujmI0MaRLFc9UYLlGx8ryJAdtDUJirN5LiL68yc+H+Jd
X-Gm-Gg: AYBFou30XnQEuXTRpDnfnZEcyyFbAu9Dhm7N5VlGN1aS/hwXdbyKSeIn8f9rXrXtKy+
	QLSwvBejdawNa/XPk6YgEppYUgQJ7i08ORKVES8H63fLQLEcE02LAQcxwzX5gaq116qTfH3qeiN
	1xmHFVqtVOTuL5/KtC37dLh2smfkpP88fc/YdYHj3AB7lmvvmdgatj5LnsJUGFVr93i10aVI4aa
	Lt0xpS2zzQ1uqVhuOuB9MVoyFMVPiepjpAhhdkZZLH/+tG++zAUcdIu0Q7BbjEy2949JQqZaQB5
	rgBeaBSG5HA07FNS+S2VK0EpAC4ynTH5UUBkyCAAlOYFiRMcUOhf5El/1MbtTD0lAaX4EA+T83z
	UptkUChbJtzmp9pbpB5ajMSDaAlY=
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299369eec.11.1792061076251;
        Thu, 15 Oct 2026 03:44:36 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299334eec.11.1792061075690;
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm26096247eec.23.2026.10.15.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Message-ID: <e65dc4cc-b080-4af7-a443-d837fa596adf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dATcZnWkwgtj6ygnV1qj5_STQ2E9jfX7
X-Proofpoint-ORIG-GUID: dATcZnWkwgtj6ygnV1qj5_STQ2E9jfX7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX+WxGGhwdJ5hV
 k/PNaulhdoe4x3vferz/JREn3+j0cstpkmBCwE2qcqrJhLqqUjU1Kb19Lq/WaEwBVOK5YDYHpOH
 WgGLpX1XhEWHRpOZ2wR4zg2XHlgH+XE=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0ae95 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Yqn-oMa6LnlrTNRXoS0A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX7suDvDvE1u1g
 m+9/RLyMa/xS9adE0/PacozRFhBZ+OrYPjzwAICXnhLGTnia95Cn9r4R8hj+65Fmurz98TZ8k77
 37GpbW6VrmmT1TgJsYdia/XaVjLlRt6KbTUK4vdWvDGin785PiMIyVE/aZzJNmMPTvel79TIXOu
 8qaHM+eBsbmP/N244u8zCc/8tdecDjUIajUNf0Mk2sw29LwE86I0rD7wlb9/cizNkWFrncgw9AL
 YEWCPHGmTkeemecANSShR5nlPlL9KcGnbq5S9Kq9DtujtNSQI3gyRFZ0xpK7IeZd0A8IHAwVyxr
 +1q6fKwFWmWGXjOad245A4vDQFG2vYB9COg8U+kDaEegmwJbCzm+W+i3MFbqB4HduoqODuGVAux
 n8sN5Eeb0Rurk7cHxwUPWYW0Mu6FEDDyGPRLp6Uui54d1/yIQgnYhD6tvHEya+/tywA+XL2BCNp
 c2XPy/+Aus0U8BaBU5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042



On 6/8/2026 12:52 PM, Luca Weiss wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>>  				function = "edp_hot";
>>  			};
>>  
>> +			gp_mn_active: gp_mn_active-state {
>> +				pins = "gpio35";
> gpio60?
> 
> I still find it incredible that the QCM6490 datasheet (80-20659-1 Rev.
> AJ) doesn't even mention this functionality on GPIO_60.. I wonder what
> else is hidden on these SoCs.


Thanks Luca, my bad will update this in the next patch.

-- 
Thanks,
Taniya Das

