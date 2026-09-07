Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871E3C3C09
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766899; cv=none; b=ftE7FsLb7Pz4LyKGtO49dFomTpeu0dvqBiU9ue0VWJbbEtCWiIYlHwRM2a2tT6OBO+MHh4L6isiqDTW5Y1THBHC/4Yy/tDWHsbXDVNZXXfCTV4UaoQZ9fwkldWJCwFmYfdJFbNoqGp0TRqgSA90h8pkR38y7PQFol1rmMbb/QYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766899; c=relaxed/simple;
	bh=DnNc5f48h9tlH5aZsY01Qskkv+ulrJsjhy1LITI0FMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lifla5lrBk7J53AEoekTkKiIt8ls00drqKd84iRe20YvNsv62q4YIH9mn06+Rv5fqDhbbKgsydKTVRMuF2dTPwRqFDDKKeQaFhniihhC5UVv8MnpGcCxDAYQAGNu2x14yzAzs4dAKLlVEEY7+sBIuH1IvIN698H36hp3q6GP8/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nk9kG9ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE3JJ+OJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nk9kG9ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE3JJ+OJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Vqx3269624
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=; b=nk9kG9ssBv3EUXtP
	puStuKyg0AEF8pbuQK79HECIOARhAZGcmqE+mbyvPTboXnCTvEsa7tCrmc503TL1
	gcf6C0G+HgHuohw4GOhXGqmyUuUay3vr4R0B9erSGqGIcCipdOpBd2HGomcj8KAk
	34LfIwXacm1xsIdjArE5+gcDoy6XirkHihE15Y4On9QQwonPBMUZJErrmbjzc4YY
	Qyz/Wedv41XghFBd8MU2d+DSp9oEVTE4zmoOyVh7kNaINpI7tJ/UWBRA0bmOvelK
	JGuNiEqXXhMJ2zRYIjJw/VfvctMGCMl/X3SQg1EFsN31CqpEHEWNVEcCD8LWfmNl
	2bIoVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhns6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:41:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so40833185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766896; x=1789371696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=;
        b=LE3JJ+OJzSqS5r3BTFPq2j5g9v5IQFofI0fKy7cS8QW8Mg8zGD+Hyq/NMw1x/fg09O
         CYMNH9omiFcXCpa3iVD55c8WEHkhK7DQZj/OU8zSV52Me1iq0xcsbo+QPF6bpSmYurMr
         C8hhaxwY5TlliBaU2fv1nFcUl8Bz4rAMReur0TFO7kFJFLot/J0KuzZjkG5CjGqx5Gaq
         3jerAkhfF9H6xxxUTQ967O7JkSAEzhtt3cxDzumk8oSZCSf5NEQyCSez+IAX3CL8aDZ1
         Y4Ye+qwJvVwl3kPFDIQhNc1k1FrjYfwj0zbAN0MJ6g6ywpuCjr7F7AyZHdzsD2KIW2d/
         XzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766896; x=1789371696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3dyAuDpWbShrONS2lMP2iU1W3wClkzsBqh+y4YLHBU=;
        b=aMjZaNBr/QjC3PDxMyNQXp5qvo7651OCGND0g5+6lqZkipv4yyAnDRm6DCj0EYsfrM
         B4FdFT5rVHE3S44yA5ciGpFDgyJSp8obv2r5JgCzOQWHjW0v5Uu62/GkEbH1ke5A7LcF
         tudDRwQ8bKKGnxjx3js6zyx9k3RD8BXZizFN6FnsND/NagkBAMFJRIu65Tmh9FbVeTmy
         mi6DYrL6DlTLPw3nVI5oG4kd4vM9YI8ZNpCrY3y/jS2U6WQCnmWgnDDSA3T5TrEVHkVY
         zfLQZVh7y+5wPKjNzj5yrB708n8vEU35V8V1TEfTfmgmE9PqgCmclXwKWpLAIvBiwJNa
         9/pw==
X-Forwarded-Encrypted: i=1; AKwUvBxgaWCi36HOdUtxmZrT4TZBrDVXXQpXrKZFSmg9/g/hempexhlqMRmSYYr+ANTkGnRqR7itKObSW9fNCYoq@vger.kernel.org
X-Gm-Message-State: AFuF++mYCp3M6YPr/+aHulVusR0AXqNJGFVJS2WVsuYBLTHj/nz9/ECy
	a7FYE8WY0zyJhnNSPkfIgmw7+xHp1MZWIDqkLqUqRdRiQr7CNn4dJIA5eBC8NTkfgmQdscEXXve
	1zpjl4PrAjoV2wxcVk+ghMSh68vJA4UvmeRH3tdp+sDkydIdkzSWWozrGLSFI9fiyDfMu
X-Gm-Gg: AYBFou3B6ZobY2dYx2wQXlAp0L9w8NbLLlQF0XALJ+wpWkEdyjM57V/ht4doGEG3DSe
	FaX+sCIp1iSW70YehNNGJAh7nq9On2lul1J2iBkyW+Q7n5yfNsMw5jwNpxa+YUG9qA37RiL5C99
	VIyCqWH5/MplpiOqcnkew3QuNkVd3ZDpLbLBProuM+pcLxEompeVY9NAk/ZFnDYqGo8j+7PKCUb
	gS0E76uBrndiSNm7gCChrX3CslcfMA6uqU0dacVxk5SS6HBRmYY145yO0Ma+TybF2LnGwwXrDXu
	tCxLnHGL0wGbCfF6xAZixpQANeqnHAQpcZ0TEdtWutXrC5TwQ2qCW9JeNhHnoz8q+MG9t6KtLHp
	Pns/+hQMrG3JvUiCA2mqjtg==
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1663963385a.1.1788766895733;
        Mon, 07 Sep 2026 00:41:35 -0700 (PDT)
X-Received: by 2002:a05:620a:d93:b0:939:7e96:d296 with SMTP id af79cd13be357-93980964b18mr1663960885a.1.1788766895295;
        Mon, 07 Sep 2026 00:41:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c261f673000sm348405566b.24.2026.09.07.00.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:41:34 -0700 (PDT)
Message-ID: <897b62b6-c520-41b7-8599-3ed9ada794fd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:41:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
 <20260904120601.18363-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904120601.18363-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c_apzqL7Z3VRXqDL110wDFEkyMGw9OVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfXzPsFK6sRKEiB
 XxDbjoOCZdNj9f24BkVNE3zWGH/zcYKB6kYgkCcc4kmH1pM1i2xqMNSCkExTm0OsPAXR+/Xo6fv
 9YjIppT4atI2oNK0ANy6BRCCemOyDt9useQyEL6G3sGrpwNRU/fhW02wftZTbvtU5dWr5Q5yhNO
 lI+GkBBgghlcKNmkuE97iZOVaqcnwlN6zGdHVPIlqf5PTHsT+wQi8tdmjQKX5jeV1XTBYm+gIXE
 ZYUrqm4NsNG4tDrIruow0Cijp5eAwz9amTq+rOvH6YhbR5D6u3P3yeWmh3XLrkKXePwtn0PZJc8
 t2+EuSbbnNiKLwhC/cvkDboEKvNL8l9t0asYQgAl/sFqAA4kAwc1weRcrGJhNZKDwrDWs4Fe8vW
 54znlvW9RQQl6ahTtTJwS/8HsdAW8llzdV1Bxeb/HPe6E0LXXmqKT4sg5pmhTx6Re7PLsTo39ei
 EUdZ8S6Fw7cq2bXwpvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX+G9LRpHO5tnd
 V1M5dnNa0Dropfsy0kPG3Z3Eo8/EecB6QnBpdQ3lbKcAlJ4sGO4NRAomA0QmWpmEKvRhMSy22IZ
 g5C/7yiXa4KnPwG6CHm/tTMPVdUAJbQ=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e6ab0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=SkUglc1C9CtHUDT49zcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: c_apzqL7Z3VRXqDL110wDFEkyMGw9OVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070082

On 9/4/26 2:05 PM, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5

This is a very expensive model for catching typos!

> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
