Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191519;
	b=ok/PjKgZ1zyUKnPrMW0qqwZ/c49ExV633R1BdgaH/FJZEA+OSYqd19Ih2RkzFJEi1374
	 kUdj+Zd6nmrV1g7O0jlz3Xib9ONBXWdTPtWb0x1cFxB3jngldrwYvXXNiMmNJoTQ2nr2g
	 xX3zNCt9XXKa3TaCUa6ukh9QomxKpujzZdJLlO8v+J653kqyWRM3tJnvN/FpNvYUungL6
	 FDurgC4uz2dUgrdLobHGthZHgR8+CDMuohLIQyW99OrAhURT8eXS+OnSxGdonlCCrr/X7
	 ygcAzvmodjiECpD6hEuYoNDFmSwx5dSDQAUX2NfspY7y83SQkanMgL1i3crEHh70DTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
	b=fcCq89t45LvUzrfKuaCTVa+NDi39C6xNQ3yjeKUUUzdwW22hjtyVec9p93S8WAXPtbiy
	 ibfqracEgNY96+/2hA6gz8wJXVRl+dgWXkcbbHmq/MehT8RRkX+J9RbA5+b4UNXpOmEP9
	 NojAV1Xg4cp3Nur31cbcVOP4hajXBIiJr86ob0hdHnDOZ5XCtKTlixCCFi19Oqd/Z2mkJ
	 DyFFd06629xV7oe2P61LVtIZmNNV6EbM+FEygCF6mlO0CnzCG4TnG/gjd9w1WDQKW5eyC
	 L3y7boyOVIuKACdbsWYXUnUI1O59yYUG2CFHvmvi5TSDZfH5i0LLa/Vpr0l60sOSUcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F35606A320
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 02:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MfY1NQzN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A2eXXTGJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HNbt2360206
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 02:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SFrqMGiGYXTqFUF13dP6f7C
	gotj6WnY/CKyUSighPs=; b=MfY1NQzNlgTlzpdnjDkdCyR45kO+Y6SrUk21XBhs
	+0ldf71sxm9viqmWjP50XeV0MdEgrhEZc68hBHc/1H+Wnca+9zMbgD1cnE3jVoFw
	Db1Xss3ir39qcW78GW++YwKsD4880GikqvvVsOzc32KDesGnfoNJhhLMDja6FV7F
	Lsab48oGjW0JMdveYXwbhfj5wsR6cWkPigI4h0sV4da8uWdGc3A6Kwxnbu5vcuUO
	PWJPOlzvPdqn+5Hk8nlvXanIti/9jprJ8Bzx++Hl3PwV4ndrpM+7ex4eO7urH+Nw
	RsfkUXANQNXWib90mUq350pKl1U3C08usjqiqhEzML424Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvrev75k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:31:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso137235eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 18:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794191518; x=1794796318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=A2eXXTGJ0cjVkA6JHUp6iTxttBqXeGkWIfhgaAD0fP3uuKicNVg9Qe3A3uIrgyMeWu
         ZHpDjntMmrK4w4aRTdI4zyJGmE75ICgLqKoIEdOa0XLggh1rGFno+bXvnkoKx+0iRAMr
         MqEuwmnyIw9ZzdqqbfX5GGofrLHB1+PZrPr4bqSmDyalQajZR5bFvUU26Vm/rY69PeJi
         zJLB+n0arM2OOTSkKZnN2mITRsv6iSf4PxpCoaq1ZAeiZT+YVRAqGqt7oGNuQw5/+1Hg
         rR99X02/81JqSmD5x9lkTz+eRD/gcDxyFPpb0zxLU7DlAlsKPacUKtOB6FiAectpXKNS
         EjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794191518; x=1794796318;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SFrqMGiGYXTqFUF13dP6f7Cgotj6WnY/CKyUSighPs=;
        b=f7rRaE4iH6m8Ikt2HrnQNiqtKaRdEzZTOpSFIiSlC/7ek/+1U8IZRxyWzgLlfvBWOl
         G1IpUMoZXnXujYjnTFPdtLkGdU8L6+Mh1QC7pbVojYMred029oO70ek1BPE7r0ImSjgD
         vcnw2gu5Ue4qbERyU42QI4uRyUsqvUzSDq8l6YwFk1GgrS0wjZ9s5L3ahLq7xfgyjoo9
         9AeEUvHgQyXzWJQLDXeFAUb+NnIaeCdq1mSY80JqKWvSvPMJTwKIB/2AEe8Bc9W2U4aT
         DG+cagKUflC6YhuywGB84NDXbK0QqZ7mAcDuGDAzvP70d11U2VVM1njafML3A0O2ereT
         hZhA==
X-Forwarded-Encrypted: i=1; AL+hErHKo0k7UR5QqwOr9RVuPwZ6+CROToTBQ8Ivcfnqu/3Jbkns8S0eoucE2T/zPlQxbKgqbhnf0oYjG7FMofQv@vger.kernel.org
X-Gm-Message-State: APuU4Z+07U65Ir0lGeftcNDp2iea/ImP3r6Lt4vHvFdDxFCG9WYJnuVt
	jR8qsFcDSOjYtBxdyZ9zssv8NkOeKamv2pozutZO1Ql5iRApmNh0Z4wadaXcvBfC800XUMHJV/n
	qd6gdmElCvsQwHcts852wCof62SI06ExdYYDG68n1pu2ec6dZqWFVDjOF/+MjU8b5r3pP
X-Gm-Gg: AYBFou2D71rW6ppimF8CjMVSizBnCPIE/2UnS+Nm1vOEuN1e9CR8cQZjPF+Q58BsJbs
	4wXLNRAgmEHaHSvoMEqEPVVInKeF6CtjNfh7Qg7LqlRFU7uqmsw3AXRkLhUMSnUbOwC8oxYW3JP
	LBqYETC1l4UzKYnBPrcSbGnaEyrV8ep7bCY7zDEHzJPldghRr3I9CD0Ezk4ruWSIQ5h5PuXgkLs
	Umr+8og4xRbayPFyJK4QUyjK3zMK+6YP8W40lVM+FlAHJw4z7MZPxZzv8guDahr9PUSt0kEyDAY
	EnS585khZklq4GHdBWt9BjYvejQ5Uc1wA+Iy100Q54gcQV6U52jpbNYLV5zNUDXLCfXWsERHERm
	WqNLFGg9vMUUemK5BwgLTpF84iFzQM+6f01dVsL57Sk8ThxtEA7nKm3xDLTzLf5hWc1oUbxux8Y
	5bIm/wSKvCU1L6Z5Iw5IDZePs9wH0=
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302370c88.16.1794191517817;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
X-Received: by 2002:a05:701b:2905:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b39fecbe14mr4302325c88.16.1794191517129;
        Sun, 08 Nov 2026 18:31:57 -0800 (PST)
Received: from YUANJIEY2.ap.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm9659808c88.0.2026.11.08.18.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:31:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:31:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] Initial support for Advantech SOM-DB5830
 board
Message-ID: <avEwlqGhRQz51b_0@YUANJIEY2.ap.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
 <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfX8vJHqNOlNuIA
 FWIwtox0ljsYvZnMsLwl93TIWENDf1HLxI+Oj8QX2QlV72Xed73srOoVXzjZgsGw0/mHv0vOCpm
 AoVpfzYDKVPQ8fwtEN5im1l5LhUeVq0=
X-Proofpoint-GUID: veEcTTLVirtnQturm2HKlDlnJlne0UkV
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af1309e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=kNaXiPVJs_Xvx0yAIYMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: veEcTTLVirtnQturm2HKlDlnJlne0UkV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwOSBTYWx0ZWRfXwoFuuVI+AB2f
 j3G9JYxrlKk8iWt/eotF4vBBOu23ZFO+2GM3OYN/ZdxiXb6jg4STvP5pSrGvWy6BhKmXQi5BVjL
 /90soxdneoEI7Rw8zkSAl/A7ot3tsUvMIHdWQXEaHbagxiNfw0Np8dnKHkKV0vu5Dk7MehmlB03
 Y5ROQ9EWlhUGgpK5tTSlxa/b56bQPYtu4fhRT4u88Frv1y6jw0ZDZmAv6MU063NhBX64RLHPUmS
 Z5CWtsZgBcaeXtCDQ8M9s6rj4m29pWGk1qkAQGgdivsfJDvpI8Oos0ZmkEXFo6T+k5ZT7FLbGu+
 8ptMYgI9naZUImMjovG/CQECSn983Cj+wnR+NLbDCAIzKq8pAiGpK+57b4yUe8U5PjWPNSn6lX/
 BT9YPFeDwyvvNqDX4m5b/feE1fV7ICahuykvpeUCFC0qwBy3a5qWhskopeHceyix9Z5ylMEA6sj
 mUpoVfCOcP4DhMlXz0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090009

On Sun, Nov 08, 2026 at 02:21:40PM -0600, Bjorn Andersson wrote:
> 
> On Mon, 28 Sep 2026 11:18:47 +0800, Yuanjie Yang wrote:
> > Board layout:
> > +--------------------------------------------------+
> > |               SoM (Advantech SOM-6820)           |
> > |                                                  |
> > |   +------------------------------------------+   |
> > |   |     SiP (IQ X7181 EVK SiP)               |   |
> > |   |                                          |   |
> > |   |   +----------------------------------+   |   |
> > |   |   |   SoC (X1E80100)                 |   |   |
> > |   |   +----------------------------------+   |   |
> > |   |                                          |   |
> > |   +------------------------------------------+   |
> > |                                                  |
> > +------------------------+-------------------------+
> >                          |
> >                          |  Plugs into
> >                          v
> > +--------------------------------------------------+
> > |         Carrier Board (Advantech SOM-DB5830)     |
> > +--------------------------------------------------+
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
>       commit: 5fb1997399eb2e27086f1cdd160a120314358f1d
> 
> Best regards,

Hello Bjorn,

here you have merged this change in v4: https://lore.kernel.org/all/179065170995.2673486.7594805451558800807.b4-ty@b4/
and you do some change [bjorn: Added "-avantech" portion in filenames]

it is already in repo:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f28aec2091c949a0e2ba76ad6b5eda34301e0a


Thanks,
Yuanjie

> Bjorn Andersson <andersson@kernel.org>
