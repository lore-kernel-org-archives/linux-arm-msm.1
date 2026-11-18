Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960534;
	b=YJeqcijgh3zCt9swHIpCFn3HTlt0SFFYhfgeKtPODfaiSieFW+FI0cYty4ZjsdMAoPLR
	 LMjvjk5JuFjzaDRmhXNYUyWg2X7k6fVcwcr0F7yyaMTOO5Ck1yLdoiAmVqOUhC4zPIfPh
	 PR4OMwUzYHL5ZpWJx9sh4/dAPw0eFBbkFpLAS/JBVZEBy1nVkfAiNrLPuZQQGK49535Hg
	 93QDD1rm40Df3i+qRoszPtdYKh+7St5ki2VtxvIp+qqmC94QJETfmm0Z4VT2aqJZt37f6
	 /NxhUtW27tkRF1P2yB7W8B48JCrwPzSJ2uFIMYf9R5ZiUbdyuanrALmf6unxM1HiuVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
	b=kZN3MC6XfEFMEmFe4W+SYGDeSIrmEamk6IhcuFyY5c4/FknzBetoCBK+c43UQNvVlkZK
	 4v7ZINohSXD8cdre5JET3F8419zqtBRdxQtfYLbXphTeVLEkZt1oNv8eJu6CbUnVw4PMm
	 K/2VlzfzXaLLSai4OtVAapOc1ABEsEuXnM9nLQXPS+2C+9jLX5DyLnKeNRA6KR4A5V157
	 jeVuw1m93P7JOD3xrAP6NqypfKJ83UA2Uz3yMYGMtuqq3KpHe/b/KytI/L5UKY2cli/Q/
	 elYN39EKIT7ZZch3wEIS5aPCb4aMT5uBnopbUuTpexlx9pr8MEZCRnb92xyTBkRsLtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E352606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E352606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4Q5O9bK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsNbiDwW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHNtaDo1652644
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=; b=A4Q5O9bKjDBiw6Yi
	ddl0tRxJT8Au6jdyHYTBtKwFCMqX85wHHAh1311Z/Vx9TGJ41gEJS8fvjPdMTTW8
	/+xIIRv/JWt3+wxPxfT+Rtg/T/wK25Q4pVDRMK8/LdHE6jqIMxJY0eIErib7DKwt
	PNPJbjzcWGf6U7M/DAEwA7pMlUse3e/O9h6NvV1lBJwyFsYeblw7map8t8xC4Zpy
	KtswgHyEXTKkYWs1km48IuQ6mx5wfumcaEmBSliVJMZPUyk6VYC1RmFbw+N74Yc+
	s6Kb5q4H/0C336WVhTuShkR+dklD7F1Ba8jzgxZeI54CPpok2Y1lYvJn1YVZQDl3
	C2LC3g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8g9gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:08:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3a348a6dbso796191c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794960531; x=1795565331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=gsNbiDwW4SiyaA2zBIeeEmowwRKzz51IUMaJuGH1HqW5G+sUxCuscod5cwDDutsouV
         Jbs2RaeEx5kO9iM5c9jGJKo19avkZ8wD5tS27d9YRfZSWXEt+Ish7bCvr2wWDghWdB9+
         SO7LgSPkbszYIsLJGi+J0ATSsJeImNDt/g6sMGXd6Ro3CHcy7wDHp2nxsUhxm9ftAuJ0
         MvPooiE7mGzf38n2dp72q4HOvzaAde8cZj+h6BfOXLIkkR+0m0klH7yRs0WUaRDvLArr
         J3InNhleyJcGSQKkwExGms6TIBuu7W2Z46+eH7ZTfG5gLIgxb7G/nXn8T3PScWDjsMxX
         ZEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960531; x=1795565331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuTLbTugfbF+YGTGMHC13Lp2sz+DJ69DPTAGTG1eCEQ=;
        b=NV64wvDhEr07X3IuwS39lmsChHK4S0kxZS27UqsZ10lHL7eEAwjkfv9WM4AQhl4sWn
         gzyAjLUwKr6q5Vb6LgvqniV6HFTjbgvYpLHTCoamFMvbDnCyK4d5wJD0TfGLWG6MgRKU
         /NJfw6Tmf+ffEZ6s8jElEhAJ+lfV372mUpvXdwc7Q3ehLo/572NUlI9duMkfr6g8rCVH
         h/2kTbiWRW3Pi+Cy2W3MqJVy8s/sJsNdozCpmZe4sfzTw6AqnGzBKWzR+VWVgw6kPsik
         nUOaiT7g8MORJymRPObyjiE+emqVgnc41NQBeFTs4Kn+6Y6oA5FmbYmriSirMGX21MNI
         dzxw==
X-Forwarded-Encrypted: i=1; AL+hErGUaBMu6SUw4UJdq9wWteth7dDH4jdUie626RQuEUKpRSQXD+Ghy5clkQ3seplxbuFnXsYgPpSGv+yM4Vfo@vger.kernel.org
X-Gm-Message-State: APuU4Z8OIq8XRVcRdWA+eR5bxoxBB9iVzKoQctBSTVOhdtILfkkWQv1O
	B1SoKQbR3BhN9WzrezHMk+v5SLe8VBu4fz4yMm0qCsy5fELKtjUU04Lj5EQPQVef8dpEa3XoXMD
	AlkzQ/kKAio1ipUfBa+nz05LagPLfpgaPU6H0JGU+14lxVp1+BdFtd4yb5eG3N9Elp4G1
X-Gm-Gg: AYBFou18jIq5rSOYHsllNdjXA7bB16gK6rkr+s6jbkyrC89kOnzYLR6MhdfFG6vx6Iz
	zgBNbgcNkk1KOvD3R5JyQYvvnJDQxojylvR57wUqLpAwcYfXIRJwqKtVMG2s+FvabIodG+2cOT1
	FC3tAFJ0JszlGzs7SlT9DLNtGO7i7hAXnswTL1MabeMb9vW71tdzMWxZoSXNLgDb9C8VgkPWviM
	gQHuOXvtlqpuNiKDEyA8pPRHlYs62L3wL0Pp5uSrosjKjAWlb7/sxrw8cVNzyl+8gSZlxFCyTbB
	dhUxflnDsu0vjPOJLz8HcFXne2NAhnEpjzET9W0KUdoyfOdicRAMSHsKup5FKjKfWfwMKLhPeUk
	1o7rFZrrjCseuNB81RwQ2b/KGoXmb/lOfKX6EP544e9dvwEDKEzZmhJmKVVGSe9YgHKW8X3PNaw
	KGp53N9UORm1lWD2pGrbj+u+U5AntLgQ==
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137370c88.39.1794960531486;
        Tue, 17 Nov 2026 16:08:51 -0800 (PST)
X-Received: by 2002:a05:7022:7e83:b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b543c3fd9amr1137340c88.39.1794960530842;
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Received: from [10.71.178.189] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm2262069c88.11.2026.11.17.16.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 16:08:50 -0800 (PST)
Message-ID: <39bcdc68-1925-44f0-9958-e1253452c113@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:08:49 -0800
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
Subject: Re: [PATCH v9 0/8] Improve Qualcomm EUD driver and platform support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <57c5aa78-a116-45d4-ab32-772cd970e6f6@oss.qualcomm.com>
 <2026111740-florist-conflict-eb96@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026111740-florist-conflict-eb96@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zU8t3sB_vQPub9PBWHpK8ldnvA8oAYAK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfX280C/eBaVeX8
 ORsoii+0uo0rTdo5vDrVHQb2Jsj1up1uYUlTi5oq08i3jZZk/zghnHfG1iSN4pLMaF9h//0JJlU
 Cd1s2fEkcuTZjMfNRbixg2Lu3l88vqU=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afcec94 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VfwtAWXQdzgZiewqWO8A:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwMCBTYWx0ZWRfXymPGgAqqD3/J
 LZQZ6P3XkbW0w5TQ/OQEoCPG7ewnPws+3iey5bmxdsWZNlG7n8XuUL0bBmx6BSL2q8vlMj9jZKD
 XwbXo6PNV2fpUzoQK5vj0DjaHYuQ6J9vFDeOvb3+WARSv1kOUlWhu02U18/ErC8dLWpHxvJwTNN
 b8meLRwxiRBkwapksDam7zW+d/SggOPQ+qpaonRZNwKttVsz+EP51Y+SKqUTyQFx2i8ZzJBbmvg
 ggxKBHBgnwQ+e9ByuJ2UrEX/WGdxRcWdvdFLHIJSgSYo2yhsOXf/JU0ZsWw4bWXBIUvOiwI15mC
 U+dRNMINE90Qh3Wv9+8xT9XlR7mgr6072uXNib/7z3STvQhhJogVvkoA2hjPvUfFWG7g3gGPA7p
 okrxFVX+d59ZG/iHiF4dTRAy1ND6MXvuiK1FMTtS9kCvNxBNgICSD3NKz3FVhgI2mxOpvjvXvwA
 kZA8jZQrqmfu8pwm1Bg==
X-Proofpoint-ORIG-GUID: zU8t3sB_vQPub9PBWHpK8ldnvA8oAYAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180000



On 11/16/2026 9:21 PM, Greg Kroah-Hartman wrote:
> On Mon, Nov 16, 2026 at 04:06:52PM -0800, Elson Serrao wrote:
>> Hi Greg,
>>
>> When you get a chance, could you please pick up patches 1-7 for the USB tree if everything looks good on your end? 
> 
> We do not just pick parts of patch series, our tools don't like that :(
> 
> And why top-post?
> 
Sorry about the earlier top-posting.

Understood. I will send a v10 consisting of patches 1-7 only.

Thanks,
Elson


