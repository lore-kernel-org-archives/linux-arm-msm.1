Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656019;
	b=y76lGC1JDJfai5rjvPhbVWmKOiC9oU8NJri6BugHmJuYep1HW6iUv0JtdiWpE4Xrc54q
	 ZJaiiEP1Jksv2D6Lfwp3RfbjSmls12/7TtgE3jyUMxYc7ZXohmiAaL7LS4WD+nbfztpd3
	 eNZ7eNs9D1kWdgkJXw8CWPYgfMGYcdxFTgrd2u2l/YaSkpWuWHoyP7+0OB704NcFQIzc+
	 qKoDbqcMT2BobVfU499531UJPyJEqI1iFOIbFhMwk7+C7VVs60JbtUatG2W+Lu82QNZpW
	 caP3NCKrwaMx7sYSIDle8qt0YisYOJGiauZTEYsf0eB+TyeQYJwPwkBOuy7fntDZ41Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
	b=zO35tP6FiPEOgnTgf/bv+yBshpgrxggSoY+w56heH0Fqkf5P92l4yW7KY6qNixvUN8AQ
	 uTck5LdcK53tEG3+LfwxPbLbQJqC/c44Cp3P+wq/Ky5q+1YjQ/sqOY9+loyGyNeDSI7aB
	 NXk3DzKVxH+S5BXwnuerOPajkXo64vI7gAUTPFJlYqWOQVNbCtz/DZ6WaZaZ+96TXi+FG
	 +eCCTE11uT3jtgrSMAgHGsDUutIYrfcsQ3H49ZR+xxDhh4MTQZpvuQ2hwcr8tGgE3fP64
	 HC3HcPKGJVwWDJznGuXhXCOa+5giPve4PZdgbcW31miyNQRAbToYXM/ndj9ngnjyhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYn2l5E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZP5fSx1l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6562606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6562606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbYn2l5E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZP5fSx1l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7B48j3049217
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=; b=DbYn2l5ECzA0c8dr
	36IFklgg/XGAnbIjwsSEhpgRRpQA0ygShiOulg5Qcnh/8l+gPm6Bb1mqVO1ENJYk
	mwCZq84n5DDcQqhdWruvjj8brAaoTsT+G0EqkQi907k4a56DbMoNFnOZXaRUVvdO
	w2q5b6iJbvz7jCaoluEcLjTYfTiYlLDxyR/HUsdrElLZR8eNeAQ3oNtLytF8ony6
	lLflDkMgXW3+tKHp5qVFMhmzOgMrMNanRMFr+yfgozIBGa2uP/Q9U70e7/xKZE5u
	o/Nrnl2fyyOUYzZKAfScUr48g7e6TVPsMr2lt+0Oxyo2w5yvoJWLQfdJzxZUFUFf
	RZnzrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93as9su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:00:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so32124085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656017; x=1793260817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
        b=ZP5fSx1l/0DpppjqPpZlak6Oht4rzsgGS6HKIx8c7RO0XtQQcwH9iT3CrLN0sPNAbR
         c2JIEKYl5h8XIgnJj8iqWByME1agrXEfHESZHPNu72vvntEoKBIu9gCR7beg7t5/lrQZ
         Fy6YnZba+ijO0dBmVcAgaY/NK3H/ZSkGGI3tNPKioO3WhrfYStpIgmVeYyLcbY/cM88M
         e8dv/kwx64Rq8ekQ2xZBE6PR8v9QoJiLLTnbNRJGAeFdzbcDeauVUtJQabQO2iinrKPa
         zqrwXM8P0Xu8gVVGp4A6x/IoUj3uWyZbcYovXgngX48TPDAr7z9zhmPjMLUaWk+04iOz
         Mqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656017; x=1793260817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGTzRqxU3QbDVlPoai6od2YUpX8aDnQx42/nsurChe4=;
        b=As91wAsGtjEuOCqysIcPLuQ47qvYdrTOjBpX+tUfHiUy63vxiensVQTwGfttckv4oJ
         mX/UhNG3VT8pyqhTT4VRvqdR7FJZu3lZ8m3HvYDTkrBbTTm8FT087SOO/p1lzo+XyEVN
         az6i0DDvHBMiEDomdLWQ9AML09pDg0a7kCej9odsaBHI7qCKKq/aF3Jc8FL0Abb/v98I
         +eHnM+0MKYJvy/pEWEoalDWwDX8TVT8tp+2j26ImEJgVXzBmTAPYXaV8GNKHdvi+fwuo
         wPPotQGkfwunnU2/cQdjHUohcAmaWDUZHZcpYH/KiGr7bQmApc8WQ8J29OA4A5nTiUb9
         joRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuN43TUp+Df1pumAC4Wo3ANABUfU/pNI3rUeP8sq5+p44fyRB0TSollz7kBEvL42/mcliFMNEMJGEflB+W@vger.kernel.org
X-Gm-Message-State: AFq9FYIHHDgFTmRkPY1UIoc8mhWqAzfDhai9r2JxnszWFWI9kZwz/AZ4
	R+v/Wx3cO8H78gyh56a3deS1wiSc0o8lI9A8Zx8TjN1+sFe6QV8g0x2SMP7yuUV08pYN15nVgxH
	62qir1Ahzl6iqhGKms649DRVHl4IRjt3+1JoeEFQy5RZJVJSuFxhXjTefUgX8nqY+G2DY
X-Gm-Gg: AYBFou2egsOv+XN7i7WI/pBSSCUa1bXOJzfi4zi9lTZa4nxE4zGtYwGXlsfbW5R10Yb
	eRurf9p159PT1RHxMAIALq03pkNyIdrdoZTLjuB9PSWWmtZyXORQocUE1dzhzerKt8VOA4BDvyC
	0Sx4XtYwKDB/QOm/Oz2yiIdI1W/V2Em9+it+2Mkv0HYxwjm0wXS3ofqYwdCQkiJs/Eowpzv7m32
	uf4AirY27ltJFdB2pegGdr5A46BRsoNEbiAZePK3Xkrp62neG1nm51TLjNelN4R/Z7Si8m8ZMP9
	0FWQUPTpG2OWCGhFuOioMcFZLB2oOTWx5/f2Fn3WTK0lGnLLPfeJIXbBFsGH0uF8f1RbevRse5B
	jkDFywTSCQQ/d3UIBp1NYBg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr947763385a.2.1792656016655;
        Thu, 22 Oct 2026 01:00:16 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr947757685a.2.1792656016097;
        Thu, 22 Oct 2026 01:00:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1537552a12.24.2026.10.22.01.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:00:15 -0700 (PDT)
Message-ID: <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:00:12 +0200
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
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Kaipeng Zeng <kaipeng94@gmail.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com,
        andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
 <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX+rfUblgEANbT
 F240FzjSfoNnxFkKmY2aRT3XkrzTVbde7SJL/EMNvoO9bPoNdc1EBCNzwYuhg9OiA5C1rWwu6jF
 tGmBQ2EFVV66B3VBd72YP/5hwwZ886k0kdOpb+QxiouNfEkzrTnwhUwBHHkx4RfM77Ri/5ODp3I
 Zl+igHvlOy9kfzjCGWAfH4fye9Ru79vu6vJRh+OcZhs85oyW+WWl+FYN8k9TGmA2PP/Knbj/unC
 KWWyZIe0NcGMSQZFdEqbR5nJalvw2eUaTIlfA4V7+Mhg2pnUeg3O1BWScDVIq9dz9f4cdy0x3gN
 LUN7MWZ6262X9RjUX6BWYe3EZSsTxrGBiNEGSg2abdyK5aJncufxlALoJCIQ2h5mlQTDKNZGf0j
 d7Er4fmw5u24XoZp0opB8KUsFmyDMdjGpqUNUI4QYVpa6Gr1AHflsoQ0Cq3SAu3E+RuX9EzTpwR
 LSOqeN4zW3hpetQaPZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXwhK+mYYH/j7n
 z2q1BBlbQ+MYUSX/bhpp2rhYtXjTlsHHxRdRQ3LSWbhNd4HIltmv78iTAxppc7pcdGNkPxqwSpX
 6S7/txwTn7WPpCZ5LOoGXOfuZ/kHRyw=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9c291 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_MKHsu4bIe8qKVLab3cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: C_7PIgn3YL_IlIwRue_vyi5HYNx4r9jt
X-Proofpoint-ORIG-GUID: C_7PIgn3YL_IlIwRue_vyi5HYNx4r9jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/22/26 8:15 AM, Kaipeng Zeng wrote:
> Hi Konrad,
> 
> Thanks for your reply.
> 
> On Wed, Oct 21, 2026 at 8:48 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> This makes it sound like the retailer made up / confused some names,
>> let's just go with what the manufacturer says
>>
> 
> Just want to make sure I don't misunderstand anything, if this is what
> you preferred:
> ```
> model = "Acer Swift Go Pro AI (SFA14-11)";
> compatible = "acer,swift-sfa14-11", "qcom,x1e78100", "qcom,x1e80100";

My reading of Jianfeng's email is that the "Go Pro AI" part does
not appear on the Acer sites

Konrad
