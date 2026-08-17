Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE4414DD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970792; cv=none; b=S0hWIhRiVSuiVdIJWApgzbpfz8G7uGLaV3R2sd21+OMQrThGOaYxn7wY11C5Aa6SnO23jqFL0dAJzZczR8uJjjTKmlMdQRgue+jxnkaIZGKF1IDqHLYLO9G9KC/UwjFryPrKIy9gD6Zip4Rlw9iTmZf0uQjopHPZv6yXKfWvsd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970792; c=relaxed/simple;
	bh=8qdXeLEhRSGEbmwg4Z3YuMsep9BObdZP0YTwUvnXJ1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPmp48q/mnQLEU9ApsTXdU0JJpx7orbWCql80GZgDZJ90VFHun4smOampv0ngqsyPx7o54PxLmU9B7EbDdJK2gRFlY2pHRGRB5vh25ZRYdwDOo9IAmXm9MhSkTf6BLZ/Y2+6G3bxqX7oNPv8att9ppvkLDbVTURRW4kTthuu2JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaLEcI9o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHMBVeC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaLEcI9o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHMBVeC7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HCAsoT2308217
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdGO+1H2YspsF1FIZ+wSVkc5Ih3LewrrhSL2Z5k5vA4=; b=KaLEcI9oR7o564wz
	HcRKFxTNaIGQ6zom7sl8kVihYEVwab/0ftp6eL6ACoIDjAABJ14/OxnZS4IWgKY3
	AouBhNAtvJ8ybzMhahd5FXbW2gKG+QJ3KgZMAYYusWZfiTWWV52ajGS9cE6E/yip
	YD6NEoPUAsi8cKIEVUVKWwATDoGDUrywrxAHcR6EQkJgCyOUYjC9By9WylThI8l4
	FqKIUD6H9F3lMt9n+KJJdzkyMGNAZI33YSHqJ6fPkYmnFLsUF11hXNb2rMwjD93w
	yFHGtSR3vgL97j2bINvN1y7YDKa66PSjRmpyBdjUUqnKvxqbrjUd1MeHCBUIs+6x
	iyGchQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wreh886-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:46:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93495488976so93289285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970785; x=1787575585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AdGO+1H2YspsF1FIZ+wSVkc5Ih3LewrrhSL2Z5k5vA4=;
        b=AHMBVeC7KlyKD2il2sI4ESFzHz29A7K61KPlFekBwOwXpwhgrpR8dmI6RYjsXLKw9M
         e3f0woo6+EJFitddoAUiD1/ZfuTmCENTZK6QS0D82nsR4zSgIypog6tLCkjIGfldEhnR
         4IsfQ0eZCQOiyWGcC58n37lmm9fr7prW6uuv3V5fLiOkbF8fZ0nkhaHqMCtUcryuPQiF
         /tafLoTwPz8jHJqMewwqGBKwv5ieNCTjueCwhTBJWuemiZHPerCBm3iHeMdYNRq3w3+i
         7n0o8RqCXL0kZlz+V/zKGGBSpQmHTaB7RJhb7yVzayN8CgCr/QnTKnHdqgcrXGPOWRu2
         MVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970785; x=1787575585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdGO+1H2YspsF1FIZ+wSVkc5Ih3LewrrhSL2Z5k5vA4=;
        b=Hw4VFzj3QLkU/O97tTm9WJb4rklokTN6VJqHYxTSUwhidRs7EXQ+QAm+8aruJ4rJir
         vNx7x6pC8RBstrlRO7DjlXH+9XQfARxkFH3UqVsnWsn9ol/70Yn0dsdwZdk6V6Dc3xXt
         N3ln8+1FkdY6hyixnCTj4z90+drdPqphZaHsp+2zmlc/0tXji3AVOs60HeNxMvMxFlVr
         NFmYl6CbWwLwW2zCLS95RDOKyOiDkACv+28UBJFc4Z6cACfxFOjRAm8eWTSnzDShmEKY
         FRHurryWPW2Ak75QZ10h8e1kpE6gE4/J79knak6US1AMLJdjo/gw7G6yUIhgpd/DNwWz
         1mZQ==
X-Gm-Message-State: AOJu0YzpC5ssHkBZdWF1Eiw9hoGxNib4d/WrradtTF4hgnHdt324loGj
	BVkvYecSWVGoJUbdoarQTXXtGpJ0DmRY6mlTVc3AuZPp64JoDKZuJ1GKbqv2VqWKiSCJaoIQAYq
	QbH9YTYMCpEkDCjTv2fAWUcl6DVr3jCY928I1lrAMzEPQqwPSqAyYaprQjw58Y/Hfcq7k
X-Gm-Gg: AR+sD113COGe/dp6pbmO0826+d4EyLFvp8RgykKvzI+qrnzp7SWMBJxGbT8Yed+cn8x
	/zo3/CmxKorHjDmDexgGBoqYR/WIZlFfwuqOYjzwWH1WfQwtIc6S+EE8SnwTV6HF7iYl4Wz71QN
	AuJnz0WHy29g74Ka0kCStvhWZ1YlSh8gvGJel8YhxAn20wEa8x1BhRKp+PN6KWnMI/cInIahOz/
	eNUkSafJWGVh7P5HQ3CkBqQLVqSxan4ilIMFas8GYddcPIwyKWgFqAHIVu0rT04JBHbTzMRcJiu
	TCkUTt/7y26gsmbD7kuD/f/QqXboX2SZXAHPYya6KNLkj9BpevpgcxwwZB+nAp8dHdktfPSixwo
	w2U2sN54rhVDUernQVTf9YQN5
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr1790408285a.4.1786970784700;
        Mon, 17 Aug 2026 05:46:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr1790403885a.4.1786970784036;
        Mon, 17 Aug 2026 05:46:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffe844sm384814e87.38.2026.08.17.05.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:46:22 -0700 (PDT)
Message-ID: <aefd98ad-e33e-46d1-bf7e-efa4adb33020@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: ubwc: Add configuration for Hawi
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812-ubwc_for_hawi_maili-v1-0-c29edecb3bd8@oss.qualcomm.com>
 <20260812-ubwc_for_hawi_maili-v1-1-c29edecb3bd8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ubwc_for_hawi_maili-v1-1-c29edecb3bd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a8302a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=LJ8iHWjvZeVG4HtqNZYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZnUle8MLkN_FbzGmchx-y1lIPwbBlxHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX3Wcs7DQ+Fsrw
 aiWSHMqvAW8v5UuyPLyOTbcpWh5yZy75vqkmKB7duAb8Gd69Hh4zv9tsQ9RdN21ZzHUlGMlvMqa
 Y5dL7XNo3QjJVZl881Shd7B4WJjTXwv3uUyDzv9YcWQ9tWLF2du9W6KsK0X5WRWdBtmfT2MJSrr
 jMTpWIRtuGZfOhSpNx5FkmW0qaiCcSzahnDIOJzoiE8ILi3CRphvNbvAZPIqzehJ9i/BcbosFG5
 pg53aZf+6XqbkUIdQV9fcid6v4VbWXYt7EcqxKLDkzvDxssfRL1KmdiZjkVUAfnBlBdA8t/poHk
 SR7o9sp3aXhZ95m4IP5PgAC1VwJbs5YdvsGmfxdxW1tLEHkm4sC7+p/eXwuik9lHPENd6wuTjjQ
 HTe9vQ2l6i10+UtXgOK1Lj5KJwTpXZebw+0z0IUqFDYG+XUpsQGuDgViNFK2ibDsEsBm5HcstsV
 M6pqm9xi7Og0lYyvUjg==
X-Proofpoint-GUID: ZnUle8MLkN_FbzGmchx-y1lIPwbBlxHn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NyBTYWx0ZWRfX3aStDG3QgAby
 ls7Ru7WU12S+VQt3lolQwFD0lz92v3IUmwDu5WbRVIL7LaZwI5lb/ZWHSqpC9bLPQGGMuYfQ28m
 Mu/sgWUC1MYEzEENGf/7erWLnsexAG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170097

On 8/12/26 8:29 AM, Wangao Wang wrote:
> Add UBWC configuration data for the Hawi platform, which uses UBWC 7.0
> and enables the required flags and highest bank bit settings.
> 
> This allows drivers to query the correct UBWC capabilities on Hawi.
> 
> Also add UBWC 7.0 support to the version tag helper so that
> qcom_ubwc_version_tag() returns the correct tag for UBWC 7.0.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
