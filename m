Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF510419304
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766936; cv=none; b=ENYXsdWfAQehPVGZAZo1r630L8sPKXdpsUVVBduN1x6ieZkxfvXKBVE9J9c2DADoVNCHu6U1HHhw2wThi3CCi7hsVYaMinzWiTbcNfshVJ+cj1D9/m2IwD4OnBmpQ1k4pwz1B9Tm417bMQsnSN2O1g8aKCb7N7/xpsnAM7rhq0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766936; c=relaxed/simple;
	bh=4Y5xAsf43glCZh088++ZapXrJHidaLKDLANNbMfpkt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+gFzpsBvdpokG9BVZM5fWr6oz4aPAcb7EMOxezdTzsmfw0TJ/P4IrhNy0pE3OWxj67t/jySgW0TX/bva4Z2LWgja4V5BQCIa+wBLCC4lEv2u9CRryuiv+nbtr+iLpuNAL8AdbH7172GnMSNg70SIHmdgulTfoXou+XJ6dGZLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jopQQZsx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYPMEJ8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jopQQZsx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYPMEJ8I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777eWY3903337
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=; b=jopQQZsxm+iSnWzW
	RMVIJKHT4mZ2cZg9oza2yW8NVJ7IQDHeWvBruJL7asOF4HtDxjPnazQdBkgISW1f
	8mZoF178D9/MSJnvJ8cV7euLqZNmnEdyjEIJ3XV26HWLgoHx3wAq1PrWLZU5LBFg
	t8bCzmqSqO4PhlzBqYXcLAPpcCj2ZRB6SBH9jeCSSo1uitBZpFN+XUPwsK8xZgp0
	4baQLhNADbCEVpYdjlA82wnn1LV+eMCHmPhTwnnpdiX3npGIPykwg+6jNAsLGB4h
	0WGVPN+sBcX2PlKPg5j5+GYygnko4sHFCjdAHEjsX75fD0KKPEDAQkAD4PF8rTqD
	GGtAkg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany5qcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:42:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5151041cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766933; x=1789371733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=;
        b=LYPMEJ8IkxZspK+q7SmU3b+bfqg+MrnAv2ejENAFohPHWbP6UYFxXFsB4LnSdZbRLF
         rrK+7kxyIfFrqleQj7rpCqYGCF+dsxhPkGO+WaM/7nhafxP75npmu11WvFcnV1uRVAih
         kvSWx9FCsPwk90liexhSA761G4xX9hCoeBBuqYo2oVmr4fJ87M3U/GufpQPoucNpxj3X
         dnf/RZkTYdGTXeyKl+pXdRIrX4w3x+kUDaP5dh7ycIaklIQaYOI1CmNei22r4n54Zlm8
         O3JKX8q+wa54OjGjG4e6e8hQezUzTqrQxCO5zolBcsmsWScwFl+fdfPYCgqV2jBl1lr2
         pHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766933; x=1789371733;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgvCrmU1Tuvc/GsdKD3kD/Ov677P/v4Ew88GYviJCFo=;
        b=oS3399NsMdGYzVE60/4tNbEV/wAcA+QD6mCSmJhfzPftRLPVM08mCZ83JKSMGeKQ8J
         UJVHiKDoRHFTXh7pUzSApu/1Eu1i1538QN7wVgbeFBAxGYQU6S92u8qJW1IaOZ2aPb2/
         lVeHnggabUgS7kYenG2rbcfVwdIWIHaC/7a9jNaf3IvJLbVhCqr2HWsQDLe6XMePsMu1
         FggZh6wlLNSo+0HXY5HehWGSkhIWC6/P0JJLf/bWvHmUjuQSjAG/lDSw5aQU0NBQ3EWM
         X1MsGz65pUtgJgkmRl7td7a3tjSYbucUXrESq01IYcJ1dwWCk6xCLCSLQVyPi6mk4a+l
         wo5g==
X-Forwarded-Encrypted: i=1; AKwUvBxX+DPDgpCfkYyHjH72LHk0KN8elAVglou9dKU2xP24bi3uTzvpztA++fI+PO/NfuBOftlbdmCcrm24hboJ@vger.kernel.org
X-Gm-Message-State: AFuF++lWvdSnGFgvRDmflvn+T5Hk5aJqcRDXp/CKz+f+EF+lAumVI38T
	lmSBqFCWUJXO+7BFPqrgEjB2S+opx1RFRMpREGCIcscPO/SVoPTD3xCaeaVFxGaSjkltcLHqAvj
	dc4fvhn80z7Km7i9gH9DxXZ4toc96FEfMJEYWh6FZAa+4D/pAmFjiE6ed03ZXFE6t+pUh
X-Gm-Gg: AYBFou0XPRbSQy3gY40hBpIJn1vZBW5Wwqk528SJOeraH9fTVZVc8H9r1P552GEp6jZ
	5+AlRA7KFsZyNQkOSVi17WqKxThVUL58t6+a/8ASMMbWKZNRaXuyM7kP/dbltRGOEOtKyZZhOrs
	pm9POSXSAQFeQCj43ZvOXLV6O86VgpPzncrtZh6BSXpvxwebEACQK6yzsjtycZjNPFxrLw9DlZH
	x2v7ertSabmhnXyfOhwfYbo/ZpH7kKvIUL4AFIHC/QQ1MOFpqOdQWsTzYLpSXtbtN+ccAbwmXKH
	j+zoxje5Y0V0T5DRDed2hq6wTS3erCtUQHo8Ayv2rFwL+AOOP2V9FMbsxXKx7Yo7WU9AJxtP2DL
	qBT5z/tZVwxav2Ob+3sCiZQ==
X-Received: by 2002:a05:620a:4008:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-9399184f186mr1035545785a.4.1788766933081;
        Mon, 07 Sep 2026 00:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4008:b0:937:7dc4:d2b3 with SMTP id af79cd13be357-9399184f186mr1035543685a.4.1788766932651;
        Mon, 07 Sep 2026 00:42:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm266442166b.18.2026.09.07.00.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:42:11 -0700 (PDT)
Message-ID: <66a8275e-451c-4a76-94ec-958f3c0aa6b9@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:42:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: fix typo "commited" in comments
To: Hemanth Selam <hemanth.selam@gmail.com>, Georgi Djakov <djakov@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260904111632.29262-1-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904111632.29262-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9e6ad5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kddr3pe2UqKiqFkHGCYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PAjkPXtvoa8rmRhuqozFmxhqWpfYfmGj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX78dWM8K8XJmz
 XiYgbnnAe1Fs0u3o+EObSfQzZ5OOiRxq/ApLEvn/p5uqodu+gve9etpp4rCSyoEFeAVecKE1jHy
 zcD3/cRwy19vT54iK/J5q03DvG26zpsK40TWQyuUls3k3tf/auL9H95gs+/M+UIXtlRG9BfHXvK
 RRZHtqrcNmJ9AfCr4hBqDgQzYvI0NyH0rtIfSBv+zrZwVjUr44Fcpo019V8+g0BGydHKFL/9VZF
 ujKWTzYI/naMRFWQ9FAwGJEVRDj0m9LsIrAYvXdurH6klHeSry4Dv1Ko8uy6ONU32BuZ9ugj9Yi
 sKx40xoMcWfCuvqI23ixeptfpqa76pqP7SOkfz7hj45cQZtcpBA8psneS95TXdAKULHLhzdxEBi
 a9CXDqTjTUMS2tla89oUJRDdvt7rQnntdXe+XM12C3316JcP7uHNle72SwM52AYl/LEAIordAYJ
 AlyZpKAS2W2zL6QlKzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4MiBTYWx0ZWRfX6kLCM3/1DTTT
 QimEyLzodxVRDIJjAmTMSZjqyJ93Jy8cFsfYYESRcxtITVBPqgCvEz6RRH5owd1hximXKq+NRkf
 UKXBV9xYxOiL3/Ta+p39Ol+4nP+XRbg=
X-Proofpoint-GUID: PAjkPXtvoa8rmRhuqozFmxhqWpfYfmGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070082

On 9/4/26 1:16 PM, Hemanth Selam wrote:
> Correct "commited" to "committed", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
