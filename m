Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80977476053
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798622; cv=none; b=fxl7nPp7Jl0bZmgQuSlItoWLMIVjIv7ZiKe5fO8lIdrtjKh/GIotRmrvbvNyyV99tVpNPOXBCcjt/ycksemNXynKUz8IDv39WP6GHlSus4Rpujp6znl2+iuW/HtMQ29NCD16vdhLeFSCAdKOk8nseHgmmQSZh/pWTXjXEKxjaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798622; c=relaxed/simple;
	bh=bkUoku9vvOCC45/xH4+TO5c/C0lBGGKl0K+LjBajYl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXNbi/KJjtTNJhwLZ6wxmyKTVPSJwjWpyTF5/9U0hvdnJyx9DPDrSIxhBot3WlD4QFlyT32LbeEXahTD4HxkWtRu5/NVKDUFuBasBgnaSjMwv81wArQkJ4f5zIRXoLh0xHd82IBnzhSTZzW+g1I6iWbvZ/u1/pbErGPFesIt7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct8zVjhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTt+9bnn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct8zVjhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTt+9bnn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KluK1439173
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=; b=ct8zVjhQxysGhVih
	XneGqg/XFRjbzCqBQQFkh5XFWTiZYRtSXVuOQbrBw1TlcOg2JOV4sRMK67etHbIr
	pQE8YphIJmvBSIE9dkdmMZrMosK6ErNtRoZjOxF3xvbN9EGN7MPnLTQSrznqQzed
	tWctd1AR0vT+wqw2evnJyPf+r8YnzToZhTURIIiTY24IVf0pQg7iMEHlD2ojmqjb
	PGqwpGrt9U3nvSyC815dB4YDkonbX7kum1qrrBZ3qAcmOCaL15L73MtVT9/NTvpd
	Zzd1MJpw95yo0qGmMKqNilfqflBKWwO1aBaO0RSGBrNBpLOQvP0KIGW+0mpdoSJ9
	9fFkRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkhdtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:50:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaee1fc104so2152941a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791798616; x=1792403416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=cTt+9bnneodA8YzTBbwWThEz0qk3PMa963D8SusqaQSUbV9mageUyJb6b5HYNqtKeB
         +9SheizQ2sTBsK9jwiqpWXXX5FuLmTPI0VKVmWTpq/R9j86ury6kmIiLnZii9v9nJvwR
         +c8gwkz2lpQigBl/8a/VPnQq3iKY+g1Y16zwi7IbBqp7YRPmho5LdzmiwI3+ek8NI05v
         W11jhpFSTRQcmoIDk63vL89CRRKGcEzT4pOfL6FfQQdylEfYKJEXKkGL64vbfN/cjPAc
         a1iEOfJf9NHrcLqGE/HIee+MA2dINDUpLyf0nh/EJSYn43csGCLvNkwZTNfW0vK6zK+3
         KKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798616; x=1792403416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmYseoi7yS4p0vjT+tNRp8PescPJoKYu+LKWr8PD8bM=;
        b=jrUzlxQU4B7t6G+AuQUz/+M/8umBRSWvD9fWmbGHSrQHkwIQOn5ac3aUjj58eYF319
         rwVqTDyGhuP4B3Nrr1a5IjoBEtaqD7nXa8kvOcG/gJ1x0EmbhjsaJdoszWzk+WEFvO8v
         2kYEBQFX40LcgWcizFmFe3hmk5xvnQZUhsCOEn5+S+ACs8m/0/ffQsPlQ/S/oGiRibDF
         VBZ3lI4XNulV0HE7y02mJXQ1s3ZK/VzbfWiF4inXmGhVn9G47FGxYRrpEfcqVfcsJwrO
         oxGM6kP7Xp7wCbDoGmtp71xSOAT3jFDswdaePQ1UU2VVgAWGBkFGdJ/O6IZLnajkKrqc
         1wxA==
X-Forwarded-Encrypted: i=1; AKwUvBz9jRgHOPUvlRMkQz4/zDcsnQMgUYRhW4rFm1pyPodivAQLyN97iX9a07LH9rJ46UMZ0Xu0mdSpTBQG/IEY@vger.kernel.org
X-Gm-Message-State: AFq9FYL1MCq80+V8DixobSJBhxKgb6rG6xNKSbvTtY13c6JGnyr+JvfF
	Fk9j6aVMoimLJDXaGUB6XlCfZXFa31plppeIKGkqoWIZhaQxYHDkq63wRI8HnFbvBQ1uZ8EeFYP
	uhFBoDAHdYW5vbOSHafxLppeuFnD06vejiE1YInMXYTJgf7KNCydTbm2PnIXZhf7FDsO8
X-Gm-Gg: AYBFou3l2lNHT/BrQesTjsY/bibhbe28ZKq64KBw06Z+iuEbS8n8YEknAzLyrMJD25S
	ncOg+Lrnwpp9TUME3u/vRQh58HfKxrtHLZ9qwhs2Y/AbRmiEFfiZyOtt2mVuYuBnenFb44yigdr
	FYPM9hu5Owz49HCqaSqmPtyb99JF3cljnxl+rz8CSgbhvALB7DCRieYh2Fv8g2T8W6nDxMOeS56
	oWYJmuFaqSdodX1tsxgjxFx6R5Wssbu3IfJSt2fkGTTMxuLHJfimjbenMIKQS9vTmDWbDoCEd3z
	7bKMUGqFoqrI+qYb17ws5ZeHgSMaKquJQ+AWNrdsyq2c6nJHO+ukI+47LWRv9ptVCer+8ULxHZH
	J2XAsbmBtUfSV8V09FrsTdGsMs1dbl5XijNveQJeTAeX01hxj3udGXk9Sl9SKlcscuI9soYEXC3
	Km5pxG4K5j92A=
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364578a91.12.1791798616188;
        Mon, 12 Oct 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr6364571a91.12.1791798615743;
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm16558029a91.14.2026.10.12.02.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:50:15 -0700 (PDT)
Message-ID: <bc6440b9-0226-47ae-9e33-594ab6b92004@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:20:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
 <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfX41ClAU4+57aa
 wHEJqneVW1rYf9eZBj1XVR28XiBYRxJBwgiGgurPQFEaGim8fzgC/OCSXXq6LZN/5YmGx1PP6AW
 abUWq0smIbZO4WlGU20xA1kwzmpIbJpIHQE1Yq7O/CQIG18OURyafBCera6HdWW7AzhThlFoZfn
 5ZpOOnejE8Y9yLGSKtYjXzXuQYsfY17rvhb74NEav62ihn+2V+mIkl+ojzuhHiyfcPmXuTO6kne
 +E69eXnQYra0jMFNjsDyUsaLoqXvUtLbBpNNBzvJfmuVCttkPjIwyKW76/spewxq1NK+MIXiBcV
 dYIS8+2JD8lN/3rIAEPYLGPmeqnMn8Pz8c8AtIfulU9M415oaqRaZRDlj6EOjo7tI1MPLqj2AR6
 A90AXgJKJmaN9OJ80cWmVvXmeC3QpKcpb09R7AEyyVrMkq7lU8av8tFL0YN5ZFFvgtu0HGUxA4j
 v1ITmk8zmC5/BNnEJEQ==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accad59 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NpMNtq8KyP0wiFrzd7MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzOSBTYWx0ZWRfXwI+yTnHrU3N1
 pySen6wPvt7oHb3RB+1NIS/GVMuoer/B1cGO9Kt3VWhato2xGYyqNTcMkY5tB2NWVg4ELKc2Ufd
 XXzDbQ9iTT35GygeyqX/RyiWahDpTeQ=
X-Proofpoint-ORIG-GUID: BdTsK5tKnEtPmWLTuZ-D9dmykor5eqZq
X-Proofpoint-GUID: BdTsK5tKnEtPmWLTuZ-D9dmykor5eqZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120039



On 10/12/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
>> Add coredump support for the secure and non-secure OOBMSS carveouts.
>> Register fixed dump segments at probe time for attached-state recovery.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>>  1 file changed, 77 insertions(+), 8 deletions(-)
> 
> Why is this separate from Glymur support? How is your device suppose to
> work without this patch?
> 
> Best regards,
> Krzysztof

This patch is diagnostic-only and is not required for OOBMSS boot or SSR
recovery; without it, the device works but no OOB coredump is collected.

I kept it separate to isolate the optional coredump support. I will make
the subject and description generic for coredump support on PAS
subsystems with secondary processors, rather than limiting it to
Glymur/OOBMSS.

-- 
Best Regards,
Anvesh

