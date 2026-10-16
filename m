Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF894A689D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155314; cv=none; b=VNy57iXztU5SixeIDb5l2YexSqvYjrb+N509+iovCK3byOo+ugr+d8db6LID+CTX4UoIOpxDp7Dl9aD7MZawOzPXndQMulCJ/+aS/PgZqGW+dpSlRbRDK2lYWK6xGPIM4MLWg2VAZ8z0hJ9egsyLkjBPOZ15HF+B4IUY3LWtDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155314; c=relaxed/simple;
	bh=hDTZ3oqULIZdr5on0b3OG8uMpsW6DhD9jVUp4w4AKas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFoLjCStGAW3DYMR2+WiybbHGulc0MvrOo9kjdcXA/mmM8cZQ/XDIIcqkMJ1rOvDFGNcSuHe0qQv726Fj39ScaqjRN4NYrzie6uByIEnthTblj6dmOPIVvob9J7R4NH6SF6wqAr0AHeALldcgl5TnhGZjkLCAOz7fuhmlM6NPuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZnARc8F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LinMDET7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZnARc8F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LinMDET7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAASRa3069357
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0DP1299sBs5o7pcdjosdvrMKB0twaCKLfEnrmAKUqIY=; b=MZnARc8Fa6ovO2hW
	PkrcYuinZYNYSi7E5Q1vpiJllK/3+hmDDZ4Y1jjA47aXYbfgnD2Maw0Reirz1S+j
	wrmUw3NoMBLAUPfyd3eEIKpgytuGvdJqjpPMcSPg3g99z1Fd2gRIL4/2tfUgOQD/
	NPlGM4oFspbVh5kW4agGA8kN0J2pkY2sT4yvzsg+6pixQNVcu69sorKml86FK58o
	WrXnu83WTxNx6fi1cBEo4NVR2qSr7VbPpbW9qfGjSi+vojglxnFvmpOH/cfcdU9V
	A9O98an1tS3qp6InAsZH0XhOvLvJJf7gjOXq/EBJ1tk5IKuNW1o4v1lZLHTDn9uy
	k4gaaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262c3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:55:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9151422eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155311; x=1792760111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DP1299sBs5o7pcdjosdvrMKB0twaCKLfEnrmAKUqIY=;
        b=LinMDET796Kp0karGsGVwLGRu4plfpS7kmKJ87XuDMoMbzRH+SIcVgZc/CTOTy1P9M
         ojfkTX6GZtbUEwNcQcDh5f+lyJUkQWJi+VXHnZP2nLo2HjAYF/IOMNm3Xvo7s0qsbDEB
         hKIR6/D3PmYS9BXh8MfjwATQWNoHs3mqvg0Mu0jwJohE6wH3tCmiglMhTF7K/QIB5ap0
         9a6OJfY3WMjhgF3auv5AwhPC51n0a8mHNkYWgVGH7Finfw7xBAeeTy9DpNkcA1xlBRE0
         l5aq9ku70ltO5PXbynlS5wdp7xPoM2TvbxuKQDFNAUNZ4dnGH26nzg20KjQOUzoyKmzW
         idMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155311; x=1792760111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DP1299sBs5o7pcdjosdvrMKB0twaCKLfEnrmAKUqIY=;
        b=1jXo/jCRA6Ari/nDN++BaL6rRhyxvcsHNrqOHObwsp6ntPjK7z2rDNSRJ5bvk8K+EB
         7GYTv9Yw/pZvHukTw1XU5eNcCS8Y4U1S2qJP7GND38QgDnpE/xpPwf88b8hk/uMWUTd7
         zWADuUGTGteUGGGmUoumwO+vK5lhVX9ZP3xJiiT/pw2xXjeY9XaXpH1mWSpl/ROea0VH
         Em+aH99T1nh9adtNxx4xMqrIOPJeDCMc28gd9bJmNnD/XPd4lu/QBzZ7xnNdDrGAUTGt
         z/db6z2xWsvqn9QS2eAEqxzuGFT162v/9AKBMpFpF4/CFVjgLjmzBjbZzSmr9p8GJ5Pf
         ujiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMASVSoaV7DQpwJcAYfzIrl71teZ0IYWEksU2JxfQsZH44HbA3phXX6DZjh7F23VC5b2VopNdcyktZCzqa@vger.kernel.org
X-Gm-Message-State: AFq9FYKOlL86AO2hHuCl4PTvl+2nVuIfZS4nACQgQsBt4AqsyeXdO0M3
	GxNsZD0cMDAn9Tmd5L2TFbV8rwNSReh5yn4eem/VEeO773qilf556xtdzT0CdG2Sr7q961aHY2m
	vyUN08N0xW7q/J/ZsiPjH/jWqywBzkYuA7WljXz0acEzb7sW4JGExjo3PptXVBxXj6aIK
X-Gm-Gg: AYBFou2cyqgCQmv1e+fzpQk+9FMg4kTRtFkwcP5hGmjgkRNcfJhLC3Eokv9WrJoPv1+
	8IQhQQSUYeBwnNcPunrlwdZVX7CLkwg9qfo6SUu5TaNuVb0IqU3/FDtkHdhcXIDotnDd9KvY6Ff
	TF++F630IiajJAywzct06/lCAycGphJ0QhYHk9DDCi188DwaG61ZvnYLgiUivfQtBEWbbWdongY
	Mb/GcfzifdAGAJOyvWO0XL724L33zk9Dxqdj+zpzw5E8CBT02Vxuez4D5jy1J/rYa7em8MSOr6j
	CQuswaUna98NXJfnkBKt+Osalq6vhW9eCjWaxdx5nEP1ZgsdBIUXDna07DDy/ncRKMxEPPyWIJK
	edMyJA3Ji9hEDqEHJkbpXzMLAtADkrVw=
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr15907410eec.18.1792155311335;
        Fri, 16 Oct 2026 05:55:11 -0700 (PDT)
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr15907290eec.18.1792155309466;
        Fri, 16 Oct 2026 05:55:09 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm7285151eec.21.2026.10.16.05.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:55:09 -0700 (PDT)
Message-ID: <ad16a8f8-b0b3-4fa3-8563-5d0ae14c1122@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:25:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad21eb0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WasAi8j2_tIlmVKutyQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX+rqv3BqOFF6q
 CkOS6CvFcbjyeGi28B3KnihQIvyFwIsRtY59wA1WjKCHoiSut2ozY+3R8sWU9P1F6NgxauHApyg
 Pz1wul8a4pQ7T5Cu+wsHViZawVQgC31HIPhfD5Kd02zZEaA75kIQqUZArX6QsJ4kpnbHybivpug
 +0pt3/XnRgnKOycCCZq+6wMJU0so0g0PNO7XnG68FnKnpPUYC8BGFrijKBaPaYBk6Kzw5b2HhMZ
 sG4zvWPgW7ZIzEAnk69ja5qjxeDIR9kCwa3JSKDX4u8f3qWic8nszRucnMA8TZmEJr5B512mA63
 Rt1a706Q7kwW26NvSC6K3KRf8chBTgcF/HpuFR+obXm3ZrsYZvVG3Tpu6f74RvuNdu27Y+xIi04
 Z+kb9cVgR6kUbp/Yjs5n+jD2cJzPqBmh/mmZ+j1gvgORkJbZGShBwtQvZOHuJj8eJujCQjLWcPh
 73dbHVFQ2ZUNE0d3r1g==
X-Proofpoint-ORIG-GUID: WZwO8yjFXG3CfmsbRerb7Y0Lmh97M2y0
X-Proofpoint-GUID: WZwO8yjFXG3CfmsbRerb7Y0Lmh97M2y0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX0aBhnSjX+Zb3
 s6Bu5PmWXyzQCmuu8MvcdPFC/uLxlqY6nbGFsx//ZEVDKyQnuocGm29lzw5qa+rr8gh+i4rnze0
 puicMK4bAAcHDwHXV7LcpbcyKsmVv44=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> QCOMTEE currently treats UBUF parameters as userspace addresses and
> applies userspace restrictions when invoking the root object. This is
> not suitable for object invocation requests issued by kernel clients.
> 
> Use the kernel_ctx flag to distinguish kernel client requests from
> userspace requests. For kernel contexts, do not mark UBUF parameters as
> user addresses, and allow permitted root-object operations to proceed
> without applying the userspace-only checks.
> 
> This allows in-kernel users of tee_client_object_invoke_func() to issue
> object invocation requests through the qcomtee backend.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

