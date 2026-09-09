Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368773939BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979049; cv=none; b=A+LqotxdFxe5hW34xiTGmvVNkiQ0isefTawdk/s9cJMxQRTKlBuW70C98F7J365wQXcNxXEL00XDARAzS8Gap2ah41gahBwhOuNY5HZlV5rceOS+l9P9QmSzyNE++fBogVzzfp6ozDMeMh7e8+Fag4pwyn5BxQyu8qitOzdU15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979049; c=relaxed/simple;
	bh=CXlmz3Qrz+2s4K8YtyrdzhpAlduZURZcGsKuwFIC6As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBF122TX65pWHAsS662AQg+0121rJ74z0jBTQ+qgzkYD2XpBAyQFk1z5nWiYw+gkoIYv3kCn0DL5wf32R/rNALmZPdI6e5pvWL9MbTcH3iSX0PrIXwhte9vhJC5FgI5OhOBVJgm5sNi05Jh2iOAv/NGKTfJrCX0e8aRJdMnbIFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgYIW3k/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx2Y1HrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgYIW3k/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx2Y1HrF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7SqC2477226
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 18:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=quHjMOAd0R0WYl3Mfy+0+cjO
	+Cogwa/gMhTd7XTRQYQ=; b=FgYIW3k/Po2qhpHCG60/8qq+u3kn+siHvlJfxmgR
	YwFS+ioUfPGFropHZGUhADSlIyDZOyBxJXbL8eAFOl1WMiwRQ75nO24TXzjA2482
	XwV6UkL4+8sGJcwDwWv9zfzyRXMDs55Y8FIR76ilacA39edRNCrefaQBVrlWCwe9
	EaGKN0yNowRVmPuCnvyLu+ZgGt8Qbmmawj3edF3opVu5c2tZjAX6UJXmMkSnucmR
	2yquqF2nLKkYMKvbqtfiUWcVjjgjKRHxHrZdLEcN17d7b3u3ggMcwIn57EHvMpG9
	6mV1iIeQps5cmQ5LG6Z+/s1Kx6pDjpCZK42SqgIm9fwVkA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cntbju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:37:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-790376c9f8cso194278137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979045; x=1789583845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=quHjMOAd0R0WYl3Mfy+0+cjO+Cogwa/gMhTd7XTRQYQ=;
        b=gx2Y1HrFGSluhpdjxLwat45Bew1ZnJ3k+4tc99ixTYqJSm+z4eH3MXU+0hZRhS1LXo
         Ehwvuk3jN42x3W0dtDEWM4Mp1qoVy8z3JUHyBhfXunhkBPV4rI5F25RTA/Gu3dapmZZ+
         SvGkd17B5byWytL4YX1zqGQ6Po6aqv4i4mwJeharhOLw+PIPdYiaIKLqnGRKU1rBY/5N
         JkKCKkfpbE8JZV3fVz5fEgieReXkzWYfqIjRmhYoQ693T86HIAqNmFZKbRG+fqBPnDaJ
         By/xJaSmyh3ORdHuxyLOn6ntNOukARLXOXIkdIdV+d4HpO+XvopWFxR26SGfEr+7lJfw
         LDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979045; x=1789583845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quHjMOAd0R0WYl3Mfy+0+cjO+Cogwa/gMhTd7XTRQYQ=;
        b=NRlRIZYDMPgbXSXvRkYOupggqM3btrn4YFPJz1ZN4wBy1Huz/N3phMjRg6YEtX9X+3
         QQZWbRRapQg3X62mHqtaQ6n4dI9AMhKvoODcjra0KJW1u5YwocWA77Ctfyb1JSBRa7Rh
         o/gGIh7RhL4vmrE1anSOpxfCJX65Gvj0w0VxubIYixf+xwRLzypfAUPAW/OX+YSbpRzS
         O+CRYbTnCT2YoHYZ+vd9gWBaYSM2qRfcHuOXoHqfk8SY/dTjqWv8XsL8JmyDfjsgF90M
         +EUejvrB5A+IhK5YZkRqtwNQcGsnmqzAMDzoE7TelzPBO+IPfC7XDE5zBteLL/1NJVsH
         SJwg==
X-Forwarded-Encrypted: i=1; AKwUvBzMHeeVxE+gDMPi7hZyo+H1yptNAUWlArFW4nIkK6S5n6V4KFpHx4dZwp3XwSICLj29Anr5dek1HKO6ub6k@vger.kernel.org
X-Gm-Message-State: AFuF++nKMIzDPkfW5SNmQMwBiT4QJFHkOh1orsqvMPBuQ5RhrsGMX1v8
	nWjVdg2eOYysYJZriMYCRQ7fnA+Beb8zkgEPfgaTG34tfYuZ7PyoZ9QgTXidENrHaICWNyaS5by
	kNegoz/VqmgSgrfnFk+OLHKapzj+7dWikbO00XkYiOHsSBttr+rcV65CqF3s5T3eHTbGL
X-Gm-Gg: AYBFou0H9uGblaY9zuQJGiVFMSA/S7rpuG2yt1isUfjJyhOPB/7Z/wePMxKf138b5vo
	VDAJgfUALIogdBT86Bv+ftCZjSYIl8uwRhzh3Ec+vWoItMYyQFkic3iicvqvTsAgYxoR/4e/Iny
	p86tBQUZC+8Uygr6vZPwYgFJR4YliZyWehUy/48Y2j7TxrdqXpmttmQsPZjmMBf6zQ3LTeEJ9l3
	YfveJcpPTDynjHxW0UOCJPWgRzF3Y2KBWh5tIybuYI0zQzebKQBRnZlriw5rVHOQoQ1VeX1BxQh
	lg9FOygGLfMeCfZFjV37jQ1InMo/hFo0IanQqXkJUfdzfV6Re29ljXR4zu9gt5ukZcQ1v5PPoDj
	J1a/shQWKNZHrMqwT1Y2zztZ2ZcbK/rRwu1gJwJ2XmTkue+IDmd8r6e2Ly29oYeR4NI83le8eAT
	G+b8fQBlkeIG7R
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr14834706137.0.1788979045178;
        Wed, 09 Sep 2026 11:37:25 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:784:4d38:ef58 with SMTP id ada2fe7eead31-78a4a57f683mr14834676137.0.1788979044698;
        Wed, 09 Sep 2026 11:37:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61670537esm3966734e87.66.2026.09.09.11.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:37:22 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:37:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] interconnect: qcom: Move bcm_div() to common code
Message-ID: <v7rrdfpcj4wi2mjspxhmnrf466exjshj733osyv5szkiebznvw@qoex3pioyqtm>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-1-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-GUID: 1O_X47wCkt_J6p1NIXKEDmyVHoOofXBt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXzuoC3mtLfnn4
 2oLEU4ElPuJXexCqE+Is8zLwEPPW0A5x4TgJJVgntIYc4QLCI6QHClYGPW8c76Ifna5WH22+ZdT
 kdW9moDc4oUDYV3XoM4MW8jtgyMvKhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX9VhpkHPolq/I
 Ry2Zz6uTHCGo6xeIRKQP1Ywxiosm8jn7K2+E9XVMMbFQe2aub5S+qNkBIOIch+NkAUWCO1NqV/m
 1QMubksAAzzyJlvz+UivnX/BRlnANrSDU/f3ZdxFdtt5Vfvav0SxTm+1uek7Eo7OIPnBwvxNQMn
 ziMYBIva5efCi6rP3iG4ttVnM4Lmr8dpf/VbUqa3UVYtge9YHvMYTVUj07Z7JjfuQ/tfb5vwBSQ
 b+qQmWOYSvmfkp8mQEzLRwrgoR2qkbO+XtZInvbKd8PkeoS6HemFHtsRpEjwTVlnotsvXWIV8EI
 WfGwaIkKAtx2TsxAKHhmWekUhD/VG7zeGfuyffPwOaJHwnd3SgEl5rpsQWpPpCajQlM4wGk0cis
 AAP0smkmdFY64kDVRU5FwWwIszqE3/9BAkrlWPzV1PJ2T2iTmKfgeL0BaoAC6/hziMLNnpzcwp9
 T5QPBFQ3R/DfxtyxbMw==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1a765 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wiZ877acDUlgFteYXlMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 1O_X47wCkt_J6p1NIXKEDmyVHoOofXBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208

On Wed, Sep 09, 2026 at 06:41:54PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This helper is useful for both SMD_RPM and RPMH code, extract it.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/bcm-voter.c  | 21 +++++----------------
>  drivers/interconnect/qcom/icc-common.h |  9 +++++++++
>  2 files changed, 14 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
