Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF10E3C0625
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175166; cv=none; b=GUHjwcmt0PTnVuRGvWIK55+8A+wiCMbAvfWo9u9vRf75EktTv8MOGBDn7XjstPQlVCRTmsTqivkFEm0KT8wdb/OuSKZ6dSAdIWNP/36ui/f+zUYhdfiyQ6xEJZRdda6kaedF6QasfpIrUgZEGXXpu10VRU0rh5bPVaNs9p/LfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175166; c=relaxed/simple;
	bh=Cq2h//tjOBirhh+fwz99fTqwQXJmKrJ1A+2RAX+V9ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPa4A+RrA/n3S5J60IPfBf76SiyE+LPoWOp2c89b34B8sdZLOiV4TtJ0KM57UG4geW4ZXuXqpIo09ib1VGSOm+lEcRhCvxrswTi3NPbhMB9Q2LTv8iuY6X3gYaAN7EtvWXoIYkiJHsX8u/ikXY1Egm3IYclEzlpPHqtQhZxqOII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT7e8r+S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/zPgTQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT7e8r+S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/zPgTQa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RHbnr3568883
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9S3WjwQolNgmabnyJkRJH2WI
	IeIuQXY01SEDicZi6so=; b=RT7e8r+SwcMUzkBvuF1VRSl6HZmY3CQ9ikyuX81R
	WulVq4fxxRRoEcaSTZylKXuuUJPxQ8SpdbU230cUjUEBuM+swtw7tbbNOsgQyvHJ
	hIllz+DF8yEkHmZx/T6lmK8ZpiBj2F4rNvdKkXUoxFRbP0D/akHIdGa2/GqTEhqV
	cLbyv/qLo2y1eebIswKGo8UMJ1v2LIsSu6dU7HSTk/i6VSZb/ICvASjYNepna3VH
	30btQ12KolvYUBMaoh3UzHo6vKLn1rME0j2+Oc58+dlguTvc95bWI3xJrHRJv/JU
	KIjaYuKIaPTvb8VrcwKfkGea3egUW9BBI06rWKwUBxEHQg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c62agk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:59:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso63744775ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785175163; x=1785779963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S3WjwQolNgmabnyJkRJH2WIIeIuQXY01SEDicZi6so=;
        b=g/zPgTQaOsI4C7zq2GjgyqX0hPAuW5jMi9+JcNh0v/WmjYD4roXgsra/sTxKH2P+Ha
         5YScrHi205kMsu8GW57P62zpDU+XMmSL0Q88MJ/MntJ0gDmpC1DSktWU8Qo0lQtDUv2N
         e+4EYBX4TgHBEnoMuF+69YZuW9mtH3DQkiWyUMFydqYcfPum05YxorBnPy0lUZm/d9J5
         3A8qY2Rwns3+VZ6vfx5b84Y18WIyCvyC/dluD7GeZVWOxhbNB8gWPc3kY5w8ZweVQH/W
         HW+CKDwefRD9TQSiOcFlVemOAcC3FYaMDrmo2opJH6Q+sME5WorvTw2/91fKE1ASeMJm
         hiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785175163; x=1785779963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S3WjwQolNgmabnyJkRJH2WIIeIuQXY01SEDicZi6so=;
        b=Pg3AqLH4wW0fUOFRu7TcpxIr0rQb6DIWxiNXTAxFSSAx1F5SBDl/NAAy9+nHvXyw4f
         U8dKRuPTlRRvXgqggW28L28V2DvSLz8MFcIPmqSp7bdElP6Era5zWSDOtcAWmjlWSqQU
         gXnKdGfWcHpYSWMGSYfCKPy7BQ2Dvm8u/eE3vEB0cVMf8ZygZF97lubyyqbcjIN+5uLV
         KoBneHsAYa4ZQ3/M10wcm5KsHuIxvcY1vhJ632/L5d6Rl6RwWtqmhwxjWGocTqBTNnUk
         pWwVyma3IBcL7Ova+reWVWAMcJ0RS6lHiN+6Blqvhcw96ncaBKXhwpKazQmnUfIWba4w
         eUHg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3l7Q+MVJmWWBuLp/1d8xMWxTs5be20RzEDBSYF7mU6ETNdXOHpep93egE01Z/7+ZA0P5x0kP0rA6/KOqT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1DgFgl9ATTKCM1+MhhQKMTKcXkDAmfb+KiPqJS0f7hKVB0KBC
	xwJ2/5l4Zd5gVqmkk7toDYq6AphnNIQeDJW3bEqBXEai0WePAauDkKfYKNkCqjJiEzKtUV1syd0
	JjBEwtZD0IMabD3XaiO+Lf4Lb46iaDgRbEB+em0t5357YzmgLE6W59qbZU1tyqGnvdJ6X
X-Gm-Gg: AR+sD13AyL3kwj9pEZSsm68vDodkSspMV8DLF9y0V2s69f0xLeo3d/SA0Rhqu1Lm0J8
	BJjh5rmWIy43h1egZXGN6TyQmHbNWQKqJ4F3pLsv+ef5m868KmxD6MKZjmrCz+vBAH0xqyNQVO5
	oxOcQ2lViub3q9tNDqFOfPv6EYWq7M7Nyy3ToZWBWHgAKYQW03GYOpOAp9Ef3NVIxNjaqLqlmN6
	KZy/lyqsaAL8sOXTTjYWUzaQoJW59jRo7DU04yfHHlhl3j7Y+6OhIJ1fK2Woye0YBbJ7/zgCaFZ
	YEzSkcOvmnDuSxlMvTpUscsq2oueyM7C2E4MgosS7sb0ImRdtg5l3nehLbD+kf6wQRG23TX3bXj
	f9uB9sLmMjk7DtWYfHAth8lV7MY/sLFDl5n3Q0AU=
X-Received: by 2002:a17:903:37cf:b0:2cf:a5da:705e with SMTP id d9443c01a7336-2d00f3ee5ebmr2770765ad.41.1785175163309;
        Mon, 27 Jul 2026 10:59:23 -0700 (PDT)
X-Received: by 2002:a17:903:37cf:b0:2cf:a5da:705e with SMTP id d9443c01a7336-2d00f3ee5ebmr2770385ad.41.1785175162748;
        Mon, 27 Jul 2026 10:59:22 -0700 (PDT)
Received: from 058f6326d650 (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm56467208eec.2.2026.07.27.10.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:59:22 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:59:20 +0000
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, linux-arm-msm@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@kernel.org
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
Message-ID: <ameceGEbXlQNGOEt@058f6326d650>
References: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
 <933506f1f210d3498d515d55266951e1914cbc9b.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <933506f1f210d3498d515d55266951e1914cbc9b.camel@perches.com>
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a679c7b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=yzAoCp6uCkyargD1Up4A:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2NiBTYWx0ZWRfXzFaHtbmMLTHm
 8R3XT5WQTU68wDDdVN6LM+wnaaer526VMUKVhvwzTl/m5BXiLCL/sF64+xovJOWUotGQV7HLqm8
 8XsG80HJovwIqJz6k5H53nm6sbOyJuM=
X-Proofpoint-ORIG-GUID: ffUKWUN9FW_VabcqAsvLTC9cD2fdhHdO
X-Proofpoint-GUID: ffUKWUN9FW_VabcqAsvLTC9cD2fdhHdO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2NiBTYWx0ZWRfX44UDb5ZwwV8L
 r+pNnqj9fl/2WKtMkqhp77okd7zw9PwjH2xXs8KlGA44Lyjm02OVzuK6jmMguuyNAm/XNlqOqiZ
 ZveArWJc77vB63fLeaF+M7/g4J+reYsHh9PF63HPIJLTeXDTbSgUMdT5Pw8HLYCMj3nGbIrfzBc
 dVvqlsfa9Qcd64czN8LlLcrr+rm0Ofm9DPlaii/TZoPqtr/+HvefXfSOFpa+F3Wpfd93l6TBJ0P
 DU/q5R6MwFyCTF3GmihpgJDvcWXCrG90z4J5afz2WNNQDimNPh10XtTPsuWRZj+XDvurDJR6KWY
 ikuV9vNN7E6NI37CkKwFuYK/TmXISvYMkFMHMpLjCmky4MuFC/zPjke6rdSzTxwL1wdeHw63Af+
 MJtkT6QJPJ5EWWv5AbEG+hibX36H2mb/Sk4NaLPECZ1FXrqaXAM9xPLLlX0+HkbeY3L0zQRPkvm
 CL7Tf5W7JbRwRIaZg0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270166

On Sat, Jul 25, 2026 at 03:47:34PM -0700, Joe Perches wrote:
> On Fri, 2026-07-24 at 18:56 +0000, Bjorn Andersson wrote:
> > ```
> > checkpatch validates the Signed-off-by trailers against the patch's
> > author, but misses the opportunity to also validate the committer when
> > run with --git. Maintainers therefor need third-party scripts for the
> > final Signed-off-by check.
> 
> I don't actually see that need as an issue for checkpatch.
> 
> checkpatch is for patches, not things that are already committed.
> 

Fair, this is only applicable for people managing/receiving/collecting
patches - be it maintainers or people gathering patches and then resend
them...

I didn't dig deeper, but my LLM found 32 cases in the last 90 days where
linux-next maintainers points out missing committer sobs, so it seems
like making this check more conveniently accessible would help more than
me.

> If something like this is added, it should _only_ be used when
> --git is on the command line.

The 3rd hunk (that extracts commiter, sha1 and subject) only runs "if
$(git)", and hence $committer (from $git_committers{$filename}) will be
'', as such signoff_match_status($1, $committer) will not be evaluated,
and the check will be skipped.

Regards,
Bjorn
