Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F9346AC2
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785560915; cv=none; b=F5MOGP4NrGCN+FMqtbCfiAq6LkMwRUQc0MgSJ7OmJxeYsxbQg9vcuDniqDQXAWqmKhF9JGYelZjwLzwDnqKD3rCi5QEdP9W3Y8rEsU9+I0hyTggS+nDmB4SCm8fjsaN1pops+hwRNwWU51AcFR5SNXaJ7CiP1ximFrGwWb03gnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785560915; c=relaxed/simple;
	bh=qon5+tBKMLNrN97LO9LX0bmDnUJ8nxENRNPjztMOxg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iApdzxjmkJkRTvv64RQNfPOBDoL6rVkGvDNvC/GbBl1Hoemd8zT3TN6KAtGCVg6Xxk1zHjXUpzXov666gOL50jEwqyK6/+MOgU1/mDJsZd2vAAChZexUxjeZoKQ3Jf9Y7sAZBQaqbjJgxV8gTM3Zk1hTlBSX4LF/27NgSrLQysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjFr+s/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFkLa0tl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjFr+s/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFkLa0tl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713jbk61688896
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 05:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mY0UGI11NNthD5CS4ozr4z0G3LKZv8YYZjZmVFMsJMc=; b=VjFr+s/8svWzRqFF
	ZcOK7vLQPTWvmn/2aK71UsrxsBOAxUyESFqCWM83ykBwX5tz0h9XiesZjjQA0rJn
	kPLjdEBzS2ZbZOsiISs4bR5oHyleZ9tM197qqOSTlXR6B1ZqYesapxK+rx42V9bA
	/ZGVpGBbXt60KpEFUYteTZqdHIgmk5NXw3GS+SW/L92dRNPJUcDw4ypYHZ5OLqvB
	UNeQrweFgqEwCP/08nsBGtyTjbjjHXTwkKyS58KTWEuSw7bOVU1d+2HMG56LO3d4
	Sj/ey3GM5O6AQvlj0dL0LafuVxxICsnix1egXuNBMlZ/DSVYJ7/tjzSzHSZnWGfZ
	Pwq5pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs96685bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 05:08:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1174204a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 22:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785560912; x=1786165712; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY0UGI11NNthD5CS4ozr4z0G3LKZv8YYZjZmVFMsJMc=;
        b=JFkLa0tlqF2Y3nbFst9CPRJFcUoHzJSgNxQozOvPsX41axZWUgkjzpl3maWKIHiVZw
         pjwIMWjF5WIcOzHKMdIRaHzgQxBvqpVU7TMNC1D4Jkj1PBYK6Jnv12fAun0VRZv0GWz+
         /IeGMywzNWU3ERI1hdXxwgfWSuYPU9QbKFL6sk2nzNAUHY8CyZLDVfLRRXKPNg60IcLM
         PQoqJj/sebhzEzhxwK+ESVhVWBlVloREms2N16q7FFYdczqxtX7Pp6OvBoK+7WXlqXoV
         1I/1HdvPQGpQtQXx3fXdFPbjUCdmZJ6bk/i0DLFFUDrWMDExKMZJsZhG+6bd97fK+xK7
         kQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785560912; x=1786165712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY0UGI11NNthD5CS4ozr4z0G3LKZv8YYZjZmVFMsJMc=;
        b=KR/hQJn3Ubd14w9C2HFyE78PYljDoYIdwbP9XjrmNDGe2PA7/zX6gMEM3WWKAhNUsf
         /eM2zO//8gWns2fPFTsDrksymXSexhnrqi3m9sr9hRpsBVaV6ZFuS6TVR3+hSnJOJot8
         2b6fgX2DITKpGkYMytjQj6cfhW4WNn5vDyub/YF6vwlCpf21EBfIhmbXmnDeycgqgFKu
         g7lfY/HagNQoHJfbtLoX5Lif6u5p25bR5c5/JecV/pnXMac5FqUrQK21oalQZNhqHkhR
         t4KDrqh2FCHio1Dc+ntByvlNB/6HS36hgBw13SjHmHAOJrW5YBSIoRp4GQgJN0h+ACl9
         Rsag==
X-Forwarded-Encrypted: i=1; AHgh+RrLwwKtuDynQJFjOqwt8pbNE2F46b+eD8i7tlNBjpJ5Cx+SeJdD4QBmu4Jauyh7INzFE5sczOQsJQx//oMB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0iQyyVVjTdnFJOX0qMf7XR2bV1uXvTC4Dpn5lkd7c5vzXcSW
	o6y8uYXjT3/OzjPkbrLaozJsFQfALOAwHWcDPZ0hRBxhj1ib3piOTuqSvoU+OazSPtFgF7I/GPT
	PHdPKmlF+8ahk5u1cSHw4NhZ/mJ50BM6qbFWwhMy5pYN8e4SVWX+Tl3NYBcR5ZcoXizt5
X-Gm-Gg: AR+sD12HlqECBUnVEsLuDRyNaMBbe3h/YgSYo7xSB95P9Ky9T0Uehesr8dF747Rq9hA
	FXZ3x271mjVzrT/+4jb+ZWI2CMR9FNcV/lS2UBvcmGrgPKuYdu5Rg7m9r4Ph9ZHx4Uyc4tnWKC1
	XFOa6QNM7VWVJ9CmF3sgj62taGHX6q0MNUaEBHczz2QrhZ+FPxOjxyhtYoptNy+lyYEfvSTEDrF
	C6TdIQzPA5GMOAODKGKPgbcu+NIaiYt0LAIBRmYALO6dXTCggZ576X68eBD0bYNAxyfWNvgd/By
	RqPVspZ2jYwe8t/suthIGzYGR3yVu/n9n2/Ggd7EpP14Ekcw8Q/AKhj7rttlnF85qvJu+HTrF+M
	SfvJjAB5LE4mPlrR5Uw9YqNl64E46FX1o
X-Received: by 2002:a05:6300:6705:b0:3c3:c687:a3b9 with SMTP id adf61e73a8af0-3c92a8588a3mr2355551637.48.1785560911724;
        Fri, 31 Jul 2026 22:08:31 -0700 (PDT)
X-Received: by 2002:a05:6300:6705:b0:3c3:c687:a3b9 with SMTP id adf61e73a8af0-3c92a8588a3mr2355527637.48.1785560911149;
        Fri, 31 Jul 2026 22:08:31 -0700 (PDT)
Received: from [192.168.0.2] ([49.204.107.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm11188579eec.9.2026.07.31.22.08.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 22:08:30 -0700 (PDT)
Message-ID: <a8c5f8b2-4120-4559-9219-0e871d6a7707@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 10:38:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] serial: qcom-geni: Reuse common GENI framework
 helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        chandana.chiluveru@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com
References: <20260720-reuse_common_geni_framework_helpers-v1-0-c3330ab9b982@oss.qualcomm.com>
 <2026073053-gracious-creole-cbaa@gregkh>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2026073053-gracious-creole-cbaa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pNAQM0lwh0z3uUxiEBO-vgoDlQ9IswEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAzMSBTYWx0ZWRfX6qByUjVWDuDR
 V1liommZEnLR5BleEzv1IZx8a1TOnYow6GYT6yTQvewfHrnIyims4GsBCfte5ZVsB+LkRJL99Ss
 cHflCK67A4NBmDx1N9iHHkUP0W0Yy4GliDRWdqRCtUkp2uVuj7R9dg4Hv4SWG3354h8J5fDM6pJ
 DWr0p9FgQvpBgwM09cZVQAHxW2GHz32S9EncMYt5RgH/3c7z/1jhYaDd3fma+zSNDbrt5CMlds5
 zcofZVhbyxbfi9G2BIWk0etnjSciovcSsusVY8pZq7vUY04QUeebLWaS+ZCUlDn+82dcH+bcxdB
 +B/FZIR3u/YQ4XY0P4mQUEpPITPQoajd/g4ItGa7Mcx0WCYkNBhq8QuTLojuioeRrYMA6sOdsbW
 NarmIVYbPGo85i/3dJvHLb5Xa3gzbydYuX9+eYcspj3ozbksBZPKlRd8kfxaWJ/e529c/3qww5d
 nW6E33cAE4RJu+6oJ1A==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6d7f50 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tDmmJO7lUO4YOopqcJwm4Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wh9H0PgVFRr8XisvLDwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pNAQM0lwh0z3uUxiEBO-vgoDlQ9IswEH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAzMSBTYWx0ZWRfX4Cf78mXm00qH
 Qg7B3HK07UHXexZOxG/3xg0d1espq28bd4sSRr4sBCcc/B/7M2bqQUefzozy3NSyW8/pG6bCH5A
 lYCl8shuQMS1JpoaoigeFne44lPFQdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010031

HI Greg

On 30-07-2026 20:30, Greg Kroah-Hartman wrote:
> On Mon, Jul 20, 2026 at 08:37:48PM +0530, Praveen Talari wrote:
>> The Serial driver currently maintains several helpers that duplicate
>> functionality already available in the GENI core, including resource
>> initialisation, power-domain attachment, runtime PM resource
>> management, and perf-level selection.
>>
>> Replace these with common GENI helper APIs for resource initialization,
>> runtime PM resource management, and performance-level configuration.  This
>> reduces code duplication and centralizes GENI resource handling.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>> Praveen Talari (3):
>>        serial: qcom-geni: Use common GENI resource initialisation helpers
>>        serial: qcom-geni: Use resources helper APIs in runtime PM functions
>>        serial: qcom-geni: Use geni_se_set_perf_level() for baud rate perf level
>>
>>   drivers/tty/serial/qcom_geni_serial.c | 204 ++++++----------------------------
>>   1 file changed, 34 insertions(+), 170 deletions(-)
>> ---
>> base-commit: 782f4dbd1794b4f30dc116a7ca42c5962c409be8
>> change-id: 20260720-reuse_common_geni_framework_helpers-787081bd61a7
>>
>> Best regards,
>> --
>> Praveen Talari <praveen.talari@oss.qualcomm.com>
>>
> Doesn't apply to my tty-testing branch now, perhaps because I took your
> other patch for this driver?

Will rebase on tip and push next version.

thanks,

Praveen Talari

>
> thanks,
>
> greg k-h
