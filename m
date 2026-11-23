Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410570;
	b=BRbHXl+veeENhd7FF/xOKuk7fSHpC1bz8Nmf3Pn3gUNC+GrFgkbfH60hjK+a6rg7qG00
	 iHmzdVjRtkRVlBgdaRr0OKFcUTNLXFVvPhNTv2z+oy03NEOjYYvr5PjaBCJDCchp5AB1z
	 YF8hBGEW2MTTnxxewni81OJGcWSZoj2OxjYlVlJuYfNwuVF237P72G2UoVugXNWmw0c3C
	 IXUVyquENGDvPGl3QSbQSLZWYbicpvK8K/BUG5is4xvR5Aj3bFPVu+pkRGzGhv9Ccrymd
	 n9FIThmSZkaV2rIqHBAzB0z+yc3HsPo683L16XicYNxUYYA8CV6d/jqMLNTG7BVgSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
	b=0w3XhneJ4FXA6P59bFIWEc1iP99vjLoT7PLI9UBKgJvMTldDAvNi6hcpu6xhhdzb22L0
	 4M3U1wdXIbzhlbafwUWTGtgdcKvM1X+wad3s/B6Pm8x887v2rqp0A3xE4CgDTD+PN/bsu
	 itfACkHatGUC65jvmamz7DdG70umrabs+29mmuxhFQgBSURwq4m56BRRBtFjnenYa4b6G
	 YipEX9/irNqae0HVbA6Oi7FvuJlJgY5O+XUmO8QS0gECn+SHcy0TauMJu7bS5AoKwNm0/
	 U/XRQqh2HbEgu3WLV3dcx2lKjpR0Zxck1dxtn+YADiVup1zTXCtKaRgzITizkDQn+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5g55VYq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eio8kaoD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F9606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5g55VYq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eio8kaoD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50xN5979498
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=; b=d5g55VYqs66HuC6y
	TxZE1q44xGm5hVAiu7D7Xtlmgj6bmH1IcGdHXl3eKhAQLA330i0ovbiOehXyWwXJ
	QRTXhdNn0lrdOmqSaCvTz6DbKcVsIjrkpqy3X6wfYCV3mu+Z4ze18dqe4hWXIPmi
	lr4nckCk+WRX9CVkfPCAKfzsbLJK4uuHrLyA4W4vZUCjO5ggVRPv557SnVAhvC5J
	h/E4P0axW3sIdD4AcOaCuo6wgSuY0wQwoncoqx9eQI6XhRa/F8PocDm0nG6Fh5Kf
	DB6xtQ+38MfQq8PfvD5p3A0GZ+ZDENFgyIQRFyRSzAfpL/LA0d7bQPgWSfNy+s9c
	CqxNaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgdb42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:09:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efa9aea3c0so37914705ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410567; x=1796015367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
        b=eio8kaoDpqYmnAtEXRaF9bNlp2Ii7Y3V0QNS8MUuMgmsYhoo/gJfJjupIpKh++3Xxv
         YU6owsZF+IBjUl9RFjjuwR5NbLxC7qGqd1Kht7ESJY8J1bgdHFcCa8V6EKwEimAza5GB
         iMV1zl5dZ3E+fYndYrcidiM/M+IniQwchqC6u7u2FzHQnUdOsuKnT53k+1jSWWfABhG3
         fRMfJPweL9JNDD+P4raRTmxSy4iXo7KkjhSQLEosrOZN1qO7wgy2tfB1ojuDP7krN9is
         NExIqF4R9mRD5lhWYZ9ytvh4tfmwPR4wtqg3HZwNqgXLKkimR/BVodOrSZroi8fehMlH
         Ge4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410567; x=1796015367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
        b=Jj9szg0evfwV1yHPoAtXLlDj5xnpN2xKzri+OVQS4tymQZu7dEeZDS8pGCkRKUwurM
         /BIahSJ9wMbobFCR/wzVxgIPWRXFEIAPWxLFY1D7lwrcwpOFLBHYNinU+hRWZblY3la0
         11rvnzmgiaGdsHfF+h/IqYk7f7QW8E988J350kpdiK/I2mMLeSgAJaO/L/1lZ/4Zm+j5
         wjUaGe4WQtTMssSPjm4gliiPx9H07j9E398th1I+eAEzSccnTk5xvofXMnEPvvnL/mbK
         jTzY3RaqxGcrTd80dhjwTcQFF2bUX6UAT6TV04a/QOdxG/6fZOPQtwekc9ejwJWff7bj
         pe5w==
X-Gm-Message-State: APuU4Z+X4Ecoy85ncPgZK7lZVXHUbN2KbFBCjd5IkBzl//Oh/G5Y49IZ
	g76XVtj7JD3R+hKCvQPRUcBdcAsJnopRfozcC4h9lmovfjMyV4yfw1SnUhI9Bxo7hk+baK3pguH
	j6cMYxAbl/M1zP0Jk6vT21UMrXUgKwUESWnuqUszCjEHL35YXl4iyaow0aDrP8m7SEQw=
X-Gm-Gg: AZFdTZeCy1irU5q44+u2B5oJToSxOtNAmkwpr9erZTOZRIl328OKS+8q8ZcFtLt2uW8
	ABrEjXIZPMrCFqfJYUApSSk8hw+/9gznoAnMcWwswidOPT9pnR8weqItSU9Ywjq1qJWycEcanjt
	dRW3uj6WRbURQHy55CcO25ifXcTSokZNfD0mE4SLWyFjv51bqcWKHoJKwVU0tL23vh4mnUI10nm
	ctiHOcyICvb/X3yhKq/xWJi/Ktk8m8Tm2nnDk9qZYWFA4Fqb9Qfr8rACViu217DCVNJtYZlgMzF
	NG24dAXIvpsC4czHGZ00R81QJogUsLcrLS68Ea9UgWIaSMIBEvFbw4mEpaLkm7YNr2t2Q8SGWn+
	o2Qa1xkQVrCvO+apRdojDsOzcTMB2b3wqQGxKCi/B2hG46q4WbykXaUhbiIcsBIKhWZp02/sbCh
	E2O4I3ew==
X-Received: by 2002:a17:903:1a2b:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2f03f1403acmr105120225ad.30.1795410567294;
        Sun, 22 Nov 2026 21:09:27 -0800 (PST)
X-Received: by 2002:a17:903:1a2b:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2f03f1403acmr105119995ad.30.1795410566828;
        Sun, 22 Nov 2026 21:09:26 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm38652535ad.34.2026.11.22.21.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:09:26 -0800 (PST)
Message-ID: <4edb20e7-d0fe-4963-a20a-e5acbaf13f63@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:39:23 +0530
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
Subject: Re: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to
 3
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
 <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
 <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
 <00b0f4e3-e726-4537-8603-58570e79cc68@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <00b0f4e3-e726-4537-8603-58570e79cc68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfXwrtEP1bAn+I1
 /pGROQAin0BY1l8UCQfnCfX7MZgZTKJOPGX4qN1lr2kI5P0Zy0bacmkrSNIY3ngZUhXvpiN2Ge3
 EinlPkHI1/7kY7Djlhl41hZ0rpk8rm7BoH5ru0uQLtndhYveSua3JT5y6cn7pSWFYFG/XX4mifs
 EtDtrfojbSCrsG5aLzwOTPoDFumyFNp4y36984zoAjr9gKu5ffZVD5zTm1iEn0xoeZBHSUi5UuZ
 0X/aUev+2TuQhLI+zzUJyU+nMjmjc2iUe7Q9+HiCvQaQPQk1Vyl020Ici5cAGn9danXpgbj3Pw0
 O5Ssn4Sbdb7kRfnAq0FV8S4tubU0+sRBtuqQ3EdfX0FPU/N7g1C68UCGGPwXAsGGq7iNQS3SMLA
 8rq+XNx5gTEShXIclTvt0ahZBzXWaZEH8gIRZc4UK/sleKyCNgbfau1DRAoTILEa4yxaMzkpifT
 Aozx4+Dneqw5RJi67Rw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03ca88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=mi1jIm9wWjqR4qfdRYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfXzIz2mkUzV3nJ
 XlFXnkBSp8CRGj+jvPFeZyeDLhxEL61ToX1oPlM0CB2T7m+0cSrJtJxS/52dmzNRdbah1jHHbiH
 KXgqu0nN7dDUZ8PfqdL6M/MBAFeXskE=
X-Proofpoint-GUID: wDf5UNJ1YdI4cFOhfTYTKXbq1IrpXYcp
X-Proofpoint-ORIG-GUID: wDf5UNJ1YdI4cFOhfTYTKXbq1IrpXYcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230020



On 11/20/2026 5:16 PM, Krzysztof Kozlowski wrote:
> On 20/11/2026 12:01, Pushpendra Singh wrote:
>>
>>
>> On 11/19/2026 5:37 PM, Krzysztof Kozlowski wrote:
>>> On 19/11/2026 12:44, Pushpendra Singh wrote:
>>>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>>>> vote after 3 sample windows instead of waiting for 16. The previous
>>>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>>>> causing delayed decision making and measurable power regression.
>>>>
>>>> Power and performance measurements were collected for
>>>> zone1_thres_count = 3 and 16, with the following results:
>>>>
>>>> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
>>>> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
>>>> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
>>>> Speedometer 3.1(perf)		25.8		26.5            +2.7%
>>>> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
>>>> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
>>>>
>>>> The reduced threshold therefore allows BWMON to react sooner to falling
>>>> bandwidth demand, providing measurable power savings in the tested
>>>> workloads without a meaningful performance regression.
>>>
>>> I do not see how you resolved my comment, so same comment.
>>
>> Thanks for the feedback. I had addressed the previous comment by rerunning the power and performance measurements on the latest kernel (v7.3.rc5) and shared the updated results in my previous reply[1]. I have also included these results in the commit message in this respin.
>>
>> Could you please clarify if there is any additional concern that I may have missed? I’ll be happy to address it.
> 
> OK, I missed then the part of commit msg explaining which hardware.

The hardware used for the validation is SC8480XP (Glymur).

Thanks,
Pushpendra Singh

> 
> Best regards,
> Krzysztof

