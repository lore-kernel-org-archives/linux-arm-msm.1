Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A14412C06
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039770; cv=none; b=fpdwOoxo2obkL6OZNgfRYFer5DHuUXesklHNMNI2rY/qoXHHlAKdCczqSsG3nmXWeSXAeueX6IvPlm7t9psjl73HyIa+c2TBPEKfjv3fraS79ieUQ9PsrT16FaBquAwLBUz6QccysEsxrxfrYjb1i8QXUn4TBw9Jssf5DSWFYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039770; c=relaxed/simple;
	bh=ZZA818poZeLPwJ66fKr9ucJ5v0H6fPiVOi/uQ8Os00E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrM+siMhm39d0vXHkyi1JJV+TsLz6SO5cfbYEAsi8mAOktjql6ynukK8QCEDSt5qphA9yyzg3O0OvO7PKZPDYigV3SFKHiSbyoeeoRA57sG6fhimYiu+7lCDAL5cS7aWWA8WAgdf+dos+0tyKIOzX39kDpNPwVdVwht9ApiYlfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU9NcURn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiRXlmeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU9NcURn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiRXlmeN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7j6uc586510
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZmVT3jo06Z/YRGHNP2JLv1W/0cWF2K50EbC5H2nyOk=; b=iU9NcURn25ZfDbML
	BcLz4NLUI1h0cEFVZcz+/Arwhp5OuIO+1tddrsBfdkMkO/7IQx/lq9jneYRPatHm
	03MEQcr1VK1yrpo3GGtq8j1hP0nZjeBTi01M5rMYHv4mnfNFurZDogoUhsghHO4R
	SfWN7znvtKenSgByl0P2bRmVg+4OvGdyv7UqvinPkYg4AOLtbPMM5eH4wCTiahcG
	PmipRkDGj0/DDQvFVIfd/eZyH/Jj80hC7vbIBvTQVQQPGg+iGufixMPoQpZ6sj3y
	2mEih3btSyTmzkDtsLYIaDvnmk/jCBy7jH9xxDrALcH7mToBld3Ttq6hGHRdaUAD
	Wcn+JQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bej8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:56:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso7839783a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787039766; x=1787644566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZmVT3jo06Z/YRGHNP2JLv1W/0cWF2K50EbC5H2nyOk=;
        b=NiRXlmeNvhPVLPKHi96u+RISZ70lrGvV4i0KckhqeJ1ImbUpR+hOmBUUqhEbkvp3jz
         4mQT5vqhbGfHl3xOMG723QbRIPiLixg//CvaXHGWw/IdK4y9GnALi5LsAFJhzRXh3ayW
         FAgQbaOWhHYsXb9kC5FtkwX944CyG0JQyKza9nqJMJVo/8W4lSb+i6H+QMRex5Ep7hSG
         8atsDcqwr2H79sQYowzeVJmlXaw6uumIf30Edo2uLSYdWPkS0EXMdFPI3SflW8Lnz6W5
         Z8VExCLa5tGMtw7CgKARVwnl48c0lqHroKhaTlLFN4iJU4HBYzgKDC5y3GYJXsDQcRy8
         7Esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039766; x=1787644566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZmVT3jo06Z/YRGHNP2JLv1W/0cWF2K50EbC5H2nyOk=;
        b=oz/7gOI8WXIavpbU1muCFoyvGLD5FneChcEzaIPLJgVv0NpP1KcN5qAF5y6UjS4Gzd
         F6E2eeJzuDbDulxATOCM1N08RALQNOoebXDtP9KiaQgv/rgCmH/R/8gNja99+sxZRbG7
         ZYfAAA+HtZRewlxqs5SkxkHzrwnWOGWtq54LhlOzmXCJcK//SbTHfW8+7qV/FKNVWXkf
         VGdY9Qnffl1wsDAwvJVFQvx8JfGododLnrZSMvd2ABHNcnwSauk8Chg3J3+qR0Obb2Vh
         sVTIiObEwlaKoHQ6BsP2PPoBhhYNqcxoVTFBBHB1EnAYb9+f3rpKpK8N7qyN2u06nHGi
         cgxg==
X-Forwarded-Encrypted: i=1; AHgh+Rrol5Tn68mCXzQnKAOC06li7lDUuyGD2YhIloinuSrHxkiBwttKF1qJiMMsuX6wOu6YfKxwsc93jf5XjzSr@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIHcpdUa3vJw85er6gK0ElkwnSAFGxqZ4NYBmz/cnF6FXiqNn
	AFvtZZaLXTpUefegoYgTyF4hOwH0dQLjeJb+U+doHNvy0rAFIzM8PqeX5hTm3qqQh62QjA8y0ZR
	913IR91hX4YswWHSaozYJucw8IBMbEzbWWJXeIb7dALoQecPAPzOvohXSTTDAolxYcQhVd+UfLM
	G3
X-Gm-Gg: AR+sD12Enmy4l9YzBiehsaad4damDs+Sar5ORPT4S6xzlWqHb7xc4CCavrlgh6XKf/o
	I/55E2GY53bp2gDDZ+fi80pi6wJQaq02Hp5wrv78y+Zk8P8bznjmR6OPeN/JnGdULio0dhbzvfX
	4vWBgwoMLFHs6Zk3vnqH69KUiXzaau6fYHM2FNyHNxKkPKQocp+Hch6E1vRZh38CGqjXy4BoouC
	VQ15LUHNGZhP00kOpr+rMnZ9Kwo/oznqI18oNtmITNtkq8EGTrEYhEiR/If0oh4NxYg3eDmbLBt
	qAIr3c6A1L3ncpkWXTFpayt+BA8aIdzUyOr3CuyJe/ZsY26aFzM75cpEJiAzmgfRCw0BV8y9Xu8
	iU3lnj+1ebN/T78piCoO+x9ZwePdQACjG9bw=
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr39663732637.2.1787039766554;
        Tue, 18 Aug 2026 00:56:06 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr39663651637.2.1787039766180;
        Tue, 18 Aug 2026 00:56:06 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.138.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14152ea340csm13242759c88.0.2026.08.18.00.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:56:05 -0700 (PDT)
Message-ID: <8a9b417f-11cf-4dd8-af3f-494afa38b868@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 13:25:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: Fix iova allocation from restrict
 region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260812-reserve_iova_in_driver-v1-0-ed62f801275c@oss.qualcomm.com>
 <20260812-reserve_iova_in_driver-v1-2-ed62f801275c@oss.qualcomm.com>
 <hzu33hharafxhfdnr5tr23ti2tmtjhls3iwbvmtfllwcv232m5@nvxemt5ijf4n>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hzu33hharafxhfdnr5tr23ti2tmtjhls3iwbvmtfllwcv232m5@nvxemt5ijf4n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cGuvech8FjfDRp_TwkqFrxX0XamfvtXN
X-Proofpoint-ORIG-GUID: cGuvech8FjfDRp_TwkqFrxX0XamfvtXN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1NyBTYWx0ZWRfX0LBNEn5/+YEt
 yukIquUEXzl4D3nbheDfcDhMenTA93PaecvCCLMTo7Nb+ZihcwbPGQwtr8Bf/52FynHxIXbOvPX
 w33PO4aRYOTRbAQpMU+f0c0IJF8JdQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1NyBTYWx0ZWRfX10FGtzk7vQ0f
 rHuFOPpVTzdBYfayltMggnWA3IsL6EMKs4okz2jeoMKL9D4/I4oV/hiqsyJm+ZQlUH0f2cJRbjO
 HMJqpHimvuhrP/QQKyJR8T0Vig+KaswtQ0vkGYd+PnQG6zUqkp65FQIpk9iibWROzdjOtkNJWR7
 bcWS4SJrn1tFJTA31mQAr4AEolHKNkoerNwGLVF2z1tv9H1YjowVkj52OzejoC4XwA5zbDFRM9N
 TB8C2SVW2p70dQRNA0F3cNYFFBWrKrR24p3EtPR+uIJtgBgjJie+bI1wmw/6/pWvqi223Lpb6lA
 mtfbeinmAG5sv69KLwso4LxrWEq8kZYvxDysG+ZF7M5tL9lgML07A0KtbC7oaBvEm2bl8fYvqsb
 Ey5lCEDTBorZDv+NUmhquT8pP7cVKuhnb279Ogf8xSQVu41fM+Ga8KMMt1rGBd1SdzBv+KmIHMO
 x0BLVbAGderLoJylg3A==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a841017 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nRfyoPPwyR/Y6OrExC/i1g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IgWHIWh_6YLybfuA14QA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180057


On 8/18/2026 12:34 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 12, 2026 at 04:25:59PM +0530, Vishnu Reddy wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
> Does this split apply to all generations of Venus? We support MSM8916,
> for example. There has been work to enable MSM8974.

Yes, applicable for all VPUs

Regards,
Vikash
