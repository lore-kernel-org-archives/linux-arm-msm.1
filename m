Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580610;
	b=QMv+5JU7y7eh7agbqG+prsx2nR9LZEEJtl9r506OTJCaAw9e7JkA7YbqqRY3UCmAC0PA
	 U+9zZ4gOETT82FdJVaIq7vMvdxKE7qUZtsoIrbTgBQPlbKjaiK02D75UikWtT1f2WqaiC
	 NsbGnkZYxlL/xxvrA0JH4ytsJCdyJgYzdUXVRqpc7JBXk0G0DWPZAfstOseJ/16RzMwS7
	 1HoV+3QV1jwpaX7IGn6XifPvmCayaDTyuZE858Trt3hhMTAavSovYqzGjkMT1VmO/rPpn
	 BSX1Wt7mL9ti/gSpvoQjirTXCHC+ItTvo8yoG+yIX8qKsERGWRQUwJLKJfRBrKpsQPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580610;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
	b=IGo+KqRCI2DuvkaxNaOaRS4knAEuTMbCvPwKm+XFU0+2mtrbbmbTGd+GVysmXoNecQhN
	 UzhHZ5yIK/04nHvxdovEt2ZH9rwhoXfBF7CinX4OQ5ME3/FG8cWR6eGgLjfQwByd0iukS
	 O+uVwOA7LYdcCu0iYEFlB+6C6Us0pXn1ccMuG5sFGzSZ/efrFwnGNGUpBT8VAiDgFl1TI
	 U0w0vHDc7Pk4pxTq40F67WRM7i258DXyctlSkqQMuVxlw/Onz/Eaa654HZmaVfouSjXAY
	 kQosP5/xUkVSGNKgT8oRKUd3qb/lJ8o8BNTX0DLD0YhxNCKjdOBayx4Y1jBGskG0ukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jtZ1u0Me;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIF3rYd7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3F6606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F3F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jtZ1u0Me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kIF3rYd7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA69HU117878
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=; b=jtZ1u0MeTrjqFU8c
	IzBl+Y+eSRCLuajfmBB0P8Ae1BXi0OKaPZjAcTxYqMPTya75nAk/x1yJVvCJQeog
	f7OHeSSuqJHol2BUalk53HaZWPOT7b7RwbGUA4G8BCdfMlmvA+RMgAeOG9fCCN4/
	KxbCbu1C5QWJrKQYFDFmso7AF4pm7fR+MOGlBl/mPD2UsfOMriOAWsWa+hNvgSrq
	6c+DZpk+GcPZou9bnH5cnyxInjnM8mg6RA51jPs137BuiagQ07d0mdddZ/kTf+D0
	7lpR8bnqqQkfWX1Eaqf5QRa+Pgt4YmXkaRjrqKlR04EMm4hAOdwX4XhzBF7n/4Eq
	h2SMGg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v3mvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:03:28 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac78dbbe7so8701e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792580603; x=1793185403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
        b=kIF3rYd7X2vaNTSo6aH1LWwTeHK3ZIMtr+cNOHG2iGyZ4R+6yqsdcMYL1IseBfLCTG
         9u28SsLYgRRDXeF9NtVdF7gn/zYH9TnMtKQ036C9/qTMVkH2ph+3Hg3/FLVtSWom3hRy
         FRuSt1NTrI7MALlGEoT1nfagPh+ogrpLF20Z8bezrCoIXSf4Mx64SNYzJlvu3R9vhM/o
         1+NUE1f8bss4dyoh501+B9pTQmOYJrVjpLl/8bvk01UFAUTbSuW6SRiZgnEZjMKo5yoF
         JTI/17NyYaWc8smB05fAy6WBxSSgzjqy/VheYBca6O96I896f1jQTGfUOs6u9Sr2z/1k
         VxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580603; x=1793185403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uxja2CBhb1mW7NZElmgfeGuVVftU5XvBGnIy3eg6OFg=;
        b=dcv8gmtTu05iJAxiWDghTLbgzZuV9U4dpELPZnNxFkVeVEj2nLtF2SbiojpMjx+mE0
         KW0ZfS0BU0w4x+AW0X1oshQEjRtLZQ6ghAiV5YeCtSv2bpUh+5c+aT+Qdeu4QXjlAsOo
         YDJC9I007eGTp956vXiOgHg8BCZfx5MB1oIvT9DBFhUSj6eF+exNhPatHSUtR6jPDot9
         V66LIu/htBjzWE9ZyD4dSgAXbz8S9IqqUC0IFRjxbw3XS4M3rLTtH2QDZgA4PrF2Ox+3
         rueqrcmzt67Tvo/sCUkE9ng4Xg9QaXmZePMzPWHYLgL8iBJO7yVNKKvbrvG4madOhtEd
         iQ2g==
X-Forwarded-Encrypted: i=1; AKwUvBwwtB8R449u48eM+4or3pTWTfTk4dJbhp3/+Mk+SogGvWp4JlO0k314+5LONnASRCOn5yX9aEHk765LbrOP@vger.kernel.org
X-Gm-Message-State: AFq9FYJAgOpLPM9o48wfMwWsMDuXA08nF8gRdlIhs8TLJq1Nvmx4wlcJ
	Qcb0Q1W85k3/4LoCNAM1K08fSm0weEva/ESzORahGw1IM70/bVi0/xry5iRLZ+F+cJpmHMqoig5
	3EkaL2+WKGv3biMJ/lOpkWBYc39B+DiwfWDAHfiGBDXUOtC+xIcp1jURXQwjl+/VPz96V
X-Gm-Gg: AYBFou2PSzoQVZejG0I8/EG5UHZ75y1tP9G+/+6fS8NtWOdTBv8KPK03jCD2ueBgGeR
	iaCvD+tntxI4xEAxJKeDRuhA03RZeICeUz75kNX9Y3+4nzKtebusnW/HtGKCbn7KMtnL6c4UYZG
	C0eiIK4yqyfqen3M89OGT8OkT1bTTnazx2zg66Ft4T6pHxPKQkaCEIB4cYmo9+z9x0srzDN3K8R
	lN5ekJQMgnzd9jOwMbi8FFH9OHHeseNjdBV0Dw0ReR/ZfWA7fA/VEyYvP944UzgN/vDPpSdHjTv
	YeXeQgUFAUxZyTcfkTJhXCjV0YgVBhRWb96A4vFyPiquqlP+wX4CUt6QfP+0rdGG5ehH9fl+rva
	Xg4v1V/+DO2HBBrnqPc3NSw==
X-Received: by 2002:a05:6102:3c92:b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7cc922532e5mr441380137.0.1792580603015;
        Wed, 21 Oct 2026 04:03:23 -0700 (PDT)
X-Received: by 2002:a05:6102:3c92:b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7cc922532e5mr441345137.0.1792580602582;
        Wed, 21 Oct 2026 04:03:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm65165466b.17.2026.10.21.04.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:03:21 -0700 (PDT)
Message-ID: <42b2b13f-5d56-4668-bb26-c4623617f4bc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:03:19 +0200
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
Subject: Re: [PATCH v3 7/7] i2c: qcom-cci: Build command words with
 FIELD_PREP()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
 <20261016-cci-imp-v3-7-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-7-5ee7ec1ea1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfX4hG0GWrHQgOk
 XxRkZzL7CsskmMoRXGzkKyPwGEpBq4cAXo4EBzKZt8rguFaJkre1V87HsoTey/pzL5+kEhYTUk6
 M9Gq9m/3sE3sOrCjw5fgd1kBPE+knPk=
X-Proofpoint-ORIG-GUID: F9Fs3JR75v0G9YTS_q0narQ2swDZ9qsp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MyBTYWx0ZWRfXxqmsPekE/Gfw
 x+n7OB912i8HQFj9YC5D8ecyswnJUfiwdem0nbj7Qb4LEkajXUnlkIwlGzfwrQqQIC7K+CCcVCf
 llayThZ9+sSFJLWgtCwmTxycgU5V5Q9REOII80OJFSXC4Nt5R10UwYM7WijMX/CDVKRFCcSDOxh
 UIb6/jfHODZliUQbxA1fKC+/wWlnk/2nBtY0zHqTFzgWVuOxPjAUQ9hANmBJMHJoSRHrRgQJKpu
 vtFakJ9EKsdEoT1UWgU8pgM8zD2alYYGKsYYWE8Xi/1jJXe73+NnDNb7rreDZw4lD9FgZRiNrcq
 TVZsAwE8QEQTqX5UVYEygWIVhHcd6j55gkX75UeomjJCP94YVbGjzCwtnd10fJRkBdwtVUBeDLa
 26apmhRou4Aa5YvgRvTrWQ9r+2wicJD7UlNyodQnJ0aObjeUrQZSpnaGRyaMZTNm8+ARba1F/EP
 KzbcdJpUkD1wAUyXibA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad89c00 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: F9Fs3JR75v0G9YTS_q0narQ2swDZ9qsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210043

On 10/16/26 10:00 AM, Loic Poulain wrote:
> Every command loaded into the CCI command queue has the same shape: a
> 4-bit opcode in the low nibble followed by an opcode specific payload.
> That payload was open-coded as a bare shift at each site, which hides
> how wide the fields actually are.
> 
> Describe the fields and use FIELD_PREP() instead. No functional change.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
